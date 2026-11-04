//! SPIR-V types as `mlir-opt` reads them: `SPIRVDialect::parseType` (`SPIRV/IR/SPIRVDialect.cpp`).

use alloc::string::{String, ToString};
use alloc::vec::Vec;

use super::{DialectRules, Invalid, Verifier};
use crate::{MlirOpt, Parser, R, ShapedKind, Type};

keywords! {
    /// The SPIR-V types.
    enum Kind {
        Array = "array",
        CoopMatrix = "coopmatrix",
        Image = "image",
        Ptr = "ptr",
        RtArray = "rtarray",
        SampledImage = "sampled_image",
        Struct = "struct",
        Matrix = "matrix",
        TensorArm = "arm.tensor",
    }
}

/// `StorageClass`'s cases (`SPIRVBase.td`).
const STORAGE_CLASSES: &[&str] = &[
    "UniformConstant", "Input", "Uniform", "Output", "Workgroup", "CrossWorkgroup", "Private", "Function",
    "Generic", "PushConstant", "AtomicCounter", "Image", "StorageBuffer", "CallableDataKHR", "IncomingCallableDataKHR", "RayPayloadKHR",
    "HitAttributeKHR", "IncomingRayPayloadKHR", "ShaderRecordBufferKHR", "PhysicalStorageBuffer", "TaskPayloadWorkgroupEXT", "CodeSectionINTEL", "DeviceOnlyINTEL", "HostOnlyINTEL",
];

/// `Dim`'s cases (`SPIRVBase.td`).
const DIMS: &[&str] = &[
    "Dim1D", "Dim2D", "Dim3D", "Cube", "Rect", "Buffer", "SubpassData",
];

/// `ImageDepthInfo`'s cases (`SPIRVBase.td`).
const DEPTHS: &[&str] = &[
    "NoDepth", "IsDepth", "DepthUnknown",
];

/// `ImageArrayedInfo`'s cases (`SPIRVBase.td`).
const ARRAYED: &[&str] = &[
    "NonArrayed", "Arrayed",
];

/// `ImageSamplingInfo`'s cases (`SPIRVBase.td`).
const SAMPLING: &[&str] = &[
    "SingleSampled", "MultiSampled",
];

/// `ImageSamplerUseInfo`'s cases (`SPIRVBase.td`).
const SAMPLER_USES: &[&str] = &[
    "SamplerUnknown", "NeedSampler", "NoSampler",
];

/// `ImageFormat`'s cases (`SPIRVBase.td`).
const FORMATS: &[&str] = &[
    "Unknown", "Rgba32f", "Rgba16f", "R32f", "Rgba8", "Rgba8Snorm", "Rg32f", "Rg16f",
    "R11fG11fB10f", "R16f", "Rgba16", "Rgb10A2", "Rg16", "Rg8", "R16", "R8",
    "Rgba16Snorm", "Rg16Snorm", "Rg8Snorm", "R16Snorm", "R8Snorm", "Rgba32i", "Rgba16i", "Rgba8i",
    "R32i", "Rg32i", "Rg16i", "Rg8i", "R16i", "R8i", "Rgba32ui", "Rgba16ui",
    "Rgba8ui", "R32ui", "Rgb10a2ui", "Rg32ui", "Rg16ui", "Rg8ui", "R16ui", "R8ui",
    "R64ui", "R64i",
];

/// `Scope`'s cases (`SPIRVBase.td`).
const SCOPES: &[&str] = &[
    "CrossDevice", "Device", "Workgroup", "Subgroup", "Invocation", "QueueFamily", "ShaderCallKHR",
];

/// `CooperativeMatrixUseKHR`'s cases (`SPIRVBase.td`).
const MATRIX_USES: &[&str] = &[
    "MatrixA", "MatrixB", "MatrixAcc",
];

