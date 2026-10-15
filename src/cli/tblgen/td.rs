//! The TableGen front end behind `mlirformat tblgen`: `.td` ⇒ the resolved records, as the JSON that
//! `llvm-tblgen --dump-json` (LLVM 22.1.8) prints — byte for byte. A port of `llvm/lib/TableGen`
//! (TGLexer, TGParser, Record, JSONBackend), so no LLVM build is needed to generate a dialect.
//!
//! ```text
//! Lexer    buffers (one per include), #ifdef / #define, locations = buffer + offset
//! Keeper   types and values interned by content (equal ids ⇔ the same value, as LLVM compares pointers),
//!          records, resolveReferences and every operator's fold
//! Parser   class / def / defm / multiclass / foreach / if / let / defvar / defset / deftype / assert / dump
//! json     !instanceof, !tablegen_json_version, one object per def (sorted keys, compact)
//! ```
//!
//! ⚠ Not implemented: `!match` and `!instances` (they need regular expressions; no MLIR `.td` uses them).
use std::collections::{BTreeMap, HashMap, HashSet};
use std::path::{Path, PathBuf};

/// A parse error (`file:line: error: …`).
#[derive(Debug)]
pub struct Error(String);

impl Error {
    fn new(msg: impl Into<String>) -> Self {
        Self(msg.into())
    }
}

impl std::fmt::Display for Error {
    fn fmt(&self, f: &mut std::fmt::Formatter<'_>) -> std::fmt::Result {
        f.write_str(&self.0)
    }
}

/// `llvm-tblgen --dump-json td -I includes…`, in process.
pub fn dump_json(td: &Path, includes: &[PathBuf]) -> Result<String, Error> {
    let src = Sources::new(td, includes)?;
    let mut p = Parser::new(src, &[]);
    p.parse_file()?;
    Ok(p.k.json(&p.lex.src))
}

// ======================================================================== lex

/// A source location: buffer number and byte offset in it.
#[derive(Clone, Copy, Debug, PartialEq, Eq, Hash, Default)]
pub struct Loc {
    pub buf: u32,
    pub off: u32,
}

/// One source file. `parent` = where it was included from (none for the main file).
pub struct Buffer {
    pub name: String,
    pub text: Vec<u8>,
    parent: Option<Loc>,
}

/// All buffers (as `llvm::SourceMgr`): an `include` is looked up as given (relative to the current directory), then in each `-I`.
pub struct Sources {
    pub bufs: Vec<Buffer>,
    includes: Vec<PathBuf>,
}

impl Sources {
    pub fn new(main: &Path, includes: &[PathBuf]) -> Result<Self, Error> {
        let text = std::fs::read(main).map_err(|e| Error::new(format!("Could not open input file '{}': {e}", main.display())))?;
        Ok(Self { bufs: vec![Buffer { name: main.display().to_string(), text, parent: None }], includes: includes.to_vec() })
    }

    /// Opens an included file: the new buffer number, `None` if not found.
    fn include(&mut self, name: &str, at: Loc) -> Option<u32> {
        let found = std::iter::once(PathBuf::from(name)).chain(self.includes.iter().map(|d| d.join(name))).find_map(|p| std::fs::read(&p).ok().map(|t| (p, t)));
        let (path, text) = found?;
        self.bufs.push(Buffer { name: path.display().to_string(), text, parent: Some(at) });
        Some(self.bufs.len() as u32 - 1)
    }

    /// `file:line` (as `SourceMgr::getFormattedLocationNoOffset`: the file name without its directory).
    #[must_use]
    pub fn format(&self, loc: Loc) -> String {
        let buf = &self.bufs[loc.buf as usize];
        let base = buf.name.rsplit(['/', '\\']).next().unwrap_or(&buf.name);
        let line = 1 + buf.text[..(loc.off as usize).min(buf.text.len())].iter().filter(|&&c| c == b'\n').count();
        format!("{base}:{line}")
    }
}

/// Bang operators.
#[derive(Clone, Copy, Debug, PartialEq, Eq)]
pub enum Bang {
    Concat, Add, Sub, Mul, Div, Not, Log2, And, Or, Xor, Sra, Srl, Shl, ListConcat, ListFlatten, ListSplat, StrConcat, Interleave,
    Substr, Find, Match, Cast, Subst, ForEach, Filter, Foldl, Head, Tail, Size, Empty, Initialized, Instances, If, Cond, Eq, IsA, Dag,
    Ne, Le, Lt, Ge, Gt, SetDagOp, GetDagOp, SetDagOpName, GetDagOpName, Exists, ListRemove, ToLower, ToUpper, Range, GetDagArg,
    GetDagName, SetDagArg, SetDagName, Repr,
}

/// Token kinds (as `tgtok::TokKind`; numeric and string values live on the [`Lexer`]).
#[derive(Clone, Copy, Debug, PartialEq, Eq)]
pub enum Tok {
    Eof, Minus, Plus, LSquare, RSquare, LBrace, RBrace, LParen, RParen, Less, Greater, Colon, Semi, Comma, Dot, Equal, Question, Paste,
    DotDotDot, True, False, IntVal, BinaryIntVal,
    // types and keywords
    Bit, Bits, Code, Dag, ElseKw, Field, In, Int, List, String, Then,
    // object starts (`isObjectStart`)
    Assert, Class, Def, Defm, Defset, Deftype, Defvar, Dump, Foreach, If, Let, MultiClass,
    Bang(Bang),
    // with a string value
    Id, StrVal, VarName, CodeFragment,
}

impl Tok {
    #[must_use]
    pub const fn object_start(self) -> bool {
        matches!(self, Self::Assert | Self::Class | Self::Def | Self::Defm | Self::Defset | Self::Deftype | Self::Defvar | Self::Dump | Self::Foreach | Self::If | Self::Let | Self::MultiClass)
    }
}

/// Preprocessor control: whether this `#ifdef` / `#else` level is active.
#[derive(Clone, Copy)]
struct Prep {
    is_else: bool,
    defined: bool,
    at: Loc,
}

const EOF: i32 = -1;

pub struct Lexer {
    pub src: Sources,
    buf: u32,
    pos: usize,
    tok_start: usize,
    pub tok: Tok,
    pub str_val: String,
    pub int_val: i64,
    macros: HashSet<String>,
    prep: Vec<Vec<Prep>>,
}

const fn id_char(c: i32, first: bool) -> bool {
    let c = c as u8;
    c == b'_' || c.is_ascii_alphabetic() || (!first && c.is_ascii_digit())
}

impl Lexer {
    pub fn new(src: Sources, macros: &[String]) -> Self {
        Self { src, buf: 0, pos: 0, tok_start: 0, tok: Tok::Eof, str_val: String::new(), int_val: 0, macros: macros.iter().cloned().collect(), prep: vec![Vec::new()] }
    }

    fn text(&self) -> &[u8] {
        &self.src.bufs[self.buf as usize].text
    }

    /// The `i`-th character ahead (NUL past the end, like the 0 terminating a MemoryBuffer).
    fn peek(&self, i: usize) -> i32 {
        self.text().get(self.pos + i).map_or(0, |&c| i32::from(c))
    }

    fn at_end(&self) -> bool {
        self.pos >= self.text().len()
    }

    #[must_use]
    pub fn loc(&self) -> Loc {
        Loc { buf: self.buf, off: self.tok_start as u32 }
    }

    fn loc_at(&self, off: usize) -> Loc {
        Loc { buf: self.buf, off: off as u32 }
    }

    pub fn error<T>(&self, loc: Loc, msg: impl Into<String>) -> Result<T, Error> {
        Err(Error::new(format!("{}: error: {}", self.src.format(loc), msg.into())))
    }

    /// The width of a binary literal (digits after `0b`).
    #[must_use]
    pub fn binary_width(&self) -> usize {
        self.pos - self.tok_start - 2
    }

    pub fn lex(&mut self) -> Result<Tok, Error> {
        let start = self.pos == 0;
        self.tok = self.lex_token(start)?;
        Ok(self.tok)
    }

    fn next_char(&mut self) -> i32 {
        if self.at_end() {
            return EOF;
        }
        let c = self.text()[self.pos];
        self.pos += 1;
        match c {
            0 => i32::from(b' '),
            b'\n' | b'\r' => {
                let n = self.peek(0);
                if (n == i32::from(b'\n') || n == i32::from(b'\r')) && n != i32::from(c) {
                    self.pos += 1;
                }
                i32::from(b'\n')
            }
            _ => i32::from(c),
        }
    }

    /// End of a file: back to where it was included.
    fn process_eof(&mut self) -> Result<bool, Error> {
        match self.src.bufs[self.buf as usize].parent {
            Some(at) => {
                self.prep_exit_include(false)?;
                self.buf = at.buf;
                self.pos = at.off as usize;
                self.tok_start = self.pos;
                Ok(true)
            }
            None => {
                self.prep_exit_include(true)?;
                Ok(false)
            }
        }
    }

    fn lex_token(&mut self, mut line_start: bool) -> Result<Tok, Error> {
        loop {
            self.tok_start = self.pos;
            let c = self.next_char();
            let tok = match c {
                EOF => {
                    if self.process_eof()? {
                        line_start = false;
                        continue;
                    }
                    return Ok(Tok::Eof);
                }
                _ if c == i32::from(b' ') || c == i32::from(b'\t') => continue,
                _ if c == i32::from(b'\n') => {
                    line_start = true;
                    continue;
                }
                _ if c == i32::from(b'/') => {
                    if self.peek(0) == i32::from(b'/') {
                        self.skip_bcpl();
                    } else if self.peek(0) == i32::from(b'*') {
                        self.skip_c_comment()?;
                    } else {
                        return self.error(self.loc(), "unexpected character");
                    }
                    continue;
                }
                _ => match c as u8 {
                    b':' => Tok::Colon,
                    b';' => Tok::Semi,
                    b',' => Tok::Comma,
                    b'<' => Tok::Less,
                    b'>' => Tok::Greater,
                    b']' => Tok::RSquare,
                    b'{' => Tok::LBrace,
                    b'}' => Tok::RBrace,
                    b'(' => Tok::LParen,
                    b')' => Tok::RParen,
                    b'=' => Tok::Equal,
                    b'?' => Tok::Question,
                    b'#' => {
                        if line_start
                            && let Some(kind) = self.prep_directive()
                        {
                            return self.lex_preprocessor(kind, true).map(|t| t.unwrap_or(Tok::Eof));
                        }
                        Tok::Paste
                    }
                    b'.' => {
                        if self.peek(0) == i32::from(b'.') {
                            self.pos += 1;
                            if self.peek(0) == i32::from(b'.') {
                                self.pos += 1;
                                Tok::DotDotDot
                            } else {
                                return self.error(self.loc(), "invalid '..' punctuation");
                            }
                        } else {
                            Tok::Dot
                        }
                    }
                    b'-' | b'+' | b'0'..=b'9' => return self.lex_digits(c),
                    b'"' => return self.lex_string(),
                    b'$' => return self.lex_var_name(),
                    b'[' => return self.lex_bracket(),
                    b'!' => return self.lex_exclaim(),
                    _ if id_char(c, true) => return self.lex_identifier(),
                    _ => return self.error(self.loc(), "unexpected character"),
                },
            };
            return Ok(tok);
        }
    }

    /// A digit: `0x…` / `0b…` / decimal; digits followed by identifier characters ⇒ an identifier (`4i32`).
    fn lex_digits(&mut self, c: i32) -> Result<Tok, Error> {
        let mut next = 0;
        if (c as u8).is_ascii_digit() {
            let mut i = 0;
            loop {
                next = self.peek(i);
                i += 1;
                if !(next as u8).is_ascii_digit() || next == 0 {
                    break;
                }
            }
            if next == i32::from(b'x') || next == i32::from(b'b') {
                let nn = self.peek(i) as u8;
                if next == i32::from(b'b') && (nn == b'0' || nn == b'1') {
                    return self.lex_number();
                }
                if next == i32::from(b'x') && nn.is_ascii_hexdigit() {
                    return self.lex_number();
                }
            }
        }
        if id_char(next, true) {
            return self.lex_identifier();
        }
        self.lex_number()
    }

    fn lex_number(&mut self) -> Result<Tok, Error> {
        let text_prev = self.text()[self.pos - 1];
        let mut base = 0;
        let mut num_start = 0;
        if text_prev == b'0' {
            num_start = self.pos + 1;
            if self.peek(0) == i32::from(b'x') {
                base = 16;
                loop {
                    self.pos += 1;
                    if !(self.peek(0) as u8).is_ascii_hexdigit() || self.peek(0) == 0 {
                        break;
                    }
                }
            } else if self.peek(0) == i32::from(b'b') {
                base = 2;
                loop {
                    self.pos += 1;
                    if !(self.peek(0) == i32::from(b'0') || self.peek(0) == i32::from(b'1')) {
                        break;
                    }
                }
            }
        }
        let mut minus = false;
        if base == 0 {
            if !(self.peek(0) as u8).is_ascii_digit() || self.peek(0) == 0 {
                if text_prev == b'-' {
                    return Ok(Tok::Minus);
                }
                if text_prev == b'+' {
                    return Ok(Tok::Plus);
                }
            }
            base = 10;
            num_start = self.tok_start;
            minus = text_prev == b'-';
            while (self.peek(0) as u8).is_ascii_digit() && self.peek(0) != 0 {
                self.pos += 1;
            }
        }
        if self.pos == num_start {
            return self.error(self.loc(), "invalid number");
        }
        let digits = std::str::from_utf8(&self.text()[num_start..self.pos]).unwrap_or("");
        // as strtoll / strtoull: negative numbers signed, the rest unsigned and reinterpreted
        self.int_val = if minus {
            digits.parse::<i64>().map_err(|_| Error::new(format!("{}: error: number out of range", self.src.format(self.loc()))))?
        } else {
            let d = digits.trim_start_matches('+');
            u64::from_str_radix(d, base).map_err(|_| Error::new(format!("{}: error: number out of range", self.src.format(self.loc()))))? as i64
        };
        Ok(if base == 2 { Tok::BinaryIntVal } else { Tok::IntVal })
    }

    fn lex_string(&mut self) -> Result<Tok, Error> {
        let start = self.pos;
        let mut val = Vec::new();
        while self.peek(0) != i32::from(b'"') {
            if self.at_end() {
                return self.error(self.loc_at(start), "end of file in string literal");
            }
            let c = self.peek(0) as u8;
            if c == b'\n' || c == b'\r' {
                return self.error(self.loc_at(start), "end of line in string literal");
            }
            if c != b'\\' {
                val.push(c);
                self.pos += 1;
                continue;
            }
            self.pos += 1;
            match self.peek(0) as u8 {
                e @ (b'\\' | b'\'' | b'"') => {
                    val.push(e);
                    self.pos += 1;
                }
                b't' => {
                    val.push(b'\t');
                    self.pos += 1;
                }
                b'n' => {
                    val.push(b'\n');
                    self.pos += 1;
                }
                _ => return self.error(self.loc_at(self.pos), "invalid escape in string literal"),
            }
        }
        self.pos += 1;
        self.str_val = String::from_utf8_lossy(&val).into_owned();
        Ok(Tok::StrVal)
    }

    fn lex_var_name(&mut self) -> Result<Tok, Error> {
        if !id_char(self.peek(0), true) {
            return self.error(self.loc(), "invalid variable name");
        }
        let start = self.pos;
        self.pos += 1;
        while id_char(self.peek(0), false) {
            self.pos += 1;
        }
        self.str_val = String::from_utf8_lossy(&self.text()[start..self.pos]).into_owned();
        Ok(Tok::VarName)
    }

    fn lex_identifier(&mut self) -> Result<Tok, Error> {
        while id_char(self.peek(0), false) {
            self.pos += 1;
        }
        let s = String::from_utf8_lossy(&self.text()[self.tok_start..self.pos]).into_owned();
        let kind = match s.as_str() {
            "int" => Tok::Int,
            "bit" => Tok::Bit,
            "bits" => Tok::Bits,
            "string" => Tok::String,
            "list" => Tok::List,
            "code" => Tok::Code,
            "dag" => Tok::Dag,
            "class" => Tok::Class,
            "def" => Tok::Def,
            "true" => Tok::True,
            "false" => Tok::False,
            "foreach" => Tok::Foreach,
            "defm" => Tok::Defm,
            "defset" => Tok::Defset,
            "deftype" => Tok::Deftype,
            "multiclass" => Tok::MultiClass,
            "field" => Tok::Field,
            "let" => Tok::Let,
            "in" => Tok::In,
            "defvar" => Tok::Defvar,
            "if" => Tok::If,
            "then" => Tok::Then,
            "else" => Tok::ElseKw,
            "assert" => Tok::Assert,
            "dump" => Tok::Dump,
            "include" => {
                self.lex_include()?;
                return self.lex();
            }
            _ => {
                self.str_val = s;
                Tok::Id
            }
        };
        Ok(kind)
    }

    fn lex_include(&mut self) -> Result<(), Error> {
        if self.lex_token(false)? != Tok::StrVal {
            return self.error(self.loc(), "expected filename after include");
        }
        let name = self.str_val.clone();
        let at = self.loc_at(self.pos);
        let Some(buf) = self.src.include(&name, at) else { return self.error(self.loc(), format!("could not find include file '{name}'")) };
        self.buf = buf;
        self.pos = 0;
        self.prep.push(Vec::new());
        Ok(())
    }

    fn skip_bcpl(&mut self) {
        self.pos += 1;
        while !self.at_end() && !matches!(self.text()[self.pos], b'\n' | b'\r') {
            self.pos += 1;
        }
    }

    fn skip_c_comment(&mut self) -> Result<(), Error> {
        self.pos += 1;
        let mut depth = 1;
        loop {
            match self.next_char() {
                EOF => return self.error(self.loc(), "unterminated comment"),
                c if c == i32::from(b'*') && self.peek(0) == i32::from(b'/') => {
                    self.pos += 1;
                    depth -= 1;
                    if depth == 0 {
                        return Ok(());
                    }
                }
                c if c == i32::from(b'/') && self.peek(0) == i32::from(b'*') => {
                    self.pos += 1;
                    depth += 1;
                }
                _ => {}
            }
        }
    }

    /// A `[{ … }]` code block, otherwise `[`.
    fn lex_bracket(&mut self) -> Result<Tok, Error> {
        if self.peek(0) != i32::from(b'{') {
            return Ok(Tok::LSquare);
        }
        self.pos += 1;
        let start = self.pos;
        loop {
            let c = self.next_char();
            if c == EOF {
                break;
            }
            if c != i32::from(b'}') {
                continue;
            }
            let c = self.next_char();
            if c == EOF {
                break;
            }
            if c == i32::from(b']') {
                self.str_val = String::from_utf8_lossy(&self.text()[start..self.pos - 2]).into_owned();
                return Ok(Tok::CodeFragment);
            }
        }
        self.error(self.loc_at(start - 2), "unterminated code block")
    }

    fn lex_exclaim(&mut self) -> Result<Tok, Error> {
        if !(self.peek(0) as u8).is_ascii_alphabetic() {
            return self.error(self.loc_at(self.pos - 1), "invalid \"!operator\"");
        }
        let start = self.pos;
        self.pos += 1;
        while (self.peek(0) as u8).is_ascii_alphabetic() && self.peek(0) != 0 {
            self.pos += 1;
        }
        let word = String::from_utf8_lossy(&self.text()[start..self.pos]).into_owned();
        let op = match word.as_str() {
            "eq" => Bang::Eq,
            "ne" => Bang::Ne,
            "le" => Bang::Le,
            "lt" => Bang::Lt,
            "ge" => Bang::Ge,
            "gt" => Bang::Gt,
            "if" => Bang::If,
            "cond" => Bang::Cond,
            "isa" => Bang::IsA,
            "head" => Bang::Head,
            "tail" => Bang::Tail,
            "size" => Bang::Size,
            "con" => Bang::Concat,
            "dag" => Bang::Dag,
            "add" => Bang::Add,
            "sub" => Bang::Sub,
            "mul" => Bang::Mul,
            "div" => Bang::Div,
            "not" => Bang::Not,
            "logtwo" => Bang::Log2,
            "and" => Bang::And,
            "or" => Bang::Or,
            "xor" => Bang::Xor,
            "shl" => Bang::Shl,
            "sra" => Bang::Sra,
            "srl" => Bang::Srl,
            "cast" => Bang::Cast,
            "empty" => Bang::Empty,
            "subst" => Bang::Subst,
            "foldl" => Bang::Foldl,
            "foreach" => Bang::ForEach,
            "filter" => Bang::Filter,
            "listconcat" => Bang::ListConcat,
            "listflatten" => Bang::ListFlatten,
            "listsplat" => Bang::ListSplat,
            "listremove" => Bang::ListRemove,
            "range" => Bang::Range,
            "strconcat" => Bang::StrConcat,
            "initialized" => Bang::Initialized,
            "interleave" => Bang::Interleave,
            "instances" => Bang::Instances,
            "substr" => Bang::Substr,
            "find" => Bang::Find,
            "setdagop" => Bang::SetDagOp,
            "getdagop" => Bang::GetDagOp,
            "setdagopname" => Bang::SetDagOpName,
            "getdagopname" => Bang::GetDagOpName,
            "getdagarg" => Bang::GetDagArg,
            "getdagname" => Bang::GetDagName,
            "setdagarg" => Bang::SetDagArg,
            "setdagname" => Bang::SetDagName,
            "exists" => Bang::Exists,
            "tolower" => Bang::ToLower,
            "toupper" => Bang::ToUpper,
            "repr" => Bang::Repr,
            "match" => Bang::Match,
            _ => return self.error(self.loc_at(start - 1), "unknown operator"),
        };
        Ok(Tok::Bang(op))
    }

    // ---- preprocessor (`#ifdef` / `#ifndef` / `#else` / `#endif` / `#define`, at line start only) ----

    fn prep_exit_include(&mut self, must_be_empty: bool) -> Result<(), Error> {
        if let Some(p) = self.prep.last().and_then(|s| s.last()) {
            return self.error(p.at, "reached EOF without matching #endif");
        }
        self.prep.pop();
        let _ = must_be_empty;
        Ok(())
    }

    /// Whether a directive follows `#` (it must be followed by blanks, an end of line or a comment).
    fn prep_directive(&self) -> Option<&'static str> {
        ["ifdef", "ifndef", "else", "endif", "define"].into_iter().find(|word| {
            let w = word.as_bytes();
            if self.text().get(self.pos..self.pos + w.len()) != Some(w) {
                return false;
            }
            let n = self.peek(w.len());
            if self.pos + w.len() >= self.text().len() || matches!(n as u8, b' ' | b'\t' | b'\n' | b'\r') {
                return true;
            }
            n == i32::from(b'/') && matches!(self.peek(w.len() + 1) as u8, b'*' | b'/')
        })
    }

    fn prep_macro_name(&mut self) -> String {
        while matches!(self.peek(0) as u8, b' ' | b'\t') && !self.at_end() {
            self.pos += 1;
        }
        self.tok_start = self.pos;
        if id_char(self.peek(0), true) && !self.at_end() {
            self.pos += 1;
            while id_char(self.peek(0), false) && !self.at_end() {
                self.pos += 1;
            }
        }
        String::from_utf8_lossy(&self.text()[self.tok_start..self.pos]).into_owned()
    }

    /// Only comments may follow a directive.
    fn prep_skip_directive_end(&mut self) -> Result<bool, Error> {
        while !self.at_end() {
            match self.text()[self.pos] {
                b' ' | b'\t' => self.pos += 1,
                b'\n' | b'\r' => return Ok(true),
                b'/' => {
                    if self.peek(1) == i32::from(b'/') {
                        self.pos += 1;
                        self.skip_bcpl();
                    } else if self.peek(1) == i32::from(b'*') {
                        self.tok_start = self.pos;
                        self.pos += 1;
                        self.skip_c_comment()?;
                    } else {
                        return Ok(false);
                    }
                }
                _ => return Ok(false),
            }
        }
        Ok(true)
    }

    /// Processes one directive; `live` = then lex the next live token (`None` = the directive only, while skipping a region).
    fn lex_preprocessor(&mut self, kind: &str, live: bool) -> Result<Option<Tok>, Error> {
        self.tok_start = self.pos;
        self.pos += kind.len();
        let at = self.loc();
        match kind {
            "ifdef" | "ifndef" => {
                let name = self.prep_macro_name();
                if name.is_empty() {
                    return self.error(at, format!("expected macro name after #{kind}"));
                }
                let defined = self.macros.contains(&name) != (kind == "ifndef");
                self.prep.last_mut().expect("include stack").push(Prep { is_else: false, defined, at });
                if !self.prep_skip_directive_end()? {
                    return self.error(self.loc_at(self.pos), format!("only comments are supported after #{kind} NAME"));
                }
                if !live {
                    return Ok(None);
                }
                if !defined {
                    self.prep_skip_region()?;
                }
                self.lex_token(false).map(Some)
            }
            "else" => {
                let Some(top) = self.prep.last_mut().and_then(|s| s.last_mut()) else { return self.error(at, "#else without #ifdef or #ifndef") };
                if top.is_else {
                    return self.error(at, "double #else");
                }
                *top = Prep { is_else: true, defined: !top.defined, at };
                if !self.prep_skip_directive_end()? {
                    return self.error(self.loc_at(self.pos), "only comments are supported after #else");
                }
                if !live {
                    return Ok(None);
                }
                self.prep_skip_region()?;
                self.lex_token(false).map(Some)
            }
            "endif" => {
                if self.prep.last().is_none_or(Vec::is_empty) {
                    return self.error(at, "#endif without #ifdef");
                }
                if !self.prep_skip_directive_end()? {
                    return self.error(self.loc_at(self.pos), "only comments are supported after #endif");
                }
                self.prep.last_mut().expect("include stack").pop();
                if !live {
                    return Ok(None);
                }
                self.lex_token(false).map(Some)
            }
            _ => {
                let name = self.prep_macro_name();
                if name.is_empty() {
                    return self.error(at, "expected macro name after #define");
                }
                self.macros.insert(name);
                if !self.prep_skip_directive_end()? {
                    return self.error(self.loc_at(self.pos), "only comments are supported after #define NAME");
                }
                self.lex_token(false).map(Some)
            }
        }
    }

    fn prep_enabled(&self) -> bool {
        self.prep.last().is_none_or(|s| s.iter().all(|p| p.defined))
    }

    /// Skips an inactive region until an `#else` / `#endif` makes processing active again.
    fn prep_skip_region(&mut self) -> Result<(), Error> {
        loop {
            while !self.at_end() && self.text()[self.pos] != b'\n' {
                self.pos += 1;
            }
            self.prep_skip_line_begin()?;
            if self.at_end() {
                break;
            }
            if self.text()[self.pos] != b'#' {
                continue;
            }
            self.pos += 1;
            let Some(kind) = self.prep_directive() else { continue };
            if kind == "define" {
                continue;
            }
            self.lex_preprocessor(kind, false)?;
            if self.prep_enabled() {
                return Ok(());
            }
            if self.at_end() {
                break;
            }
        }
        let at = self.prep.last().and_then(|s| s.last()).map_or(self.loc(), |p| p.at);
        self.error(at, "reached EOF without matching #endif")
    }

    fn prep_skip_line_begin(&mut self) -> Result<(), Error> {
        while !self.at_end() {
            match self.text()[self.pos] {
                b' ' | b'\t' | b'\n' | b'\r' => self.pos += 1,
                b'/' if self.peek(1) == i32::from(b'*') => {
                    self.tok_start = self.pos;
                    self.pos += 1;
                    self.skip_c_comment()?;
                }
                _ => return Ok(()),
            }
        }
        Ok(())
    }
}
// ======================================================================== init

