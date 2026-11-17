"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x?xf32>, tensor<?x?xf32>, tensor<?x?xf32>) -> (), sym_name = "matmul"}> ({
  ^bb0(%arg5: tensor<?x?xf32> loc("<stdin>":6:8), %arg6: tensor<?x?xf32> loc("<stdin>":6:32), %arg7: tensor<?x?xf32> loc("<stdin>":6:56)):
    %15 = "linalg.matmul"(%arg5, %arg6, %arg7) <{indexing_maps = [affine_map<(d0, d1, d2) -> (d0, d2)>, affine_map<(d0, d1, d2) -> (d2, d1)>, affine_map<(d0, d1, d2) -> (d0, d1)>], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg8: f32 loc("<stdin>":8:10), %arg9: f32 loc("<stdin>":8:22), %arg10: f32 loc("<stdin>":8:34)):
      %17 = "arith.mulf"(%arg8, %arg9) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32 loc("<stdin>":9:13)
      %18 = "arith.addf"(%arg10, %17) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32 loc("<stdin>":10:13)
      "linalg.yield"(%18) : (f32) -> () loc("<stdin>":11:7)
    }) : (tensor<?x?xf32>, tensor<?x?xf32>, tensor<?x?xf32>) -> tensor<?x?xf32> loc("<stdin>":7:11)
    %16 = "tensor.cast"(%15) : (tensor<?x?xf32>) -> tensor<*xf32> loc("<stdin>":13:11)
    "func.call"(%16) <{callee = @printMemrefF32}> : (tensor<*xf32>) -> () loc("<stdin>":14:5)
    "func.return"() : () -> () loc("<stdin>":15:5)
  }) : () -> () loc("<stdin>":5:3)
  "func.func"() <{function_type = () -> (), sym_name = "main"}> ({
    %6 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32 loc("<stdin>":18:10)
    %7 = "arith.constant"() <{value = 7 : index}> : () -> index loc("<stdin>":19:10)
    %8 = "arith.constant"() <{value = dense<[[1.000000e+00, 8.000000e+00, 1.500000e+01, 2.200000e+01, 2.900000e+01, 3.600000e+01, 4.300000e+01, 5.000000e+01, 5.700000e+01, 6.400000e+01, 7.100000e+01, 7.800000e+01, 8.500000e+01], [2.000000e+00, 9.000000e+00, 1.600000e+01, 2.300000e+01, 3.000000e+01, 3.700000e+01, 4.400000e+01, 5.100000e+01, 5.800000e+01, 6.500000e+01, 7.200000e+01, 7.900000e+01, 8.600000e+01], [3.000000e+00, 1.000000e+01, 1.700000e+01, 2.400000e+01, 3.100000e+01, 3.800000e+01, 4.500000e+01, 5.200000e+01, 5.900000e+01, 6.600000e+01, 7.300000e+01, 8.000000e+01, 8.700000e+01], [4.000000e+00, 1.100000e+01, 1.800000e+01, 2.500000e+01, 3.200000e+01, 3.900000e+01, 4.600000e+01, 5.300000e+01, 6.000000e+01, 6.700000e+01, 7.400000e+01, 8.100000e+01, 8.800000e+01], [5.000000e+00, 1.200000e+01, 1.900000e+01, 2.600000e+01, 3.300000e+01, 4.000000e+01, 4.700000e+01, 5.400000e+01, 6.100000e+01, 6.800000e+01, 7.500000e+01, 8.200000e+01, 8.900000e+01], [6.000000e+00, 1.300000e+01, 2.000000e+01, 2.700000e+01, 3.400000e+01, 4.100000e+01, 4.800000e+01, 5.500000e+01, 6.200000e+01, 6.900000e+01, 7.600000e+01, 8.300000e+01, 9.000000e+01], [7.000000e+00, 1.400000e+01, 2.100000e+01, 2.800000e+01, 3.500000e+01, 4.200000e+01, 4.900000e+01, 5.600000e+01, 6.300000e+01, 7.000000e+01, 7.700000e+01, 8.400000e+01, 9.100000e+01]]> : tensor<7x13xf32>}> : () -> tensor<7x13xf32> loc("<stdin>":20:10)
    %9 = "tensor.empty"() : () -> tensor<13x7xf32> loc("<stdin>":21:10)
    %10 = "linalg.transpose"(%8, %9) <{permutation = array<i64: 1, 0>}> ({
    ^bb0(%arg3: f32 loc("<stdin>":23:10), %arg4: f32 loc("<stdin>":23:22)):
      "linalg.yield"(%arg3) : (f32) -> () loc("<stdin>":24:7)
    }) : (tensor<7x13xf32>, tensor<13x7xf32>) -> tensor<13x7xf32> loc("<stdin>":22:11)
    %11 = "tensor.cast"(%8) : (tensor<7x13xf32>) -> tensor<?x?xf32> loc("<stdin>":26:11)
    %12 = "tensor.cast"(%10) : (tensor<13x7xf32>) -> tensor<?x?xf32> loc("<stdin>":27:11)
    %13 = "bufferization.alloc_tensor"(%7, %7) <{operandSegmentSizes = array<i32: 2, 0, 0>}> : (index, index) -> tensor<?x?xf32> loc("<stdin>":28:11)
    %14 = "linalg.fill"(%6, %13) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg1: f32 loc("<stdin>":30:10), %arg2: f32 loc("<stdin>":30:22)):
      "linalg.yield"(%arg1) : (f32) -> () loc("<stdin>":31:7)
    }) : (f32, tensor<?x?xf32>) -> tensor<?x?xf32> loc("<stdin>":29:11)
    "func.call"(%11, %12, %14) <{callee = @matmul}> : (tensor<?x?xf32>, tensor<?x?xf32>, tensor<?x?xf32>) -> () loc("<stdin>":33:5)
    "func.return"() : () -> () loc("<stdin>":34:5)
  }) : () -> () loc("<stdin>":17:3)
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.consumed}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op loc("<stdin>":38:10)):
      %0 = "transform.structured.match"(%arg0) <{ops = ["linalg.matmul"]}> : (!transform.any_op) -> !transform.any_op loc("<stdin>":39:12)
      %1:4 = "transform.structured.tile_using_for"(%0) <{scalable_sizes = array<i1: true, true, false>, static_sizes = array<i64: 4, 4, 1>}> : (!transform.any_op) -> (!transform.any_op, !transform.any_op, !transform.any_op, !transform.any_op) loc("<stdin>":40:14)
      "transform.structured.vectorize"(%1#0) <{scalable_sizes = array<i1: true, true, false>, static_vector_sizes = array<i64: 4, 4, 1>}> : (!transform.any_op) -> () loc("<stdin>":41:7)
      %2 = "transform.bufferization.one_shot_bufferize"(%arg0) <{allow_return_allocs_from_loops = false, allow_unknown_ops = false, bufferize_function_boundaries = true, check_parallel_regions = true, dump_alias_sets = false, memcpy_op = "memref.copy", print_conflicts = false, test_analysis_only = false}> : (!transform.any_op) -> !transform.any_op loc("<stdin>":42:12)
      %3 = "transform.structured.match"(%2) <{ops = ["func.func"]}> : (!transform.any_op) -> !transform.any_op loc("<stdin>":43:12)
      "transform.apply_patterns"(%3) <{max_iterations = -1 : i64, max_num_rewrites = -1 : i64}> ({
        "transform.apply_patterns.vector.lower_masked_transfers"() : () -> () loc("<stdin>":45:9)
        "transform.apply_patterns.vector.transfer_permutation_patterns"() : () -> () loc("<stdin>":46:9)
        "transform.apply_patterns.vector.reduction_to_contract"() : () -> () loc("<stdin>":47:9)
        "transform.apply_patterns.vector.sink_ops"() : () -> () loc("<stdin>":48:9)
      }) : (!transform.any_op) -> () loc("<stdin>":44:7)
      "transform.apply_patterns"(%3) <{max_iterations = -1 : i64, max_num_rewrites = -1 : i64}> ({
        "transform.apply_patterns.vector.lower_contraction"() <{lowering_strategy = 2 : i32}> : () -> () loc("<stdin>":51:9)
        "transform.apply_patterns.vector.lower_masks"() : () -> () loc("<stdin>":52:9)
        "transform.apply_patterns.vector.rank_reducing_subview_patterns"() : () -> () loc("<stdin>":53:9)
        "transform.apply_patterns.canonicalization"() : () -> () loc("<stdin>":54:9)
      }) : (!transform.any_op) -> () loc("<stdin>":50:7)
      %4 = "transform.structured.hoist_redundant_vector_transfers"(%3) : (!transform.any_op) -> !transform.any_op loc("<stdin>":56:12)
      %5 = "transform.structured.match"(%2) <{interface = 2 : i32}> : (!transform.any_op) -> !transform.any_op loc("<stdin>":57:12)
      "transform.apply_licm"(%5) : (!transform.any_op) -> () loc("<stdin>":58:7)
      "transform.loop.hoist_loop_invariant_subsets"(%5) : (!transform.any_op) -> () loc("<stdin>":59:7)
      "transform.yield"() : () -> () loc("<stdin>":60:7)
    }) : () -> () loc("<stdin>":37:5)
  }) {transform.with_named_sequence} : () -> () loc("<stdin>":36:3)
  "func.func"() <{function_type = (tensor<*xf32>) -> (), sym_name = "printMemrefF32", sym_visibility = "private"}> ({
  }) : () -> () loc("<stdin>":63:3)
}) : () -> () loc("<stdin>":4:1)
