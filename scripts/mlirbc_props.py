#!/usr/bin/env python3
"""Generates src/bytecode/props.gen.rs: every op mlir-opt registers (the test dialect left out) and,
for those whose properties are stored natively, the order and encoding of each property in its
bytecode, read off the `writeProperties` methods that mlir-tblgen generated in an LLVM build.

usage: mlirbc_props.py <llvm build dir> > src/bytecode/props.gen.rs
"""
import glob, re, sys

NAME = re.compile(r'class (\w+) : public ::mlir::Op<\1\b.*?getOperationName\(\) \{\s*return ::llvm::StringLiteral\("([\w.]+)"\)', re.S)
WRITE = re.compile(r'void (\w+)::writeProperties\(::mlir::DialectBytecodeWriter &writer\) \{\n')
STEP = [
    (re.compile(r'^writer\.writeOptionalAttribute\(prop\.(\w+)\);'), "OptAttr"),
    (re.compile(r'^writer\.writeAttribute\(prop\.(\w+)\);'), "Attr"),
]
# The test dialect only mlir-opt registers; its ops are left out (the test library's ops in other
# dialects, `transform.test_*`, are registered like any)
TEST = "test."
# What bytecode before native segment sizes wrote, skipped: the current version is written
OLD_FORMAT = "if (writer.getBytecodeVersion() < "
STORAGE = re.compile(r'auto &propStorage = prop\.(\w+);')
NATIVE = [
    (re.compile(r'writeSparseArray\('), "Segments"),
    (re.compile(r'writeOwnedBool\(propStorage\.has_value\(\)\).*writeVarInt\(\(\*\(propStorage\)\)\)', re.S), "OptVarInt"),
    (re.compile(r'writeVarInt\(propStorage\.size\(\)\).*writeVarInt\(elemVal\)', re.S), "VarInts"),
    (re.compile(r'writeVarInt\((static_cast<uint\d+_t>\()?propStorage\)?\)'), "VarInt"),
    (re.compile(r'writeSignedVarInt\(propStorage\)'), "SignedVarInt"),
    (re.compile(r'writeOwnedBool\(propStorage\)'), "Bool"),
    (re.compile(r'writeOwnedString\(propStorage\)'), "String"),
]


def methods(text):
    """Each `writeProperties` definition: its class and its body, up to the matching brace"""
    for m in WRITE.finditer(text):
        depth, i = 1, m.end()
        while depth:
            depth += {"{": 1, "}": -1}.get(text[i], 0)
            i += 1
        yield m.group(1), text[m.end() : i - 1]


AS_ATTR = re.compile(r'::mlir::Attribute (\w+)::getPropertiesAsAttr\(')
INT_TYPE = re.compile(r'IntegerType::get\(ctx, (\d+)\)')
STORAGE_TYPE = re.compile(r'using (\w+)Ty = (?:std::optional<)?(?:::llvm::SmallVector<)?(u?int(\d+)_t)')
NATIVE_INTS = ("VarInt", "SignedVarInt", "OptVarInt", "VarInts")
SEGMENT_COUNT = re.compile(r'using (\w+)Ty = std::array<int32_t, (\d+)>')
ADAPTOR = re.compile(r'class (\w+)GenericAdaptorBase \{')


def per_class(header):
    """Each op class's properties: native integers' storage widths, segment counts"""
    out = {}
    starts = list(ADAPTOR.finditer(header))
    for i, m in enumerate(starts):
        end = starts[i + 1].start() if i + 1 < len(starts) else len(header)
        part = header[m.end() : end]
        out[m.group(1)] = ({n: int(w) for n, _, w in STORAGE_TYPE.findall(part)}, {n: int(k) for n, k in SEGMENT_COUNT.findall(part)})
    return out
# What a native integer becomes as an attribute when no width is spelled out
DEFAULT_BITS = 64


def as_attr(text):
    """Each class's getPropertiesAsAttr body"""
    out = {}
    for m in AS_ATTR.finditer(text):
        end = text.find("\n}\n", m.end())
        out[m.group(1)] = text[m.end() : end]
    return out


def bits(prop, conv, storage):
    """The width of the integer attribute a native integer property is shown as"""
    at = conv.find(f"prop.{prop};")
    if at >= 0:
        m = INT_TYPE.search(conv[at : conv.find("getNamedAttr", at)])
        if m:
            return int(m.group(1))
    return storage.get(prop, DEFAULT_BITS)


def kind(prop, k, conv, storage, segments):
    """The PropKind, with what it carries: a native integer's width, the number of segments"""
    if k in NATIVE_INTS:
        return f"{k}({bits(prop, conv, storage)})"
    if k == "Segments":
        return f"{k}({segments[prop]})"
    return k


def blocks(body):
    """Splits a writeProperties body into its top-level statements and `{ ... }` blocks"""
    out, depth, cur = [], 0, []
    for line in body.split("\n"):
        s = line.strip()
        if not s or s.startswith("auto &prop = getProperties()"):
            continue
        cur.append(s)
        depth += s.count("{") - s.count("}")
        if depth == 0:
            out.append("\n".join(cur))
            cur = []
    return out


def steps(body):
    res = []
    for b in blocks(body):
        if b.startswith(OLD_FORMAT):
            continue
        for pat, kind in STEP:
            m = pat.match(b)
            if m:
                res.append((m.group(1), kind))
                break
        else:
            m = STORAGE.search(b)
            if not m:
                return None
            kind = next((k for pat, k in NATIVE if pat.search(b)), None)
            if kind is None:
                return None
            res.append((m.group(1), kind))
    return res


def main():
    build = sys.argv[1]
    table, skipped = {}, []
    for cpp in sorted(glob.glob(build + "/tools/mlir/**/*.cpp.inc", recursive=True)):
        h = cpp[: -len(".cpp.inc")] + ".h.inc"
        try:
            names = dict(NAME.findall(open(h).read()))
        except OSError:
            continue
        header = open(h).read()
        classes = per_class(header)
        names = {c: n for c, n in names.items() if not n.startswith(TEST)}
        for op in names.values():
            table.setdefault(op, None)
        text = open(cpp).read()
        convs = as_attr(text)
        for cls, body in methods(text):
            op = names.get(cls)
            if op is None:
                continue
            s = steps(body)
            if s is None:
                skipped.append(op)
                continue
            storage, segments = classes.get(cls, ({}, {}))
            table[op] = [(n, kind(n, k, convs.get(cls, ""), storage, segments)) for n, k in s]
    print("// Generated by scripts/mlirbc_props.py; do not edit.")
    print()
    print("use super::{Prop, PropKind};")
    print()
    print("/// Every registered op, sorted by name; for one storing properties natively, its properties in")
    print("/// bytecode order")
    print("pub const PROPS: &[(&str, Option<&[Prop]>)] = &[")
    for op in sorted(table):
        if table[op] is None:
            print(f'    ("{op}", None),')
            continue
        items = ", ".join(f'Prop {{ name: "{n}", kind: PropKind::{k} }}' for n, k in table[op])
        print(f'    ("{op}", Some(&[{items}])),')
    print("];")
    print(f"skipped {len(skipped)}: {' '.join(skipped)}", file=sys.stderr)


main()
