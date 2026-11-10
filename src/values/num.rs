//! `APInt` and `APFloat`, as far as folding needs them, and MLIR's way of printing a float.
//!
//! Integers are up to 256 bits wide. `f80` / `f128` values are held only when exactly an `f64`
//! ([`WideFloat`]). Floats are the IEEE-like formats (`f16`, `bf16`, `tf32`,
//! `f32`, `f64`); arithmetic on the narrow ones goes through `f32`, which is exact enough that
//! the one final rounding is the correct one.

use alloc::string::String;
use alloc::vec;
use alloc::vec::Vec;
use core::cmp::Ordering;

use crate::FloatKind;

/// The bits of an [`ApInt`]: up to [`ApInt::MAX_WIDTH`], as a low and a high half.
#[derive(Debug, Clone, Copy, PartialEq, Eq, Hash, Default)]
struct Wide {
    lo: u128,
    hi: u128,
}

impl Wide {
    const ZERO: Wide = Wide { lo: 0, hi: 0 };
    const ONE: Wide = Wide { lo: 1, hi: 0 };
    /// The bits of one half.
    const HALF: u32 = 128;

    #[inline]
    fn of(lo: u128) -> Self {
        Wide { lo, hi: 0 }
    }

    /// `lo` sign-extended to the full width.
    #[inline]
    fn of_signed(v: i128) -> Self {
        Wide { lo: v as u128, hi: if v < 0 { u128::MAX } else { 0 } }
    }

    /// The low `width` bits set.
    #[inline]
    fn mask(width: u32) -> Self {
        match width {
            0 => Wide::ZERO,
            w if w < Self::HALF => Wide::of((1u128 << w) - 1),
            w if w < 2 * Self::HALF => Wide { lo: u128::MAX, hi: (1u128 << (w - Self::HALF)) - 1 },
            _ => Wide { lo: u128::MAX, hi: u128::MAX },
        }
    }

    #[inline]
    fn is_zero(self) -> bool {
        self.lo == 0 && self.hi == 0
    }

    #[inline]
    fn and(self, o: Self) -> Self {
        Wide { lo: self.lo & o.lo, hi: self.hi & o.hi }
    }

    #[inline]
    fn or(self, o: Self) -> Self {
        Wide { lo: self.lo | o.lo, hi: self.hi | o.hi }
    }

    #[inline]
    fn xor(self, o: Self) -> Self {
        Wide { lo: self.lo ^ o.lo, hi: self.hi ^ o.hi }
    }

    #[inline]
    fn not(self) -> Self {
        Wide { lo: !self.lo, hi: !self.hi }
    }

    #[inline]
    fn add(self, o: Self) -> Self {
        let (lo, carry) = self.lo.overflowing_add(o.lo);
        Wide { lo, hi: self.hi.wrapping_add(o.hi).wrapping_add(u128::from(carry)) }
    }

    #[inline]
    fn sub(self, o: Self) -> Self {
        self.add(o.not().add(Wide::ONE))
    }

    /// The full product of two halves.
    fn mul_halves(a: u128, b: u128) -> Wide {
        const LIMB: u32 = 64;
        let (a0, a1) = (a as u64 as u128, a >> LIMB);
        let (b0, b1) = (b as u64 as u128, b >> LIMB);
        let (p00, p01, p10, p11) = (a0 * b0, a0 * b1, a1 * b0, a1 * b1);
        let mid = (p00 >> LIMB) + (p01 as u64 as u128) + (p10 as u64 as u128);
        let lo = (p00 as u64 as u128) | (mid << LIMB);
        let hi = p11 + (p01 >> LIMB) + (p10 >> LIMB) + (mid >> LIMB);
        Wide { lo, hi }
    }

    /// The product, wrapping at the full width.
    fn mul(self, o: Self) -> Self {
        let low = Self::mul_halves(self.lo, o.lo);
        Wide { lo: low.lo, hi: low.hi.wrapping_add(self.lo.wrapping_mul(o.hi)).wrapping_add(self.hi.wrapping_mul(o.lo)) }
    }

    fn shl(self, by: u32) -> Self {
        match by {
            0 => self,
            b if b < Self::HALF => Wide { lo: self.lo << b, hi: (self.hi << b) | (self.lo >> (Self::HALF - b)) },
            b if b < 2 * Self::HALF => Wide { lo: 0, hi: self.lo << (b - Self::HALF) },
            _ => Wide::ZERO,
        }
    }

    fn shr(self, by: u32) -> Self {
        match by {
            0 => self,
            b if b < Self::HALF => Wide { lo: (self.lo >> b) | (self.hi << (Self::HALF - b)), hi: self.hi >> b },
            b if b < 2 * Self::HALF => Wide { lo: self.hi >> (b - Self::HALF), hi: 0 },
            _ => Wide::ZERO,
        }
    }

    #[inline]
    fn bit(self, i: u32) -> bool {
        !self.shr(i).and(Wide::ONE).is_zero()
    }

    fn leading_zeros(self) -> u32 {
        if self.hi != 0 { self.hi.leading_zeros() } else { Self::HALF + self.lo.leading_zeros() }
    }

    fn trailing_zeros(self) -> u32 {
        if self.lo != 0 { self.lo.trailing_zeros() } else { Self::HALF + self.hi.trailing_zeros() }
    }

    fn count_ones(self) -> u32 {
        self.lo.count_ones() + self.hi.count_ones()
    }

    /// Quotient and remainder, `o` nonzero.
    fn divrem(self, o: Self) -> (Self, Self) {
        if self.hi == 0 && o.hi == 0 {
            return (Wide::of(self.lo / o.lo), Wide::of(self.lo % o.lo));
        }
        let (mut q, mut r) = (Wide::ZERO, Wide::ZERO);
        for i in (0..2 * Self::HALF).rev() {
            r = r.shl(1).or(Wide::of(u128::from(self.bit(i))));
            if r.cmp(&o) != Ordering::Less {
                r = r.sub(o);
                q = q.or(Wide::ONE.shl(i));
            }
        }
        (q, r)
    }
}

impl PartialOrd for Wide {
    fn partial_cmp(&self, o: &Self) -> Option<Ordering> {
        Some(self.cmp(o))
    }
}

