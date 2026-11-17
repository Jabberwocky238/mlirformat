# mlirformat

[English](README.md)

MLIR 文本 ⇄ IR ⇄ 类型化的 Rust op。

MLIR 行为对齐 **MLIR 23.1.5**（llvm-project `llvmorg-23.1.5`）：文本格式、各方言及其汇编格式都对照
`mlir-opt` 23.1.5 核对。

## 安装

```sh
cargo add mlirformat        # 库
cargo install mlirformat    # `mlirformat` 命令行
```

## Features

| feature | 缺省 | 是什么 |
|---|---|---|
| `std` | 是 | 标准库（不开时库是 `no_std`，需要 `alloc`）；jemalloc 作全局分配器（MSVC 除外）；`parse_in` / `print_in` 用 moremath 的线程 |
| `tblgen` | 是 | `mlirformat` 命令行：从 ODS `.td` 生成方言（内置 TableGen，不需要 LLVM）；引入 `clap` 和 `serde_json`；会开 `std` |
| `gen-tests` | 否 | 仅测试：`mlirformat tblgen` 生成的方言，每个一个测试 crate（`tests/generated/`） |
| `less` | 否 | 仅测试：fixture 测试读 `tests/fixtures` 每 10 个文件中的一个，每次都是同样的 10 %（`less`、`more` 都不开时也是这样） |
| `more` | 否 | 仅测试：fixture 测试读 `tests/fixtures` 的全部文件（发次版本或主版本前用） |

只要库：`cargo add mlirformat --no-default-features`。

## 用法

```rust
use mlirformat::{MlirOpt, Operation, Type, Value, mlir};

// 一个 op：带 `#[mlir::op]` 的结构体。
#[mlir::op("demo.max", format = "$lhs `,` $rhs attr-dict `:` type($result)", results(result))]
pub struct Max<'a> {
    #[slot(result)]
    pub lhs: Value<'a>,
    #[slot(result)]
    pub rhs: Value<'a>,
    pub result: Type<'a>,
}

// 一个方言：用 `#[mlir::dialect]` 列出它的 op（以及它的 trait，如有：
// `dependents = [..]`、`materializer`、`canonicalizer`）。
#[mlir::dialect("demo", ops = [Max])]
pub struct DemoDialect;

