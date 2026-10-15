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

## License

MIT
