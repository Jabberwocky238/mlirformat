module {
  func.func @negative_flattening_cases(%arg0: vector<8xf32>, %arg1: vector<4x8xf32>, %arg2: vector<[2]x[4]x8xf32>, %arg3: vector<2x3x4x5xi32>, %arg4: f32, %arg5: vector<8xf32>, %arg6: vector<2x4xi32>) -> (f32, vector<8xf32>, vector<8xf32>, vector<2x4xi32>) {
    %0 = vector.multi_reduction <add>, %arg0, %arg4 [0] : vector<8xf32> to f32
    %1 = vector.multi_reduction <mul>, %arg2, %arg5 [0, 1] : vector<[2]x[4]x8xf32> to vector<8xf32>
    %2 = vector.multi_reduction <add>, %arg1, %arg5 [0] : vector<4x8xf32> to vector<8xf32>
    %3 = vector.multi_reduction <add>, %arg3, %arg6 [1, 3] : vector<2x3x4x5xi32> to vector<2x4xi32>
    return %0, %1, %2, %3 : f32, vector<8xf32>, vector<8xf32>, vector<2x4xi32>
  }
  func.func @vector_multi_reduction_flattening(%arg0: vector<2x4xf32>, %arg1: f32) -> f32 {
    %0 = vector.multi_reduction <mul>, %arg0, %arg1 [0, 1] : vector<2x4xf32> to f32
    return %0 : f32
  }
  func.func @vector_multi_reduction_parallel_dim_innerreduction(%arg0: vector<2x3x4xi32>, %arg1: vector<2xi32>) -> vector<2xi32> {
    %0 = vector.multi_reduction <add>, %arg0, %arg1 [1, 2] : vector<2x3x4xi32> to vector<2xi32>
    return %0 : vector<2xi32>
  }
  func.func @output_shapecast_multiple_parallel(%arg0: vector<2x3x4x5x6xi32>, %arg1: vector<2x3x4xi32>) -> vector<2x3x4xi32> {
    %0 = vector.multi_reduction <mul>, %arg0, %arg1 [3, 4] : vector<2x3x4x5x6xi32> to vector<2x3x4xi32>
    return %0 : vector<2x3x4xi32>
  }
  func.func @vector_multi_reduction_parallel_dim_innerparallel(%arg0: vector<3x4x2xi32>, %arg1: vector<2xi32>) -> vector<2xi32> {
    %0 = vector.multi_reduction <mul>, %arg0, %arg1 [0, 1] : vector<3x4x2xi32> to vector<2xi32>
    return %0 : vector<2xi32>
  }
  func.func @single_scalable_dim(%arg0: vector<4x[8]xf32>, %arg1: f32) -> f32 {
    %0 = vector.multi_reduction <add>, %arg0, %arg1 [0, 1] : vector<4x[8]xf32> to f32
    return %0 : f32
  }
  func.func @masked_multi_reduction(%arg0: vector<2x4xf32>, %arg1: f32, %arg2: vector<2x4xi1>) -> f32 {
    %0 = vector.mask %arg2 { vector.multi_reduction <mul>, %arg0, %arg1 [0, 1] : vector<2x4xf32> to f32 } : vector<2x4xi1> -> f32
    return %0 : f32
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @innerreduction(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["func.func"]} in %arg0 : (!transform.any_op) -> !transform.op<"func.func">
      transform.apply_patterns to %0 {
        transform.apply_patterns.vector.multi_reduction_flattening lowering_strategy = innerreduction
      } : !transform.op<"func.func">
      transform.yield 
    }
    transform.named_sequence @innerparallel(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["func.func"]} in %arg0 : (!transform.any_op) -> !transform.op<"func.func">
      transform.apply_patterns to %0 {
        transform.apply_patterns.vector.multi_reduction_flattening
      } : !transform.op<"func.func">
      transform.yield 
    }
  }
}

