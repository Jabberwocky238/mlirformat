module {
  func.func @trivial_ops(%arg0: index, %arg1: index) {
    %0 = index.add %arg0, %arg1
    %1 = index.sub %arg0, %arg1
    %2 = index.mul %arg0, %arg1
    %3 = index.divs %arg0, %arg1
    %4 = index.divu %arg0, %arg1
    %5 = index.rems %arg0, %arg1
    %6 = index.remu %arg0, %arg1
    %7 = index.maxs %arg0, %arg1
    %8 = index.maxu %arg0, %arg1
    %9 = index.mins %arg0, %arg1
    %10 = index.minu %arg0, %arg1
    %11 = index.shl %arg0, %arg1
    %12 = index.shrs %arg0, %arg1
    %13 = index.shru %arg0, %arg1
    %14 = index.add %arg0, %arg1
    %15 = index.or %arg0, %arg1
    %16 = index.xor %arg0, %arg1
    %true = index.bool.constant true
    return
  }
  func.func @ceildivs(%arg0: index, %arg1: index) -> index {
    %0 = index.ceildivs %arg0, %arg1
    return %0 : index
  }
  func.func @ceildivu(%arg0: index, %arg1: index) -> index {
    %0 = index.ceildivu %arg0, %arg1
    return %0 : index
  }
  func.func @floordivs(%arg0: index, %arg1: index) -> index {
    %0 = index.floordivs %arg0, %arg1
    return %0 : index
  }
  func.func @index_cast_from(%arg0: index) -> (i64, i32, i64, i32) {
    %0 = index.casts %arg0 : index to i64
    %1 = index.casts %arg0 : index to i32
    %2 = index.castu %arg0 : index to i64
    %3 = index.castu %arg0 : index to i32
    return %0, %1, %2, %3 : i64, i32, i64, i32
  }
  func.func @index_cast_to(%arg0: i32, %arg1: i64) -> (index, index, index, index) {
    %0 = index.casts %arg0 : i32 to index
    %1 = index.casts %arg1 : i64 to index
    %2 = index.castu %arg0 : i32 to index
    %3 = index.castu %arg1 : i64 to index
    return %0, %1, %2, %3 : index, index, index, index
  }
  func.func @index_sizeof() {
    %0 = index.sizeof
    return
  }
  func.func @index_constant() {
    %idx-2100000000 = index.constant -2100000000
    %idx2100000000 = index.constant 2100000000
    %idx-3000000000 = index.constant -3000000000
    %idx3000000000 = index.constant 3000000000
    return
  }
}

