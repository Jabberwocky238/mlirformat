//! [`Str`]: source text, borrowed or owned, in two words.

use alloc::borrow::Cow;
use alloc::boxed::Box;
use alloc::string::String;
use core::marker::PhantomData;
use core::ptr::NonNull;
use core::{fmt, hash, ops};

/// The top bit of [`Str`]'s length: the text is owned (a `Box<str>` to free).
const OWNED: usize = 1 << (usize::BITS - 1);

/// ⭐ Source text: borrowed after parsing, owned after building or deserializing — what
/// `Str<'a>` is, in 16 bytes instead of 24 (a pointer, and a length whose top bit says
/// owned), and without a spare capacity. `Str::Borrowed(s)` / `Str::Owned(s)` build one, as they
/// did a `Cow`; [`borrowed`](Str::borrowed) and [`is_owned`](Str::is_owned) tell which it is.
pub struct Str<'a> {
    ptr: NonNull<u8>,
    len: usize,
    _text: PhantomData<&'a str>,
}

// SAFETY: a `Str` is a `&'a str` or a `Box<str>`, both `Send` and `Sync`.
unsafe impl Send for Str<'_> {}
// SAFETY: as above.
unsafe impl Sync for Str<'_> {}

impl<'a> Str<'a> {
    /// Text borrowed from the source.
    #[allow(non_snake_case)]
    #[inline]
    pub const fn Borrowed(s: &'a str) -> Self {
        // SAFETY: a reference is never null.
        let ptr = unsafe { NonNull::new_unchecked(s.as_ptr().cast_mut()) };
        Self { ptr, len: s.len(), _text: PhantomData }
    }

    /// Text of its own.
    #[allow(non_snake_case)]
    #[inline]
    pub fn Owned(s: String) -> Self {
        Self::boxed(s.into_boxed_str())
    }

    #[inline]
    fn boxed(b: Box<str>) -> Self {
        let len = b.len();
        // SAFETY: `Box::into_raw` is never null; the box is rebuilt and freed in `drop`.
        let ptr = unsafe { NonNull::new_unchecked(Box::into_raw(b).cast::<u8>()) };
        Self { ptr, len: len | OWNED, _text: PhantomData }
    }

    #[inline]
    pub fn is_owned(&self) -> bool {
        self.len & OWNED != 0
    }

    /// The text, when it is borrowed (for as long as the source lives).
    #[inline]
    pub fn borrowed(&self) -> Option<&'a str> {
        // SAFETY: borrowed text is a `&'a str`.
        (!self.is_owned()).then(|| unsafe { Self::text(self.ptr, self.len) })
    }

    #[inline]
    pub fn as_str(&self) -> &str {
        // SAFETY: `ptr` and the length are those of a live `str`, borrowed for `'a` or owned.
        unsafe { Self::text(self.ptr, self.len & !OWNED) }
    }

    /// # Safety
    /// `ptr` and `len` must be a valid `str` for `'t`.
    #[inline]
    unsafe fn text<'t>(ptr: NonNull<u8>, len: usize) -> &'t str {
        // SAFETY: the caller's.
        unsafe { core::str::from_utf8_unchecked(core::slice::from_raw_parts(ptr.as_ptr(), len)) }
    }

    /// The text as a `String`: owned text moves, borrowed text is copied.
    pub fn into_owned(self) -> String {
        match self.borrowed() {
            Some(s) => String::from(s),
            None => {
                let me = core::mem::ManuallyDrop::new(self);
                // SAFETY: owned text is a `Box<str>` of this pointer and length; `me` never drops it.
                let b = unsafe { Box::from_raw(core::ptr::slice_from_raw_parts_mut(me.ptr.as_ptr(), me.len & !OWNED) as *mut str) };
                String::from(b)
            }
        }
    }

    /// The same text borrowing nothing: owned text moves, borrowed text is copied.
    pub fn into_static(self) -> Str<'static> {
        if self.is_owned() {
            let me = core::mem::ManuallyDrop::new(self);
            Str { ptr: me.ptr, len: me.len, _text: PhantomData }
        } else {
            Str::Owned(String::from(self.as_str()))
        }
    }

    /// This text, borrowed from `self`.
    #[inline]
    pub fn reborrow(&self) -> Str<'_> {
        Str::Borrowed(self.as_str())
    }
}

impl Drop for Str<'_> {
    #[inline]
    fn drop(&mut self) {
        if self.is_owned() {
            // SAFETY: owned text is a `Box<str>` of this pointer and length, freed once, here.
            drop(unsafe { Box::from_raw(core::ptr::slice_from_raw_parts_mut(self.ptr.as_ptr(), self.len & !OWNED) as *mut str) });
        }
    }
}

impl Clone for Str<'_> {
    #[inline]
    fn clone(&self) -> Self {
        if self.is_owned() { Self::boxed(Box::from(self.as_str())) } else { Self { ptr: self.ptr, len: self.len, _text: PhantomData } }
    }
}

