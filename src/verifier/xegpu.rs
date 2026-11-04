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
        ScatterTdesc = "scatter_tdesc_attr",
    }
}

/// `uArch::generalPackedFormatBitSize`.
const PACKED_FORMAT_BITS: u32 = 32;

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

/// `computeShapeRatio`: `shape / sub`, trailing dims aligned, when every one divides.
fn ratio(shape: &[i64], sub: &[i64]) -> Option<Vec<i64>> {
    if shape.len() < sub.len() || sub.iter().any(|s| *s <= 0) {
        return None;
    }
    let lead = shape.len() - sub.len();
    let mut out = shape[..lead].to_vec();
    for (s, d) in shape[lead..].iter().zip(sub) {
        if s % d != 0 {
            return None;
        }
        out.push(s / d);
    }
    Some(out)
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
            _ if sd.is_some() && sl.is_none() => "expected sg_layout being used with sg_data",
            _ if differ(sd, sl) => "expected sg_data and sg_layout to have the same rank",
            _ if ld.is_some() && ll.is_none() => "expected lane_layout being used with lane_data",
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

    /// `XeGPUDialect::isEvenlyDistributable`.
    fn distributes(&self, shape: &[i64]) -> bool {
        let get = |x: &Option<Vec<i64>>| x.clone().unwrap_or_default();
        let step = |shape: &[i64], layout: Vec<i64>, data: Vec<i64>, rr: bool| -> Option<Vec<i64>> {
            let mut next = shape.to_vec();
            if !layout.is_empty() {
                if layout.len() != shape.len() {
                    return None;
                }
                match ratio(shape, &layout) {
                    Some(r) => next = r,
                    None if rr && ratio(&layout, shape).is_some() => {}
                    None => return None,
                }
            }
            if !data.is_empty() {
                if data.len() != shape.len() {
                    return None;
                }
                if ratio(&next, &data).is_none() && !(rr && ratio(&data, &next).is_some()) {
                    return None;
                }
                next = data;
            }
            Some(next)
        };
        step(shape, get(&self.sg_layout), get(&self.sg_data), true)
            .and_then(|sg| step(&sg, Vec::new(), get(&self.inst_data), false))
            .and_then(|inst| step(&inst, get(&self.lane_layout), get(&self.lane_data), false))
            .is_some()
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
        let bits = elem.bit_width().unwrap_or(PACKED_FORMAT_BITS).max(1);
        let align = if bits < PACKED_FORMAT_BITS { i64::from(PACKED_FORMAT_BITS / bits) } else { 1 };
        let mut chunk = None;
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
                Some(AttrKind::ScatterTdesc) => chunk = Some(params(body).iter().find(|(k, _)| *k == "chunk_size").and_then(|(_, v)| v.split(':').next()?.trim().parse::<i64>().ok()).unwrap_or(1)),
                // An alias or another dialect's attribute: not read here.
                None => {}
            }
        }
        let last = *shape.last().unwrap_or(&0);
        if let Some(c) = chunk {
            if shape.len() == 1 && c != 1 {
                return Err("expected non-contiguous elements for 1D tensor".into());
            }
            if c > 1 && last != c {
                return Err("expected last dim of tensor to match chunk size".into());
            }
            if c > 1 && last % align != 0 {
                return Err(alloc::format!("expected last dim of tensor to be a multiple of {align}"));
            }
        }
        if let Some(l) = layout {
            if shape.len() != l.rank() {
                return Err("expected layout rank to match tensor rank".into());
            }
            if let (Some(c), Some(ld)) = (chunk, &l.lane_data)
                && c > 1
                && ld.last().is_some_and(|d| d % align != 0)
            {
                return Err(alloc::format!("expected last dim of lane_data to be a multiple of: {align}"));
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
            Ok(AttrKind::ScatterTdesc) => match params(body).iter().find(|(k, _)| *k == "chunk_size").and_then(|(_, v)| v.split(':').next()?.trim().parse::<i64>().ok()) {
                Some(c) if c <= 0 => Err("invalid chunk size".into()),
                _ => Ok(()),
            },
            _ => Ok(()),
        };
        r.map_err(|why| Invalid::DialectAttr { attr: a.to_string(), why })
    }
}