/// `Decoration`'s cases (`SPIRVBase.td`).
const DECORATIONS: &[&str] = &[
    "RelaxedPrecision", "SpecId", "Block", "BufferBlock", "RowMajor", "ColMajor", "ArrayStride", "MatrixStride",
    "GLSLShared", "GLSLPacked", "CPacked", "BuiltIn", "NoPerspective", "Flat", "Patch", "Centroid",
    "Sample", "Invariant", "Restrict", "Aliased", "Volatile", "Constant", "Coherent", "NonWritable",
    "NonReadable", "Uniform", "UniformId", "SaturatedConversion", "Stream", "Location", "Component", "Index",
    "Binding", "DescriptorSet", "Offset", "XfbBuffer", "XfbStride", "FuncParamAttr", "FPRoundingMode", "FPFastMathMode",
    "LinkageAttributes", "NoContraction", "InputAttachmentIndex", "Alignment", "MaxByteOffset", "AlignmentId", "MaxByteOffsetId", "NoSignedWrap",
    "NoUnsignedWrap", "ExplicitInterpAMD", "OverrideCoverageNV", "PassthroughNV", "ViewportRelativeNV", "SecondaryViewportRelativeNV", "PerPrimitiveEXT", "PerVertexKHR",
    "NonUniform", "RestrictPointer", "AliasedPointer", "BindlessSamplerNV", "BindlessImageNV", "BoundSamplerNV", "BoundImageNV", "SIMTCallINTEL",
    "ReferencedIndirectlyINTEL", "ClobberINTEL", "SideEffectsINTEL", "VectorComputeVariableINTEL", "FuncParamIOKindINTEL", "VectorComputeFunctionINTEL", "StackCallINTEL", "GlobalVariableOffsetINTEL",
    "CounterBuffer", "UserSemantic", "UserTypeGOOGLE", "FunctionRoundingModeINTEL", "FunctionDenormModeINTEL", "RegisterINTEL", "MemoryINTEL", "NumbanksINTEL",
    "BankwidthINTEL", "MaxPrivateCopiesINTEL", "SinglepumpINTEL", "DoublepumpINTEL", "MaxReplicatesINTEL", "SimpleDualPortINTEL", "MergeINTEL", "BankBitsINTEL",
    "ForcePow2DepthINTEL", "BurstCoalesceINTEL", "CacheSizeINTEL", "DontStaticallyCoalesceINTEL", "PrefetchINTEL", "StallEnableINTEL", "FuseLoopsInFunctionINTEL", "AliasScopeINTEL",
    "NoAliasINTEL", "BufferLocationINTEL", "IOPipeStorageINTEL", "FunctionFloatingPointModeINTEL", "SingleElementVectorINTEL", "VectorComputeCallableFunctionINTEL", "MediaBlockIOINTEL", "CacheControlLoadINTEL",
    "CacheControlStoreINTEL",
];

/// A cursor over one SPIR-V type's body; `enclosing`: the identified structs being read
/// (`tryStartCyclicParse`), shared with the types nested in it.
struct SpirvText<'a, 'd, 'e> {
    p: Parser<'a, 'd>,
    enclosing: &'e mut Vec<String>,
}

