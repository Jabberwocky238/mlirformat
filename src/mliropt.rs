//! ⭐ The central converter and the crate's whole public surface: an [`MlirOpt`] holds the
//! registered dialects and the op table, and converts between MLIR text, [`Module`] /
//! [`Operation`], and typed ops.
//!
//! ```ignore
//! let mut opt = MlirOpt::upstream();               // arith, builtin, cf, complex, func, index, math, ub
//! opt.load(MyDialect);                            // a whole dialect (`#[mlir::dialect]` struct)
//! opt.inject(MyOp::template());                    // one op (`#[mlir::op]`)
//! let m = opt.parse(src)?;                         // text → Module (known ops structured)
//! let text = opt.show(&m).to_string();             // Module → text (known ops in custom form)
//! let op: MyOp = (&m_op).try_into()?;              // Operation → typed op
//! opt.unregister("my");
//! ```

use alloc::collections::BTreeMap;
use alloc::string::String;
use alloc::sync::Arc;
use alloc::vec::Vec;
use core::fmt;

pub use crate::common::*;
pub use crate::dialects::{affine, affine_ops, arith, bufferization, scf_ops as scf_hand, gpu_ops as gpu_hand, linalg_ops as linalg_hand, builtin, cf, complex, emitc, emitc_types, func, gpu, index, linalg, llvm, llvm_types, math, memref, pdl, r#async, scf, shape, spirv_types, tensor, tosa, ub, vector};
pub use crate::generator::{Emit, Printer, Sep, Shown, ShownIn, Spacer};
pub use crate::parser::{Parser, R, Read};

/// A loaded dialect, and the ops it brought.
#[derive(Clone)]
struct Loaded {
    dialect: Arc<dyn Dialect>,
    ops: Vec<&'static str>,
}

/// ⭐ Dialect registry + op table + conversions.
#[derive(Clone, Default)]
pub struct MlirOpt {
    dialects: BTreeMap<&'static str, Loaded>,
    ops: BTreeMap<&'static str, Template>,
    /// What ODS says about each op, for whoever works on the IR.
    infos: crate::OpInfos,
}

impl MlirOpt {
    // ---- what the context knows ---------------------------------------------------------

    /// Loaded dialect `ns`.
    pub fn dialect(&self, ns: &str) -> Option<&dyn Dialect> {
        self.dialects.get(ns).map(|d| &*d.dialect)
    }

    /// Op `name`'s ODS facts (traits, effects, inherent attributes).
    pub fn op_info(&self, name: &str) -> Option<&crate::OpInfo> {
        self.infos.op_info(name)
    }

    /// Whether namespace `ns` is known (loaded, or among the upstream facts).
    pub fn knows_dialect(&self, ns: &str) -> bool {
        self.infos.knows_dialect(ns)
    }

    /// Whether op `op`'s dialect is known (its ops may still be unregistered).
    pub fn knows_dialect_of(&self, op: &str) -> bool {
        op.split_once('.').is_some_and(|(ns, _)| self.knows_dialect(ns))
    }

    /// The default-valued properties of op `op`, with their defaults (what its ODS builders set).
    pub fn defaults(&self, op: &str) -> Vec<NamedAttr<'static>> {
        self.template(op).map_or_else(Vec::new, |t| (t.defaults)())
    }

    /// The op facts this context knows, to register more.
    pub fn infos_mut(&mut self) -> &mut crate::OpInfos {
        &mut self.infos
    }

    /// No dialects: every op stays generic or raw.
    pub const fn new() -> Self {
        Self { dialects: BTreeMap::new(), ops: BTreeMap::new(), infos: crate::OpInfos::new() }
    }

    /// The upstream dialects this crate describes: `affine`, `arith`, `async`, `builtin`, `cf`,
    /// `complex`, `func`, `gpu`, `index`, `math`, `memref`, `pdl`, `scf`, `tensor`, `ub`,
    /// `vector`.
    pub fn upstream() -> Self {
        let mut opt = Self::new();
        opt.infos = crate::OpInfos::upstream();
        opt.load(arith::ArithDialect)
            .load(func::FuncDialect)
            .load(cf::CfDialect)
            .load(builtin::BuiltinDialect)
            .load(math::MathDialect)
            .load(index::IndexDialect)
            .load(ub::UbDialect)
            .load(complex::ComplexDialect)
            .load(affine::AffineDialect)
            .load(r#async::AsyncDialect)
            .load(bufferization::BufferizationDialect)
            .load(emitc::EmitcDialect)
            .load(gpu::GpuDialect)
            .load(linalg::LinalgDialect)
            .load(llvm::LlvmDialect)
            .load(memref::MemrefDialect)
            .load(pdl::PdlDialect)
            .load(scf::ScfDialect)
            .load(shape::ShapeDialect)
            .load(tensor::TensorDialect)
            .load(tosa::TosaDialect)
            .load(vector::VectorDialect);
        // Hand-written forms for ops ODS describes in C++; injected by name over the generated
        // templates, so the generated files stay exactly as `mlirformat tblgen` wrote them.
        opt.inject(affine_ops::Apply::template())
            .inject(affine_ops::Min::template())
            .inject(affine_ops::Max::template())
            .inject(affine_ops::Load::template())
            .inject(affine_ops::Store::template())
            .inject(affine_ops::For::template())
            .inject(affine_ops::If::template())
            .inject(affine_ops::Parallel::template())
            .inject(scf_hand::For::template())
            .inject(scf_hand::If::template())
            .inject(gpu_hand::Func::template())
            .inject(gpu_hand::LaunchFunc::template())
            .inject(linalg_hand::Generic::template())
            .inject(linalg_hand::Yield::template());
        for t in linalg_hand::named_templates().into_iter().chain(linalg_hand::contraction_templates()).chain(linalg_hand::dst_templates()) {
            opt.inject(t);
        }
        opt
    }

    // ---- registry ----------------------------------------------------------------------

    /// ⭐ Loads `dialect`: its op table and its ops' ODS facts (replacing an earlier load).
    pub fn load(&mut self, dialect: impl Dialect + 'static) -> &mut Self {
        let ns = dialect.namespace();
        self.unregister(ns);
        let templates = dialect.ops();
        let ops = templates.iter().map(|t| t.name).collect();
        self.ops.extend(templates.into_iter().map(|t| (t.name, t)));
        for info in dialect.op_infos() {
            self.infos.insert(info);
        }
        self.infos.dialect(ns);
        self.dialects.insert(ns, Loaded { dialect: Arc::new(dialect), ops });
        self
    }

    /// Unloads dialect `ns` and ejects the ops it brought; whether it was loaded.
    pub fn unregister(&mut self, ns: &str) -> bool {
        let Some(loaded) = self.dialects.remove(ns) else { return false };
        self.ops.retain(|name, _| !loaded.ops.contains(name));
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
        Self { name: O::NAME, custom: O::CUSTOM, parse: Self::parse_as::<O>, print: Self::print_as::<O>, defaults: Self::defaults_of::<O> }
    }

    fn defaults_of<O: Op>() -> Vec<NamedAttr<'static>> {
        let Ok(schema) = Schema::of::<O>() else { return Vec::new() };
        schema.of_role(|r| matches!(r, Role::Prop { .. })).filter_map(|f| f.default_attr().map(|a| NamedAttr::of(f.name, a))).collect()
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