impl Ord for Wide {
    fn cmp(&self, o: &Self) -> Ordering {
        (self.hi, self.lo).cmp(&(o.hi, o.lo))
    }
}

/// A fixed-width two's-complement integer, up to [`ApInt::MAX_WIDTH`] bits.
#[derive(Debug, Clone, Copy, PartialEq, Eq, Hash)]
pub struct ApInt {
    pub width: u32,
    bits: Wide,
}

impl ApInt {
    /// The widest integer held; a wider one keeps its low bits.
    pub const MAX_WIDTH: u32 = 256;
    /// The widest integer the `i128` / `u128` accessors return whole.
    const NARROW: u32 = 128;

    #[inline]
    fn mask(width: u32) -> Wide {
        Wide::mask(width)
    }

    #[inline]
    fn of(width: u32, bits: Wide) -> Self {
        Self { width, bits: bits.and(Self::mask(width)) }
    }

    /// `value` truncated to `width` bits.
    #[inline]
    pub fn new(width: u32, value: i128) -> Self {
        Self::of(width, Wide::of_signed(value))
    }

    #[inline]
    pub fn from_bits(width: u32, bits: u128) -> Self {
        Self::of(width, Wide::of(bits))
    }

    #[inline]
    pub fn zero(width: u32) -> Self {
        Self { width, bits: Wide::ZERO }
    }

    #[inline]
    pub fn all_ones(width: u32) -> Self {
        Self { width, bits: Self::mask(width) }
    }

    /// The low 128 bits.
    #[inline]
    pub fn bits(self) -> u128 {
        self.bits.lo
    }

    /// The value, unsigned (its low 128 bits when wider).
    #[inline]
    pub fn unsigned(self) -> u128 {
        self.bits.lo
    }

    /// The value, signed (its low 128 bits when wider).
    pub fn signed(self) -> i128 {
        if self.width == 0 || self.width >= Self::NARROW {
            return self.bits.lo as i128;
        }
        let shift = Self::NARROW - self.width;
        ((self.bits.lo << shift) as i128) >> shift
    }

    /// The bits sign-extended to the full width.
    fn sext_wide(self) -> Wide {
        if self.is_negative() { self.bits.or(Self::mask(self.width).not()) } else { self.bits }
    }

    #[inline]
    pub fn is_zero(self) -> bool {
        self.bits.is_zero()
    }

    #[inline]
    pub fn is_one(self) -> bool {
        self.bits == Wide::ONE
    }

    #[inline]
    pub fn is_all_ones(self) -> bool {
        self.bits == Self::mask(self.width)
    }

    #[inline]
    pub fn is_negative(self) -> bool {
        self.width > 0 && self.bits.bit(self.width - 1)
    }

    #[inline]
    pub fn signed_min(width: u32) -> Self {
        Self::of(width, Wide::ONE.shl(width - 1))
    }

    #[inline]
    pub fn signed_max(width: u32) -> Self {
        Self::of(width, Wide::ONE.shl(width - 1).sub(Wide::ONE))
    }

    #[inline]
    pub fn is_signed_min(self) -> bool {
        self == Self::signed_min(self.width)
    }

    #[inline]
    pub fn sext(self, width: u32) -> Self {
        Self::of(width, self.sext_wide())
    }

    #[inline]
    pub fn zext(self, width: u32) -> Self {
        Self::of(width, self.bits)
    }

    #[inline]
    pub fn trunc(self, width: u32) -> Self {
        Self::of(width, self.bits)
    }

    #[inline]
    pub fn add(self, o: Self) -> Self {
        Self::of(self.width, self.bits.add(o.bits))
    }

    #[inline]
    pub fn sub(self, o: Self) -> Self {
        Self::of(self.width, self.bits.sub(o.bits))
    }

    #[inline]
    pub fn mul(self, o: Self) -> Self {
        Self::of(self.width, self.bits.mul(o.bits))
    }

    #[inline]
    pub fn neg(self) -> Self {
        Self::zero(self.width).sub(self)
    }

    #[inline]
    pub fn not(self) -> Self {
        Self::of(self.width, self.bits.not())
    }

    #[inline]
    pub fn and(self, o: Self) -> Self {
        Self::of(self.width, self.bits.and(o.bits))
    }

    #[inline]
    pub fn or(self, o: Self) -> Self {
        Self::of(self.width, self.bits.or(o.bits))
    }

    #[inline]
    pub fn xor(self, o: Self) -> Self {
        Self::of(self.width, self.bits.xor(o.bits))
    }

    #[inline]
    pub fn udiv(self, o: Self) -> Option<Self> {
        (!o.is_zero()).then(|| Self::of(self.width, self.bits.divrem(o.bits).0))
    }

    #[inline]
    pub fn urem(self, o: Self) -> Option<Self> {
        (!o.is_zero()).then(|| Self::of(self.width, self.bits.divrem(o.bits).1))
    }

    /// The magnitude of the signed value (`MIN`'s wraps to itself).
    fn magnitude(self) -> Self {
        if self.is_negative() { self.neg() } else { self }
    }

    /// Signed division, wrapping `MIN / -1`.
    pub fn sdiv(self, o: Self) -> Option<Self> {
        if o.is_zero() {
            return None;
        }
        if self.width <= Self::NARROW {
            return Some(Self::new(self.width, self.signed().wrapping_div(o.signed())));
        }
        let q = self.magnitude().udiv(o.magnitude())?;
        Some(if self.is_negative() != o.is_negative() { q.neg() } else { q })
    }

    pub fn srem(self, o: Self) -> Option<Self> {
        if o.is_zero() {
            return None;
        }
        if self.width <= Self::NARROW {
            return Some(Self::new(self.width, self.signed().wrapping_rem(o.signed())));
        }
        let r = self.magnitude().urem(o.magnitude())?;
        Some(if self.is_negative() { r.neg() } else { r })
    }

    /// `sdiv_ov`: also whether it overflowed (`MIN / -1`).
    #[inline]
    pub fn sdiv_ov(self, o: Self) -> Option<(Self, bool)> {
        let q = self.sdiv(o)?;
        Some((q, self.is_signed_min() && o.is_all_ones()))
    }

    #[inline]
    pub fn shl(self, by: u32) -> Self {
        if by >= self.width { Self::zero(self.width) } else { Self::of(self.width, self.bits.shl(by)) }
    }

