# Benchmark: mlirformat 0.5.4 vs `mlir-opt` 22.1.8

Text → IR (parse) and IR → text (print), in mlirformat and in `mlir-opt` 22.1.8, on the same files:
time per phase, time of a whole run, and peak memory. Measured 2026-11-05.

## Setup

| | |
| --- | --- |
| mlirformat | 0.5.4, release build |
| `mlir-opt` | LLVM 22.1.8 from apt.llvm.org (`mlir-22-tools 1:22.1.8~++20260714014902+ca7933e47d3a`, = tag `llvmorg-22.1.8`): Release build, no assertions |
| machine | Intel Core Ultra 7 356H (hybrid: CPUs 0–3 P cores at 4.7 GHz, 4–11 E cores at 3.7 GHz, 12–15 LP-E cores at 3.3 GHz), 62 GB, Linux 7.0, rustc 1.98.1 |
| pinning | every timed process is pinned to **one P core** (`taskset -c N`, N ∈ 0..3); jobs run side by side only on different P cores, never on E cores |

Two ways of measuring:

1. **In process, per phase** (`examples/bench.rs`, best of 5). mlirformat parses with
   `MlirOpt::upstream()`, prints custom form with it and generic form with `MlirOpt::new()`, one
   thread. The same program times `mlir-opt` as a process: `--split-input-file
   --allow-unregistered-dialect --mlir-disable-threading -o /dev/null`, i.e. parse + verify + print.
2. **Process against process** (best of 3, `/usr/bin/time -f %M` for peak RSS). mlirformat is a
   20-line program (`MlirOpt::upstream().parse` each `// -----` chunk, then `show(..).to_string()`)
   so it pays everything `mlir-opt` pays: start-up, reading the file, page faults on first touch,
   dropping the IR. `mlir-opt` has the same flags as above.

mlirformat does **not verify** the IR; `mlir-opt` does. `--mlir-very-unsafe-disable-verifier-on-parsing`
is measured too to show how much of `mlir-opt`'s time that is (≈ 0.1–0.3 s here).

```sh
MLIR_OPT=/usr/lib/llvm-22/bin/mlir-opt taskset -c 0 cargo run --release --example bench -- --reps 5 FILE
```

### Inputs

| file | what | size |
| --- | --- | --- |
| big, custom | one random module from mlirpass's fuzz generator (`gen --seed 1 --funcs 2000 --ops 40 --depth 2`: arith, math, scf, memref, func), printed by `mlir-opt` in custom form | 684,421 lines, 31.9 MB |
| big, generic | the same module, printed with `--mlir-print-op-generic` | 703,141 lines, 54.3 MB |
| fixtures, custom | every one of the 2,229 `tests/fixtures/custom` files, cut at `// -----` and joined back with it | 12,250 chunks, 242,362 lines, 9.7 MB |
| fixtures, generic | the same from `tests/fixtures/generic` | 12,252 chunks, 278,201 lines, 16.6 MB |

The custom fixtures leave out 2 chunks that `mlir-opt` 22.1.8 itself refuses when it reads them
back (each chunk was checked alone through `mlir-opt`); every generic chunk is kept.

## Results

### One big module, per phase (ms, best of 5)

| | mlirformat | `mlir-opt` |
| --- | ---: | ---: |
| **parse, custom form** (31.9 MB) | **936** (34 MB/s) | |
| **parse, generic form** (54.3 MB) | **417** (130 MB/s) | |
| print custom form (from the custom / the generic input) | 1,083 / 1,110 | |
| print generic form (from the custom / the generic input) | 254 / 216 | |
| start-up (empty file) | — | 16.9 |

Whole job, mlirformat parse + print against `mlir-opt`'s whole run:

| job | mlirformat | `mlir-opt` | `mlir-opt`, no parse verifier | **speed-up** |
| --- | ---: | ---: | ---: | ---: |
| custom in ⇒ custom out | 2,019 | 2,401 | 2,285 | **1.19×** |
| custom in ⇒ generic out | 1,190 | 2,005 | | **1.68×** |
| generic in ⇒ custom out | 1,527 | 2,924 | 2,764 | **1.92×** |
| generic in ⇒ generic out | 633 | 2,572 | | **4.06×** |

### One big module, process against process (best of 3)

