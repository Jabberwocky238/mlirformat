# Benchmark: mlirformat 0.6.2 vs `mlir-opt` 22.1.8

## 0.6.2: jemalloc, every CPU

Since 0.6.2 the `std` feature makes jemalloc the global allocator, so a program linking
mlirformat no longer runs on glibc malloc. Measured 2026-11-06 on the machine below, again **not
idle** (load average 16–19 throughout): mlirformat 0.6.2 (`1bfd34d`), both tools with threads on,
all 16 CPUs, no pinning. Inputs: seed 1's module, as in the tables further down.

Parsing in process (`examples/bench.rs`, best of 5; `parse_in` on a `ThreadMulti` of 16
threads), against the whole threaded `mlir-opt` run (parse, verify, print; best of 3):

| file | `parse_in`, 16 threads | `mlir-opt` whole run, threads on |
| --- | ---: | ---: |
| big, custom (31.9 MB) | **214** | 2,100 (custom out) |
| big, generic (54.3 MB) | **182** | 3,000 (generic out) |

Text in ⇒ text out as processes (`mlirpass` with no pipeline: mlirformat's `parse_in` and
`print_in` on 16 threads; `mlir-opt --allow-unregistered-dialect -o /dev/null`, best of 3, peak
RSS from `/usr/bin/time -f %M`):

| job | mlirpass 0.8.1 | `mlir-opt` | speed-up | RSS mlirpass / `mlir-opt` |
| --- | ---: | ---: | ---: | ---: |
| custom in ⇒ custom out | 1,300 | 2,100 | **1.62×** | 907 / 332 MB |
| custom in ⇒ generic out | 980 | 2,440 | **2.49×** | 1,010 / 319 MB |
| generic in ⇒ custom out | 1,490 | 2,840 | **1.91×** | 920 / 395 MB |
| generic in ⇒ generic out | 520 | 3,000 | **5.77×** | 1,027 / 381 MB |

