#!/usr/bin/env python3
"""Adds to tests/fixtures/ every llvm-project `mlir/test` file that a vanilla mlir-opt 23.1.5 reads.

    python3 scripts/fixtures.py --llvm $LLVM --mlir-opt /usr/lib/llvm-22/bin/mlir-opt

For each `mlir/test/<path>.mlir` it writes, named by the path with `/` turned into `__` (and a
leading `Dialect/` dropped: `Dialect/Affine/ops.mlir` ⇒ `Affine__ops.mlir`):

    upstream/<name>.mlir   the test file as llvm-project has it
    custom/<name>.mlir     `mlir-opt --allow-unregistered-dialect --split-input-file` (no pass run)
    generic/<name>.mlir    the same with `--mlir-print-op-generic`

`-verify-diagnostics` is added when a RUN line has it (the chunks that fail on purpose are left
out of the output). When mlir-opt fails on a file, or does not read back what it printed, its chunks are taken one
by one and only those it reads and reads back are kept; a file none of whose chunks do is
skipped; such a file gets no `upstream/` copy (its rejected chunks are not compared). Files
already there are kept; `--force` rewrites them.

Then, for every `upstream/` file, which of its `// -----` chunks mlir-opt rejects when it only
reads it (no pass), written to `rejected/<name>.txt`, one line per rejected chunk:

    <chunk index>\t<parse|verify>\t<mlir-opt's first error>

`parse`: still rejected with `--mlir-very-unsafe-disable-verifier-on-parsing` (the text does not
read); `verify`: it reads, and the verifier rejects the op. A chunk's `expected-error` alone says
neither: many are diagnostics of the pass its RUN line runs.
"""

import argparse
import re
import subprocess
from concurrent.futures import ThreadPoolExecutor
from pathlib import Path

FLAGS = ["--allow-unregistered-dialect", "--split-input-file"]


def name_of(rel: Path) -> str:
    parts = rel.with_suffix("").parts
    return "__".join(parts[1:] if parts[0] == "Dialect" else parts)


def main():
    ap = argparse.ArgumentParser(description=__doc__.split("\n")[0])
    ap.add_argument("--llvm", required=True, help="llvm-project checkout at llvmorg-23.1.5")
    ap.add_argument("--mlir-opt", required=True, help="a vanilla mlir-opt 23.1.5")
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
            whole = not (custom.returncode or generic.returncode or not custom.stdout.strip())
            whole = whole and not (run([], custom.stdout).returncode or run([], generic.stdout).returncode)
            if whole:
                kept = (custom.stdout, generic.stdout)
            else:
                # Chunk by chunk: keep the ones mlir-opt reads and reads back.
                cs, gs = [], []
                for chunk in text.split("// -----"):
                    chunk = chunk.lstrip("-")
                    c, g = run([*verify, "-"], chunk), run([*verify, "--mlir-print-op-generic", "-"], chunk)
                    if c.returncode or g.returncode or not c.stdout.strip():
                        continue
                    if run([], c.stdout).returncode or run([], g.stdout).returncode:
                        continue
                    cs.append(c.stdout)
                    gs.append(g.stdout)
                if not cs:
                    return "skipped: mlir-opt fails"
                kept = ("// -----\n".join(cs), "// -----\n".join(gs))
        except subprocess.TimeoutExpired:
            return "skipped: timeout"
        # `upstream/` (what the rejection tests read) only for a file mlir-opt reads whole.
        if whole:
            (out / "upstream" / f"{name}.mlir").write_text(text)
        (out / "custom" / f"{name}.mlir").write_text(kept[0])
        (out / "generic" / f"{name}.mlir").write_text(kept[1])
        return "added" if whole else "added: some chunks"

    def verdicts(path: Path) -> int:
        """`rejected/<name>.txt` for one `upstream/` file; how many chunks it lists."""
        lines = []
        # Split as the tests split: on `// -----` anywhere.
        for i, chunk in enumerate(path.read_text(errors="replace").split("// -----")):
            chunk = chunk.lstrip("-")
            plain = subprocess.run([opts.mlir_opt, "--allow-unregistered-dialect", "-o", "/dev/null", "-"], input=chunk, capture_output=True, text=True, timeout=120)
            if plain.returncode == 0:
                continue
            raw = subprocess.run([opts.mlir_opt, "--allow-unregistered-dialect", "--mlir-very-unsafe-disable-verifier-on-parsing", "-o", "/dev/null", "-"], input=chunk, capture_output=True, text=True, timeout=120)
            kind = "parse" if raw.returncode else "verify"
            first = re.search(r"error: (.*)", plain.stderr)
            lines.append(f"{i}\t{kind}\t{first.group(1) if first else plain.stderr.strip()[:200]}")
        target = out / "rejected" / f"{path.stem}.txt"
        if lines:
            target.write_text("\n".join(lines) + "\n")
        elif target.exists():
            target.unlink()
        return len(lines)

    paths = sorted(root.rglob("*.mlir"))
    with ThreadPoolExecutor() as pool:
        results = list(pool.map(one, paths))
    tally = {}
    for r in results:
        tally[r] = tally.get(r, 0) + 1
    for r, n in sorted(tally.items()):
        print(f"{n:5} {r}")
    (out / "rejected").mkdir(exist_ok=True)
    with ThreadPoolExecutor() as pool:
        rejected = sum(pool.map(verdicts, sorted((out / "upstream").glob("*.mlir"))))
    print(f"{rejected:5} upstream chunks mlir-opt rejects (rejected/)")


if __name__ == "__main__":
    main()
