#map = affine_map<()[s0] -> (s0)>
#map1 = affine_map<() -> (0)>
module {
  func.func @slicing_memref_store_trivial() {
    %alloc = memref.alloc() : memref<10xf32>
    %c0 = arith.constant 0 : index
    %cst = arith.constant 0.000000e+00 : f32
    affine.for %arg0 = 0 to 10 {
      %0 = affine.apply #map()[%c0]
      memref.store %cst, %alloc[%0] : memref<10xf32>
      %1 = memref.load %alloc[%c0] : memref<10xf32>
      %2 = affine.apply #map1()
      memref.store %cst, %alloc[%2] : memref<10xf32>
      memref.store %1, %alloc[%c0] : memref<10xf32>
    }
    return
  }
}

