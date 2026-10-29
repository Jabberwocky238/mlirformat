# Benchmark: mlirformat 0.4.8 vs `mlir-opt` 22.1.8

Text → IR (parse) and IR → text (print), in mlirformat and in `mlir-opt` 22.1.8, on the same files.

## Setup

| | |
| --- | --- |
| mlirformat | 0.4.8, `examples/bench.rs`, release build |
| `mlir-opt` | LLVM 22.1.8 from apt.llvm.org (`mlir-22-tools 1:22.1.8~++20260714014902+ca7933e47d3a`, = tag `llvmorg-22.1.8`): Release build, no assertions |
| machine | Intel Core Ultra 7 356H, 16 cores, 62 GB, Linux 7.0, rustc 1.98.1 |

```sh
MLIR_OPT=/usr/lib/llvm-22/bin/mlir-opt cargo run --release --example bench -- --reps 3 FILE...
```

mlirformat runs in process on one thread. It parses with `MlirOpt::upstream()`, prints custom form
with it, and prints generic form with `MlirOpt::new()`. It does **not verify** the IR.

`mlir-opt` runs as a process with `--split-input-file --allow-unregistered-dialect
--mlir-disable-threading -o /dev/null`. It parses, verifies and prints. Startup takes about 20 ms.

Each time is the best of 3.

### Inputs

| file | what | size |
| --- | --- | --- |
| big, custom | one random module from mlirpass's fuzz generator (`gen --seed 1 --funcs 2000 --ops 40 --depth 2`: arith, math, scf, memref, func), printed by `mlir-opt` in custom form | 684,421 lines, 31.9 MB |
| big, generic | the same module, printed with `--mlir-print-op-generic` | 703,141 lines, 54.3 MB |
| fixtures, custom | every `tests/fixtures/custom` file (`mlir-opt` 22.1.8's output for llvm-project's `mlir/test/Conversion` and dialect tests), joined with `// -----` | 5,614 chunks, 91,843 lines, 3.9 MB |
| fixtures, generic | the same from `tests/fixtures/generic` | 5,617 chunks, 110,166 lines, 6.8 MB |

The fixture files drop the 4 custom chunks and the 1 generic chunk that `mlir-opt` 22.1.8 itself
rejects when it reads them back. Example: `#dlti.dl_spec` given twice as module attributes is printed
by `mlir-opt`, which then refuses it with `expects at most one data layout attribute`.

## Results (ms)

### One big module

`mlir-opt`'s split comes from `--mlir-timing`. Its parser time includes the verifier.

| | mlirformat | `mlir-opt` |
| --- | ---: | ---: |
| **parse, custom form** (31.9 MB) | **3,830** | **1,172** |
| **parse, generic form** (54.3 MB) | **411** | **1,675** |
| print custom form | 2,072 – 2,231 | 798 – 800 |
| print generic form | 179 – 254 | 423 – 433 |
| whole run, custom in ⇒ custom out | 6,060 | 2,153 |
| whole run, generic in ⇒ custom out | 2,483 | 2,704 |

In the print rows, the range covers the two inputs.

### Many small modules (the fixtures)

| | mlirformat parse | mlirformat parse + print custom | `mlir-opt` (whole run) |
| --- | ---: | ---: | ---: |
| fixtures, custom | 360 | 566 | 12,161 |
| fixtures, generic | 37 | 248 | 16,369 |

## Reading it

- **Generic form is mlirformat's fast path.** It parses 4.1× faster than `mlir-opt` (54 MB in 0.41 s,
  about 130 MB/s) and prints 1.7–2.4× faster.
- **Custom form is slower.**
  - Parsing takes 3.3× as long as `mlir-opt`, and 9× as long as mlirformat's own generic parse of
    the same module.
  - Printing takes 2.6–2.8× as long as `mlir-opt`.

  The generic path being fast on the same IR shows that the cost is in the custom-form code
  (declarative formats and hand-written parsers). It has not been profiled further yet.
- **Many small modules**: `mlir-opt` builds a fresh `MLIRContext` for every `// -----` chunk
  (`processBuffer` in `MlirOptMain.cpp`). Counting everything, that comes to 2.2–2.9 ms per
  chunk. mlirformat keeps one `MlirOpt` for all chunks. This row mostly measures per-module
  overhead, not parser speed.
- mlirformat skips verification, so its parse numbers are less work than `mlir-opt`'s. Running
  `mlir-opt` with `--mlir-very-unsafe-disable-verifier-on-parsing` saves only about 0.2 s on the big
  module (2,153 ⇒ 1,947 ms custom, 2,704 ⇒ 2,545 ms generic), so verification is not where the gap
  lies.
- For passes on top of mlirformat, see mlirpass's `BENCHMARK.md`.
