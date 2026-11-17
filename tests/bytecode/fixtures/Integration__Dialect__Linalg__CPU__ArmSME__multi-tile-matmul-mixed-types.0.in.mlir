"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x?xi8>, tensor<?x?xi8>, tensor<?x?xi32>) -> (), sym_name = "matmul_i8_to_i32"}> ({
  ^bb0(%arg5: tensor<?x?xi8> loc("<stdin>":6:8), %arg6: tensor<?x?xi8> loc("<stdin>":6:31), %arg7: tensor<?x?xi32> loc("<stdin>":6:54)):
    %14 = "linalg.matmul"(%arg5, %arg6, %arg7) <{indexing_maps = [affine_map<(d0, d1, d2) -> (d0, d2)>, affine_map<(d0, d1, d2) -> (d2, d1)>, affine_map<(d0, d1, d2) -> (d0, d1)>], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg8: i8 loc("<stdin>":8:10), %arg9: i8 loc("<stdin>":8:21), %arg10: i32 loc("<stdin>":8:32)):
      %16 = "arith.extsi"(%arg8) : (i8) -> i32 loc("<stdin>":9:13)
      %17 = "arith.extsi"(%arg9) : (i8) -> i32 loc("<stdin>":10:13)
      %18 = "arith.muli"(%16, %17) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32 loc("<stdin>":11:13)
      %19 = "arith.addi"(%arg10, %18) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32 loc("<stdin>":12:13)
      "linalg.yield"(%19) : (i32) -> () loc("<stdin>":13:7)
    }) : (tensor<?x?xi8>, tensor<?x?xi8>, tensor<?x?xi32>) -> tensor<?x?xi32> loc("<stdin>":7:11)
    %15 = "tensor.cast"(%14) : (tensor<?x?xi32>) -> tensor<*xi32> loc("<stdin>":15:11)
    "func.call"(%15) <{callee = @printMemrefI32}> : (tensor<*xi32>) -> () loc("<stdin>":16:5)
    "func.return"() : () -> () loc("<stdin>":17:5)
  }) : () -> () loc("<stdin>":5:3)
  "func.func"() <{function_type = () -> (), sym_name = "main"}> ({
    %4 = "arith.constant"() <{value = 128 : i32}> : () -> i32 loc("<stdin>":20:10)
    "func.call"(%4) <{callee = @setArmSVLBits}> : (i32) -> () loc("<stdin>":21:5)
    %5 = "arith.constant"() <{value = 0 : i32}> : () -> i32 loc("<stdin>":22:10)
    %6 = "arith.constant"() <{value = 7 : index}> : () -> index loc("<stdin>":23:10)
    %7 = "arith.constant"() <{value = dense<[[1, 8, 15, 22, 29, 36, 43, 50, 57, 64, 71, 78, 85], [2, 9, 16, 23, 30, 37, 44, 51, 58, 65, 72, 79, 86], [3, 10, 17, 24, 31, 38, 45, 52, 59, 66, 73, 80, 87], [4, 11, 18, 25, 32, 39, 46, 53, 60, 67, 74, 81, 88], [5, 12, 19, 26, 33, 40, 47, 54, 61, 68, 75, 82, 89], [6, 13, 20, 27, 34, 41, 48, 55, 62, 69, 76, 83, 90], [7, 14, 21, 28, 35, 42, 49, 56, 63, 70, 77, 84, 91]]> : tensor<7x13xi8>}> : () -> tensor<7x13xi8> loc("<stdin>":24:10)
    %8 = "tensor.empty"() : () -> tensor<13x7xi8> loc("<stdin>":25:10)
    %9 = "linalg.transpose"(%7, %8) <{permutation = array<i64: 1, 0>}> ({
    ^bb0(%arg3: i8 loc("<stdin>":27:10), %arg4: i8 loc("<stdin>":27:21)):
      "linalg.yield"(%arg3) : (i8) -> () loc("<stdin>":28:7)
    }) : (tensor<7x13xi8>, tensor<13x7xi8>) -> tensor<13x7xi8> loc("<stdin>":26:10)
    %10 = "tensor.cast"(%7) : (tensor<7x13xi8>) -> tensor<?x?xi8> loc("<stdin>":30:11)
    %11 = "tensor.cast"(%9) : (tensor<13x7xi8>) -> tensor<?x?xi8> loc("<stdin>":31:11)
    %12 = "bufferization.alloc_tensor"(%6, %6) <{operandSegmentSizes = array<i32: 2, 0, 0>}> : (index, index) -> tensor<?x?xi32> loc("<stdin>":32:11)
    %13 = "linalg.fill"(%5, %12) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg1: i32 loc("<stdin>":34:10), %arg2: i32 loc("<stdin>":34:22)):
      "linalg.yield"(%arg1) : (i32) -> () loc("<stdin>":35:7)
    }) : (i32, tensor<?x?xi32>) -> tensor<?x?xi32> loc("<stdin>":33:11)
    "func.call"(%10, %11, %13) <{callee = @matmul_i8_to_i32}> : (tensor<?x?xi8>, tensor<?x?xi8>, tensor<?x?xi32>) -> () loc("<stdin>":37:5)
    "func.return"() : () -> () loc("<stdin>":38:5)
  }) : () -> () loc("<stdin>":19:3)
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.consumed}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op loc("<stdin>":42:10)):
      %0 = "transform.structured.match"(%arg0) <{ops = ["linalg.matmul"]}> : (!transform.any_op) -> !transform.any_op loc("<stdin>":43:12)
      %1:4 = "transform.structured.tile_using_for"(%0) <{scalable_sizes = array<i1: true, true, false>, static_sizes = array<i64: 8, 8, 4>}> : (!transform.any_op) -> (!transform.any_op, !transform.op<"scf.for">, !transform.op<"scf.for">, !transform.op<"scf.for">) loc("<stdin>":44:14)
      "transform.structured.vectorize"(%1#0) <{scalable_sizes = array<i1: true, true, false>, static_vector_sizes = array<i64: 8, 8, 4>}> : (!transform.any_op) -> () loc("<stdin>":45:7)
      %2 = "transform.bufferization.one_shot_bufferize"(%arg0) <{allow_return_allocs_from_loops = false, allow_unknown_ops = false, bufferize_function_boundaries = true, check_parallel_regions = true, dump_alias_sets = false, memcpy_op = "memref.copy", print_conflicts = false, test_analysis_only = false}> : (!transform.any_op) -> !transform.any_op loc("<stdin>":46:12)
      %3 = "transform.structured.match"(%2) <{ops = ["func.func"]}> : (!transform.any_op) -> !transform.any_op loc("<stdin>":47:12)
      "transform.apply_patterns"(%3) <{max_iterations = -1 : i64, max_num_rewrites = -1 : i64}> ({
        "transform.apply_patterns.vector.lower_masked_transfers"() : () -> () loc("<stdin>":49:9)
        "transform.apply_patterns.vector.transfer_permutation_patterns"() : () -> () loc("<stdin>":50:9)
        "transform.apply_patterns.vector.reduction_to_contract"() : () -> () loc("<stdin>":51:9)
        "transform.apply_patterns.vector.sink_ops"() : () -> () loc("<stdin>":52:9)
      }) : (!transform.any_op) -> () loc("<stdin>":48:7)
      "transform.apply_patterns"(%3) <{max_iterations = -1 : i64, max_num_rewrites = -1 : i64}> ({
        "transform.apply_patterns.vector.lower_contraction"() <{lowering_strategy = 2 : i32}> : () -> () loc("<stdin>":55:9)
        "transform.apply_patterns.vector.lower_masks"() : () -> () loc("<stdin>":56:9)
        "transform.apply_patterns.vector.rank_reducing_subview_patterns"() : () -> () loc("<stdin>":57:9)
      }) : (!transform.any_op) -> () loc("<stdin>":54:7)
      "transform.yield"() : () -> () loc("<stdin>":59:7)
    }) : () -> () loc("<stdin>":41:5)
  }) {transform.with_named_sequence} : () -> () loc("<stdin>":40:3)
  "func.func"() <{function_type = (tensor<*xi32>) -> (), sym_name = "printMemrefI32", sym_visibility = "private"}> ({
  }) : () -> () loc("<stdin>":62:3)
  "func.func"() <{function_type = (i32) -> (), sym_name = "setArmSVLBits", sym_visibility = "private"}> ({
  }) : () -> () loc("<stdin>":64:3)
}) : () -> () loc("<stdin>":4:1)
