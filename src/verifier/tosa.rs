use alloc::string::{String, ToString};

use super::{DialectRules, Invalid, Verifier};
use crate::{Attribute, Extended, Operation, Parser, Piece, R, Signedness, Type};

pub(super) struct Tosa;

impl Tosa {
    fn cond_if(p: &mut Parser<'_, '_>) -> R<()> {
        p.value()?;
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

impl Tosa {
    fn block_scaled<'a>(p: &mut Parser<'a, '_>) -> R<(Type<'a>, Type<'a>, bool)> {
        p.expect("<")?;
        p.ident()?;
        p.expect(":")?;
        let scale = p.ty()?;
        p.expect(":")?;
        let value = p.ty()?;
        let scales = p.eat(",");
        if scales {
            p.expect("{")?;
            loop {
                p.ws();
                let lit = p.rest();
                let end = lit.find(|c: char| !(c.is_ascii_alphanumeric() || matches!(c, '.' | '-' | '+'))).unwrap_or(lit.len());
                let lit = &lit[..end];
                let Ok(v) = lit.parse::<f64>() else { return p.err("expected floating point literal") };
                if !lit.contains(['.', 'e', 'E']) {
                    return p.err("unexpected decimal integer literal for a floating point value");
                }
                if v < 0.0 {
                    return p.err(alloc::format!("scale value must be non-negative, got {v}"));
                }
                p.seek(p.pos() + end);
                if p.eat(":") && p.ty()? != scale {
                    return p.err(alloc::format!("parsed attribute type does not match expected scale type {scale}"));
                }
                if !p.eat(",") {
                    break;
                }
            }
            p.expect("}")?;
        }
        p.expect(">")?;
        Ok((scale, value, scales))
    }

    pub(super) fn dense_element(elem: &Type<'_>, a: &Attribute<'_>) -> Option<bool> {
        let Some(Extended { name, body, .. }) = elem.extended() else { return None };
        match &**name {
            "tosa.mxint8" => Some(matches!(a, Attribute::Int { ty: Some(Type::Integer { signedness: Signedness::Signless, width: 8 }), .. })),
            "tosa.block_scaled" => {
                let Ok((_, value, _)) = Parser::read(body.as_deref()?, Self::block_scaled) else { return Some(false) };
                match value {
                    Type::Extended(_) => Self::dense_element(&value, a),
                    v => Some(matches!(a, Attribute::Float { ty: Some(t), .. } if *t == v)),
                }
            }
            _ => None,
        }
    }
}

impl DialectRules for Tosa {
    #[inline]
    fn namespace(&self) -> &'static str {
        "tosa"
    }

    fn ty(&self, _v: &Verifier<'_>, t: &Type<'_>) -> Result<(), Invalid> {
        match t {
            Type::Extended(e) if let Extended { name, body: Some(body), .. } = &**e && name == "tosa.block_scaled" => {
                Parser::read(body, Self::block_scaled).map(drop).map_err(|e| Invalid::DialectType { ty: t.to_string(), why: e.to_string() })
            }
            _ => Ok(()),
        }
    }

    fn op(&self, v: &Verifier<'_>, op: &Operation<'_>) -> Result<(), Invalid> {
        let Some(raw) = op.raw.as_ref().filter(|_| op.name == "tosa.cond_if") else { return Ok(()) };
        let text: String = raw.iter().map_while(|p| if let Piece::Text(t) = p { Some(&**t) } else { None }).collect();
        let mut p = Parser::new(&text, v.opt);
        Self::cond_if(&mut p).map_err(|e| Invalid::DialectOp { op: op.name.to_string(), why: e.placed(&text).to_string() })
    }
}
