//! `tosa` ops with a C++ parser, as `mlir-opt` reads them: `tosa.cond_if` (`IfOp::parse` in
//! `Tosa/IR/TosaOps.cpp`).

use alloc::string::{String, ToString};

use super::{DialectRules, Invalid, Verifier};
use crate::{Operation, Parser, Piece, R};

/// The `tosa` dialect's rules.
pub(super) struct Tosa;

impl Tosa {
    /// `tosa.cond_if %c (%a = %x, ..)? : T (fn type)?` or `: T (-> types)?`, before its regions.
    fn cond_if(p: &mut Parser<'_, '_>) -> R<()> {
        p.value()?;
        // `parseOptionalAssignmentList`: how many operands it binds.
        let mut operands = None;
        if p.eat("(") {
            let mut n = 0;
            if !p.eat(")") {
                loop {
                    p.sigil('%')?;
                    p.expect("=")?;
                    p.value()?;
                    n += 1;
                    if !p.eat(",") {
                        break;
                    }
                }
                p.expect(")")?;
            }
            operands = Some(n);
        }
        if !p.eat(":") {
            return p.err("expected type for condition operand");
        }
        p.ty().or_else(|_| p.err("expected type for condition operand"))?;
        match operands {
            Some(n) => {
                let f = p.fn_ty().or_else(|_| p.err("expected list of types for block arguments followed by arrow type and list of return types"))?;
                if f.inputs.len() != n {
                    return p.err(alloc::format!("expected as many input types as operands (expected {n} got {})", f.inputs.len()));
                }
            }
            None if p.eat("->") => drop(p.results_ty()?),
            None => {}
        }
        Ok(())
    }
}

impl DialectRules for Tosa {
    #[inline]
    fn namespace(&self) -> &'static str {
        "tosa"
    }

    fn op(&self, v: &Verifier<'_>, op: &Operation<'_>) -> Result<(), Invalid> {
        let Some(raw) = op.raw.as_ref().filter(|_| op.name == "tosa.cond_if") else { return Ok(()) };
        let text: String = raw.iter().map_while(|p| if let Piece::Text(t) = p { Some(&**t) } else { None }).collect();
        let mut p = Parser::new(&text, v.opt);
        Self::cond_if(&mut p).map_err(|e| Invalid::DialectOp { op: op.name.to_string(), why: e.placed(&text).to_string() })
    }
}
