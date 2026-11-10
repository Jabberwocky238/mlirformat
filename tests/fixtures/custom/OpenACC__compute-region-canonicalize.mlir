module {
}

// -----
module {
  func.func @merge_duplicate_ins() -> i32 {
    %c0_i32 = arith.constant 0 : i32
    %alloca = memref.alloca() : memref<i32>
    memref.store %c0_i32, %alloca[] : memref<i32>
    acc.compute_region ins(%arg0 = %alloca, %arg1 = %alloca) : (memref<i32>, memref<i32>) {
      %c1_i32 = arith.constant 1 : i32
      %1 = memref.load %arg0[] : memref<i32>
      %2 = arith.addi %1, %c1_i32 : i32
      memref.store %2, %arg0[] : memref<i32>
      acc.yield
    } {origin = "acc.serial"}
    %0 = memref.load %alloca[] : memref<i32>
    return %0 : i32
  }
}

// -----
module {
  func.func @merge_duplicate_ins_complex_pattern() -> i32 {
    %c0_i32 = arith.constant 0 : i32
    %alloca = memref.alloca() : memref<i32>
    %alloca_0 = memref.alloca() : memref<i32>
    %alloca_1 = memref.alloca() : memref<i32>
    memref.store %c0_i32, %alloca[] : memref<i32>
    memref.store %c0_i32, %alloca_0[] : memref<i32>
    memref.store %c0_i32, %alloca_1[] : memref<i32>
    acc.compute_region ins(%arg0 = %alloca, %arg1 = %alloca_0, %arg2 = %alloca, %arg3 = %alloca_1, %arg4 = %alloca_1, %arg5 = %alloca_0, %arg6 = %alloca) : (memref<i32>, memref<i32>, memref<i32>, memref<i32>, memref<i32>, memref<i32>, memref<i32>) {
      %c1_i32 = arith.constant 1 : i32
      %1 = memref.load %arg0[] : memref<i32>
      %2 = memref.load %arg1[] : memref<i32>
      %3 = memref.load %arg2[] : memref<i32>
      %4 = memref.load %arg3[] : memref<i32>
      %5 = memref.load %arg4[] : memref<i32>
      %6 = memref.load %arg5[] : memref<i32>
      %7 = memref.load %arg6[] : memref<i32>
      %8 = arith.addi %1, %2 : i32
      %9 = arith.addi %8, %3 : i32
      %10 = arith.addi %9, %4 : i32
      %11 = arith.addi %10, %5 : i32
      %12 = arith.addi %11, %6 : i32
      %13 = arith.addi %12, %7 : i32
      %14 = arith.addi %13, %c1_i32 : i32
      memref.store %14, %arg0[] : memref<i32>
      acc.yield
    } {origin = "acc.serial"}
    %0 = memref.load %alloca[] : memref<i32>
    return %0 : i32
  }
}

// -----
module {
  func.func @drop_unused_ins() -> i32 {
    %c0_i32 = arith.constant 0 : i32
    %alloca = memref.alloca() : memref<i32>
    %alloca_0 = memref.alloca() : memref<i32>
    %alloca_1 = memref.alloca() : memref<i32>
    memref.store %c0_i32, %alloca[] : memref<i32>
    memref.store %c0_i32, %alloca_0[] : memref<i32>
    memref.store %c0_i32, %alloca_1[] : memref<i32>
    acc.compute_region ins(%arg0 = %alloca, %arg1 = %alloca_0, %arg2 = %alloca_1) : (memref<i32>, memref<i32>, memref<i32>) {
      %c1_i32 = arith.constant 1 : i32
      %1 = memref.load %arg0[] : memref<i32>
      %2 = arith.addi %1, %c1_i32 : i32
      memref.store %2, %arg0[] : memref<i32>
      acc.yield
    } {origin = "acc.serial"}
    %0 = memref.load %alloca[] : memref<i32>
    return %0 : i32
  }
}