    #[inline]
    pub fn lshr(self, by: u32) -> Self {
        if by >= self.width { Self::zero(self.width) } else { Self::of(self.width, self.bits.shr(by)) }
    }

    #[inline]
    pub fn ashr(self, by: u32) -> Self {
        let by = by.min(self.width.saturating_sub(1));
        let shifted = self.sext_wide().shr(by);
        // Shifted in from the top: copies of the sign.
        let fill = if self.is_negative() { Wide::mask(2 * Wide::HALF).shl(2 * Wide::HALF - by) } else { Wide::ZERO };
        Self::of(self.width, shifted.or(fill))
    }

    /// Signed order: the sign bit flipped, then unsigned.
    #[inline]
    pub fn scmp(self, o: Self) -> Ordering {
        let flip = |x: Self| x.sext_wide().xor(Wide::ONE.shl(2 * Wide::HALF - 1));
        flip(self).cmp(&flip(o))
    }

    #[inline]
    pub fn ucmp(self, o: Self) -> Ordering {
        self.bits.cmp(&o.bits)
    }

    /// Signed addition overflowed?
    #[inline]
    pub fn sadd_ov(self, o: Self) -> (Self, bool) {
        let r = self.add(o);
        (r, self.is_negative() == o.is_negative() && r.is_negative() != self.is_negative())
    }

    #[inline]
    pub fn uadd_ov(self, o: Self) -> (Self, bool) {
        let r = self.add(o);
        (r, r.bits < self.bits)
    }

    #[inline]
    pub fn ssub_ov(self, o: Self) -> (Self, bool) {
        let r = self.sub(o);
        (r, self.is_negative() != o.is_negative() && r.is_negative() != self.is_negative())
    }

    #[inline]
    pub fn usub_ov(self, o: Self) -> (Self, bool) {
        (self.sub(o), o.bits > self.bits)
    }

    /// The product of the magnitudes did not fit `bits` bits (`a * b`, checked by dividing back).
    fn product_exceeds(a: Wide, b: Wide, bits: u32) -> bool {
        if a.is_zero() || b.is_zero() {
            return false;
        }
        let p = a.mul(b);
        p.divrem(a).0 != b || p > Wide::mask(bits)
    }

    pub fn smul_ov(self, o: Self) -> (Self, bool) {
        let r = self.mul(o);
        if self.width <= Self::NARROW {
            let ov = match self.signed().checked_mul(o.signed()) {
                Some(full) => Self::new(self.width, full).signed() != full,
                None => true,
            };
            return (r, ov);
        }
        let (a, b) = (self.magnitude().bits, o.magnitude().bits);
        // A negative product may reach `-2^(w-1)`, a positive one only `2^(w-1) - 1`.
        let negative = self.is_negative() != o.is_negative();
        let limit = if negative { self.width } else { self.width - 1 };
        let ov = Self::product_exceeds(a, b, limit) && !(negative && a.mul(b) == Wide::ONE.shl(self.width - 1));
        (r, ov)
    }

    pub fn umul_ov(self, o: Self) -> (Self, bool) {
        (self.mul(o), Self::product_exceeds(self.bits, o.bits, self.width))
    }

    #[inline]
    pub fn count_leading_zeros(self) -> u32 {
        if self.bits.is_zero() { self.width } else { self.width - (2 * Wide::HALF - self.bits.leading_zeros()) }
    }

    #[inline]
    pub fn count_trailing_zeros(self) -> u32 {
        if self.bits.is_zero() { self.width } else { self.bits.trailing_zeros() }
    }

    #[inline]
    pub fn popcount(self) -> u32 {
        self.bits.count_ones()
    }

    #[inline]
    pub fn is_power_of_two(self) -> bool {
        self.popcount() == 1
    }

    #[inline]
    pub fn log2(self) -> u32 {
        2 * Wide::HALF - 1 - self.bits.leading_zeros()
    }

    /// The value in decimal, signed or not.
    pub fn to_decimal(self, signed: bool) -> String {
        const TEN: Wide = Wide { lo: 10, hi: 0 };
        let negative = signed && self.is_negative();
        let mut v = if negative { self.neg().bits } else { self.bits };
        if negative && v == Wide::ONE.shl(self.width - 1) && self.width == 2 * Wide::HALF {
            // `MIN` of the full width: its magnitude is itself.
            v = self.bits;
        }
        let mut digits = Vec::new();
        loop {
            let (q, r) = v.divrem(TEN);
            digits.push(b'0' + r.lo as u8);
            v = q;
            if v.is_zero() {
                break;
            }
        }
        if negative {
            digits.push(b'-');
        }
        digits.reverse();
        String::from_utf8(digits).expect("ascii digits")
    }

    /// A decimal literal (optionally negative) truncated to `width` bits.
    pub fn parse_decimal(width: u32, lit: &str) -> Option<Self> {
        const TEN: Wide = Wide { lo: 10, hi: 0 };
        let (negative, digits) = match lit.strip_prefix('-') {
            Some(d) => (true, d),
            None => (false, lit.strip_prefix('+').unwrap_or(lit)),
        };
        if digits.is_empty() || !digits.bytes().all(|c| c.is_ascii_digit()) {
            return None;
        }
        let v = digits.bytes().fold(Wide::ZERO, |acc, c| acc.mul(TEN).add(Wide::of(u128::from(c - b'0'))));
        let x = Self::of(width, v);
        Some(if negative { x.neg() } else { x })
    }

    /// A hexadecimal literal (no `0x`) truncated to `width` bits.
    pub fn parse_hex(width: u32, digits: &str) -> Option<Self> {
        /// The bits of one hex digit.
        const NIBBLE: u32 = 4;
        let v = digits.chars().try_fold(Wide::ZERO, |acc, c| Some(acc.shl(NIBBLE).or(Wide::of(u128::from(c.to_digit(16)?)))))?;
        Some(Self::of(width, v))
    }
}

/// An unbounded unsigned integer, for exact decimal conversion of floats.
#[derive(Debug, Clone, PartialEq, Eq)]
struct BigUint(Vec<u32>);