/// A type id.
#[derive(Clone, Copy, Debug, PartialEq, Eq, Hash, PartialOrd, Ord)]
pub struct Ty(u32);

#[derive(Clone, Debug, PartialEq, Eq, Hash)]
pub enum TyKind {
    Bit,
    Bits(u32),
    Int,
    Str,
    Dag,
    List(Ty),
    /// A record type: a set of classes (sorted by name; empty = any record).
    Record(Vec<RecId>),
}

/// A value id.
#[derive(Clone, Copy, Debug, PartialEq, Eq, Hash, PartialOrd, Ord)]
pub struct I(u32);

#[derive(Clone, Copy, Debug, PartialEq, Eq, Hash)]
pub enum UnOp {
    ToLower,
    ToUpper,
    Cast,
    Not,
    Head,
    Tail,
    Size,
    Empty,
    GetDagOp,
    GetDagOpName,
    Log2,
    Repr,
    ListFlatten,
    Initialized,
}

#[derive(Clone, Copy, Debug, PartialEq, Eq, Hash)]
pub enum BinOp {
    Add,
    Sub,
    Mul,
    Div,
    And,
    Or,
    Xor,
    Shl,
    Sra,
    Srl,
    ListConcat,
    ListSplat,
    ListRemove,
    ListElem,
    ListSlice,
    RangeC,
    StrConcat,
    Interleave,
    Concat,
    Match,
    Eq,
    Ne,
    Le,
    Lt,
    Ge,
    Gt,
    GetDagArg,
    GetDagName,
    SetDagOp,
    SetDagOpName,
}

#[derive(Clone, Copy, Debug, PartialEq, Eq, Hash)]
pub enum TernOp {
    Subst,
    ForEach,
    Filter,
    If,
    Dag,
    Range,
    Substr,
    Find,
    SetDagArg,
    SetDagName,
}

/// A template argument: by position or by (qualified) name.
#[derive(Clone, Copy, Debug, PartialEq, Eq, Hash)]
pub enum ArgKey {
    Pos(u32),
    Named(I),
}

#[derive(Clone, Debug, PartialEq, Eq, Hash)]
pub enum Init {
    Unset,
    Bit(bool),
    Bits(Vec<I>),
    Int(i64),
    /// `anonymous_N` (the name of an anonymous record not yet final).
    Anon(u32),
    /// A string; `true` = code format (`[{…}]`).
    Str(String, bool),
    List(Vec<I>, Ty),
    Un(UnOp, I, Ty),
    Bin(BinOp, I, I, Ty),
    Tern(TernOp, I, I, I, Ty),
    Cond(Vec<I>, Vec<I>, Ty),
    Fold(I, I, I, I, I, Ty),
    IsA(Ty, I),
    Exists(Ty, I),
    Instances(Ty, I),
    Var(I, Ty),
    VarBit(I, u32),
    Def(RecId),
    /// `Class<args>` not yet instantiated (the arguments are [`Init::Arg`]s).
    VarDef(RecId, Vec<I>),
    Field(I, I, Ty),
    Dag(I, Option<I>, Vec<I>, Vec<Option<I>>),
    Arg(I, ArgKey),
}

/// All types, values and records (as `RecordKeeper` + `RecordKeeperImpl`).
pub struct Keeper {
    tys: Vec<TyKind>,
    ty_pool: HashMap<TyKind, Ty>,
    inits: Vec<Init>,
    pool: HashMap<Init, I>,
    pub recs: Vec<Record>,
    pub classes: BTreeMap<String, RecId>,
    pub defs: BTreeMap<String, RecId>,
    pub globals: BTreeMap<String, I>,
    anon: u32,
    /// The record a `VarDefInit` instantiated (LLVM keeps it in the node's `Def`) and where it first appeared.
    instantiated: HashMap<I, I>,
    vardef_loc: HashMap<I, Loc>,
    /// The first fatal error (LLVM's PrintFatalError exits; here it is kept and reported by the parser at a statement boundary).
    pub fatal: Option<String>,
    pub bit: Ty,
    pub int: Ty,
    pub string: Ty,
    pub dag: Ty,
    pub any_record: Ty,
    pub unset: I,
}

impl Keeper {
    #[must_use]
    pub fn new() -> Self {
        let mut k = Self {
            tys: Vec::new(),
            ty_pool: HashMap::new(),
            inits: Vec::new(),
            pool: HashMap::new(),
            recs: Vec::new(),
            classes: BTreeMap::new(),
            defs: BTreeMap::new(),
            globals: BTreeMap::new(),
            anon: 0,
            instantiated: HashMap::new(),
            vardef_loc: HashMap::new(),
            fatal: None,
            bit: Ty(0),
            int: Ty(0),
            string: Ty(0),
            dag: Ty(0),
            any_record: Ty(0),
            unset: I(0),
        };
        k.bit = k.ty(TyKind::Bit);
        k.int = k.ty(TyKind::Int);
        k.string = k.ty(TyKind::Str);
        k.dag = k.ty(TyKind::Dag);
        k.any_record = k.ty(TyKind::Record(Vec::new()));
        k.unset = k.get(Init::Unset);
        k
    }

    pub fn fail(&mut self, msg: impl Into<String>) {
        if self.fatal.is_none() {
            self.fatal = Some(msg.into());
        }
    }

    // ---------------- types ----------------

    pub fn ty(&mut self, kind: TyKind) -> Ty {
        if let Some(&t) = self.ty_pool.get(&kind) {
            return t;
        }
        let t = Ty(self.tys.len() as u32);
        self.tys.push(kind.clone());
        self.ty_pool.insert(kind, t);
        t
    }

    #[must_use]
    pub fn kind(&self, t: Ty) -> &TyKind {
        &self.tys[t.0 as usize]
    }

    pub fn list_of(&mut self, t: Ty) -> Ty {
        self.ty(TyKind::List(t))
    }

    pub fn bits(&mut self, n: u32) -> Ty {
        self.ty(TyKind::Bits(n))
    }

    /// The element type (`None` for a non-list).
    #[must_use]
    pub fn elem(&self, t: Ty) -> Option<Ty> {
        match self.kind(t) {
            TyKind::List(e) => Some(*e),
            _ => None,
        }
    }

    /// A set of classes ⇒ the record type (sorted by name).
    pub fn record_ty(&mut self, classes: &[RecId]) -> Ty {
        let mut v = classes.to_vec();
        v.sort_by_key(|&c| self.rec_name(c));
        self.ty(TyKind::Record(v))
    }

    #[must_use]
    pub fn ty_string(&self, t: Ty) -> String {
        match self.kind(t) {
            TyKind::Bit => "bit".into(),
            TyKind::Bits(n) => format!("bits<{n}>"),
            TyKind::Int => "int".into(),
            TyKind::Str => "string".into(),
            TyKind::Dag => "dag".into(),
            TyKind::List(e) => format!("list<{}>", self.ty_string(*e)),
            TyKind::Record(cs) if cs.len() == 1 => self.rec_name(cs[0]),
            TyKind::Record(cs) => format!("{{{}}}", cs.iter().map(|&c| self.rec_name(c)).collect::<Vec<_>>().join(", ")),
        }
    }

    /// `RecTy::typeIsConvertibleTo`。
    #[must_use]
    pub fn convertible(&self, a: Ty, b: Ty) -> bool {
        let kb = self.kind(b);
        match self.kind(a) {
            TyKind::Bit => matches!(kb, TyKind::Bit | TyKind::Int | TyKind::Bits(1)),
            TyKind::Bits(n) => match kb {
                TyKind::Bits(m) => n == m,
                TyKind::Bit => *n == 1,
                TyKind::Int => true,
                _ => false,
            },
            TyKind::Int => matches!(kb, TyKind::Bit | TyKind::Bits(_) | TyKind::Int),
            TyKind::Str => matches!(kb, TyKind::Str),
            TyKind::Dag => matches!(kb, TyKind::Dag),
            TyKind::List(e) => match kb {
                TyKind::List(e2) => self.convertible(*e, *e2),
                _ => false,
            },
            TyKind::Record(cs) => {
                if a == b {
                    return true;
                }
                match kb {
                    TyKind::Record(ts) => ts.iter().all(|&t| cs.iter().any(|&c| c == t || self.is_subclass_of(c, t))),
                    _ => false,
                }
            }
        }
    }

    /// `RecTy::typeIsA`。
    #[must_use]
    pub fn type_is_a(&self, a: Ty, b: Ty) -> bool {
        match (self.kind(a), self.kind(b)) {
            (TyKind::List(e1), TyKind::List(e2)) => self.type_is_a(*e1, *e2),
            (TyKind::List(_), _) => false,
            (TyKind::Record(_), _) => self.convertible(a, b),
            _ => a == b,
        }
    }

    /// `resolveTypes`: the common type of two types.
    pub fn resolve_types(&mut self, t1: Ty, t2: Ty) -> Option<Ty> {
        if t1 == t2 {
            return Some(t1);
        }
        if let (TyKind::Record(c1), TyKind::Record(_)) = (self.kind(t1).clone(), self.kind(t2)) {
            let mut common = Vec::new();
            let mut stack = c1;
            while let Some(r) = stack.pop() {
                if self.ty_is_subclass(t2, r) {
                    common.push(r);
                } else {
                    stack.extend(self.recs[r.0 as usize].supers.iter().copied());
                }
            }
            return Some(self.record_ty(&common));
        }
        if self.convertible(t1, t2) {
            return Some(t2);
        }
        if self.convertible(t2, t1) {
            return Some(t1);
        }
        if let (TyKind::List(e1), TyKind::List(e2)) = (self.kind(t1).clone(), self.kind(t2).clone()) {
            let e = self.resolve_types(e1, e2)?;
            return Some(self.list_of(e));
        }
        None
    }

    /// Whether some class of the record type `t` is `class` or derives from it.
    #[must_use]
    pub fn ty_is_subclass(&self, t: Ty, class: RecId) -> bool {
        match self.kind(t) {
            TyKind::Record(cs) => cs.iter().any(|&c| c == class || self.is_subclass_of(c, class)),
            _ => false,
        }
    }

    // ---------------- values ----------------

    /// Interns a value.
    pub fn get(&mut self, init: Init) -> I {
        if let Some(&i) = self.pool.get(&init) {
            return i;
        }
        let i = I(self.inits.len() as u32);
        self.inits.push(init.clone());
        self.pool.insert(init, i);
        i
    }

    #[must_use]
    pub fn init(&self, i: I) -> &Init {
        &self.inits[i.0 as usize]
    }

    pub fn int(&mut self, v: i64) -> I {
        self.get(Init::Int(v))
    }

    pub fn bit_init(&mut self, v: bool) -> I {
        self.get(Init::Bit(v))
    }

    pub fn str(&mut self, s: &str) -> I {
        self.get(Init::Str(s.to_string(), false))
    }

    pub fn code(&mut self, s: &str) -> I {
        self.get(Init::Str(s.to_string(), true))
    }

    pub fn list(&mut self, v: Vec<I>, elem: Ty) -> I {
        self.get(Init::List(v, elem))
    }

    pub fn var(&mut self, name: I, t: Ty) -> I {
        self.get(Init::Var(name, t))
    }

    pub fn def_init(&mut self, r: RecId) -> I {
        self.get(Init::Def(r))
    }

    /// A fresh anonymous name (`anonymous_N`, N counting up).
    pub fn new_anonymous_name(&mut self) -> I {
        let n = self.anon;
        self.anon += 1;
        self.get(Init::Anon(n))
    }

    /// A string value (`StringInit`).
    #[must_use]
    pub fn as_str(&self, i: I) -> Option<&str> {
        match self.init(i) {
            Init::Str(s, _) => Some(s),
            _ => None,
        }
    }

    #[must_use]
    pub fn as_int(&self, i: I) -> Option<i64> {
        match self.init(i) {
            Init::Int(v) => Some(*v),
            _ => None,
        }
    }

    #[must_use]
    pub fn is_unset(&self, i: I) -> bool {
        matches!(self.init(i), Init::Unset)
    }

    /// The type (`TypedInit::getType`; `?` and template arguments have none).
    pub fn type_of(&mut self, i: I) -> Option<Ty> {
        Some(match self.init(i).clone() {
            Init::Unset | Init::Arg(..) => return None,
            Init::Bit(_) | Init::VarBit(..) => self.bit,
            Init::Bits(v) => self.bits(v.len() as u32),
            Init::Int(_) | Init::IsA(..) | Init::Exists(..) => self.int,
            Init::Anon(_) | Init::Str(..) => self.string,
            Init::List(_, e) => self.list_of(e),
            Init::Un(_, _, t) | Init::Bin(_, _, _, t) | Init::Tern(_, _, _, _, t) | Init::Cond(_, _, t) | Init::Fold(_, _, _, _, _, t) | Init::Var(_, t) | Init::Field(_, _, t) => t,
            Init::Instances(t, _) => self.list_of(t),
            Init::Def(r) => self.rec_type(r),
            Init::VarDef(c, _) => self.record_ty(&[c]),
            Init::Dag(..) => self.dag,
        })
    }

    /// `Record::getType`: the record type of the direct superclasses.
    pub fn rec_type(&mut self, r: RecId) -> Ty {
        let supers = self.recs[r.0 as usize].supers.clone();
        self.record_ty(&supers)
    }

    #[must_use]
    pub fn rec_name(&self, r: RecId) -> String {
        self.unquoted(self.recs[r.0 as usize].name)
    }

    /// `Record::isSubClassOf` (recursively through the direct superclasses).
    #[must_use]
    pub fn is_subclass_of(&self, r: RecId, class: RecId) -> bool {
        self.recs[r.0 as usize].supers.iter().any(|&s| s == class || self.is_subclass_of(s, class))
    }

    // ---------------- conversions (convertInitializerTo / getCastTo / getBit / bit ranges) ----------------

    /// `convertInitializerTo`。
    pub fn convert(&mut self, i: I, t: Ty) -> Option<I> {
        let tk = self.kind(t).clone();
        match self.init(i).clone() {
            Init::Unset => Some(i),
            Init::Arg(v, _) => self.convert(v, t),
            Init::Bit(v) => match tk {
                TyKind::Bit => Some(i),
                TyKind::Int => Some(self.int(i64::from(v))),
                TyKind::Bits(1) => Some(self.get(Init::Bits(vec![i]))),
                _ => None,
            },
            Init::Bits(bits) => match tk {
                TyKind::Bit => (bits.len() == 1).then(|| bits[0]),
                TyKind::Bits(n) => (n as usize == bits.len()).then_some(i),
                TyKind::Int => self.bits_to_int(&bits).map(|v| self.int(v)),
                _ => None,
            },
            Init::Int(v) => match tk {
                TyKind::Int => Some(i),
                TyKind::Bit => (v == 0 || v == 1).then(|| self.bit_init(v != 0)),
                TyKind::Bits(n) => {
                    let fits = n >= 64 || (v >> n) == 0 || (v >> (n - 1)) == -1;
                    if !fits {
                        return None;
                    }
                    let bits = (0..n).map(|b| self.bit_init(b < 64 && (v >> b) & 1 != 0)).collect();
                    Some(self.get(Init::Bits(bits)))
                }
                _ => None,
            },
            Init::Str(..) => matches!(tk, TyKind::Str).then_some(i),
            Init::List(elems, _) => {
                if self.type_of(i) == Some(t) {
                    return Some(i);
                }
                let TyKind::List(e) = tk else { return None };
                let mut changed = false;
                let mut out = Vec::with_capacity(elems.len());
                for x in elems {
                    let c = self.convert(x, e)?;
                    changed |= c != x;
                    out.push(c);
                }
                Some(if changed { self.list(out, e) } else { i })
            }
            Init::Def(_) => {
                let my = self.type_of(i)?;
                (matches!(tk, TyKind::Record(_)) && self.convertible(my, t)).then_some(i)
            }
            _ => {
                let my = self.type_of(i)?;
                if my == t || self.type_is_a(my, t) {
                    return Some(i);
                }
                if my == self.bit && tk == TyKind::Bits(1) {
                    return Some(self.get(Init::Bits(vec![i])));
                }
                None
            }
        }
    }

    /// All known bits ⇒ an integer (`BitsInit::convertInitializerToInt`).
    #[must_use]
    pub fn bits_to_int(&self, bits: &[I]) -> Option<i64> {
        let mut v: i64 = 0;
        for (n, &b) in bits.iter().enumerate() {
            match self.init(b) {
                Init::Bit(x) => v |= i64::from(*x) << n,
                _ => return None,
            }
        }
        Some(v)
    }

    /// `getCastTo`。
    pub fn cast_to(&mut self, i: I, t: Ty) -> Option<I> {
        match self.init(i).clone() {
            Init::Unset => Some(i),
            Init::Arg(v, _) => self.cast_to(v, t),
            _ => {
                let my = self.type_of(i)?;
                if my == t || self.type_is_a(my, t) {
                    return Some(i);
                }
                if let Some(c) = self.convert(i, t) {
                    return Some(c);
                }
                if !self.convertible(my, t) {
                    return None;
                }
                let u = self.get(Init::Un(UnOp::Cast, i, t));
                Some(self.fold_un(u, None, false))
            }
        }
    }

    /// `getBit`。
    pub fn get_bit(&mut self, i: I, n: u32) -> I {
        match self.init(i).clone() {
            Init::Unset | Init::Bit(_) | Init::VarBit(..) => i,
            Init::Bits(b) => b[n as usize],
            Init::Int(v) => self.bit_init(n < 64 && (v >> n) & 1 != 0),
            Init::Arg(v, _) => self.get_bit(v, n),
            Init::Un(_, _, t) | Init::Bin(_, _, _, t) | Init::Tern(_, _, _, _, t) | Init::Var(_, t) | Init::Field(_, _, t) if t == self.bit => i,
            _ => self.get(Init::VarBit(i, n)),
        }
    }

    /// `convertInitializerBitRange`。
    pub fn bit_range(&mut self, i: I, bits: &[u32]) -> Option<I> {
        match self.init(i).clone() {
            Init::Unset | Init::Arg(..) => None,
            Init::Bits(v) => {
                let out = bits.iter().map(|&b| v.get(b as usize).copied()).collect::<Option<Vec<_>>>()?;
                Some(self.get(Init::Bits(out)))
            }
            Init::Int(v) => {
                if bits.iter().any(|&b| b >= 64) {
                    return None;
                }
                let out = bits.iter().map(|&b| self.bit_init((v >> b) & 1 != 0)).collect();
                Some(self.get(Init::Bits(out)))
            }
            _ => {
                let t = self.type_of(i)?;
                let TyKind::Bits(n) = *self.kind(t) else { return None };
                if bits.iter().any(|&b| b >= n) {
                    return None;
                }
                let out = bits.iter().map(|&b| self.get(Init::VarBit(i, b))).collect();
                Some(self.get(Init::Bits(out)))
            }
        }
    }

    /// `getFieldType`。
    pub fn field_type(&mut self, i: I, name: I) -> Option<Ty> {
        if let Init::Def(r) = *self.init(i) {
            return self.recs[r.0 as usize].value(name).map(|v| v.ty);
        }
        if matches!(self.init(i), Init::Unset | Init::Arg(..)) {
            return None;
        }
        let t = self.type_of(i)?;
        let TyKind::Record(cs) = self.kind(t).clone() else { return None };
        cs.iter().find_map(|&c| self.recs[c.0 as usize].value(name).map(|v| v.ty))
    }

    /// `isConcrete`。
    #[must_use]
    pub fn is_concrete(&self, i: I) -> bool {
        match self.init(i) {
            Init::Unset | Init::Bit(_) | Init::Int(_) | Init::Str(..) | Init::Def(_) => true,
            Init::Bits(v) | Init::List(v, _) => v.iter().all(|&x| self.is_concrete(x)),
            Init::Dag(op, _, args, _) => self.is_concrete(*op) && args.iter().all(|&x| self.is_concrete(x)),
            Init::Cond(c, v, _) => c.iter().chain(v).all(|&x| self.is_concrete(x)),
            Init::Field(r, name, _) => match self.init(*r) {
                Init::Def(d) => self.recs[d.0 as usize].value(*name).is_some_and(|v| self.is_concrete(v.value)),
                _ => false,
            },
            _ => false,
        }
    }

    /// `isComplete`。
    #[must_use]
    pub fn is_complete(&self, i: I) -> bool {
        match self.init(i) {
            Init::Unset | Init::Fold(..) | Init::IsA(..) | Init::Exists(..) | Init::Instances(..) | Init::Arg(..) => false,
            Init::Bits(v) | Init::List(v, _) => v.iter().all(|&x| self.is_complete(x)),
            Init::Tern(_, a, b, c, _) => self.is_complete(*a) && self.is_complete(*b) && self.is_complete(*c),
            Init::Cond(c, v, _) => c.iter().chain(v).all(|&x| self.is_complete(x)),
            _ => true,
        }
    }

    // ---------------- printing (getAsString / getAsUnquotedString) ----------------

    #[must_use]
    pub fn unquoted(&self, i: I) -> String {
        match self.init(i) {
            Init::Str(s, _) => s.clone(),
            _ => self.string(i),
        }
    }

