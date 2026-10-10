module {
  func.func @lower_to_llvm(%arg0: vector<f32>) -> vector<i32> {
    %0 = vector.bitcast %arg0 : vector<f32> to vector<i32>
    return %0 : vector<i32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["func.func"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      transform.apply_conversion_patterns to %0 {
        transform.apply_conversion_patterns.vector.vector_to_llvm
      } with type_converter {
        transform.apply_conversion_patterns.memref.memref_to_llvm_type_converter
      } {legal_dialects = ["func", "llvm"]} : !transform.any_op
      transform.yield 
    }
  }
}

