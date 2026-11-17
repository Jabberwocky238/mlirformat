"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x10xindex>, index, index, index) -> tensor<?x?xindex>, sym_name = "tensor_pad_constant"}> ({
  ^bb0(%arg1: tensor<?x10xindex> loc("<stdin>":3:8), %arg2: index loc("<stdin>":3:35), %arg3: index loc("<stdin>":3:49), %arg4: index loc("<stdin>":3:63)):
    %3 = "tensor.pad"(%arg1, %arg2, %arg3, %arg4) <{operandSegmentSizes = array<i32: 1, 1, 2>, static_high = array<i64: -9223372036854775808, -9223372036854775808>, static_low = array<i64: 5, -9223372036854775808>}> ({
    ^bb0(%arg5: index loc("<stdin>":5:10), %arg6: index loc("<stdin>":5:24)):
      %4 = "arith.constant"() <{value = 50 : index}> : () -> index loc("<stdin>":6:12)
      "tensor.yield"(%4) : (index) -> () loc("<stdin>":7:7)
    }) : (tensor<?x10xindex>, index, index, index) -> tensor<?x?xindex> loc("<stdin>":4:10)
    "func.return"(%3) : (tensor<?x?xindex>) -> () loc("<stdin>":9:5)
  }) : () -> () loc("<stdin>":2:3)
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.consumed}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op loc("<stdin>":13:10)):
      %0 = "transform.structured.match"(%arg0) <{ops = ["tensor.pad"]}> : (!transform.any_op) -> !transform.any_op loc("<stdin>":14:12)
      %1:2 = "transform.structured.bufferize_to_allocation"(%0) <{alloc_op = "memref.alloc", emit_dealloc, memcpy_op = "bufferization.materialize_in_destination"}> : (!transform.any_op) -> (!transform.any_value, !transform.any_op) loc("<stdin>":15:14)
      %2 = "transform.bufferization.one_shot_bufferize"(%arg0) <{allow_return_allocs_from_loops = false, allow_unknown_ops = false, bufferize_function_boundaries = false, check_parallel_regions = true, dump_alias_sets = false, memcpy_op = "memref.copy", print_conflicts = false, test_analysis_only = false}> : (!transform.any_op) -> !transform.any_op loc("<stdin>":16:12)
      "transform.yield"() : () -> () loc("<stdin>":17:7)
    }) : () -> () loc("<stdin>":12:5)
  }) {transform.with_named_sequence} : () -> () loc("<stdin>":11:3)
}) : () -> () loc("<stdin>":1:1)