    /// `getAsString`。
    #[must_use]
    pub fn string(&self, i: I) -> String {
        let s = |x: I| self.string(x);
        match self.init(i) {
            Init::Unset => "?".into(),
            Init::Bit(v) => if *v { "1" } else { "0" }.into(),
            Init::Bits(v) => format!("{{ {} }}", v.iter().rev().map(|&b| s(b)).collect::<Vec<_>>().join(", ")),
            Init::Int(v) => v.to_string(),
            Init::Anon(n) => format!("anonymous_{n}"),
            Init::Str(v, false) => format!("\"{v}\""),
            Init::Str(v, true) => format!("[{{{v}}}]"),
            Init::List(v, _) => format!("[{}]", v.iter().map(|&x| s(x)).collect::<Vec<_>>().join(", ")),
            Init::Un(op, x, t) => {
                let name = match op {
                    UnOp::Cast => format!("!cast<{}>", self.ty_string(*t)),
                    UnOp::Not => "!not".into(),
                    UnOp::Head => "!head".into(),
                    UnOp::Tail => "!tail".into(),
                    UnOp::Size => "!size".into(),
                    UnOp::Empty => "!empty".into(),
                    UnOp::GetDagOp => "!getdagop".into(),
                    UnOp::GetDagOpName => "!getdagopname".into(),
                    UnOp::Log2 => "!logtwo".into(),
                    UnOp::ListFlatten => "!listflatten".into(),
                    UnOp::Repr => "!repr".into(),
                    UnOp::ToLower => "!tolower".into(),
                    UnOp::ToUpper => "!toupper".into(),
                    UnOp::Initialized => "!initialized".into(),
                };
                format!("{name}({})", s(*x))
            }
            Init::Bin(op, l, r, t) => {
                let name = match op {
                    BinOp::ListElem | BinOp::ListSlice => return format!("{}[{}]", s(*l), s(*r)),
                    BinOp::RangeC => return format!("{}...{}", s(*l), s(*r)),
                    BinOp::Concat => "!con".into(),
                    BinOp::Match => "!match".into(),
                    BinOp::Add => "!add".into(),
                    BinOp::Sub => "!sub".into(),
                    BinOp::Mul => "!mul".into(),
                    BinOp::Div => "!div".into(),
                    BinOp::And => "!and".into(),
                    BinOp::Or => "!or".into(),
                    BinOp::Xor => "!xor".into(),
                    BinOp::Shl => "!shl".into(),
                    BinOp::Sra => "!sra".into(),
                    BinOp::Srl => "!srl".into(),
                    BinOp::Eq => "!eq".into(),
                    BinOp::Ne => "!ne".into(),
                    BinOp::Le => "!le".into(),
                    BinOp::Lt => "!lt".into(),
                    BinOp::Ge => "!ge".into(),
                    BinOp::Gt => "!gt".into(),
                    BinOp::ListConcat => "!listconcat".into(),
                    BinOp::ListSplat => "!listsplat".into(),
                    BinOp::ListRemove => "!listremove".into(),
                    BinOp::StrConcat => "!strconcat".into(),
                    BinOp::Interleave => "!interleave".into(),
                    BinOp::SetDagOp => "!setdagop".into(),
                    BinOp::SetDagOpName => "!setdagopname".into(),
                    BinOp::GetDagArg => format!("!getdagarg<{}>", self.ty_string(*t)),
                    BinOp::GetDagName => "!getdagname".into(),
                };
                format!("{name}({}, {})", s(*l), s(*r))
            }
            Init::Tern(op, l, m, r, _) => {
                let (name, unquoted) = match op {
                    TernOp::Dag => ("!dag", false),
                    TernOp::Filter => ("!filter", true),
                    TernOp::ForEach => ("!foreach", true),
                    TernOp::If => ("!if", false),
                    TernOp::Range => ("!range", false),
                    TernOp::Subst => ("!subst", false),
                    TernOp::Substr => ("!substr", false),
                    TernOp::Find => ("!find", false),
                    TernOp::SetDagArg => ("!setdagarg", false),
                    TernOp::SetDagName => ("!setdagname", false),
                };
                let lhs = if unquoted { self.unquoted(*l) } else { s(*l) };
                format!("{name}({lhs}, {}, {})", s(*m), s(*r))
            }
            Init::Cond(c, v, _) => format!("!cond({})", c.iter().zip(v).map(|(&a, &b)| format!("{}: {}", s(a), s(b))).collect::<Vec<_>>().join(", ")),
            Init::Fold(st, l, a, b, e, _) => format!("!foldl({}, {}, {}, {}, {})", s(*st), s(*l), self.unquoted(*a), self.unquoted(*b), s(*e)),
            Init::IsA(t, e) => format!("!isa<{}>({})", self.ty_string(*t), s(*e)),
            Init::Exists(t, e) => format!("!exists<{}>({})", self.ty_string(*t), s(*e)),
            Init::Instances(t, e) => format!("!instances<{}>({})", self.ty_string(*t), s(*e)),
            Init::Var(name, _) => self.as_str(*name).map_or_else(|| s(*name), str::to_string),
            Init::VarBit(v, b) => format!("{}{{{b}}}", s(*v)),
            Init::Def(r) => self.recs[r.0 as usize].name_str(self),
            Init::VarDef(c, args) => format!("{}<{}>", self.rec_name(*c), args.iter().map(|&a| s(a)).collect::<Vec<_>>().join(", ")),
            Init::Field(r, name, _) => format!("{}.{}", s(*r), self.as_str(*name).unwrap_or("")),
            Init::Dag(op, name, args, names) => {
                let mut out = format!("({}", s(*op));
                if let Some(n) = name {
                    out += &format!(":${}", self.unquoted(*n));
                }
                if !args.is_empty() {
                    out.push(' ');
                    let parts: Vec<String> = args
                        .iter()
                        .zip(names)
                        .map(|(&a, n)| match n {
                            Some(n) => format!("{}:${}", s(a), self.unquoted(*n)),
                            None => s(a),
                        })
                        .collect();
                    out += &parts.join(", ");
                }
                out + ")"
            }
            Init::Arg(v, ArgKey::Pos(n)) => format!("{n}: {}", s(*v)),
            Init::Arg(v, ArgKey::Named(n)) => format!("{}: {}", s(*n), s(*v)),
        }
    }
}
// ======================================================================== record

#[derive(Clone, Copy, Debug, PartialEq, Eq, Hash, PartialOrd, Ord)]
pub struct RecId(u32);

#[derive(Clone, Copy, Debug, PartialEq, Eq)]
pub enum Kind {
    Def,
    AnonymousDef,
    Class,
    MultiClass,
}

#[derive(Clone, Copy, Debug, PartialEq, Eq)]
pub enum FieldKind {
    Normal,
    /// Declared with `field`: may stay non-concrete (`!fields` in the JSON).
    NonconcreteOk,
    TemplateArg,
}

/// A field (`RecordVal`).
#[derive(Clone, Debug)]
pub struct Val {
    pub name: I,
    pub ty: Ty,
    pub kind: FieldKind,
    pub value: I,
    pub used: bool,
}

#[derive(Clone, Debug)]
pub struct Assertion {
    pub loc: Loc,
    pub cond: I,
    pub msg: I,
}

#[derive(Clone, Debug)]
pub struct Record {
    pub name: I,
    pub locs: Vec<Loc>,
    pub targs: Vec<I>,
    pub vals: Vec<Val>,
    pub asserts: Vec<Assertion>,
    pub dumps: Vec<(Loc, I)>,
    /// The direct superclasses (as `DirectSuperClasses`).
    pub supers: Vec<RecId>,
    pub kind: Kind,
}

impl Record {
    #[must_use]
    pub fn value(&self, name: I) -> Option<&Val> {
        self.vals.iter().find(|v| v.name == name)
    }

    pub fn value_mut(&mut self, name: I) -> Option<&mut Val> {
        self.vals.iter_mut().find(|v| v.name == name)
    }

    #[must_use]
    pub fn is_template_arg(&self, name: I) -> bool {
        self.targs.contains(&name)
    }

    /// The name (`getName`; `anonymous_N` for an anonymous record not yet named).
    #[must_use]
    pub fn name_str(&self, k: &Keeper) -> String {
        k.unquoted(self.name)
    }
}

/// `Resolver`: variable name ⇒ value.
pub trait Resolver {
    fn resolve(&mut self, k: &mut Keeper, var: I) -> Option<I>;
    fn current(&self) -> Option<RecId>;
    fn is_final(&self) -> bool {
        false
    }
    fn keep_unset_bits(&self) -> bool {
        false
    }
}

/// `MapResolver`: a table; a value is resolved against the whole table the first time it is used.
pub struct MapResolver {
    map: HashMap<I, (I, bool)>,
    cur: Option<RecId>,
    pub fin: bool,
}

impl MapResolver {
    #[must_use]
    pub fn new(cur: Option<RecId>) -> Self {
        Self { map: HashMap::new(), cur, fin: false }
    }

    pub fn set(&mut self, key: I, value: I) {
        self.map.insert(key, (value, false));
    }
}

impl Resolver for MapResolver {
    fn resolve(&mut self, k: &mut Keeper, var: I) -> Option<I> {
        let &(v, done) = self.map.get(&var)?;
        if !done && self.map.len() > 1 {
            self.map.remove(&var);
            let v = k.resolve(v, self);
            self.map.insert(var, (v, true));
            return Some(v);
        }
        Some(v)
    }

    fn current(&self) -> Option<RecId> {
        self.cur
    }

    fn is_final(&self) -> bool {
        self.fin
    }
}

/// `RecordResolver`: variables are the current record's fields (resolved fully, guarding against cycles).
pub struct RecordResolver {
    cur: RecId,
    cache: HashMap<I, Option<I>>,
    stack: Vec<I>,
    pub name: Option<I>,
    pub fin: bool,
}

impl RecordResolver {
    #[must_use]
    pub fn new(cur: RecId) -> Self {
        Self { cur, cache: HashMap::new(), stack: Vec::new(), name: None, fin: false }
    }
}

impl Resolver for RecordResolver {
    fn resolve(&mut self, k: &mut Keeper, var: I) -> Option<I> {
        if let Some(Some(v)) = self.cache.get(&var) {
            return Some(*v);
        }
        if self.stack.contains(&var) {
            return None;
        }
        let rec = &k.recs[self.cur.0 as usize];
        let mut val = None;
        if let Some(rv) = rec.value(var) {
            let v = rv.value;
            if !k.is_unset(v) {
                self.stack.push(var);
                val = Some(k.resolve(v, self));
                self.stack.pop();
            }
        } else if let Some(name) = self.name
            && var == rec.name
        {
            self.stack.push(var);
            val = Some(k.resolve(name, self));
            self.stack.pop();
        }
        self.cache.insert(var, val);
        val
    }

    fn current(&self) -> Option<RecId> {
        Some(self.cur)
    }

    fn is_final(&self) -> bool {
        self.fin
    }

    fn keep_unset_bits(&self) -> bool {
        true
    }
}

/// `ShadowResolver`: hides some names (the loop variables of `!foreach` / `!foldl`).
pub struct ShadowResolver<'r> {
    pub inner: &'r mut dyn Resolver,
    pub shadowed: HashSet<I>,
}

impl Resolver for ShadowResolver<'_> {
    fn resolve(&mut self, k: &mut Keeper, var: I) -> Option<I> {
        if self.shadowed.contains(&var) {
            return None;
        }
        self.inner.resolve(k, var)
    }

    fn current(&self) -> Option<RecId> {
        self.inner.current()
    }

    fn is_final(&self) -> bool {
        self.inner.is_final()
    }
}

/// `TrackUnresolvedResolver`: records whether a variable could not be resolved.
pub struct TrackUnresolved<'r> {
    pub inner: Option<&'r mut dyn Resolver>,
    pub found: bool,
}

impl Resolver for TrackUnresolved<'_> {
    fn resolve(&mut self, k: &mut Keeper, var: I) -> Option<I> {
        let mut out = None;
        if let Some(r) = self.inner.as_deref_mut() {
            out = r.resolve(k, var);
            if let Some(v) = out
                && !self.found
            {
                let mut sub = TrackUnresolved { inner: None, found: false };
                k.resolve(v, &mut sub);
                self.found |= sub.found;
            }
        }
        if out.is_none() {
            self.found = true;
        }
        out
    }

    fn current(&self) -> Option<RecId> {
        self.inner.as_ref().and_then(|r| r.current())
    }

    fn is_final(&self) -> bool {
        false
    }
}

/// `HasReferenceResolver`: only checks whether a name is referenced.
pub struct HasReference {
    pub var: I,
    pub found: bool,
    pub fin: bool,
}

impl Resolver for HasReference {
    fn resolve(&mut self, _: &mut Keeper, var: I) -> Option<I> {
        if var == self.var {
            self.found = true;
        }
        None
    }

    fn current(&self) -> Option<RecId> {
        None
    }

    fn is_final(&self) -> bool {
        self.fin
    }
}

impl Keeper {
    pub fn rec(&self, r: RecId) -> &Record {
        &self.recs[r.0 as usize]
    }

    pub fn rec_mut(&mut self, r: RecId) -> &mut Record {
        &mut self.recs[r.0 as usize]
    }

    /// Adds a record.
    pub fn add_record(&mut self, rec: Record) -> RecId {
        self.recs.push(rec);
        RecId(self.recs.len() as u32 - 1)
    }

    /// Copies a record (`Record(const Record &)`: dumps are not copied).
    pub fn copy_record(&mut self, r: RecId) -> RecId {
        let mut rec = self.rec(r).clone();
        rec.dumps.clear();
        self.add_record(rec)
    }

    /// `RecordVal::setValue`: cast to the field's type; a `bits` field is split into single bits. `Err` if the cast fails.
    pub fn set_val(&mut self, r: RecId, name: I, v: I) -> Result<(), ()> {
        let ty = self.rec(r).value(name).expect("field exists").ty;
        let Some(mut val) = self.cast_to(v, ty) else { return Err(()) };
        if let TyKind::Bits(n) = *self.kind(ty)
            && !matches!(self.init(val), Init::Bits(_))
        {
            let bits = (0..n).map(|b| self.get_bit(val, b)).collect();
            val = self.get(Init::Bits(bits));
        }
        self.rec_mut(r).value_mut(name).expect("field exists").value = val;
        Ok(())
    }

    /// `Record::resolveReferences(Resolver &, SkipVal)`。
    pub fn resolve_record(&mut self, r: RecId, res: &mut dyn Resolver, skip: Option<I>) {
        let old = self.rec(r).name;
        let new = self.resolve(old, res);
        if new != old {
            self.rec_mut(r).name = new;
        }
        let names: Vec<I> = self.rec(r).vals.iter().map(|v| v.name).collect();
        for name in names {
            if Some(name) == skip {
                continue;
            }
            let v = self.rec(r).value(name).expect("field exists").value;
            let vr = self.resolve(v, res);
            if self.set_val(r, name, vr).is_err() {
                let ty = self.rec(r).value(name).expect("field exists").ty;
                let of = self.type_of(vr).map(|t| format!("of type '{}' ", self.ty_string(t))).unwrap_or_default();
                let msg = format!(
                    "Invalid value {of}found when setting field '{}' of type '{}' after resolving references: {}",
                    self.unquoted(name),
                    self.ty_string(ty),
                    self.unquoted(vr)
                );
                self.fail(msg);
            }
        }
        for n in 0..self.rec(r).asserts.len() {
            let a = self.rec(r).asserts[n].clone();
            let cond = self.resolve(a.cond, res);
            let msg = self.resolve(a.msg, res);
            self.rec_mut(r).asserts[n] = Assertion { loc: a.loc, cond, msg };
        }
        for n in 0..self.rec(r).dumps.len() {
            let (loc, m) = self.rec(r).dumps[n];
            let m = self.resolve(m, res);
            self.rec_mut(r).dumps[n] = (loc, m);
        }
    }

    /// `Record::resolveReferences(NewName)`: resolve fully against the record's own fields.
    pub fn resolve_record_self(&mut self, r: RecId, new_name: Option<I>) {
        let mut res = RecordResolver::new(r);
        res.name = new_name;
        res.fin = true;
        self.resolve_record(r, &mut res, None);
    }

    /// All superclasses (depth first, a superclass's superclasses before it, as `getSuperClasses`).
    #[must_use]
    pub fn all_supers(&self, r: RecId) -> Vec<RecId> {
        let mut out = Vec::new();
        for &s in &self.rec(r).supers {
            out.extend(self.all_supers(s));
            out.push(s);
        }
        out
    }

    /// Checks the assertions (`checkRecordAssertions`): a false condition is an error.
    pub fn check_assertions(&mut self, r: RecId) {
        let mut res = RecordResolver::new(r);
        res.fin = true;
        let asserts = self.rec(r).asserts.clone();
        for a in asserts {
            let cond = self.resolve(a.cond, &mut res);
            let msg = self.resolve(a.msg, &mut res);
            self.check_assert(cond, msg);
        }
    }

    /// `CheckAssert`。
    pub fn check_assert(&mut self, cond: I, msg: I) {
        let int = self.int;
        match self.convert(cond, int).and_then(|c| self.as_int(c)) {
            Some(0) => {
                let m = self.as_str(msg).map_or_else(|| "(assert message is not a string)".to_string(), str::to_string);
                self.fail(format!("assertion failed: {m}"));
            }
            Some(_) => {}
            None => self.fail("assert condition must of type bit, bits, or int."),
        }
    }

    /// Prints a record (`operator<<(raw_ostream &, const Record &)`, for `!repr`).
    #[must_use]
    pub fn print_record(&self, r: RecId) -> String {
        let rec = self.rec(r);
        let mut out = self.unquoted(rec.name);
        if !rec.targs.is_empty() {
            let parts: Vec<String> = rec.targs.iter().map(|&t| self.print_val(rec.value(t).expect("template argument exists"))).collect();
            out += &format!("<{}>", parts.join(", "));
        }
        out += " {";
        let supers = self.all_supers(r);
        if !supers.is_empty() {
            out += "\t//";
            for s in supers {
                out += &format!(" {}", self.rec_name(s));
            }
        }
        out += "\n";
        for nonconcrete in [true, false] {
            for v in &rec.vals {
                if (v.kind == FieldKind::NonconcreteOk) == nonconcrete && !rec.is_template_arg(v.name) {
                    out += &format!("  {};\n", self.print_val(v));
                }
            }
        }
        out + "}\n"
    }

    fn print_val(&self, v: &Val) -> String {
        let ty = if v.ty == self.string {
            if matches!(self.init(v.value), Init::Str(_, true)) { "code".to_string() } else { "string".to_string() }
        } else {
            self.ty_string(v.ty)
        };
        let field = if v.kind == FieldKind::NonconcreteOk { "field " } else { "" };
        format!("{field}{ty} {} = {}", self.unquoted(v.name), self.string(v.value))
    }
}
// ======================================================================== eval
// ================ evaluation: resolveReferences and every operator's Fold (as Record.cpp) ================

impl Keeper {
    /// `Init::resolveReferences`。
    pub fn resolve(&mut self, i: I, r: &mut dyn Resolver) -> I {
        match self.init(i).clone() {
            Init::Unset | Init::Bit(_) | Init::Int(_) | Init::Str(..) | Init::Def(_) => i,
            Init::Arg(v, key) => {
                let nv = self.resolve(v, r);
                if nv == v { i } else { self.get(Init::Arg(nv, key)) }
            }
            Init::Bits(bits) => {
                let mut changed = false;
                let mut out = Vec::with_capacity(bits.len());
                let mut cached: Option<(I, I)> = None;
                for &b in &bits {
                    let nb = if let Init::VarBit(var, n) = *self.init(b) {
                        let res = match cached {
                            Some((v, res)) if v == var => res,
                            _ => {
                                let res = self.resolve(var, r);
                                cached = Some((var, res));
                                res
                            }
                        };
                        self.get_bit(res, n)
                    } else {
                        let res = self.resolve(b, r);
                        self.get_bit(res, 0)
                    };
                    let nb = if self.is_unset(nb) && r.keep_unset_bits() { b } else { nb };
                    changed |= nb != b;
                    out.push(nb);
                }
                if changed { self.get(Init::Bits(out)) } else { i }
            }
            Init::Anon(_) => {
                let new = r.resolve(self, i).unwrap_or(i);
                if r.is_final()
                    && let Init::Anon(n) = *self.init(new)
                {
                    return self.str(&format!("anonymous_{n}"));
                }
                new
            }
            Init::List(elems, e) => {
                let mut changed = false;
                let out: Vec<I> = elems
                    .iter()
                    .map(|&x| {
                        let y = self.resolve(x, r);
                        changed |= y != x;
                        y
                    })
                    .collect();
                if changed { self.list(out, e) } else { i }
            }
            Init::Un(op, lhs, t) => {
                let nl = self.resolve(lhs, r);
                if nl != lhs || (r.is_final() && op == UnOp::Cast) {
                    let u = self.get(Init::Un(op, nl, t));
                    return self.fold_un(u, r.current(), r.is_final());
                }
                i
            }
            Init::Bin(op, lhs, rhs, t) => {
                let nl = self.resolve(lhs, r);
                if matches!(op, BinOp::And | BinOp::Or) {
                    let int = self.int;
                    if let Some(li) = self.convert(nl, int)
                        && let Some(v) = self.as_int(li)
                        && ((op == BinOp::And && v == 0) || (op == BinOp::Or && v == -1))
                    {
                        return li;
                    }
                }
                let nr = self.resolve(rhs, r);
                if nl != lhs || nr != rhs {
                    let b = self.get(Init::Bin(op, nl, nr, t));
                    return self.fold_bin(b, r.current());
                }
                i
            }
            Init::Tern(op, lhs, mhs, rhs, t) => {
                let nl = self.resolve(lhs, r);
                if op == TernOp::If && nl != lhs {
                    let int = self.int;
                    if let Some(v) = self.convert(nl, int).and_then(|c| self.as_int(c)) {
                        return if v != 0 { self.resolve(mhs, r) } else { self.resolve(rhs, r) };
                    }
                }
                let nm = self.resolve(mhs, r);
                let nr = if matches!(op, TernOp::ForEach | TernOp::Filter) {
                    let mut sr = ShadowResolver { inner: r, shadowed: [nl].into_iter().collect() };
                    self.resolve(rhs, &mut sr)
                } else {
                    self.resolve(rhs, r)
                };
                if nl != lhs || nm != mhs || nr != rhs {
                    let x = self.get(Init::Tern(op, nl, nm, nr, t));
                    return self.fold_tern(x, r.current());
                }
                i
            }
            Init::Cond(conds, vals, t) => {
                let mut changed = false;
                let mut nc = Vec::new();
                let mut nv = Vec::new();
                for (&c, &v) in conds.iter().zip(&vals) {
                    let c2 = self.resolve(c, r);
                    changed |= c2 != c;
                    nc.push(c2);
                    let v2 = self.resolve(v, r);
                    changed |= v2 != v;
                    nv.push(v2);
                }
                if changed {
                    let x = self.get(Init::Cond(nc, nv, t));
                    return self.fold_cond(x, r.current());
                }
                i
            }
            Init::Fold(start, list, a, b, expr, t) => {
                let ns = self.resolve(start, r);
                let nl = self.resolve(list, r);
                let ne = {
                    let mut sr = ShadowResolver { inner: r, shadowed: [a, b].into_iter().collect() };
                    self.resolve(expr, &mut sr)
                };
                if ns == start && nl == list && ne == expr {
                    return i;
                }
                let x = self.get(Init::Fold(ns, nl, a, b, ne, t));
                self.fold_foldl(x, r.current())
            }
            Init::IsA(t, e) => {
                let ne = self.resolve(e, r);
                if ne != e {
                    let x = self.get(Init::IsA(t, ne));
                    return self.fold_isa(x);
                }
                i
            }
            Init::Exists(t, e) => {
                let ne = self.resolve(e, r);
                if ne != e || r.is_final() {
                    let x = self.get(Init::Exists(t, ne));
                    return self.fold_exists(x, r.current(), r.is_final());
                }
                i
            }
            Init::Instances(t, e) => {
                let ne = self.resolve(e, r);
                if ne != e || r.is_final() {
                    let x = self.get(Init::Instances(t, ne));
                    return self.fold_instances(x, r.current(), r.is_final());
                }
                i
            }
            Init::Var(name, _) => r.resolve(self, name).unwrap_or(i),
            Init::VarBit(v, n) => {
                let nv = self.resolve(v, r);
                if nv != v { self.get_bit(nv, n) } else { i }
            }
            Init::VarDef(class, args) => {
                let mut ur = TrackUnresolved { inner: Some(r), found: false };
                let mut changed = false;
                let mut out = Vec::with_capacity(args.len());
                for &a in &args {
                    let na = self.resolve(a, &mut ur);
                    changed |= na != a;
                    out.push(na);
                }
                if changed {
                    let new = self.get(Init::VarDef(class, out));
                    if let Some(&loc) = self.vardef_loc.get(&i) {
                        self.vardef_loc.entry(new).or_insert(loc);
                    }
                    if !ur.found {
                        return self.instantiate(new);
                    }
                    return new;
                }
                i
            }
            Init::Field(rec, name, _) => {
                let nr = self.resolve(rec, r);
                if nr != rec {
                    let f = self.field(nr, name);
                    return self.fold_field(f, r.current());
                }
                i
            }
            Init::Dag(op, name, args, names) => {
                let mut changed = false;
                let out: Vec<I> = args
                    .iter()
                    .map(|&a| {
                        let b = self.resolve(a, r);
                        changed |= b != a;
                        b
                    })
                    .collect();
                let nop = self.resolve(op, r);
                if nop != op || changed { self.get(Init::Dag(nop, name, out, names)) } else { i }
            }
        }
    }

    /// `FieldInit::get`: typed as the field.
    pub fn field(&mut self, rec: I, name: I) -> I {
        let t = self.field_type(rec, name).unwrap_or(self.unset_ty());
        self.get(Init::Field(rec, name, t))
    }

    /// A placeholder when the field type is unknown (an assertion failure in LLVM; never reached).
    fn unset_ty(&self) -> Ty {
        self.any_record
    }

