//! `cf` (subset).

use alloc::vec::Vec;

use crate::{Str, Type, Value, mlir};

#[mlir::op("cf.br", format = "$dest (`(` $destOperands^ `:` type($destOperands) `)`)? attr-dict")]
pub struct Br<'a> {
    #[successor]
    pub dest: Str<'a>,
    #[slot(dest_types)]
    pub dest_operands: Vec<Value<'a>>,
    #[dtype]
    pub dest_types: Vec<Type<'a>>,
}

#[mlir::op(
    "cf.cond_br",
    format = "$condition (`weights` `(` $branch_weights^ `)`)? `,` $trueDest (`(` $trueDestOperands^ `:` type($trueDestOperands) `)`)? `,` $falseDest (`(` $falseDestOperands^ `:` type($falseDestOperands) `)`)? attr-dict"
)]
pub struct CondBr<'a> {
    #[slot(condition_ty)]
    pub condition: Value<'a>,
    #[attr(name = "branch_weights")]
    pub branch_weights: Option<Vec<i32>>,
    #[successor]
    pub true_dest: Str<'a>,
    #[slot(true_types)]
    pub true_dest_operands: Vec<Value<'a>>,
    #[successor]
    pub false_dest: Str<'a>,
    #[slot(false_types)]
    pub false_dest_operands: Vec<Value<'a>>,
    #[dtype(i1)]
    pub condition_ty: Type<'a>,
    #[dtype]
    pub true_types: Vec<Type<'a>>,
    #[dtype]
    pub false_types: Vec<Type<'a>>,
}

/// The `cf` dialect.
#[mlir::dialect("cf")]
pub enum Cf<'a> {
    Br(Br<'a>),
    CondBr(CondBr<'a>),
}
