#map = affine_map<(d0, d1, d2, d3, d4, d5) -> (d0, d2, d3, d5)>
#map1 = affine_map<(d0, d1, d2, d3, d4, d5) -> (d1, d2, d4, d5)>
#map2 = affine_map<(d0, d1, d2, d3, d4, d5) -> (d0, d1, d3, d4)>
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "mmt4d"}> ({
    %6 = "tensor.empty"() : () -> tensor<2x2x3x1xi32>
    %7 = "tensor.empty"() : () -> tensor<2x2x3x1xi32>
    %8 = "tensor.empty"() : () -> tensor<2x2x3x3xi32>
    %9 = "arith.constant"() <{value = dense<[[[[1, 2, 3], [4, 5, 6], [7, 8, 9]], [[11, 12, 13], [14, 15, 16], [17, 18, 19]]], [[[21, 22, 23], [24, 25, 26], [27, 28, 29]], [[31, 32, 33], [34, 35, 36], [37, 38, 39]]]]> : tensor<2x2x3x3xi32>}> : () -> tensor<2x2x3x3xi32>
    %10 = "arith.constant"() <{value = 3 : i32}> : () -> i32
    %11 = "arith.constant"() <{value = 4 : i32}> : () -> i32
    %12 = "linalg.fill"(%10, %6) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg7: i32, %arg8: i32):
      "linalg.yield"(%arg7) : (i32) -> ()
    }) : (i32, tensor<2x2x3x1xi32>) -> tensor<2x2x3x1xi32>
    %13 = "linalg.fill"(%11, %7) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg5: i32, %arg6: i32):
      "linalg.yield"(%arg5) : (i32) -> ()
    }) : (i32, tensor<2x2x3x1xi32>) -> tensor<2x2x3x1xi32>
    %14 = "linalg.mmt4d"(%12, %13, %9) <{operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg2: i32, %arg3: i32, %arg4: i32):
      %16 = "arith.muli"(%arg2, %arg3) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
      %17 = "arith.addi"(%arg4, %16) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
      "linalg.yield"(%17) : (i32) -> ()
    }) {linalg.memoized_indexing_maps = [#map, #map1, #map2]} : (tensor<2x2x3x1xi32>, tensor<2x2x3x1xi32>, tensor<2x2x3x3xi32>) -> tensor<2x2x3x3xi32>
    %15 = "tensor.cast"(%14) : (tensor<2x2x3x3xi32>) -> tensor<*xi32>
    "func.call"(%15) <{callee = @printMemrefI32}> : (tensor<*xi32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "builtin.module"() <{sym_name = "transforms"}> ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg1: !transform.any_op):
      %0 = "transform.collect_matching"(%arg1) <{matcher = @match_mmt4d}> : (!transform.any_op) -> !transform.any_op
      %1 = "transform.get_parent_op"(%0) <{isolated_from_above, nth_parent = 1 : i64}> : (!transform.any_op) -> !transform.op<"func.func">
      %2:5 = "transform.structured.tile_using_for"(%0) <{scalable_sizes = array<i1: false, false, false, false, false, false>, static_sizes = array<i64: 1, 1, 0, 3, 3, 0>}> : (!transform.any_op) -> (!transform.any_op, !transform.any_op, !transform.any_op, !transform.any_op, !transform.any_op)
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

