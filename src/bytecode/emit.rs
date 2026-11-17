use alloc::vec::Vec;

/// A section's id, the first byte of the section (`bytecode::Section::ID`)
#[derive(Clone, Copy, PartialEq, Eq, Debug)]
pub enum Section {
    String = 0,
    Dialect = 1,
    AttrType = 2,
    AttrTypeOffset = 3,
    Ir = 4,
    Resource = 5,
    ResourceOffset = 6,
    Properties = 8,
}

/// Bytes being written, with the alignment their start needs (`EncodingEmitter`)
#[derive(Default)]
pub struct Emitter {
    pub bytes: Vec<u8>,
    align: u64,
}

impl Emitter {
    /// What pads a section or a blob to its alignment
    const PADDING: u8 = 0xCB;
    /// The high bit of a section's id: an alignment follows its length
    const ALIGNED: u8 = 0x80;
    /// The value bits a one-byte varint holds
    const SHORT_BITS: u32 = 7;
    /// The most bytes a prefix varint takes before it falls back to a marker and eight full bytes
    const LONG_BYTES: usize = 9;

    pub fn len(&self) -> usize {
        self.bytes.len()
    }

    pub fn byte(&mut self, b: u8) {
        self.bytes.push(b);
    }

    pub fn raw(&mut self, b: &[u8]) {
        self.bytes.extend_from_slice(b);
    }

    /// A prefix varint: the low bits of the first byte count the bytes that follow
    pub fn var(&mut self, v: u64) {
        if v >> Self::SHORT_BITS == 0 {
            return self.byte(((v << 1) | 1) as u8);
        }
        for n in 2..Self::LONG_BYTES {
            if v >> (Self::SHORT_BITS * n as u32) == 0 {
                let enc = ((v << 1) | 1) << (n - 1);
                return self.raw(&enc.to_le_bytes()[..n]);
            }
        }
        self.byte(0);
        self.raw(&v.to_le_bytes());
    }

    /// A zigzag varint
    pub fn svar(&mut self, v: i64) {
        self.var(((v as u64) << 1) ^ ((v >> 63) as u64));
    }

    pub fn var_flag(&mut self, v: u64, flag: bool) {
        self.var((v << 1) | u64::from(flag));
    }

    pub fn cstr(&mut self, s: &[u8]) {
        self.raw(s);
        self.byte(0);
    }

    pub fn align_to(&mut self, align: u64) {
        if align < 2 {
            return;
        }
        while self.bytes.len() as u64 % align != 0 {
            self.byte(Self::PADDING);
        }
        self.align = self.align.max(align);
    }

    /// `inner` as a section of id `id`
    pub fn section(&mut self, id: Section, inner: Emitter) {
        let at = self.bytes.len();
        self.byte(id as u8);
        self.var(inner.bytes.len() as u64);
        if inner.align > 1 {
            if self.bytes.len() as u64 % inner.align != 0 {
                self.var(inner.align);
                self.align_to(inner.align);
                self.bytes[at] |= Self::ALIGNED;
            } else {
                self.align = self.align.max(inner.align);
            }
        }
        self.raw(&inner.bytes);
    }
}
/// Reads what `Emitter` writes
pub struct Cursor<'b> {
    pub bytes: &'b [u8],
    pub at: usize,
}

impl<'b> Cursor<'b> {
    pub fn new(bytes: &'b [u8]) -> Self {
        Self { bytes, at: 0 }
    }

    pub fn done(&self) -> bool {
        self.at >= self.bytes.len()
    }

    pub fn byte(&mut self) -> Option<u8> {
        let b = *self.bytes.get(self.at)?;
        self.at += 1;
        Some(b)
    }

    pub fn take(&mut self, n: usize) -> Option<&'b [u8]> {
        let s = self.bytes.get(self.at..self.at.checked_add(n)?)?;
        self.at += n;
        Some(s)
    }

    pub fn var(&mut self) -> Option<u64> {
        let first = self.byte()?;
        if first & 1 != 0 {
            return Some(u64::from(first >> 1));
        }
        if first == 0 {
            return Some(u64::from_le_bytes(self.take(8)?.try_into().ok()?));
        }
        let n = first.trailing_zeros() as usize + 1;
        let mut buf = [0u8; 8];
        buf[0] = first;
        buf[1..n].copy_from_slice(self.take(n - 1)?);
        Some(u64::from_le_bytes(buf) >> n)
    }

    pub fn svar(&mut self) -> Option<i64> {
        let v = self.var()?;
        Some(((v >> 1) as i64) ^ -((v & 1) as i64))
    }

    pub fn var_flag(&mut self) -> Option<(u64, bool)> {
        let v = self.var()?;
        Some((v >> 1, v & 1 != 0))
    }

    pub fn cstr(&mut self) -> Option<&'b [u8]> {
        let end = self.bytes[self.at..].iter().position(|b| *b == 0)?;
        let s = &self.bytes[self.at..self.at + end];
        self.at += end + 1;
        Some(s)
    }

    /// A section: its id and contents
    pub fn section(&mut self) -> Option<(u8, &'b [u8])> {
        let id = self.byte()?;
        let len = self.var()? as usize;
        if id & Emitter::ALIGNED != 0 {
            let align = self.var()? as usize;
            while self.at % align != 0 {
                self.byte()?;
            }
        }
        Some((id & !Emitter::ALIGNED, self.take(len)?))
    }
}