impl<'a, 'd> SpirvText<'a, 'd, '_> {
    /// A keyword that is one of `cases` (`symbolizeEnum`).
    fn keyword(&mut self, cases: &[&str], what: &str) -> R<&'a str> {
        let w = self.p.ident().or_else(|_| self.p.err(alloc::format!("expected {what}")))?;
        if cases.contains(&w) { Ok(w) } else { self.p.err(alloc::format!("unknown {what}: {w}")) }
    }

    /// `parseDimensionList`: `N x ...` before the element type; `?` too when `dynamic`.
    fn dims(&mut self, dynamic: bool) -> R<Vec<i64>> {
        let mut out = Vec::new();
        loop {
            self.p.ws();
            let n = match self.p.rest().as_bytes().first() {
                Some(b'?') if dynamic => {
                    self.p.skip(1);
                    -1
                }
                Some(c) if c.is_ascii_digit() => self.p.number()?,
                _ => return Ok(out),
            };
            out.push(n);
            self.p.ws();
            if !self.p.rest().starts_with('x') {
                return self.p.err("expected 'x' in dimension list");
            }
            self.p.skip(1);
        }
    }

    /// A type, a nested SPIR-V one read by these rules too.
    fn ty(&mut self) -> R<Type<'a>> {
        let t = self.p.ty()?;
        if let Type::Extended(e) = &t
            && let Some(m) = e.name.strip_prefix("spirv.")
            && let Err(why) = Spirv::why(self.p.opt(), m, e.body.as_deref(), self.enclosing)
        {
            return self.p.err(why);
        }
        Ok(t)
    }

    /// `parseAndVerifyType`: a SPIR-V type, a float, a 1/8/16/32/64-bit integer, a 1-D vector
    /// of at most 4.
    fn element(&mut self) -> R<Type<'a>> {
        let t = self.ty()?;
        match &t {
            Type::Extended(e) if e.name.starts_with("spirv.") => {}
            // An alias (`!f32_binding`): what it names is checked where it is defined.
            Type::Extended(e) if !e.name.contains('.') && e.body.is_none() => {}
            Type::Float(_) => {}
            Type::Integer { width, .. } if [1, 8, 16, 32, 64].contains(width) => {}
            Type::Integer { .. } => return self.p.err(alloc::format!("only 1/8/16/32/64-bit integer type allowed but found '{t}'")),
            Type::Shaped(s) if s.kind == ShapedKind::Vector => match s.shape.as_deref() {
                Some([d]) if t.element_count().is_some_and(|n| n <= 4) => {
                    let _ = d;
                }
                Some([_]) => return self.p.err("vector length has to be less than or equal to 4"),
                _ => return self.p.err(alloc::format!("only 1-D vector allowed but found '{t}'")),
            },
            _ => return self.p.err(alloc::format!("cannot use '{t}' to compose SPIR-V types")),
        }
        Ok(t)
    }

    /// `, stride=N`, N > 0, before the closing `>`.
    fn stride(&mut self) -> R<()> {
        if self.p.eat(",") {
            self.p.expect("stride")?;
            self.p.expect("=")?;
            if self.p.number::<u32>()? == 0 {
                return self.p.err("ArrayStride must be greater than zero");
            }
        }
        Ok(())
    }

    /// `Decoration` or `Decoration = attr`.
    fn decoration(&mut self) -> R<()> {
        self.keyword(DECORATIONS, "decoration")?;
        if self.p.eat("=") {
            self.p.attr()?;
        }
        Ok(())
    }

    /// An image's parameters after its `<`: the dim.
    fn image(&mut self) -> R<&'a str> {
        self.element()?;
        let mut dim = "";
        for (i, (cases, what)) in [(DIMS, "Dim"), (DEPTHS, "ImageDepthInfo"), (ARRAYED, "ImageArrayedInfo"), (SAMPLING, "ImageSamplingInfo"), (SAMPLER_USES, "ImageSamplerUseInfo"), (FORMATS, "ImageFormat")].into_iter().enumerate() {
            self.p.expect(",")?;
            let w = self.keyword(cases, what)?;
            if i == 0 {
                dim = w;
            }
        }
        Ok(dim)
    }

    /// A struct's body after its `<`.
    fn structure(&mut self) -> R<()> {
        let mut named = None;
        if !self.p.at(b'(') {
            let id = self.p.ident()?;
            let enclosing = self.enclosing.iter().any(|n| n == id);
            if self.p.eat(">") {
                // A name alone refers to the struct being defined around it.
                return if enclosing { Ok(()) } else { self.p.err("recursive struct reference not nested in struct definition") };
            }
            self.p.expect(",")?;
            if enclosing {
                return self.p.err("identifier already used for an enclosing struct");
            }
            self.enclosing.push(id.into());
            named = Some(());
        }
        let r = self.members();
        if named.is_some() {
            self.enclosing.pop();
        }
        r
    }

    /// `(T [offset, Deco], ...)` then `, Deco` and `>`: offsets for every member or none.
    fn members(&mut self) -> R<()> {
        self.p.expect("(")?;
        if self.p.eat(")") {
            return self.p.expect(">");
        }
        let (mut members, mut offsets) = (0usize, 0usize);
        loop {
            self.ty()?;
            members += 1;
            if self.p.eat("[") {
                self.p.ws();
                let offset = self.p.rest().starts_with(|c: char| c.is_ascii_digit());
                if offset {
                    if offsets != members - 1 {
                        return self.p.err("offset specification must be given for all members");
                    }
                    self.p.number::<u32>()?;
                    offsets += 1;
                }
                if !self.p.eat("]") {
                    if offset {
                        self.p.expect(",")?;
                    }
                    loop {
                        self.decoration()?;
                        if !self.p.eat(",") {
                            break;
                        }
                    }
                    self.p.expect("]")?;
                }
            }
            if !self.p.eat(",") {
                break;
            }
        }
        if offsets != 0 && offsets != members {
            return self.p.err("offset specification must be given for all members");
        }
        self.p.expect(")")?;
        while self.p.eat(",") {
            self.decoration()?;
        }
        self.p.expect(">")
    }

    fn read(&mut self, kind: Kind) -> R<()> {
        self.p.expect("<")?;
        match kind {
            Kind::Array => {
                let dims = self.dims(false)?;
                match dims.as_slice() {
                    [0] => return self.p.err("expected array length greater than 0"),
                    [_] => {}
                    _ => return self.p.err("expected single integer for array element count"),
                }
                self.element()?;
                self.stride()?;
            }
            Kind::RtArray => {
                self.element()?;
                self.stride()?;
            }
            Kind::Ptr => {
                self.element()?;
                self.p.expect(",")?;
                self.keyword(STORAGE_CLASSES, "storage class")?;
            }
            Kind::Image => {
                self.image()?;
            }
            Kind::SampledImage => {
                self.p.ws();
                if !self.p.rest().starts_with("!spirv.image<") {
                    let t = self.p.ty()?;
                    return self.p.err(alloc::format!("sampled image must be composed using image type, got '{t}'"));
                }
                self.p.skip("!spirv.image<".len());
                let dim = self.image()?;
                self.p.expect(">")?;
                if ["SubpassData", "Buffer"].contains(&dim) {
                    return self.p.err(alloc::format!("sampled image Dim must not be SubpassData or Buffer, got {dim}"));
                }
            }
            Kind::CoopMatrix => {
                if self.dims(false)?.len() != 2 {
                    return self.p.err("expected row and column count");
                }
                self.element()?;
                self.p.expect(",")?;
                self.keyword(SCOPES, "scope <id>")?;
                self.p.expect(",")?;
                self.keyword(MATRIX_USES, "use <id>")?;
            }
            Kind::Matrix => {
                match self.dims(false)?.as_slice() {
                    [c] if (2..=4).contains(c) => {}
                    [_] => return self.p.err("matrix is expected to have 2, 3, or 4 columns"),
                    _ => return self.p.err("expected single unsigned integer for number of columns"),
                }
                let t = self.p.ty()?;
                match &t {
                    Type::Shaped(s) if s.kind == ShapedKind::Vector && s.shape.as_ref().is_some_and(|d| d.len() == 1) => {
                        if !t.element_count().is_some_and(|n| (2..=4).contains(&n)) {
                            return self.p.err("matrix columns size has to be less than or equal to 4 and greater than or equal 2");
                        }
                        if !matches!(*s.elem, Type::Float(_)) {
                            return self.p.err(alloc::format!("matrix columns' elements must be of Float type, got '{}'", s.elem));
                        }
                    }
                    Type::Shaped(s) if s.kind == ShapedKind::Vector => return self.p.err(alloc::format!("only 1-D vector allowed but found '{t}'")),
                    _ => return self.p.err(alloc::format!("matrix must be composed using vector type, got '{t}'")),
                }
            }
            Kind::TensorArm => {
                let dims = if self.p.eat("*") {
                    self.p.ws();
                    if !self.p.rest().starts_with('x') {
                        return self.p.err("expected 'x' in dimension list");
                    }
                    self.p.skip(1);
                    None
                } else {
                    Some(self.dims(true)?)
                };
                if let Some(d) = &dims {
                    if d.is_empty() {
                        return self.p.err("arm.tensors do not support rank zero");
                    }
                    if d.contains(&0) {
                        return self.p.err("arm.tensors do not support zero dimensions");
                    }
                    if d.iter().any(|x| *x < 0) && d.iter().any(|x| *x > 0) {
                        return self.p.err("arm.tensor shape dimensions must be either fully dynamic or completed shaped");
                    }
                }
                self.element()?;
            }
            Kind::Struct => return self.structure(),
        }
        self.p.expect(">")
    }
}

