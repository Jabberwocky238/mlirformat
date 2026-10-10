# mlirformat

MLIR text ⇄ IR ⇄ typed Rust ops, `no_std` (+ `alloc`), serde throughout.

```rust
use mlirformat::*;

#[mlir::op("arith.maxsi", format = "$lhs `,` $rhs attr-dict `:` type($result)", results(result))]
pub struct ArithMax<'a> {
    #[slot(result)] pub lhs: Value<'a>,   // operand typed by type variable `result`
    #[slot(result)] pub rhs: Value<'a>,
    #[dtype] pub result: Type<'a>,        // type variable, result #0
}

let max = ArithMax::try_from("arith.maxsi %a, %b : i32")?;        // custom form → struct
let op = Operation::try_from(&max)?;                               // struct → generic op
assert_eq!(op.to_string(), r#""arith.maxsi"(%a, %b) : (i32, i32) -> i32"#);

let mut opt = MlirOpt::upstream();     // arith, func, cf, builtin
opt.inject(ArithMax::template());      // one op …
opt.register::<my::Dialect>();         // … or a whole `#[mlir::dialect]` enum
let m = opt.parse(src)?;               // known ops structured, unknown custom ops kept raw
println!("{}", opt.show(&m));          // known ops in custom form
opt.unregister("my");
```

## Layout

| file | role |
|---|---|
| `src/common.rs` | what an IR is: `Module`, `Operation`, `Region`, `Block`, `Value`, `Type`, `Attribute`, the `Op` / `Dialect` traits, `Template`, `Content`, field roles, assembly-format elements |
| `src/parser.rs` | text → IR, serde `Deserializer` (`Content` → typed op), `Operation` → typed op, format reader |
| `src/generator.rs` | IR → text, serde `Serializer` (typed op → `Content`), typed op → `Operation`, format writer |
| `src/mliropt.rs` | `MlirOpt`: dialect registry, op table, conversions; re-exports the public API |
| `src/dialects/` | `arith` (subset), `func`, `cf`, `builtin` |
| `macros/` | `#[mlir::op]` (`op.rs`), `#[mlir::dialect]` (`dialect.rs`) |
| `sampleplugin/` | an out-of-tree dialect |

## Field markers

`#[slot(T)]` operand(s) · `#[dtype]` / `#[dtype(i1)]` / `#[dtype(i1 = x)]` / `#[dtype(of = attr)]` type
variable · `#[attr]` / `#[attr(dialect = "arith.overflow", default = "<none>")]` property (`bool`: unit
attribute; user enum: case value / keyword) · `#[region]` · `#[successor]`. A `Vec` field is variadic;
MLIR names are lowerCamelCase unless `name = "..."`. `attrs` and `loc` fields are added.
`#[mlir::op(..., custom)]` leaves `Op` to a hand-written impl (`func.func`, `builtin.module`).

## Tests

`cargo test -p mlirformat` (fixtures: llvm-project 22.1.8 `mlir/test` + `mlir-opt` custom / generic
output), `cargo test -p mlirformat-sampleplugin`.
