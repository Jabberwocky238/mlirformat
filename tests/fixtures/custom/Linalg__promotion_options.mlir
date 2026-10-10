module {
  func.func @gemm(%arg0: memref<?x?xf32>, %arg1: memref<?x?xf32>, %arg2: memref<?x?xf32>) {
    linalg.matmul ins(%arg0, %arg1 : memref<?x?xf32>, memref<?x?xf32>) outs(%arg2 : memref<?x?xf32>)
    return
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.matmul"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %tiled_linalg_op, %loops:3 = transform.structured.tile_using_for %0 tile_sizes [16, 16, 16] : (!transform.any_op) -> (!transform.any_op, !transform.any_op, !transform.any_op, !transform.any_op)
      %1 = transform.structured.promote %tiled_linalg_op {force_full_tiles = [false, false], operands_to_promote = [0, 2], use_full_tiles_by_default} : (!transform.any_op) -> !transform.any_op
      transform.yield 
    }
  }
}

// -----
#map = affine_map<(d0)[s0] -> (-d0 + 512, s0)>
#map1 = affine_map<(d0)[s0] -> (-d0 + 256, s0)>
module {
  func.func @matmul_f32(%arg0: memref<512x256xf32>, %arg1: memref<256x512xf32>, %arg2: memref<256x256xf32>, %arg3: index, %arg4: index, %arg5: index) {
    %c0 = arith.constant 0 : index
    %c256 = arith.constant 256 : index
    %c512 = arith.constant 512 : index
    scf.for %arg6 = %c0 to %c512 step %arg3 {
      scf.for %arg7 = %c0 to %c512 step %arg4 {
        scf.for %arg8 = %c0 to %c256 step %arg5 {
          %0 = affine.min #map(%arg6)[%arg3]
          %1 = affine.min #map(%arg7)[%arg4]
          %2 = affine.min #map1(%arg8)[%arg5]
          %subview = memref.subview %arg0[%arg6, %arg8] [%0, %2] [1, 1] : memref<512x256xf32> to memref<?x?xf32, strided<[256, 1], offset: ?>>
          %subview_0 = memref.subview %arg1[%arg8, %arg7] [%2, %1] [1, 1] : memref<256x512xf32> to memref<?x?xf32, strided<[512, 1], offset: ?>>
          %subview_1 = memref.subview %arg2[%arg6, %arg7] [%0, %1] [1, 1] : memref<256x256xf32> to memref<?x?xf32, strided<[256, 1], offset: ?>>
          linalg.matmul ins(%subview, %subview_0 : memref<?x?xf32, strided<[256, 1], offset: ?>>, memref<?x?xf32, strided<[512, 1], offset: ?>>) outs(%subview_1 : memref<?x?xf32, strided<[256, 1], offset: ?>>)
        }
      }
    }
    return
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.matmul"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %1 = transform.structured.promote %0 {use_original_subview_size} : (!transform.any_op) -> !transform.any_op
      transform.yield 
    }
  }
}

