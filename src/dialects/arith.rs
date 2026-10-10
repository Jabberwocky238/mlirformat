//! `arith` dialect (subset).

use crate::{Type, ValueRef, mlir};

/// `lhs, rhs : T` binary ops without properties.
macro_rules! binops {
    ($($ty:ident = $name:literal),* $(,)?) => {$(
        #[mlir::op($name, format = "$lhs `,` $rhs attr-dict `:` type($result)", results(result))]
        pub struct $ty<'a> {
            #[slot(result)]
            pub lhs: ValueRef<'a>,
            #[slot(result)]
            pub rhs: ValueRef<'a>,
            #[dtype]
            pub result: Type<'a>,
        }
    )*};
}

binops! {
    AndI = "arith.andi",
    OrI = "arith.ori",
    XOrI = "arith.xori",
    MaxSI = "arith.maxsi",
    MaxUI = "arith.maxui",
    MinSI = "arith.minsi",
    MinUI = "arith.minui",
    DivSI = "arith.divsi",
    DivUI = "arith.divui",
    RemSI = "arith.remsi",
    RemUI = "arith.remui",
    CeilDivSI = "arith.ceildivsi",
    CeilDivUI = "arith.ceildivui",
    FloorDivSI = "arith.floordivsi",
    ShRSI = "arith.shrsi",
    ShRUI = "arith.shrui",
}
