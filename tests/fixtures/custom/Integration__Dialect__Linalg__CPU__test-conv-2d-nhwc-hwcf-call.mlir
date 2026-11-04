module {
  func.func private @printMemrefF32(memref<*xf32>)
  func.func @alloc_4d_filled_f32(%arg0: index, %arg1: index, %arg2: index, %arg3: index, %arg4: f32) -> memref<?x?x?x?xf32> {
    %alloc = memref.alloc(%arg0, %arg1, %arg2, %arg3) : memref<?x?x?x?xf32>
    linalg.fill ins(%arg4 : f32) outs(%alloc : memref<?x?x?x?xf32>)
    return %alloc : memref<?x?x?x?xf32>
  }
  func.func @conv_2d_nhwc_hwcf(%arg0: memref<?x?x?x?xf32>, %arg1: memref<?x?x?x?xf32>, %arg2: memref<?x?x?x?xf32>) {
    linalg.conv_2d_nhwc_hwcf {dilations = dense<1> : tensor<2xi64>, strides = dense<1> : tensor<2xi64>} ins(%arg0, %arg1 : memref<?x?x?x?xf32>, memref<?x?x?x?xf32>) outs(%arg2 : memref<?x?x?x?xf32>)
    return
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.conv_2d_nhwc_hwcf"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %tiled_linalg_op, %loops:4 = transform.structured.tile_using_for %0 tile_sizes [2, 3, 3, 2] : (!transform.any_op) -> (!transform.any_op, !transform.any_op, !transform.any_op, !transform.any_op, !transform.any_op)
      transform.yield 
    }
  }
  func.func @main() {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %c3 = arith.constant 3 : index
    %c6 = arith.constant 6 : index
    %c8 = arith.constant 8 : index
    %cst = arith.constant 1.000000e+01 : f32
    %cst_0 = arith.constant 2.000000e+00 : f32
    %cst_1 = arith.constant 0.000000e+00 : f32
    %0 = call @alloc_4d_filled_f32(%c3, %c3, %c3, %c1, %cst_0) : (index, index, index, index, f32) -> memref<?x?x?x?xf32>
    %1 = call @alloc_4d_filled_f32(%c3, %c8, %c8, %c3, %cst_0) : (index, index, index, index, f32) -> memref<?x?x?x?xf32>
    %2 = call @alloc_4d_filled_f32(%c3, %c6, %c6, %c1, %cst_1) : (index, index, index, index, f32) -> memref<?x?x?x?xf32>
    memref.store %cst, %1[%c0, %c0, %c3, %c0] : memref<?x?x?x?xf32>
    call @conv_2d_nhwc_hwcf(%1, %0, %2) : (memref<?x?x?x?xf32>, memref<?x?x?x?xf32>, memref<?x?x?x?xf32>) -> ()
    %cast = memref.cast %2 : memref<?x?x?x?xf32> to memref<*xf32>
    call @printMemrefF32(%cast) : (memref<*xf32>) -> ()
    memref.dealloc %0 : memref<?x?x?x?xf32>
    memref.dealloc %1 : memref<?x?x?x?xf32>
    memref.dealloc %2 : memref<?x?x?x?xf32>
    return
  }
}

