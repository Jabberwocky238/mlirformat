#!/usr/bin/env python3
"""Generates src/traits.gen.rs: every upstream op's traits, interfaces and memory effects, from ODS.

The records come from `mlirformat tblgen --dump-json` (byte for byte what `llvm-tblgen --dump-json`
prints), so no LLVM build is needed — only llvm-project's `mlir/include` at llvmorg-22.1.8.

    python3 scripts/traits.py --llvm $LLVM --mlirformat path/to/mlirformat -I $LLVM_BUILD/tools/mlir/include
"""

import argparse
import json
import subprocess
from concurrent.futures import ThreadPoolExecutor
from pathlib import Path

# One entry `.td` per dialect (or several when the dialect has no umbrella file), below `mlir/`.
# The test dialect is in: `mlir-opt` registers it, and upstream tests use its ops throughout.
TDS = [
    "include/mlir/IR/BuiltinOps.td",
    "include/mlir/Dialect/Affine/IR/AffineOps.td",
    "include/mlir/Dialect/AMDGPU/IR/AMDGPU.td",
    "include/mlir/Dialect/AMX/AMX.td",
    "include/mlir/Dialect/Arith/IR/ArithOps.td",
    "include/mlir/Dialect/ArmNeon/ArmNeon.td",
    "include/mlir/Dialect/ArmSME/IR/ArmSMEIntrinsicOps.td",
    "include/mlir/Dialect/ArmSME/IR/ArmSMEOps.td",
    "include/mlir/Dialect/ArmSVE/IR/ArmSVE.td",
    "include/mlir/Dialect/Async/IR/AsyncOps.td",
    "include/mlir/Dialect/Bufferization/IR/BufferizationOps.td",
    "include/mlir/Dialect/Complex/IR/ComplexOps.td",
    "include/mlir/Dialect/ControlFlow/IR/ControlFlowOps.td",
    "include/mlir/Dialect/EmitC/IR/EmitC.td",
    "include/mlir/Dialect/Func/IR/FuncOps.td",
    "include/mlir/Dialect/GPU/IR/GPUOps.td",
    "include/mlir/Dialect/Index/IR/IndexOps.td",
    "include/mlir/Dialect/Linalg/IR/LinalgOps.td",
    "include/mlir/Dialect/Linalg/IR/LinalgRelayoutOps.td",
    "include/mlir/Dialect/Linalg/IR/LinalgStructuredOps.td",
    "include/mlir/Dialect/LLVMIR/LLVMIntrinsicOps.td",
    "include/mlir/Dialect/LLVMIR/LLVMOps.td",
    "include/mlir/Dialect/LLVMIR/NVVMOps.td",
    "include/mlir/Dialect/LLVMIR/ROCDLOps.td",
    "include/mlir/Dialect/LLVMIR/XeVMOps.td",
    "include/mlir/Dialect/Math/IR/MathOps.td",
    "include/mlir/Dialect/MemRef/IR/MemRefOps.td",
    "include/mlir/Dialect/MLProgram/IR/MLProgramOps.td",
    "include/mlir/Dialect/NVGPU/IR/NVGPUOps.td",
    "include/mlir/Dialect/PDL/IR/PDLOps.td",
    "include/mlir/Dialect/PDLInterp/IR/PDLInterpOps.td",
    "include/mlir/Dialect/Ptr/IR/PtrOps.td",
    "include/mlir/Dialect/SCF/IR/SCFOps.td",
    "include/mlir/Dialect/Shape/IR/ShapeOps.td",
    "include/mlir/Dialect/SPIRV/IR/SPIRVOps.td",
    "include/mlir/Dialect/Tensor/IR/TensorOps.td",
    "include/mlir/Dialect/Tosa/IR/TosaOps.td",
    "include/mlir/Dialect/Tosa/IR/TosaShapeOps.td",
    "include/mlir/Dialect/Tosa/IR/TosaUtilOps.td",
    "include/mlir/Dialect/UB/IR/UBOps.td",
    "include/mlir/Dialect/Vector/IR/VectorOps.td",
    "include/mlir/Dialect/X86Vector/X86Vector.td",
    "include/mlir/Dialect/XeGPU/IR/XeGPUOps.td",
    "test/lib/Dialect/Test/TestOps.td",
    "test/lib/Dialect/Test/TestOpsSyntax.td",
]

