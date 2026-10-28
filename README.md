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

// A dialect: a struct listing its ops with `#[mlir::dialect]` (and its traits, if any:
// `dependents = [..]`, `materializer`, `canonicalizer`).
#[mlir::dialect("demo", ops = [Max])]
pub struct DemoDialect;

fn main() -> Result<(), Box<dyn std::error::Error>> {
    // custom form ⇄ struct ⇄ generic op
    let op = Max::try_from("demo.max %a, %b : i32")?;
    assert_eq!(Max::new(op.lhs.clone(), op.rhs.clone(), op.result.clone()), op); // `new`: the declared fields, in order
    let generic = Operation::try_from(&op)?;
    assert_eq!(generic.to_string(), r#""demo.max"(%a, %b) : (i32, i32) -> i32"#);
    assert_eq!(Max::try_from(&generic)?, op);

    // whole files: load the dialect
    let mut opt = MlirOpt::upstream();
    opt.load(DemoDialect);
    let module = opt.parse(r#"%0 = "demo.max"(%a, %b) : (i32, i32) -> i32"#)?;
    assert_eq!(opt.show(&module).to_string(), "%0 = demo.max %a, %b : i32\n");
    Ok(())
}
```

### Field markers

Each field of a `#[mlir::op]` struct says its MLIR role (a `Vec` field is variadic; the MLIR name
is the lowerCamelCase field name unless `name = "..."`):

| marker | the field is |
|---|---|
| `#[slot(T)]` | an operand, typed by type variable `T` |
| `#[dtype]`, `#[dtype(i1)]`, `#[dtype(i1 = x)]`, `#[dtype(of = attr)]`, `#[dtype(eq = x)]`, `#[dtype(is = index)]`, `#[dtype(el = x)]`, `#[dtype(width = x)]` | a type variable (results by `results(...)`), and how the custom form infers it when unspelled |
| `#[attr]`, `#[attr(int = "i32")]`, `#[attr(dialect = "arith.overflow", default = "<none>")]`, `dense = "i64"`, `symbol`, `bits = ...` | a property: `bool` is a unit attribute, an enum a case typed `int` |
| `#[region]`, `#[successor]` | a region, a successor |

A property with a declared `default` is an `Option`: `None` leaves it absent, and whoever builds
the op fills the default (`#arith.overflow<none>`, `0 : i32`) — the same op as one built by name.
Parsing fills the default and printing drops it, so a round trip keeps it as written.

Op options: `format = "..."` (the ODS assembly format), `results(a, b)`, `generic` (no custom
form), `custom` (`Print` / `Parse` written by hand). `attrs` (discardable attributes) and `loc`
fields are added.

`#[derive(mlir::Cases)]` on an integer enum gives `TryFrom<i64>` by case value (the variant's
position; the hidden `__N` variants filling gaps take none) — `CmpIPredicate::try_from(2)` is
`slt`. Every enum `mlirformat tblgen` generates derives it.

## Dialects

Built in and registered by `MlirOpt::upstream()`: `affine`, `arith`, `async`, `bufferization`,
`builtin`, `cf`, `complex`, `emitc`, `func`, `gpu`, `index`, `linalg`, `llvm`, `math`, `memref`,
`pdl`, `scf`, `shape`, `tensor`, `tosa`, `ub`, `vector`, and the x86 CPU's `x86vector` and `amx`. `arith`, `builtin`, `cf`, `complex`,
`func`, `index`, `math` and `ub` are written by hand; the rest are generated from ODS by
`mlirformat tblgen`; `llvm_types::LlvmType` and `emitc_types::EmitcType` read and build those
dialects' types. An op whose syntax ODS leaves to C++ gets a hand-written form, injected by name
over the generated one so the generated files stay as `mlirformat tblgen` wrote them:
`affine_ops` (`affine.for` / `if` / `parallel` / `apply` / `min` / `max` / `load` / `store`),
`scf_hand` (`scf.for` / `if`), `gpu_hand` (`gpu.func`, `gpu.launch_func`), `linalg_hand`
(`linalg.generic` / `yield`, the named ops: the OpDSL ones generated from
`LinalgNamedStructuredOps.yaml` by `scripts/linalg_named.py`, `matmul` / `batch_matmul` /
`batch_reduce_matmul` / `contract`, `transpose` / `broadcast` / `map` / `reduce` / `elementwise`;
`mlir-opt` does not print a named op's region, so reading one rebuilds it as the op's region
builder does, with the ODS defaults of the ops it makes). An op
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
of the context, never a global table: `opt.op_info("memref.load")`, `opt.knows_dialect("tosa")`.
`MlirOpt::upstream()` knows every upstream op (not only the dialects above) and the dialects
`mlir-opt` registers; a loaded dialect brings its own rows. The context keeps them in an `OpInfos`,
filled by `OpInfos::upstream()` or `insert` / `dialect`. The upstream rows (`src/traits.gen.rs`) are generated
from llvm-project's ODS by `scripts/traits.py`:

```sh
python3 scripts/traits.py --llvm $LLVM --mlirformat target/release/mlirformat -I $LLVM_BUILD/tools/mlir/include
```

## Value layer

Attributes and types keep their text (`Attribute::Builtin { name, body }`, a dialect type's
body in `Extended`), so the text round trip stays exact. `src/values/` says what that text means
as values, in both directions, for whoever computes with the IR (folds, rewrites, lowerings):

| what | as | MLIR |
|---|---|---|
| numbers | `ApInt`, `ApFloat` (and MLIR's float printing) | `APInt`, `APFloat` |
| constants | `Const` ⇄ `Attribute` (`TryFrom` / `From`), elements as `Scalar` | `IntegerAttr`, `FloatAttr`, `BoolAttr`, `DenseElementsAttr` |
| memref layouts | `StridedLayout` ⇄ `Attribute`; `Shaped::layout` / `strided` / `memory_space` | `StridedLayoutAttr` |
| affine maps and sets | `AffineMap`, `IntegerSet`, `AffineExpr` ⇄ `Attribute` | `AffineMap`, `IntegerSet`, `AffineExpr` |
| quantized types | `UniformQuantized` ⇄ `Type`, `storage_type` | `quant::UniformQuantizedType` |

Builtin types and attributes are read and built through methods named as MLIR names them:
`Type::element_type`, `element_count`, `shape`, `dims`, `with_element`, `bit_width`,
`Type::tensor(dims, elem)`, `Type::vector(shape, scalable, elem)`; `Attribute::integer`,
`index`, `dense_i64`, `dense_i32`, `dense_values`, `is_poison`, `is_layout`. A `?` dim is
`Dim::DYNAMIC` (`ShapedType::kDynamic`), and `Dim` ⇄ `i64` through `From`.

Affine text has one parser, `affine_expr`, which keeps an expression as written (`Map`, `Set`)
so that the `affine` ops' custom forms print back exactly. `AffineMap` / `IntegerSet` are the
canonical form built from it through MLIR's simplifying constructors (`AffineMap::try_from(&map)`,
`AffineMap::parse(text)`): that is the form to fold, compose and simplify, and it prints what
`mlir-opt` prints for a map it built.

## Command line

`mlirformat tblgen` turns an ODS `.td` file into `<dialect>.gen.rs`: one `#[mlir::op]` struct per
op and a `#[mlir::dialect]` struct listing them, with the dialect's traits from its `Dialect` record.
Each struct's doc comment is the op's ODS `summary` and `description` (Markdown kept; a code block
without a language or an indented one becomes `text`, so none is a doctest), so `cargo doc` on a
crate holding generated dialects documents every op as its `.td` does. TableGen itself is built in: a port of LLVM 22.1.8's front end
resolves the records in process (no LLVM build needed; only the `.td` sources, e.g. `mlir/include`).
`--dump-json` prints those records exactly as `llvm-tblgen --dump-json` does (checked byte for byte on
every MLIR dialect `.td` that `llvm-tblgen` accepts on its own). Several `.td` files are generated in parallel. The generated files also compile in
`no_std` crates; `--params <namespace>=<path>` attaches a dialect's type / attribute parameter hook.

```sh
mlirformat tblgen $LLVM/mlir/include/mlir/Dialect/Arith/IR/ArithOps.td \
    -I $LLVM/mlir/include -o src/dialects
```

`scripts/regen-dialects.sh` regenerates every one of them (`LLVM=… LLVM_BUILD=…`).

A dialect whose ops upstream splits over several files is generated from a wrapper that includes
them, with `--dialect` (`scripts/td/Linalg.td`, `scripts/td/LLVM.td`):

```sh
mlirformat tblgen --dialect linalg scripts/td/Linalg.td \
    -I $LLVM/mlir/include -I $LLVM_BUILD/tools/mlir/include -o src/dialects
```

## License

MIT
