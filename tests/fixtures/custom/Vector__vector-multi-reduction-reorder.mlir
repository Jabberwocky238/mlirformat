module {
  func.func @inner_reduction_to_inner_parallel(%arg0: vector<3x2x4xf32>, %arg1: vector<2x4xf32>) -> vector<2x4xf32> {
    %0 = vector.multi_reduction <mul>, %arg0, %arg1 [0] : vector<3x2x4xf32> to vector<2x4xf32>
    return %0 : vector<2x4xf32>
  }
  func.func @inner_parallel_to_inner_reduction(%arg0: vector<3x2x4xf32>, %arg1: vector<3x2xf32>) -> vector<3x2xf32> {
    %0 = vector.multi_reduction <mul>, %arg0, %arg1 [2] : vector<3x2x4xf32> to vector<3x2xf32>
    return %0 : vector<3x2xf32>
  }
  func.func @transpose_parallel_middle(%arg0: vector<3x4x5xf32>, %arg1: vector<4xf32>) -> vector<4xf32> {
    %0 = vector.multi_reduction <add>, %arg0, %arg1 [0, 2] : vector<3x4x5xf32> to vector<4xf32>
    return %0 : vector<4xf32>
  }
  func.func @negative_one_dim(%arg0: vector<8xf32>, %arg1: f32) -> f32 {
    %0 = vector.multi_reduction <add>, %arg0, %arg1 [0] : vector<8xf32> to f32
    return %0 : f32
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @innerreduction(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["func.func"]} in %arg0 : (!transform.any_op) -> !transform.op<"func.func">
      transform.apply_patterns to %0 {
        transform.apply_patterns.vector.reorder_multi_reduction_dims lowering_strategy = innerreduction
      } : !transform.op<"func.func">
      transform.yield 
    }
    transform.named_sequence @innerparallel(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["func.func"]} in %arg0 : (!transform.any_op) -> !transform.op<"func.func">
      transform.apply_patterns to %0 {
        transform.apply_patterns.vector.reorder_multi_reduction_dims
      } : !transform.op<"func.func">
      transform.yield 
    }
  }
}

