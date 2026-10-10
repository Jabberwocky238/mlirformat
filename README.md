# mlirformat

MLIR text ⇄ IR ⇄ typed Rust ops.

## Install

```sh
cargo add mlirformat
```

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

## License

MIT