    pub fn str_concat(&mut self, a: I, b: I) -> I {
        if let (Init::Str(x, fx), Init::Str(y, fy)) = (self.init(a).clone(), self.init(b).clone()) {
            return self.get(Init::Str(x + &y, fx || fy));
        }
        let s = self.string;
        self.get(Init::Bin(BinOp::StrConcat, a, b, s))
    }

    pub fn list_concat(&mut self, a: I, b: I) -> I {
        if let (Init::List(x, e), Init::List(y, _)) = (self.init(a).clone(), self.init(b).clone()) {
            return self.list([x, y].concat(), e);
        }
        let t = self.type_of(a).expect("a list is typed");
        self.get(Init::Bin(BinOp::ListConcat, a, b, t))
    }

    fn to_int(&mut self, i: I) -> Option<i64> {
        let int = self.int;
        self.convert(i, int).and_then(|c| self.as_int(c))
    }

    // ---------------- unary ----------------

    pub fn fold_un(&mut self, u: I, cur: Option<RecId>, is_final: bool) -> I {
        let Init::Un(op, lhs, t) = self.init(u).clone() else { return u };
        match op {
            UnOp::Repr => {
                if self.is_concrete(lhs) {
                    let s = match *self.init(lhs) {
                        Init::Def(d) => self.print_record(d),
                        _ => self.string(lhs),
                    };
                    return self.str(&s);
                }
            }
            UnOp::ToLower => {
                if let Some(s) = self.as_str(lhs) {
                    let s = s.to_ascii_lowercase();
                    return self.str(&s);
                }
            }
            UnOp::ToUpper => {
                if let Some(s) = self.as_str(lhs) {
                    let s = s.to_ascii_uppercase();
                    return self.str(&s);
                }
            }
            UnOp::Cast => {
                if t == self.string {
                    if matches!(self.init(lhs), Init::Str(..)) {
                        return lhs;
                    }
                    if let Init::Def(_) = self.init(lhs) {
                        let s = self.string(lhs);
                        return self.str(&s);
                    }
                    if let Some(v) = self.to_int(lhs) {
                        return self.str(&v.to_string());
                    }
                } else if let TyKind::Record(_) = self.kind(t) {
                    if let Some(name) = self.as_str(lhs).map(str::to_string) {
                        let mut d = self.defs.get(&name).copied();
                        if d.is_none()
                            && let Some(c) = cur
                        {
                            let cname = self.rec(c).name;
                            let anon_match = matches!(self.init(cname), Init::Anon(n) if format!("anonymous_{n}") == name);
                            if cname == lhs || anon_match {
                                if !is_final {
                                    return u;
                                }
                                d = Some(c);
                            }
                        }
                        let Some(d) = d else {
                            if is_final {
                                self.fail(format!("Undefined reference to record: '{name}'"));
                            }
                            return u;
                        };
                        let di = self.def_init(d);
                        let dt = self.rec_type(d);
                        if !self.type_is_a(dt, t) {
                            let msg = format!("Expected type '{}', got '{}' in: {}", self.ty_string(t), self.ty_string(dt), self.string(u));
                            self.fail(msg);
                        }
                        return di;
                    }
                }
                if let Some(n) = self.convert(lhs, t) {
                    return n;
                }
            }
            UnOp::Initialized => {
                if self.is_unset(lhs) {
                    return self.int(0);
                }
                if self.is_concrete(lhs) {
                    return self.int(1);
                }
            }
            UnOp::Not => {
                if let Some(v) = self.to_int(lhs) {
                    return self.int(i64::from(v == 0));
                }
            }
            UnOp::Head => {
                if let Init::List(v, _) = self.init(lhs) {
                    return v[0];
                }
            }
            UnOp::Tail => {
                if let Init::List(v, e) = self.init(lhs).clone() {
                    return self.list(v[1..].to_vec(), e);
                }
            }
            UnOp::Size | UnOp::Empty => {
                let n = match self.init(lhs) {
                    Init::List(v, _) => Some(v.len()),
                    Init::Dag(_, _, a, _) => Some(a.len()),
                    Init::Str(s, _) => Some(s.len()),
                    _ => None,
                };
                if let Some(n) = n {
                    return if op == UnOp::Size { self.int(n as i64) } else { self.int(i64::from(n == 0)) };
                }
            }
            UnOp::GetDagOp => {
                if let Init::Dag(o, ..) = *self.init(lhs) {
                    let ot = self.type_of(o);
                    if ot.is_some_and(|ot| self.type_is_a(ot, t)) {
                        return o;
                    }
                    let msg = format!("Expected type '{}', got '{}' in: {}", self.ty_string(t), ot.map(|x| self.ty_string(x)).unwrap_or_default(), self.string(u));
                    self.fail(msg);
                }
            }
            UnOp::GetDagOpName => {
                if let Init::Dag(_, name, ..) = *self.init(lhs) {
                    return name.unwrap_or(self.unset);
                }
            }
            UnOp::Log2 => {
                if let Some(v) = self.to_int(lhs) {
                    if v <= 0 {
                        self.fail("Illegal operation: logtwo is undefined on arguments less than or equal to 0");
                        return u;
                    }
                    return self.int(i64::from(63 - v.leading_zeros()));
                }
            }
            UnOp::ListFlatten => {
                if let Init::List(v, e) = self.init(lhs).clone() {
                    let Some(inner) = self.elem(e) else { return lhs };
                    let mut flat = Vec::new();
                    for x in v {
                        match self.init(x) {
                            Init::List(y, _) => flat.extend(y.iter().copied()),
                            _ => return u,
                        }
                    }
                    return self.list(flat, inner);
                }
            }
        }
        u
    }

    // ---------------- binary ----------------

    /// `BinOpInit::CompareInit`。
    fn compare(&mut self, op: BinOp, l: I, r: I) -> Option<bool> {
        if let (Some(a), Some(b)) = (self.to_int(l), self.to_int(r)) {
            return Some(match op {
                BinOp::Eq => a == b,
                BinOp::Ne => a != b,
                BinOp::Le => a <= b,
                BinOp::Lt => a < b,
                BinOp::Ge => a >= b,
                _ => a > b,
            });
        }
        if let (Some(a), Some(b)) = (self.as_str(l), self.as_str(r)) {
            return Some(match op {
                BinOp::Eq => a == b,
                BinOp::Ne => a != b,
                BinOp::Le => a <= b,
                BinOp::Lt => a < b,
                BinOp::Ge => a >= b,
                _ => a > b,
            });
        }
        if matches!(op, BinOp::Eq | BinOp::Ne)
            && let (Init::Def(a), Init::Def(b)) = (self.init(l), self.init(r))
        {
            return Some((a == b) == (op == BinOp::Eq));
        }
        None
    }

    /// A dag argument by index or by name.
    fn dag_arg_no(&self, dag: I, key: I) -> Result<usize, String> {
        let Init::Dag(_, _, args, names) = self.init(dag) else { return Err("not a dag".into()) };
        if let Some(pos) = self.as_int(key) {
            if pos < 0 {
                return Err(format!("index {pos} is negative"));
            }
            if pos as usize >= args.len() {
                return Err(format!("index {pos} is out of range (dag has {} arguments)", args.len()));
            }
            return Ok(pos as usize);
        }
        let name = self.as_str(key).unwrap_or("");
        names.iter().position(|n| n.is_some_and(|n| self.as_str(n) == Some(name))).ok_or_else(|| format!("key '{name}' is not found"))
    }

    pub fn fold_bin(&mut self, b: I, cur: Option<RecId>) -> I {
        let Init::Bin(op, l, r, t) = self.init(b).clone() else { return b };
        let _ = cur;
        match op {
            BinOp::Concat => {
                if let (Init::Dag(lo, ln, la, lna), Init::Dag(ro, rn, ra, rna)) = (self.init(l).clone(), self.init(r).clone()) {
                    let lop = matches!(self.init(lo), Init::Def(_));
                    let rop = matches!(self.init(ro), Init::Def(_));
                    if (!lop && !self.is_unset(lo)) || (!rop && !self.is_unset(ro)) {
                        return b;
                    }
                    if lop && rop && lo != ro {
                        let msg = format!("Concatenated Dag operators do not match: '{}' vs. '{}'", self.string(l), self.string(r));
                        self.fail(msg);
                        return b;
                    }
                    let op = if lop { lo } else if rop { ro } else { self.unset };
                    return self.get(Init::Dag(op, ln.or(rn), [la, ra].concat(), [lna, rna].concat()));
                }
            }
            BinOp::Match => {
                if self.as_str(l).is_some() && self.as_str(r).is_some() {
                    self.fail("!match is not supported by riscvc tblgen");
                }
            }
            BinOp::ListConcat => {
                if let (Init::List(x, e), Init::List(y, _)) = (self.init(l).clone(), self.init(r).clone()) {
                    return self.list([x, y].concat(), e);
                }
            }
            BinOp::ListSplat => {
                if let Some(n) = self.as_int(r)
                    && let Some(vt) = self.type_of(l)
                {
                    if n < 0 {
                        self.fail(format!("!listsplat count {n} is negative"));
                        return b;
                    }
                    return self.list(vec![l; n as usize], vt);
                }
            }
            BinOp::ListRemove => {
                if let (Init::List(x, e), Init::List(y, _)) = (self.init(l).clone(), self.init(r).clone()) {
                    let mut out = Vec::new();
                    for a in x {
                        let found = y.iter().any(|&c| self.compare(BinOp::Eq, a, c) == Some(true));
                        if !found {
                            out.push(a);
                        }
                    }
                    return self.list(out, e);
                }
            }
            BinOp::ListElem => {
                if let (Init::List(x, _), Some(n)) = (self.init(l).clone(), self.as_int(r))
                    && n >= 0
                    && (n as usize) < x.len()
                {
                    return x[n as usize];
                }
            }
            BinOp::ListSlice => {
                if let (Init::List(x, e), Init::List(idx, _)) = (self.init(l).clone(), self.init(r).clone()) {
                    let mut out = Vec::new();
                    for k in idx {
                        match self.as_int(k) {
                            Some(n) if n >= 0 && (n as usize) < x.len() => out.push(x[n as usize]),
                            _ => return b,
                        }
                    }
                    return self.list(out, e);
                }
            }
            BinOp::RangeC => {
                if let (Some(s), Some(e)) = (self.as_int(l), self.as_int(r)) {
                    let v: Vec<i64> = if s <= e { (s..=e).collect() } else { (e..=s).rev().collect() };
                    let out = v.into_iter().map(|x| self.int(x)).collect();
                    let int = self.int;
                    return self.list(out, int);
                }
            }
            BinOp::StrConcat => {
                if let (Init::Str(x, fx), Init::Str(y, fy)) = (self.init(l).clone(), self.init(r).clone()) {
                    return self.get(Init::Str(x + &y, fx || fy));
                }
            }
            BinOp::Interleave => {
                if let (Init::List(v, e), Some(delim)) = (self.init(l).clone(), self.as_str(r).map(str::to_string)) {
                    if v.is_empty() {
                        return self.str("");
                    }
                    if e == self.string {
                        let mut parts = Vec::new();
                        let mut code = false;
                        for x in &v {
                            let Init::Str(s, c) = self.init(*x) else { return b };
                            parts.push(s.clone());
                            code |= *c && parts.len() > 1;
                        }
                        let joined = parts.join(&delim);
                        return self.get(Init::Str(joined, code));
                    }
                    let mut parts = Vec::new();
                    for x in v {
                        match self.to_int(x) {
                            Some(n) => parts.push(n.to_string()),
                            None => return b,
                        }
                    }
                    let joined = parts.join(&delim);
                    return self.str(&joined);
                }
            }
            BinOp::Eq | BinOp::Ne | BinOp::Le | BinOp::Lt | BinOp::Ge | BinOp::Gt => {
                if let Some(v) = self.compare(op, l, r) {
                    return self.bit_init(v);
                }
            }
            BinOp::GetDagArg => {
                if matches!(self.init(l), Init::Dag(..)) && matches!(self.init(r), Init::Int(_) | Init::Str(..)) {
                    let n = match self.dag_arg_no(l, r) {
                        Ok(n) => n,
                        Err(e) => {
                            self.fail(format!("!getdagarg {e}"));
                            return b;
                        }
                    };
                    let Init::Dag(_, _, args, _) = self.init(l).clone() else { return b };
                    let arg = args[n];
                    if let Some(at) = self.type_of(arg)
                        && !self.convertible(at, t)
                    {
                        return self.unset;
                    }
                    return arg;
                }
            }
            BinOp::GetDagName => {
                if let (Init::Dag(_, _, args, names), Some(pos)) = (self.init(l).clone(), self.as_int(r)) {
                    if pos < 0 || pos as usize >= args.len() {
                        self.fail(format!("!getdagname index is out of range 0...{}: {pos}", args.len() as i64 - 1));
                        return b;
                    }
                    return names[pos as usize].unwrap_or(self.unset);
                }
            }
            BinOp::SetDagOp => {
                if let (Init::Dag(_, _, args, names), Init::Def(_)) = (self.init(l).clone(), self.init(r)) {
                    return self.get(Init::Dag(r, None, args, names));
                }
            }
            BinOp::SetDagOpName => {
                if let (Init::Dag(o, _, args, names), Init::Str(..)) = (self.init(l).clone(), self.init(r)) {
                    return self.get(Init::Dag(o, Some(r), args, names));
                }
            }
            BinOp::Add | BinOp::Sub | BinOp::Mul | BinOp::Div | BinOp::And | BinOp::Or | BinOp::Xor | BinOp::Shl | BinOp::Sra | BinOp::Srl => {
                if let (Some(a), Some(c)) = (self.to_int(l), self.to_int(r)) {
                    let v = match op {
                        BinOp::Add => a.wrapping_add(c),
                        BinOp::Sub => a.wrapping_sub(c),
                        BinOp::Mul => a.wrapping_mul(c),
                        BinOp::Div => {
                            if c == 0 {
                                self.fail("Illegal operation: division by zero");
                                return b;
                            }
                            a.wrapping_div(c)
                        }
                        BinOp::And => a & c,
                        BinOp::Or => a | c,
                        BinOp::Xor => a ^ c,
                        _ => {
                            if !(0..64).contains(&c) {
                                self.fail("Illegal operation: out of bounds shift");
                                return b;
                            }
                            match op {
                                BinOp::Shl => ((a as u64) << c) as i64,
                                BinOp::Sra => a >> c,
                                _ => ((a as u64) >> c) as i64,
                            }
                        }
                    };
                    return self.int(v);
                }
            }
        }
        b
    }

    // ---------------- ternary ----------------

    /// `ItemApply`: resolve `rhs` with `lhs` bound to `item`.
    fn item_apply(&mut self, lhs: I, item: I, rhs: I, cur: Option<RecId>) -> I {
        let mut r = MapResolver::new(cur);
        r.set(lhs, item);
        self.resolve(rhs, &mut r)
    }

    fn foreach_dag(&mut self, lhs: I, dag: I, rhs: I, cur: Option<RecId>) -> I {
        let Init::Dag(op, name, args, names) = self.init(dag).clone() else { return dag };
        let mut change = false;
        let val = self.item_apply(lhs, op, rhs, cur);
        change |= val != op;
        let mut out = Vec::with_capacity(args.len());
        for a in args {
            let na = if matches!(self.init(a), Init::Dag(..)) { self.foreach_dag(lhs, a, rhs, cur) } else { self.item_apply(lhs, a, rhs, cur) };
            change |= na != a;
            out.push(na);
        }
        if change { self.get(Init::Dag(val, name, out, names)) } else { dag }
    }

    pub fn fold_tern(&mut self, x: I, cur: Option<RecId>) -> I {
        let Init::Tern(op, l, m, r, t) = self.init(x).clone() else { return x };
        match op {
            TernOp::Subst => {
                match (self.init(l).clone(), self.init(m).clone(), self.init(r).clone()) {
                    (Init::Def(_), Init::Def(md), Init::Def(rd)) => {
                        let val = if self.string(l) == self.string(r) { md } else { rd };
                        return self.def_init(val);
                    }
                    (Init::Var(..), Init::Var(mn, _), Init::Var(rn, _)) => {
                        let name = if self.string(l) == self.string(r) { mn } else { rn };
                        return self.var(name, t);
                    }
                    (Init::Str(ls, _), Init::Str(ms, _), Init::Str(rs, _)) => {
                        let mut val = rs;
                        let mut idx = 0;
                        while let Some(found) = val[idx..].find(&ls).map(|f| f + idx) {
                            val.replace_range(found..found + ls.len(), &ms);
                            idx = found + ms.len();
                            if ls.is_empty() && idx >= val.len() {
                                break;
                            }
                        }
                        return self.str(&val);
                    }
                    _ => {}
                }
            }
            TernOp::ForEach => {
                if matches!(self.init(m), Init::Dag(..)) {
                    return self.foreach_dag(l, m, r, cur);
                }
                if let Init::List(v, _) = self.init(m).clone() {
                    let out: Vec<I> = v.iter().map(|&item| self.item_apply(l, item, r, cur)).collect();
                    let e = self.elem(t).expect("!foreach yields a list");
                    return self.list(out, e);
                }
            }
            TernOp::Filter => {
                if let Init::List(v, _) = self.init(m).clone() {
                    let mut out = Vec::new();
                    for item in v {
                        let inc = self.item_apply(l, item, r, cur);
                        match self.to_int(inc) {
                            Some(n) => {
                                if n != 0 {
                                    out.push(item);
                                }
                            }
                            None => return x,
                        }
                    }
                    let e = self.elem(t).expect("!filter yields a list");
                    return self.list(out, e);
                }
            }
            TernOp::If => {
                if let Some(v) = self.to_int(l) {
                    return if v != 0 { m } else { r };
                }
            }
            TernOp::Dag => {
                let ml = if let Init::List(v, _) = self.init(m) { Some(v.clone()) } else { None };
                let rl = if let Init::List(v, _) = self.init(r) { Some(v.clone()) } else { None };
                let mok = ml.is_some() || self.is_unset(m);
                let rok = rl.is_some() || self.is_unset(r);
                if self.is_unset(m) && self.is_unset(r) {
                    return x;
                }
                if mok && rok && (ml.is_none() || rl.is_none() || ml.as_ref().map(Vec::len) == rl.as_ref().map(Vec::len)) {
                    let size = ml.as_ref().or(rl.as_ref()).map_or(0, Vec::len);
                    let mut args = Vec::new();
                    let mut names = Vec::new();
                    for n in 0..size {
                        let node = ml.as_ref().map_or(self.unset, |v| v[n]);
                        let name = rl.as_ref().map_or(self.unset, |v| v[n]);
                        if !matches!(self.init(name), Init::Str(..) | Init::Unset) {
                            return x;
                        }
                        args.push(node);
                        names.push(matches!(self.init(name), Init::Str(..)).then_some(name));
                    }
                    return self.get(Init::Dag(l, None, args, names));
                }
            }
            TernOp::Range => {
                if let (Some(s), Some(e), Some(step)) = (self.as_int(l), self.as_int(m), self.as_int(r)) {
                    if step == 0 {
                        self.fail("Step of !range can't be 0");
                        return x;
                    }
                    let mut out = Vec::new();
                    let mut v = s;
                    if s < e && step > 0 {
                        while v < e {
                            out.push(self.int(v));
                            v += step;
                        }
                    } else if s > e && step < 0 {
                        while v > e {
                            out.push(self.int(v));
                            v += step;
                        }
                    }
                    let int = self.int;
                    return self.list(out, int);
                }
            }
            TernOp::Substr => {
                if let (Init::Str(s, fmt), Some(start), Some(len)) = (self.init(l).clone(), self.as_int(m), self.as_int(r)) {
                    if start < 0 || start as usize > s.len() {
                        self.fail(format!("!substr start position is out of range 0...{}: {start}", s.len()));
                        return x;
                    }
                    if len < 0 {
                        self.fail("!substr length must be nonnegative");
                        return x;
                    }
                    let st = start as usize;
                    let end = st.saturating_add(len as usize).min(s.len());
                    return self.get(Init::Str(s[st..end].to_string(), fmt));
                }
            }
            TernOp::Find => {
                if let (Init::Str(s, _), Init::Str(pat, _), Some(start)) = (self.init(l).clone(), self.init(m).clone(), self.as_int(r)) {
                    if start < 0 || start as usize > s.len() {
                        self.fail(format!("!find start position is out of range 0...{}: {start}", s.len()));
                        return x;
                    }
                    return match s[start as usize..].find(&pat) {
                        Some(p) => self.int((p + start as usize) as i64),
                        None => self.int(-1),
                    };
                }
            }
            TernOp::SetDagArg | TernOp::SetDagName => {
                if matches!(self.init(l), Init::Dag(..)) && matches!(self.init(m), Init::Int(_) | Init::Str(..)) {
                    let n = match self.dag_arg_no(l, m) {
                        Ok(n) => n,
                        Err(e) => {
                            let which = if op == TernOp::SetDagArg { "!setdagarg" } else { "!setdagname" };
                            self.fail(format!("{which} {e}"));
                            return x;
                        }
                    };
                    let Init::Dag(o, name, mut args, mut names) = self.init(l).clone() else { return x };
                    if op == TernOp::SetDagArg {
                        args[n] = r;
                    } else {
                        names[n] = matches!(self.init(r), Init::Str(..)).then_some(r);
                    }
                    return self.get(Init::Dag(o, name, args, names));
                }
            }
        }
        x
    }

    pub fn fold_cond(&mut self, x: I, cur: Option<RecId>) -> I {
        let Init::Cond(conds, vals, t) = self.init(x).clone() else { return x };
        for (c, v) in conds.into_iter().zip(vals) {
            match self.to_int(c) {
                Some(n) if n != 0 => return self.convert(v, t).unwrap_or(v),
                Some(_) => {}
                None => return x,
            }
        }
        let who = cur.map(|c| self.rec_name(c)).unwrap_or_default();
        let msg = format!("{who} does not have any true condition in:{}", self.string(x));
        self.fail(msg);
        x
    }

    pub fn fold_foldl(&mut self, x: I, cur: Option<RecId>) -> I {
        let Init::Fold(start, list, a, b, expr, _) = self.init(x).clone() else { return x };
        if let Init::List(v, _) = self.init(list).clone() {
            let mut acc = start;
            for elt in v {
                let mut r = MapResolver::new(cur);
                r.set(a, acc);
                r.set(b, elt);
                acc = self.resolve(expr, &mut r);
            }
            return acc;
        }
        x
    }

    pub fn fold_isa(&mut self, x: I) -> I {
        let Init::IsA(check, e) = self.init(x).clone() else { return x };
        if let Some(et) = self.type_of(e) {
            if self.convertible(et, check) {
                return self.int(1);
            }
            if let TyKind::Record(_) = self.kind(check) {
                if (!self.convertible(check, et) && self.is_concrete(e)) || matches!(self.init(e), Init::Def(_)) {
                    return self.int(0);
                }
            } else {
                return self.int(0);
            }
        }
        x
    }

    pub fn fold_exists(&mut self, x: I, cur: Option<RecId>, is_final: bool) -> I {
        let Init::Exists(check, e) = self.init(x).clone() else { return x };
        if let Some(name) = self.as_str(e).map(str::to_string) {
            if let Some(&d) = self.defs.get(&name) {
                let dt = self.rec_type(d);
                let v = self.type_is_a(dt, check);
                return self.int(i64::from(v));
            }
            if let Some(c) = cur {
                let cname = self.rec(c).name;
                let anon_match = matches!(self.init(cname), Init::Anon(n) if format!("anonymous_{n}") == name);
                if cname == e || anon_match {
                    if !is_final {
                        return x;
                    }
                    let ct = self.rec_type(c);
                    let v = self.type_is_a(ct, check);
                    return self.int(i64::from(v));
                }
            }
            if is_final {
                return self.int(0);
            }
        }
        x
    }

    pub fn fold_instances(&mut self, x: I, cur: Option<RecId>, is_final: bool) -> I {
        let Init::Instances(t, regex) = self.init(x).clone() else { return x };
        if cur.is_some() && !is_final {
            return x;
        }
        if self.as_str(regex).is_some() {
            self.fail("!instances is not supported by riscvc tblgen");
        }
        let _ = t;
        x
    }

    pub fn fold_field(&mut self, f: I, cur: Option<RecId>) -> I {
        let Init::Field(rec, name, _) = self.init(f).clone() else { return f };
        if let Init::Def(d) = *self.init(rec) {
            if Some(d) == cur {
                let msg = format!("Attempting to access field '{}' of '{}' is a forbidden self-reference", self.unquoted(name), self.string(rec));
                self.fail(msg);
                return f;
            }
            if let Some(v) = self.rec(d).value(name).map(|v| v.value)
                && self.is_concrete(v)
            {
                return v;
            }
        }
        f
    }

