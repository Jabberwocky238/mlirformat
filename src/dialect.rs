use alloc::vec::Vec;
use core::fmt;

use crate::ast::*;
use crate::parse::{Parser, R};
use crate::print::Printer;

/// Registered plugins, looked up by namespace.
pub type Dialects<'d> = &'d [&'d dyn Dialect];

/// Which kind of extended symbol a body belongs to.
#[derive(Debug, Clone, Copy, PartialEq, Eq, Hash)]
pub enum SymKind {
    Type,
    Attr,
}

impl SymKind {
    pub const fn sigil(self) -> char {
        match self {
            Self::Type => '!',
            Self::Attr => '#',
        }
    }
}

/// A dialect plugin enriching the dialect-agnostic core.
///
/// Every hook defaults to "decline"; the core then keeps the construct generic
/// (raw custom op text, raw extended body). Plugins build on the public [`Parser`] and
/// [`Printer`] combinators and lower custom syntax onto the generic AST, so a module parsed
/// from custom syntax compares equal to the same module parsed from `--mlir-print-op-generic`.
pub trait Dialect {
    /// Namespace, e.g. `"func"` for `func.call`, `!func.x`, `#func.x`.
    fn namespace(&self) -> &str;

    /// Parses the custom form of op `name` (fully qualified, e.g. `"func.return"`).
    /// The parser is positioned right after the op name as written. Return `None` to decline;
    /// the parser rewinds automatically.
    fn parse_op<'a>(&self, name: &str, p: &mut Parser<'a, '_>) -> Option<R<GenericOp<'a>>> {
        let _ = (name, p);
        None
    }

    /// Prints `op` (after the `%results = ` prefix) in custom form. `None` → generic form.
    fn print_op(&self, op: &GenericOp<'_>, p: &mut Printer<'_, '_>) -> Option<fmt::Result> {
        let _ = (op, p);
        None
    }

    /// Structures the body of `!ns.name<...>` / `#ns.name<...>`. The parser is positioned at
    /// the body's opening delimiter and must consume exactly the whole body.
    fn parse_params<'a>(&self, kind: SymKind, name: &str, p: &mut Parser<'a, '_>) -> Option<R<Vec<Attribute<'a>>>> {
        let _ = (kind, name, p);
        None
    }
}
