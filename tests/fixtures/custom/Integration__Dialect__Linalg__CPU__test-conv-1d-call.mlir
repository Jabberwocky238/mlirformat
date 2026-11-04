module {
  func.func private @printMemrefF32(memref<*xf32>)
  func.func @alloc_1d_filled_f32(%arg0: index, %arg1: f32) -> memref<?xf32> {
    %alloc = memref.alloc(%arg0) : memref<?xf32>
    linalg.fill ins(%arg1 : f32) outs(%alloc : memref<?xf32>)
    return %alloc : memref<?xf32>
  }
  func.func @conv_1d(%arg0: memref<?xf32>, %arg1: memref<?xf32>, %arg2: memref<?xf32>) {
    linalg.conv_1d ins(%arg0, %arg1 : memref<?xf32>, memref<?xf32>) outs(%arg2 : memref<?xf32>)
    return
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.conv_1d"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %tiled_linalg_op, %loops = transform.structured.tile_using_for %0 tile_sizes [4] : (!transform.any_op) -> (!transform.any_op, !transform.any_op)
      transform.yield 
    }
  }
  func.func @main() {
    %c3 = arith.constant 3 : index
    %c6 = arith.constant 6 : index
    %c8 = arith.constant 8 : index
    %cst = arith.constant 1.000000e+01 : f32
    %cst_0 = arith.constant 2.000000e+00 : f32
    %cst_1 = arith.constant 0.000000e+00 : f32
    %0 = call @alloc_1d_filled_f32(%c3, %cst_0) : (index, f32) -> memref<?xf32>
    %1 = call @alloc_1d_filled_f32(%c8, %cst_0) : (index, f32) -> memref<?xf32>
    %2 = call @alloc_1d_filled_f32(%c6, %cst_1) : (index, f32) -> memref<?xf32>
    memref.store %cst, %1[%c3] : memref<?xf32>
    call @conv_1d(%1, %0, %2) : (memref<?xf32>, memref<?xf32>, memref<?xf32>) -> ()
    %cast = memref.cast %2 : memref<?xf32> to memref<*xf32>
    call @printMemrefF32(%cast) : (memref<*xf32>) -> ()
    memref.dealloc %0 : memref<?xf32>
    memref.dealloc %1 : memref<?xf32>
    memref.dealloc %2 : memref<?xf32>
    return
  }
}

