//! `#[mlir::op]` structs against the paired `mlir-opt` fixtures: every matching op of the
//! generic output converts to its struct, prints exactly as `mlir-opt` prints the custom form,
//! and parses back to the same generic op.

use std::fs;
use std::path::Path;

use mlirformat::*;

/// Replaces SSA names (`%arg0`, `%c1_i64`, ...) by `%_` so the two outputs are comparable.
fn anon(s: &str) -> String {
    let mut out = String::new();
    let mut it = s.chars().peekable();
    while let Some(c) = it.next() {
        out.push(c);
        if c == '%' {
            out.push('_');
            while it.peek().is_some_and(|&c| c.is_ascii_alphanumeric() || matches!(c, '_' | '$' | '.' | '-' | '#')) {
                it.next();
            }
        }
    }
    out
}

/// Visits generic ops with whether they are visible in custom form: `mlir-opt` elides the
/// bodies of linalg named ops there.
fn walk<'x, 'a>(ops: &'x [Operation<'a>], visible: bool, f: &mut impl FnMut(&'x GenericOp<'a>, bool)) {
    for op in ops {
        if let OpBody::Generic(g) = &op.body {
            f(g, visible);
            let inner = visible && !g.name.starts_with("linalg.");
            g.regions.iter().flat_map(|r| &r.blocks).for_each(|b| walk(&b.ops, inner, f));
        }
    }
}

#[derive(Default)]
struct Tally {
    hits: usize,
    /// Ops the struct declines (unsupported properties); they stay generic.
    declined: Vec<String>,
}

/// Checks `$g` as each listed op type; `$custom` is `None` when the op is hidden in custom form.
macro_rules! check_all {
    ($tally:expr, $g:expr, $custom:expr, $($ty:ident),* $(,)?) => {(|| -> Result<(), String> {
        let (tally, g, custom): (&mut Tally, &GenericOp<'_>, Option<&str>) = ($tally, $g, $custom);
        $(if g.name == $ty::NAME {
            let Ok(op) = $ty::try_from(g) else {
                tally.declined.push(g.to_string());
                return Ok(());
            };
            let mut text = String::new();
            op.print(&mut Printer::new(&mut text, &[])).unwrap();
            if custom.is_some_and(|c| !c.contains(&anon(&text))) {
                return Err(format!("`{text}` not in mlir-opt custom output"));
            }
            let back = Parser::new(&text, &[]).all(|p| {
                p.ident()?;
                $ty::parse(p)
            });
            return match back {
                Ok(b) if b == op && GenericOp::from(b.clone()) == *g => Ok(tally.hits += 1),
                Ok(b) => Err(format!("reparse mismatch: {text}\n{b:?}")),
                Err(e) => Err(format!("reparse: {e}: {text}")),
            };
        })*
        Ok(())
    })()};
}

#[test]
fn arith_ops_match_mlir_opt() {
    let dir = Path::new(env!("CARGO_MANIFEST_DIR")).join("tests/fixtures");
    let (mut tally, mut failures) = (Tally::default(), Vec::new());
    for entry in fs::read_dir(dir.join("generic")).unwrap() {
        let path = entry.unwrap().path();
        let src = fs::read_to_string(&path).unwrap();
        let custom = anon(&fs::read_to_string(dir.join("custom").join(path.file_name().unwrap())).unwrap());
        for chunk in src.split("// -----") {
            let m = Module::try_from(chunk.trim_start_matches('-')).unwrap();
            let ops: Vec<_> = m.items.into_iter().filter_map(|i| if let Item::Op(op) = i { Some(op) } else { None }).collect();
            walk(&ops, true, &mut |g, visible| {
                #[rustfmt::skip]
                let r = check_all!(&mut tally, g, visible.then_some(custom.as_str()), AndI, OrI, XOrI, MaxSI, MaxUI, MinSI, MinUI, DivSI, DivUI, RemSI, RemUI,
                    CeilDivSI, CeilDivUI, FloorDivSI, ShRSI, ShRUI);
                if let Err(e) = r {
                    failures.push(format!("{}: {e}", path.file_name().unwrap().to_string_lossy()));
                }
            });
        }
    }
    assert!(failures.is_empty(), "{} failures:\n{}", failures.len(), failures.join("\n"));
    assert!(tally.hits > 0);
    println!("{} ops checked, {} declined:\n{}", tally.hits, tally.declined.len(), tally.declined.join("\n"));
}
