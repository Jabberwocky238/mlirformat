//! XeGPU types and attributes as `mlir-opt` reads them: `#xegpu.layout` (`LayoutAttr::verify`),
//! `#xegpu.scatter_tdesc_attr` (`ScatterTensorDescAttr::verify`) and `!xegpu.tensor_desc`
//! (`TensorDescType::parse` / `verify`), in `XeGPU/IR/XeGPUDialect.cpp`.

use alloc::string::{String, ToString};
use alloc::vec::Vec;

use super::{DialectRules, Invalid, Verifier};
use crate::{Attribute, MlirOpt, Parser, Type};

keywords! {
    /// The `#xegpu.layout` parameters.
    enum LayoutKey {
        SgLayout = "sg_layout",
        SgData = "sg_data",
        InstData = "inst_data",
        LaneLayout = "lane_layout",
        LaneData = "lane_data",
        Order = "order",
    }
}

keywords! {
    /// The XeGPU attributes checked here.
    enum AttrKind {
        Layout = "layout",
        BlockTdesc = "block_tdesc_attr",
    }
}

/// `#xegpu.layout<..>`'s parameters; absent ones empty (`getEffective*AsInt`).
#[derive(Default)]
struct Layout {
    sg_layout: Option<Vec<i64>>,
    sg_data: Option<Vec<i64>>,
    inst_data: Option<Vec<i64>>,
    lane_layout: Option<Vec<i64>>,
    lane_data: Option<Vec<i64>>,
    order: Option<Vec<i64>>,
}

impl Layout {
    /// The body `<sg_layout = [2, 4], ...>`.
    fn read(opt: &MlirOpt, body: &str) -> Result<Self, String> {
        let mut p = Parser::new(body, opt);
        let mut l = Layout::default();
        let r: crate::R<()> = (|| {
            p.expect("<")?;
            loop {
                let key = p.ident()?;
                let Ok(key) = LayoutKey::try_from(key) else { return p.err(alloc::format!("unknown layout parameter `{key}`")) };
                p.expect("=")?;
                p.expect("[")?;
                let mut xs = Vec::new();
                if !p.eat("]") {
                    loop {
                        let neg = p.eat("-");
                        let n: i64 = p.number()?;
                        xs.push(if neg { -n } else { n });
                        if !p.eat(",") {
                            break;
                        }
                    }
                    p.expect("]")?;
                }
                let slot = match key {
                    LayoutKey::SgLayout => &mut l.sg_layout,
                    LayoutKey::SgData => &mut l.sg_data,
                    LayoutKey::InstData => &mut l.inst_data,
                    LayoutKey::LaneLayout => &mut l.lane_layout,
                    LayoutKey::LaneData => &mut l.lane_data,
                    LayoutKey::Order => &mut l.order,
                };
                *slot = Some(xs);
                if !p.eat(",") {
                    break;
                }
            }
            p.expect(">")?;
            p.ws();
            if p.rest().is_empty() { Ok(()) } else { p.err("expected end of the attribute") }
        })();
        r.map(|()| l).map_err(|e| e.placed(body).to_string())
    }

    /// `LayoutAttr::verify`.
    fn verify(&self) -> Result<(), String> {
        let len = |x: &Option<Vec<i64>>| x.as_ref().map(Vec::len);
        let (sl, sd, id, ll, ld, or) = (len(&self.sg_layout), len(&self.sg_data), len(&self.inst_data), len(&self.lane_layout), len(&self.lane_data), len(&self.order));
        let differ = |a: Option<usize>, b: Option<usize>| a.zip(b).is_some_and(|(a, b)| a != b);
        let why = match () {
            _ if sl.is_none() && id.is_none() && ll.is_none() => "expected at least one of sg_layout, inst_data or lane_layout",
            _ if differ(sl, id) => "expected sg_layout and inst_data to have the same rank",
            _ if differ(sl, ll) => "expected sg_layout and lane_layout to have the same rank",
            _ if differ(id, ll) => "expected inst_data and lane_layout to have the same rank",
            _ if sl.is_some() != sd.is_some() => "sg_layout and sg_data must be used together",
            _ if differ(sd, sl) => "expected sg_data and sg_layout to have the same rank",
            _ if ll.is_some() != ld.is_some() => "lane_layout and lane_data must be used together",
            _ if differ(ld, ll) => "expected lane_data and lane_layout to have the same rank",
            _ if or.is_some() && sl.is_none() && ll.is_none() => "expected sg_layout/lane_layout being used with order",
            _ if differ(or, sl) => "expected order and sg_layout to have the same rank",
            _ if differ(or, ll) => "expected order and lane_layout to have the same rank",
            _ => return Ok(()),
        };
        Err(why.into())
    }

    /// `getRank`.
    fn rank(&self) -> usize {
        [&self.sg_layout, &self.inst_data, &self.lane_layout].into_iter().find_map(|x| x.as_ref().map(Vec::len)).unwrap_or(0)
    }