Against 0.6.0 under glibc (same jobs, mlirpass's `BENCHMARK.md`): custom ⇒ custom 2,210 ⇒ 1,300 ms,
generic ⇒ generic 770 ⇒ 520 ms; `parse_in` 542 ⇒ 214 ms (custom) and 349 ⇒ 182 ms (generic). The
custom form is no longer slower than `mlir-opt` on any job. The tables below are 0.6.0's.


Text → IR (parse) and IR → text (print), in mlirformat and in `mlir-opt` 22.1.8, on the same files:
each phase timed on its own, on one thread and, for parsing, on all of them (`parse_in` on a
`ThreadMulti`). Measured 2026-11-06.

## Setup

| | |
| --- | --- |
| mlirformat | 0.6.0 (`5c04237`), release build |
| `mlir-opt` | LLVM 22.1.8 from apt.llvm.org (`mlir-22-tools 1:22.1.8~++20260714014902+ca7933e47d3a`, = tag `llvmorg-22.1.8`): Release build, no assertions |
| machine | Intel Core Ultra 7 356H, 62 GB, Linux 7.0, glibc malloc, rustc 1.98.1. Hybrid CPU: CPUs 0–3 are P cores (4.7 GHz), 4–11 E cores (3.7 GHz), 12–15 LP E cores (3.3 GHz) |
| load | **not idle**: other jobs (compilers) kept the load average at 18–22 throughout. Every time below is higher than on an idle machine, `mlir-opt`'s as much as mlirformat's; compare the two within a table, not with earlier versions' tables |

`examples/bench.rs` (best of 5): mlirformat parses with `MlirOpt::upstream()`, prints the custom
form with it and the generic form with `MlirOpt::new()`, all on one thread; then parses again
with `parse_in` on a `ThreadMulti` of every CPU. The same program times `mlir-opt` as a process:
`--split-input-file --allow-unregistered-dialect --mlir-disable-threading -o /dev/null`, which
parses, verifies and prints. Pinned to one P core (`taskset -c 0`) for the one-thread columns;
unpinned for `parse_in`.

```sh
MLIR_OPT=/usr/lib/llvm-22/bin/mlir-opt taskset -c 0 cargo run --release --example bench -- --reps 5 FILE
cargo run --release --example bench -- --reps 5 FILE     # parse_in on all CPUs
```

### Inputs

| file | what | size |
| --- | --- | --- |
| big, custom | one random module from mlirpass's fuzz generator (`gen --seed 1 --funcs 2000 --ops 40 --depth 2`: arith, math, scf, memref, func), printed by `mlir-opt` in custom form | 684,421 lines, 31.9 MB |
| big, generic | the same module, printed with `--mlir-print-op-generic` | 703,141 lines, 54.3 MB |

## Results

All times are in ms.

### One big module, one thread, per phase (best of 5)

| phase | mlirformat (glibc) | mlirformat (jemalloc) | `mlir-opt` whole run, same time |
| --- | ---: | ---: | ---: |
| **parse, custom form** (31.9 MB) | 1,604 | 1,175 | 2,900 (custom out) |
| **parse, generic form** (54.3 MB) | **486** | 668 | 2,518 (generic out) |
| print custom form, of the module read from custom text | 2,372 | **1,007** | |
| print custom form, of the module read from generic text | 1,155 | **985** | |
| print generic form (module read from custom / from generic) | 296 / 229 | 244 / 235 | |

| job, one thread | mlirformat parse + print | `mlir-opt` | speed-up |
| --- | ---: | ---: | ---: |
| custom in ⇒ custom out | 3,976 | 2,900 | 0.73× |
| custom in ⇒ custom out, jemalloc | 2,182 | 2,788 | **1.28×** |
| generic in ⇒ custom out | 1,641 | 3,047 | **1.86×** |
| generic in ⇒ generic out | 715 | 2,518 | **3.52×** |

### Parsing on every CPU (`parse_in`, 16 threads, best of 5)

| file | `parse`, one thread | `parse_in`, 16 threads | speed-up |
| --- | ---: | ---: | ---: |
| big, custom (31.9 MB) | 1,424 | **542** | 2.6× |
| big, generic (54.3 MB) | 545 | **349** | 1.6× |

`parse_in` cuts the module's body at its ops into runs (about four per thread) read in parallel;
an op as big as a run splits again. The result is the module `parse` gives, byte for byte when
printed. With the machine this loaded, 16 threads are not 16 free CPUs: on an idle machine the
generic form parses in about 75 ms of text reading on 16 threads (measured in mlirpass, which
adds its import on top: mlirpass's `BENCHMARK.md`).

Printing on every CPU (`print_in`) is measured in mlirpass, where a whole module is printed from
its arenas (`show_in`).

### Many small modules: the fixtures (0.5.5, unchanged paths)

Reading and printing one small module at a time did not change in 0.6.0; these are 0.5.5's
numbers (idle machine, best of 5):

| | parse | print custom | print generic | parse + print custom | `mlir-opt` whole run |
| --- | ---: | ---: | ---: | ---: | ---: |
| fixtures, custom (12,250 chunks) | 348 | 325 | 53 | 673 | 50,897 |
| fixtures, generic (12,252 chunks) | 118 | 371 | 63 | 490 | 77,295 |

`mlir-opt` builds a fresh `MLIRContext` for each `// -----` chunk (4.1–6.2 ms per chunk all told);
mlirformat keeps one `MlirOpt` for all of them (0.04–0.06 ms per chunk).

## Reading it

- **The generic form is the fast path**: one thread parses 54 MB in 486 ms (5.2× `mlir-opt`'s
  whole run), and generic ⇒ generic is 3.5× faster than `mlir-opt`.
- **`parse_in` is new in 0.6.0**: 2.6× on the custom form, 1.6× on the generic one, on a
  machine this busy. It reads the same module.
- **glibc malloc still costs up to 2.4× on the custom form** (print custom 2,372 vs 1,007 ms
  under jemalloc). Lists are allocated at their exact length since 0.5.5, which fragments glibc's
  heap. Since 0.6.2 `std` makes jemalloc the global allocator (first section).
- **The breaking change of 0.6.0** (`Source` region ids are `u64`) costs nothing measurable.

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
# per phase, one P core; then parse_in on every CPU
MLIR_OPT=$(which mlir-opt) taskset -c 0 cargo run --release --example bench -- --reps 5 big_custom.mlir big_generic.mlir
LD_PRELOAD=/lib/x86_64-linux-gnu/libjemalloc.so.2 taskset -c 0 target/release/examples/bench --reps 5 big_custom.mlir big_generic.mlir
cargo run --release --example bench -- --reps 5 big_custom.mlir big_generic.mlir
```

For passes on top of mlirformat, see mlirpass's `BENCHMARK.md`.