impl BigUint {
    fn from_u128(mut v: u128) -> Self {
        let mut out = Vec::new();
        while v != 0 {
            out.push(v as u32);
            v >>= 32;
        }
        Self(out)
    }

    #[inline]
    fn is_zero(&self) -> bool {
        self.0.is_empty()
    }

    #[inline]
    fn trim(&mut self) {
        while self.0.last() == Some(&0) {
            self.0.pop();
        }
    }

    fn bits(&self) -> u32 {
        match self.0.last() {
            None => 0,
            Some(top) => (self.0.len() as u32 - 1) * 32 + (32 - top.leading_zeros()),
        }
    }

    fn mul(&self, o: &Self) -> Self {
        let mut out = vec![0u32; self.0.len() + o.0.len()];
        for (i, a) in self.0.iter().enumerate() {
            let mut carry = 0u64;
            for (j, b) in o.0.iter().enumerate() {
                let v = out[i + j] as u64 + *a as u64 * *b as u64 + carry;
                out[i + j] = v as u32;
                carry = v >> 32;
            }
            let mut k = i + o.0.len();
            while carry != 0 {
                let v = out[k] as u64 + carry;
                out[k] = v as u32;
                carry = v >> 32;
                k += 1;
            }
        }
        let mut r = Self(out);
        r.trim();
        r
    }

    fn shl(&mut self, by: u32) {
        let (words, bits) = ((by / 32) as usize, by % 32);
        if bits > 0 {
            let mut carry = 0u32;
            for d in &mut self.0 {
                let v = (*d << bits) | carry;
                carry = *d >> (32 - bits);
                *d = v;
            }
            if carry != 0 {
                self.0.push(carry);
            }
        }
        if words > 0 && !self.is_zero() {
            let mut v = vec![0u32; words];
            v.extend_from_slice(&self.0);
            self.0 = v;
        }
    }

    /// Divides in place by `d`, returning the remainder.
    fn divrem_small(&mut self, d: u32) -> u32 {
        let mut rem = 0u64;
        for x in self.0.iter_mut().rev() {
            let v = (rem << 32) | *x as u64;
            *x = (v / d as u64) as u32;
            rem = v % d as u64;
        }
        self.trim();
        rem as u32
    }

    fn pow(base: u32, mut e: u32) -> Self {
        let mut out = Self::from_u128(1);
        let mut b = Self::from_u128(base as u128);
        while e > 0 {
            if e & 1 == 1 {
                out = out.mul(&b);
            }
            e >>= 1;
            if e > 0 {
                b = b.mul(&b);
            }
        }
        out
    }

    /// Long division by a big divisor (shift-and-subtract; numbers here are small).
    fn div(&self, d: &Self) -> Self {
        if d.0.len() == 1 {
            let mut q = self.clone();
            q.divrem_small(d.0[0]);
            return q;
        }
        let mut q = Self(Vec::new());
        let mut r = Self(Vec::new());
        for i in (0..self.bits()).rev() {
            r.shl(1);
            if (self.0[(i / 32) as usize] >> (i % 32)) & 1 == 1 {
                if r.0.is_empty() {
                    r.0.push(1);
                } else {
                    r.0[0] |= 1;
                }
            }
            if r.cmp_big(d) != Ordering::Less {
                r.sub_assign(d);
                q.set_bit(i);
            }
        }
        q.trim();
        q
    }

    fn set_bit(&mut self, i: u32) {
        let w = (i / 32) as usize;
        if self.0.len() <= w {
            self.0.resize(w + 1, 0);
        }
        self.0[w] |= 1 << (i % 32);
    }

    #[inline]
    fn cmp_big(&self, o: &Self) -> Ordering {
        self.0.len().cmp(&o.0.len()).then_with(|| self.0.iter().rev().cmp(o.0.iter().rev()))
    }

    fn sub_assign(&mut self, o: &Self) {
        let mut borrow = 0i64;
        for i in 0..self.0.len() {
            let v = self.0[i] as i64 - o.0.get(i).copied().unwrap_or(0) as i64 - borrow;
            borrow = i64::from(v < 0);
            self.0[i] = (v + (borrow << 32)) as u32;
        }
        self.trim();
    }

    fn trailing_zeros(&self) -> u32 {
        let mut n = 0;
        for d in &self.0 {
            if *d == 0 {
                n += 32;
            } else {
                return n + d.trailing_zeros();
            }
        }
        n
    }

    fn shr(&mut self, by: u32) {
        let (words, bits) = ((by / 32) as usize, by % 32);
        self.0.drain(..words.min(self.0.len()));
        if bits > 0 {
            let mut carry = 0u32;
            for d in self.0.iter_mut().rev() {
                let v = (*d >> bits) | carry;
                carry = *d << (32 - bits);
                *d = v;
            }
        }
        self.trim();
    }
}

/// The layout of an IEEE-like format: exponent bits and stored mantissa bits, and whether it
/// has no infinities, its one NaN all ones (`fltNonfiniteBehavior::NanOnly`).
#[derive(Debug, Clone, Copy, PartialEq, Eq)]
struct Layout {
    exp: u32,
    mant: u32,
    nan_only: bool,
}

impl Layout {
    fn of(kind: FloatKind) -> Option<Self> {
        Some(match kind {
            FloatKind::F16 => Self::ieee(5, 10),
            FloatKind::BF16 => Self::ieee(8, 7),
            FloatKind::TF32 => Self::ieee(8, 10),
            FloatKind::F32 => Self::ieee(8, 23),
            FloatKind::F64 => Self::ieee(11, 52),
            // The 8-bit formats with IEEE semantics (infinities, NaNs), and f8E4M3FN (no
            // infinities, one NaN); the `FNUZ` ones bias exponents their own way.
            FloatKind::F8E5M2 => Self::ieee(5, 2),
            FloatKind::F8E4M3 => Self::ieee(4, 3),
            FloatKind::F8E3M4 => Self::ieee(3, 4),
            FloatKind::F8E4M3FN => Self { exp: 4, mant: 3, nan_only: true },
            _ => return None,
        })
    }

    #[inline]
    const fn ieee(exp: u32, mant: u32) -> Self {
        Self { exp, mant, nan_only: false }
    }

    /// The bits of the one NaN of a `nan_only` format, without the sign.
    #[inline]
    fn all_ones(self) -> u64 {
        (1u64 << (self.exp + self.mant)) - 1
    }