    /// `VarDefInit::Fold`: instantiate once every argument is resolved.
    pub fn fold_vardef(&mut self, x: I) -> I {
        if let Some(&d) = self.instantiated.get(&x) {
            return d;
        }
        let Init::VarDef(_, args) = self.init(x).clone() else { return x };
        let mut r = TrackUnresolved { inner: None, found: false };
        for a in args {
            self.resolve(a, &mut r);
        }
        if !r.found { self.instantiate(x) } else { x }
    }

    /// `VarDefInit::instantiate`: a new anonymous record (`anonymous_N`), resolved with the arguments, given its class and added to the defs.
    pub fn instantiate(&mut self, x: I) -> I {
        if let Some(&d) = self.instantiated.get(&x) {
            return d;
        }
        let Init::VarDef(class, args) = self.init(x).clone() else { return x };
        let loc = self.vardef_loc.get(&x).copied().unwrap_or_default();
        let name = self.new_anonymous_name();
        let c = self.rec(class).clone();
        let new = self.add_record(Record { name, locs: vec![loc], targs: Vec::new(), vals: c.vals.clone(), asserts: c.asserts.clone(), dumps: c.dumps.clone(), supers: Vec::new(), kind: Kind::AnonymousDef });
        let mut r = MapResolver::new(Some(new));
        for &t in &c.targs {
            let v = self.rec(new).value(t).expect("template argument exists").value;
            r.set(t, v);
            self.rec_mut(new).vals.retain(|v| v.name != t);
        }
        for a in args {
            if let Init::Arg(v, key) = *self.init(a) {
                match key {
                    ArgKey::Pos(n) => r.set(c.targs[n as usize], v),
                    ArgKey::Named(name) => r.set(name, v),
                }
            }
        }
        self.resolve_record(new, &mut r, None);
        self.rec_mut(new).supers.push(class);
        self.resolve_record_self(new, None);
        let key = self.rec_name(new);
        self.defs.insert(key, new);
        self.check_assertions(new);
        let d = self.def_init(new);
        self.instantiated.insert(x, d);
        d
    }
}
// ======================================================================== parse
// ================ parsing (as TGParser.cpp) ================

/// One `let` item.
#[derive(Clone)]
struct LetRecord {
    name: I,
    bits: Vec<u32>,
    value: I,
    loc: Loc,
}

/// A record, a loop, an assertion or a dump (`RecordsEntry`).
#[derive(Clone)]
enum Entry {
    Rec(RecId),
    Loop(Box<ForeachLoop>),
    Assert(Assertion),
    Dump(Loc, I),
}

#[derive(Clone)]
struct ForeachLoop {
    loc: Loc,
    iter: Option<I>,
    list: I,
    entries: Vec<Entry>,
}

struct MultiClass {
    rec: RecId,
    entries: Vec<Entry>,
}

#[derive(Clone, Copy, PartialEq, Eq)]
enum ScopeKind {
    Local,
    Record(RecId),
    /// foreach: the loop variable (none for an `if`).
    Loop(Option<I>),
    MultiClass(usize),
}

struct Scope {
    kind: ScopeKind,
    vars: BTreeMap<String, I>,
}

struct Defset {
    elt: Ty,
    elements: Vec<I>,
}

/// A subclass reference `Class<args>` (for defm, `rec` is the multiclass's placeholder record).
struct SubClassRef {
    start: Loc,
    rec: RecId,
    args: Vec<I>,
}

#[derive(Clone, Copy, PartialEq, Eq)]
enum Mode {
    Value,
    Name,
}

pub struct Parser {
    lex: Lexer,
    pub k: Keeper,
    let_stack: Vec<Vec<LetRecord>>,
    multiclasses: Vec<MultiClass>,
    mc_names: BTreeMap<String, usize>,
    type_aliases: BTreeMap<String, Ty>,
    loops: Vec<ForeachLoop>,
    defsets: Vec<Defset>,
    cur_mc: Option<usize>,
    scopes: Vec<Scope>,
}

type R<T> = Result<T, Error>;

impl Parser {
    pub fn new(src: Sources, macros: &[String]) -> Self {
        Self {
            lex: Lexer::new(src, macros),
            k: Keeper::new(),
            let_stack: Vec::new(),
            multiclasses: Vec::new(),
            mc_names: BTreeMap::new(),
            type_aliases: BTreeMap::new(),
            loops: Vec::new(),
            defsets: Vec::new(),
            cur_mc: None,
            scopes: Vec::new(),
        }
    }

    fn tok(&self) -> Tok {
        self.lex.tok
    }

    fn next(&mut self) -> R<Tok> {
        self.lex.lex()
    }

    fn consume(&mut self, t: Tok) -> R<bool> {
        if self.tok() == t {
            self.next()?;
            return Ok(true);
        }
        Ok(false)
    }

    fn err<T>(&self, msg: impl Into<String>) -> R<T> {
        self.lex.error(self.lex.loc(), msg)
    }

    fn err_at<T>(&self, loc: Loc, msg: impl Into<String>) -> R<T> {
        self.lex.error(loc, msg)
    }

    /// Reports a fatal error recorded during evaluation.
    fn check(&mut self) -> R<()> {
        match self.k.fatal.take() {
            Some(m) => Err(Error::new(format!("{}: error: {m}", self.lex.src.format(self.lex.loc())))),
            None => Ok(()),
        }
    }

    fn push_scope(&mut self, kind: ScopeKind) {
        self.scopes.push(Scope { kind, vars: BTreeMap::new() });
    }

    fn pop_scope(&mut self) {
        self.scopes.pop();
    }

    fn mc_rec(&self) -> Option<RecId> {
        self.cur_mc.map(|m| self.multiclasses[m].rec)
    }

    // ---------------- names ----------------

    /// `QualifyName`: `record:name` (`::` for a multiclass).
    fn qualify(&mut self, rec: RecId, name: I) -> I {
        let sep = if self.k.rec(rec).kind == Kind::MultiClass { "::" } else { ":" };
        let rn = self.k.rec(rec).name;
        let sep = self.k.str(sep);
        let n = self.k.str_concat(rn, sep);
        let n = self.k.str_concat(n, name);
        if matches!(self.k.init(n), Init::Bin(..)) { self.k.fold_bin(n, Some(rec)) } else { n }
    }

    fn qualified_name(&mut self, rec: RecId) -> I {
        let name = self.k.str("NAME");
        self.qualify(rec, name)
    }

    /// `TGVarScope::getVar`: look a variable up from the innermost scope out.
    fn get_var(&mut self, name: I) -> Option<I> {
        let sname = self.k.as_str(name).unwrap_or("").to_string();
        for n in (0..self.scopes.len()).rev() {
            if let Some(&v) = self.scopes[n].vars.get(&sname) {
                return Some(v);
            }
            match self.scopes[n].kind {
                ScopeKind::Local => {}
                ScopeKind::Record(r) => {
                    if let Some(ty) = self.k.rec(r).value(name).map(|v| v.ty) {
                        return Some(self.k.var(name, ty));
                    }
                    if self.k.rec(r).kind == Kind::Class
                        && let Some(v) = self.value_in_args(r, name, &sname)
                    {
                        return Some(v);
                    }
                }
                ScopeKind::Loop(iter) => {
                    if let Some(it) = iter
                        && let Init::Var(n, _) = *self.k.init(it)
                        && n == name
                    {
                        return Some(it);
                    }
                }
                ScopeKind::MultiClass(m) => {
                    let r = self.multiclasses[m].rec;
                    if let Some(v) = self.value_in_args(r, name, &sname) {
                        return Some(v);
                    }
                }
            }
        }
        None
    }

    fn value_in_args(&mut self, rec: RecId, name: I, sname: &str) -> Option<I> {
        let arg = self.qualify(rec, name);
        if self.k.rec(rec).is_template_arg(arg) {
            let rv = self.k.rec_mut(rec).value_mut(arg).expect("template argument exists");
            rv.used = true;
            let ty = rv.ty;
            return Some(self.k.var(arg, ty));
        }
        if sname == "NAME" {
            let s = self.k.string;
            return Some(self.k.var(arg, s));
        }
        None
    }

    // ---------------- semantics ----------------

    /// `AddValue`: set an existing field of that name, otherwise add it.
    fn add_value(&mut self, rec: Option<RecId>, loc: Loc, rv: Val) -> R<()> {
        let rec = rec.or_else(|| self.mc_rec()).expect("a current record");
        if self.k.rec(rec).value(rv.name).is_some() {
            if self.k.set_val(rec, rv.name, rv.value).is_err() {
                let old = self.k.rec(rec).value(rv.name).expect("field exists").ty;
                let msg = format!(
                    "New definition of '{}' of type '{}' is incompatible with previous definition of type '{}'",
                    self.k.unquoted(rv.name),
                    self.k.ty_string(rv.ty),
                    self.k.ty_string(old)
                );
                return self.err_at(loc, msg);
            }
        } else {
            self.k.rec_mut(rec).vals.push(rv);
        }
        Ok(())
    }

    /// `SetValue`。
    fn set_value(&mut self, rec: Option<RecId>, loc: Loc, name: I, bits: &[u32], v: I, allow_self: bool) -> R<()> {
        let rec = rec.or_else(|| self.mc_rec()).expect("a current record");
        let Some(cur) = self.k.rec(rec).value(name).map(|v| v.value) else {
            let msg = format!("Value '{}' unknown!", self.k.unquoted(name));
            return self.err_at(loc, msg);
        };
        if bits.is_empty()
            && let Init::Var(n, _) = *self.k.init(v)
            && n == name
            && !allow_self
        {
            return self.err_at(loc, "Recursion / self-assignment forbidden");
        }
        let mut v = v;
        if !bits.is_empty() {
            let Init::Bits(curbits) = self.k.init(cur).clone() else {
                let msg = format!("Value '{}' is not a bits type", self.k.unquoted(name));
                return self.err_at(loc, msg);
            };
            let bt = self.k.bits(bits.len() as u32);
            let Some(bi) = self.k.cast_to(v, bt) else { return self.err_at(loc, "Initializer is not compatible with bit range") };
            let mut new: Vec<Option<I>> = vec![None; curbits.len()];
            for (n, &b) in bits.iter().enumerate() {
                if new[b as usize].is_some() {
                    let msg = format!("Cannot set bit #{b} of value '{}' more than once", self.k.unquoted(name));
                    return self.err_at(loc, msg);
                }
                new[b as usize] = Some(self.k.get_bit(bi, n as u32));
            }
            let out = new.into_iter().zip(curbits).map(|(n, c)| n.unwrap_or(c)).collect();
            v = self.k.get(Init::Bits(out));
        }
        if self.k.set_val(rec, name, v).is_err() {
            let ty = self.k.rec(rec).value(name).expect("field exists").ty;
            let extra = match self.k.init(v) {
                Init::Bits(b) => format!("' of type bit initializer with length {}", b.len()),
                _ => self.k.type_of(v).map(|t| format!("' of type '{}'", self.k.ty_string(t))).unwrap_or_default(),
            };
            let msg = format!("Field '{}' of type '{}' is incompatible with value '{}{extra}", self.k.unquoted(name), self.k.ty_string(ty), self.k.string(v));
            return self.err_at(loc, msg);
        }
        Ok(())
    }

    /// `resolveArguments`: the given arguments plus defaults for the rest, each handed to `f`.
    fn resolve_args(&mut self, rec: RecId, args: &[I], loc: Loc, mut f: impl FnMut(&mut Self, I, I)) -> R<()> {
        let names = self.k.rec(rec).targs.clone();
        let mut unsolved = names.clone();
        for &a in args {
            let Init::Arg(v, key) = *self.k.init(a) else { continue };
            let name = match key {
                ArgKey::Pos(n) => names[n as usize],
                ArgKey::Named(n) => n,
            };
            if !unsolved.contains(&name) {
                let msg = format!("We can only specify the template argument '{}' once", self.k.unquoted(name));
                return self.err_at(loc, msg);
            }
            f(self, name, v);
            unsolved.retain(|&x| x != name);
        }
        for name in unsolved {
            let default = self.k.rec(rec).value(name).expect("template argument exists").value;
            if !self.k.is_complete(default) {
                let msg = format!("value not specified for template argument '{}'", self.k.unquoted(name));
                return self.err_at(loc, msg);
            }
            f(self, name, default);
        }
        Ok(())
    }

    /// `AddSubClass`: copy the fields, resolve with the arguments, record the superclass.
    fn add_subclass(&mut self, cur: RecId, sc: &SubClassRef) -> R<()> {
        let class = sc.rec;
        let fields: Vec<Val> = self.k.rec(class).vals.iter().filter(|v| v.kind != FieldKind::TemplateArg).cloned().collect();
        for f in fields {
            self.add_value(Some(cur), sc.start, f)?;
        }
        let mut r = MapResolver::new(Some(cur));
        self.resolve_args(class, &sc.args, sc.start, |_, n, v| r.set(n, v))?;
        let ca = self.k.rec(class).asserts.clone();
        self.k.rec_mut(cur).asserts.extend(ca);
        let cd = self.k.rec(class).dumps.clone();
        self.k.rec_mut(cur).dumps.extend(cd);
        let name = if self.k.rec(cur).kind == Kind::Class {
            let q = self.qualified_name(cur);
            let s = self.k.string;
            self.k.var(q, s)
        } else {
            self.k.rec(cur).name
        };
        let qn = self.qualified_name(class);
        r.set(qn, name);
        self.k.resolve_record(cur, &mut r, None);
        self.check()?;
        if self.k.is_subclass_of(cur, class) {
            let msg = format!("Already subclass of '{}'!", self.k.rec_name(class));
            return self.err_at(sc.start, msg);
        }
        self.k.rec_mut(cur).supers.push(class);
        Ok(())
    }

    fn add_subclass_entry(&mut self, e: &mut Entry, sc: &SubClassRef) -> R<()> {
        match e {
            Entry::Rec(r) => self.add_subclass(*r, sc),
            Entry::Loop(l) => {
                for e in &mut l.entries {
                    self.add_subclass_entry(e, sc)?;
                }
                Ok(())
            }
            _ => Ok(()),
        }
    }

    /// `addEntry`。
    fn add_entry(&mut self, e: Entry) -> R<()> {
        if let Some(l) = self.loops.last_mut() {
            l.entries.push(e);
            return Ok(());
        }
        if let Entry::Loop(l) = e {
            let mut stack = Vec::new();
            let fin = self.cur_mc.is_none();
            let mut dest = Vec::new();
            self.resolve_loop(&l, &mut stack, fin, if fin { None } else { Some(&mut dest) }, None)?;
            if let Some(m) = self.cur_mc {
                self.multiclasses[m].entries.extend(dest);
            }
            return Ok(());
        }
        if let Some(m) = self.cur_mc {
            self.multiclasses[m].entries.push(e);
            return Ok(());
        }
        match e {
            Entry::Assert(a) => {
                self.k.check_assert(a.cond, a.msg);
                self.check()
            }
            Entry::Dump(..) => Ok(()),
            Entry::Rec(r) => self.add_def_one(r),
            Entry::Loop(_) => unreachable!(),
        }
    }

    fn map_of(&self, substs: &[(I, I)], cur: Option<RecId>) -> MapResolver {
        let mut r = MapResolver::new(cur);
        for &(a, b) in substs {
            r.set(a, b);
        }
        r
    }

    /// `resolve(ForeachLoop)`。
    fn resolve_loop(&mut self, l: &ForeachLoop, substs: &mut Vec<(I, I)>, fin: bool, mut dest: Option<&mut Vec<Entry>>, loc: Option<Loc>) -> R<()> {
        let mut r = self.map_of(substs, None);
        let mut list = self.k.resolve(l.list, &mut r);
        if fin && let Init::Tern(TernOp::If, old, m, rh, t) = self.k.init(list).clone() {
            r.fin = true;
            let lhs = self.k.resolve(old, &mut r);
            if lhs == old {
                let msg = format!("unable to resolve if condition '{}' at end of containing scope", self.k.string(lhs));
                return self.err_at(l.loc, msg);
            }
            let x = self.k.get(Init::Tern(TernOp::If, lhs, m, rh, t));
            list = self.k.fold_tern(x, None);
        }
        self.check()?;
        let Init::List(items, _) = self.k.init(list).clone() else {
            if !fin {
                let dest = dest.expect("non-final resolution has a destination");
                let mut inner = Vec::new();
                self.resolve_entries(&l.entries, substs, fin, Some(&mut inner), loc)?;
                dest.push(Entry::Loop(Box::new(ForeachLoop { loc: l.loc, iter: l.iter, list, entries: inner })));
                return Ok(());
            }
            let msg = format!("attempting to loop over '{}', expected a list", self.k.string(list));
            return self.err_at(l.loc, msg);
        };
        for item in items {
            if let Some(it) = l.iter {
                let Init::Var(name, _) = *self.k.init(it) else { unreachable!() };
                substs.push((name, item));
            }
            self.resolve_entries(&l.entries, substs, fin, dest.as_deref_mut(), None)?;
            if l.iter.is_some() {
                substs.pop();
            }
        }
        Ok(())
    }

    /// `resolve(vector<RecordsEntry>)`。
    fn resolve_entries(&mut self, src: &[Entry], substs: &mut Vec<(I, I)>, fin: bool, mut dest: Option<&mut Vec<Entry>>, loc: Option<Loc>) -> R<()> {
        for e in src {
            match e {
                Entry::Loop(l) => self.resolve_loop(l, substs, fin, dest.as_deref_mut(), None)?,
                Entry::Assert(a) => {
                    let mut r = self.map_of(substs, None);
                    let cond = self.k.resolve(a.cond, &mut r);
                    let msg = self.k.resolve(a.msg, &mut r);
                    match dest.as_deref_mut() {
                        Some(d) => d.push(Entry::Assert(Assertion { loc: a.loc, cond, msg })),
                        None => {
                            self.k.check_assert(cond, msg);
                            self.check()?;
                        }
                    }
                }
                Entry::Dump(l, m) => {
                    let mut r = self.map_of(substs, None);
                    let m = self.k.resolve(*m, &mut r);
                    if let Some(d) = dest.as_deref_mut() {
                        d.push(Entry::Dump(*l, m));
                    }
                }
                Entry::Rec(rec) => {
                    let new = self.k.copy_record(*rec);
                    if let Some(loc) = loc {
                        self.k.rec_mut(new).locs.push(loc);
                    }
                    let mut r = self.map_of(substs, Some(new));
                    self.k.resolve_record(new, &mut r, None);
                    self.check()?;
                    match dest.as_deref_mut() {
                        Some(d) => d.push(Entry::Rec(new)),
                        None => self.add_def_one(new)?,
                    }
                }
            }
        }
        Ok(())
    }

    /// `addDefOne`: fix the name, resolve fully, add to the defs.
    fn add_def_one(&mut self, rec: RecId) -> R<()> {
        let mut new_name = None;
        let name = self.k.rec_name(rec);
        if self.k.defs.contains_key(&name) {
            if self.k.rec(rec).kind != Kind::AnonymousDef {
                let loc = self.k.rec(rec).locs.first().copied().unwrap_or_default();
                return self.err_at(loc, format!("def already exists: {name}"));
            }
            new_name = Some(self.k.new_anonymous_name());
        }
        self.k.resolve_record_self(rec, new_name);
        self.check()?;
        if !matches!(self.k.init(self.k.rec(rec).name), Init::Str(..)) {
            let loc = self.k.rec(rec).locs.first().copied().unwrap_or_default();
            let msg = format!("record name '{}' could not be fully resolved", self.k.string(self.k.rec(rec).name));
            return self.err_at(loc, msg);
        }
        self.k.check_assertions(rec);
        self.check()?;
        let di = self.k.def_init(rec);
        for n in 0..self.defsets.len() {
            let t = self.k.rec_type(rec);
            if !self.k.type_is_a(t, self.defsets[n].elt) {
                let loc = self.k.rec(rec).locs.first().copied().unwrap_or_default();
                let msg = format!("adding record of incompatible type '{}' to defset", self.k.ty_string(t));
                return self.err_at(loc, msg);
            }
            self.defsets[n].elements.push(di);
        }
        let name = self.k.rec_name(rec);
        self.k.defs.insert(name, rec);
        Ok(())
    }

    // ---------------- objects ----------------

    pub fn parse_file(&mut self) -> R<()> {
        self.next()?;
        self.push_scope(ScopeKind::Local);
        self.parse_object_list(None)?;
        self.pop_scope();
        if self.tok() != Tok::Eof {
            return self.err("Unexpected token at top level");
        }
        Ok(())
    }

    fn parse_object_list(&mut self, mc: Option<usize>) -> R<()> {
        while self.tok().object_start() {
            self.parse_object(mc)?;
        }
        Ok(())
    }

    fn parse_object(&mut self, mc: Option<usize>) -> R<()> {
        match self.tok() {
            Tok::Assert => self.parse_assert(None),
            Tok::Def => self.parse_def(mc),
            Tok::Defm => self.parse_defm(mc),
            Tok::Deftype => self.parse_deftype(),
            Tok::Defvar => self.parse_defvar(None),
            Tok::Dump => self.parse_dump(None),
            Tok::Foreach => self.parse_foreach(mc),
            Tok::If => self.parse_if(mc),
            Tok::Let => self.parse_top_let(mc),
            Tok::Defset => {
                if mc.is_some() {
                    return self.err("defset is not allowed inside multiclass");
                }
                self.parse_defset()
            }
            Tok::Class => {
                if mc.is_some() {
                    return self.err("class is not allowed inside multiclass");
                }
                if !self.loops.is_empty() {
                    return self.err("class is not allowed inside foreach loop");
                }
                self.parse_class()
            }
            Tok::MultiClass => {
                if !self.loops.is_empty() {
                    return self.err("multiclass is not allowed inside foreach loop");
                }
                self.parse_multiclass()
            }
            _ => self.err("Expected assert, class, def, defm, defset, dump, foreach, if, or let"),
        }
    }

    fn parse_assert(&mut self, cur: Option<RecId>) -> R<()> {
        self.next()?;
        let loc = self.lex.loc();
        let cond = self.parse_value(cur, None, Mode::Value)?;
        if !self.consume(Tok::Comma)? {
            return self.err("expected ',' in assert statement");
        }
        let msg = self.parse_value(cur, None, Mode::Value)?;
        if !self.consume(Tok::Semi)? {
            return self.err("expected ';'");
        }
        let a = Assertion { loc, cond, msg };
        match cur {
            Some(r) => {
                self.k.rec_mut(r).asserts.push(a);
                Ok(())
            }
            None => self.add_entry(Entry::Assert(a)),
        }
    }

    fn parse_dump(&mut self, cur: Option<RecId>) -> R<()> {
        let loc = self.lex.loc();
        self.next()?;
        let mut m = self.parse_value(cur, None, Mode::Value)?;
        if matches!(self.k.init(m), Init::Def(_)) {
            let s = self.k.string;
            let u = self.k.get(Init::Un(UnOp::Repr, m, s));
            m = self.k.fold_un(u, cur, false);
        }
        if !self.consume(Tok::Semi)? {
            return self.err("expected ';'");
        }
        match cur {
            Some(r) => {
                self.k.rec_mut(r).dumps.push((loc, m));
                Ok(())
            }
            None => {
                let unset = self.k.unset;
                let mut res = HasReference { var: unset, found: false, fin: true };
                let m = self.k.resolve(m, &mut res);
                self.add_entry(Entry::Dump(loc, m))
            }
        }
    }

    fn parse_class(&mut self) -> R<()> {
        self.next()?;
        if self.tok() != Tok::Id {
            return self.err("expected class name after 'class' keyword");
        }
        let name = self.lex.str_val.clone();
        let loc = self.lex.loc();
        let cur = if let Some(&c) = self.k.classes.get(&name) {
            let r = self.k.rec(c);
            if !r.vals.is_empty() || !r.supers.is_empty() || !r.targs.is_empty() {
                return self.err(format!("Class '{name}' already defined"));
            }
            self.k.rec_mut(c).locs = vec![loc];
            c
        } else {
            let n = self.k.str(&name);
            let c = self.k.add_record(Record { name: n, locs: vec![loc], targs: Vec::new(), vals: Vec::new(), asserts: Vec::new(), dumps: Vec::new(), supers: Vec::new(), kind: Kind::Class });
            self.k.classes.insert(name.clone(), c);
            c
        };
        if self.type_aliases.contains_key(&name) {
            return self.err(format!("there is already a defined type alias '{name}'"));
        }
        self.next()?;
        self.push_scope(ScopeKind::Record(cur));
        if self.tok() == Tok::Less {
            self.parse_template_arg_list(Some(cur))?;
        }
        self.parse_object_body(cur)?;
        self.pop_scope();
        Ok(())
    }

    fn parse_template_arg_list(&mut self, cur: Option<RecId>) -> R<()> {
        self.next()?;
        let to = cur.or_else(|| self.mc_rec()).expect("a record");
        loop {
            let loc = self.lex.loc();
            let arg = self.parse_declaration(cur, true)?;
            if self.k.rec(to).is_template_arg(arg) {
                return self.err_at(loc, "template argument with the same name has already been defined");
            }
            self.k.rec_mut(to).targs.push(arg);
            if !self.consume(Tok::Comma)? {
                break;
            }
        }
        if !self.consume(Tok::Greater)? {
            return self.err("expected '>' at end of template argument list");
        }
        Ok(())
    }

