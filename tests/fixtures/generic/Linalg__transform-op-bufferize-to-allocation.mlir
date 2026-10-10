"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x10xindex>, index, index, index) -> tensor<?x?xindex>, sym_name = "tensor_pad_constant"}> ({
  ^bb0(%arg1: tensor<?x10xindex>, %arg2: index, %arg3: index, %arg4: index):
    %6 = "tensor.pad"(%arg1, %arg2, %arg3, %arg4) <{operandSegmentSizes = array<i32: 1, 1, 2>, static_high = array<i64: -9223372036854775808, -9223372036854775808>, static_low = array<i64: 5, -9223372036854775808>}> ({
    ^bb0(%arg5: index, %arg6: index):
      %7 = "arith.constant"() <{value = 50 : index}> : () -> index
      "tensor.yield"(%7) : (index) -> ()
    }) : (tensor<?x10xindex>, index, index, index) -> tensor<?x?xindex>
    "func.return"(%6) : (tensor<?x?xindex>) -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["tensor.pad"]}> : (!transform.any_op) -> !transform.any_op
      %1:2 = "transform.structured.bufferize_to_allocation"(%0) <{alloc_op = "memref.alloc", emit_dealloc, memcpy_op = "bufferization.materialize_in_destination"}> : (!transform.any_op) -> (!transform.any_value, !transform.any_op)
      %2 = "transform.select"(%1#1) <{op_name = "linalg.fill"}> : (!transform.any_op) -> !transform.any_op
      %3 = "transform.num_associations"(%2) : (!transform.any_op) -> !transform.param<i64>
      "transform.debug.emit_param_as_remark"(%3) : (!transform.param<i64>) -> ()
      %4 = "transform.select"(%1#1) <{op_name = "bufferization.materialize_in_destination"}> : (!transform.any_op) -> !transform.any_op
      %5 = "transform.num_associations"(%4) : (!transform.any_op) -> !transform.param<i64>
      "transform.debug.emit_param_as_remark"(%5) : (!transform.param<i64>) -> ()
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x10xindex>, index, index, index) -> tensor<?x?xindex>, sym_name = "tensor_pad_constant_with_custom_copy"}> ({
  ^bb0(%arg1: tensor<?x10xindex>, %arg2: index, %arg3: index, %arg4: index):
    %9 = "tensor.pad"(%arg1, %arg2, %arg3, %arg4) <{operandSegmentSizes = array<i32: 1, 1, 2>, static_high = array<i64: -9223372036854775808, -9223372036854775808>, static_low = array<i64: 5, -9223372036854775808>}> ({
    ^bb0(%arg5: index, %arg6: index):
      %10 = "arith.constant"() <{value = 50 : index}> : () -> index
      "tensor.yield"(%10) : (index) -> ()
    }) : (tensor<?x10xindex>, index, index, index) -> tensor<?x?xindex>
    "func.return"(%9) : (tensor<?x?xindex>) -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.consumed}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["tensor.pad"]}> : (!transform.any_op) -> !transform.any_op
      %1:2 = "transform.structured.bufferize_to_allocation"(%0) <{alloc_op = "memref.alloca", emit_dealloc, memcpy_op = "linalg.copy", memory_space = 3 : i64}> : (!transform.any_op) -> (!transform.any_value, !transform.any_op)
      %2 = "transform.select"(%1#1) <{op_name = "linalg.fill"}> : (!transform.any_op) -> !transform.any_op
      %3 = "transform.num_associations"(%2) : (!transform.any_op) -> !transform.param<i64>
      "transform.debug.emit_param_as_remark"(%3) : (!transform.param<i64>) -> ()
      %4 = "transform.select"(%1#1) <{op_name = "linalg.copy"}> : (!transform.any_op) -> !transform.any_op
      %5 = "transform.num_associations"(%4) : (!transform.any_op) -> !transform.param<i64>
      "transform.debug.emit_param_as_remark"(%5) : (!transform.param<i64>) -> ()
      %6 = "transform.select"(%1#1) <{op_name = "memref.alloca"}> : (!transform.any_op) -> !transform.any_op
      %7 = "transform.num_associations"(%6) : (!transform.any_op) -> !transform.param<i64>
      "transform.debug.emit_param_as_remark"(%7) : (!transform.param<i64>) -> ()
      %8 = "transform.bufferization.one_shot_bufferize"(%arg0) <{allow_return_allocs_from_loops = false, allow_unknown_ops = false, bufferize_function_boundaries = false, check_parallel_regions = true, dump_alias_sets = false, memcpy_op = "memref.copy", print_conflicts = false, test_analysis_only = false}> : (!transform.any_op) -> !transform.any_op
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x10xindex>, index, index, index) -> tensor<?x?xindex>, sym_name = "tensor_pad_constant"}> ({
  ^bb0(%arg1: tensor<?x10xindex>, %arg2: index, %arg3: index, %arg4: index):
    %3 = "tensor.pad"(%arg1, %arg2, %arg3, %arg4) <{operandSegmentSizes = array<i32: 1, 1, 2>, static_high = array<i64: -9223372036854775808, -9223372036854775808>, static_low = array<i64: 5, -9223372036854775808>}> ({
    ^bb0(%arg5: index, %arg6: index):
      %4 = "arith.constant"() <{value = 50 : index}> : () -> index
      "tensor.yield"(%4) : (index) -> ()
    }) : (tensor<?x10xindex>, index, index, index) -> tensor<?x?xindex>
    "func.return"(%3) : (tensor<?x?xindex>) -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.consumed}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["tensor.pad"]}> : (!transform.any_op) -> !transform.any_op
      %1:2 = "transform.structured.bufferize_to_allocation"(%0) <{alloc_op = "memref.alloc", emit_dealloc, memcpy_op = "bufferization.materialize_in_destination"}> : (!transform.any_op) -> (!transform.any_value, !transform.any_op)
      %2 = "transform.bufferization.one_shot_bufferize"(%arg0) <{allow_return_allocs_from_loops = false, allow_unknown_ops = false, bufferize_function_boundaries = false, check_parallel_regions = true, dump_alias_sets = false, memcpy_op = "memref.copy", print_conflicts = false, test_analysis_only = false}> : (!transform.any_op) -> !transform.any_op
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x10xindex>, index, index) -> tensor<?x10xindex>, sym_name = "tensor_insert"}> ({
  ^bb0(%arg1: tensor<?x10xindex>, %arg2: index, %arg3: index):
    %3 = "tensor.insert"(%arg3, %arg1, %arg2, %arg2) : (index, tensor<?x10xindex>, index, index) -> tensor<?x10xindex>
    "func.return"(%3) : (tensor<?x10xindex>) -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.consumed}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["tensor.insert"]}> : (!transform.any_op) -> !transform.any_op
      %1:2 = "transform.structured.bufferize_to_allocation"(%0) <{alloc_op = "memref.alloc", emit_dealloc, memcpy_op = "bufferization.materialize_in_destination", memory_space = 4 : i64}> : (!transform.any_op) -> (!transform.any_value, !transform.any_op)
      %2 = "transform.bufferization.one_shot_bufferize"(%arg0) <{allow_return_allocs_from_loops = false, allow_unknown_ops = false, bufferize_function_boundaries = false, check_parallel_regions = true, dump_alias_sets = false, memcpy_op = "memref.copy", print_conflicts = false, test_analysis_only = false}> : (!transform.any_op) -> !transform.any_op
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (index, index) -> tensor<10xindex>, sym_name = "tensor_insert_into_empty"}> ({
  ^bb0(%arg1: index, %arg2: index):
    %3 = "tensor.empty"() : () -> tensor<10xindex>
    %4 = "tensor.insert"(%arg2, %3, %arg1) : (index, tensor<10xindex>, index) -> tensor<10xindex>
    "func.return"(%4) : (tensor<10xindex>) -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.consumed}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["tensor.insert"]}> : (!transform.any_op) -> !transform.any_op
      %1:2 = "transform.structured.bufferize_to_allocation"(%0) <{alloc_op = "memref.alloc", emit_dealloc, memcpy_op = "bufferization.materialize_in_destination", memory_space = 4 : i64}> : (!transform.any_op) -> (!transform.any_value, !transform.any_op)
      %2 = "transform.bufferization.one_shot_bufferize"(%arg0) <{allow_return_allocs_from_loops = false, allow_unknown_ops = false, bufferize_function_boundaries = false, check_parallel_regions = true, dump_alias_sets = false, memcpy_op = "memref.copy", print_conflicts = false, test_analysis_only = false}> : (!transform.any_op) -> !transform.any_op
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x10xindex>, index) -> index, sym_name = "tensor_extract"}> ({
  ^bb0(%arg1: tensor<?x10xindex>, %arg2: index):
    %2 = "tensor.extract"(%arg1, %arg2, %arg2) : (tensor<?x10xindex>, index, index) -> index
    "func.return"(%2) : (index) -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["tensor.extract"]}> : (!transform.any_op) -> !transform.any_op
      %1:2 = "transform.structured.bufferize_to_allocation"(%0) <{alloc_op = "memref.alloc", emit_dealloc, memcpy_op = "bufferization.materialize_in_destination", memory_space = 4 : i64}> : (!transform.any_op) -> (!transform.any_value, !transform.any_op)
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0) -> (d0)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?xf32>, vector<16xf32>, index, vector<16xi1>) -> tensor<?xf32>, sym_name = "vector_mask"}> ({
  ^bb0(%arg1: tensor<?xf32>, %arg2: vector<16xf32>, %arg3: index, %arg4: vector<16xi1>):
    %2 = "vector.mask"(%arg4) ({
      %3 = "vector.transfer_write"(%arg2, %arg1, %arg3) <{in_bounds = [false], operandSegmentSizes = array<i32: 1, 1, 1, 0>, permutation_map = #map}> : (vector<16xf32>, tensor<?xf32>, index) -> tensor<?xf32>
      "vector.yield"(%3) : (tensor<?xf32>) -> ()
    }) : (vector<16xi1>) -> tensor<?xf32>
    "func.return"(%2) : (tensor<?xf32>) -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["vector.mask"]}> : (!transform.any_op) -> !transform.any_op
      %1:2 = "transform.structured.bufferize_to_allocation"(%0) <{alloc_op = "memref.alloc", emit_dealloc, memcpy_op = "bufferization.materialize_in_destination", memory_space = 4 : i64}> : (!transform.any_op) -> (!transform.any_value, !transform.any_op)
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x10xindex>, index, index) -> tensor<?x10xindex>, sym_name = "tensor_insert_destination"}> ({
  ^bb0(%arg1: tensor<?x10xindex>, %arg2: index, %arg3: index):
    %2 = "tensor.insert"(%arg3, %arg1, %arg2, %arg2) : (index, tensor<?x10xindex>, index, index) -> tensor<?x10xindex>
    "func.return"(%2) : (tensor<?x10xindex>) -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["tensor.insert"]}> : (!transform.any_op) -> !transform.any_op
      %1:2 = "transform.structured.bufferize_to_allocation"(%0) <{alloc_op = "memref.alloc", bufferize_destination_only, emit_dealloc, memcpy_op = "bufferization.materialize_in_destination", memory_space = 4 : i64}> : (!transform.any_op) -> (!transform.any_value, !transform.any_op)
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x10xindex>, index, index, index) -> tensor<?x10xindex>, sym_name = "scf_for_destination"}> ({
  ^bb0(%arg1: tensor<?x10xindex>, %arg2: index, %arg3: index, %arg4: index):
    %2 = "scf.for"(%arg2, %arg3, %arg4, %arg1) ({
    ^bb0(%arg5: index, %arg6: tensor<?x10xindex>):
      %3 = "test.foo"(%arg6) : (tensor<?x10xindex>) -> tensor<?x10xindex>
      "scf.yield"(%3) : (tensor<?x10xindex>) -> ()
    }) : (index, index, index, tensor<?x10xindex>) -> tensor<?x10xindex>
    "func.return"(%2) : (tensor<?x10xindex>) -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["scf.for"]}> : (!transform.any_op) -> !transform.any_op
      %1:2 = "transform.structured.bufferize_to_allocation"(%0) <{alloc_op = "memref.alloc", bufferize_destination_only, emit_dealloc, memcpy_op = "bufferization.materialize_in_destination", memory_space = 4 : i64}> : (!transform.any_op) -> (!transform.any_value, !transform.any_op)
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x10xindex>, index, index) -> tensor<?x10xindex>, sym_name = "tensor_insert_destination_no_dealloc"}> ({
  ^bb0(%arg1: tensor<?x10xindex>, %arg2: index, %arg3: index):
    %2 = "tensor.insert"(%arg3, %arg1, %arg2, %arg2) : (index, tensor<?x10xindex>, index, index) -> tensor<?x10xindex>
    "func.return"(%2) : (tensor<?x10xindex>) -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["tensor.insert"]}> : (!transform.any_op) -> !transform.any_op
      %1:2 = "transform.structured.bufferize_to_allocation"(%0) <{alloc_op = "memref.alloc", bufferize_destination_only, memcpy_op = "bufferization.materialize_in_destination", memory_space = 4 : i64}> : (!transform.any_op) -> (!transform.any_value, !transform.any_op)
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