    #[inline]
    fn bias(self) -> i32 {
        (1 << (self.exp - 1)) - 1
    }

    #[inline]
    fn width(self) -> u32 {
        1 + self.exp + self.mant
    }

    /// Precision, hidden bit included.
    #[inline]
    fn precision(self) -> u32 {
        self.mant + 1
    }

    /// `f64` ⇒ this layout, rounding to nearest, ties to even.
    fn round(self, x: f64) -> u64 {
        let b = x.to_bits();
        let top = (b >> 63) << (self.exp + self.mant);
        let emax = (1u64 << self.exp) - 1;
        if self.nan_only && (x.is_nan() || x.is_infinite()) {
            return top | self.all_ones();
        }
        if x.is_nan() {
            // The top payload bits survive; the result is quiet.
            let payload = (b & ((1 << 52) - 1)) >> (52 - self.mant);
            return top | (emax << self.mant) | payload | (1 << (self.mant - 1));
        }
        if x.is_infinite() {
            return top | (emax << self.mant);
        }
        if x == 0.0 {
            return top;
        }
        // x = m * 2^e2 with m normalized to 53 bits.
        let raw_e = ((b >> 52) & 0x7ff) as i32;
        let (mut m, mut e2) = if raw_e == 0 { (b & ((1 << 52) - 1), -1074) } else { ((b & ((1 << 52) - 1)) | (1 << 52), raw_e - 1075) };
        while m < (1 << 52) {
            m <<= 1;
            e2 -= 1;
        }
        let mut ue = e2 + 52;
        let min_e = 1 - self.bias();
        let subnormal = ue < min_e;
        let shift = 52 - self.mant as i32 + if subnormal { min_e - ue } else { 0 };
        if shift > 60 {
            return top;
        }
        let (m, shift) = (m as u128, shift as u32);
        let mut r = m >> shift;
        let rest = m & ((1u128 << shift) - 1);
        let half = 1u128 << (shift - 1);
        if rest > half || (rest == half && r & 1 == 1) {
            r += 1;
        }
        if subnormal {
            // r may have carried into the smallest normal: the exponent field reads 1 then.
            return top | r as u64;
        }
        if r == 1 << (self.mant + 1) {
            r >>= 1;
            ue += 1;
        }
        let biased = (ue + self.bias()) as u64;
        let mant = r as u64 & ((1 << self.mant) - 1);
        if self.nan_only {
            // (the top exponent holds normals but the NaN; past them, NaN)
            if biased > emax || (biased == emax && mant == (1 << self.mant) - 1) {
                return top | self.all_ones();
            }
            return top | (biased << self.mant) | mant;
        }
        if biased >= emax {
            return top | (emax << self.mant);
        }
        top | (biased << self.mant) | mant
    }

    fn to_f64(self, bits: u64) -> f64 {
        let sign = (bits >> (self.exp + self.mant)) & 1;
        let e = ((bits >> self.mant) & ((1 << self.exp) - 1)) as i32;
        let m = bits & ((1 << self.mant) - 1);
        let emax = (1i32 << self.exp) - 1;
        let mag = if self.nan_only && e == emax && m == (1 << self.mant) - 1 {
            f64::NAN
        } else if e == emax && !self.nan_only {
            if m == 0 { f64::INFINITY } else { f64::from_bits(0x7ff8_0000_0000_0000 | (m << (52 - self.mant))) }
        } else if e == 0 {
            m as f64 * libm_exp2(1 - self.bias() - self.mant as i32)
        } else {
            (m | (1 << self.mant)) as f64 * libm_exp2(e - self.bias() - self.mant as i32)
        };
        if sign == 1 { -mag } else { mag }
    }
}

/// `2^e`, exactly.
fn libm_exp2(e: i32) -> f64 {
    if e >= -1022 {
        f64::from_bits(((e + 1023) as u64) << 52)
    } else {
        f64::from_bits(1u64 << (52 + e + 1022))
    }
}

/// An IEEE-like float of one of the supported formats, as its bits.
#[derive(Debug, Clone, Copy, PartialEq, Eq)]
pub struct ApFloat {
    pub kind: FloatKind,
    pub bits: u64,
}

impl ApFloat {
    #[inline]
    fn layout(self) -> Layout {
        Layout::of(self.kind).expect("unsupported float format")
    }

    #[inline]
    pub fn supported(kind: FloatKind) -> bool {
        Layout::of(kind).is_some()
    }

    #[inline]
    pub fn from_f64(kind: FloatKind, x: f64) -> Option<Self> {
        let l = Layout::of(kind)?;
        Some(Self { kind, bits: if kind == FloatKind::F64 { x.to_bits() } else { l.round(x) } })
    }

    #[inline]
    pub fn from_bits(kind: FloatKind, bits: u64) -> Option<Self> {
        Layout::of(kind).map(|l| Self { kind, bits: bits & ((1u128 << l.width()) - 1) as u64 })
    }

    /// A literal as MLIR spells it: decimal, or `0x...` bits.
    pub fn parse(kind: FloatKind, lit: &str) -> Option<Self> {
        if let Some(hex) = lit.strip_prefix("0x").or_else(|| lit.strip_prefix("0X")) {
            return Self::from_bits(kind, u64::from_str_radix(hex, 16).ok()?);
        }
        if kind == FloatKind::F32 {
            return Some(Self { kind, bits: lit.parse::<f32>().ok()?.to_bits() as u64 });
        }
        Self::from_f64(kind, lit.parse::<f64>().ok()?)
    }

    #[inline]
    pub fn to_f64(self) -> f64 {
        if self.kind == FloatKind::F64 { f64::from_bits(self.bits) } else { self.layout().to_f64(self.bits) }
    }

    #[inline]
    pub fn is_nan(self) -> bool {
        self.to_f64().is_nan()
    }

    #[inline]
    pub fn is_zero(self) -> bool {
        self.to_f64() == 0.0
    }

    #[inline]
    pub fn is_negative(self) -> bool {
        (self.bits >> (self.layout().width() - 1)) & 1 == 1
    }

    #[inline]
    pub fn is_inf(self) -> bool {
        self.to_f64().is_infinite()
    }

