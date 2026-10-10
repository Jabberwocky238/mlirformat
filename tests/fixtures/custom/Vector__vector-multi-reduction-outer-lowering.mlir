module {
  func.func @vector_multi_reduction(%arg0: vector<2x4xf32>, %arg1: vector<2xf32>) -> vector<2xf32> {
    %0 = vector.multi_reduction <mul>, %arg0, %arg1 [1] : vector<2x4xf32> to vector<2xf32>
    return %0 : vector<2xf32>
  }
  func.func @vector_multi_reduction_min(%arg0: vector<2x4xf32>, %arg1: vector<2xf32>) -> vector<2xf32> {
    %0 = vector.multi_reduction <minnumf>, %arg0, %arg1 [1] : vector<2x4xf32> to vector<2xf32>
    return %0 : vector<2xf32>
  }
  func.func @vector_multi_reduction_max(%arg0: vector<2x4xf32>, %arg1: vector<2xf32>) -> vector<2xf32> {
    %0 = vector.multi_reduction <maxnumf>, %arg0, %arg1 [1] : vector<2x4xf32> to vector<2xf32>
    return %0 : vector<2xf32>
  }
  func.func @vector_multi_reduction_and(%arg0: vector<2x4xi32>, %arg1: vector<2xi32>) -> vector<2xi32> {
    %0 = vector.multi_reduction <and>, %arg0, %arg1 [1] : vector<2x4xi32> to vector<2xi32>
    return %0 : vector<2xi32>
  }
  func.func @vector_multi_reduction_or(%arg0: vector<2x4xi32>, %arg1: vector<2xi32>) -> vector<2xi32> {
    %0 = vector.multi_reduction <or>, %arg0, %arg1 [1] : vector<2x4xi32> to vector<2xi32>
    return %0 : vector<2xi32>
  }
  func.func @vector_multi_reduction_xor(%arg0: vector<2x4xi32>, %arg1: vector<2xi32>) -> vector<2xi32> {
    %0 = vector.multi_reduction <xor>, %arg0, %arg1 [1] : vector<2x4xi32> to vector<2xi32>
    return %0 : vector<2xi32>
  }
  func.func @vector_reduction_outer(%arg0: vector<2x3x4x5xi32>, %arg1: vector<2x3xi32>) -> vector<2x3xi32> {
    %0 = vector.multi_reduction <add>, %arg0, %arg1 [2, 3] : vector<2x3x4x5xi32> to vector<2x3xi32>
    return %0 : vector<2x3xi32>
  }
  func.func @vector_multi_reduction_parallel_middle(%arg0: vector<3x4x5xf32>, %arg1: vector<4xf32>) -> vector<4xf32> {
    %0 = vector.multi_reduction <add>, %arg0, %arg1 [0, 2] : vector<3x4x5xf32> to vector<4xf32>
    return %0 : vector<4xf32>
  }
  func.func @vector_reduction_1D(%arg0: vector<2xf32>, %arg1: f32) -> f32 {
    %0 = vector.multi_reduction <maxnumf>, %arg0, %arg1 [0] : vector<2xf32> to f32
    return %0 : f32
  }
  func.func @vector_multi_reduction_to_scalar(%arg0: vector<2x3xf32>, %arg1: f32) -> f32 {
    %0 = vector.multi_reduction <add>, %arg0, %arg1 [0, 1] : vector<2x3xf32> to f32
    return %0 : f32
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["func.func"]} in %arg0 : (!transform.any_op) -> !transform.op<"func.func">
      transform.apply_patterns to %0 {
        transform.apply_patterns.vector.lower_multi_reduction
      } : !transform.op<"func.func">
      transform.yield 
    }
  }
}