    /// `DistributeLayoutAttr::isDistributable`: over subgroups (`sg_layout` / `sg_data`), then
    /// instructions (`inst_data`), then lanes (`lane_layout` / `lane_data`).
    fn distributes(&self, shape: &[i64]) -> bool {
        let get = |x: &Option<Vec<i64>>| x.clone().unwrap_or_default();
        let mut cur = shape.to_vec();
        if self.sg_layout.is_some() {
            let Some(next) = Self::distributed(&cur, &get(&self.sg_layout), &get(&self.sg_data)) else { return false };
            cur = next;
            // `dropSgLayoutAndData`: nothing left.
            if self.inst_data.is_none() && self.lane_layout.is_none() {
                return true;
            }
        }
        if let Some(inst) = &self.inst_data {
            if inst.len() != cur.len() || cur.iter().zip(inst).any(|(d, i)| *i == 0 || d % i != 0) {
                return false;
            }
            cur.clone_from(inst);
            // `dropInstData` without a lane layout: nothing left.
            if self.lane_layout.is_none() {
                return true;
            }
        }
        Self::distributed(&cur, &get(&self.lane_layout), &get(&self.lane_data)).is_some()
    }

    /// `computeDistributedShape`: each dim divided by its `layout` factor when `layout × sub`
    /// divides it, or, wrapping around, exactly `sub`.
    fn distributed(shape: &[i64], layout: &[i64], sub: &[i64]) -> Option<Vec<i64>> {
        if sub.is_empty() || layout.len() < shape.len() || sub.len() < shape.len() {
            return None;
        }
        shape
            .iter()
            .zip(layout.iter().zip(sub))
            .map(|(&dim, (&l, &s))| match l.checked_mul(s).filter(|u| *u != 0) {
                Some(unit) if dim % unit == 0 => Some(dim / l).filter(|d| d % s == 0),
                _ => (dim == s).then_some(dim),
            })
            .collect()
    }
}

/// `memory_space = slm`, `chunk_size = 8`: an encoding's parameters, as text by name.
fn params(body: &str) -> Vec<(&str, &str)> {
    let inner = body.trim().strip_prefix('<').and_then(|b| b.strip_suffix('>')).unwrap_or("");
    inner.split(',').filter_map(|kv| kv.split_once('=')).map(|(k, v)| (k.trim(), v.trim())).collect()
}

/// The XeGPU dialect's rules.
pub(super) struct XeGpu;

impl XeGpu {
    /// `!xegpu.tensor_desc<dims x T, encoding, layout>`.
    fn tensor_desc(opt: &MlirOpt, body: &str) -> Result<(), String> {
        let mut p = Parser::new(body, opt);
        let mut shape = Vec::new();
        let r: crate::R<(Type<'_>, Vec<Attribute<'_>>)> = (|| {
            p.expect("<")?;
            loop {
                p.ws();
                match p.rest().as_bytes().first() {
                    Some(b'?') => {
                        p.skip(1);
                        shape.push(-1);
                    }
                    Some(c) if c.is_ascii_digit() => shape.push(p.number()?),
                    _ => break,
                }
                p.ws();
                if !p.rest().starts_with('x') {
                    return p.err("expected 'x' in dimension list");
                }
                p.skip(1);
            }
            let elem = p.ty()?;
            let mut attrs = Vec::new();
            while p.eat(",") {
                attrs.push(p.attr()?);
            }
            p.expect(">")?;
            Ok((elem, attrs))
        })();
        let (elem, attrs) = r.map_err(|e| e.placed(body).to_string())?;
        if shape.is_empty() {
            return Err("expected non-zero rank tensor".into());
        }
        let mut layout = None;
        for a in &attrs {
            let Attribute::Extended { ext, .. } = a else { return Err(alloc::format!("unexpected attribute `{a}`")) };
            let body = ext.body.as_deref().unwrap_or("");
            match ext.name.strip_prefix("xegpu.").and_then(|m| AttrKind::try_from(m).ok()) {
                Some(AttrKind::Layout) => {
                    let l = Layout::read(opt, body)?;
                    l.verify()?;
                    layout = Some(l);
                }
                Some(AttrKind::BlockTdesc) => {
                    if shape.len() > 1 && params(body).iter().any(|(k, v)| *k == "memory_space" && *v == "slm") {
                        return Err("SLM is only supported for 1D block tensor".into());
                    }
                }
                // An alias or another dialect's attribute: not read here.
                None => {}
            }
        }
        if !matches!(elem, Type::Integer { .. } | Type::Float(_)) {
            return Err(alloc::format!("unsupported element type {elem}: expected integer or float"));
        }
        if let Some(l) = layout {
            if shape.len() != l.rank() {
                return Err("expected layout rank to match tensor rank".into());
            }
            if shape.iter().all(|d| *d > 0) && !l.distributes(&shape) {
                return Err(alloc::format!("cannot distribute {shape:?} using the layout"));
            }
        }
        Ok(())
    }
}

impl DialectRules for XeGpu {
    #[inline]
    fn namespace(&self) -> &'static str {
        "xegpu"
    }

    fn ty(&self, v: &Verifier<'_>, t: &Type<'_>) -> Result<(), Invalid> {
        match t {
            Type::Extended(e) if e.mnemonic() == "tensor_desc" => Self::tensor_desc(v.opt, e.body.as_deref().unwrap_or("")).map_err(|why| Invalid::DialectType { ty: t.to_string(), why }),
            _ => Ok(()),
        }
    }

    fn attr(&self, v: &Verifier<'_>, a: &Attribute<'_>) -> Result<(), Invalid> {
        let Attribute::Extended { ext, .. } = a else { return Ok(()) };
        let body = ext.body.as_deref().unwrap_or("");
        let r = match AttrKind::try_from(ext.mnemonic()) {
            Ok(AttrKind::Layout) => Layout::read(v.opt, body).and_then(|l| l.verify()),
            _ => Ok(()),
        };
        r.map_err(|why| Invalid::DialectAttr { attr: a.to_string(), why })
    }
}
