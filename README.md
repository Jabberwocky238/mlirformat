# mlirformat

MLIR text ⇄ IR ⇄ typed Rust ops.

## Install

```toml
[dependencies]
mlirformat = "0.1"
```

## Usage

```rust
use mlirformat::{MlirOpt, Op, Operation, Type, Value, mlir};

#[mlir::op("arith.maxsi", format = "$lhs `,` $rhs attr-dict `:` type($result)", results(result))]
pub struct MaxSI<'a> {
    #[slot(result)]
    pub lhs: Value<'a>,
    #[slot(result)]
    pub rhs: Value<'a>,
    #[dtype]
    pub result: Type<'a>,
}

fn main() -> Result<(), Box<dyn std::error::Error>> {
    // custom form ⇄ struct ⇄ generic op
    let op = MaxSI::try_from("arith.maxsi %a, %b : i32")?;
    let generic = Operation::try_from(&op)?;
    assert_eq!(generic.to_string(), r#""arith.maxsi"(%a, %b) : (i32, i32) -> i32"#);
    assert_eq!(MaxSI::try_from(&generic)?, op);

    // whole files: register dialects, inject ops
    let mut opt = MlirOpt::upstream();
    opt.inject(MaxSI::template());
    let module = opt.parse(r#"%0 = "arith.maxsi"(%a, %b) : (i32, i32) -> i32"#)?;
    assert_eq!(opt.show(&module).to_string(), "%0 = arith.maxsi %a, %b : i32\n");
    Ok(())
}
```

## License

MIT
