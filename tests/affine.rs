//! ⭐ The affine sub-language against `mlir-opt` 22.1.8: every `affine_map<...>` and
//! `affine_set<...>` body in the custom-form fixtures must parse, and print back byte for byte.
//! Those fixtures are mlir-opt's own output, so printing differently means printing something
//! MLIR would not. (`tests/fixtures/upstream` is the original test input, spacing and redundant
//! parentheses included, so it says nothing about how MLIR prints.)

use mlirformat::affine_expr::{Map, Set};
use std::fmt::Display;
use std::path::Path;

/// The bodies of every `tag<...>` in `src`, brackets excluded and nesting respected.
fn bodies<'a>(src: &'a str, tag: &str) -> Vec<&'a str> {
    let mut out = Vec::new();
    let (mut rest, open) = (src, format!("{tag}<"));
    while let Some(i) = rest.find(&open) {
        let body = &rest[i + open.len()..];
        let b = body.as_bytes();
        let (mut depth, mut end) = (1usize, None);
        for k in 0..b.len() {
            // `->` and `>=` are not brackets.
            let arrow = (b[k] == b'>' && k > 0 && b[k - 1] == b'-') || (b[k] == b'>' && b.get(k + 1) == Some(&b'='));
            match b[k] {
                b'<' => depth += 1,
                b'>' if !arrow => {
                    depth -= 1;
                    if depth == 0 {
                        end = Some(k);
                        break;
                    }
                }
                _ => {}
            }
        }
        match end {
            Some(e) => {
                out.push(&body[..e]);
                rest = &body[e..];
            }
            None => break,
        }
    }
    out
}

/// Round trips every body of one kind, returning the ones that did not come back identical.
fn check<'a, T>(src: &'a str, tag: &str) -> Vec<String>
where
    T: TryFrom<&'a str> + Display,
    <T as TryFrom<&'a str>>::Error: Display,
{
    let mut bad = Vec::new();
    for body in bodies(src, tag) {
        // FileCheck patterns are not MLIR.
        if body.contains("{{") || body.contains("[[") {
            continue;
        }
        match T::try_from(body) {
            Ok(v) => {
                let back = v.to_string();
                // The source may be laid out over several lines; compare without that.
                let tidy = |s: &str| s.split_whitespace().collect::<Vec<_>>().join(" ");
                if tidy(&back) != tidy(body) {
                    bad.push(format!("{tag}<{body}> printed back as <{back}>"));
                }
            }
            Err(e) => bad.push(format!("{tag}<{body}>: {e}")),
        }
    }
    bad
}

#[test]
fn affine_bodies_round_trip() {
    let dir = Path::new(env!("CARGO_MANIFEST_DIR")).join("tests/fixtures/custom");
    let (mut maps, mut sets, mut bad) = (0usize, 0usize, Vec::new());
    for entry in std::fs::read_dir(&dir).expect("fixtures") {
        let path = entry.expect("entry").path();
        if path.extension().is_none_or(|e| e != "mlir") {
            continue;
        }
        let src = std::fs::read_to_string(&path).expect("read");
        maps += bodies(&src, "affine_map").len();
        sets += bodies(&src, "affine_set").len();
        let here = |b: Vec<String>| b.into_iter().map(|m| format!("{}: {m}", path.file_name().unwrap().to_string_lossy()));
        bad.extend(here(check::<Map>(&src, "affine_map")));
        bad.extend(here(check::<Set>(&src, "affine_set")));
    }
    println!("affine_map {maps}, affine_set {sets}");
    assert!(bad.is_empty(), "{} failures:\n{}", bad.len(), bad.iter().take(30).cloned().collect::<Vec<_>>().join("\n"));
}

/// The substitution an `affine` op's custom form needs: `affine.load %A[%i + 1]` is the map
/// `(d0) -> (d0 + 1)` shown against the operand `%i`.
#[test]
fn a_map_shows_against_operands() {
    let map = Map::try_from("(d0)[s0] -> (d0 + 1, s0 * 2, d0 floordiv 4)").expect("parse");
    let args = [("d0", "%i"), ("s0", "%n")];
    let shown: Vec<String> = map.results.iter().map(|e| e.show(&args).to_string()).collect();
    assert_eq!(shown, ["%i + 1", "%n * 2", "%i floordiv 4"]);
}