| job | mlirformat ms | `mlir-opt` ms | **speed-up** | mlirformat peak RSS | `mlir-opt` peak RSS | **memory** |
| --- | ---: | ---: | ---: | ---: | ---: | ---: |
| custom in ⇒ custom out | 2,381 | 2,406 | **1.01×** | 1,260 MB | 354 MB | 3.6× more |
| custom in ⇒ generic out | 1,577 | 1,976 | **1.25×** | 1,295 MB | 340 MB | 3.8× more |
| generic in ⇒ custom out | 1,832 | 2,960 | **1.62×** | 1,123 MB | 432 MB | 2.6× more |
| generic in ⇒ generic out | 996 | 2,531 | **2.54×** | 1,158 MB | 423 MB | 2.7× more |
| empty file (start-up) | 15.6 | 18.2 | 1.17× | 9.5 MB | 95.8 MB | 10× less |

### Many small modules: the fixtures

In process (ms, best of 5):

| | mlirformat parse | print custom | print generic | parse + print custom | `mlir-opt` whole run | `mlir-opt`, no parse verifier |
| --- | ---: | ---: | ---: | ---: | ---: | ---: |
| fixtures, custom (12,250 chunks) | 333 | 347 | 65 | 680 | 51,273 | 52,031 |
| fixtures, generic (12,252 chunks) | 97 | 367 | 71 | 464 | 80,241 | 75,228 |

Process against process (best of 3, custom out):

| | mlirformat ms | `mlir-opt` ms | **speed-up** | mlirformat peak RSS | `mlir-opt` peak RSS |
| --- | ---: | ---: | ---: | ---: | ---: |
| fixtures, custom | 713 | 55,517 | **77.8×** | 24.6 MB | 156.8 MB |
| fixtures, generic | 467 | 81,387 | **174×** | 29.5 MB | 165.6 MB |

## Reading it

- **Speed: faster than `mlir-opt` on every job**, from 1.01× (custom ⇒ custom, whole process) to
  4.06× (generic ⇒ generic, per phase). The generic form is the fast path: it parses at 130 MB/s,
  3.8× faster per byte than the custom form (34 MB/s), and prints 4–5× faster than custom.
- **Printing custom form is the slowest phase** (≈ 1.1 s for either input, more than parsing the
  custom form). It is what keeps custom ⇒ custom near `mlir-opt`.
- **Memory is where mlirformat loses**: on the big module its peak RSS is 2.6–3.8× `mlir-opt`'s
  (1.1–1.3 GB against 0.34–0.43 GB), about 36–40 bytes of peak RSS per byte of custom input.
  On small inputs it is the other way round: the bare process is 9.5 MB against `mlir-opt`'s
  96 MB, and the fixtures peak at 25–30 MB against 157–166 MB.
- **In process against whole process**: the custom ⇒ custom job costs 2,019 ms in process and
  2,381 ms as a fresh process. The difference is first-touch page faults on the ~1.2 GB heap and
  dropping the IR at the end; `mlir-opt` pays the same for its smaller heap.
- **Many small modules**: `mlir-opt` builds a fresh `MLIRContext` for each `// -----` chunk
  (`processBuffer` in `MlirOptMain.cpp`), 4.2–6.6 ms per chunk all told. mlirformat keeps one
  `MlirOpt` for all of them (0.06 ms per chunk), which is why this row is 78–174×. It measures
  per-module overhead much more than parser speed.
- Verification is not where the gap lies: turning off `mlir-opt`'s parse-time verifier saves
  116 ms (custom) and 160 ms (generic) of 2.4–2.9 s on the big module, nothing on the custom
  fixtures and 6 % on the generic ones.

## History (one big module, per phase, ms)

| | 0.4.8 | 0.5.2 | now |
| --- | ---: | ---: | ---: |
| parse custom (31.9 MB) | 3,830 | 3,453 | **936** |
| parse generic (54.3 MB) | 411 | 434 | **417** |
| print custom | 2,072 – 2,231 | 1,285 – 1,452 | **1,083 – 1,110** |
| print generic | 179 – 254 | 216 – 314 | **216 – 254** |
| custom in ⇒ custom out | 6,060 | 4,905 | **2,019** |
| generic in ⇒ custom out | 2,483 | 1,718 | **1,527** |

The custom-form parse went from 3.8 s to 0.94 s with the fast path after 0.5.2: ODS-format ops
read straight into an `Operation`, regions lent instead of copied, formats tokenized once per
`MlirOpt`.

For passes on top of mlirformat, see mlirpass's `BENCHMARK.md`.