    /// The default quiet NaN `APFloat` makes for an invalid operation (positive).
    /// `APFloat::getLargest`.
    #[inline]
    pub fn largest(kind: FloatKind, negative: bool) -> Self {
        let l = Layout::of(kind).expect("unsupported float format");
        let magnitude = if l.nan_only { l.all_ones() - 1 } else { (((1u64 << l.exp) - 2) << l.mant) | ((1u64 << l.mant) - 1) };
        Self { kind, bits: magnitude | (u64::from(negative) << (l.exp + l.mant)) }
    }

    #[inline]
    pub fn nan(kind: FloatKind) -> Self {
        let l = Layout::of(kind).expect("unsupported float format");
        if l.nan_only {
            return Self { kind, bits: l.all_ones() };
        }
        Self { kind, bits: (((1u64 << l.exp) - 1) << l.mant) | (1 << (l.mant - 1)) }
    }

    #[inline]
    pub fn quieted(self) -> Self {
        let l = self.layout();
        if l.nan_only {
            return self;
        }
        Self { kind: self.kind, bits: self.bits | (1 << (l.mant - 1)) }
    }

    /// One arithmetic step with `APFloat`'s NaN rules: a NaN operand comes back (quieted, the
    /// first one first); an invalid operation gives the default NaN.
    pub fn binary(self, o: Self, f32_op: fn(f32, f32) -> f32, f64_op: fn(f64, f64) -> f64) -> Self {
        if self.is_nan() {
            return self.quieted();
        }
        if o.is_nan() {
            return o.quieted();
        }
        let r = if self.kind == FloatKind::F64 {
            Self { kind: self.kind, bits: f64_op(self.to_f64(), o.to_f64()).to_bits() }
        } else {
            let v = f32_op(self.to_f64() as f32, o.to_f64() as f32);
            Self::from_f64(self.kind, v as f64).expect("supported")
        };
        if r.is_nan() { Self::nan(self.kind) } else { r }
    }

    #[inline]
    pub fn add(self, o: Self) -> Self {
        self.binary(o, |a, b| a + b, |a, b| a + b)
    }

    #[inline]
    pub fn sub(self, o: Self) -> Self {
        self.binary(o, |a, b| a - b, |a, b| a - b)
    }

    #[inline]
    pub fn mul(self, o: Self) -> Self {
        self.binary(o, |a, b| a * b, |a, b| a * b)
    }

    #[inline]
    pub fn div(self, o: Self) -> Self {
        self.binary(o, |a, b| a / b, |a, b| a / b)
    }

    #[inline]
    pub fn neg(self) -> Self {
        Self { kind: self.kind, bits: self.bits ^ (1 << (self.layout().width() - 1)) }
    }

    /// Converts to another format (round to nearest even).
    #[inline]
    pub fn convert(self, kind: FloatKind) -> Option<Self> {
        Self::from_f64(kind, self.to_f64())
    }

    /// `APFloat::compare`: `None` when unordered.
    #[inline]
    pub fn compare(self, o: Self) -> Option<Ordering> {
        self.to_f64().partial_cmp(&o.to_f64())
    }

    /// Significand (hidden bit included) and exponent: the value is `sig * 2^exp`.
    fn decompose(self) -> (u128, i32) {
        let l = self.layout();
        let e = ((self.bits >> l.mant) & ((1 << l.exp) - 1)) as i32;
        let m = (self.bits & ((1 << l.mant) - 1)) as u128;
        if e == 0 { (m, 1 - l.bias() - l.mant as i32) } else { (m | (1 << l.mant), e - l.bias() - l.mant as i32) }
    }

    /// `APFloat::toString`.
    pub fn to_string_with(self, precision: u32, max_padding: u32, truncate_zero: bool) -> String {
        let mut out = String::new();
        if self.is_inf() {
            out.push_str(if self.is_negative() { "-Inf" } else { "+Inf" });
            return out;
        }
        if self.is_nan() {
            out.push_str("NaN");
            return out;
        }
        if self.is_zero() {
            if self.is_negative() {
                out.push('-');
            }
            if max_padding == 0 {
                if truncate_zero {
                    out.push_str("0.0E+0");
                } else {
                    out.push_str("0.0");
                    for _ in 1..precision.max(1) {
                        out.push('0');
                    }
                    out.push_str("e+00");
                }
            } else {
                out.push('0');
            }
            return out;
        }
        let (sig, exp) = self.decompose();
        Self::to_string_impl(&mut out, self.is_negative(), exp, sig, self.layout().precision(), precision, max_padding, truncate_zero);
        out
    }

