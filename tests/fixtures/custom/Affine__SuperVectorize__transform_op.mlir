module {
  func.func @vec1d_3(%arg0: memref<?x?xf32>, %arg1: memref<?x?x?xf32>) {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %c2 = arith.constant 2 : index
    %dim = memref.dim %arg0, %c0 : memref<?x?xf32>
    %dim_0 = memref.dim %arg0, %c1 : memref<?x?xf32>
    %dim_1 = memref.dim %arg1, %c2 : memref<?x?x?xf32>
    affine.for %arg2 = 0 to %dim {
      affine.for %arg3 = 0 to %dim_0 {
        %0 = affine.load %arg0[%arg3, %arg3 + %arg2] : memref<?x?xf32>
      }
    }
    return
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["affine.for"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      transform.affine.super_vectorize %0 [128] : !transform.any_op
      transform.yield 
    }
  }
}

// -----
#map = affine_map<(d0) -> (d0)>
module {
  func.func @vectorize_matmul(%arg0: memref<?x?xf32>, %arg1: memref<?x?xf32>, %arg2: memref<?x?xf32>) {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %dim = memref.dim %arg0, %c0 : memref<?x?xf32>
    %dim_0 = memref.dim %arg0, %c1 : memref<?x?xf32>
    %dim_1 = memref.dim %arg2, %c1 : memref<?x?xf32>
    affine.for %arg3 = #map(%c0) to #map(%dim) {
      affine.for %arg4 = #map(%c0) to #map(%dim_1) {
        %cst = arith.constant 0.000000e+00 : f32
        affine.store %cst, %arg2[%arg3, %arg4] : memref<?x?xf32>
      }
    }
    affine.for %arg3 = #map(%c0) to #map(%dim) {
      affine.for %arg4 = #map(%c0) to #map(%dim_1) {
        affine.for %arg5 = #map(%c0) to #map(%dim_0) {
          %0 = affine.load %arg1[%arg5, %arg4] : memref<?x?xf32>
          %1 = affine.load %arg0[%arg3, %arg5] : memref<?x?xf32>
          %2 = arith.mulf %1, %0 : f32
          %3 = affine.load %arg2[%arg3, %arg4] : memref<?x?xf32>
          %4 = arith.addf %3, %2 : f32
          affine.store %4, %arg2[%arg3, %arg4] : memref<?x?xf32>
        }
      }
    }
    return
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["affine.for"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      transform.affine.super_vectorize %0 [4, 8] : !transform.any_op
      transform.yield 
    }
  }
}

// -----
module {
  func.func @vec3d(%arg0: memref<?x?x?xf32>) {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %c2 = arith.constant 2 : index
    %dim = memref.dim %arg0, %c0 : memref<?x?x?xf32>
    %dim_0 = memref.dim %arg0, %c1 : memref<?x?x?xf32>
    %dim_1 = memref.dim %arg0, %c2 : memref<?x?x?xf32>
    affine.for %arg1 = 0 to %dim {
      affine.for %arg2 = 0 to %dim {
        affine.for %arg3 = 0 to %dim {
          affine.for %arg4 = 0 to %dim_0 {
            affine.for %arg5 = 0 to %dim_1 {
              %0 = affine.load %arg0[%arg3, %arg4, %arg5] : memref<?x?x?xf32>
            }
          }
        }
      }
    }
    return
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["affine.for"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      transform.affine.super_vectorize %0 [32, 64, 256] fastest_varying_pattern = [2, 1, 0] : !transform.any_op
      transform.yield 
    }
  }
}

// -----
module {
  func.func @vecdim_reduction_minf(%arg0: memref<256x512xf32>, %arg1: memref<256xf32>) {
    %cst = arith.constant 0x7F800000 : f32
    affine.for %arg2 = 0 to 256 {
      %0 = affine.for %arg3 = 0 to 512 iter_args(%arg4 = %cst) -> (f32) {
        %1 = affine.load %arg0[%arg2, %arg3] : memref<256x512xf32>
        %2 = arith.minimumf %arg4, %1 : f32
        affine.yield %2 : f32
      }
      affine.store %0, %arg1[%arg2] : memref<256xf32>
    }
    return
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["affine.for"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      transform.affine.super_vectorize %0 [128] vectorize_reductions = true : !transform.any_op
      transform.yield 
    }
  }
}

