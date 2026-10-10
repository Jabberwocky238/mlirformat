use alloc::borrow::Cow;
use alloc::boxed::Box;
use alloc::vec::Vec;

/// Source text slice; borrowed after parsing, owned after deserializing from escaped data.
pub type Str<'a> = Cow<'a, str>;

keywords! {
    pub enum Signedness { Signless = "i", Signed = "si", Unsigned = "ui" }

    pub enum ShapedKind { Tensor = "tensor", MemRef = "memref", Vector = "vector" }

    pub enum FloatKind {
        F4E2M1FN = "f4E2M1FN",
        F6E2M3FN = "f6E2M3FN",
        F6E3M2FN = "f6E3M2FN",
        F8E5M2 = "f8E5M2",
        F8E4M3 = "f8E4M3",
        F8E4M3FN = "f8E4M3FN",
        F8E5M2FNUZ = "f8E5M2FNUZ",
        F8E4M3FNUZ = "f8E4M3FNUZ",
        F8E4M3B11FNUZ = "f8E4M3B11FNUZ",
        F8E3M4 = "f8E3M4",
        F8E8M0FNU = "f8E8M0FNU",
        BF16 = "bf16",
        F16 = "f16",
        TF32 = "tf32",
        F32 = "f32",
        F64 = "f64",
        F80 = "f80",
        F128 = "f128",
    }
}

ast! {
    /// A whole `.mlir` file.
    pub struct Module<'a> {
        pub items: Vec<Item<'a>>,
    }

    pub enum Item<'a> {
        /// `#name = <attr>`
        AttrAlias { name: Str<'a>, value: Attribute<'a> },
        /// `!name = <type>`
        TypeAlias { name: Str<'a>, ty: Type<'a> },
        /// `{-# ... #-}`, raw body between the markers.
        Metadata { body: Str<'a> },
        Op(Operation<'a>),
    }

    pub struct Operation<'a> {
        pub results: Vec<ResultDef<'a>>,
        pub body: OpBody<'a>,
    }

    /// `%name` or `%name:count` on the left of `=`.
    pub struct ResultDef<'a> {
        pub name: Str<'a>,
        pub count: Option<u32>,
    }

    pub enum OpBody<'a> {
        Generic(GenericOp<'a>),
        Custom(CustomOp<'a>),
    }

    /// `"name"(operands)[successors] <properties> (regions) {attributes} : type loc(...)`
    pub struct GenericOp<'a> {
        /// Raw (still escaped) contents of the quoted name.
        pub name: Str<'a>,
        pub operands: Vec<ValueRef<'a>>,
        /// Block labels without the `^`.
        pub successors: Vec<Str<'a>>,
        pub properties: Option<Attribute<'a>>,
        pub regions: Vec<Region<'a>>,
        pub attributes: Vec<NamedAttr<'a>>,
        pub ty: FunctionType<'a>,
        /// Raw contents of `loc(...)`.
        pub loc: Option<Str<'a>>,
    }

    /// Dialect-specific pretty form: the op name followed by raw text, with regions
    /// (a `{` that ends its line) parsed structurally.
    pub struct CustomOp<'a> {
        pub name: Str<'a>,
        pub pieces: Vec<Piece<'a>>,
    }

    pub enum Piece<'a> {
        Text(Str<'a>),
        Region(Region<'a>),
    }

    /// `%name` or `%name#index`.
    pub struct ValueRef<'a> {
        pub name: Str<'a>,
        pub index: Option<u32>,
    }

    pub struct Region<'a> {
        pub blocks: Vec<Block<'a>>,
    }

    pub struct Block<'a> {
        /// Label without the `^`; `None` for an implicit entry block.
        pub label: Option<Str<'a>>,
        pub args: Vec<BlockArg<'a>>,
        pub ops: Vec<Operation<'a>>,
    }

    pub struct BlockArg<'a> {
        pub name: Str<'a>,
        pub ty: Type<'a>,
        pub loc: Option<Str<'a>>,
    }

    /// `name = value`, or a bare `name` (unit attribute). A quoted name keeps its quotes.
    pub struct NamedAttr<'a> {
        pub name: Str<'a>,
        pub value: Option<Attribute<'a>>,
    }

    pub struct FunctionType<'a> {
        pub inputs: Vec<Type<'a>>,
        pub results: Vec<Type<'a>>,
    }

    pub enum Dim {
        Static(i64),
        Dynamic,
        /// Scalable vector dim `[n]`.
        Scalable(i64),
    }

    pub struct Shaped<'a> {
        pub kind: ShapedKind,
        /// `None` for unranked (`*`).
        pub shape: Option<Vec<Dim>>,
        pub elem: Box<Type<'a>>,
        /// Encoding / layout / memory space attributes after the element type.
        pub extras: Vec<Attribute<'a>>,
    }

    /// Dialect type/attribute (`!ns.name<...>`, `#ns.name<...>`) or alias (`!t`, `#map`).
    pub struct Extended<'a> {
        pub name: Str<'a>,
        /// Raw body including delimiters, as written in the source. Printed verbatim when present.
        pub body: Option<Str<'a>>,
        /// Structured parameters, filled by a [`crate::Dialect`] plugin; printed as `<p, ...>`
        /// when there is no raw body.
        pub params: Vec<Attribute<'a>>,
    }

    pub enum Type<'a> {
        Integer { signedness: Signedness, width: u32 },
        Float(FloatKind),
        Index,
        NoneType,
        Complex(Box<Type<'a>>),
        Tuple(Vec<Type<'a>>),
        Function(FunctionType<'a>),
        Shaped(Shaped<'a>),
        /// `!name` or `!name<...>`: dialect type or alias.
        Extended(Extended<'a>),
    }

    pub enum Attribute<'a> {
        Unit,
        Bool(bool),
        /// Raw literal (decimal or hex), optional `: type`.
        Int { lit: Str<'a>, ty: Option<Type<'a>> },
        Float { lit: Str<'a>, ty: Option<Type<'a>> },
        /// Raw (still escaped) string contents.
        Str { lit: Str<'a>, ty: Option<Type<'a>> },
        Type(Type<'a>),
        Array(Vec<Attribute<'a>>),
        Dict(Vec<NamedAttr<'a>>),
        /// `@a::@b`; quoted segments keep their quotes.
        SymbolRef(Vec<Str<'a>>),
        /// `array<i32: 1, 2>`
        DenseArray { ty: Type<'a>, values: Vec<Str<'a>> },
        /// Builtin keyword attribute with raw body: `dense<...>`, `affine_map<...>`,
        /// `distinct[0]<...>`, `loc(...)`, ... `body` keeps its delimiters.
        Builtin { name: Str<'a>, body: Str<'a>, ty: Option<Type<'a>> },
        /// `#name` or `#name<...>` with optional `: type`: dialect attribute or alias.
        Extended { ext: Extended<'a>, ty: Option<Type<'a>> },
    }
}