    #[allow(clippy::too_many_arguments)]
    fn to_string_impl(out: &mut String, neg: bool, mut exp: i32, sig: u128, sem_precision: u32, mut precision: u32, max_padding: u32, truncate_zero: bool) {
        if neg {
            out.push('-');
        }
        if precision == 0 {
            precision = 2 + sem_precision * 59 / 196;
        }
        let mut s = BigUint::from_u128(sig);
        let tz = s.trailing_zeros();
        exp += tz as i32;
        s.shr(tz);
        if exp > 0 {
            s.shl(exp as u32);
            exp = 0;
        } else if exp < 0 {
            s = s.mul(&BigUint::pow(5, (-exp) as u32));
        }
        // AdjustToPrecision, on the integer.
        let bits = s.bits();
        let required = (precision * 196 + 58) / 59;
        if bits > required {
            let removable = (bits - required) * 59 / 196;
            if removable > 0 {
                exp += removable as i32;
                s = s.div(&BigUint::pow(10, removable));
            }
        }
        // Digits, least significant first; trailing zeros counted into the exponent.
        let mut buf: Vec<u8> = Vec::new();
        let mut trail = true;
        while !s.is_zero() {
            let d = s.divrem_small(10) as u8;
            if trail && d == 0 {
                exp += 1;
            } else {
                buf.push(b'0' + d);
                trail = false;
            }
        }
        // AdjustToPrecision, on the digits.
        let n = buf.len();
        if n > precision as usize {
            let mut first = n - precision as usize;
            if buf[first - 1] < b'5' {
                while first < n && buf[first] == b'0' {
                    first += 1;
                }
                exp += first as i32;
                buf.drain(..first);
            } else {
                let mut i = first;
                while i < n {
                    if buf[i] == b'9' {
                        first += 1;
                        i += 1;
                    } else {
                        buf[i] += 1;
                        break;
                    }
                }
                if first == n {
                    exp += first as i32;
                    buf = vec![b'1'];
                } else {
                    exp += first as i32;
                    buf.drain(..first);
                }
            }
        }
        let n = buf.len();
        let scientific = if max_padding == 0 {
            true
        } else if exp >= 0 {
            exp as u32 > max_padding || n as u32 + exp as u32 > precision
        } else {
            let msd = exp + n as i32 - 1;
            msd < 0 && (-msd) as u32 > max_padding
        };
        let digit = |i: usize| buf[n - 1 - i] as char;
        if scientific {
            exp += n as i32 - 1;
            out.push(digit(0));
            out.push('.');
            if n == 1 && truncate_zero {
                out.push('0');
            } else {
                (1..n).for_each(|i| out.push(digit(i)));
            }
            if !truncate_zero && precision as usize > n - 1 {
                (0..precision as usize - n + 1).for_each(|_| out.push('0'));
            }
            out.push(if truncate_zero { 'E' } else { 'e' });
            out.push(if exp >= 0 { '+' } else { '-' });
            let e = exp.unsigned_abs();
            let digits = alloc::format!("{e}");
            if !truncate_zero && digits.len() < 2 {
                out.push('0');
            }
            out.push_str(&digits);
            return;
        }
        if exp >= 0 {
            (0..n).for_each(|i| out.push(digit(i)));
            (0..exp).for_each(|_| out.push('0'));
            return;
        }
        let whole = exp + n as i32;
        let mut i = 0;
        if whole > 0 {
            while i < whole as usize {
                out.push(digit(i));
                i += 1;
            }
            out.push('.');
        } else {
            out.push_str("0.");
            (1..1 + (-whole) as usize).for_each(|_| out.push('0'));
        }
        while i < n {
            out.push(digit(i));
            i += 1;
        }
    }

    /// ⭐ How MLIR prints this float (`printFloatValue`): `%e`-like with 6 digits when that
    /// reads back exactly, else the shortest natural form, else the bits in hex.
    pub fn print(self) -> String {
        if !self.is_inf() && !self.is_nan() {
            let s = self.to_string_with(6, 0, false);
            if Self::parse(self.kind, &s).is_some_and(|b| b.bits == self.bits) {
                return s;
            }
            let s = self.to_string_with(0, 3, true);
            if s.contains('.') {
                return s;
            }
        }
        alloc::format!("0x{:X}", self.bits)
    }
}

/// An `f80` (x87 extended) or `f128` (IEEE quad) value that is exactly an `f64`: what folding
/// holds of these formats. Only what stays exact is done with them (conversions, comparison,
/// printing); there is no arithmetic.
#[derive(Debug, Clone, Copy)]
pub struct WideFloat {
    pub kind: FloatKind,
    pub value: f64,
}

impl PartialEq for WideFloat {
    fn eq(&self, o: &Self) -> bool {
        self.kind == o.kind && self.value.to_bits() == o.value.to_bits()
    }
}

impl Eq for WideFloat {}

impl WideFloat {
    /// The exponent bits of both formats and their bias.
    const EXP: u32 = 15;
    const BIAS: i32 = (1 << (Self::EXP - 1)) - 1;
    /// The stored fraction bits (`f80` stores its integer bit too).
    const F80_FRACTION: u32 = 63;
    const F128_FRACTION: u32 = 112;
    /// `f64`'s.
    const F64_FRACTION: u32 = 52;
    const F64_BIAS: i32 = 1023;
    /// The significand precision, `printFloatValue`'s full precision.
    const F80_PRECISION: u32 = 64;
    const F128_PRECISION: u32 = 113;

    /// Whether `kind` is one of these formats.
    #[inline]
    pub fn wide(kind: FloatKind) -> bool {
        matches!(kind, FloatKind::F80 | FloatKind::F128)
    }

    /// `x` in `kind` (`None` for NaN, which is not held).
    pub fn of(kind: FloatKind, x: f64) -> Option<Self> {
        (Self::wide(kind) && !x.is_nan()).then_some(Self { kind, value: x })
    }

    /// The format's bits: sign, 15 exponent bits, then the fraction (`f80` with its explicit
    /// integer bit).
    pub fn bits(self) -> u128 {
        let b = self.value.to_bits();
        let sign = u128::from(b >> 63);
        let raw_e = ((b >> Self::F64_FRACTION) & 0x7ff) as i32;
        let frac = u128::from(b & ((1u64 << Self::F64_FRACTION) - 1));
        let (fraction, f80) = match self.kind {
            FloatKind::F80 => (Self::F80_FRACTION, true),
            _ => (Self::F128_FRACTION, false),
        };
        let top = sign << (Self::EXP + fraction + u32::from(f80));
        let emax = (1u128 << Self::EXP) - 1;
        let (e, m) = if raw_e == 0x7ff {
            // Infinity (NaN is not held).
            (emax, if f80 { 1u128 << Self::F80_FRACTION } else { 0 })
        } else if raw_e == 0 && frac == 0 {
            (0, 0)
        } else {
            // Normalize (an f64 subnormal is a normal here).
            let (mut m, mut e) = if raw_e == 0 { (frac, 1 - Self::F64_BIAS) } else { (frac | (1 << Self::F64_FRACTION), raw_e - Self::F64_BIAS) };
            while m >> Self::F64_FRACTION == 0 {
                m <<= 1;
                e -= 1;
            }
            let m = m << (fraction - Self::F64_FRACTION);
            let m = if f80 { m } else { m & ((1u128 << fraction) - 1) };
            ((e + Self::BIAS) as u128, m)
        };
        // The exponent sits above the stored fraction (with `f80`'s integer bit).
        top | (e << (fraction + u32::from(f80))) | m
    }

