#map = affine_map<(d0, d1) -> (d0, d1)>
#map1 = affine_map<(d0, d1) -> (d0)>
module {
  func.func @reduce_2d_f32() {
    %c16 = arith.constant 16 : index
    %c1000 = arith.constant 1000 : index
    %cst = arith.constant 0.000000e+00 : f32
    %0 = bufferization.alloc_tensor(%c16, %c1000) : tensor<?x?xf32>
    %1 = bufferization.alloc_tensor(%c16) : tensor<?xf32>
    %cst_0 = arith.constant 3.141600e+00 : f32
    %2 = linalg.fill ins(%cst_0 : f32) outs(%0 : tensor<?x?xf32>) -> tensor<?x?xf32>
    %3 = linalg.fill ins(%cst : f32) outs(%1 : tensor<?xf32>) -> tensor<?xf32>
    %reduced = linalg.reduce ins(%2 : tensor<?x?xf32>) outs(%3 : tensor<?xf32>) dimensions = [1] 
      (%in: f32, %init: f32) {
        %4 = arith.addf %in, %init : f32
        linalg.yield %4 : f32
      }
    vector.print str "SVE: START OF TEST OUTPUT\0A"
    %cast = tensor.cast %reduced : tensor<?xf32> to tensor<*xf32>
    call @printMemrefF32(%cast) : (tensor<*xf32>) -> ()
    vector.print str "SVE: END OF TEST OUTPUT\0A"
    return
  }
  func.func @generic_reduce_2d_f32() {
    %c16 = arith.constant 16 : index
    %c1000 = arith.constant 1000 : index
    %cst = arith.constant 0.000000e+00 : f32
    %0 = bufferization.alloc_tensor(%c16, %c1000) : tensor<?x?xf32>
    %1 = bufferization.alloc_tensor(%c16) : tensor<?xf32>
    %cst_0 = arith.constant 3.141600e+00 : f32
    %2 = linalg.fill ins(%cst_0 : f32) outs(%0 : tensor<?x?xf32>) -> tensor<?x?xf32>
    %3 = linalg.fill ins(%cst : f32) outs(%1 : tensor<?xf32>) -> tensor<?xf32>
    %4 = linalg.generic {indexing_maps = [#map, #map1], iterator_types = ["parallel", "reduction"]} ins(%2 : tensor<?x?xf32>) outs(%3 : tensor<?xf32>) {
    ^bb0(%in: f32, %out: f32):
      %5 = arith.addf %in, %out : f32
      linalg.yield %5 : f32
    } -> tensor<?xf32>
    vector.print str "SVE: START OF TEST OUTPUT\0A"
    %cast = tensor.cast %4 : tensor<?xf32> to tensor<*xf32>
    call @printMemrefF32(%cast) : (tensor<*xf32>) -> ()
    vector.print str "SVE: END OF TEST OUTPUT\0A"
    return
  }
  func.func @generic_reduce_2d_i32() {
    %c16 = arith.constant 16 : index
    %c1000 = arith.constant 1000 : index
    %c0_i32 = arith.constant 0 : i32
    %0 = bufferization.alloc_tensor(%c16, %c1000) : tensor<?x?xi32>
    %1 = bufferization.alloc_tensor(%c16) : tensor<?xi32>
    %c3_i32 = arith.constant 3 : i32
    %2 = linalg.fill ins(%c3_i32 : i32) outs(%0 : tensor<?x?xi32>) -> tensor<?x?xi32>
    %3 = linalg.fill ins(%c0_i32 : i32) outs(%1 : tensor<?xi32>) -> tensor<?xi32>
    %4 = linalg.generic {indexing_maps = [#map, #map1], iterator_types = ["parallel", "reduction"]} ins(%2 : tensor<?x?xi32>) outs(%3 : tensor<?xi32>) {
    ^bb0(%in: i32, %out: i32):
      %5 = arith.addi %in, %out : i32
      linalg.yield %5 : i32
    } -> tensor<?xi32>
    vector.print str "SVE: START OF TEST OUTPUT\0A"
    %cast = tensor.cast %4 : tensor<?xi32> to tensor<*xi32>
    call @printMemrefI32(%cast) : (tensor<*xi32>) -> ()
    vector.print str "SVE: END OF TEST OUTPUT\0A"
    return
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @tile_and_vectorize_reduce(%arg0: !transform.op<"func.func"> {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.reduce", "linalg.generic"]} in %arg0 : (!transform.op<"func.func">) -> !transform.any_op
      %tiled_linalg_op, %loops:2 = transform.structured.tile_using_for %0 tile_sizes [1, [4]] : (!transform.any_op) -> (!transform.any_op, !transform.any_op, !transform.any_op)
      transform.structured.vectorize %tiled_linalg_op vector_sizes [1, [4]] : !transform.any_op
      transform.apply_patterns to %arg0 {
        transform.apply_patterns.vector.lower_masked_transfers
        transform.apply_patterns.vector.lower_multi_reduction lowering_strategy = innerreduction
      } : !transform.op<"func.func">
      transform.yield 
    }
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["func.func"]} in %arg0 : (!transform.any_op) -> !transform.op<"func.func">
      transform.foreach %0 : !transform.op<"func.func"> {
      ^bb0(%arg1: !transform.op<"func.func">):
        transform.include @tile_and_vectorize_reduce failures(propagate) (%arg1) : (!transform.op<"func.func">) -> ()
      }
      transform.yield 
    }
  }
  func.func private @printMemrefF32(tensor<*xf32>)
  func.func private @printMemrefI32(tensor<*xi32>)
}

