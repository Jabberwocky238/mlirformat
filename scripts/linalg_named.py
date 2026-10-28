#!/usr/bin/env python3
"""Generates src/dialects/linalg_named.gen.rs from llvm-project 22.1.8's OpDSL ops
(mlir/include/mlir/Dialect/Linalg/IR/LinalgNamedStructuredOps.yaml): one `named_ops!` row per op,
its struct name, its attributes (index attributes, type function attributes) and the scalar
expressions its region builder yields, as mlir-linalg-ods-yaml-gen generates `regionBuilder`.

    python3 scripts/linalg_named.py --llvm $LLVM
"""

import argparse
import re
from pathlib import Path


def tokens(text: str):
    """(indent, text) of each meaningful line, wrapped scalars joined."""
    out = []
    for line in text.splitlines():
        if not line.strip() or line.strip().startswith("#"):
            continue
        indent = len(line) - len(line.lstrip())
        s = line.strip()
        # A continuation of a wrapped scalar (an `affine_map<...>` or a `doc: |-` block).
        if out and (out[-1][1].count("<") > out[-1][1].count(">") - out[-1][1].count("->") or out[-1][2]):
            if out[-1][2] and indent <= out[-1][0]:
                out[-1][2] = False
            else:
                out[-1][1] += " " + s
                continue
        out.append([indent, s, s.endswith("|-") or s.endswith("|")])
    return [(i, s) for i, s, _ in out]


def parse_block(lines, i, indent):
    """A mapping or a list at `indent`, from line `i`: (value, next line)."""
    if i < len(lines) and lines[i][0] == indent and lines[i][1].startswith("- "):
        items = []
        while i < len(lines) and lines[i][0] == indent and lines[i][1].startswith("- "):
            rest = lines[i][1][2:]
            if rest.startswith("!") and " " not in rest:
                item, i = parse_block(lines, i + 1, indent + 2)
            elif ":" in rest and not rest.startswith("affine_map"):
                # `- key: value` opens a mapping whose keys sit at indent + 2.
                sub = [(indent + 2, rest)] + lines[i + 1:]
                item, j = parse_block(sub, 0, indent + 2)
                i = i + j
            else:
                item, i = rest, i + 1
            items.append(item)
        return items, i
    mapping = {}
    while i < len(lines) and lines[i][0] == indent and not lines[i][1].startswith("- "):
        key, _, value = lines[i][1].partition(":")
        value = value.strip()
        i += 1
        if value and not value.startswith("!"):
            mapping[key] = value.strip("'")
            continue
        if i < len(lines) and lines[i][0] > indent:
            mapping[key], i = parse_block(lines, i, lines[i][0])
        elif i < len(lines) and lines[i][0] == indent and lines[i][1].startswith("- "):
            mapping[key], i = parse_block(lines, i, indent)
        else:
            mapping[key] = None
    return mapping, i


def camel(name: str) -> str:
    return "".join(p[:1].upper() + p[1:] for p in name.split("_"))


def expr(e, args, type_vars):
    """A `ScalarExpression` as a `Scalar` constant."""
    if "scalar_arg" in e:
        return f"Scalar::Arg({args.index(e['scalar_arg'])})"
    if "scalar_const" in e:
        return f'Scalar::Const("{e["scalar_const"]}")'
    if "scalar_index" in e:
        return f"Scalar::Index({e['scalar_index']})"
    fn = e["scalar_fn"]
    ops = [expr(o, args, type_vars) for o in fn["operands"]]
    kind = fn["kind"]
    if kind == "type":
        tv = fn["type_var"]
        # `findTypeValue`: the predefined types first, then the first operand of that type variable.
        ty = f'Ty::Named("{tv.lower()}")' if tv in ("I32", "I64", "F32", "F64") else f"Ty::Arg({type_vars[tv]})"
        cast = f'Cast::Attr("{fn["attr_name"]}")' if "attr_name" in fn else ("Cast::Unsigned" if fn["fn_name"] == "cast_unsigned" else "Cast::Signed")
        return f"Scalar::Cast({cast}, {ty}, &{ops[0]})"
    name = fn["fn_name"]
    if kind == "unary":
        return f'Scalar::Unary("{name}", &{ops[0]})'
    if kind == "binary":
        return f'Scalar::Binary("{name}", &{ops[0]}, &{ops[1]})'
    if kind == "ternary":
        return f'Scalar::Ternary("{name}", &{ops[0]}, &{ops[1]}, &{ops[2]})'
    raise ValueError(kind)


def main():
    ap = argparse.ArgumentParser(description=__doc__.split("\n")[0])
    ap.add_argument("--llvm", required=True, help="llvm-project checkout at llvmorg-22.1.8")
    ap.add_argument("-o", default=str(Path(__file__).resolve().parent.parent / "src" / "dialects" / "linalg_named.gen.rs"))
    opts = ap.parse_args()
    yaml = Path(opts.llvm) / "mlir/include/mlir/Dialect/Linalg/IR/LinalgNamedStructuredOps.yaml"
    rows = []
    for doc in yaml.read_text().split("--- !LinalgOpConfig")[1:]:
        lines = tokens(doc)
        top, _ = parse_block(lines, 0, 0)
        name = top["metadata"]["name"]
        sop = top["structured_op"]
        operands = [a for a in sop["args"] if a["kind"] in ("input_tensor", "output_tensor", "scalar")]
        args = [a["name"] for a in operands]
        type_vars = {}
        for k, a in enumerate(operands):
            type_vars.setdefault(a["type_var"], k)
        attrs = [a["name"] for a in sop["args"] if a["kind"] in ("index_attr", "type_fn_attr")]
        defaults = {a["name"]: a.get("default_fn") for a in sop["args"] if a["kind"] == "type_fn_attr"}
        yields = []
        for asg in sop["assignments"]:
            yields.append(expr(asg["value"], args, type_vars))
        attr_list = ", ".join(f'{a} = "{a}"' for a in attrs)
        fns = "".join(f', ("{a}", "{d}")' for a, d in defaults.items())
        rows.append(f'    {camel(name)} = "linalg.{name}" {{{attr_list}}} [{fns.lstrip(", ")}] [{", ".join(yields)}];')
    out = ["// Generated by scripts/linalg_named.py from llvm-project 22.1.8's LinalgNamedStructuredOps.yaml; do not edit.",
           "", "named_ops! {", *rows, "}", ""]
    Path(opts.o).write_text("\n".join(out))
    print(f"{opts.o}: {len(rows)} ops")


if __name__ == "__main__":
    main()
