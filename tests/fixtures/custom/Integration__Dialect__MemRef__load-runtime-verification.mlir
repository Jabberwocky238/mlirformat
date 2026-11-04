module {
  func.func @load(%arg0: memref<1xf32>, %arg1: index) {
    %0 = memref.load %arg0[%arg1] : memref<1xf32>
    return
  }
  func.func @load_dynamic(%arg0: memref<?xf32>, %arg1: index) {
    %0 = memref.load %arg0[%arg1] : memref<?xf32>
    return
  }
  func.func @load_nd_dynamic(%arg0: memref<?x?x?xf32>, %arg1: index, %arg2: index, %arg3: index) {
    %0 = memref.load %arg0[%arg1, %arg2, %arg3] : memref<?x?x?xf32>
    return
  }
  func.func @main() {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %c-1 = arith.constant -1 : index
    %c2 = arith.constant 2 : index
    %alloca = memref.alloca() : memref<1xf32>
    %alloc = memref.alloc(%c1) : memref<?xf32>
    %alloc_0 = memref.alloc(%c2, %c2, %c2) : memref<?x?x?xf32>
    call @load(%alloca, %c1) : (memref<1xf32>, index) -> ()
    call @load_dynamic(%alloc, %c1) : (memref<?xf32>, index) -> ()
    call @load_nd_dynamic(%alloc_0, %c1, %c-1, %c0) : (memref<?x?x?xf32>, index, index, index) -> ()
    call @load(%alloca, %c0) : (memref<1xf32>, index) -> ()
    call @load_dynamic(%alloc, %c0) : (memref<?xf32>, index) -> ()
    call @load_nd_dynamic(%alloc_0, %c1, %c1, %c0) : (memref<?x?x?xf32>, index, index, index) -> ()
    memref.dealloc %alloc : memref<?xf32>
    memref.dealloc %alloc_0 : memref<?x?x?xf32>
    return
  }
}

