"""
运行.py —— 一键编译运行六爻程序
用法: python3 工具/运行.py <源.ly> [输出名]
"""
import os
import sys
import subprocess
import struct
import tempfile

HERE = os.path.dirname(os.path.abspath(__file__))
ROOT = os.path.dirname(HERE)
HOST = os.path.join(ROOT, '宿主', '宿主64.s')
LVC = sys.argv[1] if len(sys.argv) > 1 else os.path.join(ROOT, 'lyc.c')
OUT = sys.argv[2] if len(sys.argv) > 2 else '/tmp/lyc_run'

def main():
    if len(sys.argv) < 2:
        print("用法: python3 工具/运行.py <源.ly> [输出名]")
        sys.exit(1)

    src = sys.argv[1]
    out = sys.argv[2] if len(sys.argv) > 2 else '/tmp/lyc_run'

    bootstrap = os.path.join(ROOT, '..', 'lyc_git', 'lyc_v10')
    if not os.path.exists(bootstrap):
        bootstrap = '/tmp/lyc_fix'

    s_file = tempfile.mktemp(suffix='.s')
    subprocess.run([bootstrap, src, '-o', s_file], check=True, capture_output=True)

    with open(s_file, 'r') as f:
        lines = f.readlines()

    new_lines = []
    skip = False
    for line in lines:
        if '.multiboot' in line:
            skip = True
            continue
        if skip and '.section .text' in line:
            skip = False
            continue
        if '_start' in line:
            continue
        if skip and '.globl fn_' in line:
            skip = False
        if not skip:
            new_lines.append(line)

    final = ['\t.intel_syntax noprefix\n', '\t.section .text\n'] + new_lines

    s_no_start = tempfile.mktemp(suffix='.s')
    with open(s_no_start, 'w') as f:
        f.writelines(final)

    o_file = tempfile.mktemp(suffix='.o')
    subprocess.run(['as', '--64', '-o', o_file, s_no_start], check=True)

    host_o = tempfile.mktemp(suffix='.o')
    subprocess.run(['as', '--64', '-o', host_o, HOST], check=True)

    subprocess.run(['ld', '-o', out, o_file, host_o], check=True)
    os.chmod(out, 0o755)

    nm = subprocess.run(['nm', out], capture_output=True, text=True)
    fn_zhu = None
    host_entry = None
    for line in nm.stdout.split('\n'):
        parts = line.split()
        if len(parts) >= 3:
            if parts[2] == 'fn_zhu':
                fn_zhu = int(parts[0], 16)
            if parts[2] == '_宿_入口':
                host_entry = int(parts[0], 16)

    if not fn_zhu or not host_entry:
        print("错误: 找不到 fn_zhu 或 _宿_入口")
        sys.exit(1)

    readelf = subprocess.run(['readelf', '-S', out], capture_output=True, text=True)
    data_offset = None
    data_vaddr = None
    for line in readelf.stdout.split('\n'):
        if '.data' in line:
            parts = line.split()
            for i, p in enumerate(parts):
                if p.startswith('00000000') and len(p) == 16:
                    data_vaddr = int(p, 16)
                    if i + 1 < len(parts):
                        data_offset = int(parts[i+1], 16)
                    break
            break

    if not data_offset:
        print("错误: 找不到 .data 段偏移")
        sys.exit(1)

    file_offset = data_offset + (host_entry - data_vaddr)

    with open(out, 'r+b') as f:
        f.seek(file_offset)
        f.write(struct.pack('<Q', fn_zhu))

    print(f"✓ 编译成功: {out}")
    print(f"  fn_zhu = {hex(fn_zhu)}, _宿_入口 = {hex(host_entry)}")
    print(f"  运行: {out}")

if __name__ == '__main__':
    main()
