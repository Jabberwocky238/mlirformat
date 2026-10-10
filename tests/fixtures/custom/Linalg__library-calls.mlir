module {
  func.func private @printMemrefF32(memref<*xf32>)
  func.func @matmul(%arg0: memref<?x?xf32>, %arg1: memref<?x?xf32>) -> memref<?x?xf32> {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %cst = arith.constant 0.000000e+00 : f32
    %dim = memref.dim %arg0, %c0 : memref<?x?xf32>
    %dim_0 = memref.dim %arg1, %c1 : memref<?x?xf32>
    %alloc = memref.alloc(%dim, %dim_0) : memref<?x?xf32>
    linalg.fill ins(%cst : f32) outs(%alloc : memref<?x?xf32>)
    linalg.matmul ins(%arg0, %arg1 : memref<?x?xf32>, memref<?x?xf32>) outs(%alloc : memref<?x?xf32>)
    return %alloc : memref<?x?xf32>
  }
}

// -----
#map = affine_map<(d0) -> (d0)>
module {
  func.func @helper(%arg0: memref<32xf16, 1>, %arg1: memref<32xf16, 1>, %arg2: memref<32xf16, 1>) {
    %alloca = memref.alloca() : memref<32xf16, 6>
    %alloca_0 = memref.alloca() : memref<32xf16, 6>
    %alloca_1 = memref.alloca() : memref<32xf16, 6>
    linalg.copy ins(%arg1 : memref<32xf16, 1>) outs(%alloca : memref<32xf16, 6>)
    linalg.copy ins(%arg2 : memref<32xf16, 1>) outs(%alloca_0 : memref<32xf16, 6>)
    linalg.generic {doc = "...", indexing_maps = [#map, #map, #map], iterator_types = ["parallel"], library_call = "test"} ins(%alloca, %alloca_0 : memref<32xf16, 6>, memref<32xf16, 6>) outs(%alloca_1 : memref<32xf16, 6>) {
    ^bb0(%in: f16, %in_2: f16, %out: f16):
      %0 = arith.addf %in_2, %in : f16
      linalg.yield %0 : f16
    }
    linalg.copy ins(%alloca_1 : memref<32xf16, 6>) outs(%arg0 : memref<32xf16, 1>)
    return
  }
}

