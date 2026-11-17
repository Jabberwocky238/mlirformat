#!/usr/bin/env python3
"""Builds tests/bytecode/fixtures: an input chunk printed by mlir-opt in generic form with every
location spelled out (`<stem>.in.mlir`) and the bytecode mlir-opt writes for that text
(`<stem>.mlirbc`). With `--all` every chunk of every input; by default one per input, the first
whose text and bytecode together fit in MAX_BYTES.

usage: mlirbc_fixtures.py [--all] <mlir-opt> <out dir> <input .mlir>...
"""
import os, subprocess, sys

SPLIT = "// -----"
# The test dialect only mlir-opt registers, with its own bytecode, and the test library's
# hand-written ops and dialects; left out
TEST_DIALECT = (b'"test.', b"#test.", b"!test.", b"{test.", b", test.", b'"test_irdl_to_cpp.', b'"transform.test_transform_op"')
PRINT = ["--allow-unregistered-dialect", "--mlir-print-op-generic", "--mlir-print-debuginfo", "--mlir-print-local-scope"]


def run(opt, args, text):
    p = subprocess.run([opt, *args, "-"], input=text, capture_output=True, timeout=60)
    return p.stdout if p.returncode == 0 else None


# What one kept case may weigh, text and bytecode together
MAX_BYTES = 16384


def main():
    args = sys.argv[1:]
    every = args[0] == "--all"
    if every:
        args = args[1:]
    opt, out, inputs = args[0], args[1], args[2:]
    os.makedirs(out, exist_ok=True)
    made = 0
    for path in inputs:
        base = os.path.basename(path).removesuffix(".mlir")
        chunks = open(path, encoding="utf-8").read().split(SPLIT)
        for i, chunk in enumerate(chunks):
            text = run(opt, PRINT, chunk.encode())
            if text is None or any(t in text for t in TEST_DIALECT):
                continue
            bc = run(opt, ["--allow-unregistered-dialect", "--emit-bytecode"], text)
            if bc is None:
                continue
            if not every and len(text) + len(bc) > MAX_BYTES:
                continue
            stem = os.path.join(out, f"{base}.{i}")
            open(stem + ".in.mlir", "wb").write(text)
            open(stem + ".mlirbc", "wb").write(bc)
            made += 1
            if not every:
                break
    print(made)


main()
