//! Locations as text: what `loc(...)` holds (an op's `loc`, a block argument's), read and built as
//! MLIR's `Location` does.

use alloc::string::String;
use alloc::vec::Vec;

use crate::Str;

/// `loc(unknown)`'s contents.
pub const UNKNOWN_LOC: &str = "unknown";

/// A location's text (the contents of `loc(...)`).
#[derive(Clone, Copy, Debug, PartialEq, Eq)]
pub struct Loc<'s>(pub &'s str);

impl<'s> From<&'s str> for Loc<'s> {
    fn from(s: &'s str) -> Self {
        Self(s.trim())
    }
}

impl<'s> Loc<'s> {
    pub fn is_unknown(self) -> bool {
        self.0 == UNKNOWN_LOC
    }

    /// The locations a `fused[...]` without metadata holds, in order; `None` for any other location
    /// (`fused<#meta>[...]` included).
    pub fn fused_parts(self) -> Option<Vec<Loc<'s>>> {
        let inner = self.0.strip_prefix("fused")?.trim_start().strip_prefix('[')?.strip_suffix(']')?;
        let b = inner.as_bytes();
        let (mut parts, mut depth, mut from, mut i) = (Vec::new(), 0usize, 0, 0);
        while i < b.len() {
            match b[i] {
                b'"' => {
                    i += 1;
                    while i < b.len() && b[i] != b'"' {
                        i += if b[i] == b'\\' { 2 } else { 1 };
                    }
                }
                b'(' | b'[' | b'{' | b'<' => depth += 1,
                b')' | b']' | b'}' | b'>' => depth = depth.saturating_sub(1),
                b',' if depth == 0 => {
                    parts.push(Loc::from(&inner[from..i]));
                    from = i + 1;
                }
                _ => {}
            }
            i += 1;
        }
        if !inner[from..].trim().is_empty() {
            parts.push(Loc::from(&inner[from..]));
        }
        Some(parts)
    }

    /// ⭐ `FusedLoc::get(locs)` without metadata (`Builder::getFusedLoc`): fused locations spread
    /// into theirs, `unknown` dropped, each kept once in order; none left is `unknown`, one is
    /// itself.
    pub fn fuse<'a>(locs: impl IntoIterator<Item = Loc<'s>>) -> Str<'a> {
        let mut kept: Vec<Loc<'s>> = Vec::new();
        let mut keep = |l: Loc<'s>| {
            if !l.is_unknown() && !kept.contains(&l) {
                kept.push(l);
            }
        };
        for l in locs {
            match l.fused_parts() {
                Some(parts) => parts.into_iter().for_each(&mut keep),
                None => keep(l),
            }
        }
        match kept.as_slice() {
            [] => Str::Borrowed(UNKNOWN_LOC),
            [one] => Str::Owned(String::from(one.0)),
            many => {
                let mut out = String::from("fused[");
                for (i, l) in many.iter().enumerate() {
                    if i > 0 {
                        out.push_str(", ");
                    }
                    out.push_str(l.0);
                }
                out.push(']');
                Str::Owned(out)
            }
        }
    }
}
