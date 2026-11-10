module attributes {spirv.target_env = #spirv.target_env<#spirv.vce<v1.0, [Shader, Int64], []>, #spirv.resource_limits<>>} {
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
    return
  }
  func.func @bitwise_ops(%arg0: index, %arg1: index) {
    %0 = index.and %arg0, %arg1
    %1 = index.or %arg0, %arg1
    %2 = index.xor %arg0, %arg1
    return
  }
  func.func @constant_ops() {
    %idx42 = index.constant 42
    %true = index.bool.constant true
    %false = index.bool.constant false
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
  func.func @index_cmp(%arg0: index, %arg1: index) {
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
  func.func @index_sizeof() {
    %0 = index.sizeof
    return
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
}

// -----
module attributes {spirv.target_env = #spirv.target_env<#spirv.vce<v1.0, [Kernel, Int64], []>, #spirv.resource_limits<>>} {
  func.func @min_max_ops(%arg0: index, %arg1: index) {
    %0 = index.maxs %arg0, %arg1
    %1 = index.maxu %arg0, %arg1
    %2 = index.mins %arg0, %arg1
    %3 = index.minu %arg0, %arg1
    return
  }
}

