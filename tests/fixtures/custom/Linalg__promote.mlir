module {
  func.func @matmul_f32(%arg0: memref<?xi8>, %arg1: index, %arg2: index, %arg3: index) {
    %c4 = arith.constant 4 : index
    %c3 = arith.constant 3 : index
    %c2 = arith.constant 2 : index
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %view = memref.view %arg0[%c0][%arg1, %arg3] : memref<?xi8> to memref<?x?xf32>
    %view_0 = memref.view %arg0[%c0][%arg3, %arg2] : memref<?xi8> to memref<?x?xf32>
    %view_1 = memref.view %arg0[%c0][%arg1, %arg2] : memref<?xi8> to memref<?x?xf32>
    %dim = memref.dim %view, %c0 : memref<?x?xf32>
    %dim_2 = memref.dim %view, %c1 : memref<?x?xf32>
    %dim_3 = memref.dim %view_0, %c1 : memref<?x?xf32>
    scf.for %arg4 = %c0 to %dim step %c2 {
      scf.for %arg5 = %c0 to %dim_3 step %c3 {
        scf.for %arg6 = %c0 to %dim_2 step %c4 {
          %subview = memref.subview %view[%arg4, %arg6] [%c2, %c4] [1, 1] : memref<?x?xf32> to memref<?x?xf32, strided<[?, 1], offset: ?>>
          %subview_4 = memref.subview %view_0[%arg6, %arg5] [%c4, %c3] [1, 1] : memref<?x?xf32> to memref<?x?xf32, strided<[?, 1], offset: ?>>
          %subview_5 = memref.subview %view_1[%arg4, %arg5] [%c2, %c3] [1, 1] : memref<?x?xf32> to memref<?x?xf32, strided<[?, 1], offset: ?>>
          linalg.matmul ins(%subview, %subview_4 : memref<?x?xf32, strided<[?, 1], offset: ?>>, memref<?x?xf32, strided<[?, 1], offset: ?>>) outs(%subview_5 : memref<?x?xf32, strided<[?, 1], offset: ?>>)
        }
      }
    }
    return
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.matmul"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %1 = transform.structured.promote %0 {use_alloca} : (!transform.any_op) -> !transform.any_op
      transform.yield 
    }
  }
}

// -----
module {
  func.func @matmul_f64(%arg0: memref<?xi8>, %arg1: index, %arg2: index, %arg3: index) {
    %c4 = arith.constant 4 : index
    %c3 = arith.constant 3 : index
    %c2 = arith.constant 2 : index
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %view = memref.view %arg0[%c0][%arg1, %arg3] : memref<?xi8> to memref<?x?xf64>
    %view_0 = memref.view %arg0[%c0][%arg3, %arg2] : memref<?xi8> to memref<?x?xf64>
    %view_1 = memref.view %arg0[%c0][%arg1, %arg2] : memref<?xi8> to memref<?x?xf64>
    %dim = memref.dim %view, %c0 : memref<?x?xf64>
    %dim_2 = memref.dim %view, %c1 : memref<?x?xf64>
    %dim_3 = memref.dim %view_0, %c1 : memref<?x?xf64>
    scf.for %arg4 = %c0 to %dim step %c2 {
      scf.for %arg5 = %c0 to %dim_3 step %c3 {
        scf.for %arg6 = %c0 to %dim_2 step %c4 {
          %subview = memref.subview %view[%arg4, %arg6] [%c2, %c4] [1, 1] : memref<?x?xf64> to memref<?x?xf64, strided<[?, 1], offset: ?>>
          %subview_4 = memref.subview %view_0[%arg6, %arg5] [%c4, %c3] [1, 1] : memref<?x?xf64> to memref<?x?xf64, strided<[?, 1], offset: ?>>
          %subview_5 = memref.subview %view_1[%arg4, %arg5] [%c2, %c3] [1, 1] : memref<?x?xf64> to memref<?x?xf64, strided<[?, 1], offset: ?>>
          linalg.matmul ins(%subview, %subview_4 : memref<?x?xf64, strided<[?, 1], offset: ?>>, memref<?x?xf64, strided<[?, 1], offset: ?>>) outs(%subview_5 : memref<?x?xf64, strided<[?, 1], offset: ?>>)
        }
      }
    }
    return
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.matmul"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %1 = transform.structured.promote %0 : (!transform.any_op) -> !transform.any_op
      transform.yield 
    }
  }
}

