#map = affine_map<(d0, d1) -> (d0, 0, d1)>
#map1 = affine_map<(d0, d1) -> (0, d1, d0)>
module {
  func.func @multi_reduction_to_fma(%arg0: memref<3x4xf32>, %arg1: memref<4x3xf32>, %arg2: memref<3x3xf32>) {
    %c0 = arith.constant 0 : index
    %0 = ub.poison : f32
    %1 = vector.transfer_read %arg0[%c0, %c0], %0 {permutation_map = #map} : memref<3x4xf32>, vector<3x3x4xf32>
    %2 = vector.transfer_read %arg1[%c0, %c0], %0 {permutation_map = #map1} : memref<4x3xf32>, vector<3x3x4xf32>
    %3 = vector.transfer_read %arg2[%c0, %c0], %0 : memref<3x3xf32>, vector<3x3xf32>
    %4 = arith.mulf %1, %2 : vector<3x3x4xf32>
    %5 = vector.multi_reduction <add>, %4, %3 [2] : vector<3x3x4xf32> to vector<3x3xf32>
    vector.transfer_write %5, %arg2[%c0, %c0] : vector<3x3xf32>, memref<3x3xf32>
    return
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["func.func"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      transform.apply_patterns to %0 {
        transform.apply_patterns.vector.reduction_to_contract
        transform.apply_patterns.vector.transfer_permutation_patterns
      } : !transform.any_op
      transform.apply_patterns to %0 {
        transform.apply_patterns.vector.lower_contraction
      } : !transform.any_op
      transform.apply_patterns to %0 {
        transform.apply_patterns.vector.lower_outerproduct
      } : !transform.any_op
      transform.yield 
    }
  }
}

