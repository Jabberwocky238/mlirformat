#map = affine_map<(d0, d1, d2) -> (d0, d2)>
#map1 = affine_map<(d0, d1, d2) -> (d2, d1)>
#map2 = affine_map<(d0, d1, d2) -> (d0, d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<8x16xf32>, tensor<16x32xf32>, tensor<8x32xf32>) -> tensor<8x32xf32>, sym_name = "matmul_tensors"}> ({
  ^bb0(%arg1: tensor<8x16xf32>, %arg2: tensor<16x32xf32>, %arg3: tensor<8x32xf32>):
    %6 = "linalg.matmul"(%arg1, %arg2, %arg3) <{indexing_maps = [#map, #map1, #map2], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg4: f32, %arg5: f32, %arg6: f32):
      %7 = "arith.mulf"(%arg4, %arg5) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %8 = "arith.addf"(%arg6, %7) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%8) : (f32) -> ()
    }) : (tensor<8x16xf32>, tensor<16x32xf32>, tensor<8x32xf32>) -> tensor<8x32xf32>
    "func.return"(%6) : (tensor<8x32xf32>) -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.consumed}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["linalg.matmul"]}> : (!transform.any_op) -> !transform.any_op
      %1:4 = "transform.structured.tile_using_for"(%0) <{scalable_sizes = array<i1: false, false, false>, static_sizes = array<i64: 8, 4, 2>}> : (!transform.any_op) -> (!transform.any_op, !transform.any_op, !transform.any_op, !transform.any_op)
      %2 = "transform.get_parent_op"(%1#0) <{isolated_from_above, nth_parent = 1 : i64}> : (!transform.any_op) -> !transform.any_op
      %3 = "transform.structured.vectorize_children_and_apply_patterns"(%2) : (!transform.any_op) -> !transform.any_op
      %4 = "transform.bufferization.one_shot_bufferize"(%arg0) <{allow_return_allocs_from_loops = false, allow_unknown_ops = false, bufferize_function_boundaries = true, check_parallel_regions = true, dump_alias_sets = false, function_boundary_type_conversion = 1 : i32, memcpy_op = "memref.copy", print_conflicts = false, test_analysis_only = false}> {allow_return_allocs = true} : (!transform.any_op) -> !transform.any_op
      %5 = "transform.structured.match"(%4) <{ops = ["func.func"]}> : (!transform.any_op) -> !transform.any_op
      "transform.apply_patterns"(%5) <{max_iterations = -1 : i64, max_num_rewrites = -1 : i64}> ({
        "transform.apply_patterns.vector.lower_contraction"() <{lowering_strategy = 2 : i32}> : () -> ()
      }) : (!transform.any_op) -> ()
      "transform.apply_patterns"(%5) <{max_iterations = -1 : i64, max_num_rewrites = -1 : i64}> ({
        "transform.apply_patterns.vector.transfer_permutation_patterns"() : () -> ()
      }) : (!transform.any_op) -> ()
      "transform.apply_patterns"(%5) <{max_iterations = -1 : i64, max_num_rewrites = -1 : i64}> ({
        "transform.apply_patterns.vector.lower_multi_reduction"() <{lowering_strategy = 0 : i32}> : () -> ()
      }) : (!transform.any_op) -> ()
      "transform.apply_patterns"(%5) <{max_iterations = -1 : i64, max_num_rewrites = -1 : i64}> ({
        "transform.apply_patterns.vector.split_transfer_full_partial"() <{split_transfer_strategy = 2 : i32}> : () -> ()
      }) : (!transform.any_op) -> ()
      "transform.apply_patterns"(%5) <{max_iterations = -1 : i64, max_num_rewrites = -1 : i64}> ({
        "transform.apply_patterns.vector.transfer_to_scf"() <{full_unroll = true, max_transfer_rank = 1 : i64}> : () -> ()
      }) : (!transform.any_op) -> ()
      "transform.apply_patterns"(%5) <{max_iterations = -1 : i64, max_num_rewrites = -1 : i64}> ({
        "transform.apply_patterns.vector.lower_transfer"() <{max_transfer_rank = 1 : i64}> : () -> ()
      }) : (!transform.any_op) -> ()
      "transform.apply_patterns"(%5) <{max_iterations = -1 : i64, max_num_rewrites = -1 : i64}> ({
        "transform.apply_patterns.vector.lower_shape_cast"() : () -> ()
      }) : (!transform.any_op) -> ()
      "transform.apply_patterns"(%5) <{max_iterations = -1 : i64, max_num_rewrites = -1 : i64}> ({
        "transform.apply_patterns.vector.lower_transpose"() <{avx2_lowering_strategy = false, lowering_strategy = 2 : i32}> : () -> ()
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
  "func.func"() <{function_type = (vector<64x64xf16>, vector<64x64xf16>, vector<64x64xf32>) -> vector<64x64xf32>, sym_name = "fold_arith_extf_into_contract"}> ({
  ^bb0(%arg1: vector<64x64xf16>, %arg2: vector<64x64xf16>, %arg3: vector<64x64xf32>):
    %1 = "arith.extf"(%arg1) : (vector<64x64xf16>) -> vector<64x64xf32>
    %2 = "arith.extf"(%arg2) : (vector<64x64xf16>) -> vector<64x64xf32>
    %3 = "vector.contract"(%1, %2, %arg3) <{indexing_maps = [#map, #map1, #map2], iterator_types = [#vector.iterator_type<parallel>, #vector.iterator_type<parallel>, #vector.iterator_type<reduction>], kind = #vector.kind<add>}> : (vector<64x64xf32>, vector<64x64xf32>, vector<64x64xf32>) -> vector<64x64xf32>
    "func.return"(%3) : (vector<64x64xf32>) -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["func.func"]}> : (!transform.any_op) -> !transform.any_op
      "transform.apply_patterns"(%0) <{max_iterations = -1 : i64, max_num_rewrites = -1 : i64}> ({
        "transform.apply_patterns.vector.fold_arith_extension"() : () -> ()
      }) : (!transform.any_op) -> ()
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<[4]xi32>, vector<[4]xi32>) -> vector<[4]x[4]xi32>, sym_name = "arith_to_outerproduct_scalable_i32"}> ({
  ^bb0(%arg5: vector<[4]xi32>, %arg6: vector<[4]xi32>):
    %6 = "vector.broadcast"(%arg5) : (vector<[4]xi32>) -> vector<[4]x[4]xi32>
    %7 = "vector.transpose"(%6) <{permutation = array<i64: 1, 0>}> : (vector<[4]x[4]xi32>) -> vector<[4]x[4]xi32>
    %8 = "vector.broadcast"(%arg6) : (vector<[4]xi32>) -> vector<[4]x[4]xi32>
    %9 = "arith.muli"(%7, %8) <{overflowFlags = #arith.overflow<none>}> : (vector<[4]x[4]xi32>, vector<[4]x[4]xi32>) -> vector<[4]x[4]xi32>
    "func.return"(%9) : (vector<[4]x[4]xi32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<16xf32>, vector<8xf32>) -> vector<8x16xf32>, sym_name = "arith_to_outerproduct_trans_rhs_f32"}> ({
  ^bb0(%arg3: vector<16xf32>, %arg4: vector<8xf32>):
    %2 = "vector.broadcast"(%arg4) : (vector<8xf32>) -> vector<16x8xf32>
    %3 = "vector.transpose"(%2) <{permutation = array<i64: 1, 0>}> : (vector<16x8xf32>) -> vector<8x16xf32>
    %4 = "vector.broadcast"(%arg3) : (vector<16xf32>) -> vector<8x16xf32>
    %5 = "arith.mulf"(%4, %3) <{fastmath = #arith.fastmath<none>}> : (vector<8x16xf32>, vector<8x16xf32>) -> vector<8x16xf32>
    "func.return"(%5) : (vector<8x16xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (f32, f32) -> f32, sym_name = "negative_non_vector_type"}> ({
  ^bb0(%arg1: f32, %arg2: f32):
    %1 = "arith.mulf"(%arg1, %arg2) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
    "func.return"(%1) : (f32) -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["func.func"]}> : (!transform.any_op) -> !transform.any_op
      "transform.apply_patterns"(%0) <{max_iterations = -1 : i64, max_num_rewrites = -1 : i64}> ({
        "transform.apply_patterns.vector.elementwise_to_vector"() : () -> ()
      }) : (!transform.any_op) -> ()
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

