module {
  func.func @slicing_linalg_op(%arg0: index, %arg1: index, %arg2: index) {
    %alloc = memref.alloc(%arg0, %arg2) : memref<?x?xf32>
    %alloc_0 = memref.alloc(%arg2, %arg1) : memref<?x?xf32>
    cf.br ^bb1
  ^bb1:  // pred: ^bb0
    %alloc_1 = memref.alloc(%arg0, %arg1) : memref<?x?xf32>
    %alloc_2 = memref.alloc(%arg0, %arg1) : memref<?x?xf32>
    linalg.matmul ins(%alloc, %alloc_0 : memref<?x?xf32>, memref<?x?xf32>) outs(%alloc_1 : memref<?x?xf32>)
    linalg.matmul ins(%alloc, %alloc_0 : memref<?x?xf32>, memref<?x?xf32>) outs(%alloc_2 : memref<?x?xf32>)
    memref.dealloc %alloc_1 : memref<?x?xf32>
    memref.dealloc %alloc_0 : memref<?x?xf32>
    memref.dealloc %alloc : memref<?x?xf32>
    memref.dealloc %alloc_2 : memref<?x?xf32>
    return
  }
}

