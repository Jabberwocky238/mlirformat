module {
  func.func @one_dim_reduction(%arg0: vector<8xf32>, %arg1: f32) -> f32 {
    %0 = vector.multi_reduction <add>, %arg0, %arg1 [0] : vector<8xf32> to f32
    return %0 : f32
  }
  func.func @one_dim_reduction_masked(%arg0: vector<8xf32>, %arg1: f32, %arg2: vector<8xi1>) -> f32 {
    %0 = vector.mask %arg2 { vector.multi_reduction <add>, %arg0, %arg1 [0] : vector<8xf32> to f32 } : vector<8xi1> -> f32
    return %0 : f32
  }
  func.func @negative_rank3(%arg0: vector<2x3x4xf32>, %arg1: vector<2x3xf32>) -> vector<2x3xf32> {
    %0 = vector.multi_reduction <add>, %arg0, %arg1 [2] : vector<2x3x4xf32> to vector<2x3xf32>
    return %0 : vector<2x3xf32>
  }
  func.func @inner_reduction_2d(%arg0: vector<2x4xf32>, %arg1: vector<2xf32>) -> vector<2xf32> {
    %0 = vector.multi_reduction <mul>, %arg0, %arg1 [1] : vector<2x4xf32> to vector<2xf32>
    return %0 : vector<2xf32>
  }
  func.func @inner_reduction_2d_scalable(%arg0: vector<2x[4]xf32>, %arg1: vector<2xf32>, %arg2: vector<2x[4]xi1>) -> vector<2xf32> {
    %0 = vector.mask %arg2 { vector.multi_reduction <add>, %arg0, %arg1 [1] : vector<2x[4]xf32> to vector<2xf32> } : vector<2x[4]xi1> -> vector<2xf32>
    return %0 : vector<2xf32>
  }
  func.func @inner_parallel_2d(%arg0: vector<4x2xf32>, %arg1: vector<2xf32>) -> vector<2xf32> {
    %0 = vector.multi_reduction <mul>, %arg0, %arg1 [0] : vector<4x2xf32> to vector<2xf32>
    return %0 : vector<2xf32>
  }
  func.func @inner_parallel_2d_masked(%arg0: vector<4x2xf32>, %arg1: vector<2xf32>, %arg2: vector<4x2xi1>) -> vector<2xf32> {
    %0 = vector.mask %arg2 { vector.multi_reduction <mul>, %arg0, %arg1 [0] : vector<4x2xf32> to vector<2xf32> } : vector<4x2xi1> -> vector<2xf32>
    return %0 : vector<2xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @innerreduction(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["func.func"]} in %arg0 : (!transform.any_op) -> !transform.op<"func.func">
      transform.apply_patterns to %0 {
        transform.apply_patterns.vector.multi_reduction_unrolling lowering_strategy = innerreduction
      } : !transform.op<"func.func">
      transform.yield 
    }
    transform.named_sequence @innerparallel(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["func.func"]} in %arg0 : (!transform.any_op) -> !transform.op<"func.func">
      transform.apply_patterns to %0 {
        transform.apply_patterns.vector.multi_reduction_unrolling
      } : !transform.op<"func.func">
      transform.yield 
    }
  }
}

