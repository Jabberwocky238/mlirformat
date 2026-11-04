module {
  func.func @multi_slot_alloca() -> (i32, i32) {
    %c0 = arith.constant 0 : index
    %0:2 = test.multi_slot_alloca : () -> (memref<2xi32>, memref<4xi32>)
    %1 = memref.load %0#0[%c0] {first} : memref<2xi32>
    %2 = memref.load %0#1[%c0] {second} : memref<4xi32>
    return %1, %2 : i32, i32
  }
}

// -----
module {
  func.func private @consumer(memref<2xi32>)
  func.func @multi_slot_alloca_only_second() -> (i32, i32) {
    %c0 = arith.constant 0 : index
    %0:2 = test.multi_slot_alloca : () -> (memref<2xi32>, memref<4xi32>)
    call @consumer(%0#0) : (memref<2xi32>) -> ()
    %1 = memref.load %0#0[%c0] : memref<2xi32>
    %2 = memref.load %0#1[%c0] : memref<4xi32>
    return %1, %2 : i32, i32
  }
}

