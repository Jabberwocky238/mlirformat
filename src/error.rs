use alloc::string::String;

#[derive(Debug, Clone, PartialEq, Eq, thiserror::Error)]
#[error("{line}:{col}: {msg}")]
pub struct ParseError {
    pub offset: usize,
    pub line: usize,
    pub col: usize,
    pub msg: String,
}

impl ParseError {
    pub fn at(src: &str, offset: usize, msg: impl Into<String>) -> Self {
        let before = &src[..offset.min(src.len())];
        let line = before.matches('\n').count() + 1;
        let col = offset - before.rfind('\n').map_or(0, |i| i + 1) + 1;
        Self { offset, line, col, msg: msg.into() }
    }
}