impl Default for Str<'_> {
    #[inline]
    fn default() -> Self {
        Str::Borrowed("")
    }
}

impl ops::Deref for Str<'_> {
    type Target = str;
    #[inline]
    fn deref(&self) -> &str {
        self.as_str()
    }
}

impl AsRef<str> for Str<'_> {
    #[inline]
    fn as_ref(&self) -> &str {
        self.as_str()
    }
}

impl core::borrow::Borrow<str> for Str<'_> {
    #[inline]
    fn borrow(&self) -> &str {
        self.as_str()
    }
}

impl fmt::Debug for Str<'_> {
    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
        fmt::Debug::fmt(self.as_str(), f)
    }
}

impl fmt::Display for Str<'_> {
    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
        fmt::Display::fmt(self.as_str(), f)
    }
}

impl<'b> PartialEq<Str<'b>> for Str<'_> {
    #[inline]
    fn eq(&self, o: &Str<'b>) -> bool {
        self.as_str() == o.as_str()
    }
}

impl Eq for Str<'_> {}

impl PartialOrd for Str<'_> {
    #[inline]
    fn partial_cmp(&self, o: &Self) -> Option<core::cmp::Ordering> {
        Some(self.cmp(o))
    }
}

impl Ord for Str<'_> {
    #[inline]
    fn cmp(&self, o: &Self) -> core::cmp::Ordering {
        self.as_str().cmp(o.as_str())
    }
}

impl hash::Hash for Str<'_> {
    #[inline]
    fn hash<H: hash::Hasher>(&self, h: &mut H) {
        self.as_str().hash(h)
    }
}

/// `Str == "text"` and back, as `Cow<str>` compares.
macro_rules! str_eq {
    ($($t:ty),*) => {$(
        impl PartialEq<$t> for Str<'_> {
            #[inline]
            fn eq(&self, o: &$t) -> bool {
                self.as_str() == &o[..]
            }
        }

        impl PartialEq<Str<'_>> for $t {
            #[inline]
            fn eq(&self, o: &Str<'_>) -> bool {
                &self[..] == o.as_str()
            }
        }
    )*};
}

str_eq!(str, &str, String, Cow<'_, str>);

impl<'a> From<&'a str> for Str<'a> {
    #[inline]
    fn from(s: &'a str) -> Self {
        Str::Borrowed(s)
    }
}

impl<'a> From<&'a String> for Str<'a> {
    #[inline]
    fn from(s: &'a String) -> Self {
        Str::Borrowed(s)
    }
}

impl From<String> for Str<'_> {
    #[inline]
    fn from(s: String) -> Self {
        Str::Owned(s)
    }
}

impl From<Box<str>> for Str<'_> {
    #[inline]
    fn from(s: Box<str>) -> Self {
        Self::boxed(s)
    }
}

impl From<char> for Str<'_> {
    #[inline]
    fn from(c: char) -> Self {
        Str::Owned(String::from(c))
    }
}

impl<'a> From<Cow<'a, str>> for Str<'a> {
    #[inline]
    fn from(s: Cow<'a, str>) -> Self {
        match s {
            Cow::Borrowed(s) => Str::Borrowed(s),
            Cow::Owned(s) => Str::Owned(s),
        }
    }
}

impl<'a> From<Str<'a>> for Cow<'a, str> {
    #[inline]
    fn from(s: Str<'a>) -> Self {
        match s.borrowed() {
            Some(b) => Cow::Borrowed(b),
            None => Cow::Owned(s.into_owned()),
        }
    }
}

impl From<Str<'_>> for String {
    #[inline]
    fn from(s: Str<'_>) -> Self {
        s.into_owned()
    }
}

impl<'s> FromIterator<&'s str> for Str<'_> {
    fn from_iter<I: IntoIterator<Item = &'s str>>(it: I) -> Self {
        Str::Owned(it.into_iter().collect())
    }
}

impl FromIterator<char> for Str<'_> {
    fn from_iter<I: IntoIterator<Item = char>>(it: I) -> Self {
        Str::Owned(it.into_iter().collect())
    }
}

impl FromIterator<String> for Str<'_> {
    fn from_iter<I: IntoIterator<Item = String>>(it: I) -> Self {
        Str::Owned(it.into_iter().collect())
    }
}

impl serde::Serialize for Str<'_> {
    fn serialize<S: serde::Serializer>(&self, s: S) -> Result<S::Ok, S::Error> {
        s.serialize_str(self.as_str())
    }
}

impl<'de> serde::Deserialize<'de> for Str<'_> {
    fn deserialize<D: serde::Deserializer<'de>>(d: D) -> Result<Self, D::Error> {
        String::deserialize(d).map(Str::Owned)
    }
}
