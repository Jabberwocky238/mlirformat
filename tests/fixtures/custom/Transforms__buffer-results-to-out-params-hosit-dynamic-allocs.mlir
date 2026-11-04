module {
  func.func private @single_alloc(%arg0: index) -> memref<?xf32> {
    %alloc = memref.alloc(%arg0) : memref<?xf32>
    return %alloc : memref<?xf32>
  }
  func.func @single_alloc_test(%arg0: index) {
    %0 = call @single_alloc(%arg0) : (index) -> memref<?xf32>
    "test.sink"(%0) : (memref<?xf32>) -> ()
  }
}

// -----
module {
  func.func private @mult_alloc(%arg0: index, %arg1: index) -> (memref<?x?xf32>, memref<?xf32>) {
    %alloc = memref.alloc(%arg0, %arg1) : memref<?x?xf32>
    %alloc_0 = memref.alloc(%arg1) : memref<?xf32>
    return %alloc, %alloc_0 : memref<?x?xf32>, memref<?xf32>
  }
  func.func @mult_alloc_test(%arg0: index, %arg1: index) {
    %0:2 = call @mult_alloc(%arg0, %arg1) : (index, index) -> (memref<?x?xf32>, memref<?xf32>)
    "test.sink"(%0#0, %0#1) : (memref<?x?xf32>, memref<?xf32>) -> ()
  }
}

// -----
module {
  func.func private @complex_alloc(%arg0: index, %arg1: index) -> (memref<?x?xf32>, memref<4xf32>, memref<?xf32>) {
    %alloc = memref.alloc(%arg0, %arg1) : memref<?x?xf32>
    %alloc_0 = memref.alloc() : memref<4xf32>
    %alloc_1 = memref.alloc(%arg1) : memref<?xf32>
    return %alloc, %alloc_0, %alloc_1 : memref<?x?xf32>, memref<4xf32>, memref<?xf32>
  }
  func.func @complex_alloc_test(%arg0: index, %arg1: index) {
    %0:3 = call @complex_alloc(%arg0, %arg1) : (index, index) -> (memref<?x?xf32>, memref<4xf32>, memref<?xf32>)
    "test.sink"(%0#0, %0#1, %0#2) : (memref<?x?xf32>, memref<4xf32>, memref<?xf32>) -> ()
  }
}

