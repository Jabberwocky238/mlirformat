module {
  func.func @sparse_push_back(%arg0: index, %arg1: memref<?xf64>, %arg2: f64) -> (memref<?xf64>, index) {
    %outBuffer, %newSize = sparse_tensor.push_back %arg0, %arg1, %arg2 : index, memref<?xf64>, f64
    return %outBuffer, %newSize : memref<?xf64>, index
  }
}

// -----
module {
  func.func @sparse_push_back_n(%arg0: index, %arg1: memref<?xf64>, %arg2: f64, %arg3: index) -> (memref<?xf64>, index) {
    %outBuffer, %newSize = sparse_tensor.push_back %arg0, %arg1, %arg2, %arg3 : index, memref<?xf64>, f64, index
    return %outBuffer, %newSize : memref<?xf64>, index
  }
}

// -----
module {
  func.func @sparse_push_back_inbound(%arg0: index, %arg1: memref<?xf64>, %arg2: f64) -> (memref<?xf64>, index) {
    %outBuffer, %newSize = sparse_tensor.push_back inbounds %arg0, %arg1, %arg2 : index, memref<?xf64>, f64
    return %outBuffer, %newSize : memref<?xf64>, index
  }
}

// -----
#map = affine_map<(d0, d1) -> (d0, d1)>
module {
  func.func @sparse_sort_coo_quick(%arg0: index, %arg1: memref<100xindex>, %arg2: memref<?xf32>, %arg3: memref<10xi32>) -> (memref<100xindex>, memref<?xf32>, memref<10xi32>) {
    sparse_tensor.sort quick_sort %arg0, %arg1 jointly %arg2, %arg3 {ny = 1 : index, perm_map = #map} : memref<100xindex> jointly memref<?xf32>, memref<10xi32>
    return %arg1, %arg2, %arg3 : memref<100xindex>, memref<?xf32>, memref<10xi32>
  }
}

// -----
#map = affine_map<(d0, d1) -> (d0, d1)>
module {
  func.func @sparse_sort_coo_hybrid(%arg0: index, %arg1: memref<100xindex>, %arg2: memref<?xf32>, %arg3: memref<10xi32>) -> (memref<100xindex>, memref<?xf32>, memref<10xi32>) {
    sparse_tensor.sort hybrid_quick_sort %arg0, %arg1 jointly %arg2, %arg3 {ny = 1 : index, perm_map = #map} : memref<100xindex> jointly memref<?xf32>, memref<10xi32>
    return %arg1, %arg2, %arg3 : memref<100xindex>, memref<?xf32>, memref<10xi32>
  }
}

// -----
#map = affine_map<(d0, d1) -> (d0, d1)>
module {
  func.func @sparse_sort_coo_stable(%arg0: index, %arg1: memref<100xindex>, %arg2: memref<?xf32>, %arg3: memref<10xi32>) -> (memref<100xindex>, memref<?xf32>, memref<10xi32>) {
    sparse_tensor.sort insertion_sort_stable %arg0, %arg1 jointly %arg2, %arg3 {ny = 1 : index, perm_map = #map} : memref<100xindex> jointly memref<?xf32>, memref<10xi32>
    return %arg1, %arg2, %arg3 : memref<100xindex>, memref<?xf32>, memref<10xi32>
  }
}

// -----
#map = affine_map<(d0, d1) -> (d0, d1)>
module {
  func.func @sparse_sort_coo_heap(%arg0: index, %arg1: memref<100xindex>, %arg2: memref<?xf32>, %arg3: memref<10xi32>) -> (memref<100xindex>, memref<?xf32>, memref<10xi32>) {
    sparse_tensor.sort heap_sort %arg0, %arg1 jointly %arg2, %arg3 {ny = 1 : index, perm_map = #map} : memref<100xindex> jointly memref<?xf32>, memref<10xi32>
    return %arg1, %arg2, %arg3 : memref<100xindex>, memref<?xf32>, memref<10xi32>
  }
}

