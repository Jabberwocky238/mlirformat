module {
  func.func @fixed_width(%arg0: vector<2x4xf32>) -> vector<2x4xf32> {
    %0 = vector.shape_cast %arg0 : vector<2x4xf32> to vector<8xf32>
    %1 = vector.shape_cast %0 : vector<8xf32> to vector<2x4xf32>
    return %1 : vector<2x4xf32>
  }
  func.func @scalable(%arg0: vector<2x[4]xf32>) -> vector<2x[4]xf32> {
    %0 = vector.shape_cast %arg0 : vector<2x[4]xf32> to vector<[8]xf32>
    %1 = vector.shape_cast %0 : vector<[8]xf32> to vector<2x[4]xf32>
    return %1 : vector<2x[4]xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["func.func"]} in %arg0 : (!transform.any_op) -> !transform.op<"func.func">
      transform.apply_patterns to %0 {
        transform.apply_patterns.vector.drop_unit_dims_with_shape_cast
      } : !transform.op<"func.func">
      transform.yield 
    }
  }
}

