#!/usr/bin/env python3
"""Adds to tests/fixtures/ every llvm-project `mlir/test` file that a vanilla mlir-opt 22.1.8 reads.

    python3 scripts/fixtures.py --llvm $LLVM --mlir-opt /usr/lib/llvm-22/bin/mlir-opt

For each `mlir/test/<path>.mlir` it writes, named by the path with `/` turned into `__` (and a
leading `Dialect/` dropped: `Dialect/Affine/ops.mlir` ⇒ `Affine__ops.mlir`):

    upstream/<name>.mlir   the test file as llvm-project has it
    custom/<name>.mlir     `mlir-opt --allow-unregistered-dialect --split-input-file` (no pass run)
    generic/<name>.mlir    the same with `--mlir-print-op-generic`

`-verify-diagnostics` is added when a RUN line has it (the chunks that fail on purpose are left
out of the output). A file is skipped when mlir-opt fails on it, or does not read back what it
printed. Files already there are kept (some had a chunk mlir-opt cannot read back taken out by
hand); `--force` rewrites them.
"""

import argparse
import subprocess
from concurrent.futures import ThreadPoolExecutor
from pathlib import Path

FLAGS = ["--allow-unregistered-dialect", "--split-input-file"]


def name_of(rel: Path) -> str:
    parts = rel.with_suffix("").parts
    return "__".join(parts[1:] if parts[0] == "Dialect" else parts)


def main():
    ap = argparse.ArgumentParser(description=__doc__.split("\n")[0])
    ap.add_argument("--llvm", required=True, help="llvm-project checkout at llvmorg-22.1.8")
    ap.add_argument("--mlir-opt", required=True, help="a vanilla mlir-opt 22.1.8")
    ap.add_argument("--force", action="store_true", help="rewrite the fixtures already there")
    opts = ap.parse_args()
    root = Path(opts.llvm) / "mlir" / "test"
    out = Path(__file__).resolve().parent.parent / "tests" / "fixtures"

    def run(args, stdin=None):
        return subprocess.run([opts.mlir_opt, *FLAGS, *args], input=stdin, capture_output=True, text=True, timeout=120)

    def one(path: Path) -> str:
        name = name_of(path.relative_to(root))
        if not opts.force and (out / "custom" / f"{name}.mlir").exists():
            return "kept"
        text = path.read_text(errors="replace")
        verify = ["-verify-diagnostics"] if any("RUN:" in l and "verify-diagnostics" in l for l in text.splitlines()) else []
        try:
            custom, generic = run([*verify, str(path)]), run([*verify, "--mlir-print-op-generic", str(path)])
            if custom.returncode or generic.returncode or not custom.stdout.strip():
                return "skipped: mlir-opt fails"
            if run([], custom.stdout).returncode or run([], generic.stdout).returncode:
                return "skipped: does not read back"
        except subprocess.TimeoutExpired:
            return "skipped: timeout"
        (out / "upstream" / f"{name}.mlir").write_text(text)
        (out / "custom" / f"{name}.mlir").write_text(custom.stdout)
        (out / "generic" / f"{name}.mlir").write_text(generic.stdout)
        return "added"

    paths = sorted(root.rglob("*.mlir"))
    with ThreadPoolExecutor() as pool:
        results = list(pool.map(one, paths))
    tally = {}
    for r in results:
        tally[r] = tally.get(r, 0) + 1
    for r, n in sorted(tally.items()):
        print(f"{n:5} {r}")


if __name__ == "__main__":
    main()
