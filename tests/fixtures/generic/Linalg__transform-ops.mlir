"builtin.module"() ({
  "transform.sequence"() <{failure_propagation_mode = 1 : i32, operandSegmentSizes = array<i32: 0, 0>}> ({
  ^bb0(%arg8: !transform.any_op):
    %11:3 = "transform.structured.tile_using_for"(%arg8) <{scalable_sizes = array<i1: false, false, false>, static_sizes = array<i64: 2, 0, 3>}> : (!transform.any_op) -> (!transform.any_op, !transform.any_op, !transform.any_op)
    "transform.yield"() : () -> ()
  }) : () -> ()
  "transform.sequence"() <{failure_propagation_mode = 1 : i32, operandSegmentSizes = array<i32: 0, 0>}> ({
  ^bb0(%arg7: !transform.any_op):
    %9:3 = "transform.structured.tile_using_for"(%arg7) <{interchange = array<i64: 2, 1>, scalable_sizes = array<i1: false, false, false>, static_sizes = array<i64: 2, 0, 3>}> {test_attr1 = 1 : i64, test_attr2} : (!transform.any_op) -> (!transform.any_op, !transform.any_op, !transform.any_op)
    %10:3 = "transform.structured.tile_using_for"(%9#0) <{scalable_sizes = array<i1: false, false, false>, static_sizes = array<i64: 0, 5, 3>}> {test_attr3 = 1 : i64, test_attr4} : (!transform.any_op) -> (!transform.any_op, !transform.any_op, !transform.any_op)
    "transform.yield"() : () -> ()
  }) : () -> ()
  "transform.sequence"() <{failure_propagation_mode = 1 : i32, operandSegmentSizes = array<i32: 0, 0>}> ({
  ^bb0(%arg6: !transform.any_op):
    %6 = "transform.structured.split"(%arg6) <{dimension = 0 : i64, static_chunk_sizes = 42 : i64}> : (!transform.any_op) -> !transform.any_op
    %7:2 = "transform.split_handle"(%6) <{fail_on_payload_too_small = true, pass_through_empty_handle = true}> : (!transform.any_op) -> (!transform.any_op, !transform.any_op)
    %8 = "transform.structured.split"(%7#0, %7#1) <{dimension = 1 : i64, static_chunk_sizes = -9223372036854775808 : i64}> : (!transform.any_op, !transform.any_op) -> !transform.any_op
    "transform.yield"() : () -> ()
  }) : () -> ()
  "transform.sequence"() <{failure_propagation_mode = 1 : i32, operandSegmentSizes = array<i32: 0, 0>}> ({
  ^bb0(%arg5: !transform.any_op):
    %5:3 = "transform.structured.pad"(%arg5) <{copy_back_op = "bufferization.materialize_in_destination", nofold_flags = [], padding_dimensions = [], padding_values = [], transpose_paddings = []}> : (!transform.any_op) -> (!transform.any_op, !transform.any_op, !transform.any_op)
    "transform.yield"() : () -> ()
  }) : () -> ()
  "transform.sequence"() <{failure_propagation_mode = 1 : i32, operandSegmentSizes = array<i32: 0, 0>}> ({
  ^bb0(%arg4: !transform.any_op):
    %4 = "transform.structured.interchange"(%arg4) : (!transform.any_op) -> !transform.any_op
    "transform.yield"() : () -> ()
  }) : () -> ()
  "transform.sequence"() <{failure_propagation_mode = 1 : i32, operandSegmentSizes = array<i32: 0, 0>}> ({
  ^bb0(%arg3: !transform.any_op):
    %3 = "transform.structured.scalarize"(%arg3) : (!transform.any_op) -> !transform.any_op
    "transform.yield"() : () -> ()
  }) : () -> ()
  "transform.sequence"() <{failure_propagation_mode = 1 : i32, operandSegmentSizes = array<i32: 0, 0>}> ({
  ^bb0(%arg0: !transform.any_op, %arg1: !transform.any_op, %arg2: !transform.any_op):
    %0 = "transform.structured.match"(%arg0) <{ops = ["scf.forall"]}> : (!transform.any_op) -> !transform.any_op
    %1:2 = "transform.structured.fuse_into_containing_op"(%arg1, %0) : (!transform.any_op, !transform.any_op) -> (!transform.any_op, !transform.any_op)
    %2:2 = "transform.structured.fuse_into_containing_op"(%arg2, %0) : (!transform.any_op, !transform.any_op) -> (!transform.any_op, !transform.any_op)
    "transform.yield"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "transform.sequence"() <{failure_propagation_mode = 1 : i32, operandSegmentSizes = array<i32: 0, 0>}> ({
  ^bb0(%arg0: !transform.any_op):
    "transform.structured.vectorize"(%arg0) <{scalable_sizes = array<i1>, static_vector_sizes = array<i64>}> : (!transform.any_op) -> ()
    "transform.yield"() : () -> ()
  }) : () -> ()
}) : () -> ()

