module {
  func.func @main() {
    %0 = tensor.empty() : tensor<7x3xi32>
    %cst = arith.constant dense<[[[[1], [2], [3], [4], [5], [6], [7], [123]], [[8], [9], [10], [11], [12], [13], [14], [123]], [[15], [16], [17], [18], [19], [20], [21], [123]]]]> : tensor<1x3x8x1xi32>
    %cast = tensor.cast %cst : tensor<1x3x8x1xi32> to tensor<?x3x?x1xi32>
    call @unpack(%cast) : (tensor<?x3x?x1xi32>) -> ()
    return
  }
  func.func private @unpack(%arg0: tensor<?x3x?x1xi32>) {
    %c1 = arith.constant 1 : index
    %c123_i32 = arith.constant 123 : i32
    %c8 = arith.constant 8 : index
    %0 = tensor.empty() : tensor<7x3xi32>
    %unpack = linalg.unpack %arg0 inner_dims_pos = [0, 1] inner_tiles = [%c8, 1] into %0 : tensor<?x3x?x1xi32> -> tensor<7x3xi32>
    %cast = tensor.cast %unpack : tensor<7x3xi32> to tensor<*xi32>
    call @printMemrefI32(%cast) : (tensor<*xi32>) -> ()
    return
  }
  module @transforms attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.consume}) {
      %0 = transform.structured.match ops{["linalg.unpack"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %1 = transform.param.constant 8 : i64 -> !transform.param<i64>
      %tiled_linalg_op, %loops:2 = transform.structured.tile_using_for %0 tile_sizes [%1, 1] : (!transform.any_op, !transform.param<i64>) -> (!transform.any_op, !transform.any_op, !transform.any_op)
      %2 = transform.get_parent_op %tiled_linalg_op {isolated_from_above} : (!transform.any_op) -> !transform.op<"func.func">
      transform.apply_patterns to %2 {
        transform.apply_patterns.linalg.decompose_pack_unpack
        transform.apply_patterns.canonicalization
      } : !transform.op<"func.func">
      %3 = transform.structured.match ops{["tensor.insert_slice"]} in %2 : (!transform.op<"func.func">) -> !transform.any_op
      transform.structured.vectorize %3 vector_sizes [8, 1] : !transform.any_op
      %4 = transform.bufferization.one_shot_bufferize %arg0 {bufferize_function_boundaries = true} : (!transform.any_op) -> !transform.any_op
      %5 = transform.structured.match ops{["func.func"]} in %4 : (!transform.any_op) -> !transform.op<"func.func">
      transform.apply_patterns to %5 {
        transform.apply_patterns.canonicalization
      } : !transform.op<"func.func">
      transform.yield 
    }
  }
  func.func private @printMemrefI32(tensor<*xi32>)
}

