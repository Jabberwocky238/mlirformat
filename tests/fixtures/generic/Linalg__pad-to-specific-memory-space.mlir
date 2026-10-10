#map = affine_map<()[s0] -> (-s0 + 12, 7)>
#map1 = affine_map<(d0, d1, d2) -> (d0, d2)>
#map2 = affine_map<(d0, d1, d2) -> (d2, d1)>
#map3 = affine_map<(d0, d1, d2) -> (d0, d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<24x12xf32>, tensor<12x25xf32>, tensor<24x25xf32>, index, index, index) -> tensor<24x25xf32>, sym_name = "pad_to_memory_space"}> ({
  ^bb0(%arg1: tensor<24x12xf32>, %arg2: tensor<12x25xf32>, %arg3: tensor<24x25xf32>, %arg4: index, %arg5: index, %arg6: index):
    %4 = "affine.min"(%arg6) <{map = #map}> : (index) -> index
    %5 = "tensor.extract_slice"(%arg1, %arg4, %arg6, %4) <{operandSegmentSizes = array<i32: 1, 2, 1, 0>, static_offsets = array<i64: -9223372036854775808, -9223372036854775808>, static_sizes = array<i64: 4, -9223372036854775808>, static_strides = array<i64: 1, 1>}> : (tensor<24x12xf32>, index, index, index) -> tensor<4x?xf32>
    %6 = "tensor.extract_slice"(%arg2, %arg6, %arg5, %4) <{operandSegmentSizes = array<i32: 1, 2, 1, 0>, static_offsets = array<i64: -9223372036854775808, -9223372036854775808>, static_sizes = array<i64: -9223372036854775808, 5>, static_strides = array<i64: 1, 1>}> : (tensor<12x25xf32>, index, index, index) -> tensor<?x5xf32>
    %7 = "tensor.extract_slice"(%arg3, %arg4, %arg5) <{operandSegmentSizes = array<i32: 1, 2, 0, 0>, static_offsets = array<i64: -9223372036854775808, -9223372036854775808>, static_sizes = array<i64: 4, 5>, static_strides = array<i64: 1, 1>}> : (tensor<24x25xf32>, index, index) -> tensor<4x5xf32>
    %8 = "linalg.matmul"(%5, %6, %7) <{indexing_maps = [#map1, #map2, #map3], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg7: f32, %arg8: f32, %arg9: f32):
      %10 = "arith.mulf"(%arg7, %arg8) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %11 = "arith.addf"(%arg9, %10) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%11) : (f32) -> ()
    }) : (tensor<4x?xf32>, tensor<?x5xf32>, tensor<4x5xf32>) -> tensor<4x5xf32>
    %9 = "tensor.insert_slice"(%8, %arg3, %arg4, %arg5) <{operandSegmentSizes = array<i32: 1, 1, 2, 0, 0>, static_offsets = array<i64: -9223372036854775808, -9223372036854775808>, static_sizes = array<i64: 4, 5>, static_strides = array<i64: 1, 1>}> : (tensor<4x5xf32>, tensor<24x25xf32>, index, index) -> tensor<24x25xf32>
    "func.return"(%9) : (tensor<24x25xf32>) -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.consumed}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["linalg.matmul"]}> : (!transform.any_op) -> !transform.any_op
      %1:3 = "transform.structured.pad"(%0) <{copy_back_op = "bufferization.materialize_in_destination", nofold_flags = [1, 1, 1], padding_dimensions = [0, 1, 2], padding_values = [0.000000e+00 : f32, 0.000000e+00 : f32, 0.000000e+00 : f32], transpose_paddings = []}> : (!transform.any_op) -> (!transform.any_op, !transform.any_op, !transform.any_op)
      %2:2 = "transform.structured.bufferize_to_allocation"(%1#1) <{alloc_op = "memref.alloc", emit_dealloc, memcpy_op = "bufferization.materialize_in_destination", memory_space = 3 : i64}> : (!transform.any_op) -> (!transform.any_value, !transform.any_op)
      %3 = "transform.bufferization.one_shot_bufferize"(%arg0) <{allow_return_allocs_from_loops = false, allow_unknown_ops = false, bufferize_function_boundaries = true, check_parallel_regions = true, dump_alias_sets = false, memcpy_op = "memref.copy", print_conflicts = false, test_analysis_only = false}> : (!transform.any_op) -> !transform.any_op
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
#map = affine_map<()[s0] -> (-s0 + 12, 7)>
#map1 = affine_map<(d0, d1, d2) -> (d0, d2)>
#map2 = affine_map<(d0, d1, d2) -> (d2, d1)>
#map3 = affine_map<(d0, d1, d2) -> (d0, d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<24x12xf32>, tensor<12x25xf32>, tensor<24x25xf32>, index, index, index) -> tensor<24x25xf32>, sym_name = "vectorize_and_bufferize_pad"}> ({
  ^bb0(%arg1: tensor<24x12xf32>, %arg2: tensor<12x25xf32>, %arg3: tensor<24x25xf32>, %arg4: index, %arg5: index, %arg6: index):
    %6 = "affine.min"(%arg6) <{map = #map}> : (index) -> index
    %7 = "tensor.extract_slice"(%arg1, %arg4, %arg6, %6) <{operandSegmentSizes = array<i32: 1, 2, 1, 0>, static_offsets = array<i64: -9223372036854775808, -9223372036854775808>, static_sizes = array<i64: 4, -9223372036854775808>, static_strides = array<i64: 1, 1>}> : (tensor<24x12xf32>, index, index, index) -> tensor<4x?xf32>
    %8 = "tensor.extract_slice"(%arg2, %arg6, %arg5, %6) <{operandSegmentSizes = array<i32: 1, 2, 1, 0>, static_offsets = array<i64: -9223372036854775808, -9223372036854775808>, static_sizes = array<i64: -9223372036854775808, 5>, static_strides = array<i64: 1, 1>}> : (tensor<12x25xf32>, index, index, index) -> tensor<?x5xf32>
    %9 = "tensor.extract_slice"(%arg3, %arg4, %arg5) <{operandSegmentSizes = array<i32: 1, 2, 0, 0>, static_offsets = array<i64: -9223372036854775808, -9223372036854775808>, static_sizes = array<i64: 4, 5>, static_strides = array<i64: 1, 1>}> : (tensor<24x25xf32>, index, index) -> tensor<4x5xf32>
    %10 = "linalg.matmul"(%7, %8, %9) <{indexing_maps = [#map1, #map2, #map3], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg7: f32, %arg8: f32, %arg9: f32):
      %12 = "arith.mulf"(%arg7, %arg8) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %13 = "arith.addf"(%arg9, %12) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%13) : (f32) -> ()
    }) : (tensor<4x?xf32>, tensor<?x5xf32>, tensor<4x5xf32>) -> tensor<4x5xf32>
    %11 = "tensor.insert_slice"(%10, %arg3, %arg4, %arg5) <{operandSegmentSizes = array<i32: 1, 1, 2, 0, 0>, static_offsets = array<i64: -9223372036854775808, -9223372036854775808>, static_sizes = array<i64: 4, 5>, static_strides = array<i64: 1, 1>}> : (tensor<4x5xf32>, tensor<24x25xf32>, index, index) -> tensor<24x25xf32>
    "func.return"(%11) : (tensor<24x25xf32>) -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.consumed}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["linalg.matmul"]}> : (!transform.any_op) -> !transform.any_op
      %1:3 = "transform.structured.pad"(%0) <{copy_back_op = "bufferization.materialize_in_destination", nofold_flags = [1, 1, 1], padding_dimensions = [0, 1, 2], padding_values = [0.000000e+00 : f32, 0.000000e+00 : f32, 0.000000e+00 : f32], transpose_paddings = []}> : (!transform.any_op) -> (!transform.any_op, !transform.any_op, !transform.any_op)
      "transform.structured.vectorize"(%1#1) <{scalable_sizes = array<i1: false, false>, static_vector_sizes = array<i64: 10, 12>}> : (!transform.any_op) -> ()
      %2 = "transform.structured.match"(%arg0) <{ops = ["vector.transfer_write"]}> : (!transform.any_op) -> !transform.any_op
      %3 = "transform.get_parent_op"(%2) <{nth_parent = 1 : i64, op_name = "vector.mask"}> : (!transform.any_op) -> !transform.any_op
      %4:2 = "transform.structured.bufferize_to_allocation"(%3) <{alloc_op = "memref.alloc", emit_dealloc, memcpy_op = "bufferization.materialize_in_destination", memory_space = 3 : i64}> : (!transform.any_op) -> (!transform.any_value, !transform.any_op)
      %5 = "transform.bufferization.one_shot_bufferize"(%arg0) <{allow_return_allocs_from_loops = false, allow_unknown_ops = false, bufferize_function_boundaries = true, check_parallel_regions = true, dump_alias_sets = false, memcpy_op = "memref.copy", print_conflicts = false, test_analysis_only = false}> : (!transform.any_op) -> !transform.any_op
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