    /// The value of the format's bits, when it is exactly an `f64`.
    fn from_bits(kind: FloatKind, bits: u128) -> Option<Self> {
        let f80 = kind == FloatKind::F80;
        let fraction = if f80 { Self::F80_FRACTION } else { Self::F128_FRACTION };
        let stored = fraction + u32::from(f80);
        let sign = (bits >> (Self::EXP + stored)) & 1;
        let e = ((bits >> stored) & ((1 << Self::EXP) - 1)) as i32;
        let m = bits & ((1u128 << stored) - 1);
        let emax = (1i32 << Self::EXP) - 1;
        let mag = if e == emax {
            let payload = if f80 { m & ((1u128 << Self::F80_FRACTION) - 1) } else { m };
            if payload != 0 {
                return None;
            }
            f64::INFINITY
        } else if e == 0 && m == 0 {
            0.0
        } else {
            // significand · 2^(e - bias - fraction), the significand with its integer bit.
            let (sig, e) = if f80 { (m, if e == 0 { 1 } else { e }) } else if e == 0 { (m, 1) } else { (m | (1u128 << fraction), e) };
            let exp = e - Self::BIAS - fraction as i32;
            let tz = sig.trailing_zeros();
            let (sig, exp) = (sig >> tz, exp + tz as i32);
            if sig >> (Self::F64_FRACTION + 1) != 0 {
                return None;
            }
            let x = sig as f64 * libm_exp2_wide(exp)?;
            // Exact only when the scaling did not round (subnormals past f64).
            if (x / libm_exp2_wide(exp)?) as u128 != sig {
                return None;
            }
            x
        };
        Self::of(kind, if sign == 1 { -mag } else { mag })
    }

    /// The exact decimal digits of `x` (no leading or trailing zeros) and the power of ten of
    /// the last one.
    fn exact_decimal(x: f64) -> (String, i32) {
        let b = x.abs().to_bits();
        let raw_e = ((b >> Self::F64_FRACTION) & 0x7ff) as i32;
        let frac = u128::from(b & ((1u64 << Self::F64_FRACTION) - 1));
        let (sig, e) = if raw_e == 0 { (frac, 1 - Self::F64_BIAS - Self::F64_FRACTION as i32) } else { (frac | (1 << Self::F64_FRACTION), raw_e - Self::F64_BIAS - Self::F64_FRACTION as i32) };
        if sig == 0 {
            return (String::from("0"), 0);
        }
        let mut n = BigUint::from_u128(sig);
        let mut exp10 = 0;
        if e >= 0 {
            n.shl(e as u32);
        } else {
            n = n.mul(&BigUint::pow(5, (-e) as u32));
            exp10 = e;
        }
        let mut digits = Vec::new();
        while !n.is_zero() {
            digits.push(b'0' + n.divrem_small(10) as u8);
        }
        let tz = digits.iter().take_while(|d| **d == b'0').count();
        digits.drain(..tz);
        digits.reverse();
        (String::from_utf8(digits).expect("ascii digits"), exp10 + tz as i32)
    }

    /// A decimal literal's digits and power of ten, as [`Self::exact_decimal`] normalizes them.
    fn literal_decimal(lit: &str) -> Option<(bool, String, i32)> {
        let (neg, lit) = match lit.strip_prefix('-') {
            Some(r) => (true, r),
            None => (false, lit.strip_prefix('+').unwrap_or(lit)),
        };
        let (mant, exp) = lit.split_once(['e', 'E']).unwrap_or((lit, "0"));
        let exp: i32 = exp.parse().ok()?;
        let (int, frac) = mant.split_once('.').unwrap_or((mant, ""));
        let all: String = int.chars().chain(frac.chars()).collect();
        if all.is_empty() || !all.bytes().all(|c| c.is_ascii_digit()) {
            return None;
        }
        let digits = all.trim_start_matches('0');
        if digits.is_empty() {
            return Some((neg, String::from("0"), 0));
        }
        let trimmed = digits.trim_end_matches('0');
        let exp10 = exp - frac.len() as i32 + (digits.len() - trimmed.len()) as i32;
        Some((neg, String::from(trimmed), exp10))
    }

    /// A literal as MLIR spells it: decimal (exactly an `f64`), or `0x...` bits.
    pub fn parse(kind: FloatKind, lit: &str) -> Option<Self> {
        if !Self::wide(kind) {
            return None;
        }
        if let Some(hex) = lit.strip_prefix("0x").or_else(|| lit.strip_prefix("0X")) {
            return Self::from_bits(kind, u128::from_str_radix(hex, 16).ok()?);
        }
        let x: f64 = lit.parse().ok()?;
        let (neg, digits, exp10) = Self::literal_decimal(lit)?;
        if x.is_infinite() || (x.is_sign_negative() != neg && x != 0.0) || Self::exact_decimal(x) != (digits, exp10) {
            return None;
        }
        Self::of(kind, x)
    }

    /// As `printFloatValue` prints it: six digits when they are exact, else every digit the
    /// format has, else its bits.
    pub fn print(self) -> String {
        let f = ApFloat { kind: FloatKind::F64, bits: self.value.to_bits() };
        if self.value.is_finite() {
            let s = f.to_string_with(6, 0, false);
            if Self::parse(self.kind, &s).is_some_and(|w| w == self) {
                return s;
            }
            let precision = if self.kind == FloatKind::F80 { Self::F80_PRECISION } else { Self::F128_PRECISION };
            let s = f.to_string_full(precision);
            if s.contains('.') {
                return s;
            }
        }
        alloc::format!("0x{:X}", self.bits())
    }

    /// In another format, when nothing is lost.
    pub fn to_float(self, kind: FloatKind) -> Option<ApFloat> {
        let f = ApFloat::from_f64(kind, self.value)?;
        (f.to_f64().to_bits() == self.value.to_bits()).then_some(f)
    }
}

/// `2^e` as an `f64`, when it is one.
fn libm_exp2_wide(e: i32) -> Option<f64> {
    /// `f64`'s smallest subnormal exponent and largest exponent.
    const MIN: i32 = -1074;
    const MAX: i32 = 1023;
    (MIN..=MAX).contains(&e).then(|| libm_exp2(e))
}

impl ApFloat {
    /// `toString(0, 3, true)` with the significand precision of another format.
    fn to_string_full(self, sem_precision: u32) -> String {
        let mut out = String::new();
        if self.is_zero() {
            return self.to_string_with(0, 3, true);
        }
        let (sig, exp) = self.decompose();
        Self::to_string_impl(&mut out, self.is_negative(), exp, sig, sem_precision, 0, 3, true);
        out
    }
}
