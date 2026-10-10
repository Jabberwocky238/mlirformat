module {
  func.func @genbool_1d() -> vector<8xi1> {
    %0 = vector.constant_mask [4] : vector<8xi1>
    return %0 : vector<8xi1>
  }
  func.func @genbool_2d() -> vector<4x4xi1> {
    %0 = vector.constant_mask [2, 2] : vector<4x4xi1>
    return %0 : vector<4x4xi1>
  }
  func.func @genbool_3d() -> vector<2x3x4xi1> {
    %0 = vector.constant_mask [1, 1, 3] : vector<2x3x4xi1>
    return %0 : vector<2x3x4xi1>
  }
  func.func @genbool_var_1d(%arg0: index) -> vector<3xi1> {
    %0 = vector.create_mask %arg0 : vector<3xi1>
    return %0 : vector<3xi1>
  }
  func.func @genbool_var_2d(%arg0: index, %arg1: index) -> vector<2x3xi1> {
    %0 = vector.create_mask %arg0, %arg1 : vector<2x3xi1>
    return %0 : vector<2x3xi1>
  }
  func.func @genbool_var_3d(%arg0: index, %arg1: index, %arg2: index) -> vector<2x1x7xi1> {
    %0 = vector.create_mask %arg0, %arg1, %arg2 : vector<2x1x7xi1>
    return %0 : vector<2x1x7xi1>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["func.func"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      transform.apply_patterns to %0 {
        transform.apply_patterns.vector.lower_masks
      } : !transform.any_op
      transform.yield 
    }
  }
}

// -----
module {
  func.func @transfer_read_3d(%arg0: tensor<?x?x?xf32>, %arg1: index, %arg2: index, %arg3: index) -> vector<2x1x7xf32> {
    %c0 = arith.constant 0 : index
    %cst = arith.constant 0.000000e+00 : f32
    %0 = vector.create_mask %arg1, %arg2, %arg3 : vector<2x1x7xi1>
    %1 = vector.mask %0 { vector.transfer_read %arg0[%c0, %c0, %c0], %cst {in_bounds = [true, true, true]} : tensor<?x?x?xf32>, vector<2x1x7xf32> } : vector<2x1x7xi1> -> vector<2x1x7xf32>
    return %1 : vector<2x1x7xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["func.func"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      transform.apply_patterns to %0 {
        transform.apply_patterns.vector.lower_masked_transfers
      } : !transform.any_op
      transform.yield 
    }
  }
}

