use alloc::collections::BTreeMap;
use alloc::string::String;
use alloc::sync::Arc;
use alloc::vec::Vec;
use core::fmt;

pub use crate::common::*;
pub use crate::dialects::{affine, affine_ops, arith, bufferization, bufferization_ops as bufferization_hand, scf_ops as scf_hand, vector_ops as vector_hand, gpu_ops as gpu_hand, llvm_ops as llvm_hand, linalg_ops as linalg_hand, builtin, cf, complex, emitc, emitc_types, func, gpu, index, linalg, llvm, llvm_types, math, memref, pdl, r#async, scf, shape, spirv, spirv_types, tensor, tosa, ub, vector, x86, amdgpu, arm_neon, arm_sme, arm_sve, apple9, glsl, image, isa, nir, nvgpu, nvvm, rocdl, xegpu, xevm};
pub use crate::generator::{Emit, IntoStatic, Printer, Reborrow, Sep, Shown, ShownFrom, ShownIn, Source, Signature, Spacer, Untyped};
pub use crate::parser::{Fields, Parser, R, Read};

#[derive(Clone)]
struct Loaded {
    dialect: Arc<dyn Dialect>,
    ops: Vec<&'static str>,
}

#[derive(Clone, Default)]
pub struct MlirOpt {
    dialects: BTreeMap<&'static str, Loaded>,
    ops: BTreeMap<&'static str, Template>,
    formats: BTreeMap<&'static str, Arc<Format<'static>>>,
    infos: crate::OpInfos,
}

impl MlirOpt {
    #[inline]
    pub fn dialect(&self, ns: &str) -> Option<&dyn Dialect> {
        self.dialects.get(ns).map(|d| &*d.dialect)
    }

    #[inline]
    pub fn op_info(&self, name: &str) -> Option<&crate::OpInfo> {
        self.infos.op_info(name)
    }

    #[inline]
    pub fn knows_dialect(&self, ns: &str) -> bool {
        self.infos.knows_dialect(ns)
    }

    #[inline]
    pub fn knows_dialect_of(&self, op: &str) -> bool {
        op.split_once('.').is_some_and(|(ns, _)| self.knows_dialect(ns))
    }

    #[inline]
    pub fn defaults(&self, op: &str) -> Vec<NamedAttr<'static>> {
        self.template(op).map_or_else(Vec::new, |t| (t.defaults)())
    }

    #[inline]
    pub fn infos_mut(&mut self) -> &mut crate::OpInfos {
        &mut self.infos
    }

    #[inline]
    pub const fn new() -> Self {
        Self { dialects: BTreeMap::new(), ops: BTreeMap::new(), formats: BTreeMap::new(), infos: crate::OpInfos::new() }
    }

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
            .load(spirv::SpirvDialect)
            .load(tosa::TosaDialect)
            .load(vector::VectorDialect)
            .load(x86::X86Dialect)
            .load(arm_neon::ArmNeonDialect)
            .load(arm_sve::ArmSveDialect)
            .load(arm_sme::ArmSmeDialect)
            .load(nvgpu::NvgpuDialect)
            .load(nvvm::NvvmDialect)
            .load(amdgpu::AmdgpuDialect)
            .load(rocdl::RocdlDialect)
            .load(xegpu::XegpuDialect)
            .load(xevm::XevmDialect);
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
            .inject(scf_hand::While::template())
            .inject(vector_hand::Shuffle::template())
            .inject(scf_hand::IndexSwitch::template())
            .inject(scf_hand::ExecuteRegion::template())
            .inject(bufferization_hand::MaterializeInDestination::template())
            .inject(gpu_hand::Func::template())
            .inject(gpu_hand::LaunchFunc::template())
            .inject(linalg_hand::Generic::template())
            .inject(linalg_hand::Yield::template());
        for t in llvm_hand::LlvmHand::templates() {
            opt.inject(t);
        }
        for t in linalg_hand::named_templates().into_iter().chain(linalg_hand::contraction_templates()).chain(linalg_hand::dst_templates()) {
            opt.inject(t);
        }
        opt
    }

    pub fn load(&mut self, dialect: impl Dialect + 'static) -> &mut Self {
        let ns = dialect.namespace();
        self.unregister(ns);
        let templates = dialect.ops();
        let ops = templates.iter().map(|t| t.name).collect();
        for t in templates {
            self.inject(t);
        }
        for info in dialect.op_infos() {
            self.infos.insert(info);
        }
        self.infos.dialect(ns);
        self.dialects.insert(ns, Loaded { dialect: Arc::new(dialect), ops });
        self
    }

    #[inline]
    pub fn unregister(&mut self, ns: &str) -> bool {
        let Some(loaded) = self.dialects.remove(ns) else { return false };
        self.ops.retain(|name, _| !loaded.ops.contains(name));
        self.formats.retain(|name, _| !loaded.ops.contains(name));
        true
    }

    #[inline]
    pub fn inject(&mut self, t: Template) -> &mut Self {
        match (t.format)() {
            Some(f) => self.formats.insert(t.name, Arc::new(f)),
            None => self.formats.remove(t.name),
        };
        self.ops.insert(t.name, t);
        self
    }

    #[inline]
    pub fn eject(&mut self, name: &str) -> Option<Template> {
        self.formats.remove(name);
        self.ops.remove(name)
    }

    #[inline]
    pub fn format(&self, name: &str) -> Option<&Format<'static>> {
        self.formats.get(name).map(|f| &**f)
    }

    #[inline]
    pub fn template(&self, name: &str) -> Option<&Template> {
        self.ops.get(name)
    }

    #[inline]
    pub fn namespaces(&self) -> impl Iterator<Item = &'static str> + '_ {
        self.dialects.keys().copied()
    }

    #[inline]
    pub fn op_names(&self) -> impl Iterator<Item = &'static str> + '_ {
        self.ops.keys().copied()
    }

    #[inline]
    pub fn parse<'a>(&self, src: &'a str) -> R<Module<'a>> {
        Parser::new(src, self).all(Parser::module)
    }

    #[inline]
    pub fn parse_file<'a>(&self, src: &'a str, name: &str) -> R<Module<'a>> {
        Parser::new(src, self).with_file(name).all(Parser::module)
    }

    #[inline]
    pub fn parse_file_in<'a, X: moremath::Executor + Sync>(&self, src: &'a str, name: &str, x: &X) -> R<Module<'a>> {
        Parser::new(src, self).with_file(name).with_fork(x).all(Parser::module)
    }

    pub const PARALLEL_BYTES: usize = 1 << 16;

    #[inline]
    pub fn parse_in<'a, X: moremath::Executor + Sync>(&self, src: &'a str, x: &X) -> R<Module<'a>> {
        Parser::new(src, self).with_fork(x).all(Parser::module)
    }

    #[inline]
    pub fn parse_op<'a>(&self, src: &'a str) -> R<Operation<'a>> {
        Parser::new(src, self).all(Parser::op)
    }

    #[inline]
    pub fn parse_op_in<'a>(&self, aliases: &[(String, String)], src: &'a str) -> R<Operation<'a>> {
        Parser::new(src, self).with_aliases(aliases).all(Parser::op)
    }

    #[inline]
    pub fn show_in<'x, T: Emit + ?Sized>(&'x self, aliases: &'x [(String, String)], x: &'x T) -> ShownIn<'x, T> {
        ShownIn(self, aliases, x)
    }

    #[inline]
    pub fn show_from<'x, T: Emit + ?Sized>(&'x self, x: &'x T, source: &'x dyn Source) -> ShownFrom<'x, T> {
        ShownFrom(self, x, source)
    }

    #[inline]
    pub fn print_in<T: Emit + ?Sized, X: moremath::Executor + Sync>(&self, x: &T, source: &(dyn Source + Sync), exec: &X) -> Result<String, fmt::Error> {
        ShownFrom(self, x, source).text_in(source, exec)
    }

    #[inline]
    pub fn show<'x, T: Emit + ?Sized>(&'x self, x: &'x T) -> Shown<'x, T> {
        Shown(self, x)
    }
}

