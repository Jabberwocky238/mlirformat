#map = affine_map<(d0) -> (d0)>
module {
  gpu.module @kernels {
    gpu.func @foo(%arg0: index, %arg1: memref<?xf32>) -> f32 {
      %0 = affine.apply #map(%arg0)
      %1 = memref.load %arg1[%0] : memref<?xf32>
      gpu.return %1 : f32
    }
  }
}