    /// `ParseDeclaration`: `[field] type name [= value]`.
    fn parse_declaration(&mut self, cur: Option<RecId>, targs: bool) -> R<I> {
        let has_field = self.consume(Tok::Field)?;
        let ty = self.parse_type()?;
        if self.tok() != Tok::Id {
            return self.err("Expected identifier in declaration");
        }
        let s = self.lex.str_val.clone();
        if s == "NAME" {
            return self.err(format!("'{s}' is a reserved variable name"));
        }
        if !targs && self.scopes.last().is_some_and(|sc| sc.vars.contains_key(&s)) {
            return self.err("local variable of this name already exists");
        }
        let id_loc = self.lex.loc();
        let mut decl = self.k.str(&s);
        self.next()?;
        let unset = self.k.unset;
        if !targs {
            let kind = if has_field { FieldKind::NonconcreteOk } else { FieldKind::Normal };
            self.add_value(cur, id_loc, Val { name: decl, ty, kind, value: unset, used: false })?;
        } else {
            let rec = cur.or_else(|| self.mc_rec()).expect("a record");
            decl = self.qualify(rec, decl);
            self.add_value(cur, id_loc, Val { name: decl, ty, kind: FieldKind::TemplateArg, value: unset, used: false })?;
        }
        if self.consume(Tok::Equal)? {
            let vloc = self.lex.loc();
            let v = self.parse_value(cur, Some(ty), Mode::Value)?;
            self.set_value(cur, vloc, decl, &[], v, false)?;
        }
        Ok(decl)
    }

    fn parse_object_body(&mut self, cur: RecId) -> R<()> {
        self.push_scope(ScopeKind::Record(cur));
        if self.consume(Tok::Colon)? {
            loop {
                let sc = self.parse_subclass_ref(Some(cur), false)?;
                self.add_subclass(cur, &sc)?;
                if !self.consume(Tok::Comma)? {
                    break;
                }
            }
        }
        self.apply_let_stack(cur)?;
        self.parse_body(cur)?;
        self.pop_scope();
        Ok(())
    }

    fn apply_let_stack(&mut self, cur: RecId) -> R<()> {
        let lets: Vec<LetRecord> = self.let_stack.iter().flatten().cloned().collect();
        for lr in lets {
            self.set_value(Some(cur), lr.loc, lr.name, &lr.bits, lr.value, false)?;
        }
        Ok(())
    }

    fn apply_let_stack_entry(&mut self, e: &Entry) -> R<()> {
        match e {
            Entry::Rec(r) => self.apply_let_stack(*r),
            Entry::Loop(l) => {
                for e in &l.entries {
                    self.apply_let_stack_entry(e)?;
                }
                Ok(())
            }
            _ => Ok(()),
        }
    }

    fn parse_body(&mut self, cur: RecId) -> R<()> {
        if self.consume(Tok::Semi)? {
            return Ok(());
        }
        if !self.consume(Tok::LBrace)? {
            return self.err("Expected '{' to start body or ';' for declaration only");
        }
        while self.tok() != Tok::RBrace {
            self.parse_body_item(cur)?;
        }
        self.next()?;
        if self.tok() == Tok::Semi {
            return self.err("A class or def body should not end with a semicolon");
        }
        Ok(())
    }

    fn parse_body_item(&mut self, cur: RecId) -> R<()> {
        match self.tok() {
            Tok::Assert => return self.parse_assert(Some(cur)),
            Tok::Defvar => return self.parse_defvar(Some(cur)),
            Tok::Dump => return self.parse_dump(Some(cur)),
            Tok::Let => {}
            _ => {
                self.parse_declaration(Some(cur), false)?;
                if !self.consume(Tok::Semi)? {
                    return self.err("expected ';' after declaration");
                }
                return Ok(());
            }
        }
        if self.next()? != Tok::Id {
            return self.err("expected field identifier after let");
        }
        let id_loc = self.lex.loc();
        let field = self.k.str(&self.lex.str_val.clone());
        self.next()?;
        let mut bits = self.parse_optional_bit_list()?;
        bits.reverse();
        if !self.consume(Tok::Equal)? {
            return self.err("expected '=' in let expression");
        }
        let Some(mut ty) = self.k.rec(cur).value(field).map(|v| v.ty) else {
            let msg = format!("Value '{}' unknown!", self.k.unquoted(field));
            return self.err_at(id_loc, msg);
        };
        if !bits.is_empty() && matches!(self.k.kind(ty), TyKind::Bits(_)) {
            ty = self.k.bits(bits.len() as u32);
        }
        let v = self.parse_value(Some(cur), Some(ty), Mode::Value)?;
        if !self.consume(Tok::Semi)? {
            return self.err("expected ';' after let expression");
        }
        self.set_value(Some(cur), id_loc, field, &bits, v, false)
    }

    fn parse_def(&mut self, mc: Option<usize>) -> R<()> {
        let def_loc = self.lex.loc();
        self.next()?;
        let name_loc = if self.tok() == Tok::Id { self.lex.loc() } else { def_loc };
        let name = self.parse_object_name(mc)?;
        let unset = self.k.unset;
        let (name, loc, kind) = if name == unset { (self.k.new_anonymous_name(), def_loc, Kind::AnonymousDef) } else { (name, name_loc, Kind::Def) };
        let cur = self.k.add_record(Record { name, locs: vec![loc], targs: Vec::new(), vals: Vec::new(), asserts: Vec::new(), dumps: Vec::new(), supers: Vec::new(), kind });
        self.parse_object_body(cur)?;
        self.add_entry(Entry::Rec(cur))
    }

    /// `ParseObjectName`: no name ⇒ `?`; in a multiclass, a name not referencing `NAME` gets a `NAME #` prefix.
    fn parse_object_name(&mut self, mc: Option<usize>) -> R<I> {
        if matches!(self.tok(), Tok::Colon | Tok::Semi | Tok::LBrace) {
            return Ok(self.k.unset);
        }
        let cur = mc.map(|m| self.multiclasses[m].rec);
        let s = self.k.string;
        let mut name = self.parse_value(cur, Some(s), Mode::Name)?;
        if let Some(m) = mc {
            let r = self.multiclasses[m].rec;
            let ns = self.qualified_name(r);
            let mut res = HasReference { var: ns, found: false, fin: false };
            self.k.resolve(name, &mut res);
            if !res.found {
                let v = self.k.var(ns, s);
                name = self.k.str_concat(v, name);
            }
        }
        Ok(name)
    }

    fn parse_class_id(&mut self) -> R<RecId> {
        if self.tok() != Tok::Id {
            return self.err("expected name for ClassID");
        }
        let name = self.lex.str_val.clone();
        let Some(&c) = self.k.classes.get(&name) else {
            if self.mc_names.contains_key(&name) {
                return self.err(format!("Couldn't find class '{name}'. Use 'defm' if you meant to use multiclass '{name}'"));
            }
            return self.err(format!("Couldn't find class '{name}'"));
        };
        self.next()?;
        Ok(c)
    }

    fn parse_multiclass_id(&mut self) -> R<usize> {
        if self.tok() != Tok::Id {
            return self.err("expected name for MultiClassID");
        }
        let name = self.lex.str_val.clone();
        let Some(&m) = self.mc_names.get(&name) else { return self.err(format!("Couldn't find multiclass '{name}'")) };
        self.next()?;
        Ok(m)
    }

    /// `ParseSubClassReference`。
    fn parse_subclass_ref(&mut self, cur: Option<RecId>, defm: bool) -> R<SubClassRef> {
        let start = self.lex.loc();
        let rec = if defm {
            let m = self.parse_multiclass_id()?;
            self.multiclasses[m].rec
        } else {
            self.parse_class_id()?
        };
        let mut sc = SubClassRef { start, rec, args: Vec::new() };
        if !self.consume(Tok::Less)? {
            return Ok(sc);
        }
        let (args, locs) = self.parse_template_arg_value_list(cur, rec)?;
        sc.args = self.check_template_arg_values(args, &locs, rec)?;
        Ok(sc)
    }

    /// `ParseTemplateArgValueList`: positional arguments first, then `name=value`.
    fn parse_template_arg_value_list(&mut self, cur: Option<RecId>, args_rec: RecId) -> R<(Vec<I>, Vec<Loc>)> {
        let targs = self.k.rec(args_rec).targs.clone();
        let mut out = Vec::new();
        let mut locs = Vec::new();
        if self.consume(Tok::Greater)? {
            return Ok((out, locs));
        }
        let mut named = false;
        let mut idx = 0usize;
        loop {
            if idx >= targs.len() {
                return self.err(format!("Too many template arguments: {}", idx + 1));
            }
            let vloc = self.lex.loc();
            locs.push(vloc);
            let ty = if named { None } else { self.k.rec(args_rec).value(targs[idx]).map(|v| v.ty) };
            let v = self.parse_value(cur, ty, Mode::Value)?;
            if self.tok() == Tok::Equal {
                if !matches!(self.k.init(v), Init::Str(..)) {
                    return self.err_at(vloc, "The name of named argument should be a valid identifier");
                }
                let q = self.qualify(args_rec, v);
                let Some(nty) = self.k.rec(args_rec).value(q).map(|x| x.ty) else {
                    let msg = format!("Argument {} doesn't exist", self.k.string(v));
                    return self.err_at(vloc, msg);
                };
                self.next()?;
                let vloc2 = self.lex.loc();
                let val = self.parse_value(cur, Some(nty), Mode::Value)?;
                if self.k.is_unset(val) {
                    return self.err_at(vloc2, "The value of named argument should be initialized, but we got '?'");
                }
                out.push(self.k.get(Init::Arg(val, ArgKey::Named(q))));
                named = true;
            } else {
                if named {
                    return self.err_at(vloc, "Positional argument should be put before named argument");
                }
                out.push(self.k.get(Init::Arg(v, ArgKey::Pos(idx as u32))));
            }
            if self.consume(Tok::Greater)? {
                return Ok((out, locs));
            }
            if !self.consume(Tok::Comma)? {
                return self.err("Expected comma before next argument");
            }
            idx += 1;
        }
    }

    /// `CheckTemplateArgValues`: cast the arguments to the parameter types.
    fn check_template_arg_values(&mut self, args: Vec<I>, locs: &[Loc], args_rec: RecId) -> R<Vec<I>> {
        let targs = self.k.rec(args_rec).targs.clone();
        let mut out = Vec::with_capacity(args.len());
        for (a, &loc) in args.into_iter().zip(locs) {
            let Init::Arg(v, key) = *self.k.init(a) else { unreachable!() };
            let name = match key {
                ArgKey::Pos(n) => targs[n as usize],
                ArgKey::Named(n) => n,
            };
            let aty = self.k.rec(args_rec).value(name).expect("parameter exists").ty;
            if let Some(vt) = self.k.type_of(v) {
                match self.k.cast_to(v, aty) {
                    Some(c) => out.push(self.k.get(Init::Arg(c, key))),
                    None => {
                        let msg = format!(
                            "Value specified for template argument '{}' is of type {}; expected type {}: {}",
                            self.k.unquoted(name),
                            self.k.ty_string(vt),
                            self.k.ty_string(aty),
                            self.k.string(v)
                        );
                        return self.err_at(loc, msg);
                    }
                }
            } else {
                out.push(a);
            }
        }
        Ok(out)
    }

    fn parse_defset(&mut self) -> R<()> {
        self.next()?;
        let loc = self.lex.loc();
        let ty = self.parse_type()?;
        let Some(elt) = self.k.elem(ty) else { return self.err_at(loc, "expected list type") };
        if self.tok() != Tok::Id {
            return self.err("expected identifier");
        }
        let name = self.lex.str_val.clone();
        if self.k.defs.contains_key(&name) || self.k.globals.contains_key(&name) {
            return self.err("def or global variable of this name already exists");
        }
        if self.next()? != Tok::Equal {
            return self.err("expected '='");
        }
        if self.next()? != Tok::LBrace {
            return self.err("expected '{'");
        }
        self.next()?;
        self.defsets.push(Defset { elt, elements: Vec::new() });
        let res = self.parse_object_list(None);
        let ds = self.defsets.pop().expect("defset stack");
        res?;
        if !self.consume(Tok::RBrace)? {
            return self.err("expected '}' at end of defset");
        }
        let l = self.k.list(ds.elements, ds.elt);
        self.k.globals.insert(name, l);
        Ok(())
    }

    fn parse_deftype(&mut self) -> R<()> {
        self.next()?;
        if self.tok() != Tok::Id {
            return self.err("expected identifier");
        }
        let name = self.lex.str_val.clone();
        if self.type_aliases.contains_key(&name) || self.k.classes.contains_key(&name) {
            return self.err(format!("type of this name '{name}' already exists"));
        }
        self.next()?;
        if !self.consume(Tok::Equal)? {
            return self.err("expected '='");
        }
        let loc = self.lex.loc();
        let ty = self.parse_type()?;
        if matches!(self.k.kind(ty), TyKind::Record(_)) {
            let msg = format!("cannot define type alias for class type '{}'", self.k.ty_string(ty));
            return self.err_at(loc, msg);
        }
        self.type_aliases.insert(name, ty);
        if !self.consume(Tok::Semi)? {
            return self.err("expected ';'");
        }
        Ok(())
    }

    fn parse_defvar(&mut self, cur: Option<RecId>) -> R<()> {
        self.next()?;
        if self.tok() != Tok::Id {
            return self.err("expected identifier");
        }
        let name = self.lex.str_val.clone();
        if self.scopes.last().is_some_and(|s| s.vars.contains_key(&name)) {
            return self.err("local variable of this name already exists");
        }
        let iname = self.k.str(&name);
        if let Some(r) = cur
            && self.k.rec(r).value(iname).is_some_and(|v| v.kind != FieldKind::TemplateArg)
        {
            return self.err("field of this name already exists");
        }
        let outermost = self.scopes.len() == 1;
        if outermost && (self.k.defs.contains_key(&name) || self.k.globals.contains_key(&name)) {
            return self.err("def or global variable of this name already exists");
        }
        self.next()?;
        if !self.consume(Tok::Equal)? {
            return self.err("expected '='");
        }
        let v = self.parse_value(cur, None, Mode::Value)?;
        if !self.consume(Tok::Semi)? {
            return self.err("expected ';'");
        }
        if outermost {
            self.k.globals.insert(name, v);
        } else {
            self.scopes.last_mut().expect("a scope").vars.insert(name, v);
        }
        Ok(())
    }

    fn parse_foreach(&mut self, mc: Option<usize>) -> R<()> {
        let loc = self.lex.loc();
        self.next()?;
        let (iter, list) = self.parse_foreach_declaration()?;
        if !self.consume(Tok::In)? {
            return self.err("Unknown tok");
        }
        self.push_scope(ScopeKind::Loop(Some(iter)));
        self.loops.push(ForeachLoop { loc, iter: Some(iter), list, entries: Vec::new() });
        if self.tok() != Tok::LBrace {
            self.parse_object(mc)?;
        } else {
            self.next()?;
            self.parse_object_list(mc)?;
            if !self.consume(Tok::RBrace)? {
                return self.err("expected '}' at end of foreach command");
            }
        }
        self.pop_scope();
        let l = self.loops.pop().expect("loop stack");
        self.add_entry(Entry::Loop(Box::new(l)))
    }

    fn parse_foreach_declaration(&mut self) -> R<(I, I)> {
        if self.tok() != Tok::Id {
            return self.err("Expected identifier in foreach declaration");
        }
        let decl = self.k.str(&self.lex.str_val.clone());
        self.next()?;
        if !self.consume(Tok::Equal)? {
            return self.err("Expected '=' in foreach declaration");
        }
        let mut ranges = Vec::new();
        let mut result: Option<(Ty, I)> = None;
        if self.tok() == Tok::LBrace {
            self.next()?;
            ranges = self.parse_range_list()?;
            if !self.consume(Tok::RBrace)? {
                return self.err("expected '}' at end of bit range list");
            }
        } else {
            let vloc = self.lex.loc();
            let v = self.parse_value(None, None, Mode::Value)?;
            match self.k.type_of(v) {
                Some(t) if self.k.elem(t).is_some() => result = Some((self.k.elem(t).expect("a list"), v)),
                Some(_) => self.parse_range_piece(&mut ranges, Some(v))?,
                None => {
                    let msg = format!("expected a list, got '{}'", self.k.string(v));
                    return self.err_at(vloc, msg);
                }
            }
        }
        if !ranges.is_empty() {
            let vals = ranges.iter().map(|&r| self.k.int(i64::from(r))).collect();
            let int = self.k.int;
            result = Some((int, self.k.list(vals, int)));
        }
        let Some((ty, list)) = result else { return self.err("expected declaration in for") };
        Ok((self.k.var(decl, ty), list))
    }

    fn parse_if(&mut self, mc: Option<usize>) -> R<()> {
        let loc = self.lex.loc();
        self.next()?;
        let cond = self.parse_value(None, None, Mode::Value)?;
        if !self.consume(Tok::Then)? {
            return self.err("Unknown tok");
        }
        let bit = self.k.bit;
        let empty = self.k.list(Vec::new(), bit);
        let t = self.k.bit_init(true);
        let single = self.k.list(vec![t], bit);
        let blt = self.k.list_of(bit);
        let then = self.k.get(Init::Tern(TernOp::If, cond, single, empty, blt));
        let then = self.k.fold_tern(then, None);
        self.loops.push(ForeachLoop { loc, iter: None, list: then, entries: Vec::new() });
        self.parse_if_body(mc, "then")?;
        let l = self.loops.pop().expect("loop stack");
        self.add_entry(Entry::Loop(Box::new(l)))?;
        if self.consume(Tok::ElseKw)? {
            let els = self.k.get(Init::Tern(TernOp::If, cond, empty, single, blt));
            let els = self.k.fold_tern(els, None);
            self.loops.push(ForeachLoop { loc, iter: None, list: els, entries: Vec::new() });
            self.parse_if_body(mc, "else")?;
            let l = self.loops.pop().expect("loop stack");
            self.add_entry(Entry::Loop(Box::new(l)))?;
        }
        Ok(())
    }

    fn parse_if_body(&mut self, mc: Option<usize>, kind: &str) -> R<()> {
        self.push_scope(ScopeKind::Local);
        if self.tok() != Tok::LBrace {
            self.parse_object(mc)?;
        } else {
            self.next()?;
            self.parse_object_list(mc)?;
            if !self.consume(Tok::RBrace)? {
                return self.err(format!("expected '}}' at end of '{kind}' clause"));
            }
        }
        self.pop_scope();
        Ok(())
    }

    fn parse_top_let(&mut self, mc: Option<usize>) -> R<()> {
        self.next()?;
        let mut lets = Vec::new();
        loop {
            if self.tok() != Tok::Id {
                return self.err("expected identifier in let definition");
            }
            let name = self.k.str(&self.lex.str_val.clone());
            let loc = self.lex.loc();
            self.next()?;
            let mut bits = self.parse_optional_range_list()?;
            bits.reverse();
            if !self.consume(Tok::Equal)? {
                return self.err("expected '=' in let expression");
            }
            let value = self.parse_value(None, None, Mode::Value)?;
            lets.push(LetRecord { name, bits, value, loc });
            if !self.consume(Tok::Comma)? {
                break;
            }
        }
        self.let_stack.push(lets);
        if !self.consume(Tok::In)? {
            return self.err("expected 'in' at end of top-level 'let'");
        }
        if self.tok() != Tok::LBrace {
            self.parse_object(mc)?;
        } else {
            self.next()?;
            self.push_scope(ScopeKind::Local);
            self.parse_object_list(mc)?;
            if !self.consume(Tok::RBrace)? {
                return self.err("expected '}' at end of top level let command");
            }
            self.pop_scope();
        }
        self.let_stack.pop();
        Ok(())
    }

    fn parse_multiclass(&mut self) -> R<()> {
        self.next()?;
        if self.tok() != Tok::Id {
            return self.err("expected identifier after multiclass for name");
        }
        let name = self.lex.str_val.clone();
        if self.mc_names.contains_key(&name) {
            return self.err(format!("multiclass '{name}' already defined"));
        }
        let n = self.k.str(&name);
        let loc = self.lex.loc();
        let rec = self.k.add_record(Record { name: n, locs: vec![loc], targs: Vec::new(), vals: Vec::new(), asserts: Vec::new(), dumps: Vec::new(), supers: Vec::new(), kind: Kind::MultiClass });
        let m = self.multiclasses.len();
        self.multiclasses.push(MultiClass { rec, entries: Vec::new() });
        self.mc_names.insert(name, m);
        self.cur_mc = Some(m);
        self.next()?;
        self.push_scope(ScopeKind::MultiClass(m));
        if self.tok() == Tok::Less {
            self.parse_template_arg_list(None)?;
        }
        let mut inherits = false;
        if self.consume(Tok::Colon)? {
            inherits = true;
            loop {
                let start = self.lex.loc();
                let sm = self.parse_multiclass_id()?;
                let mut args = Vec::new();
                if self.consume(Tok::Less)? {
                    let smr = self.multiclasses[sm].rec;
                    args = self.parse_template_arg_value_list(Some(rec), smr)?.0;
                }
                self.add_sub_multiclass(m, sm, &args, start)?;
                if !self.consume(Tok::Comma)? {
                    break;
                }
            }
        }
        if self.tok() != Tok::LBrace {
            if !inherits {
                return self.err("expected '{' in multiclass definition");
            }
            if !self.consume(Tok::Semi)? {
                return self.err("expected ';' in multiclass definition");
            }
        } else {
            if self.next()? == Tok::RBrace {
                return self.err("multiclass must contain at least one def");
            }
            while self.tok() != Tok::RBrace {
                match self.tok() {
                    Tok::Assert | Tok::Def | Tok::Defm | Tok::Defvar | Tok::Dump | Tok::Foreach | Tok::If | Tok::Let => self.parse_object(Some(m))?,
                    _ => return self.err("expected 'assert', 'def', 'defm', 'defvar', 'dump', 'foreach', 'if', or 'let' in multiclass body"),
                }
            }
            self.next()?;
            if self.tok() == Tok::Semi {
                return self.err("A multiclass body should not end with a semicolon");
            }
        }
        self.pop_scope();
        self.cur_mc = None;
        Ok(())
    }

    /// `resolveArgumentsOfMultiClass`: `multiclass::NAME` ⇒ the defm name, plus the arguments.
    fn multiclass_substs(&mut self, m: usize, args: &[I], defm_name: I, loc: Loc) -> R<Vec<(I, I)>> {
        let rec = self.multiclasses[m].rec;
        let q = self.qualified_name(rec);
        let mut substs = vec![(q, defm_name)];
        self.resolve_args(rec, args, loc, |_, n, v| substs.push((n, v)))?;
        Ok(substs)
    }

    fn add_sub_multiclass(&mut self, cur: usize, sub: usize, args: &[I], loc: Loc) -> R<()> {
        let cr = self.multiclasses[cur].rec;
        let q = self.qualified_name(cr);
        let s = self.k.string;
        let name = self.k.var(q, s);
        let mut substs = self.multiclass_substs(sub, args, name, loc)?;
        let entries = self.multiclasses[sub].entries.clone();
        let mut dest = Vec::new();
        self.resolve_entries(&entries, &mut substs, false, Some(&mut dest), None)?;
        self.multiclasses[cur].entries.extend(dest);
        Ok(())
    }

    fn parse_defm(&mut self, mc: Option<usize>) -> R<()> {
        self.next()?;
        let mut defm_name = self.parse_object_name(mc)?;
        if self.k.is_unset(defm_name) {
            defm_name = self.k.new_anonymous_name();
            if let Some(m) = mc {
                let r = self.multiclasses[m].rec;
                let q = self.qualified_name(r);
                let s = self.k.string;
                let v = self.k.var(q, s);
                defm_name = self.k.str_concat(v, defm_name);
            }
        }
        if self.tok() != Tok::Colon {
            return self.err("expected ':' after defm identifier");
        }
        let mut entries = Vec::new();
        let mut inherit_class = false;
        self.next()?;
        let mut sub_loc = self.lex.loc();
        let mut r = self.parse_subclass_ref(None, true)?;
        loop {
            let m = self.mc_names[&self.k.rec_name(r.rec)];
            let mut substs = self.multiclass_substs(m, &r.args, defm_name, sub_loc)?;
            let src = self.multiclasses[m].entries.clone();
            let fin = mc.is_none() && self.loops.is_empty();
            self.resolve_entries(&src, &mut substs, fin, Some(&mut entries), Some(sub_loc))?;
            if !self.consume(Tok::Comma)? {
                break;
            }
            if self.tok() != Tok::Id {
                return self.err("expected identifier");
            }
            sub_loc = self.lex.loc();
            inherit_class = self.k.classes.contains_key(&self.lex.str_val);
            if inherit_class {
                break;
            }
            r = self.parse_subclass_ref(None, true)?;
        }
        if inherit_class {
            loop {
                let sc = self.parse_subclass_ref(None, false)?;
                for e in &mut entries {
                    self.add_subclass_entry(e, &sc)?;
                }
                if !self.consume(Tok::Comma)? {
                    break;
                }
            }
        }
        for e in entries {
            self.apply_let_stack_entry(&e)?;
            self.add_entry(e)?;
        }
        if !self.consume(Tok::Semi)? {
            return self.err("expected ';' at end of defm");
        }
        Ok(())
    }