/// The SPIR-V dialect's rules.
pub(super) struct Spirv;

impl Spirv {
    /// `!spirv.<mnemonic><body>`: why `mlir-opt` would not read it.
    fn why(opt: &MlirOpt, mnemonic: &str, body: Option<&str>, enclosing: &mut Vec<String>) -> Result<(), String> {
        let kind = Kind::try_from(mnemonic).map_err(|()| alloc::format!("unknown SPIR-V type: {mnemonic}"))?;
        let body = body.ok_or_else(|| alloc::format!("`spirv.{mnemonic}` needs `<...>`"))?;
        let mut s = SpirvText { p: Parser::new(body, opt), enclosing };
        s.read(kind)
            .and_then(|()| {
                s.p.ws();
                if s.p.rest().is_empty() { Ok(()) } else { s.p.err("expected end of the type") }
            })
            .map_err(|e| e.placed(body).to_string())
    }
}

impl DialectRules for Spirv {
    #[inline]
    fn namespace(&self) -> &'static str {
        "spirv"
    }

    fn ty(&self, v: &Verifier<'_>, t: &Type<'_>) -> Result<(), Invalid> {
        let Type::Extended(e) = t else { return Ok(()) };
        Self::why(v.opt, e.mnemonic(), e.body.as_deref(), &mut Vec::new()).map_err(|why| Invalid::DialectType { ty: t.to_string(), why })
    }
}
