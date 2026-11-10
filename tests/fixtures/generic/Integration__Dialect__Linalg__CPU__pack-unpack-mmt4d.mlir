#map = affine_map<(d0, d1, d2) -> (d0, d2)>
#map1 = affine_map<(d0, d1, d2) -> (d2, d1)>
#map2 = affine_map<(d0, d1, d2) -> (d0, d1)>
#map3 = affine_map<(d0, d1, d2, d3, d4, d5) -> (d0, d2, d3, d5)>
#map4 = affine_map<(d0, d1, d2, d3, d4, d5) -> (d1, d2, d4, d5)>
#map5 = affine_map<(d0, d1, d2, d3, d4, d5) -> (d0, d1, d3, d4)>
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "main"}> ({
    %25 = "tensor.empty"() : () -> tensor<7x16xi32>
    %26 = "tensor.empty"() : () -> tensor<16x13xi32>
    %27 = "arith.constant"() <{value = 3 : i32}> : () -> i32
    %28 = "arith.constant"() <{value = 4 : i32}> : () -> i32
    %29 = "linalg.fill"(%27, %25) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg16: i32, %arg17: i32):
      "linalg.yield"(%arg16) : (i32) -> ()
    }) : (i32, tensor<7x16xi32>) -> tensor<7x16xi32>
    %30 = "linalg.fill"(%28, %26) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg14: i32, %arg15: i32):
      "linalg.yield"(%arg14) : (i32) -> ()
    }) : (i32, tensor<16x13xi32>) -> tensor<16x13xi32>
    %31 = "arith.constant"() <{value = dense<[[1, 8, 15, 22, 29, 36, 43, 50, 57, 64, 71, 78, 85], [2, 9, 16, 23, 30, 37, 44, 51, 58, 65, 72, 79, 86], [3, 10, 17, 24, 31, 38, 45, 52, 59, 66, 73, 80, 87], [4, 11, 18, 25, 32, 39, 46, 53, 60, 67, 74, 81, 88], [5, 12, 19, 26, 33, 40, 47, 54, 61, 68, 75, 82, 89], [6, 13, 20, 27, 34, 41, 48, 55, 62, 69, 76, 83, 90], [7, 14, 21, 28, 35, 42, 49, 56, 63, 70, 77, 84, 91]]> : tensor<7x13xi32>}> : () -> tensor<7x13xi32>
    %32 = "func.call"(%29, %30, %31) <{callee = @mmt4d}> : (tensor<7x16xi32>, tensor<16x13xi32>, tensor<7x13xi32>) -> tensor<7x13xi32>
    %33 = "tensor.cast"(%32) : (tensor<7x13xi32>) -> tensor<*xi32>
    "func.call"(%33) <{callee = @printMemrefI32}> : (tensor<*xi32>) -> ()
    %34 = "func.call"(%29, %30, %31) <{callee = @matmul}> : (tensor<7x16xi32>, tensor<16x13xi32>, tensor<7x13xi32>) -> tensor<7x13xi32>
    %35 = "tensor.cast"(%34) : (tensor<7x13xi32>) -> tensor<*xi32>
    "func.call"(%35) <{callee = @printMemrefI32}> : (tensor<*xi32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<7x16xi32>, tensor<16x13xi32>, tensor<7x13xi32>) -> tensor<7x13xi32>, sym_name = "matmul", sym_visibility = "private"}> ({
  ^bb0(%arg8: tensor<7x16xi32>, %arg9: tensor<16x13xi32>, %arg10: tensor<7x13xi32>):
    %22 = "linalg.matmul"(%arg8, %arg9, %arg10) <{indexing_maps = [#map, #map1, #map2], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg11: i32, %arg12: i32, %arg13: i32):
      %23 = "arith.muli"(%arg11, %arg12) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
      %24 = "arith.addi"(%arg13, %23) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
      "linalg.yield"(%24) : (i32) -> ()
    }) : (tensor<7x16xi32>, tensor<16x13xi32>, tensor<7x13xi32>) -> tensor<7x13xi32>
    "func.return"(%22) : (tensor<7x13xi32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<7x16xi32>, tensor<16x13xi32>, tensor<7x13xi32>) -> tensor<7x13xi32>, sym_name = "mmt4d", sym_visibility = "private"}> ({
  ^bb0(%arg2: tensor<7x16xi32>, %arg3: tensor<16x13xi32>, %arg4: tensor<7x13xi32>):
    %10 = "arith.constant"() <{value = 0 : i32}> : () -> i32
    %11 = "tensor.empty"() : () -> tensor<1x16x8x1xi32>
    %12 = "tensor.empty"() : () -> tensor<2x16x8x1xi32>
    %13 = "tensor.empty"() : () -> tensor<1x2x8x8xi32>
    %14 = "linalg.pack"(%arg2, %11, %10) <{inner_dims_pos = array<i64: 0, 1>, operandSegmentSizes = array<i32: 1, 1, 1, 0>, static_inner_tiles = array<i64: 8, 1>}> : (tensor<7x16xi32>, tensor<1x16x8x1xi32>, i32) -> tensor<1x16x8x1xi32>
    %15 = "linalg.pack"(%arg3, %12, %10) <{inner_dims_pos = array<i64: 1, 0>, operandSegmentSizes = array<i32: 1, 1, 1, 0>, outer_dims_perm = array<i64: 1, 0>, static_inner_tiles = array<i64: 8, 1>}> : (tensor<16x13xi32>, tensor<2x16x8x1xi32>, i32) -> tensor<2x16x8x1xi32>
    %16 = "linalg.pack"(%arg4, %13, %10) <{inner_dims_pos = array<i64: 0, 1>, operandSegmentSizes = array<i32: 1, 1, 1, 0>, outer_dims_perm = array<i64: 0, 1>, static_inner_tiles = array<i64: 8, 8>}> : (tensor<7x13xi32>, tensor<1x2x8x8xi32>, i32) -> tensor<1x2x8x8xi32>
    %17 = "linalg.mmt4d"(%14, %15, %16) <{operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg5: i32, %arg6: i32, %arg7: i32):
      %20 = "arith.muli"(%arg5, %arg6) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
      %21 = "arith.addi"(%arg7, %20) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
      "linalg.yield"(%21) : (i32) -> ()
    }) {linalg.memoized_indexing_maps = [#map3, #map4, #map5]} : (tensor<1x16x8x1xi32>, tensor<2x16x8x1xi32>, tensor<1x2x8x8xi32>) -> tensor<1x2x8x8xi32>
    %18 = "tensor.empty"() : () -> tensor<7x13xi32>
    %19 = "linalg.unpack"(%17, %18) <{inner_dims_pos = array<i64: 0, 1>, outer_dims_perm = array<i64: 0, 1>, static_inner_tiles = array<i64: 8, 8>}> {operandSegmentSizes = array<i32: 1, 1, 0, 0>} : (tensor<1x2x8x8xi32>, tensor<7x13xi32>) -> tensor<7x13xi32>
    "func.return"(%19) : (tensor<7x13xi32>) -> ()
  }) : () -> ()
  "builtin.module"() <{sym_name = "transforms"}> ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg1: !transform.any_op):
      %0 = "transform.collect_matching"(%arg1) <{matcher = @match_mmt4d}> : (!transform.any_op) -> !transform.any_op
      %1 = "transform.get_parent_op"(%0) <{isolated_from_above, nth_parent = 1 : i64}> : (!transform.any_op) -> !transform.op<"func.func">
      %2:5 = "transform.structured.tile_using_for"(%0) <{scalable_sizes = array<i1: false, false, false, false, false, false>, static_sizes = array<i64: 1, 1, 0, 8, 8, 0>}> : (!transform.any_op) -> (!transform.any_op, !transform.any_op, !transform.any_op, !transform.any_op, !transform.any_op)
      %3:3 = "transform.structured.tile_using_for"(%2#0) <{scalable_sizes = array<i1: false, false, false, false, false, false>, static_sizes = array<i64: 0, 0, 1, 0, 0, 1>}> : (!transform.any_op) -> (!transform.any_op, !transform.any_op, !transform.any_op)
      "transform.structured.vectorize"(%3#0) : (!transform.any_op) -> ()
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
      %6 = "transform.structured.match"(%4) <{ops = ["linalg.pack"]}> : (!transform.op<"func.func">) -> !transform.op<"linalg.pack">
      %7:3 = "transform.structured.lower_pack"(%6) <{lowerPadLikeWithInsertSlice = true}> : (!transform.op<"linalg.pack">) -> (!transform.op<"tensor.pad">, !transform.op<"tensor.expand_shape">, !transform.op<"linalg.transpose">)
      %8 = "transform.structured.match"(%4) <{ops = ["linalg.unpack"]}> : (!transform.op<"func.func">) -> !transform.op<"linalg.unpack">
      %9:5 = "transform.structured.lower_unpack"(%8) <{lowerUnpadLikeWithExtractSlice = true}> : (!transform.op<"linalg.unpack">) -> (!transform.op<"tensor.empty">, !transform.op<"linalg.transpose">, !transform.op<"tensor.collapse_shape">, !transform.op<"tensor.extract_slice">, !transform.op<"linalg.copy">)
      "transform.yield"() : () -> ()
    }) : () -> ()
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> !transform.any_op, sym_name = "match_mmt4d"}> ({
    ^bb0(%arg0: !transform.any_op):
      "transform.match.operation_name"(%arg0) <{op_names = ["linalg.mmt4d"]}> : (!transform.any_op) -> ()
      "transform.yield"(%arg0) : (!transform.any_op) -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
  "func.func"() <{function_type = (tensor<*xi32>) -> (), sym_name = "printMemrefI32", sym_visibility = "private"}> ({
  }) : () -> ()
}) : () -> ()

