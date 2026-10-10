module {
  func.func @binary_ops(%arg0: index, %arg1: index) {
    %0 = index.add %arg0, %arg1
    %1 = index.sub %arg0, %arg1
    %2 = index.mul %arg0, %arg1
    %3 = index.divs %arg0, %arg1
    %4 = index.divu %arg0, %arg1
    %5 = index.ceildivs %arg0, %arg1
    %6 = index.ceildivu %arg0, %arg1
    %7 = index.floordivs %arg0, %arg1
    %8 = index.rems %arg0, %arg1
    %9 = index.remu %arg0, %arg1
    %10 = index.maxs %arg0, %arg1
    %11 = index.maxu %arg0, %arg1
    %12 = index.mins %arg0, %arg1
    %13 = index.minu %arg0, %arg1
    %14 = index.shl %arg0, %arg1
    %15 = index.shrs %arg0, %arg1
    %16 = index.shru %arg0, %arg1
    %17 = index.and %arg0, %arg1
    %18 = index.or %arg0, %arg1
    %19 = index.xor %arg0, %arg1
    return
  }
  func.func @cmp_op(%arg0: index, %arg1: index) {
    %0 = index.cmp eq(%arg0, %arg1)
    %1 = index.cmp ne(%arg0, %arg1)
    %2 = index.cmp slt(%arg0, %arg1)
    %3 = index.cmp sle(%arg0, %arg1)
    %4 = index.cmp sgt(%arg0, %arg1)
    %5 = index.cmp sge(%arg0, %arg1)
    %6 = index.cmp ult(%arg0, %arg1)
    %7 = index.cmp ule(%arg0, %arg1)
    %8 = index.cmp ugt(%arg0, %arg1)
    %9 = index.cmp uge(%arg0, %arg1)
    return
  }
  func.func @sizeof_op() {
    %0 = index.sizeof
    return
  }
  func.func @constant_op() {
    %idx0 = index.constant 0
    %idx1 = index.constant 1
    %idx42 = index.constant 42
    return
  }
  func.func @bool_constant_op() {
    %true = index.bool.constant true
    %false = index.bool.constant false
    return
  }
  func.func @cast_op(%arg0: index, %arg1: i32, %arg2: i64) {
    %0 = index.casts %arg0 : index to i64
    %1 = index.casts %arg1 : i32 to index
    %2 = index.casts %arg2 : i64 to index
    %3 = index.castu %arg0 : index to i64
    %4 = index.castu %arg1 : i32 to index
    %5 = index.castu %arg2 : i64 to index
    return
  }
}

