"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x?xf32>, tensor<?x?xf32>, tensor<?x?xf32>) -> (), sym_name = "matmul_transpose_a"}> ({
  ^bb0(%arg3: tensor<?x?xf32> loc("<stdin>":6:8), %arg4: tensor<?x?xf32> loc("<stdin>":6:32), %arg5: tensor<?x?xf32> loc("<stdin>":6:56)):
    %11 = "linalg.matmul"(%arg3, %arg4, %arg5) <{indexing_maps = [affine_map<(d0, d1, d2) -> (d2, d0)>, affine_map<(d0, d1, d2) -> (d2, d1)>, affine_map<(d0, d1, d2) -> (d0, d1)>], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg6: f32 loc("<stdin>":8:10), %arg7: f32 loc("<stdin>":8:22), %arg8: f32 loc("<stdin>":8:34)):
      %13 = "arith.mulf"(%arg6, %arg7) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32 loc("<stdin>":9:13)
      %14 = "arith.addf"(%arg8, %13) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32 loc("<stdin>":10:13)
      "linalg.yield"(%14) : (f32) -> () loc("<stdin>":11:7)
    }) : (tensor<?x?xf32>, tensor<?x?xf32>, tensor<?x?xf32>) -> tensor<?x?xf32> loc("<stdin>":7:11)
    %12 = "tensor.cast"(%11) : (tensor<?x?xf32>) -> tensor<*xf32> loc("<stdin>":13:11)
    "func.call"(%12) <{callee = @printMemrefF32}> : (tensor<*xf32>) -> () loc("<stdin>":14:5)
    "func.return"() : () -> () loc("<stdin>":15:5)
  }) : () -> () loc("<stdin>":5:3)
  "func.func"() <{function_type = () -> (), sym_name = "main"}> ({
    %5 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32 loc("<stdin>":18:10)
    %6 = "arith.constant"() <{value = 7 : index}> : () -> index loc("<stdin>":19:10)
    %7 = "arith.constant"() <{value = dense<[[1.000000e+00, 2.000000e+00, 3.000000e+00, 4.000000e+00, 5.000000e+00, 6.000000e+00, 7.000000e+00], [8.000000e+00, 9.000000e+00, 1.000000e+01, 1.100000e+01, 1.200000e+01, 1.300000e+01, 1.400000e+01], [1.500000e+01, 1.600000e+01, 1.700000e+01, 1.800000e+01, 1.900000e+01, 2.000000e+01, 2.100000e+01], [2.200000e+01, 2.300000e+01, 2.400000e+01, 2.500000e+01, 2.600000e+01, 2.700000e+01, 2.800000e+01], [2.900000e+01, 3.000000e+01, 3.100000e+01, 3.200000e+01, 3.300000e+01, 3.400000e+01, 3.500000e+01], [3.600000e+01, 3.700000e+01, 3.800000e+01, 3.900000e+01, 4.000000e+01, 4.100000e+01, 4.200000e+01], [4.300000e+01, 4.400000e+01, 4.500000e+01, 4.600000e+01, 4.700000e+01, 4.800000e+01, 4.900000e+01], [5.000000e+01, 5.100000e+01, 5.200000e+01, 5.300000e+01, 5.400000e+01, 5.500000e+01, 5.600000e+01], [5.700000e+01, 5.800000e+01, 5.900000e+01, 6.000000e+01, 6.100000e+01, 6.200000e+01, 6.300000e+01], [6.400000e+01, 6.500000e+01, 6.600000e+01, 6.700000e+01, 6.800000e+01, 6.900000e+01, 7.000000e+01], [7.100000e+01, 7.200000e+01, 7.300000e+01, 7.400000e+01, 7.500000e+01, 7.600000e+01, 7.700000e+01], [7.800000e+01, 7.900000e+01, 8.000000e+01, 8.100000e+01, 8.200000e+01, 8.300000e+01, 8.400000e+01], [8.500000e+01, 8.600000e+01, 8.700000e+01, 8.800000e+01, 8.900000e+01, 9.000000e+01, 9.100000e+01]]> : tensor<13x7xf32>}> : () -> tensor<13x7xf32> loc("<stdin>":20:10)
    %8 = "tensor.cast"(%7) : (tensor<13x7xf32>) -> tensor<?x?xf32> loc("<stdin>":21:10)
    %9 = "bufferization.alloc_tensor"(%6, %6) <{operandSegmentSizes = array<i32: 2, 0, 0>}> : (index, index) -> tensor<?x?xf32> loc("<stdin>":22:10)
    %10 = "linalg.fill"(%5, %9) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg1: f32 loc("<stdin>":24:10), %arg2: f32 loc("<stdin>":24:22)):
      "linalg.yield"(%arg1) : (f32) -> () loc("<stdin>":25:7)
    }) : (f32, tensor<?x?xf32>) -> tensor<?x?xf32> loc("<stdin>":23:11)
    "func.call"(%8, %8, %10) <{callee = @matmul_transpose_a}> : (tensor<?x?xf32>, tensor<?x?xf32>, tensor<?x?xf32>) -> () loc("<stdin>":27:5)
    "func.return"() : () -> () loc("<stdin>":28:5)
  }) : () -> () loc("<stdin>":17:3)
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op loc("<stdin>":32:10)):
      %0 = "transform.structured.match"(%arg0) <{ops = ["linalg.matmul"]}> : (!transform.any_op) -> !transform.any_op loc("<stdin>":33:12)
      %1:4 = "transform.structured.tile_using_for"(%0) <{scalable_sizes = array<i1: true, true, false>, static_sizes = array<i64: 4, 4, 1>}> : (!transform.any_op) -> (!transform.any_op, !transform.any_op, !transform.any_op, !transform.any_op) loc("<stdin>":34:14)
      "transform.structured.vectorize"(%1#0) <{scalable_sizes = array<i1: true, true, false>, static_vector_sizes = array<i64: 4, 4, 1>}> : (!transform.any_op) -> () loc("<stdin>":35:7)
      %2 = "transform.structured.match"(%arg0) <{ops = ["func.func"]}> : (!transform.any_op) -> !transform.any_op loc("<stdin>":36:12)
      "transform.apply_patterns"(%2) <{max_iterations = -1 : i64, max_num_rewrites = -1 : i64}> ({
        "transform.apply_patterns.vector.lower_masked_transfers"() : () -> () loc("<stdin>":38:9)
        "transform.apply_patterns.vector.transfer_permutation_patterns"() : () -> () loc("<stdin>":39:9)
        "transform.apply_patterns.vector.reduction_to_contract"() : () -> () loc("<stdin>":40:9)
      }) : (!transform.any_op) -> () loc("<stdin>":37:7)
      "transform.apply_patterns"(%2) <{max_iterations = -1 : i64, max_num_rewrites = -1 : i64}> ({
        "transform.apply_patterns.vector.lower_contraction"() <{lowering_strategy = 2 : i32}> : () -> () loc("<stdin>":43:9)
        "transform.apply_patterns.vector.lower_masks"() : () -> () loc("<stdin>":44:9)
        "transform.apply_patterns.canonicalization"() : () -> () loc("<stdin>":45:9)
      }) : (!transform.any_op) -> () loc("<stdin>":42:7)
      %3 = "transform.structured.hoist_redundant_vector_transfers"(%2) : (!transform.any_op) -> !transform.any_op loc("<stdin>":47:12)
      %4 = "transform.structured.match"(%arg0) <{interface = 2 : i32}> : (!transform.any_op) -> !transform.any_op loc("<stdin>":48:12)
      "transform.apply_licm"(%4) : (!transform.any_op) -> () loc("<stdin>":49:7)
      "transform.loop.hoist_loop_invariant_subsets"(%4) : (!transform.any_op) -> () loc("<stdin>":50:7)
      "transform.yield"() : () -> () loc("<stdin>":51:7)
    }) : () -> () loc("<stdin>":31:5)
  }) {transform.with_named_sequence} : () -> () loc("<stdin>":30:3)
  "func.func"() <{function_type = (tensor<*xf32>) -> (), sym_name = "printMemrefF32", sym_visibility = "private"}> ({
  }) : () -> () loc("<stdin>":54:3)
}) : () -> () loc("<stdin>":4:1)
