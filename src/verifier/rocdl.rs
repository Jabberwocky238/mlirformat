//! `rocdl` attributes as `mlir-opt` reads them: the buffer out-of-bounds modes
//! (`#rocdl.buffer_oob_mode<..>` and its module flags, `ROCDLAttrs.td`).

use alloc::string::ToString;

use super::{DialectRules, Invalid, Verifier};
use crate::Attribute;

keywords! {
    /// The attributes holding a `BufferOOBMode`.
    enum OobAttr {
        Mode = "buffer_oob_mode",
        Flag = "buffer_oob_mode_flag",
        TFlag = "tbuffer_oob_mode_flag",
    }
}

keywords! {
    /// `ROCDL_BufferOOBMode`'s cases.
    enum OobMode {
        Any = "any",
        Relaxed = "relaxed",
        Strict = "strict",
    }
}

/// The `rocdl` dialect's rules.
pub(super) struct Rocdl;

impl DialectRules for Rocdl {
    #[inline]
    fn namespace(&self) -> &'static str {
        "rocdl"
    }

    fn attr(&self, _v: &Verifier<'_>, a: &Attribute<'_>) -> Result<(), Invalid> {
        let Attribute::Extended { ext, .. } = a else { return Ok(()) };
        if OobAttr::try_from(ext.mnemonic()).is_err() {
            return Ok(());
        }
        let case = ext.body.as_deref().and_then(|b| b.trim().strip_prefix('<')?.strip_suffix('>')).unwrap_or("").trim();
        match OobMode::try_from(case) {
            Ok(_) => Ok(()),
            Err(()) => Err(Invalid::DialectAttr { attr: a.to_string(), why: alloc::format!("expected one of [any, relaxed, strict] for ROCDL buffer out-of-bounds mode, got: {case}") }),
        }
    }
}
