module {
  func.func @not_with_maybe_overflow(%arg0: i32) -> (i32, i32, i32, i32, i32, i32, i64, i1, i1, i1, i1) {
    %c2147483647_i32 = arith.constant 2147483647 : i32
    %c1_i32 = arith.constant 1 : i32
    %c4_i32 = arith.constant 4 : i32
    %0 = arith.minui %arg0, %c2147483647_i32 : i32
    %1 = arith.addi %0, %c1_i32 : i32
    %2 = arith.divsi %1, %c4_i32 : i32
    %3 = arith.ceildivsi %1, %c4_i32 : i32
    %4 = arith.floordivsi %1, %c4_i32 : i32
    %5 = arith.remsi %1, %c4_i32 : i32
    %6 = arith.minsi %1, %c4_i32 : i32
    %7 = arith.maxsi %1, %c4_i32 : i32
    %8 = arith.extsi %1 : i32 to i64
    %9 = arith.cmpi sle, %1, %c4_i32 : i32
    %10 = arith.cmpi slt, %1, %c4_i32 : i32
    %11 = arith.cmpi sge, %1, %c4_i32 : i32
    %12 = arith.cmpi sgt, %1, %c4_i32 : i32
    return %2, %3, %4, %5, %6, %7, %8, %9, %10, %11, %12 : i32, i32, i32, i32, i32, i32, i64, i1, i1, i1, i1
  }
  func.func @yes_with_no_overflow(%arg0: i32) -> (i32, i32, i32, i32, i32, i32, i64, i1, i1, i1, i1) {
    %c2147483646_i32 = arith.constant 2147483646 : i32
    %c1_i32 = arith.constant 1 : i32
    %c4_i32 = arith.constant 4 : i32
    %0 = arith.minui %arg0, %c2147483646_i32 : i32
    %1 = arith.addi %0, %c1_i32 : i32
    %2 = arith.divsi %1, %c4_i32 : i32
    %3 = arith.ceildivsi %1, %c4_i32 : i32
    %4 = arith.floordivsi %1, %c4_i32 : i32
    %5 = arith.remsi %1, %c4_i32 : i32
    %6 = arith.minsi %1, %c4_i32 : i32
    %7 = arith.maxsi %1, %c4_i32 : i32
    %8 = arith.extsi %1 : i32 to i64
    %9 = arith.cmpi sle, %1, %c4_i32 : i32
    %10 = arith.cmpi slt, %1, %c4_i32 : i32
    %11 = arith.cmpi sge, %1, %c4_i32 : i32
    %12 = arith.cmpi sgt, %1, %c4_i32 : i32
    return %2, %3, %4, %5, %6, %7, %8, %9, %10, %11, %12 : i32, i32, i32, i32, i32, i32, i64, i1, i1, i1, i1
  }
  func.func @preserves_structure(%arg0: memref<8xindex>) {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %c4 = arith.constant 4 : index
    %c8 = arith.constant 8 : index
    scf.for %arg1 = %c0 to %c8 step %c1 {
      %0 = arith.remsi %arg1, %c4 : index
      %1 = arith.addi %0, %0 : index
      %2 = arith.cmpi sle, %1, %c4 : index
      scf.if %2 {
        memref.store %1, %arg0[%arg1] : memref<8xindex>
      }
    }
    return
  }
  func.func private @external() -> i8
  func.func @dead_code() -> i8 {
    %0 = call @external() : () -> i8
    %1 = arith.floordivsi %0, %0 : i8
    return %1 : i8
  }
  func.func @no_integer_or_index(%arg0: vector<1xi32>) -> vector<1xi1> {
    %cst = arith.constant dense<0> : vector<1xi32>
    %0 = arith.cmpi slt, %cst, %arg0 : vector<1xi32>
    return %0 : vector<1xi1>
  }
  func.func @gpu_func(%arg0: memref<2x32xf32>, %arg1: memref<2x32xf32>, %arg2: memref<32xf32>, %arg3: f32, %arg4: !gpu.async.token, %arg5: index, %arg6: index) -> memref<2x32xf32> {
    %c1 = arith.constant 1 : index
    %0 = gpu.launch async [%arg4] blocks(%arg7, %arg8, %arg9) in (%arg13 = %c1, %arg14 = %c1, %arg15 = %c1) threads(%arg10, %arg11, %arg12) in (%arg16 = %c1, %arg17 = %c1, %arg18 = %c1) {
      gpu.terminator
    }
    return %arg1 : memref<2x32xf32>
  }
}

