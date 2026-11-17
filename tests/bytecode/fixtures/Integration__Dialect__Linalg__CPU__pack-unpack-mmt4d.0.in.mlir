"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "main"}> ({
    %25 = "tensor.empty"() : () -> tensor<7x16xi32> loc("<stdin>":9:11)
    %26 = "tensor.empty"() : () -> tensor<16x13xi32> loc("<stdin>":10:11)
    %27 = "arith.constant"() <{value = 3 : i32}> : () -> i32 loc("<stdin>":11:11)
    %28 = "arith.constant"() <{value = 4 : i32}> : () -> i32 loc("<stdin>":12:11)
    %29 = "linalg.fill"(%27, %25) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg16: i32 loc("<stdin>":14:10), %arg17: i32 loc("<stdin>":14:23)):
      "linalg.yield"(%arg16) : (i32) -> () loc("<stdin>":15:7)
    }) : (i32, tensor<7x16xi32>) -> tensor<7x16xi32> loc("<stdin>":13:11)
    %30 = "linalg.fill"(%28, %26) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg14: i32 loc("<stdin>":18:10), %arg15: i32 loc("<stdin>":18:23)):
      "linalg.yield"(%arg14) : (i32) -> () loc("<stdin>":19:7)
    }) : (i32, tensor<16x13xi32>) -> tensor<16x13xi32> loc("<stdin>":17:11)
    %31 = "arith.constant"() <{value = dense<[[1, 8, 15, 22, 29, 36, 43, 50, 57, 64, 71, 78, 85], [2, 9, 16, 23, 30, 37, 44, 51, 58, 65, 72, 79, 86], [3, 10, 17, 24, 31, 38, 45, 52, 59, 66, 73, 80, 87], [4, 11, 18, 25, 32, 39, 46, 53, 60, 67, 74, 81, 88], [5, 12, 19, 26, 33, 40, 47, 54, 61, 68, 75, 82, 89], [6, 13, 20, 27, 34, 41, 48, 55, 62, 69, 76, 83, 90], [7, 14, 21, 28, 35, 42, 49, 56, 63, 70, 77, 84, 91]]> : tensor<7x13xi32>}> : () -> tensor<7x13xi32> loc("<stdin>":21:11)
    %32 = "func.call"(%29, %30, %31) <{callee = @mmt4d}> : (tensor<7x16xi32>, tensor<16x13xi32>, tensor<7x13xi32>) -> tensor<7x13xi32> loc("<stdin>":22:11)
    %33 = "tensor.cast"(%32) : (tensor<7x13xi32>) -> tensor<*xi32> loc("<stdin>":23:11)
    "func.call"(%33) <{callee = @printMemrefI32}> : (tensor<*xi32>) -> () loc("<stdin>":24:5)
    %34 = "func.call"(%29, %30, %31) <{callee = @matmul}> : (tensor<7x16xi32>, tensor<16x13xi32>, tensor<7x13xi32>) -> tensor<7x13xi32> loc("<stdin>":25:11)
    %35 = "tensor.cast"(%34) : (tensor<7x13xi32>) -> tensor<*xi32> loc("<stdin>":26:11)
    "func.call"(%35) <{callee = @printMemrefI32}> : (tensor<*xi32>) -> () loc("<stdin>":27:5)
    "func.return"() : () -> () loc("<stdin>":28:5)
  }) : () -> () loc("<stdin>":8:3)
  "func.func"() <{function_type = (tensor<7x16xi32>, tensor<16x13xi32>, tensor<7x13xi32>) -> tensor<7x13xi32>, sym_name = "matmul", sym_visibility = "private"}> ({
  ^bb0(%arg8: tensor<7x16xi32> loc("<stdin>":31:8), %arg9: tensor<16x13xi32> loc("<stdin>":31:33), %arg10: tensor<7x13xi32> loc("<stdin>":31:59)):
    %22 = "linalg.matmul"(%arg8, %arg9, %arg10) <{indexing_maps = [affine_map<(d0, d1, d2) -> (d0, d2)>, affine_map<(d0, d1, d2) -> (d2, d1)>, affine_map<(d0, d1, d2) -> (d0, d1)>], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg11: i32 loc("<stdin>":33:10), %arg12: i32 loc("<stdin>":33:23), %arg13: i32 loc("<stdin>":33:36)):
      %23 = "arith.muli"(%arg11, %arg12) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32 loc("<stdin>":34:13)
      %24 = "arith.addi"(%arg13, %23) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32 loc("<stdin>":35:13)
      "linalg.yield"(%24) : (i32) -> () loc("<stdin>":36:7)
    }) : (tensor<7x16xi32>, tensor<16x13xi32>, tensor<7x13xi32>) -> tensor<7x13xi32> loc("<stdin>":32:11)
    "func.return"(%22) : (tensor<7x13xi32>) -> () loc("<stdin>":38:5)
  }) : () -> () loc("<stdin>":30:3)
  "func.func"() <{function_type = (tensor<7x16xi32>, tensor<16x13xi32>, tensor<7x13xi32>) -> tensor<7x13xi32>, sym_name = "mmt4d", sym_visibility = "private"}> ({
  ^bb0(%arg2: tensor<7x16xi32> loc("<stdin>":41:8), %arg3: tensor<16x13xi32> loc("<stdin>":41:33), %arg4: tensor<7x13xi32> loc("<stdin>":41:59)):
    %10 = "arith.constant"() <{value = 0 : i32}> : () -> i32 loc("<stdin>":42:11)
    %11 = "tensor.empty"() : () -> tensor<1x16x8x1xi32> loc("<stdin>":43:11)
    %12 = "tensor.empty"() : () -> tensor<2x16x8x1xi32> loc("<stdin>":44:11)
    %13 = "tensor.empty"() : () -> tensor<1x2x8x8xi32> loc("<stdin>":45:11)
    %14 = "linalg.pack"(%arg2, %11, %10) <{inner_dims_pos = array<i64: 0, 1>, operandSegmentSizes = array<i32: 1, 1, 1, 0>, static_inner_tiles = array<i64: 8, 1>}> : (tensor<7x16xi32>, tensor<1x16x8x1xi32>, i32) -> tensor<1x16x8x1xi32> loc("<stdin>":46:11)
    %15 = "linalg.pack"(%arg3, %12, %10) <{inner_dims_pos = array<i64: 1, 0>, operandSegmentSizes = array<i32: 1, 1, 1, 0>, outer_dims_perm = array<i64: 1, 0>, static_inner_tiles = array<i64: 8, 1>}> : (tensor<16x13xi32>, tensor<2x16x8x1xi32>, i32) -> tensor<2x16x8x1xi32> loc("<stdin>":47:11)
    %16 = "linalg.pack"(%arg4, %13, %10) <{inner_dims_pos = array<i64: 0, 1>, operandSegmentSizes = array<i32: 1, 1, 1, 0>, outer_dims_perm = array<i64: 0, 1>, static_inner_tiles = array<i64: 8, 8>}> : (tensor<7x13xi32>, tensor<1x2x8x8xi32>, i32) -> tensor<1x2x8x8xi32> loc("<stdin>":48:11)
    %17 = "linalg.mmt4d"(%14, %15, %16) <{operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg5: i32 loc("<stdin>":50:10), %arg6: i32 loc("<stdin>":50:22), %arg7: i32 loc("<stdin>":50:34)):
      %20 = "arith.muli"(%arg5, %arg6) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32 loc("<stdin>":51:13)
      %21 = "arith.addi"(%arg7, %20) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32 loc("<stdin>":52:13)
      "linalg.yield"(%21) : (i32) -> () loc("<stdin>":53:7)
    }) {linalg.memoized_indexing_maps = [affine_map<(d0, d1, d2, d3, d4, d5) -> (d0, d2, d3, d5)>, affine_map<(d0, d1, d2, d3, d4, d5) -> (d1, d2, d4, d5)>, affine_map<(d0, d1, d2, d3, d4, d5) -> (d0, d1, d3, d4)>]} : (tensor<1x16x8x1xi32>, tensor<2x16x8x1xi32>, tensor<1x2x8x8xi32>) -> tensor<1x2x8x8xi32> loc("<stdin>":49:11)
    %18 = "tensor.empty"() : () -> tensor<7x13xi32> loc("<stdin>":55:11)
    %19 = "linalg.unpack"(%17, %18) <{inner_dims_pos = array<i64: 0, 1>, outer_dims_perm = array<i64: 0, 1>, static_inner_tiles = array<i64: 8, 8>}> {operandSegmentSizes = array<i32: 1, 1, 0, 0>} : (tensor<1x2x8x8xi32>, tensor<7x13xi32>) -> tensor<7x13xi32> loc("<stdin>":56:11)
    "func.return"(%19) : (tensor<7x13xi32>) -> () loc("<stdin>":57:5)
  }) : () -> () loc("<stdin>":40:3)
  "builtin.module"() <{sym_name = "transforms"}> ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg1: !transform.any_op loc("<stdin>":61:10)):
      %0 = "transform.collect_matching"(%arg1) <{matcher = @match_mmt4d}> : (!transform.any_op) -> !transform.any_op loc("<stdin>":62:12)
      %1 = "transform.get_parent_op"(%0) <{isolated_from_above, nth_parent = 1 : i64}> : (!transform.any_op) -> !transform.op<"func.func"> loc("<stdin>":63:12)
      %2:5 = "transform.structured.tile_using_for"(%0) <{scalable_sizes = array<i1: false, false, false, false, false, false>, static_sizes = array<i64: 1, 1, 0, 8, 8, 0>}> : (!transform.any_op) -> (!transform.any_op, !transform.any_op, !transform.any_op, !transform.any_op, !transform.any_op) loc("<stdin>":64:14)
      %3:3 = "transform.structured.tile_using_for"(%2#0) <{scalable_sizes = array<i1: false, false, false, false, false, false>, static_sizes = array<i64: 0, 0, 1, 0, 0, 1>}> : (!transform.any_op) -> (!transform.any_op, !transform.any_op, !transform.any_op) loc("<stdin>":65:14)
      "transform.structured.vectorize"(%3#0) : (!transform.any_op) -> () loc("<stdin>":66:7)
      "transform.apply_patterns"(%1) <{max_iterations = -1 : i64, max_num_rewrites = -1 : i64}> ({
        "transform.apply_patterns.vector.reduction_to_contract"() : () -> () loc("<stdin>":68:9)
        "transform.apply_patterns.vector.transfer_permutation_patterns"() : () -> () loc("<stdin>":69:9)
      }) : (!transform.op<"func.func">) -> () loc("<stdin>":67:7)
      %4 = "transform.structured.hoist_redundant_vector_transfers"(%1) : (!transform.op<"func.func">) -> !transform.op<"func.func"> loc("<stdin>":71:12)
      %5 = "transform.structured.match"(%4) <{interface = 2 : i32}> : (!transform.op<"func.func">) -> !transform.any_op loc("<stdin>":72:12)
      "transform.apply_licm"(%5) : (!transform.any_op) -> () loc("<stdin>":73:7)
      "transform.loop.hoist_loop_invariant_subsets"(%5) : (!transform.any_op) -> () loc("<stdin>":74:7)
      "transform.apply_patterns"(%4) <{max_iterations = -1 : i64, max_num_rewrites = -1 : i64}> ({
        "transform.apply_patterns.vector.reduction_to_contract"() : () -> () loc("<stdin>":76:9)
        "transform.apply_patterns.vector.cast_away_vector_leading_one_dim"() : () -> () loc("<stdin>":77:9)
        "transform.apply_patterns.canonicalization"() : () -> () loc("<stdin>":78:9)
      }) : (!transform.op<"func.func">) -> () loc("<stdin>":75:7)
      %6 = "transform.structured.match"(%4) <{ops = ["linalg.pack"]}> : (!transform.op<"func.func">) -> !transform.op<"linalg.pack"> loc("<stdin>":80:12)
      %7:3 = "transform.structured.lower_pack"(%6) <{lowerPadLikeWithInsertSlice = true}> : (!transform.op<"linalg.pack">) -> (!transform.op<"tensor.pad">, !transform.op<"tensor.expand_shape">, !transform.op<"linalg.transpose">) loc("<stdin>":81:14)
      %8 = "transform.structured.match"(%4) <{ops = ["linalg.unpack"]}> : (!transform.op<"func.func">) -> !transform.op<"linalg.unpack"> loc("<stdin>":82:12)
      %9:5 = "transform.structured.lower_unpack"(%8) <{lowerUnpadLikeWithExtractSlice = true}> : (!transform.op<"linalg.unpack">) -> (!transform.op<"tensor.empty">, !transform.op<"linalg.transpose">, !transform.op<"tensor.collapse_shape">, !transform.op<"tensor.extract_slice">, !transform.op<"linalg.copy">) loc("<stdin>":83:14)
      "transform.yield"() : () -> () loc("<stdin>":84:7)
    }) : () -> () loc("<stdin>":60:5)
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> !transform.any_op, sym_name = "match_mmt4d"}> ({
    ^bb0(%arg0: !transform.any_op loc("<stdin>":87:10)):
      "transform.match.operation_name"(%arg0) <{op_names = ["linalg.mmt4d"]}> : (!transform.any_op) -> () loc("<stdin>":88:7)
      "transform.yield"(%arg0) : (!transform.any_op) -> () loc("<stdin>":89:7)
    }) : () -> () loc("<stdin>":86:5)
  }) {transform.with_named_sequence} : () -> () loc("<stdin>":59:3)
  "func.func"() <{function_type = (tensor<*xi32>) -> (), sym_name = "printMemrefI32", sym_visibility = "private"}> ({
  }) : () -> () loc("<stdin>":92:3)
}) : () -> () loc("<stdin>":7:1)
