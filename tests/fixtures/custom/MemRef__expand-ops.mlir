module {
  func.func @atomic_rmw_no_conversion(%arg0: memref<10xf32>, %arg1: f32, %arg2: index) -> (f32, f32) {
    %0 = memref.atomic_rmw addf %arg1, %arg0[%arg2] : (f32, memref<10xf32>) -> f32
    %1 = memref.atomic_rmw maximumf %arg1, %arg0[%arg2] : (f32, memref<10xf32>) -> f32
    return %0, %1 : f32, f32
  }
}

// -----
module {
  func.func @memref_reshape(%arg0: memref<*xf32>, %arg1: memref<3xi32>) -> memref<?x?x8xf32> {
    %reshape = memref.reshape %arg0(%arg1) : (memref<*xf32>, memref<3xi32>) -> memref<?x?x8xf32>
    return %reshape : memref<?x?x8xf32>
  }
}

