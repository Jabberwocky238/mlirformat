module {
  func.func @transfer_read_2d(%arg0: memref<40xi32>, %arg1: index) {
    %c-42_i32 = arith.constant -42 : i32
    %0 = vector.transfer_read %arg0[%arg1], %c-42_i32 : memref<40xi32>, vector<40xi32>
    vector.print %0 : vector<40xi32>
    return
  }
  func.func @entry() {
    %c0 = arith.constant 0 : index
    %c20_i32 = arith.constant 20 : i32
    %c10_i32 = arith.constant 10 : i32
    %c-10_i32 = arith.constant -10 : i32
    %c2147483647_i32 = arith.constant 2147483647 : i32
    %alloc = memref.alloc() : memref<40xi32>
    affine.for %arg0 = 0 to 40 {
      %0 = arith.index_cast %arg0 : index to i32
      %1 = arith.subi %0, %c20_i32 : i32
      memref.store %1, %alloc[%arg0] : memref<40xi32>
    }
    call @transfer_read_2d(%alloc, %c0) : (memref<40xi32>, index) -> ()
    affine.for %arg0 = 0 to 40 {
      %0 = arith.index_cast %arg0 : index to i32
      %1 = arith.subi %0, %c20_i32 : i32
      %2 = arith.ceildivsi %1, %c10_i32 : i32
      memref.store %2, %alloc[%arg0] : memref<40xi32>
    }
    call @transfer_read_2d(%alloc, %c0) : (memref<40xi32>, index) -> ()
    affine.for %arg0 = 0 to 40 {
      %0 = arith.index_cast %arg0 : index to i32
      %1 = arith.subi %0, %c20_i32 : i32
      %2 = arith.floordivsi %1, %c10_i32 : i32
      memref.store %2, %alloc[%arg0] : memref<40xi32>
    }
    call @transfer_read_2d(%alloc, %c0) : (memref<40xi32>, index) -> ()
    affine.for %arg0 = 0 to 40 {
      %0 = arith.index_cast %arg0 : index to i32
      %1 = arith.subi %0, %c20_i32 : i32
      %2 = arith.ceildivsi %1, %c-10_i32 : i32
      memref.store %2, %alloc[%arg0] : memref<40xi32>
    }
    call @transfer_read_2d(%alloc, %c0) : (memref<40xi32>, index) -> ()
    affine.for %arg0 = 0 to 40 {
      %0 = arith.index_cast %arg0 : index to i32
      %1 = arith.subi %0, %c20_i32 : i32
      %2 = arith.floordivsi %1, %c-10_i32 : i32
      memref.store %2, %alloc[%arg0] : memref<40xi32>
    }
    call @transfer_read_2d(%alloc, %c0) : (memref<40xi32>, index) -> ()
    affine.for %arg0 = 0 to 40 {
      %0 = arith.index_cast %arg0 : index to i32
      %1 = arith.ceildivui %0, %c10_i32 : i32
      memref.store %1, %alloc[%arg0] : memref<40xi32>
    }
    call @transfer_read_2d(%alloc, %c0) : (memref<40xi32>, index) -> ()
    affine.for %arg0 = 0 to 40 {
      %0 = arith.index_cast %arg0 : index to i32
      %1 = arith.subi %0, %c20_i32 : i32
      %2 = arith.ceildivui %1, %c2147483647_i32 : i32
      memref.store %2, %alloc[%arg0] : memref<40xi32>
    }
    call @transfer_read_2d(%alloc, %c0) : (memref<40xi32>, index) -> ()
    memref.dealloc %alloc : memref<40xi32>
    return
  }
}

// -----
module {
  func.func @non_inline_function() -> (i64, i64, i64, i64, i64, i64) {
    %c-9223372036854775807_i64 = arith.constant -9223372036854775807 : i64
    %c-1_i64 = arith.constant -1 : i64
    %c-9223372036854775808_i64 = arith.constant -9223372036854775808 : i64
    %c1_i64 = arith.constant 1 : i64
    %c9223372036854775807_i64 = arith.constant 9223372036854775807 : i64
    return %c-9223372036854775807_i64, %c-1_i64, %c-9223372036854775808_i64, %c1_i64, %c9223372036854775807_i64, %c-1_i64 : i64, i64, i64, i64, i64, i64
  }
  func.func @main() {
    %0:6 = call @non_inline_function() : () -> (i64, i64, i64, i64, i64, i64)
    %1 = arith.floordivsi %0#0, %0#1 : i64
    %2 = arith.floordivsi %0#2, %0#3 : i64
    %3 = arith.floordivsi %0#4, %0#5 : i64
    vector.print %1 : i64
    vector.print %2 : i64
    vector.print %3 : i64
    return
  }
}

