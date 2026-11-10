#map = affine_map<(d0) -> (d0)>
#map1 = affine_map<(d0) -> ()>
module {
  func.func @reduce_1d_f32() {
    %c1000 = arith.constant 1000 : index
    %cst = arith.constant 0.000000e+00 : f32
    %0 = bufferization.alloc_tensor(%c1000) : tensor<?xf32>
    %1 = bufferization.alloc_tensor() : tensor<f32>
    %cst_0 = arith.constant 3.141600e+00 : f32
    %2 = linalg.fill ins(%cst_0 : f32) outs(%0 : tensor<?xf32>) -> tensor<?xf32>
    %inserted = tensor.insert %cst into %1[] : tensor<f32>
    %reduced = linalg.reduce ins(%2 : tensor<?xf32>) outs(%inserted : tensor<f32>) dimensions = [0] 
      (%in: f32, %init: f32) {
        %3 = arith.addf %in, %init : f32
        linalg.yield %3 : f32
      }
    vector.print str "SVE: START OF TEST OUTPUT\0A"
    %cast = tensor.cast %reduced : tensor<f32> to tensor<*xf32>
    call @printMemrefF32(%cast) : (tensor<*xf32>) -> ()
    vector.print str "SVE: END OF TEST OUTPUT\0A"
    return
  }
  func.func @reduce_1d_i32() {
    %c1000 = arith.constant 1000 : index
    %c0_i32 = arith.constant 0 : i32
    %0 = bufferization.alloc_tensor(%c1000) : tensor<?xi32>
    %1 = bufferization.alloc_tensor() : tensor<i32>
    %c3_i32 = arith.constant 3 : i32
    %2 = linalg.fill ins(%c3_i32 : i32) outs(%0 : tensor<?xi32>) -> tensor<?xi32>
    %inserted = tensor.insert %c0_i32 into %1[] : tensor<i32>
    %reduced = linalg.reduce ins(%2 : tensor<?xi32>) outs(%inserted : tensor<i32>) dimensions = [0] 
      (%in: i32, %init: i32) {
        %3 = arith.addi %in, %init : i32
        linalg.yield %3 : i32
      }
    vector.print str "SVE: START OF TEST OUTPUT\0A"
    %cast = tensor.cast %reduced : tensor<i32> to tensor<*xi32>
    call @printMemrefI32(%cast) : (tensor<*xi32>) -> ()
    vector.print str "SVE: END OF TEST OUTPUT\0A"
    return
  }
  func.func @generic_reduce_1d_f32() {
    %c1000 = arith.constant 1000 : index
    %cst = arith.constant 0.000000e+00 : f32
    %0 = bufferization.alloc_tensor(%c1000) : tensor<?xf32>
    %1 = bufferization.alloc_tensor() : tensor<f32>
    %cst_0 = arith.constant 3.141600e+00 : f32
    %2 = linalg.fill ins(%cst_0 : f32) outs(%0 : tensor<?xf32>) -> tensor<?xf32>
    %inserted = tensor.insert %cst into %1[] : tensor<f32>
    %3 = linalg.generic {indexing_maps = [#map, #map1], iterator_types = ["reduction"]} ins(%2 : tensor<?xf32>) outs(%inserted : tensor<f32>) {
    ^bb0(%in: f32, %out: f32):
      %4 = arith.addf %in, %out : f32
      linalg.yield %4 : f32
    } -> tensor<f32>
    vector.print str "SVE: START OF TEST OUTPUT\0A"
    %cast = tensor.cast %3 : tensor<f32> to tensor<*xf32>
    call @printMemrefF32(%cast) : (tensor<*xf32>) -> ()
    vector.print str "SVE: END OF TEST OUTPUT\0A"
    return
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @tile_and_vectorize_reduce(%arg0: !transform.op<"func.func"> {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.reduce", "linalg.generic"]} in %arg0 : (!transform.op<"func.func">) -> !transform.any_op
      %tiled_linalg_op, %loops = transform.structured.tile_using_for %0 tile_sizes [[4]] : (!transform.any_op) -> (!transform.any_op, !transform.any_op)
      transform.structured.vectorize %tiled_linalg_op vector_sizes [[4]] : !transform.any_op
      transform.apply_patterns to %arg0 {
        transform.apply_patterns.vector.lower_masked_transfers
        transform.apply_patterns.vector.reorder_multi_reduction_dims lowering_strategy = innerreduction
        transform.apply_patterns.vector.multi_reduction_flattening lowering_strategy = innerreduction
        transform.apply_patterns.vector.multi_reduction_unrolling lowering_strategy = innerreduction
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

