//! ⭐ The central converter and the crate's whole public surface: an [`MlirOpt`] holds the
//! registered dialects and the op table, and converts between MLIR text, [`Module`] /
//! [`Operation`], and typed ops.
//!
//! ```ignore
//! let mut opt = MlirOpt::upstream();               // arith, builtin, cf, complex, func, index, math, ub
//! opt.register::<MyDialect>();                     // a whole dialect (`#[mlir::dialect]`)
//! opt.inject(MyOp::template());                    // one op (`#[mlir::op]`)
//! let m = opt.parse(src)?;                         // text → Module (known ops structured)
//! let text = opt.show(&m).to_string();             // Module → text (known ops in custom form)
//! let op: MyOp = (&m_op).try_into()?;              // Operation → typed op
//! opt.unregister("my");
//! ```

use alloc::collections::BTreeMap;
use alloc::string::String;
use alloc::vec::Vec;
use core::fmt;

pub use crate::common::*;
pub use crate::dialects::{affine, affine_ops, arith, builtin, cf, complex, func, gpu, index, math, memref, pdl, r#async, scf, tensor, ub, vector};
pub use crate::generator::{Emit, Printer, Sep, Shown, ShownIn, Spacer};
pub use crate::parser::{Parser, R, Read};

/// The parameter hook of a registered dialect.
type Params = for<'a> fn(SymKind, &str, &mut Parser<'a, '_>) -> Option<R<Vec<Attribute<'a>>>>;

/// A registered dialect: its parameter hook and the ops it brought.
#[derive(Clone)]
struct Plugin {
    params: Params,
    ops: Vec<&'static str>,
}

/// ⭐ Dialect registry + op table + conversions.
#[derive(Clone, Default)]
pub struct MlirOpt {
    dialects: BTreeMap<&'static str, Plugin>,
    ops: BTreeMap<&'static str, Template>,
}

impl MlirOpt {
    /// No dialects: every op stays generic or raw.
    pub const fn new() -> Self {
        Self { dialects: BTreeMap::new(), ops: BTreeMap::new() }
    }

    /// The upstream dialects this crate describes: `affine`, `arith`, `async`, `builtin`, `cf`,
    /// `complex`, `func`, `gpu`, `index`, `math`, `memref`, `pdl`, `scf`, `tensor`, `ub`,
    /// `vector`.
    pub fn upstream() -> Self {
        let mut opt = Self::new();
        opt.register::<arith::Arith>()
            .register::<func::Func>()
            .register::<cf::Cf>()
            .register::<builtin::Builtin>()
            .register::<math::Math>()
            .register::<index::Index>()
            .register::<ub::Ub>()
            .register::<complex::Complex>()
            .register::<affine::Affine>()
            .register::<r#async::Async>()
            .register::<gpu::Gpu>()
            .register::<memref::Memref>()
            .register::<pdl::Pdl>()
            .register::<scf::Scf>()
            .register::<tensor::Tensor>()
            .register::<vector::Vector>();
        // Hand-written forms for ops ODS describes in C++; injected by name over the generated
        // templates, so the generated files stay exactly as `mlirformat tblgen` wrote them.
        opt.inject(affine_ops::Apply::template())
            .inject(affine_ops::Min::template())
            .inject(affine_ops::Max::template())
            .inject(affine_ops::Load::template())
            .inject(affine_ops::Store::template())
            .inject(affine_ops::For::template())
            .inject(affine_ops::If::template())
            .inject(affine_ops::Parallel::template());
        opt
    }

    // ---- registry ----------------------------------------------------------------------

    /// Registers dialect `D` and injects its op table (replacing an earlier registration).
    pub fn register<D: Dialect>(&mut self) -> &mut Self {
        self.unregister(D::NAMESPACE);
        let templates = D::ops();
        let ops = templates.iter().map(|t| t.name).collect();
        self.ops.extend(templates.into_iter().map(|t| (t.name, t)));
        self.dialects.insert(D::NAMESPACE, Plugin { params: D::parse_params, ops });
        self
    }

    /// Unregisters dialect `ns` and ejects the ops it brought; whether it was registered.
    pub fn unregister(&mut self, ns: &str) -> bool {
        let Some(plugin) = self.dialects.remove(ns) else { return false };
        self.ops.retain(|name, _| !plugin.ops.contains(name));
        true
    }

    /// Injects one op's template into the op table.
    pub fn inject(&mut self, t: Template) -> &mut Self {
        self.ops.insert(t.name, t);
        self
    }

    /// Removes an op from the op table.
    pub fn eject(&mut self, name: &str) -> Option<Template> {
        self.ops.remove(name)
    }

    pub fn template(&self, name: &str) -> Option<&Template> {
        self.ops.get(name)
    }

    /// Registered namespaces.
    pub fn namespaces(&self) -> impl Iterator<Item = &'static str> + '_ {
        self.dialects.keys().copied()
    }

    /// Op names in the table.
    pub fn op_names(&self) -> impl Iterator<Item = &'static str> + '_ {
        self.ops.keys().copied()
    }

    pub(crate) fn params(&self, ns: &str) -> Option<Params> {
        self.dialects.get(ns).map(|d| d.params)
    }

    // ---- conversions -------------------------------------------------------------------

    /// Text → module; ops in the table are structured from their custom form.
    pub fn parse<'a>(&self, src: &'a str) -> R<Module<'a>> {
        Parser::new(src, self).all(Parser::module)
    }

    /// Text → one op.
    pub fn parse_op<'a>(&self, src: &'a str) -> R<Operation<'a>> {
        Parser::new(src, self).all(Parser::op)
    }

    /// Like [`parse_op`](Self::parse_op), with a module's attribute aliases in scope.
    pub fn parse_op_in<'a>(&self, aliases: &[(String, String)], src: &'a str) -> R<Operation<'a>> {
        Parser::new(src, self).with_aliases(aliases).all(Parser::op)
    }

    /// Like [`show`](Self::show), with a module's attribute aliases in scope.
    pub fn show_in<'x, T: Emit + ?Sized>(&'x self, aliases: &'x [(String, String)], x: &'x T) -> ShownIn<'x, T> {
        ShownIn(self, aliases, x)
    }

    /// Module / op → text, ops in the table in custom form: `opt.show(&m).to_string()`.
    pub fn show<'x, T: Emit + ?Sized>(&'x self, x: &'x T) -> Shown<'x, T> {
        Shown(self, x)
    }
}