EFFECTS = {"Read": "Read", "Write": "Write", "Allocate": "Allocate", "Free": "Free"}


def dump(mlirformat: str, mlir: Path, extra: list, td: str):
    path = mlir / td
    dirs = [a for i in [mlir / "include", path.parent, *extra] for a in ("-I", str(i))]
    out = subprocess.run([mlirformat, "tblgen", "--dump-json", str(path), *dirs], capture_output=True, text=True)
    if out.returncode != 0:
        raise SystemExit(f"{td}: {out.stderr.strip()}")
    return json.loads(out.stdout)


class Records:
    def __init__(self, d):
        self.d = d

    def native(self, trait: str) -> str:
        """`::mlir::OpTrait::SingleBlockImplicitTerminator<"YieldOp">::Impl` ⇒ `SingleBlockImplicitTerminator`."""
        base = trait.split("<", 1)[0]
        for suffix in ("::Impl", "::Trait"):
            base = base.removesuffix(suffix)
        return base.rsplit("::", 1)[-1]

    def interface(self, rec, out: set):
        out.add(rec["cppInterfaceName"])
        for base in rec.get("baseInterfaces", []) or []:
            self.interface(self.d[base["def"]], out)

    def effect(self, rec, on: str, out: list):
        kind = EFFECTS[rec["effect"].rsplit("::", 1)[-1]]
        resource = rec["resource"].rsplit("::", 1)[-1]
        out.append((kind, on, resource))

    def traits(self, refs, traits: set, effects: list, flags: dict):
        for ref in refs:
            rec = self.d[ref["def"]]
            sup = rec["!superclasses"]
            if "TraitList" in sup:
                self.traits(rec["traits"], traits, effects, flags)
                continue
            if "SideEffectsTraitBase" in sup or "MemoryEffects" in sup:
                flags["effects"] = True
                for e in rec.get("effects", []):
                    self.effect(self.d[e["def"]], "Op", effects)
                continue
            if "cppInterfaceName" in rec:
                self.interface(rec, traits)
                continue
            if "NativeTrait" in sup and rec.get("trait"):
                traits.add(self.native(rec["trait"]))

    def decorated(self, dag, kind: str, effects: list, flags: dict):
        for i, (arg, _name) in enumerate((dag or {}).get("args", [])):
            rec = self.d.get(arg["def"]) if isinstance(arg, dict) else None
            for dec in (rec or {}).get("decorators", []) or []:
                drec = self.d[dec["def"]]
                if "MemoryEffect" in drec["!superclasses"]:
                    flags["effects"] = True
                    self.effect(drec, f"{kind}({i})", effects)

    def inherent(self, dag):
        """The op's attribute and property arguments: what lives in `<{...}>`."""
        out = []
        for arg, name in (dag or {}).get("args", []):
            rec = self.d.get(arg["def"]) if isinstance(arg, dict) else None
            sup = (rec or {}).get("!superclasses", [])
            # `Arg<Constraint, "doc">`: the constraint it wraps.
            if "Arg" in sup and isinstance(rec.get("constraint"), dict):
                rec = self.d.get(rec["constraint"]["def"])
                sup = (rec or {}).get("!superclasses", [])
            if "TypeConstraint" not in sup and ("Attr" in sup or "AttrConstraint" in sup or "Property" in sup):
                out.append(name)
        return out

    # ---- ODS attribute constraints, for src/verifier/ods.gen.rs -------------------------
    #
    # A constraint's template arguments are resolved away in the records; its `summary`, which
    # ODS writes from them in a fixed shape, says what they were. Read here into a Rust
    # expression of `verifier::ods::C`; one it does not know is left out (not checked).

    def attr_rec(self, arg):
        rec = self.d.get(arg["def"]) if isinstance(arg, dict) else None
        if rec and "Arg" in rec["!superclasses"] and isinstance(rec.get("constraint"), dict):
            rec = self.d.get(rec["constraint"]["def"])
        return rec

    def constraint(self, rec):
        """`C::...` for an attribute constraint record, or None."""
        import re
        sup = rec["!superclasses"]
        # `AnyAttrOf<[A, B]>`: one of them.
        if "AnyAttrOf" in sup:
            parts = [self.constraint(self.d[a["def"]]) for a in rec.get("allowedAttributes") or []]
            return None if not parts or None in parts else "C::AnyOf(&[" + ", ".join(parts) + "])"
        # A dialect's `EnumAttr` (`#spirv.memory_access<..>`): that attribute, not an integer.
        if "EnumAttr" in sup and rec.get("attrName"):
            return f'C::Dialect("{rec["attrName"]}")'
        # An `I32EnumAttr` / `I64EnumAttr`: an integer of one of its case values.
        if "IntEnumAttr" in sup and "BitEnumAttr" not in sup:
            width = rec.get("width") or (32 if "I32EnumAttr" in sup else 64 if "I64EnumAttr" in sup else None)
            vals = [self.d[c["def"]].get("value") for c in rec.get("enumerants") or []]
            if width and all(isinstance(v, int) for v in vals):
                return f"C::Int {{ width: {width}, sign: Sign::Signless, min: None, cases: Some(&[{', '.join(str(v) for v in vals)}]) }}"
            return None
        summary = (rec.get("summary") or "").strip()
        c = self.summary(summary)
        if c is None and isinstance(rec.get("baseAttr"), dict) and not ("ConfinedAttr" in sup):
            return self.constraint(self.d[rec["baseAttr"]["def"]])
        return c

    def summary(self, s):
        import re
        sign = {"signless ": "Signless", "signed ": "Signed", "unsigned ": "Unsigned", "": "Any"}
        # `... whose value is non-negative` / `positive` (ConfinedAttr on an integer).
        min_ = "None"
        for tail, v in ((" whose value is non-negative", "Some(0)"), (" whose value is positive", "Some(1)")):
            if s.endswith(tail):
                s, min_ = s[: -len(tail)], v
        m = re.fullmatch(r"(\d+)-bit (signless |signed |unsigned |)integer attribute", s)
        if m:
            return f"C::Int {{ width: {m[1]}, sign: Sign::{sign[m[2]]}, min: {min_}, cases: None }}"
        if min_ != "None" and (m := re.fullmatch(r"i(\d+) dense array attribute", s)):
            return f"C::DenseArray {{ elem: Elem::Int({m[1]}), order: None, min: {min_} }}"
        if min_ != "None":
            return None
        m = re.fullmatch(r"i(\d+) dense array attribute should be in (increasing|non-decreasing) order", s)
        if m:
            order = "Order::Increasing" if m[2] == "increasing" else "Order::NonDecreasing"
            return f"C::DenseArray {{ elem: Elem::Int({m[1]}), order: Some({order}), min: None }}"
        m = re.fullmatch(r"(i|f)(\d+) dense array attribute", s)
        if m:
            return f"C::DenseArray {{ elem: Elem::{'Int' if m[1] == 'i' else 'Float'}({m[2]}), order: None, min: None }}"
        if s == "index attribute":
            return "C::Index"
        m = re.fullmatch(r"(\d+)-bit float attribute", s)
        if m:
            return f"C::Float({m[1]})"
        simple = {"bool attribute": "C::Bool", "string attribute": "C::Str", "unit attribute": "C::Unit",
                  "any type attribute": "C::Type(None)", "type array attribute": "C::TypeArray",
                  "flat symbol reference attribute": "C::FlatSymbolRef", "symbol reference attribute": "C::SymbolRef",
                  "type attribute of LLVM function type": "C::Type(Some(TypeOf::LlvmFunction))",
                  "type attribute of function type": "C::Type(Some(TypeOf::Function))"}
        if s in simple:
            return simple[s]
        # Elements attributes, maybe of a shape.
        shape = "None"
        m = re.fullmatch(r"(.*) of shape \[([\d, ]*)\]", s)
        if m:
            s, shape = m[1], "Some(&[" + m[2] + "])"
        m = re.fullmatch(r"(\d+)-bit (signless |)(?:integer|int) elements attribute", s)
        if m:
            return f"C::Elements {{ elem: Elem::{'Int' if m[2] else 'AnyInt'}({m[1]}), shape: {shape} }}"
        m = re.fullmatch(r"(\d+)-bit integer elements attribute", s)
        if m:
            return f"C::Elements {{ elem: Elem::AnyInt({m[1]}), shape: {shape} }}"
        m = re.fullmatch(r"(\d+)-bit float elements attribute", s)
        if m:
            return f"C::Elements {{ elem: Elem::Float({m[1]}), shape: {shape} }}"
        if s == "index elements attribute":
            return f"C::Elements {{ elem: Elem::Index, shape: {shape} }}"
        return None

    def constraints(self, dag):
        """(name, constraint) of each inherent attribute whose constraint is known."""
        out = []
        for arg, name in (dag or {}).get("args", []):
            rec = self.attr_rec(arg)
            if rec and "TypeConstraint" not in rec["!superclasses"] and ("Attr" in rec["!superclasses"] or "AttrConstraint" in rec["!superclasses"]):
                c = self.constraint(rec)
                if c:
                    out.append((name, c))
        return out

    # ---- ODS type constraints: the C++ class of each operand / result type ------------------
    #
    # `IntegerType`, `VectorType`, ...: a value of another kind fails the op's verifier. Only for
    # an op whose operands (results) are each one value, so a position is a field.

    KINDS = {"::mlir::IntegerType": "K::Integer", "::mlir::IndexType": "K::Index", "::mlir::FloatType": "K::Float",
             "::mlir::VectorType": "K::Vector", "::mlir::TensorType": "K::Tensor", "::mlir::RankedTensorType": "K::Tensor",
             "::mlir::MemRefType": "K::MemRef", "::mlir::BaseMemRefType": "K::MemRef"}

    def kinds(self, dag):
        """`K::..` per value of `dag`, or None when a value is variadic or none is constrained."""
        out = []
        for arg, _name in (dag or {}).get("args", []):
            rec = self.attr_rec(arg)
            sup = (rec or {}).get("!superclasses", [])
            if "TypeConstraint" not in sup:
                continue
            if "Variadic" in sup or "Optional" in sup or "VariadicOfVariadic" in sup:
                return None
            summary = (rec.get("summary") or "").strip()
            if summary == "bool":
                out.append("K::Bool")
            elif summary.startswith("bool or fixed-length vector of bool values"):
                out.append("K::BoolLike")
            else:
                out.append(self.KINDS.get(rec.get("cppType"), "K::Any"))
        return out if any(k != "K::Any" for k in out) else None

    def ops(self):
        for name in self.d["!instanceof"].get("Op", []):
            rec = self.d[name]
            dialect = self.d[rec["opDialect"]["def"]]["name"]
            traits, effects, flags = set(), [], {"effects": False}
            self.traits(rec["traits"], traits, effects, flags)
            self.decorated(rec.get("arguments"), "Operand", effects, flags)
            self.decorated(rec.get("results"), "Result", effects, flags)
            if flags["effects"]:
                # ODS adds the interface itself for declared effects.
                traits.add("MemoryEffectOpInterface")
                eff = effects
            elif "MemoryEffectOpInterface" in traits:
                eff = "custom"
            else:
                eff = None
            kinds = (self.kinds(rec.get("arguments")), self.kinds(rec.get("results")))
            yield f"{dialect}.{rec['opName']}", traits, eff, self.inherent(rec.get("arguments")), self.constraints(rec.get("arguments")), kinds