fn main() -> Result<(), Box<dyn std::error::Error>> {
    // 自定义形式 ⇄ 结构体 ⇄ 通用 op
    let op = Max::try_from("demo.max %a, %b : i32")?;
    assert_eq!(Max::new(op.lhs.clone(), op.rhs.clone(), op.result.clone()), op); // `new`：声明的字段，按顺序
    let generic = Operation::try_from(&op)?;
    assert_eq!(generic.to_string(), r#""demo.max"(%a, %b) : (i32, i32) -> i32"#);
    assert_eq!(Max::try_from(&generic)?, op);

    // 整个文件：先装载方言
    let mut opt = MlirOpt::upstream();
    opt.load(DemoDialect);
    let module = opt.parse(r#"%0 = "demo.max"(%a, %b) : (i32, i32) -> i32"#)?;
    assert_eq!(opt.show(&module).to_string(), "%0 = demo.max %a, %b : i32\n");
    Ok(())
}
```

### 字段标记

字段在 MLIR 里扮演什么角色由它的 Rust 类型决定：`Type` 是类型变量，`Region` 是区域，除 `Value` 以外的
其他类型是属性（`bool` 是 unit 属性）。以下情况才写标记：操作数（`#[slot(T)]`）、后继、类型说明不了的
角色（`Type` 上的 `#[attr]`：类型属性），或要带下面这些选项。`Vec` 字段是可变长的；MLIR 里的名字就是
字段名，除非写了 `name = "..."`（`overflow_flags` 拼作 `overflowFlags`）。

| 标记 | 字段是 |
|---|---|
| `#[slot(T)]` | 操作数，类型是类型变量 `T` |
| `#[dtype]`、`#[dtype(i1)]`、`#[dtype(i1 = x)]`、`#[dtype(of = attr)]`、`#[dtype(eq = x)]`、`#[dtype(is = index)]`、`#[dtype(el = x)]`、`#[dtype(width = x)]` | 类型变量（结果用 `results(...)`），以及自定义形式里没写出时怎么推出它 |
| `#[attr]`、`#[attr(int = "i32")]`、`#[attr(dialect = "arith.overflow", default = "<none>")]`、`dense = "i64"`、`symbol`、`bits = ...` | 属性：`bool` 是 unit 属性，枚举是按 `int` 定类型的取值 |
| `#[region]`、`#[successor]` | 区域、后继 |

声明了 `default` 的属性是 `Option`：`None` 表示不出现，由建 op 的一方填上缺省值（`#arith.overflow<none>`、
`0 : i32`），和按名字建出来的 op 一样。解析时填上缺省值、打印时省掉，所以往返后保持原样。

op 选项：`format = "..."`（ODS 汇编格式）、`results(a, b)`、`custom`（手写 `Print` / `Parse`）；
不写 `format` 的 op 没有自定义形式，总是打印成通用形式。另外会加上 `attrs`（可丢弃属性）和 `loc` 字段。

整数枚举上的 `#[derive(mlir::Cases)]` 按取值给出 `TryFrom<i64>`（取值是变体的位置；填空位的隐藏变体
`__N` 不占取值）—— `CmpIPredicate::try_from(2)` 是 `slt`。`mlirformat tblgen` 生成的枚举都派生它。

## 方言

内置并由 `MlirOpt::upstream()` 注册：`affine`、`arith`、`async`、`bufferization`、`builtin`、`cf`、
`complex`、`emitc`、`func`、`gpu`、`index`、`linalg`、`llvm`、`math`、`memref`、`pdl`、`scf`、`shape`、
`tensor`、`tosa`、`ub`、`vector`；CPU 的 `x86`（AVX-512、AVX10 和 AMX，MLIR 23 起合成一个方言）、
`arm_neon`、`arm_sve`、`arm_sme`；GPU 厂商的 `nvgpu`、`nvvm`、`amdgpu`、`rocdl`、`xegpu`、`xevm`；`spirv`。

`arith`、`builtin`、`cf`、`complex`、`func`、`index`、`math`、`ub` 是手写的，其余由 `mlirformat tblgen`
从 ODS 生成；`llvm_types::LlvmType`、`emitc_types::EmitcType`、`spirv_types::SpirvType` 负责读写这几个
方言的类型。

ODS 把语法交给 C++ 的 op 有手写形式，按名字注入、覆盖生成的那份，这样生成的文件保持
`mlirformat tblgen` 写出的原样：
- `affine_ops`：`affine.for` / `if` / `parallel` / `apply` / `min` / `max` / `load` / `store`。
- `scf_hand`：`scf.for` / `if` / `while`。
- `vector_hand`：`vector.shuffle`。它的结果类型是掩码长度接上第一个操作数的尾部形状，格式引擎推不出来。
- `gpu_hand`：`gpu.func`、`gpu.launch_func`。
- `llvm_hand`：`llvm.func`、`llvm.call`、`llvm.icmp` / `fcmp`、`llvm.getelementptr`。在通用
  `Operation` 上读写，类型化 op 仍用生成的那些。
- `linalg_hand`：`linalg.generic` / `yield` 和各具名 op。
  - OpDSL 那些由 `scripts/linalg_named.py` 从 `LinalgNamedStructuredOps.yaml` 生成；另有
    `matmul` / `batch_matmul` / `batch_reduce_matmul` / `contract`、`transpose` / `broadcast` / `map` /
    `reduce` / `elementwise`。
  - `mlir-opt` 不打印具名 op 的区域，所以读入时按该 op 的区域构造器重建，用到的 op 带上它们的 ODS 缺省值。

ODS 语法超出格式引擎表达能力的 op 留在通用形式，它仍是合法的 MLIR。`tests/dialects.rs` 把每个自定义
形式和 `mlir-opt` 23.1.5 对照，其余的计数。

不在 `MlirOpt::upstream()` 里（用 `opt.load(nir::NirDialect)` 装载）：`nir`，Mesa 的 NIR ALU 操作码。
- 每个操作码一个 op，比如 `nir.fadd %a, %b : (f32, f32) -> f32`：类型全写出，`exact` 是 NIR 的标志。
- 由 `scripts/nir_opcodes.py` 从 Mesa 25.2.8 的 `src/compiler/nir/nir_opcodes.py` 生成。
- `NirDialect::OPCODES` 保存每个操作码的源、尺寸、类型和代数性质。
- GPU 后端需要和 Mesa 驱动算出同样结果时，就把 SPIR-V 降到它。

同样不在 `MlirOpt::upstream()` 里（用 `opt.load(glsl::GlslDialect)` 装载）：`glsl`，即用 MLIR 表示的
GLSL（ES 1.00 / 3.00）。
- 包括 `glsl.shader` 及其全局变量（`in` / `out` / `uniform`、location、插值、内置变量）、
  `glsl.load` / `glsl.store`、构造函数、内置函数、导数、纹理采样、`discard`。
- 着色器的其余部分用 `func` / `arith` / `math` / `vector` / `scf`；聚合类型和采样器用 `!spirv.*` 类型。
- GLSL 源码本身的读写在 [mlirpass](https://github.com/Jabberwocky238/mlirpass)（`target.glsl`）。

### 自定义指令

ODS 把 `custom<X>(...)` 指令的语法留在 `.td` 之外，交给 C++ 里手写的 `parseX` / `printX`，所以光看 `.td`
不知道语法是什么。`src/syntax.rs` 改为在这里声明这些指令，每个一次、只写一个方向：

```rust
syntax! {
    /// `[%a, 7, 42]`
    DynamicIndexList($values, $integers) = "[" zip($integers, $values) "]";
}
```

名字跨方言共用，一条规则覆盖所有调用它的 op。名字不会留到运行时：`mlirformat tblgen` 先查指令是否已声明
才保留一个格式，格式分词器再把调用处展开成普通元素。

### op 的 trait

ODS 对每个 op 说的东西都向上下文查，⛔ 全局表，例如 `opt.op_info("memref.load")`、
`opt.knows_dialect("tosa")`。这些东西包括：
- 原生 trait 和接口（`Trait::Pure`、`Trait::RegionBranchOpInterface`……）；
- 内存效应；
- 固有属性。

`MlirOpt::upstream()` 认识所有上游 op（不只上面这些方言）以及 `mlir-opt` 注册的方言；装载的方言带上它
自己的条目。上下文把它们存在 `OpInfos` 里，由 `OpInfos::upstream()` 或 `insert` / `dialect` 填充。上游
条目（`src/traits.gen.rs`）由 `scripts/traits.py` 从 llvm-project 的 ODS 生成：

```sh
python3 scripts/traits.py --llvm $LLVM --mlirformat target/release/mlirformat -I $LLVM_BUILD/tools/mlir/include
```

同一次运行还写出 `src/verifier/ods.gen.rs`，内容有两部分：
- 每个 op 的固有属性及其 ODS 约束。`MlirOpt::verify` 照 `verifyInherentAttrs` 检查它们。
- 每个操作数和结果的类型类别，即约束所属的 C++ 类：`IntegerType`、`VectorType`……

`scripts/spirv_enums.py` 写出 `src/verifier/spirv.gen.rs`，即每个 SPIR-V 枚举属性（`SPIRVBase.td`）的取值。

## 值层

属性和类型保留原文（`Attribute::Builtin { name, body }`，方言类型的主体在 `Extended` 里），所以文本往返
精确。`src/values/` 给出这些文本作为值的含义，双向都有，供拿 IR 做计算的一方（折叠、改写、下降）使用：

| 什么 | 表示为 | MLIR 里 |
|---|---|---|
| 数 | `ApInt`、`ApFloat`（以及 MLIR 的浮点打印） | `APInt`、`APFloat` |
| 常量 | `Const` ⇄ `Attribute`（`TryFrom` / `From`），元素是 `Scalar` | `IntegerAttr`、`FloatAttr`、`BoolAttr`、`DenseElementsAttr` |
| memref 布局 | `StridedLayout` ⇄ `Attribute`；`Shaped::layout` / `strided` / `memory_space` | `StridedLayoutAttr` |
| 仿射映射和集合 | `AffineMap`、`IntegerSet`、`AffineExpr` ⇄ `Attribute` | `AffineMap`、`IntegerSet`、`AffineExpr` |
| 量化类型 | `UniformQuantized` ⇄ `Type`、`storage_type` | `quant::UniformQuantizedType` |
| 位置 | `Loc`（一个 `loc(...)` 的文本）、`Loc::fuse` | `FusedLoc::get`、`Builder::getFusedLoc` |

内置类型和属性通过和 MLIR 同名的方法读取和构造。
- `Type`：`element_type`、`element_count`、`shape`、`dims`、`with_element`、`bit_width`；构造用
  `Type::tensor(dims, elem)`、`Type::vector(shape, scalable, elem)`。
- `Attribute`：
  - 构造：`integer`、`index`、`i32`、`i64`、`dense_array`（`dense_i64`、`dense_i32`）。
  - 读取：`dense_values`、`int_array`、`int_array_of`、`int_values`。
  - 按参数取的字典：`dicts` / `dict_at`。
  - 方言属性 `<...>` 的主体：`dialect_with` / `inner` / `case_of`。
  - 判断：`is_poison`、`is_layout`。
- 维度：`?` 维是 `Dim::DYNAMIC`（`ShapedType::kDynamic`）；`Dim` ⇄ `i64` 走 `From`。

仿射文本只有一个解析器 `affine_expr`，它按原样保存表达式（`Map`、`Set`），所以 `affine` op 的自定义形式能
精确打印回去。`AffineMap` / `IntegerSet` 是经 MLIR 的化简构造函数得到的规范形式（`AffineMap::try_from(&map)`、
`AffineMap::parse(text)`）：要折叠、组合、化简就用它，它打印出的是 `mlir-opt` 对自己构造的映射打印的样子。

### 借用和拥有的 IR

`Module`、`Operation` 等从读入的源文本借用文本（`Cow<'a, str>`）。`IntoStatic::into_static` 让一个值
拥有全部文本（按移动：拥有的文本直接移动，只复制借用的文本）。`Reborrow::reborrow` 方向相反：得到一个
从原值借用全部文本的视图，只复制装文本的列表。这样自己保存文本的 IR 可以不深拷贝就交给打印器。

## 源码位置

`MlirOpt::parse_file(src, name)`（以及 `parse_file_in`）把文本当作文件 `name` 来读：没写 `loc(...)` 的 op
或块参数位于它起始处的 `loc("name":line:col)`，和 `mlir-opt` 的定位一样；`parse` 则不带位置。

## 线程

`MlirOpt::parse_in(src, &exec)` 和 `MlirOpt::print_in(&module, &source, &exec)` 接收一个执行器
（`ThreadMulti`，从 [moremath](https://crates.io/crates/moremath) 重导出；feature `std`）。
- 读入：至少 `MlirOpt::PARALLEL_BYTES` 大的块按 op 切成若干段并行读；和一段一样大的 op 会再切。
- 打印：模块主体的 op 分段打印到各自的字符串里，再按顺序拼接。

两者的结果都和 `parse` / `show_from` 完全相同。[`Source`] 用 `u64` id 命名它的区域。

## 命令行

`mlirformat tblgen` 把 ODS `.td` 文件转成 `<dialect>.gen.rs`。
- 每个 op 一个 `#[mlir::op]` 结构体，外加一个列出它们的 `#[mlir::dialect]` 结构体；方言的 trait 取自
  它的 `Dialect` 记录。
- 每个结构体的文档注释是 op 的 ODS `summary` 和 `description`，Markdown 保留；不带语言的代码块或缩进
  代码块改成 `text`，所以都不是 doctest。这样对装着生成方言的 crate 跑 `cargo doc`，每个 op 的文档和它的
  `.td` 一致。
- TableGen 内置：移植了 LLVM 23.1.5 的前端，含 `let append` / `let prepend`；没有任何 MLIR `.td` 用到的
  `!sort` 和 `!switch` 没移植。记录在进程内解析，不需要 LLVM 构建，只要 `.td` 源文件，比如 `mlir/include`。
- `--dump-json` 打印出的记录和 `llvm-tblgen --dump-json` 完全相同：对 `llvm-tblgen` 能单独接受的每个
  MLIR 方言 `.td` 逐字节核对过。
- 多个 `.td` 并行生成；生成的文件也能在 `no_std` crate 里编译。
- `--params <namespace>=<path>` 挂上方言的类型 / 属性参数钩子。

```sh
mlirformat tblgen $LLVM/mlir/include/mlir/Dialect/Arith/IR/ArithOps.td \
    -I $LLVM/mlir/include -o src/dialects
```

`td/` 是 llvm-project 23.1.5 的 `mlir/include`，裁剪到内置方言会 include 的部分。
- 上游 `.td` 原样放在原路径；`-I td` 是它们 `include "mlir/..."` 读取的根。
- 上游把 op 分在几个文件里的方言，用一次 `--dialect <namespace>` 跑这几个文件（`linalg`：`LinalgOps.td`、
  `LinalgStructuredOps.td`、`LinalgRelayoutOps.td`）。
- 上游 `.td` 相对自己声明的 `include`（`ArmSMEOps.td` 的 `include "ArmSME.td"`）在 include 它的文件旁边
  找。这和上游每次构建都把自己的目录作为 `-I` 传入一致。

```sh
D=td/mlir/Dialect/Linalg/IR
mlirformat tblgen --dialect linalg $D/LinalgOps.td $D/LinalgStructuredOps.td $D/LinalgRelayoutOps.td \
    -I td -o src/dialects
```

`scripts/regen-dialects.sh` 重新生成全部方言。有三个文件在 23.1.5 构建时才生成、不在源码树里，`td/` 也把
它们放在同样路径：
- `LinalgNamedStructuredOps.yamlgen.td`，来自 OpDSL YAML；
- `OpenMP/OmpCommon.td` / `OpenACC/AccCommon.td`，是 llvm 的 `OMP.td` / `ACC.td` 经
  `--gen-directive-decl` 生成的，由 `scripts/directive_common.py` 复现。

`mlirformat bc` 在 MLIR 文本和字节码（`.mlirbc`，版本 6，和 `mlir-opt --emit-bytecode` 写出的一样）之间转换：
输入字节码就输出文本，输入文本就输出字节码。库里对应的是 `Bytecode::read` / `Bytecode::write`。
- `tests/bytecode` 为每个上游测试文件放一个模块，各由 `mlir-opt` 23.1.5 写出（`scripts/mlirbc_fixtures.py`）。
- 2269 个里 2243 个写出逐字节一致，2245 个读回后和 `mlir-opt` 打印的一样。
- 属性表由 `scripts/mlirbc_props.py` 从 LLVM 构建里读出。

```sh
mlirformat bc module.mlir -o module.mlirbc   # 文本 ⇒ 字节码
mlirformat bc module.mlirbc                  # 字节码 ⇒ 文本
```

## 性能

用 0.6.2 对比 `mlir-opt` 22.1.8 测得（见 `BENCHMARK.md`）。条件：16 个 CPU，两边都开多线程，jemalloc（0.6.2 起开
`std` 时的全局分配器）。
- `parse_in` 读一个 54 MB 的通用形式模块要 182 ms，读一个 32 MB 的自定义形式模块要 214 ms。
- 按完整进程比：通用进、通用出比 `mlir-opt` 快 5.8 倍；自定义进、自定义出快 1.6 倍。
- 峰值内存是 `mlir-opt` 的 2.6–3.2 倍。

## 许可

MIT
