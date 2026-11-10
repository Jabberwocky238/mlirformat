#map = affine_map<(d0, d1, d2) -> (d0, d2)>
#map1 = affine_map<(d0, d1, d2) -> (d2, d1)>
#map2 = affine_map<(d0, d1, d2) -> (d0, d1)>
#map3 = affine_map<(d0, d1, d2, d3, d4, d5) -> (d0, d2, d3, d5)>
#map4 = affine_map<(d0, d1, d2, d3, d4, d5) -> (d1, d2, d4, d5)>
#map5 = affine_map<(d0, d1, d2, d3, d4, d5) -> (d0, d1, d3, d4)>
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "main"}> ({
    %52 = "tensor.empty"() : () -> tensor<7x16xi32>
    %53 = "tensor.empty"() : () -> tensor<16x13xi32>
    %54 = "arith.constant"() <{value = 3 : i32}> : () -> i32
    %55 = "arith.constant"() <{value = 4 : i32}> : () -> i32
    %56 = "linalg.fill"(%54, %52) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg24: i32, %arg25: i32):
      "linalg.yield"(%arg24) : (i32) -> ()
    }) : (i32, tensor<7x16xi32>) -> tensor<7x16xi32>
    %57 = "linalg.fill"(%55, %53) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg22: i32, %arg23: i32):
      "linalg.yield"(%arg22) : (i32) -> ()
    }) : (i32, tensor<16x13xi32>) -> tensor<16x13xi32>
    %58 = "arith.constant"() <{value = dense<[[1, 8, 15, 22, 29, 36, 43, 50, 57, 64, 71, 78, 85], [2, 9, 16, 23, 30, 37, 44, 51, 58, 65, 72, 79, 86], [3, 10, 17, 24, 31, 38, 45, 52, 59, 66, 73, 80, 87], [4, 11, 18, 25, 32, 39, 46, 53, 60, 67, 74, 81, 88], [5, 12, 19, 26, 33, 40, 47, 54, 61, 68, 75, 82, 89], [6, 13, 20, 27, 34, 41, 48, 55, 62, 69, 76, 83, 90], [7, 14, 21, 28, 35, 42, 49, 56, 63, 70, 77, 84, 91]]> : tensor<7x13xi32>}> : () -> tensor<7x13xi32>
    %59 = "func.call"(%56, %57, %58) <{callee = @matmul_via_mmt4d}> : (tensor<7x16xi32>, tensor<16x13xi32>, tensor<7x13xi32>) -> tensor<7x13xi32>
    %60 = "tensor.cast"(%59) : (tensor<7x13xi32>) -> tensor<*xi32>
    "vector.print"() <{punctuation = #vector.punctuation<newline>, stringLiteral = "--------------------------\0A"}> : () -> ()
    "vector.print"() <{punctuation = #vector.punctuation<newline>, stringLiteral = "RESULT FROM linalg.mmt4d:\0A"}> : () -> ()
    "vector.print"() <{punctuation = #vector.punctuation<newline>, stringLiteral = "--------------------------\0A"}> : () -> ()
    "func.call"(%60) <{callee = @printMemrefI32}> : (tensor<*xi32>) -> ()
    %61 = "func.call"(%56, %57, %58) <{callee = @matmul}> : (tensor<7x16xi32>, tensor<16x13xi32>, tensor<7x13xi32>) -> tensor<7x13xi32>
    %62 = "tensor.cast"(%61) : (tensor<7x13xi32>) -> tensor<*xi32>
    "vector.print"() <{punctuation = #vector.punctuation<newline>, stringLiteral = "\0A--------------------------\0A"}> : () -> ()
    "vector.print"() <{punctuation = #vector.punctuation<newline>, stringLiteral = "RESULT FROM linalg.matmul:\0A"}> : () -> ()
    "vector.print"() <{punctuation = #vector.punctuation<newline>, stringLiteral = "--------------------------\0A"}> : () -> ()
    "func.call"(%62) <{callee = @printMemrefI32}> : (tensor<*xi32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<7x16xi32>, tensor<16x13xi32>, tensor<7x13xi32>) -> tensor<7x13xi32>, sym_name = "matmul", sym_visibility = "private"}> ({
  ^bb0(%arg16: tensor<7x16xi32>, %arg17: tensor<16x13xi32>, %arg18: tensor<7x13xi32>):
    %49 = "linalg.matmul"(%arg16, %arg17, %arg18) <{indexing_maps = [#map, #map1, #map2], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg19: i32, %arg20: i32, %arg21: i32):
      %50 = "arith.muli"(%arg19, %arg20) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
      %51 = "arith.addi"(%arg21, %50) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
      "linalg.yield"(%51) : (i32) -> ()
    }) : (tensor<7x16xi32>, tensor<16x13xi32>, tensor<7x13xi32>) -> tensor<7x13xi32>
    "func.return"(%49) : (tensor<7x13xi32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<7x16xi32>) -> tensor<1x16x8x1xi32>, sym_name = "pack_lhs", sym_visibility = "private"}> ({
  ^bb0(%arg15: tensor<7x16xi32>):
    %46 = "arith.constant"() <{value = 0 : i32}> : () -> i32
    %47 = "tensor.empty"() : () -> tensor<1x16x8x1xi32>
    %48 = "linalg.pack"(%arg15, %47, %46) <{inner_dims_pos = array<i64: 0, 1>, operandSegmentSizes = array<i32: 1, 1, 1, 0>, static_inner_tiles = array<i64: 8, 1>}> : (tensor<7x16xi32>, tensor<1x16x8x1xi32>, i32) -> tensor<1x16x8x1xi32>
    "func.return"(%48) : (tensor<1x16x8x1xi32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<16x13xi32>) -> tensor<?x16x?x1xi32>, sym_name = "pack_rhs", sym_visibility = "private"}> ({
  ^bb0(%arg14: tensor<16x13xi32>):
    %38 = "arith.constant"() <{value = 0 : i32}> : () -> i32
    %39 = "vector.vscale"() : () -> index
    %40 = "arith.constant"() <{value = 8 : index}> : () -> index
    %41 = "arith.muli"(%39, %40) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
    %42 = "arith.constant"() <{value = 13 : index}> : () -> index
    %43 = "arith.ceildivui"(%42, %41) : (index, index) -> index
    %44 = "tensor.empty"(%43, %41) : (index, index) -> tensor<?x16x?x1xi32>
    %45 = "linalg.pack"(%arg14, %44, %38, %41) <{inner_dims_pos = array<i64: 1, 0>, operandSegmentSizes = array<i32: 1, 1, 1, 1>, outer_dims_perm = array<i64: 1, 0>, static_inner_tiles = array<i64: -9223372036854775808, 1>}> : (tensor<16x13xi32>, tensor<?x16x?x1xi32>, i32, index) -> tensor<?x16x?x1xi32>
    "func.return"(%45) : (tensor<?x16x?x1xi32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<7x13xi32>) -> tensor<1x?x8x?xi32>, sym_name = "pack_acc", sym_visibility = "private"}> ({
  ^bb0(%arg13: tensor<7x13xi32>):
    %30 = "arith.constant"() <{value = 0 : i32}> : () -> i32
    %31 = "arith.constant"() <{value = 13 : index}> : () -> index
    %32 = "vector.vscale"() : () -> index
    %33 = "arith.constant"() <{value = 8 : index}> : () -> index
    %34 = "arith.muli"(%32, %33) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
    %35 = "arith.ceildivui"(%31, %34) : (index, index) -> index
    %36 = "tensor.empty"(%35, %34) : (index, index) -> tensor<1x?x8x?xi32>
    %37 = "linalg.pack"(%arg13, %36, %30, %34) <{inner_dims_pos = array<i64: 0, 1>, operandSegmentSizes = array<i32: 1, 1, 1, 1>, outer_dims_perm = array<i64: 0, 1>, static_inner_tiles = array<i64: 8, -9223372036854775808>}> : (tensor<7x13xi32>, tensor<1x?x8x?xi32>, i32, index) -> tensor<1x?x8x?xi32>
    "func.return"(%37) : (tensor<1x?x8x?xi32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<1x?x8x?xi32>) -> tensor<7x13xi32>, sym_name = "unpack_acc", sym_visibility = "private"}> ({
  ^bb0(%arg12: tensor<1x?x8x?xi32>):
    %25 = "vector.vscale"() : () -> index
    %26 = "arith.constant"() <{value = 8 : index}> : () -> index
    %27 = "arith.muli"(%25, %26) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
    %28 = "tensor.empty"() : () -> tensor<7x13xi32>
    %29 = "linalg.unpack"(%arg12, %28, %27) <{inner_dims_pos = array<i64: 0, 1>, outer_dims_perm = array<i64: 0, 1>, static_inner_tiles = array<i64: 8, -9223372036854775808>}> {operandSegmentSizes = array<i32: 1, 1, 0, 1>} : (tensor<1x?x8x?xi32>, tensor<7x13xi32>, index) -> tensor<7x13xi32>
    "func.return"(%29) : (tensor<7x13xi32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<1x16x8x1xi32>) -> (), sym_name = "print_pack_A", sym_visibility = "private"}> ({
  ^bb0(%arg11: tensor<1x16x8x1xi32>):
    %24 = "tensor.cast"(%arg11) : (tensor<1x16x8x1xi32>) -> tensor<*xi32>
    "func.call"(%24) <{callee = @printMemrefI32}> : (tensor<*xi32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<?x16x?x1xi32>) -> (), sym_name = "print_pack_B", sym_visibility = "private"}> ({
  ^bb0(%arg10: tensor<?x16x?x1xi32>):
    %23 = "tensor.cast"(%arg10) : (tensor<?x16x?x1xi32>) -> tensor<*xi32>
    "func.call"(%23) <{callee = @printMemrefI32}> : (tensor<*xi32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<1x?x8x?xi32>) -> (), sym_name = "print_pack_C", sym_visibility = "private"}> ({
  ^bb0(%arg9: tensor<1x?x8x?xi32>):
    %22 = "tensor.cast"(%arg9) : (tensor<1x?x8x?xi32>) -> tensor<*xi32>
    "func.call"(%22) <{callee = @printMemrefI32}> : (tensor<*xi32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<7x16xi32>, tensor<16x13xi32>, tensor<7x13xi32>) -> tensor<7x13xi32>, sym_name = "matmul_via_mmt4d", sym_visibility = "private"}> ({
  ^bb0(%arg3: tensor<7x16xi32>, %arg4: tensor<16x13xi32>, %arg5: tensor<7x13xi32>):
    %15 = "func.call"(%arg3) <{callee = @pack_lhs}> : (tensor<7x16xi32>) -> tensor<1x16x8x1xi32>
    %16 = "func.call"(%arg4) <{callee = @pack_rhs}> : (tensor<16x13xi32>) -> tensor<?x16x?x1xi32>
    %17 = "func.call"(%arg5) <{callee = @pack_acc}> : (tensor<7x13xi32>) -> tensor<1x?x8x?xi32>
    "func.call"(%15) <{callee = @print_pack_A}> : (tensor<1x16x8x1xi32>) -> ()
    "func.call"(%16) <{callee = @print_pack_B}> : (tensor<?x16x?x1xi32>) -> ()
    "func.call"(%17) <{callee = @print_pack_C}> : (tensor<1x?x8x?xi32>) -> ()
    %18 = "linalg.mmt4d"(%15, %16, %17) <{operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg6: i32, %arg7: i32, %arg8: i32):
      %20 = "arith.muli"(%arg6, %arg7) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
      %21 = "arith.addi"(%arg8, %20) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
      "linalg.yield"(%21) : (i32) -> ()
    }) {linalg.memoized_indexing_maps = [#map3, #map4, #map5]} : (tensor<1x16x8x1xi32>, tensor<?x16x?x1xi32>, tensor<1x?x8x?xi32>) -> tensor<1x?x8x?xi32>
    %19 = "func.call"(%18) <{callee = @unpack_acc}> : (tensor<1x?x8x?xi32>) -> tensor<7x13xi32>
    "func.return"(%19) : (tensor<7x13xi32>) -> ()
  }) : () -> ()
  "builtin.module"() <{sym_name = "transforms"}> ({
    "transform.named_sequence"() <{arg_attrs = [{transform.consumed}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg2: !transform.any_op):
      %0 = "transform.collect_matching"(%arg2) <{matcher = @match_mmt4d}> : (!transform.any_op) -> !transform.any_op
      %1 = "transform.get_parent_op"(%0) <{isolated_from_above, nth_parent = 1 : i64}> : (!transform.any_op) -> !transform.op<"func.func">
      %2:5 = "transform.structured.tile_using_for"(%0) <{scalable_sizes = array<i1: false, false, false, false, true, false>, static_sizes = array<i64: 1, 1, 0, 8, 8, 0>}> : (!transform.any_op) -> (!transform.any_op, !transform.any_op, !transform.any_op, !transform.any_op, !transform.any_op)
      %3:3 = "transform.structured.tile_using_for"(%2#0) <{scalable_sizes = array<i1: false, false, false, false, false, false>, static_sizes = array<i64: 0, 0, 1, 0, 0, 1>}> : (!transform.any_op) -> (!transform.any_op, !transform.any_op, !transform.any_op)
      "transform.structured.vectorize"(%3#0) <{assume_dynamic_dims_match_vec_sizes, scalable_sizes = array<i1: false, false, false, false, true, false>, static_vector_sizes = array<i64: 1, 1, 1, 8, 8, 1>}> : (!transform.any_op) -> ()
      "transform.apply_patterns"(%1) <{max_iterations = -1 : i64, max_num_rewrites = -1 : i64}> ({
        "transform.apply_patterns.vector.reduction_to_contract"() : () -> ()
        "transform.apply_patterns.vector.transfer_permutation_patterns"() : () -> ()
      }) : (!transform.op<"func.func">) -> ()
      %4 = "transform.structured.hoist_redundant_vector_transfers"(%1) : (!transform.op<"func.func">) -> !transform.op<"func.func">
      %5 = "transform.structured.match"(%4) <{interface = 2 : i32}> : (!transform.op<"func.func">) -> !transform.any_op
      "transform.apply_licm"(%5) : (!transform.any_op) -> ()
      "transform.loop.hoist_loop_invariant_subsets"(%5) : (!transform.any_op) -> ()
      "transform.apply_patterns"(%4) <{max_iterations = -1 : i64, max_num_rewrites = -1 : i64}> ({
        "transform.apply_patterns.vector.reduction_to_contract"() : () -> ()
        "transform.apply_patterns.vector.cast_away_vector_leading_one_dim"() : () -> ()
        "transform.apply_patterns.canonicalization"() : () -> ()
      }) : (!transform.op<"func.func">) -> ()
      %6 = "transform.structured.match"(%arg2) <{ops = ["linalg.pack"]}> : (!transform.any_op) -> !transform.any_op
      %7 = "transform.structured.match"(%arg2) <{ops = ["linalg.unpack"]}> : (!transform.any_op) -> !transform.any_op
      %8:3 = "transform.structured.tile_using_for"(%6) <{scalable_sizes = array<i1: false, false>, static_sizes = array<i64: 1, 1>}> : (!transform.any_op) -> (!transform.any_op, !transform.any_op, !transform.any_op)
      %9:3 = "transform.structured.tile_using_for"(%7) <{scalable_sizes = array<i1: false, false>, static_sizes = array<i64: 8, 1>}> : (!transform.any_op) -> (!transform.any_op, !transform.any_op, !transform.any_op)
      %10 = "transform.get_parent_op"(%8#0) <{isolated_from_above, nth_parent = 1 : i64}> : (!transform.any_op) -> !transform.op<"func.func">
      "transform.apply_patterns"(%10) <{max_iterations = -1 : i64, max_num_rewrites = -1 : i64}> ({
        "transform.apply_patterns.linalg.decompose_pack_unpack"() : () -> ()
        "transform.apply_patterns.linalg.decompose_pad"() : () -> ()
      }) : (!transform.op<"func.func">) -> ()
      "transform.apply_patterns"(%10) <{max_iterations = -1 : i64, max_num_rewrites = -1 : i64}> ({
        "transform.apply_patterns.tensor.fold_tensor_subset_ops"() : () -> ()
        "transform.apply_patterns.canonicalization"() : () -> ()
      }) : (!transform.op<"func.func">) -> ()
      %11 = "transform.get_parent_op"(%9#0) <{isolated_from_above, nth_parent = 1 : i64}> : (!transform.any_op) -> !transform.op<"func.func">
      "transform.apply_patterns"(%11) <{max_iterations = -1 : i64, max_num_rewrites = -1 : i64}> ({
        "transform.apply_patterns.linalg.decompose_pack_unpack"() : () -> ()
      }) : (!transform.op<"func.func">) -> ()
      "transform.apply_patterns"(%11) <{max_iterations = -1 : i64, max_num_rewrites = -1 : i64}> ({
        "transform.apply_patterns.tensor.fold_tensor_subset_ops"() : () -> ()
        "transform.apply_patterns.canonicalization"() : () -> ()
      }) : (!transform.op<"func.func">) -> ()
      %12 = "transform.bufferization.one_shot_bufferize"(%arg2) <{allow_return_allocs_from_loops = false, allow_unknown_ops = false, bufferize_function_boundaries = true, check_parallel_regions = true, dump_alias_sets = false, memcpy_op = "memref.copy", print_conflicts = false, test_analysis_only = false}> : (!transform.any_op) -> !transform.any_op
      %13 = "transform.collect_matching"(%12) <{matcher = @match_contract}> : (!transform.any_op) -> !transform.any_op
      %14 = "transform.get_parent_op"(%13) <{isolated_from_above, nth_parent = 1 : i64}> : (!transform.any_op) -> !transform.op<"func.func">
      "transform.apply_patterns"(%14) <{max_iterations = -1 : i64, max_num_rewrites = -1 : i64}> ({
        "transform.apply_patterns.tensor.fold_tensor_subset_ops"() : () -> ()
        "transform.apply_patterns.vector.drop_inner_most_unit_dims_from_xfer_ops"() : () -> ()
        "transform.apply_patterns.canonicalization"() : () -> ()
      }) : (!transform.op<"func.func">) -> ()
      "transform.apply_patterns"(%14) <{max_iterations = -1 : i64, max_num_rewrites = -1 : i64}> ({
        "transform.apply_patterns.vector.lower_contraction"() <{lowering_strategy = 2 : i32}> : () -> ()
        "transform.apply_patterns.vector.lower_outerproduct"() : () -> ()
      }) : (!transform.op<"func.func">) -> ()
      "transform.yield"() : () -> ()
    }) : () -> ()
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> !transform.any_op, sym_name = "match_mmt4d"}> ({
    ^bb0(%arg1: !transform.any_op):
      "transform.match.operation_name"(%arg1) <{op_names = ["linalg.mmt4d"]}> : (!transform.any_op) -> ()
      "transform.yield"(%arg1) : (!transform.any_op) -> ()
    }) : () -> ()
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> !transform.any_op, sym_name = "match_contract"}> ({
    ^bb0(%arg0: !transform.any_op):
      "transform.match.operation_name"(%arg0) <{op_names = ["vector.contract"]}> : (!transform.any_op) -> ()
      "transform.yield"(%arg0) : (!transform.any_op) -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
  "func.func"() <{function_type = (tensor<*xi32>) -> (), sym_name = "printMemrefI32", sym_visibility = "private"}> ({
  }) : () -> ()
}) : () -> ()

