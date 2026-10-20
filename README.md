# mlirformat

MLIR text ⇄ IR ⇄ typed Rust ops.

MLIR behavior follows **MLIR 22.1.8** (llvm-project `llvmorg-22.1.8`): the textual format, the
dialects and their assembly formats are checked against `mlir-opt` 22.1.8.

## Install

```sh
cargo add mlirformat        # the library
cargo install mlirformat    # the `mlirformat` command line
```

Prebuilt `mlirformat` binaries are attached to each GitHub release.

## Features

| feature | default | what it is |
|---|---|---|
| `std` | yes | Standard library support. Without it the library is `no_std` (needs `alloc`). |
| `tblgen` | yes | The `mlirformat` command line, which generates dialects from ODS `.td` files. Pulls in `clap` and `serde_json`; implies `std`. |

For the library alone: `cargo add mlirformat --no-default-features`.

## Usage

```rust
use mlirformat::{MlirOpt, Operation, Type, Value, mlir};

// An op: a struct with `#[mlir::op]`.
#[mlir::op("demo.max", format = "$lhs `,` $rhs attr-dict `:` type($result)", results(result))]
pub struct Max<'a> {
    #[slot(result)]
    pub lhs: Value<'a>,
    #[slot(result)]
    pub rhs: Value<'a>,
    #[dtype]
    pub result: Type<'a>,
}

// A dialect: an enum of ops with `#[mlir::dialect]`.
#[mlir::dialect("demo")]
pub enum Demo<'a> {
    Max(Max<'a>),
}

fn main() -> Result<(), Box<dyn std::error::Error>> {
    // custom form ⇄ struct ⇄ generic op
    let op = Max::try_from("demo.max %a, %b : i32")?;
    assert_eq!(Max::new(op.lhs.clone(), op.rhs.clone(), op.result.clone()), op); // `new`: the declared fields, in order
    let generic = Operation::try_from(&op)?;
    assert_eq!(generic.to_string(), r#""demo.max"(%a, %b) : (i32, i32) -> i32"#);
    assert_eq!(Max::try_from(&generic)?, op);

    // whole files: register the dialect
    let mut opt = MlirOpt::upstream();
    opt.register::<Demo>();
    let module = opt.parse(r#"%0 = "demo.max"(%a, %b) : (i32, i32) -> i32"#)?;
    assert_eq!(opt.show(&module).to_string(), "%0 = demo.max %a, %b : i32\n");
    Ok(())
}
```

## Dialects

Built in and registered by `MlirOpt::upstream()`: `affine`, `arith`, `async`, `bufferization`,
`builtin`, `cf`, `complex`, `emitc`, `func`, `gpu`, `index`, `linalg`, `llvm`, `math`, `memref`,
`pdl`, `scf`, `shape`, `tensor`, `tosa`, `ub`, `vector`. `arith`, `builtin`, `cf`, `complex`,
`func`, `index`, `math` and `ub` are written by hand; the rest are generated from ODS by
`mlirformat tblgen`; `llvm_types::LlvmType` and `emitc_types::EmitcType` read and build those
dialects' types. An op
whose ODS syntax the format engine cannot express stays on the generic form, which is still valid
MLIR — `tests/dialects.rs` checks every custom form against `mlir-opt` 22.1.8 and counts the rest.

### Custom directives

ODS keeps a `custom<X>(...)` directive's syntax out of the `.td` and leaves it to a hand-written
`parseX` / `printX` pair in C++, so the `.td` alone never says what the syntax is. `src/syntax.rs`
declares those directives instead, once each and in one direction only:

```rust
syntax! {
    /// `[%a, 7, 42]`
    DynamicIndexList($values, $integers) = "[" zip($integers, $values) "]";
}
```

Names are shared across dialects, so one rule covers every op that calls it. The name never
reaches run time: `mlirformat tblgen` asks whether a directive is declared before it keeps a
format, and the format tokenizer expands the call site into plain elements.

### Op traits

What ODS says about each op — its native traits and interfaces (`Trait::Pure`,
`Trait::RegionBranchOpInterface`, …), its memory effects, its inherent attributes — is asked
through the `OpRegistry` trait, never a global table: `opt.op_info("memref.load")`,
`opt.knows_dialect("tosa")`. `MlirOpt::upstream()` registers every upstream op (not only the
dialects above) and the dialects `mlir-opt` registers; `OpInfos` is the default registry, filled by
`OpInfos::upstream()` or `insert` / `dialect`. The upstream rows (`src/traits.gen.rs`) are generated
from llvm-project's ODS by `scripts/traits.py`:

```sh
python3 scripts/traits.py --llvm $LLVM --mlirformat target/release/mlirformat -I $LLVM_BUILD/tools/mlir/include
```

## Command line

`mlirformat tblgen` turns an ODS `.td` file into `<dialect>.gen.rs`: one `#[mlir::op]` struct per
op and a `#[mlir::dialect]` enum. TableGen itself is built in: a port of LLVM 22.1.8's front end
resolves the records in process (no LLVM build needed; only the `.td` sources, e.g. `mlir/include`).
`--dump-json` prints those records exactly as `llvm-tblgen --dump-json` does (checked byte for byte on
every MLIR dialect `.td` that `llvm-tblgen` accepts on its own). Several `.td` files are generated in parallel. The generated files also compile in
`no_std` crates; `--params <namespace>=<path>` attaches a dialect's type / attribute parameter hook.

```sh
mlirformat tblgen $LLVM/mlir/include/mlir/Dialect/Arith/IR/ArithOps.td \
    -I $LLVM/mlir/include -o src/dialects
```

A dialect whose ops upstream splits over several files is generated from a wrapper that includes
them, with `--dialect` (`scripts/td/Linalg.td`, `scripts/td/LLVM.td`):

```sh
mlirformat tblgen --dialect linalg scripts/td/Linalg.td \
    -I $LLVM/mlir/include -I $LLVM_BUILD/tools/mlir/include -o src/dialects
```

## License

MIT