    // ---------------- types and ranges ----------------

    fn parse_type(&mut self) -> R<Ty> {
        Ok(match self.tok() {
            Tok::String | Tok::Code => {
                self.next()?;
                self.k.string
            }
            Tok::Bit => {
                self.next()?;
                self.k.bit
            }
            Tok::Int => {
                self.next()?;
                self.k.int
            }
            Tok::Dag => {
                self.next()?;
                self.k.dag
            }
            Tok::Id => {
                if let Some(&t) = self.type_aliases.get(&self.lex.str_val) {
                    self.next()?;
                    return Ok(t);
                }
                let c = self.parse_class_id()?;
                self.k.record_ty(&[c])
            }
            Tok::Bits => {
                if self.next()? != Tok::Less {
                    return self.err("expected '<' after bits type");
                }
                if self.next()? != Tok::IntVal {
                    return self.err("expected integer in bits<n> type");
                }
                let n = self.lex.int_val as u32;
                if self.next()? != Tok::Greater {
                    return self.err("expected '>' at end of bits<n> type");
                }
                self.next()?;
                self.k.bits(n)
            }
            Tok::List => {
                if self.next()? != Tok::Less {
                    return self.err("expected '<' after list type");
                }
                self.next()?;
                let sub = self.parse_type()?;
                if !self.consume(Tok::Greater)? {
                    return self.err("expected '>' at end of list<ty> type");
                }
                self.k.list_of(sub)
            }
            _ => return self.err("Unknown token when expecting a type"),
        })
    }

    fn parse_operator_type(&mut self) -> R<Ty> {
        if !self.consume(Tok::Less)? {
            return self.err("expected type name for operator");
        }
        if self.tok() == Tok::Code {
            return self.err("the 'code' type is not allowed in bang operators; use 'string'");
        }
        let t = self.parse_type()?;
        if !self.consume(Tok::Greater)? {
            return self.err("expected type name for operator");
        }
        Ok(t)
    }

    fn parse_range_piece(&mut self, ranges: &mut Vec<u32>, first: Option<I>) -> R<()> {
        let v = match first {
            Some(v) => v,
            None => self.parse_value(None, None, Mode::Value)?,
        };
        let Some(start) = self.k.as_int(v) else { return self.err("expected integer or bitrange") };
        if start < 0 {
            return self.err("invalid range, cannot be negative");
        }
        let end = match self.tok() {
            Tok::DotDotDot | Tok::Minus => {
                self.next()?;
                let e = self.parse_value(None, None, Mode::Value)?;
                let Some(e) = self.k.as_int(e) else { return self.err("expected integer value as end of range") };
                e
            }
            Tok::IntVal => {
                let e = -self.lex.int_val;
                self.next()?;
                e
            }
            _ => {
                ranges.push(start as u32);
                return Ok(());
            }
        };
        if end < 0 {
            return self.err("invalid range, cannot be negative");
        }
        if start < end {
            ranges.extend((start..=end).map(|x| x as u32));
        } else {
            ranges.extend((end..=start).rev().map(|x| x as u32));
        }
        Ok(())
    }

    fn parse_range_list(&mut self) -> R<Vec<u32>> {
        let mut out = Vec::new();
        self.parse_range_piece(&mut out, None)?;
        while self.consume(Tok::Comma)? {
            self.parse_range_piece(&mut out, None)?;
        }
        Ok(out)
    }

    fn parse_optional_range_list(&mut self) -> R<Vec<u32>> {
        if !self.consume(Tok::Less)? {
            return Ok(Vec::new());
        }
        let r = self.parse_range_list()?;
        if !self.consume(Tok::Greater)? {
            return self.err("expected '>' at end of range list");
        }
        Ok(r)
    }

    fn parse_optional_bit_list(&mut self) -> R<Vec<u32>> {
        if !self.consume(Tok::LBrace)? {
            return Ok(Vec::new());
        }
        let r = self.parse_range_list()?;
        if !self.consume(Tok::RBrace)? {
            return self.err("expected '}' at end of bit list");
        }
        Ok(r)
    }

    // ---------------- values ----------------

    /// `ParseIDValue`。
    fn parse_id_value(&mut self, cur: Option<RecId>, name: I, loc: Loc, mode: Mode) -> R<I> {
        if let Some(v) = self.get_var(name) {
            return Ok(v);
        }
        if mode == Mode::Name {
            return Ok(name);
        }
        let s = self.k.as_str(name).unwrap_or("").to_string();
        if let Some(&d) = self.k.defs.get(&s) {
            return Ok(self.k.def_init(d));
        }
        if let Some(&g) = self.k.globals.get(&s) {
            return Ok(g);
        }
        if let Some(c) = cur
            && self.k.rec(c).kind != Kind::Class
            && self.cur_mc.is_none()
            && self.k.rec(c).name == name
        {
            let t = self.k.rec_type(c);
            return Ok(self.k.get(Init::Un(UnOp::Cast, name, t)));
        }
        self.err_at(loc, format!("Variable not defined: '{s}'"))
    }

    fn parse_value(&mut self, cur: Option<RecId>, item: Option<Ty>, mode: Mode) -> R<I> {
        let lhs_loc = self.lex.loc();
        let mut result = self.parse_simple_value(cur, item, mode)?;
        loop {
            match self.tok() {
                Tok::LBrace => {
                    if mode == Mode::Name {
                        return Ok(result);
                    }
                    let loc = self.lex.loc();
                    self.next()?;
                    let mut ranges = self.parse_range_list()?;
                    ranges.reverse();
                    let Some(r) = self.k.bit_range(result, &ranges) else { return self.err_at(loc, "Invalid bit range for value") };
                    result = r;
                    if !self.consume(Tok::RBrace)? {
                        return self.err("expected '}' at end of bit range list");
                    }
                }
                Tok::LSquare => {
                    let Some(lt) = self.k.type_of(result) else { return self.err_at(lhs_loc, "Invalid value, list expected") };
                    let Some(et) = self.k.elem(lt) else {
                        let msg = format!("Type '{}' is invalid, list expected", self.k.ty_string(lt));
                        return self.err_at(lhs_loc, msg);
                    };
                    self.next()?;
                    let rhs = self.parse_slice_elements(cur, true)?;
                    let rt = self.k.type_of(rhs).expect("an index is typed");
                    result = if self.k.elem(rt).is_some() {
                        let b = self.k.get(Init::Bin(BinOp::ListSlice, result, rhs, lt));
                        self.k.fold_bin(b, cur)
                    } else {
                        let b = self.k.get(Init::Bin(BinOp::ListElem, result, rhs, et));
                        self.k.fold_bin(b, cur)
                    };
                    if !self.consume(Tok::RSquare)? {
                        return self.err("expected ']' at end of list slice");
                    }
                }
                Tok::Dot => {
                    if self.next()? != Tok::Id {
                        return self.err("expected field identifier after '.'");
                    }
                    let fname = self.k.str(&self.lex.str_val.clone());
                    if self.k.field_type(result, fname).is_none() {
                        let msg = format!("Cannot access field '{}' of value '{}'", self.lex.str_val, self.k.string(result));
                        return self.err(msg);
                    }
                    let f = self.k.field(result, fname);
                    result = self.k.fold_field(f, cur);
                    self.check()?;
                    self.next()?;
                }
                Tok::Paste => {
                    let ploc = self.lex.loc();
                    let Some(lt) = self.k.type_of(result) else { return self.err_at(ploc, "LHS of paste is not typed!") };
                    if self.k.elem(lt).is_some() {
                        self.next()?;
                        if matches!(self.tok(), Tok::Colon | Tok::Semi | Tok::LBrace) {
                            continue;
                        }
                        let rhs = self.parse_value(cur, item, Mode::Value)?;
                        result = self.k.list_concat(result, rhs);
                        continue;
                    }
                    let s = self.k.string;
                    let mut lhs = result;
                    if lt != s {
                        let u = self.k.get(Init::Un(UnOp::Cast, lhs, s));
                        lhs = self.k.fold_un(u, cur, false);
                        if self.k.type_of(lhs).is_none() {
                            let msg = format!("can't cast '{}' to string", self.k.string(result));
                            return self.err_at(ploc, msg);
                        }
                    }
                    self.next()?;
                    let rhs = if matches!(self.tok(), Tok::Colon | Tok::Semi | Tok::LBrace) {
                        self.k.str("")
                    } else {
                        let r = self.parse_value(cur, None, Mode::Name)?;
                        let Some(rt) = self.k.type_of(r) else { return self.err_at(ploc, "RHS of paste is not typed!") };
                        if rt != s {
                            let u = self.k.get(Init::Un(UnOp::Cast, r, s));
                            let c = self.k.fold_un(u, cur, false);
                            if self.k.type_of(c).is_none() {
                                let msg = format!("can't cast '{}' to string", self.k.string(r));
                                return self.err_at(ploc, msg);
                            }
                            c
                        } else {
                            r
                        }
                    };
                    result = self.k.str_concat(lhs, rhs);
                }
                _ => {
                    self.check()?;
                    return Ok(result);
                }
            }
        }
    }

    fn parse_slice_element(&mut self, cur: Option<RecId>) -> R<I> {
        let lloc = self.lex.loc();
        let lhs = self.parse_value(cur, None, Mode::Value)?;
        let rhs = match self.tok() {
            Tok::DotDotDot | Tok::Minus => {
                self.next()?;
                let rloc = self.lex.loc();
                let r = self.parse_value(cur, None, Mode::Value)?;
                let rt = self.k.type_of(r);
                if rt != Some(self.k.int) {
                    let msg = format!("expected int...int, got {}", rt.map(|t| self.k.ty_string(t)).unwrap_or_default());
                    return self.err_at(rloc, msg);
                }
                r
            }
            Tok::IntVal => {
                let n = -self.lex.int_val;
                if n < 0 {
                    return self.err("invalid range, cannot be negative");
                }
                self.next()?;
                self.k.int(n)
            }
            _ => return Ok(lhs),
        };
        let lt = self.k.type_of(lhs);
        if lt != Some(self.k.int) {
            let msg = format!("expected int...int, got {}", lt.map(|t| self.k.ty_string(t)).unwrap_or_default());
            return self.err_at(lloc, msg);
        }
        let int = self.k.int;
        let li = self.k.list_of(int);
        let b = self.k.get(Init::Bin(BinOp::RangeC, lhs, rhs, li));
        Ok(self.k.fold_bin(b, cur))
    }

    fn parse_slice_elements(&mut self, cur: Option<RecId>, mut single: bool) -> R<I> {
        let int = self.k.int;
        let mut elems: Vec<I> = Vec::new();
        let mut slices: Vec<I> = Vec::new();
        let mut cur_val: Option<I>;
        loop {
            let lloc = self.lex.loc();
            let v = self.parse_slice_element(cur)?;
            cur_val = Some(v);
            let vt = self.k.type_of(v).expect("typed");
            if let Some(e) = self.k.elem(vt) {
                if e != int {
                    let msg = format!("expected list<int>, got {}", self.k.ty_string(vt));
                    return self.err_at(lloc, msg);
                }
                if !elems.is_empty() {
                    slices.push(self.k.list(std::mem::take(&mut elems), int));
                }
                slices.push(v);
                single = false;
                cur_val = None;
            } else if vt != int {
                let msg = format!("unhandled type {} in range", self.k.ty_string(vt));
                return self.err_at(lloc, msg);
            }
            if self.tok() != Tok::Comma {
                break;
            }
            self.next()?;
            single = false;
            if let Some(c) = cur_val.take() {
                elems.push(c);
            }
            if self.tok() == Tok::RSquare {
                break;
            }
        }
        if let Some(c) = cur_val {
            if single {
                return Ok(c);
            }
            elems.push(c);
        }
        if !elems.is_empty() {
            slices.push(self.k.list(elems, int));
        }
        let mut result: Option<I> = None;
        for s in slices {
            result = Some(match result {
                Some(r) => self.k.list_concat(r, s),
                None => s,
            });
        }
        Ok(result.expect("at least one element"))
    }

    fn parse_value_list(&mut self, cur: Option<RecId>, item: Option<Ty>) -> R<Vec<I>> {
        let mut out = vec![self.parse_value(cur, item, Mode::Value)?];
        while self.consume(Tok::Comma)? {
            if self.tok() == Tok::RSquare {
                break;
            }
            out.push(self.parse_value(cur, item, Mode::Value)?);
        }
        Ok(out)
    }

    fn parse_simple_value(&mut self, cur: Option<RecId>, item: Option<Ty>, mode: Mode) -> R<I> {
        if let Tok::Bang(op) = self.tok() {
            return self.parse_operation(cur, item, op);
        }
        let r = match self.tok() {
            Tok::True => self.k.int(1),
            Tok::False => self.k.int(0),
            Tok::IntVal => self.k.int(self.lex.int_val),
            Tok::BinaryIntVal => {
                let (v, w) = (self.lex.int_val, self.lex.binary_width());
                let bits = (0..w).map(|n| self.k.bit_init(n < 64 && (v >> n) & 1 != 0)).collect();
                self.k.get(Init::Bits(bits))
            }
            Tok::StrVal => {
                let mut s = self.lex.str_val.clone();
                self.next()?;
                while self.tok() == Tok::StrVal {
                    s += &self.lex.str_val;
                    self.next()?;
                }
                return Ok(self.k.str(&s));
            }
            Tok::CodeFragment => self.k.code(&self.lex.str_val.clone()),
            Tok::Question => self.k.unset,
            Tok::Id => {
                let loc = self.lex.loc();
                let name = self.k.str(&self.lex.str_val.clone());
                let next = self.next()?;
                if next == Tok::Equal {
                    return Ok(name);
                }
                if next != Tok::Less {
                    return self.parse_id_value(cur, name, loc, mode);
                }
                let sname = self.lex_name(name);
                let Some(&class) = self.k.classes.get(&sname) else { return self.err_at(loc, format!("Expected a class name, got '{sname}'")) };
                self.next()?;
                let (args, locs) = self.parse_template_arg_value_list(cur, class)?;
                let args = self.check_template_arg_values(args, &locs, class)?;
                self.resolve_args(class, &args, loc, |_, _, _| {})?;
                let v = self.k.get(Init::VarDef(class, args));
                self.k.vardef_loc.entry(v).or_insert(loc);
                let v = self.k.fold_vardef(v);
                self.check()?;
                return Ok(v);
            }
            Tok::LBrace => {
                let bloc = self.lex.loc();
                self.next()?;
                let mut vals = Vec::new();
                if self.tok() != Tok::RBrace {
                    vals = self.parse_value_list(cur, None)?;
                }
                if !self.consume(Tok::RBrace)? {
                    return self.err("expected '}' at end of bit list value");
                }
                let mut bits = Vec::new();
                let bit = self.k.bit;
                for (n, v) in vals.into_iter().enumerate() {
                    if let Init::Bits(b) = self.k.init(v).clone() {
                        bits.extend(b.iter().rev());
                        continue;
                    }
                    if let Init::Var(_, t) = *self.k.init(v)
                        && let TyKind::Bits(w) = *self.k.kind(t)
                    {
                        for b in (0..w).rev() {
                            bits.push(self.k.get_bit(v, b));
                        }
                        continue;
                    }
                    let Some(b) = self.k.cast_to(v, bit) else {
                        let msg = format!("Element #{n} ({}) is not convertable to a bit", self.k.string(v));
                        return self.err_at(bloc, msg);
                    };
                    bits.push(b);
                }
                bits.reverse();
                return Ok(self.k.get(Init::Bits(bits)));
            }
            Tok::LSquare => return self.parse_list_value(cur, item),
            Tok::LParen => return self.parse_dag_value(cur),
            _ => return self.err("Unknown or reserved token when parsing a value"),
        };
        self.next()?;
        Ok(r)
    }

    fn lex_name(&self, name: I) -> String {
        self.k.as_str(name).unwrap_or("").to_string()
    }

    fn parse_list_value(&mut self, cur: Option<RecId>, item: Option<Ty>) -> R<I> {
        self.next()?;
        let given_list = match item {
            Some(t) => match self.k.elem(t) {
                Some(_) => Some(t),
                None => {
                    let msg = format!("Encountered a list when expecting a {}", self.k.ty_string(t));
                    return self.err(msg);
                }
            },
            None => None,
        };
        let mut vals = Vec::new();
        if self.tok() != Tok::RSquare {
            let et = given_list.and_then(|t| self.k.elem(t));
            vals = self.parse_value_list(cur, et)?;
        }
        if !self.consume(Tok::RSquare)? {
            return self.err("expected ']' at end of list value");
        }
        let mut given_elt = None;
        if self.consume(Tok::Less)? {
            given_elt = Some(self.parse_type()?);
            if !self.consume(Tok::Greater)? {
                return self.err("expected '>' at end of list element type");
            }
        }
        let mut elt: Option<Ty> = None;
        for &v in &vals {
            if let Some(t) = self.k.type_of(v) {
                elt = Some(match elt {
                    Some(e) => match self.k.resolve_types(e, t) {
                        Some(r) => r,
                        None => return self.err("Incompatible types in list elements"),
                    },
                    None => t,
                });
            }
        }
        if let Some(g) = given_elt {
            if let Some(e) = elt
                && !self.k.convertible(e, g)
            {
                return self.err("Incompatible types in list elements");
            }
            elt = Some(g);
        }
        let deduced = match elt {
            None => match given_list {
                Some(l) => self.k.elem(l).expect("a list"),
                None => return self.err("No type for list"),
            },
            Some(e) => {
                if let Some(l) = given_list {
                    let ge = self.k.elem(l).expect("a list");
                    if !self.k.convertible(e, ge) {
                        let msg = format!("Element type mismatch for list: element type '{}' not convertible to '{}", self.k.ty_string(e), self.k.ty_string(ge));
                        return self.err(msg);
                    }
                }
                e
            }
        };
        Ok(self.k.list(vals, deduced))
    }

    fn parse_dag_value(&mut self, cur: Option<RecId>) -> R<I> {
        self.next()?;
        if !matches!(self.tok(), Tok::Id | Tok::Bang(Bang::Cast) | Tok::Question | Tok::Bang(Bang::GetDagOp) | Tok::LSquare) {
            return self.err("expected identifier or list of value types in dag init");
        }
        let op = self.parse_value(cur, None, Mode::Value)?;
        let mut op_name = None;
        if self.consume(Tok::Colon)? {
            if self.tok() != Tok::VarName {
                return self.err("expected variable name in dag operator");
            }
            op_name = Some(self.k.str(&self.lex.str_val.clone()));
            self.next()?;
        }
        let mut args = Vec::new();
        let mut names = Vec::new();
        if self.tok() != Tok::RParen {
            loop {
                if self.tok() == Tok::VarName {
                    let n = self.k.str(&self.lex.str_val.clone());
                    args.push(self.k.unset);
                    names.push(Some(n));
                    self.next()?;
                } else {
                    let v = self.parse_value(cur, None, Mode::Value)?;
                    let mut n = None;
                    if self.tok() == Tok::Colon {
                        if self.next()? != Tok::VarName {
                            return self.err("expected variable name in dag literal");
                        }
                        n = Some(self.k.str(&self.lex.str_val.clone()));
                        self.next()?;
                    }
                    args.push(v);
                    names.push(n);
                }
                if !self.consume(Tok::Comma)? {
                    break;
                }
            }
        }
        if !self.consume(Tok::RParen)? {
            return self.err("expected ')' in dag init");
        }
        Ok(self.k.get(Init::Dag(op, op_name, args, names)))
    }

    // ---------------- bang operators ----------------

    fn parse_operation(&mut self, cur: Option<RecId>, item: Option<Ty>, op: Bang) -> R<I> {
        let (int, s, dag) = (self.k.int, self.k.string, self.k.dag);
        let v = match op {
            Bang::Not | Bang::ToLower | Bang::ToUpper | Bang::ListFlatten | Bang::Log2 | Bang::Head | Bang::Tail | Bang::Size | Bang::Empty | Bang::Cast | Bang::Repr | Bang::GetDagOp | Bang::GetDagOpName | Bang::Initialized => {
                self.next()?;
                let (code, mut ty) = match op {
                    Bang::Cast => (UnOp::Cast, Some(self.parse_operator_type()?)),
                    Bang::Repr => (UnOp::Repr, Some(s)),
                    Bang::ToLower => (UnOp::ToLower, Some(s)),
                    Bang::ToUpper => (UnOp::ToUpper, Some(s)),
                    Bang::Not => (UnOp::Not, Some(int)),
                    Bang::ListFlatten => (UnOp::ListFlatten, Some(int)),
                    Bang::Log2 => (UnOp::Log2, Some(int)),
                    Bang::Head => (UnOp::Head, None),
                    Bang::Tail => (UnOp::Tail, None),
                    Bang::Size => (UnOp::Size, Some(int)),
                    Bang::Empty => (UnOp::Empty, Some(int)),
                    Bang::GetDagOp => {
                        let t = if self.tok() == Tok::Less { self.parse_operator_type()? } else { self.k.any_record };
                        (UnOp::GetDagOp, Some(t))
                    }
                    Bang::GetDagOpName => (UnOp::GetDagOpName, Some(s)),
                    _ => (UnOp::Initialized, Some(int)),
                };
                if !self.consume(Tok::LParen)? {
                    return self.err("expected '(' after unary operator");
                }
                let lhs = self.parse_value(cur, None, Mode::Value)?;
                if matches!(code, UnOp::Head | UnOp::Tail | UnOp::ListFlatten) {
                    let Some(lt) = self.k.type_of(lhs) else { return self.err("expected list type argument in unary operator") };
                    let Some(e) = self.k.elem(lt) else { return self.err("expected list type argument in unary operator") };
                    if let Init::List(v, _) = self.k.init(lhs).clone() {
                        if v.is_empty() {
                            return self.err("empty list argument in unary operator");
                        }
                        let Some(it) = self.k.type_of(v[0]) else { return self.err("untyped list element in unary operator") };
                        ty = Some(if code == UnOp::Tail { self.k.list_of(it) } else { it });
                    } else {
                        ty = Some(if code == UnOp::Tail { lt } else { e });
                    }
                    if code == UnOp::ListFlatten {
                        let t = ty.expect("a type");
                        ty = Some(match self.k.elem(t) {
                            Some(inner) => self.k.list_of(inner),
                            None => self.k.list_of(t),
                        });
                    }
                }
                if !self.consume(Tok::RParen)? {
                    return self.err("expected ')' in unary operator");
                }
                let u = self.k.get(Init::Un(code, lhs, ty.expect("a type")));
                self.k.fold_un(u, cur, false)
            }
            Bang::IsA => {
                self.next()?;
                let t = self.parse_operator_type()?;
                if !self.consume(Tok::LParen)? {
                    return self.err("expected '(' after type of !isa");
                }
                let lhs = self.parse_value(cur, None, Mode::Value)?;
                if !self.consume(Tok::RParen)? {
                    return self.err("expected ')' in !isa");
                }
                let x = self.k.get(Init::IsA(t, lhs));
                self.k.fold_isa(x)
            }
            Bang::Exists => {
                self.next()?;
                let t = self.parse_operator_type()?;
                if !self.consume(Tok::LParen)? {
                    return self.err("expected '(' after type of !exists");
                }
                let e = self.parse_value(cur, None, Mode::Value)?;
                if self.k.type_of(e) != Some(s) {
                    return self.err("expected string type argument in !exists operator");
                }
                if !self.consume(Tok::RParen)? {
                    return self.err("expected ')' in !exists");
                }
                let x = self.k.get(Init::Exists(t, e));
                self.k.fold_exists(x, cur, false)
            }
            Bang::Instances => {
                self.next()?;
                let t = self.parse_operator_type()?;
                if !self.consume(Tok::LParen)? {
                    return self.err("expected '(' after type of !instances");
                }
                let regex = if self.tok() != Tok::RParen { self.parse_value(cur, None, Mode::Value)? } else { self.k.str(".*") };
                if !self.consume(Tok::RParen)? {
                    return self.err("expected ')' in !instances");
                }
                let x = self.k.get(Init::Instances(t, regex));
                self.k.fold_instances(x, cur, false)
            }
            Bang::ForEach | Bang::Filter => return self.parse_foreach_filter(cur, item, op),
            Bang::Range => return self.parse_range_op(cur),
            Bang::Substr | Bang::Find => {
                self.next()?;
                if !self.consume(Tok::LParen)? {
                    return self.err("expected '(' after operator");
                }
                let lhs = self.parse_value(cur, None, Mode::Value)?;
                if !self.consume(Tok::Comma)? {
                    return self.err("expected ',' in operator");
                }
                let mhs = self.parse_value(cur, None, Mode::Value)?;
                let rhs = if self.consume(Tok::Comma)? {
                    self.parse_value(cur, None, Mode::Value)?
                } else if op == Bang::Substr {
                    self.k.int(i64::MAX)
                } else {
                    self.k.int(0)
                };
                if !self.consume(Tok::RParen)? {
                    return self.err("expected ')' in operator");
                }
                let (code, ty) = if op == Bang::Substr { (TernOp::Substr, s) } else { (TernOp::Find, int) };
                let x = self.k.get(Init::Tern(code, lhs, mhs, rhs, ty));
                self.k.fold_tern(x, cur)
            }
            Bang::Cond => return self.parse_cond(cur, item),
            Bang::Foldl => return self.parse_foldl(cur),
            Bang::SetDagArg | Bang::SetDagName | Bang::Dag | Bang::If | Bang::Subst => {
                self.next()?;
                let mut item = item;
                let (code, mut ty) = match op {
                    Bang::Dag => {
                        item = None;
                        (TernOp::Dag, Some(dag))
                    }
                    Bang::If => (TernOp::If, None),
                    Bang::Subst => (TernOp::Subst, None),
                    Bang::SetDagArg => {
                        item = None;
                        (TernOp::SetDagArg, Some(dag))
                    }
                    _ => {
                        item = None;
                        (TernOp::SetDagName, Some(dag))
                    }
                };
                if !self.consume(Tok::LParen)? {
                    return self.err("expected '(' after ternary operator");
                }
                let lhs = self.parse_value(cur, None, Mode::Value)?;
                if !self.consume(Tok::Comma)? {
                    return self.err("expected ',' in ternary operator");
                }
                let mhs = self.parse_value(cur, item, Mode::Value)?;
                if !self.consume(Tok::Comma)? {
                    return self.err("expected ',' in ternary operator");
                }
                let rhs = self.parse_value(cur, item, Mode::Value)?;
                if !self.consume(Tok::RParen)? {
                    return self.err("expected ')' in binary operator");
                }
                match code {
                    TernOp::If => {
                        let mut mt = self.k.type_of(mhs);
                        let mut rt = self.k.type_of(rhs);
                        if self.k.is_unset(mhs) {
                            mt = rt;
                        }
                        if self.k.is_unset(rhs) {
                            rt = mt;
                        }
                        let (Some(mt), Some(rt)) = (mt, rt) else { return self.err("could not get type for !if") };
                        let Some(t) = self.k.resolve_types(mt, rt) else {
                            let msg = format!("inconsistent types '{}' and '{}' for !if", self.k.ty_string(mt), self.k.ty_string(rt));
                            return self.err(msg);
                        };
                        ty = Some(t);
                    }
                    TernOp::Subst => {
                        let Some(t) = self.k.type_of(rhs) else { return self.err("could not get type for !subst") };
                        ty = Some(t);
                    }
                    _ => {}
                }
                let x = self.k.get(Init::Tern(code, lhs, mhs, rhs, ty.expect("a type")));
                self.k.fold_tern(x, cur)
            }
            _ => return self.parse_binary(cur, item, op),
        };
        self.check()?;
        Ok(v)
    }

