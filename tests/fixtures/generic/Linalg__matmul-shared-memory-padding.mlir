#map = affine_map<(d0, d1, d2) -> (d0, d2)>
#map1 = affine_map<(d0, d1, d2) -> (d2, d1)>
#map2 = affine_map<(d0, d1, d2) -> (d0, d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<1024x1024xf32>, tensor<1024x1024xf32>, tensor<1024x1024xf32>) -> tensor<1024x1024xf32>, sym_name = "matmul_divisible"}> ({
  ^bb0(%arg2: tensor<1024x1024xf32>, %arg3: tensor<1024x1024xf32>, %arg4: tensor<1024x1024xf32>):
    %14 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %15 = "linalg.fill"(%14, %arg4) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg8: f32, %arg9: f32):
      "linalg.yield"(%arg8) : (f32) -> ()
    }) : (f32, tensor<1024x1024xf32>) -> tensor<1024x1024xf32>
    %16 = "linalg.matmul"(%arg2, %arg3, %15) <{indexing_maps = [#map, #map1, #map2], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg5: f32, %arg6: f32, %arg7: f32):
      %17 = "arith.mulf"(%arg5, %arg6) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %18 = "arith.addf"(%arg7, %17) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%18) : (f32) -> ()
    }) : (tensor<1024x1024xf32>, tensor<1024x1024xf32>, tensor<1024x1024xf32>) -> tensor<1024x1024xf32>
    "func.return"(%16) : (tensor<1024x1024xf32>) -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.consumed}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["linalg.matmul"]}> : (!transform.any_op) -> !transform.any_op
      %1 = "transform.structured.match"(%arg0) <{ops = ["linalg.fill"]}> : (!transform.any_op) -> !transform.any_op
      %2:2 = "transform.structured.tile_using_forall"(%0) <{mapping = [#gpu.block<y>, #gpu.block<x>], operandSegmentSizes = array<i32: 1, 0, 0, 0, 0>, static_num_threads = array<i64>, static_tile_sizes = array<i64: 128, 128>}> : (!transform.any_op) -> (!transform.any_op, !transform.any_op)
      %3:2 = "transform.structured.fuse_into_containing_op"(%1, %2#1) : (!transform.any_op, !transform.any_op) -> (!transform.any_op, !transform.any_op)
      %4:2 = "transform.structured.tile_using_for"(%2#0) <{scalable_sizes = array<i1: false, false, false>, static_sizes = array<i64: 0, 0, 16>}> : (!transform.any_op) -> (!transform.any_op, !transform.any_op)
      %5:3 = "transform.structured.pad"(%4#0) <{copy_back_op = "linalg.copy", nofold_flags = [1, 1, 1], padding_dimensions = [0, 1, 2], padding_values = [0.000000e+00 : f32, 0.000000e+00 : f32, 0.000000e+00 : f32], transpose_paddings = []}> : (!transform.any_op) -> (!transform.any_op, !transform.any_op, !transform.any_op)
      %6:2 = "transform.structured.gpu.map_copy_to_threads"(%5#1) <{desired_bit_alignment = 128 : i64, total_num_threads = 32 : i64}> : (!transform.any_op) -> (!transform.any_op, !transform.any_op)
      "transform.foreach"(%6#0) ({
      ^bb0(%arg1: !transform.any_op):
        %13 = "transform.structured.match"(%arg1) <{ops = ["scf.if"]}> : (!transform.any_op) -> !transform.any_op
        "transform.scf.take_assumed_branch"(%13) <{take_else_branch}> : (!transform.any_op) -> ()
        "transform.yield"() : () -> ()
      }) : (!transform.any_op) -> ()
      %7:2 = "transform.structured.gpu.map_copy_to_threads"(%5#2) <{desired_bit_alignment = 128 : i64, total_num_threads = 32 : i64}> : (!transform.any_op) -> (!transform.any_op, !transform.any_op)
      "transform.structured.vectorize"(%6#1) <{scalable_sizes = array<i1: false, false>, static_vector_sizes = array<i64: 128, 4>}> : (!transform.any_op) -> ()
      %8:2 = "transform.structured.bufferize_to_allocation"(%6#0) <{alloc_op = "memref.alloc", bufferize_destination_only, emit_dealloc, memcpy_op = "bufferization.materialize_in_destination", memory_space = 3 : i64}> : (!transform.any_op) -> (!transform.any_value, !transform.any_op)
      %9 = "transform.structured.match"(%arg0) <{ops = ["func.func"]}> : (!transform.any_op) -> !transform.any_op
      "transform.bufferization.eliminate_empty_tensors"(%9) : (!transform.any_op) -> ()
      "transform.apply_dce"(%9) : (!transform.any_op) -> ()
      "transform.apply_cse"(%9) : (!transform.any_op) -> ()
      %10 = "transform.bufferization.one_shot_bufferize"(%arg0) <{allow_return_allocs_from_loops = false, allow_unknown_ops = false, bufferize_function_boundaries = true, check_parallel_regions = true, dump_alias_sets = false, function_boundary_type_conversion = 1 : i32, memcpy_op = "memref.copy", print_conflicts = false, test_analysis_only = false}> : (!transform.any_op) -> !transform.any_op
      %11 = "transform.structured.match"(%10) <{ops = ["func.func"]}> : (!transform.any_op) -> !transform.any_op
      %12 = "transform.structured.match"(%11) <{ops = ["linalg.copy"]}> : (!transform.any_op) -> !transform.any_op
      "transform.structured.vectorize"(%12) <{scalable_sizes = array<i1: false, false>, static_vector_sizes = array<i64: 128, 4>}> : (!transform.any_op) -> ()
      "transform.apply_patterns"(%11) <{apply_cse, max_iterations = -1 : i64, max_num_rewrites = -1 : i64}> ({
        "transform.apply_patterns.canonicalization"() : () -> ()
        "transform.apply_patterns.vector.lower_masked_transfers"() : () -> ()
      }) : (!transform.any_op) -> ()
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2) -> (d0, d2)>
#map1 = affine_map<(d0, d1, d2) -> (d2, d1)>
#map2 = affine_map<(d0, d1, d2) -> (d0, d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<1023x1023xf32>, tensor<1023x1023xf32>, tensor<1023x1023xf32>) -> tensor<1023x1023xf32>, sym_name = "matmul_not_divisible"}> ({
  ^bb0(%arg2: tensor<1023x1023xf32>, %arg3: tensor<1023x1023xf32>, %arg4: tensor<1023x1023xf32>):
    %13 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %14 = "linalg.fill"(%13, %arg4) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg8: f32, %arg9: f32):
      "linalg.yield"(%arg8) : (f32) -> ()
    }) : (f32, tensor<1023x1023xf32>) -> tensor<1023x1023xf32>
    %15 = "linalg.matmul"(%arg2, %arg3, %14) <{indexing_maps = [#map, #map1, #map2], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg5: f32, %arg6: f32, %arg7: f32):
      %16 = "arith.mulf"(%arg5, %arg6) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %17 = "arith.addf"(%arg7, %16) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%17) : (f32) -> ()
    }) : (tensor<1023x1023xf32>, tensor<1023x1023xf32>, tensor<1023x1023xf32>) -> tensor<1023x1023xf32>
    "func.return"(%15) : (tensor<1023x1023xf32>) -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.consumed}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["linalg.matmul"]}> : (!transform.any_op) -> !transform.any_op
      %1 = "transform.structured.match"(%arg0) <{ops = ["linalg.fill"]}> : (!transform.any_op) -> !transform.any_op
      %2:2 = "transform.structured.tile_using_forall"(%0) <{mapping = [#gpu.block<y>, #gpu.block<x>], operandSegmentSizes = array<i32: 1, 0, 0, 0, 0>, static_num_threads = array<i64>, static_tile_sizes = array<i64: 128, 128>}> : (!transform.any_op) -> (!transform.any_op, !transform.any_op)
      %3:2 = "transform.structured.fuse_into_containing_op"(%1, %2#1) : (!transform.any_op, !transform.any_op) -> (!transform.any_op, !transform.any_op)
      %4:2 = "transform.structured.tile_using_for"(%2#0) <{scalable_sizes = array<i1: false, false, false>, static_sizes = array<i64: 0, 0, 16>}> : (!transform.any_op) -> (!transform.any_op, !transform.any_op)
      %5:3 = "transform.structured.pad"(%4#0) <{copy_back_op = "linalg.copy", nofold_flags = [1, 1, 1], padding_dimensions = [0, 1, 2], padding_values = [0.000000e+00 : f32, 0.000000e+00 : f32, 0.000000e+00 : f32], transpose_paddings = []}> : (!transform.any_op) -> (!transform.any_op, !transform.any_op, !transform.any_op)
      %6:2 = "transform.structured.gpu.map_copy_to_threads"(%5#1) <{desired_bit_alignment = 128 : i64, total_num_threads = 32 : i64}> : (!transform.any_op) -> (!transform.any_op, !transform.any_op)
      "transform.foreach"(%6#0) ({
      ^bb0(%arg1: !transform.any_op):
        %12 = "transform.structured.match"(%arg1) <{ops = ["scf.if"]}> : (!transform.any_op) -> !transform.any_op
        "transform.scf.take_assumed_branch"(%12) <{take_else_branch}> : (!transform.any_op) -> ()
        "transform.yield"() : () -> ()
      }) : (!transform.any_op) -> ()
      "transform.structured.vectorize"(%6#1) <{scalable_sizes = array<i1: false, false>, static_vector_sizes = array<i64: 128, 4>}> : (!transform.any_op) -> ()
      %7:2 = "transform.structured.bufferize_to_allocation"(%6#0) <{alloc_op = "memref.alloc", bufferize_destination_only, emit_dealloc, memcpy_op = "bufferization.materialize_in_destination", memory_space = 3 : i64}> : (!transform.any_op) -> (!transform.any_value, !transform.any_op)
      %8 = "transform.structured.match"(%arg0) <{ops = ["func.func"]}> : (!transform.any_op) -> !transform.any_op
      "transform.bufferization.eliminate_empty_tensors"(%8) : (!transform.any_op) -> ()
      "transform.apply_dce"(%8) : (!transform.any_op) -> ()
      "transform.apply_cse"(%8) : (!transform.any_op) -> ()
      %9 = "transform.bufferization.one_shot_bufferize"(%arg0) <{allow_return_allocs_from_loops = false, allow_unknown_ops = false, bufferize_function_boundaries = true, check_parallel_regions = true, dump_alias_sets = false, function_boundary_type_conversion = 1 : i32, memcpy_op = "memref.copy", print_conflicts = false, test_analysis_only = false}> : (!transform.any_op) -> !transform.any_op
      %10 = "transform.structured.match"(%9) <{ops = ["func.func"]}> : (!transform.any_op) -> !transform.any_op
      %11 = "transform.structured.match"(%10) <{ops = ["linalg.copy"]}> : (!transform.any_op) -> !transform.any_op
      "transform.structured.vectorize"(%11) <{scalable_sizes = array<i1: false, false>, static_vector_sizes = array<i64: 128, 4>}> : (!transform.any_op) -> ()
      "transform.apply_patterns"(%10) <{apply_cse, max_iterations = -1 : i64, max_num_rewrites = -1 : i64}> ({
        "transform.apply_patterns.canonicalization"() : () -> ()
        "transform.apply_patterns.vector.lower_masked_transfers"() : () -> ()
      }) : (!transform.any_op) -> ()
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