impl Template {
    #[inline]
    pub fn of<O: Op + 'static>() -> Self {
        Self { name: O::NAME, custom: O::CUSTOM, parse: Self::parse_as::<O>, print: Self::print_as::<O>, defaults: Self::defaults_of::<O>, format: Self::format_of::<O> }
    }

    #[inline]
    fn format_of<O: Op>() -> Option<Format<'static>> {
        (O::CUSTOM && !O::FORMAT.is_empty()).then(|| Format::of::<O>().ok()).flatten()
    }

    #[inline]
    fn defaults_of<O: Op>() -> Vec<NamedAttr<'static>> {
        Schema::of::<O>().defaults()
    }

    #[inline]
    fn parse_as<'a, O: Op>(p: &mut Parser<'a, '_>) -> R<Operation<'a>> {
        if O::CUSTOM && !O::FORMAT.is_empty() {
            let opt = p.opt();
            return p.lending(
                |p| match opt.format(O::NAME) {
                    Some(f) => f.parse_op(p),
                    None => Format::of::<O>().or_else(|e| p.err(e.0))?.parse_op(p),
                },
                Ok,
            );
        }
        p.lending(O::parse, |op| Operation::of_owned_op(op).map(|o| -> Operation<'a> { o }))
    }

    fn print_as<O: Op>(op: &Operation<'_>, p: &mut Printer<'_, '_>) -> Option<fmt::Result> {
        O::CUSTOM.then_some(())?;
        match O::FORMAT {
            "" => {
                let expanded = p.expanded(op);
                let op = expanded.as_ref().unwrap_or(op);
                let typed = op.hollow().to_op::<O>().ok()?;
                p.attempt(&op.regions, |q| Some(typed.print(q)))
            }
            _ => {
                let opt = p.opt();
                let built;
                let format = match opt.format(O::NAME) {
                    Some(f) => f,
                    None => {
                        built = Format::of::<O>().ok()?;
                        &built
                    }
                };
                p.attempt(&[], |q| Some(format.print_op(op, q).map_err(|_| fmt::Error)))
            }
        }
    }
}

impl fmt::Debug for Template {
    #[inline]
    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
        write!(f, "Template({})", self.name)
    }
}

impl fmt::Debug for MlirOpt {
    #[inline]
    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
        f.debug_struct("MlirOpt").field("dialects", &self.dialects.keys()).field("ops", &self.ops.keys()).finish()
    }
}