def main():
    ap = argparse.ArgumentParser(description=__doc__.split("\n")[0])
    ap.add_argument("--llvm", required=True)
    ap.add_argument("--mlirformat", required=True)
    ap.add_argument("-I", dest="extra", action="append", default=[], help="more include dirs: a build's tools/mlir/include holds Linalg's yamlgen.td, tools/mlir/test/lib/Dialect/Test the test dialect's")
    ap.add_argument("-o", default=str(Path(__file__).resolve().parent.parent / "src" / "traits.gen.rs"))
    ap.add_argument("--ods", default=str(Path(__file__).resolve().parent.parent / "src" / "verifier" / "ods.gen.rs"), help="where the inherent attributes' constraints go")
    opts = ap.parse_args()
    mlir = Path(opts.llvm) / "mlir"

    with ThreadPoolExecutor() as pool:
        dumps = list(pool.map(lambda td: dump(opts.mlirformat, mlir, opts.extra, td), TDS))
    ops, constraints, kinds = {}, {}, {}
    for d in dumps:
        for name, traits, effects, inherent, cons, ks in Records(d).ops():
            ops[name] = (traits, effects, inherent)
            if cons:
                constraints[name] = cons
            if ks != (None, None):
                kinds[name] = ks

    names = sorted({t for traits, _, _ in ops.values() for t in traits})
    lines = [
        "//! Generated by `scripts/traits.py` from llvm-project `llvmorg-22.1.8` ODS; do not edit.",
        "",
        "use super::{Effect, EffectKind, EffectOn, Effects, OpInfo, OpInfos};",
        "",
        "traits! {",
        *(f"    {n}," for n in names),
        "}",
        "",
        "impl OpInfos {",
        "    /// Registers every upstream op.",
        "    pub fn register_upstream_ops(&mut self) {",
    ]
    for name in sorted(ops):
        traits, effects, inherent = ops[name]
        ts = ", ".join(f"Trait::{t}" for t in sorted(traits))
        if effects is None:
            eff = "Effects::Unknown"
        elif effects == "custom":
            eff = "Effects::Custom"
        else:
            def on(o):
                return "EffectOn::Op" if o == "Op" else "EffectOn::" + o
            es = ", ".join(f"Effect {{ kind: EffectKind::{k}, on: {on(o)}, resource: \"{r}\" }}" for k, o, r in effects)
            eff = f"Effects::Known(&[{es}])"
        attrs = ", ".join(f'"{a}"' for a in inherent)
        lines.append(f"        self.insert(OpInfo {{ name: \"{name}\", traits: &[{ts}], effects: {eff}, inherent: &[{attrs}] }});")
    lines += ["    }", "}"]
    Path(opts.o).write_text("\n".join(lines) + "\n")
    ods = [
        "//! Generated by `scripts/traits.py` from llvm-project `llvmorg-22.1.8` ODS; do not edit.",
        "//! Each op's inherent attributes with their ODS constraints, sorted by op name.",
        "",
        "use super::{Elem, Order, Sign, TypeOf, C, K};",
        "",
        "pub(super) const OPS: &[(&str, &[(&str, C)])] = &[",
    ]
    for name in sorted(constraints):
        items = ", ".join(f'("{a}", {c})' for a, c in constraints[name])
        ods.append(f'    ("{name}", &[{items}]),')
    ods.append("];")
    ods += ["", "/// Each op's operand and result kinds (`None`: not checked), sorted by op name.",
            "pub(super) const KINDS: &[(&str, Option<&[K]>, Option<&[K]>)] = &["]
    for name in sorted(kinds):
        ins, outs = (("None" if k is None else "Some(&[" + ", ".join(k) + "])") for k in kinds[name])
        ods.append(f'    ("{name}", {ins}, {outs}),')
    ods.append("];")
    Path(opts.ods).write_text("\n".join(ods) + "\n")
    print(f"{len(ops)} ops, {len(names)} traits and interfaces, {len(constraints)} ops with checked attributes")


if __name__ == "__main__":
    main()
