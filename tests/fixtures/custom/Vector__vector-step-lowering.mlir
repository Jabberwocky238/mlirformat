module {
  func.func @step_index() -> vector<4xindex> {
    %0 = vector.step : vector<4xindex>
    return %0 : vector<4xindex>
  }
  func.func @step_index_wrap() -> vector<258xindex> {
    %0 = vector.step : vector<258xindex>
    return %0 : vector<258xindex>
  }
  func.func @step_i8() -> vector<4xi8> {
    %0 = vector.step : vector<4xi8>
    return %0 : vector<4xi8>
  }
  func.func @step_scalable_index() -> vector<[4]xindex> {
    %0 = vector.step : vector<[4]xindex>
    return %0 : vector<[4]xindex>
  }
  func.func @step_scalable_i8() -> vector<[4]xi8> {
    %0 = vector.step : vector<[4]xi8>
    return %0 : vector<[4]xi8>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @width64(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["func.func"]} in %arg0 : (!transform.any_op) -> !transform.op<"func.func">
      transform.apply_patterns to %0 {
        transform.apply_patterns.vector.lower_step index_bitwidth = 64
      } : !transform.op<"func.func">
      transform.yield 
    }
    transform.named_sequence @skip(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["func.func"]} in %arg0 : (!transform.any_op) -> !transform.op<"func.func">
      transform.apply_patterns to %0 {
        transform.apply_patterns.vector.lower_step index_bitwidth = 0
      } : !transform.op<"func.func">
      transform.yield 
    }
    transform.named_sequence @width8(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["func.func"]} in %arg0 : (!transform.any_op) -> !transform.op<"func.func">
      transform.apply_patterns to %0 {
        transform.apply_patterns.vector.lower_step index_bitwidth = 8
      } : !transform.op<"func.func">
      transform.yield 
    }
  }
}

