//! `ptr` attributes as `mlir-opt` reads them: `#ptr.spec` (`SpecAttr::verify`, `Ptr/IR/PtrAttrs.cpp`).

use alloc::string::ToString;
use alloc::vec::Vec;

use super::{DialectRules, Invalid, Verifier};
use crate::Attribute;

/// The `ptr` dialect's rules.
pub(super) struct Ptr;

impl Ptr {
    /// `<size = 64, abi = 64, preferred = 64[, index = 64]>`: every entry whole bytes, the
    /// preferred alignment no smaller than the ABI one.
    fn spec(body: &str) -> Result<(), &'static str> {
        let inner = body.trim().strip_prefix('<').and_then(|b| b.strip_suffix('>')).unwrap_or("");
        let entries: Vec<(&str, u64)> = inner.split(',').filter_map(|kv| kv.split_once('=')).filter_map(|(k, v)| Some((k.trim(), v.trim().parse().ok()?))).collect();
        let get = |k: &str| entries.iter().find(|(n, _)| *n == k).map(|(_, v)| *v);
        for (key, why) in [("size", "size entry must be divisible by 8"), ("abi", "abi entry must be divisible by 8"), ("preferred", "preferred entry must be divisible by 8"), ("index", "index entry must be divisible by 8")] {
            if get(key).is_some_and(|v| v % 8 != 0) {
                return Err(why);
            }
        }
        match (get("abi"), get("preferred")) {
            (Some(a), Some(p)) if a > p => Err("preferred alignment is expected to be at least as large as ABI alignment"),
            _ => Ok(()),
        }
    }
}

impl DialectRules for Ptr {
    #[inline]
    fn namespace(&self) -> &'static str {
        "ptr"
    }

    fn attr(&self, _v: &Verifier<'_>, a: &Attribute<'_>) -> Result<(), Invalid> {
        match a {
            Attribute::Extended { ext, .. } if ext.mnemonic() == "spec" => Self::spec(ext.body.as_deref().unwrap_or("")).map_err(|why| Invalid::DialectAttr { attr: a.to_string(), why: why.into() }),
            _ => Ok(()),
        }
    }
}
