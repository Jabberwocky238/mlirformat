module {
  transform.sequence  failures(propagate) {
  ^bb0(%arg0: !transform.any_op):
    %tiled_linalg_op, %loops:2 = transform.structured.tile_using_for %arg0 tile_sizes [2, 0, 3] : (!transform.any_op) -> (!transform.any_op, !transform.any_op, !transform.any_op)
  }
  transform.sequence  failures(propagate) {
  ^bb0(%arg0: !transform.any_op):
    %tiled_linalg_op, %loops:2 = transform.structured.tile_using_for %arg0 tile_sizes [2, 0, 3] interchange = [2, 1] {test_attr1 = 1 : i64, test_attr2} : (!transform.any_op) -> (!transform.any_op, !transform.any_op, !transform.any_op)
    %tiled_linalg_op_0, %loops_1:2 = transform.structured.tile_using_for %tiled_linalg_op tile_sizes [0, 5, 3] {test_attr3 = 1 : i64, test_attr4} : (!transform.any_op) -> (!transform.any_op, !transform.any_op, !transform.any_op)
  }
  transform.sequence  failures(propagate) {
  ^bb0(%arg0: !transform.any_op):
    %0 = transform.structured.split %arg0 after 42  {dimension = 0 : i64} : !transform.any_op
    %1:2 = split_handle %0 : (!transform.any_op) -> (!transform.any_op, !transform.any_op)
    %2 = transform.structured.split %1#0 after %1#1  {dimension = 1 : i64} : !transform.any_op, !transform.any_op
  }
  transform.sequence  failures(propagate) {
  ^bb0(%arg0: !transform.any_op):
    %padded, %pad, %copy = transform.structured.pad %arg0 : (!transform.any_op) -> (!transform.any_op, !transform.any_op, !transform.any_op)
  }
  transform.sequence  failures(propagate) {
  ^bb0(%arg0: !transform.any_op):
    %0 = transform.structured.interchange %arg0 : (!transform.any_op) -> !transform.any_op
  }
  transform.sequence  failures(propagate) {
  ^bb0(%arg0: !transform.any_op):
    %0 = transform.structured.scalarize %arg0 : (!transform.any_op) -> !transform.any_op
  }
  transform.sequence  failures(propagate) {
  ^bb0(%arg0: !transform.any_op, %arg1: !transform.any_op, %arg2: !transform.any_op):
    %0 = transform.structured.match ops{["scf.forall"]} in %arg0 : (!transform.any_op) -> !transform.any_op
    %fused_op, %new_containing_op = transform.structured.fuse_into_containing_op %arg1 into %0 : (!transform.any_op, !transform.any_op) -> (!transform.any_op, !transform.any_op)
    %fused_op_0, %new_containing_op_1 = transform.structured.fuse_into_containing_op %arg2 into %0 : (!transform.any_op, !transform.any_op) -> (!transform.any_op, !transform.any_op)
  }
}

// -----
module {
  transform.sequence  failures(propagate) {
  ^bb0(%arg0: !transform.any_op):
    transform.structured.vectorize %arg0 : !transform.any_op
  }
}

