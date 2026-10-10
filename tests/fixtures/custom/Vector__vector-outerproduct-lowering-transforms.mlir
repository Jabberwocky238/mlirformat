module {
  func.func @outerproduct_noacc(%arg0: vector<2xf32>, %arg1: vector<3xf32>) -> vector<2x3xf32> {
    %0 = vector.outerproduct %arg0, %arg1 : vector<2xf32>, vector<3xf32>
    return %0 : vector<2x3xf32>
  }
  func.func @outerproduct_acc(%arg0: vector<2xf32>, %arg1: vector<3xf32>, %arg2: vector<2x3xf32>) -> vector<2x3xf32> {
    %0 = vector.outerproduct %arg0, %arg1, %arg2 {kind = #vector.kind<add>} : vector<2xf32>, vector<3xf32>
    return %0 : vector<2x3xf32>
  }
  func.func @outerproduct_noacc_int(%arg0: vector<2xi32>, %arg1: vector<3xi32>) -> vector<2x3xi32> {
    %0 = vector.outerproduct %arg0, %arg1 : vector<2xi32>, vector<3xi32>
    return %0 : vector<2x3xi32>
  }
  func.func @outerproduct_acc_int(%arg0: vector<2xi32>, %arg1: vector<3xi32>, %arg2: vector<2x3xi32>) -> vector<2x3xi32> {
    %0 = vector.outerproduct %arg0, %arg1, %arg2 {kind = #vector.kind<add>} : vector<2xi32>, vector<3xi32>
    return %0 : vector<2x3xi32>
  }
  func.func @axpy_fp(%arg0: vector<16xf32>, %arg1: f32) -> vector<16xf32> {
    %0 = vector.outerproduct %arg0, %arg1 : vector<16xf32>, f32
    return %0 : vector<16xf32>
  }
  func.func @axpy_fp_add(%arg0: vector<16xf32>, %arg1: f32, %arg2: vector<16xf32>) -> vector<16xf32> {
    %0 = vector.outerproduct %arg0, %arg1, %arg2 {kind = #vector.kind<add>} : vector<16xf32>, f32
    return %0 : vector<16xf32>
  }
  func.func @axpy_int(%arg0: vector<16xi32>, %arg1: i32) -> vector<16xi32> {
    %0 = vector.outerproduct %arg0, %arg1 : vector<16xi32>, i32
    return %0 : vector<16xi32>
  }
  func.func @axpy_int_add(%arg0: vector<16xi32>, %arg1: i32, %arg2: vector<16xi32>) -> vector<16xi32> {
    %0 = vector.outerproduct %arg0, %arg1, %arg2 {kind = #vector.kind<add>} : vector<16xi32>, i32
    return %0 : vector<16xi32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["func.func"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      transform.apply_patterns to %0 {
        transform.apply_patterns.vector.lower_outerproduct
      } : !transform.any_op
      transform.apply_patterns to %0 {
        transform.apply_patterns.vector.lower_broadcast
      } : !transform.any_op
      transform.yield 
    }
  }
}

