module {
  func.func @test_inline(%arg0: memref<*xf32>) -> (memref<*xf32>, i1) {
    %0:2 = call @inner_func(%arg0) : (memref<*xf32>) -> (memref<*xf32>, i1)
    return %0#0, %0#1 : memref<*xf32>, i1
  }
  func.func @inner_func(%arg0: memref<*xf32>) -> (memref<*xf32>, i1) {
    %true = arith.constant true
    %0 = bufferization.clone %arg0 : memref<*xf32> to memref<*xf32>
    %1 = bufferization.dealloc (%arg0 : memref<*xf32>) if (%true) retain (%0 : memref<*xf32>)
    return %0, %1 : memref<*xf32>, i1
  }
}