impl Template {
    /// ⭐ The blueprint of typed op `O` (what `O::template()` returns).
    pub fn of<O: Op + 'static>() -> Self {
        Self { name: O::NAME, custom: O::CUSTOM, parse: Self::parse_as::<O>, print: Self::print_as::<O> }
    }

    fn parse_as<'a, O: Op>(p: &mut Parser<'a, '_>) -> R<Operation<'a>> {
        let op = O::parse(p)?;
        Operation::of_op(&op).or_else(|e| p.err(e.0))
    }

    /// The custom form, or `None` (the op then prints generic) when it does not fit `O` or `O`
    /// cannot print it.
    fn print_as<O: Op>(op: &Operation<'_>, p: &mut Printer<'_, '_>) -> Option<fmt::Result> {
        O::CUSTOM.then_some(())?;
        let typed = op.to_op::<O>().ok()?;
        let mut text = alloc::string::String::new();
        typed.print(&mut p.fork(&mut text)).ok()?;
        Some(fmt::Write::write_str(p, &text))
    }
}

impl fmt::Debug for Template {
    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
        write!(f, "Template({})", self.name)
    }
}

impl fmt::Debug for MlirOpt {
    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
        f.debug_struct("MlirOpt").field("dialects", &self.dialects.keys()).field("ops", &self.ops.keys()).finish()
    }
}
