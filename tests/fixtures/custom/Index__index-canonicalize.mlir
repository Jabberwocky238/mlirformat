module {
  func.func @add() -> (index, index) {
    %idx1 = index.constant 1
    %idx2100 = index.constant 2100
    %idx3000000001 = index.constant 3000000001
    %idx4000002100 = index.constant 4000002100
    %0 = index.add %idx1, %idx2100
    %1 = index.add %idx3000000001, %idx4000002100
    return %0, %1 : index, index
  }
  func.func @add_overflow() -> (index, index) {
    %idx2000000000 = index.constant 2000000000
    %idx8000000000000000000 = index.constant 8000000000000000000
    %0 = index.add %idx2000000000, %idx2000000000
    %1 = index.add %idx8000000000000000000, %idx8000000000000000000
    return %0, %1 : index, index
  }
  func.func @add_fold_constants(%arg0: index) -> index {
    %idx1 = index.constant 1
    %idx2 = index.constant 2
    %0 = index.add %arg0, %idx1
    %1 = index.add %0, %idx2
    return %1 : index
  }
  func.func @sub() -> index {
    %idx-2000000000 = index.constant -2000000000
    %idx3000000000 = index.constant 3000000000
    %0 = index.sub %idx-2000000000, %idx3000000000
    return %0 : index
  }
  func.func @mul() -> index {
    %idx8000000002000000000 = index.constant 8000000002000000000
    %idx2 = index.constant 2
    %0 = index.mul %idx8000000002000000000, %idx2
    return %0 : index
  }
  func.func @mul_fold_constants(%arg0: index) -> index {
    %idx2 = index.constant 2
    %idx3 = index.constant 3
    %0 = index.mul %arg0, %idx2
    %1 = index.mul %0, %idx3
    return %1 : index
  }
  func.func @divs() -> index {
    %idx-2 = index.constant -2
    %idx8589934592 = index.constant 8589934592
    %0 = index.divs %idx8589934592, %idx-2
    return %0 : index
  }
  func.func @divs_nofold() -> (index, index) {
    %idx0 = index.constant 0
    %idx4294967296 = index.constant 4294967296
    %idx2 = index.constant 2
    %0 = index.divs %idx2, %idx0
    %1 = index.divs %idx4294967296, %idx2
    return %0, %1 : index, index
  }
  func.func @divu() -> index {
    %idx-2 = index.constant -2
    %idx8589934592 = index.constant 8589934592
    %0 = index.divu %idx8589934592, %idx-2
    return %0 : index
  }
  func.func @divu_nofold() -> (index, index) {
    %idx0 = index.constant 0
    %idx4294967296 = index.constant 4294967296
    %idx2 = index.constant 2
    %0 = index.divu %idx2, %idx0
    %1 = index.divu %idx4294967296, %idx2
    return %0, %1 : index, index
  }
  func.func @ceildivs() -> (index, index, index) {
    %idx0 = index.constant 0
    %idx2 = index.constant 2
    %idx5 = index.constant 5
    %0 = index.ceildivs %idx0, %idx5
    %1 = index.ceildivs %idx2, %idx5
    %2 = index.ceildivs %idx5, %idx2
    return %0, %1, %2 : index, index, index
  }
  func.func @ceildivs_neg() -> index {
    %idx-5 = index.constant -5
    %idx2 = index.constant 2
    %0 = index.ceildivs %idx-5, %idx2
    return %0 : index
  }
  func.func @ceildivs_edge() -> (index, index) {
    %idx-1 = index.constant -1
    %idx-2147483648 = index.constant -2147483648
    %idx2147483647 = index.constant 2147483647
    %0 = index.ceildivs %idx-2147483648, %idx-1
    %1 = index.ceildivs %idx2147483647, %idx-1
    return %0, %1 : index, index
  }
  func.func @ceildivu() -> index {
    %idx8589934593 = index.constant 8589934593
    %idx2 = index.constant 2
    %0 = index.ceildivu %idx8589934593, %idx2
    return %0 : index
  }
  func.func @floordivs() -> index {
    %idx-5 = index.constant -5
    %idx2 = index.constant 2
    %0 = index.floordivs %idx-5, %idx2
    return %0 : index
  }
  func.func @floordivs_edge() -> (index, index) {
    %idx-2147483648 = index.constant -2147483648
    %idx2147483647 = index.constant 2147483647
    %idx-1 = index.constant -1
    %idx1 = index.constant 1
    %0 = index.floordivs %idx-2147483648, %idx1
    %1 = index.floordivs %idx2147483647, %idx-1
    return %0, %1 : index, index
  }
  func.func @floordivs_nofold() -> index {
    %idx4294967296 = index.constant 4294967296
    %idx2 = index.constant 2
    %0 = index.floordivs %idx4294967296, %idx2
    return %0 : index
  }
  func.func @rems_zerodiv_nofold() -> index {
    %idx2 = index.constant 2
    %idx0 = index.constant 0
    %0 = index.rems %idx2, %idx0
    return %0 : index
  }
  func.func @remu_zerodiv_nofold() -> index {
    %idx2 = index.constant 2
    %idx0 = index.constant 0
    %0 = index.remu %idx2, %idx0
    return %0 : index
  }
  func.func @rems() -> index {
    %idx-5 = index.constant -5
    %idx2 = index.constant 2
    %0 = index.rems %idx-5, %idx2
    return %0 : index
  }
  func.func @rems_nofold() -> index {
    %idx2 = index.constant 2
    %idx4294967297 = index.constant 4294967297
    %0 = index.rems %idx2, %idx4294967297
    return %0 : index
  }
  func.func @remu() -> index {
    %idx2 = index.constant 2
    %idx-1 = index.constant -1
    %0 = index.remu %idx2, %idx-1
    return %0 : index
  }
  func.func @remu_nofold() -> index {
    %idx2 = index.constant 2
    %idx4294967297 = index.constant 4294967297
    %0 = index.remu %idx2, %idx4294967297
    return %0 : index
  }
  func.func @maxs() -> index {
    %idx-4 = index.constant -4
    %idx2 = index.constant 2
    %0 = index.maxs %idx-4, %idx2
    return %0 : index
  }
  func.func @maxs_nofold() -> index {
    %idx1 = index.constant 1
    %idx4294967296 = index.constant 4294967296
    %0 = index.maxs %idx1, %idx4294967296
    return %0 : index
  }
  func.func @maxs_edge() -> index {
    %idx1 = index.constant 1
    %idx4294967297 = index.constant 4294967297
    %0 = index.maxs %idx1, %idx4294967297
    return %0 : index
  }
  func.func @maxs_fold_constants(%arg0: index) -> index {
    %idx-2 = index.constant -2
    %idx3 = index.constant 3
    %0 = index.maxs %arg0, %idx-2
    %1 = index.maxs %0, %idx3
    return %1 : index
  }
  func.func @maxu() -> index {
    %idx-1 = index.constant -1
    %idx1 = index.constant 1
    %0 = index.maxu %idx-1, %idx1
    return %0 : index
  }
  func.func @maxu_fold_constants(%arg0: index) -> index {
    %idx2 = index.constant 2
    %idx3 = index.constant 3
    %0 = index.maxu %arg0, %idx2
    %1 = index.maxu %0, %idx3
    return %1 : index
  }
  func.func @mins() -> index {
    %idx-4 = index.constant -4
    %idx2 = index.constant 2
    %0 = index.mins %idx-4, %idx2
    return %0 : index
  }
  func.func @mins_nofold() -> index {
    %idx1 = index.constant 1
    %idx4294967296 = index.constant 4294967296
    %0 = index.mins %idx1, %idx4294967296
    return %0 : index
  }
  func.func @mins_nofold_2() -> index {
    %idx2147483647 = index.constant 2147483647
    %idx2147483648 = index.constant 2147483648
    %0 = index.mins %idx2147483647, %idx2147483648
    return %0 : index
  }
  func.func @mins_fold_constants(%arg0: index) -> index {
    %idx-2 = index.constant -2
    %idx3 = index.constant 3
    %0 = index.mins %arg0, %idx-2
    %1 = index.mins %0, %idx3
    return %1 : index
  }
  func.func @minu() -> index {
    %idx-1 = index.constant -1
    %idx1 = index.constant 1
    %0 = index.minu %idx-1, %idx1
    return %0 : index
  }
  func.func @minu_fold_constants(%arg0: index) -> index {
    %idx2 = index.constant 2
    %idx3 = index.constant 3
    %0 = index.minu %arg0, %idx2
    %1 = index.minu %0, %idx3
    return %1 : index
  }
  func.func @shl() -> index {
    %idx128 = index.constant 128
    %idx2 = index.constant 2
    %0 = index.shl %idx128, %idx2
    return %0 : index
  }
  func.func @shl_32() -> index {
    %idx1 = index.constant 1
    %idx32 = index.constant 32
    %0 = index.shl %idx1, %idx32
    return %0 : index
  }
  func.func @shl_edge() -> index {
    %idx4000000000 = index.constant 4000000000
    %idx31 = index.constant 31
    %0 = index.shl %idx4000000000, %idx31
    return %0 : index
  }
  func.func @shrs() -> index {
    %idx128 = index.constant 128
    %idx2 = index.constant 2
    %0 = index.shrs %idx128, %idx2
    return %0 : index
  }
  func.func @shrs_32() -> index {
    %idx4000000000000 = index.constant 4000000000000
    %idx32 = index.constant 32
    %0 = index.shrs %idx4000000000000, %idx32
    return %0 : index
  }
  func.func @shrs_nofold() -> index {
    %idx4294967296 = index.constant 4294967296
    %idx1 = index.constant 1
    %0 = index.shrs %idx4294967296, %idx1
    return %0 : index
  }
  func.func @shrs_edge() -> index {
    %idx1099511627776 = index.constant 1099511627776
    %idx3 = index.constant 3
    %0 = index.shrs %idx1099511627776, %idx3
    return %0 : index
  }
  func.func @shru() -> index {
    %idx128 = index.constant 128
    %idx2 = index.constant 2
    %0 = index.shru %idx128, %idx2
    return %0 : index
  }
  func.func @shru_32() -> index {
    %idx4000000000000 = index.constant 4000000000000
    %idx32 = index.constant 32
    %0 = index.shru %idx4000000000000, %idx32
    return %0 : index
  }
  func.func @shru_nofold() -> index {
    %idx4294967296 = index.constant 4294967296
    %idx1 = index.constant 1
    %0 = index.shru %idx4294967296, %idx1
    return %0 : index
  }
  func.func @shru_edge() -> index {
    %idx1099511627776 = index.constant 1099511627776
    %idx3 = index.constant 3
    %0 = index.shru %idx1099511627776, %idx3
    return %0 : index
  }
  func.func @and() -> index {
    %idx5 = index.constant 5
    %idx1 = index.constant 1
    %0 = index.and %idx5, %idx1
    return %0 : index
  }
  func.func @and_fold_constants(%arg0: index) -> index {
    %idx5 = index.constant 5
    %idx1 = index.constant 1
    %0 = index.and %arg0, %idx5
    %1 = index.and %0, %idx1
    return %1 : index
  }
  func.func @or() -> index {
    %idx5 = index.constant 5
    %idx2 = index.constant 2
    %0 = index.or %idx5, %idx2
    return %0 : index
  }
  func.func @or_fold_constants(%arg0: index) -> index {
    %idx5 = index.constant 5
    %idx1 = index.constant 1
    %0 = index.or %arg0, %idx5
    %1 = index.or %0, %idx1
    return %1 : index
  }
  func.func @xor() -> index {
    %idx5 = index.constant 5
    %idx1 = index.constant 1
    %0 = index.xor %idx5, %idx1
    return %0 : index
  }
  func.func @xor_fold_constants(%arg0: index) -> index {
    %idx5 = index.constant 5
    %idx1 = index.constant 1
    %0 = index.xor %arg0, %idx5
    %1 = index.xor %0, %idx1
    return %1 : index
  }
  func.func @cmp(%arg0: index) -> (i1, i1, i1, i1, i1, i1) {
    %idx0 = index.constant 0
    %idx-1 = index.constant -1
    %idx-2 = index.constant -2
    %idx4 = index.constant 4
    %0 = index.cmp slt(%idx0, %idx-1)
    %1 = index.cmp ugt(%idx-1, %idx0)
    %2 = index.cmp ne(%idx4, %idx0)
    %3 = index.cmp sgt(%idx-1, %idx0)
    %4 = index.sub %idx0, %arg0
    %5 = index.cmp sgt(%4, %idx0)
    %6 = index.sub %idx0, %arg0
    %7 = index.cmp sgt(%idx0, %6)
    return %0, %1, %2, %3, %5, %7 : i1, i1, i1, i1, i1, i1
  }
  func.func @cmp_same_args(%arg0: index) -> (i1, i1, i1, i1, i1, i1, i1, i1, i1, i1) {
    %0 = index.cmp eq(%arg0, %arg0)
    %1 = index.cmp sge(%arg0, %arg0)
    %2 = index.cmp sle(%arg0, %arg0)
    %3 = index.cmp uge(%arg0, %arg0)
    %4 = index.cmp ule(%arg0, %arg0)
    %5 = index.cmp ne(%arg0, %arg0)
    %6 = index.cmp sgt(%arg0, %arg0)
    %7 = index.cmp slt(%arg0, %arg0)
    %8 = index.cmp ugt(%arg0, %arg0)
    %9 = index.cmp ult(%arg0, %arg0)
    return %0, %1, %2, %3, %4, %5, %6, %7, %8, %9 : i1, i1, i1, i1, i1, i1, i1, i1, i1, i1
  }
  func.func @cmp_nofold() -> i1 {
    %idx1 = index.constant 1
    %idx4294967296 = index.constant 4294967296
    %0 = index.cmp slt(%idx1, %idx4294967296)
    return %0 : i1
  }
  func.func @cmp_edge() -> i1 {
    %idx1 = index.constant 1
    %idx4294967298 = index.constant 4294967298
    %0 = index.cmp slt(%idx1, %idx4294967298)
    return %0 : i1
  }
  func.func @cmp_maxs(%arg0: index) -> (i1, i1) {
    %idx0 = index.constant 0
    %idx1 = index.constant 1
    %0 = index.maxs %arg0, %idx1
    %1 = index.cmp sgt(%0, %idx0)
    %2 = index.cmp eq(%0, %idx0)
    return %1, %2 : i1, i1
  }
  func.func @mul_identity(%arg0: index) -> (index, index) {
    %idx0 = index.constant 0
    %idx1 = index.constant 1
    %0 = index.mul %arg0, %idx0
    %1 = index.mul %arg0, %idx1
    return %0, %1 : index, index
  }
  func.func @add_identity(%arg0: index) -> index {
    %idx0 = index.constant 0
    %0 = index.add %arg0, %idx0
    return %0 : index
  }
  func.func @sub_identity(%arg0: index) -> index {
    %idx0 = index.constant 0
    %0 = index.sub %arg0, %idx0
    return %0 : index
  }
  func.func @castu_to_index() -> index {
    %c8000000000000_i48 = arith.constant 8000000000000 : i48
    %0 = index.castu %c8000000000000_i48 : i48 to index
    return %0 : index
  }
  func.func @casts_to_index() -> index {
    %c-1000_i48 = arith.constant -1000 : i48
    %0 = index.casts %c-1000_i48 : i48 to index
    return %0 : index
  }
}

