#map = affine_map<()[s0] -> (50, -s0 + 100)>
#map1 = affine_map<()[s0] -> (100, s0 + 80)>
module {
  func.func @simplify_min_max() -> (index, index) {
    %0 = "test.some_op"() : () -> index
    %1 = affine.min #map()[%0]
    %2 = affine.max #map1()[%0]
    return %1, %2 : index, index
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["affine.min", "affine.max"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %1 = transform.structured.match ops{["test.some_op"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      transform.affine.simplify_bounded_affine_ops %0 with[%1 : !transform.any_op] within [0] and [20] : !transform.any_op
      transform.yield 
    }
  }
}

// -----
#map = affine_map<()[s0] -> (s0 * -32 + 1023, 32)>
#map1 = affine_map<()[s0, s1] -> (s0 - s1 * (s0 ceildiv 32), s0 ceildiv 32)>
module {
  func.func @simplify_min_sequence() -> index {
    %0 = "test.workgroup_id"() : () -> index
    %1 = affine.min #map()[%0]
    %2 = "test.thread_id"() : () -> index
    %3 = affine.min #map1()[%1, %2]
    return %3 : index
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["affine.min"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %1 = transform.structured.match ops{["test.workgroup_id"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %2 = transform.structured.match ops{["test.thread_id"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      transform.affine.simplify_bounded_affine_ops %0 with[%1, %2 : !transform.any_op, !transform.any_op] within [0, 0] and [31, 31] : !transform.any_op
      transform.yield 
    }
  }
}

// -----
// -----
