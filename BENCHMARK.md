# Benchmark: mlirformat 0.5.5 vs `mlir-opt` 22.1.8

Text → IR (parse) and IR → text (print), in mlirformat and in `mlir-opt` 22.1.8, on the same files.
Each phase timed on its own, each whole run timed as a process, and the peak memory of each run.
Measured 2026-11-05.

## Setup

| | |
| --- | --- |
| mlirformat | 0.5.5 (`b7dc982`), release build |
| `mlir-opt` | LLVM 22.1.8 from apt.llvm.org (`mlir-22-tools 1:22.1.8~++20260714014902+ca7933e47d3a`, = tag `llvmorg-22.1.8`): Release build, no assertions |
| machine | Intel Core Ultra 7 356H, 62 GB, Linux 7.0, glibc malloc, rustc 1.98.1. Hybrid CPU: CPUs 0–3 are P cores (4.7 GHz), 4–11 E cores (3.7 GHz), 12–15 LP E cores (3.3 GHz) |
| pinning | every timed process is pinned to one P core (`taskset -c N`, N ∈ 0..3). Up to four jobs run at once, each on its own P core; nothing timed runs on an E core |

There are two ways of measuring:

1. **In process, per phase** (`examples/bench.rs`, best of 5). mlirformat parses with
   `MlirOpt::upstream()`, prints the custom form with it and the generic form with `MlirOpt::new()`,
   all on one thread. The same program also times `mlir-opt` as a process: `--split-input-file
   --allow-unregistered-dialect --mlir-disable-threading -o /dev/null`, which parses, verifies
   and prints.
2. **Process against process** (best of 3, peak RSS from `/usr/bin/time -f %M`). mlirformat runs
   as a small program: `MlirOpt::upstream().parse` on each `// -----` chunk, then
   `show(..).to_string()`. So it pays everything `mlir-opt` pays: start-up, reading the file, page
   faults on first touch, and dropping the IR. `mlir-opt` gets the same flags as above.

`mlir-opt`'s own split of its time comes from `--mlir-timing` on the same files, one P core.

mlirformat does **not verify** the IR; `mlir-opt` does. Turning that off with
`--mlir-very-unsafe-disable-verifier-on-parsing` saves `mlir-opt` 0.08–0.23 s on the big module
(2.3 s of 77 s on the generic fixtures, nothing on the custom ones), so the verifier is not where
the differences come from.

```sh
MLIR_OPT=/usr/lib/llvm-22/bin/mlir-opt taskset -c 0 cargo run --release --example bench -- --reps 5 FILE
```

### Inputs

| file | what | size |
| --- | --- | --- |
| big, custom | one random module from mlirpass's fuzz generator (`gen --seed 1 --funcs 2000 --ops 40 --depth 2`: arith, math, scf, memref, func), printed by `mlir-opt` in custom form | 684,421 lines, 31.9 MB, 665,214 ops |
| big, generic | the same module, printed with `--mlir-print-op-generic` | 703,141 lines, 54.3 MB |
| fixtures, custom | every one of the 2,229 `tests/fixtures/custom` files, cut at `// -----` and joined back with it | 12,250 chunks, 242,362 lines, 9.7 MB |
| fixtures, generic | the same from `tests/fixtures/generic` | 12,252 chunks, 278,201 lines, 16.6 MB |

The custom fixtures leave out 2 chunks that `mlir-opt` 22.1.8 itself refuses when it reads them
back. Each chunk was checked alone through `mlir-opt`. Every generic chunk is kept.

## Results

All times are in ms.

### One big module, per phase (best of 5)

| phase | mlirformat (glibc) | mlirformat (jemalloc) | `mlir-opt` (`--mlir-timing`) |
| --- | ---: | ---: | ---: |
| **parse, custom form** (31.9 MB) | 1,336 (24 MB/s) | **994** (32 MB/s) | 1,142 (includes its verifier) |
| **parse, generic form** (54.3 MB) | **482** (113 MB/s) | 509 | 1,629 (includes its verifier) |
| print custom form, of the module read from custom text | 1,833 | **743** | 767 |
| print custom form, of the module read from generic text | 1,028 | **744** | 770 |
| print generic form (module read from custom / from generic) | **235 / 199** | 185 / 171 | 404 / 407 |

The jemalloc column is the same binary run with `LD_PRELOAD=libjemalloc.so.2`. Why there are two
columns is explained under "Reading it" below.

Each whole job below is mlirformat's parse time plus its print time (glibc), set against the
whole `mlir-opt` run:

| job | mlirformat | `mlir-opt` | `mlir-opt`, no parse verifier | **speed-up** |
| --- | ---: | ---: | ---: | ---: |
| custom in ⇒ custom out | 3,168 | 2,370 | 2,173 | **0.75×** |
| custom in ⇒ generic out | 1,571 | 1,983 | | **1.26×** |
| generic in ⇒ custom out | 1,510 | 2,952 | 2,763 | **1.95×** |
| generic in ⇒ generic out | 681 | 2,558 | | **3.76×** |

### One big module, process against process (best of 3)

| job | mlirformat | `mlir-opt` | **speed-up** | mlirformat peak RSS | `mlir-opt` peak RSS | **memory** |
| --- | ---: | ---: | ---: | ---: | ---: | ---: |
| custom in ⇒ custom out | 3,132 | 2,314 | **0.74×** | 740 MB | 355 MB | 2.09× |
| custom in ⇒ generic out | 1,817 | 1,934 | **1.06×** | 778 MB | 341 MB | 2.28× |
| generic in ⇒ custom out | 1,715 | 2,856 | **1.67×** | 665 MB | 433 MB | 1.54× |
| generic in ⇒ generic out | 909 | 2,459 | **2.71×** | 700 MB | 423 MB | 1.65× |
| custom in ⇒ custom out, jemalloc | 1,802 | 2,314 | **1.28×** | 662 MB | 355 MB | 1.87× |
| generic in ⇒ custom out, jemalloc | 1,331 | 2,856 | **2.15×** | 683 MB | 433 MB | 1.58× |
| empty file (start-up) | 16.0 | 17.0 | 1.06× | 9.1 MB | 96.2 MB | 0.09× |