    fn parse_binary(&mut self, cur: Option<RecId>, item: Option<Ty>, op: Bang) -> R<I> {
        let (int, s, bit, dag) = (self.k.int, self.k.string, self.k.bit, self.k.dag);
        let op_loc = self.lex.loc();
        self.next()?;
        let code = match op {
            Bang::Concat => BinOp::Concat,
            Bang::Match => BinOp::Match,
            Bang::Add => BinOp::Add,
            Bang::Sub => BinOp::Sub,
            Bang::Mul => BinOp::Mul,
            Bang::Div => BinOp::Div,
            Bang::And => BinOp::And,
            Bang::Or => BinOp::Or,
            Bang::Xor => BinOp::Xor,
            Bang::Sra => BinOp::Sra,
            Bang::Srl => BinOp::Srl,
            Bang::Shl => BinOp::Shl,
            Bang::Eq => BinOp::Eq,
            Bang::Ne => BinOp::Ne,
            Bang::Le => BinOp::Le,
            Bang::Lt => BinOp::Lt,
            Bang::Ge => BinOp::Ge,
            Bang::Gt => BinOp::Gt,
            Bang::ListConcat => BinOp::ListConcat,
            Bang::ListSplat => BinOp::ListSplat,
            Bang::ListRemove => BinOp::ListRemove,
            Bang::StrConcat => BinOp::StrConcat,
            Bang::Interleave => BinOp::Interleave,
            Bang::SetDagOp => BinOp::SetDagOp,
            Bang::SetDagOpName => BinOp::SetDagOpName,
            Bang::GetDagArg => BinOp::GetDagArg,
            Bang::GetDagName => BinOp::GetDagName,
            _ => return self.err("unknown bang operator"),
        };
        let (mut ty, mut arg_ty): (Option<Ty>, Option<Ty>) = match code {
            BinOp::Match => (Some(bit), Some(s)),
            BinOp::Concat | BinOp::SetDagOp | BinOp::SetDagOpName => (Some(dag), Some(dag)),
            BinOp::GetDagArg => (Some(self.parse_operator_type()?), Some(dag)),
            BinOp::GetDagName => (Some(s), Some(dag)),
            BinOp::And | BinOp::Or | BinOp::Xor | BinOp::Sra | BinOp::Srl | BinOp::Shl | BinOp::Add | BinOp::Sub | BinOp::Mul | BinOp::Div => (Some(int), Some(int)),
            BinOp::Eq | BinOp::Ne | BinOp::Le | BinOp::Lt | BinOp::Ge | BinOp::Gt => (Some(bit), None),
            BinOp::ListConcat | BinOp::ListRemove => (None, item),
            BinOp::ListSplat => (None, None),
            BinOp::StrConcat => (Some(s), Some(s)),
            BinOp::Interleave => (Some(s), None),
            _ => (None, None),
        };
        if let (Some(t), Some(it)) = (ty, item)
            && !self.k.convertible(t, it)
        {
            let msg = format!("expected value of type '{}', got '{}'", self.k.ty_string(it), self.k.ty_string(t));
            return self.err_at(op_loc, msg);
        }
        if !self.consume(Tok::LParen)? {
            return self.err("expected '(' after binary operator");
        }
        let mut list: Vec<I> = Vec::new();
        loop {
            let iloc = self.lex.loc();
            let v = self.parse_value(cur, arg_ty, Mode::Value)?;
            list.push(v);
            let Some(lt) = self.k.type_of(v) else {
                let msg = format!("expected value to be a typed value, got '{}'", self.k.string(v));
                return self.err_at(op_loc, msg);
            };
            match arg_ty {
                None => {
                    arg_ty = Some(lt);
                    match code {
                        BinOp::ListConcat | BinOp::ListRemove => {
                            if self.k.elem(lt).is_none() {
                                let msg = format!("expected a list, got value of type '{}'", self.k.ty_string(lt));
                                return self.err_at(iloc, msg);
                            }
                        }
                        BinOp::ListSplat => {
                            if list.len() == 2 && lt != int {
                                let msg = format!("expected second parameter to be an int, got value of type '{}'", self.k.ty_string(lt));
                                return self.err_at(iloc, msg);
                            }
                            arg_ty = None;
                        }
                        BinOp::Eq | BinOp::Ne => {
                            let ar = self.k.any_record;
                            if !self.k.convertible(lt, int) && !self.k.convertible(lt, s) && !self.k.convertible(lt, ar) {
                                let msg = format!("expected bit, bits, int, string, or record; got value of type '{}'", self.k.ty_string(lt));
                                return self.err_at(iloc, msg);
                            }
                        }
                        BinOp::GetDagArg | BinOp::Le | BinOp::Lt | BinOp::Ge | BinOp::Gt => {
                            if !self.k.convertible(lt, int) && !self.k.convertible(lt, s) {
                                let msg = format!("expected bit, bits, int, or string; got value of type '{}'", self.k.ty_string(lt));
                                return self.err_at(iloc, msg);
                            }
                        }
                        BinOp::Interleave => {
                            arg_ty = None;
                        }
                        _ => {}
                    }
                }
                Some(at) => {
                    let Some(res) = self.k.resolve_types(at, lt) else {
                        let msg = format!("expected value of type '{}', got '{}'", self.k.ty_string(at), self.k.ty_string(lt));
                        return self.err_at(iloc, msg);
                    };
                    if !matches!(code, BinOp::Add | BinOp::Sub | BinOp::And | BinOp::Or | BinOp::Xor | BinOp::Sra | BinOp::Srl | BinOp::Shl | BinOp::Mul | BinOp::Div) {
                        arg_ty = Some(res);
                    }
                }
            }
            match code {
                BinOp::SetDagOpName => arg_ty = Some(s),
                BinOp::SetDagOp => arg_ty = Some(self.k.any_record),
                BinOp::GetDagArg => arg_ty = None,
                BinOp::GetDagName => arg_ty = Some(int),
                _ => {}
            }
            if !self.consume(Tok::Comma)? {
                break;
            }
        }
        if !self.consume(Tok::RParen)? {
            return self.err("expected ')' in operator");
        }
        if matches!(code, BinOp::ListConcat | BinOp::ListRemove) {
            ty = arg_ty;
        }
        if code == BinOp::ListSplat {
            let ft = self.k.type_of(list[0]).expect("typed");
            ty = Some(self.k.list_of(ft));
        }
        let ty = ty.expect("a type");
        if matches!(code, BinOp::StrConcat | BinOp::ListConcat | BinOp::Concat | BinOp::Add | BinOp::And | BinOp::Or | BinOp::Xor | BinOp::Mul) {
            while list.len() > 2 {
                let rhs = list.pop().expect("more than two");
                let lhs = *list.last().expect("one left");
                let b = self.k.get(Init::Bin(code, lhs, rhs, ty));
                let b = self.k.fold_bin(b, cur);
                *list.last_mut().expect("one left") = b;
            }
        }
        if list.len() != 2 {
            return self.err_at(op_loc, "expected two operands to operator");
        }
        let b = self.k.get(Init::Bin(code, list[0], list[1], ty));
        let v = self.k.fold_bin(b, cur);
        self.check()?;
        Ok(v)
    }

    fn parse_range_op(&mut self, cur: Option<RecId>) -> R<I> {
        let int = self.k.int;
        self.next()?;
        if !self.consume(Tok::LParen)? {
            return self.err("expected '(' after !range operator");
        }
        let mut args = Vec::new();
        loop {
            if args.len() >= 3 {
                return self.err("expected at most three values of integer");
            }
            args.push(self.parse_value(cur, None, Mode::Value)?);
            if !self.consume(Tok::Comma)? {
                break;
            }
        }
        if !self.consume(Tok::RParen)? {
            return self.err("expected ')' in operator");
        }
        let t0 = self.k.type_of(args[0]).expect("typed");
        let (l, m, r) = if args.len() == 1 {
            let zero = self.k.int(0);
            let one = self.k.int(1);
            if self.k.elem(t0).is_some() {
                let u = self.k.get(Init::Un(UnOp::Size, args[0], int));
                let m = self.k.fold_un(u, cur, false);
                (zero, m, one)
            } else {
                (zero, args[0], one)
            }
        } else {
            let r = if args.len() == 3 { args[2] } else { self.k.int(1) };
            (args[0], args[1], r)
        };
        let li = self.k.list_of(int);
        let x = self.k.get(Init::Tern(TernOp::Range, l, m, r, li));
        let v = self.k.fold_tern(x, cur);
        self.check()?;
        Ok(v)
    }

    fn parse_foreach_filter(&mut self, cur: Option<RecId>, item: Option<Ty>, op: Bang) -> R<I> {
        let op_loc = self.lex.loc();
        self.next()?;
        if self.tok() != Tok::LParen {
            return self.err("expected '(' after !foreach/!filter");
        }
        if self.next()? != Tok::Id {
            return self.err("first argument of !foreach/!filter must be an identifier");
        }
        let lhs = self.k.str(&self.lex.str_val.clone());
        self.next()?;
        if let Some(c) = cur
            && self.k.rec(c).value(lhs).is_some()
        {
            let msg = format!("iteration variable '{}' is already defined", self.k.string(lhs));
            return self.err(msg);
        }
        if !self.consume(Tok::Comma)? {
            return self.err("expected ',' in !foreach/!filter");
        }
        let mhs = self.parse_value(cur, None, Mode::Value)?;
        if !self.consume(Tok::Comma)? {
            return self.err("expected ',' in !foreach/!filter");
        }
        let Some(mt) = self.k.type_of(mhs) else { return self.err("could not get type of !foreach/!filter list or dag") };
        let int = self.k.int;
        let (in_elt, expr_elt, is_dag) = if let Some(e) = self.k.elem(mt) {
            let expr = match item {
                Some(it) => match self.k.elem(it) {
                    Some(oe) => Some(if op == Bang::ForEach { oe } else { int }),
                    None => {
                        let msg = format!("expected value of type '{}', but got list type", self.k.ty_string(it));
                        return self.err_at(op_loc, msg);
                    }
                },
                None => None,
            };
            (e, expr, false)
        } else if mt == self.k.dag {
            if op == Bang::Filter {
                return self.err("!filter must have a list argument");
            }
            if let Some(it) = item
                && it != self.k.dag
            {
                let msg = format!("expected value of type '{}', but got dag type", self.k.ty_string(it));
                return self.err_at(op_loc, msg);
            }
            (mt, None, true)
        } else {
            return self.err(if op == Bang::ForEach { "!foreach must have a list or dag argument" } else { "!filter must have a list argument" });
        };
        let parse_rec = match cur {
            Some(c) => c,
            None => {
                let n = self.k.str(".parse");
                self.k.add_record(Record { name: n, locs: Vec::new(), targs: Vec::new(), vals: Vec::new(), asserts: Vec::new(), dumps: Vec::new(), supers: Vec::new(), kind: Kind::Def })
            }
        };
        self.push_scope(ScopeKind::Record(parse_rec));
        let unset = self.k.unset;
        self.k.rec_mut(parse_rec).vals.push(Val { name: lhs, ty: in_elt, kind: FieldKind::Normal, value: unset, used: false });
        let rhs = self.parse_value(Some(parse_rec), expr_elt, Mode::Value);
        self.k.rec_mut(parse_rec).vals.retain(|v| v.name != lhs);
        self.pop_scope();
        let rhs = rhs?;
        if !self.consume(Tok::RParen)? {
            return self.err("expected ')' in !foreach/!filter");
        }
        let out = if op == Bang::ForEach && !is_dag {
            let Some(rt) = self.k.type_of(rhs) else { return self.err("could not get type of !foreach result expression") };
            self.k.list_of(rt)
        } else if op == Bang::Filter {
            self.k.list_of(in_elt)
        } else {
            in_elt
        };
        let code = if op == Bang::ForEach { TernOp::ForEach } else { TernOp::Filter };
        let x = self.k.get(Init::Tern(code, lhs, mhs, rhs, out));
        let v = self.k.fold_tern(x, cur);
        self.check()?;
        Ok(v)
    }

    fn parse_cond(&mut self, cur: Option<RecId>, item: Option<Ty>) -> R<I> {
        self.next()?;
        if !self.consume(Tok::LParen)? {
            return self.err("expected '(' after !cond operator");
        }
        let mut cases = Vec::new();
        let mut vals = Vec::new();
        loop {
            if self.consume(Tok::RParen)? {
                break;
            }
            cases.push(self.parse_value(cur, None, Mode::Value)?);
            if !self.consume(Tok::Colon)? {
                return self.err("expected ':'  following a condition in !cond operator");
            }
            vals.push(self.parse_value(cur, item, Mode::Value)?);
            if self.consume(Tok::RParen)? {
                break;
            }
            if !self.consume(Tok::Comma)? {
                return self.err("expected ',' or ')' following a value in !cond operator");
            }
        }
        if cases.is_empty() {
            return self.err("there should be at least 1 'condition : value' in the !cond operator");
        }
        let mut ty: Option<Ty> = None;
        for &v in &vals {
            if self.k.is_unset(v) {
                continue;
            }
            let vt = self.k.type_of(v).expect("typed");
            ty = Some(match ty {
                None => vt,
                Some(t) => match self.k.resolve_types(t, vt) {
                    Some(r) => r,
                    None => {
                        let msg = format!("inconsistent types '{}' and '{}' for !cond", self.k.ty_string(t), self.k.ty_string(vt));
                        return self.err(msg);
                    }
                },
            });
        }
        let Some(ty) = ty else { return self.err("could not determine type for !cond from its arguments") };
        let x = self.k.get(Init::Cond(cases, vals, ty));
        let v = self.k.fold_cond(x, cur);
        self.check()?;
        Ok(v)
    }

    fn parse_foldl(&mut self, cur: Option<RecId>) -> R<I> {
        self.next()?;
        if !self.consume(Tok::LParen)? {
            return self.err("expected '(' after !foldl");
        }
        let start = self.parse_value(cur, None, Mode::Value)?;
        let Some(st) = self.k.type_of(start) else {
            let msg = format!("could not get type of !foldl start: '{}'", self.k.string(start));
            return self.err(msg);
        };
        if !self.consume(Tok::Comma)? {
            return self.err("expected ',' in !foldl");
        }
        let list = self.parse_value(cur, None, Mode::Value)?;
        let Some(lt) = self.k.type_of(list) else { return self.err("could not get type of !foldl list") };
        let Some(et) = self.k.elem(lt) else { return self.err("!foldl list must be a list") };
        if self.tok() != Tok::Comma {
            return self.err("expected ',' in !foldl");
        }
        if self.next()? != Tok::Id {
            return self.err("third argument of !foldl must be an identifier");
        }
        let a = self.k.str(&self.lex.str_val.clone());
        if self.next()? != Tok::Comma {
            return self.err("expected ',' in !foldl");
        }
        if self.next()? != Tok::Id {
            return self.err("fourth argument of !foldl must be an identifier");
        }
        let b = self.k.str(&self.lex.str_val.clone());
        if self.next()? != Tok::Comma {
            return self.err("expected ',' in !foldl");
        }
        self.next()?;
        let parse_rec = match cur {
            Some(c) => c,
            None => {
                let n = self.k.str(".parse");
                self.k.add_record(Record { name: n, locs: Vec::new(), targs: Vec::new(), vals: Vec::new(), asserts: Vec::new(), dumps: Vec::new(), supers: Vec::new(), kind: Kind::Def })
            }
        };
        self.push_scope(ScopeKind::Record(parse_rec));
        let unset = self.k.unset;
        self.k.rec_mut(parse_rec).vals.push(Val { name: a, ty: st, kind: FieldKind::Normal, value: unset, used: false });
        self.k.rec_mut(parse_rec).vals.push(Val { name: b, ty: et, kind: FieldKind::Normal, value: unset, used: false });
        let expr = self.parse_value(Some(parse_rec), None, Mode::Value);
        self.k.rec_mut(parse_rec).vals.retain(|v| v.name != a && v.name != b);
        self.pop_scope();
        let expr = expr?;
        if self.k.type_of(expr) != Some(st) {
            return self.err("!foldl expression must be of same type as start");
        }
        if !self.consume(Tok::RParen)? {
            return self.err("expected ')' in fold operator");
        }
        let x = self.k.get(Init::Fold(start, list, a, b, expr, st));
        let v = self.k.fold_foldl(x, cur);
        self.check()?;
        Ok(v)
    }
}
// ======================================================================== json
// ================ JSON back end (as JSONBackend.cpp; keys sorted bytewise, compact, as llvm::json) ================

/// A JSON value (only the kinds needed).
enum Json {
    Null,
    Bool(bool),
    Int(i64),
    Str(String),
    Arr(Vec<Json>),
    Obj(BTreeMap<String, Json>),
}

impl Json {
    /// As `llvm::json`'s `quote`: backslash before `"` and `\`, control characters as `\t` `\n` `\r` or `\u00xx`, the rest as is.
    fn quote(out: &mut String, s: &str) {
        out.push('"');
        for c in s.chars() {
            match c {
                '"' | '\\' => {
                    out.push('\\');
                    out.push(c);
                }
                '\t' => out.push_str("\\t"),
                '\n' => out.push_str("\\n"),
                '\r' => out.push_str("\\r"),
                c if (c as u32) < 0x20 => out.push_str(&format!("\\u{:04x}", c as u32)),
                c => out.push(c),
            }
        }
        out.push('"');
    }

    fn write(&self, out: &mut String) {
        match self {
            Self::Null => out.push_str("null"),
            Self::Bool(b) => out.push_str(if *b { "true" } else { "false" }),
            Self::Int(v) => out.push_str(&v.to_string()),
            Self::Str(s) => Self::quote(out, s),
            Self::Arr(v) => {
                out.push('[');
                for (n, x) in v.iter().enumerate() {
                    if n > 0 {
                        out.push(',');
                    }
                    x.write(out);
                }
                out.push(']');
            }
            Self::Obj(m) => {
                out.push('{');
                for (n, (k, v)) in m.iter().enumerate() {
                    if n > 0 {
                        out.push(',');
                    }
                    Self::quote(out, k);
                    out.push(':');
                    v.write(out);
                }
                out.push('}');
            }
        }
    }
}

impl Keeper {
    /// `JSONEmitter::translateInit`。
    fn json_init(&self, i: I) -> Json {
        match self.init(i) {
            Init::Unset => return Json::Null,
            Init::Bit(b) => return Json::Int(i64::from(*b)),
            Init::Bits(v) | Init::List(v, _) => return Json::Arr(v.iter().map(|&x| self.json_init(x)).collect()),
            Init::Int(v) => return Json::Int(*v),
            Init::Str(s, _) => return Json::Str(s.clone()),
            _ => {}
        }
        let mut obj = BTreeMap::new();
        obj.insert("printable".to_string(), Json::Str(self.string(i)));
        let kind = match self.init(i) {
            Init::Def(r) => {
                obj.insert("def".into(), Json::Str(self.rec(*r).name_str(self)));
                "def"
            }
            Init::Var(name, _) => {
                obj.insert("var".into(), Json::Str(self.unquoted(*name)));
                "var"
            }
            Init::VarBit(v, n) if matches!(self.init(*v), Init::Var(..)) => {
                let Init::Var(name, _) = self.init(*v) else { unreachable!() };
                obj.insert("var".into(), Json::Str(self.unquoted(*name)));
                obj.insert("index".into(), Json::Int(i64::from(*n)));
                "varbit"
            }
            Init::Dag(op, name, args, names) => {
                obj.insert("operator".into(), self.json_init(*op));
                if let Some(n) = name {
                    obj.insert("name".into(), Json::Str(self.unquoted(*n)));
                }
                let a = args.iter().zip(names).map(|(&x, n)| Json::Arr(vec![self.json_init(x), n.map_or(Json::Null, |n| Json::Str(self.unquoted(n)))])).collect();
                obj.insert("args".into(), Json::Arr(a));
                "dag"
            }
            _ => "complex",
        };
        obj.insert("kind".into(), Json::Str(kind.into()));
        Json::Obj(obj)
    }

    /// The whole `--dump-json` output (with the final newline).
    #[must_use]
    pub fn json(&self, src: &Sources) -> String {
        let mut root = BTreeMap::new();
        root.insert("!tablegen_json_version".to_string(), Json::Int(1));
        let mut instances: BTreeMap<String, Vec<Json>> = self.classes.keys().map(|c| (c.clone(), Vec::new())).collect();
        for (name, &d) in &self.defs {
            let rec = self.rec(d);
            let mut obj = BTreeMap::new();
            let mut fields = Vec::new();
            for v in &rec.vals {
                if rec.is_template_arg(v.name) {
                    continue;
                }
                let n = self.unquoted(v.name);
                if v.kind == FieldKind::NonconcreteOk {
                    fields.push(Json::Str(n.clone()));
                }
                obj.insert(n, self.json_init(v.value));
            }
            obj.insert("!fields".into(), Json::Arr(fields));
            let supers: Vec<Json> = self
                .all_supers(d)
                .into_iter()
                .map(|s| {
                    let sn = self.rec_name(s);
                    instances.entry(sn.clone()).or_default().push(Json::Str(name.clone()));
                    Json::Str(sn)
                })
                .collect();
            obj.insert("!superclasses".into(), Json::Arr(supers));
            obj.insert("!name".into(), Json::Str(name.clone()));
            obj.insert("!anonymous".into(), Json::Bool(rec.kind == Kind::AnonymousDef));
            obj.insert("!locs".into(), Json::Arr(rec.locs.iter().map(|&l| Json::Str(src.format(l))).collect()));
            root.insert(name.clone(), Json::Obj(obj));
        }
        root.insert("!instanceof".into(), Json::Obj(instances.into_iter().map(|(k, v)| (k, Json::Arr(v))).collect()));
        let mut out = String::new();
        Json::Obj(root).write(&mut out);
        out.push('\n');
        out
    }
}