// -----
module {
  func.func @gemm_shared(%arg0: memref<?x?xf32>, %arg1: memref<?x?xf32>, %arg2: memref<?x?xf32>) {
    linalg.matmul ins(%arg0, %arg1 : memref<?x?xf32>, memref<?x?xf32>) outs(%arg2 : memref<?x?xf32>)
    return
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.matmul"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %tiled_linalg_op, %loops:3 = transform.structured.tile_using_for %0 tile_sizes [16, 16, 16] : (!transform.any_op) -> (!transform.any_op, !transform.any_op, !transform.any_op, !transform.any_op)
      %1 = transform.structured.promote %tiled_linalg_op {mapping = [#gpu.memory_space<workgroup>], operands_to_promote = [0, 1]} : (!transform.any_op) -> !transform.any_op
      transform.yield 
    }
  }
}

// -----
module {
  func.func @gemm_private(%arg0: memref<?x?xf32>, %arg1: memref<?x?xf32>, %arg2: memref<?x?xf32>) {
    linalg.matmul ins(%arg0, %arg1 : memref<?x?xf32>, memref<?x?xf32>) outs(%arg2 : memref<?x?xf32>)
    return
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.matmul"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %tiled_linalg_op, %loops:3 = transform.structured.tile_using_for %0 tile_sizes [16, 16, 16] : (!transform.any_op) -> (!transform.any_op, !transform.any_op, !transform.any_op, !transform.any_op)
      %1 = transform.structured.promote %tiled_linalg_op {mapping = [#gpu.memory_space<private>], operands_to_promote = [0, 1]} : (!transform.any_op) -> !transform.any_op
      transform.yield 
    }
  }
}

// -----
#map = affine_map<(d0, d1, d2) -> (d0, d2)>
#map1 = affine_map<(d0, d1, d2) -> (d1, d2)>
#map2 = affine_map<(d0, d1, d2) -> (d0, d1)>
module {
  func.func @promote_rank_reducing_subviews(%arg0: memref<?x?x?x64xf32, strided<[?, ?, ?, ?], offset: ?>>, %arg1: memref<128x3x3x64xf32, strided<[?, ?, ?, ?], offset: ?>>, %arg2: memref<?x?x?x128xf32>, %arg3: index, %arg4: index, %arg5: index, %arg6: index, %arg7: index, %arg8: index, %arg9: index, %arg10: index) {
    %subview = memref.subview %arg0[%arg3, 0, %arg4, %arg8] [1, 1, %arg9, 32] [1, 1, 1, 1] : memref<?x?x?x64xf32, strided<[?, ?, ?, ?], offset: ?>> to memref<?x32xf32, strided<[?, ?], offset: ?>>
    %subview_0 = memref.subview %arg1[0, %arg6, %arg7, %arg8] [128, 1, 1, 32] [1, 1, 1, 1] : memref<128x3x3x64xf32, strided<[?, ?, ?, ?], offset: ?>> to memref<128x32xf32, strided<[?, ?], offset: ?>>
    %subview_1 = memref.subview %arg2[%arg3, %arg4, %arg5, 0] [1, 1, %arg10, 128] [1, 1, 1, 1] : memref<?x?x?x128xf32> to memref<?x128xf32, strided<[128, 1], offset: ?>>
    linalg.generic {indexing_maps = [#map, #map1, #map2], iterator_types = ["parallel", "parallel", "reduction"]} ins(%subview, %subview_0 : memref<?x32xf32, strided<[?, ?], offset: ?>>, memref<128x32xf32, strided<[?, ?], offset: ?>>) outs(%subview_1 : memref<?x128xf32, strided<[128, 1], offset: ?>>) {
    ^bb0(%in: f32, %in_2: f32, %out: f32):
      %0 = arith.mulf %in, %in_2 : f32
      %1 = arith.addf %out, %0 : f32
      linalg.yield %1 : f32
    }
    return
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match interface{LinalgOp} in %arg0 : (!transform.any_op) -> !transform.any_op
      %1 = transform.structured.promote %0 : (!transform.any_op) -> !transform.any_op
      transform.yield 
    }
  }
}

// -----
#map = affine_map<(d0, d1) -> (d0, d1)>
module {
  func.func @linalg_generic_update_all_function_inputs_outputs(%arg0: memref<8x4xf32, 1>, %arg1: memref<8x4xf32, 1>) -> memref<8x4xf32, 1> {
    %alloc = memref.alloc() {alignment = 64 : i64} : memref<8x4xf32, 1>
    %subview = memref.subview %arg0[0, 0] [4, 3] [1, 1] : memref<8x4xf32, 1> to memref<4x3xf32, strided<[4, 1]>, 1>
    %subview_0 = memref.subview %arg1[0, 0] [4, 3] [1, 1] : memref<8x4xf32, 1> to memref<4x3xf32, strided<[4, 1]>, 1>
    %subview_1 = memref.subview %alloc[0, 0] [4, 3] [1, 1] : memref<8x4xf32, 1> to memref<4x3xf32, strided<[4, 1]>, 1>
    linalg.generic {doc = "", indexing_maps = [#map, #map, #map], iterator_types = ["parallel", "parallel"], library_call = ""} ins(%subview, %subview_0 : memref<4x3xf32, strided<[4, 1]>, 1>, memref<4x3xf32, strided<[4, 1]>, 1>) outs(%subview_1 : memref<4x3xf32, strided<[4, 1]>, 1>) {
    ^bb0(%in: f32, %in_2: f32, %out: f32):
      %0 = arith.addf %in, %in_2 : f32
      linalg.yield %0 : f32
    }
    return %alloc : memref<8x4xf32, 1>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.generic"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %1 = transform.structured.promote %0 {memory_space = #gpu.address_space<workgroup>} : (!transform.any_op) -> !transform.any_op
      transform.yield 
    }
  }
}