### Many small modules: the fixtures

In process (best of 5):

| | parse | print custom | print generic | parse + print custom | `mlir-opt` whole run | `mlir-opt`, no parse verifier |
| --- | ---: | ---: | ---: | ---: | ---: | ---: |
| fixtures, custom (12,250 chunks) | 348 | 325 | 53 | 673 | 50,897 | 50,897 |
| fixtures, generic (12,252 chunks) | 118 | 371 | 63 | 490 | 77,295 | 75,020 |

Process against process (best of 3, custom out):

| | mlirformat | `mlir-opt` | **speed-up** | mlirformat peak RSS | `mlir-opt` peak RSS |
| --- | ---: | ---: | ---: | ---: | ---: |
| fixtures, custom | 706 | 50,679 | **71.8×** | 24.1 MB | 157.8 MB |
| fixtures, generic | 471 | 76,087 | **162×** | 28.1 MB | 165.9 MB |

## Reading it

- **Memory came first in 0.5.5.** Each list the parser reads is now allocated at its exact length.
  Before, a `Vec` grown by pushing started at 4 elements and doubled, so a one-attribute dictionary
  held 4 × 184 B. Attributes read through an op's ODS format now borrow the source text instead of
  being copied to `'static`. On the big module, the IR (counted by a global allocator) went from
  1,198 to 525 MB for the custom input and from 1,047 to 521 MB for the generic input. The peak
  RSS of a whole run fell 40–41 % (table under History).
- **The cost is glibc malloc.** The live allocations now come in many exact sizes, freed in
  between the parser's temporary ones, and glibc's heap fragments. In `perf`, `unlink_chunk`
  plus `_int_malloc` take 34 % of a custom-form run. The same binary with jemalloc is faster
  than 0.5.4 on every phase. With glibc, the custom form's parse and print are slower than in
  0.5.4, and custom ⇒ custom went from on par with `mlir-opt` to 0.74×. Under jemalloc it is
  1.28× faster. A program that links mlirformat chooses its own global allocator.
- **The generic form is the fast path.** It parses at 113 MB/s against `mlir-opt`'s 33 MB/s,
  prints 1.7–2.0× faster, and generic ⇒ generic is 2.7× faster than `mlir-opt` as a whole
  process.
- **Memory against `mlir-opt`**: on the big module, mlirformat's peak is 1.5–2.3× `mlir-opt`'s
  (665–778 MB against 341–433 MB). Most of what is left is the size of the IR types themselves:
  `Operation` is 400 B (its `properties: Option<Attribute>` holds an `Attribute` of 160 B
  inline), `Type` is 80 B, `NamedAttr` 184 B. Shrinking them changes the public API and was left
  for later. On small inputs mlirformat uses less: 9 MB for a bare process against 96 MB, and
  24–28 MB against 158–166 MB on the fixtures.
- **Many small modules**: `mlir-opt` builds a fresh `MLIRContext` for each `// -----` chunk
  (`processBuffer` in `MlirOptMain.cpp`), 4.1–6.2 ms per chunk all told. mlirformat keeps one
  `MlirOpt` for all of them (0.04–0.06 ms per chunk). That is why this row is 72–162×. It
  measures per-module overhead much more than parser speed.

## History (one big module)

In process, per phase (ms):

| | 0.4.8 | 0.5.2 | 0.5.4 | 0.5.5 (glibc) | 0.5.5 (jemalloc) |
| --- | ---: | ---: | ---: | ---: | ---: |
| parse custom (31.9 MB) | 3,830 | 3,453 | 936 | 1,336 | 994 |
| parse generic (54.3 MB) | 411 | 434 | 417 | 482 | 509 |
| print custom | 2,072 – 2,231 | 1,285 – 1,452 | 1,083 – 1,110 | 1,028 – 1,833 | 743 – 744 |
| print generic | 179 – 254 | 216 – 314 | 216 – 254 | 199 – 235 | 171 – 185 |

Process against process, 0.5.4 ⇒ 0.5.5 (glibc):

| job | time | peak RSS |
| --- | ---: | ---: |
| custom in ⇒ custom out | 2,381 ⇒ 3,132 ms | 1,260 ⇒ **740 MB** |
| generic in ⇒ custom out | 1,832 ⇒ 1,715 ms | 1,123 ⇒ **665 MB** |

## Reproducing

```sh
# the big module (mlirpass's fuzz crate), both forms
cd ../mlirpass/fuzz && cargo run --release -- gen --seed 1 --funcs 2000 --ops 40 --depth 2 > raw.mlir
mlir-opt raw.mlir -o big_custom.mlir
mlir-opt --mlir-print-op-generic raw.mlir -o big_generic.mlir
# per phase
MLIR_OPT=$(which mlir-opt) taskset -c 0 cargo run --release --example bench -- --reps 5 big_custom.mlir
LD_PRELOAD=/lib/x86_64-linux-gnu/libjemalloc.so.2 taskset -c 0 target/release/examples/bench --reps 5 big_custom.mlir
# mlir-opt's own split
taskset -c 0 mlir-opt big_custom.mlir --mlir-disable-threading --mlir-timing -o /dev/null
```

For passes on top of mlirformat, see mlirpass's `BENCHMARK.md`.
