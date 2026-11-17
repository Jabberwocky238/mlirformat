"builtin.module"() ({
  "func.func"() <{function_type = (tensor<*xf32>) -> (), sym_name = "printMemrefF32", sym_visibility = "private"}> ({
  }) : () -> () loc("<stdin>":5:3)
  "func.func"() <{function_type = () -> (), sym_name = "main"}> ({
    %2 = "arith.constant"() <{value = 4 : index}> : () -> index loc("<stdin>":8:10)
    %3 = "arith.constant"() <{value = 8 : index}> : () -> index loc("<stdin>":9:10)
    %4 = "arith.constant"() <{value = dense<[[1.100000e+00, 2.100000e+00], [1.200000e+00, 2.200000e+00], [1.300000e+00, 2.300000e+00], [1.400000e+00, 2.400000e+00], [1.500000e+00, 2.500000e+00], [1.600000e+00, 2.600000e+00], [1.700000e+00, 2.700000e+00], [1.800000e+00, 2.800000e+00]]> : tensor<8x2xf32>}> : () -> tensor<8x2xf32> loc("<stdin>":10:10)
    %5 = "arith.constant"() <{value = dense<[[1.010000e+01, 1.110000e+01, 1.210000e+01, 1.310000e+01], [1.020000e+01, 1.120000e+01, 1.220000e+01, 1.320000e+01]]> : tensor<2x4xf32>}> : () -> tensor<2x4xf32> loc("<stdin>":11:10)
    %6 = "bufferization.alloc_tensor"(%3, %2) <{operandSegmentSizes = array<i32: 2, 0, 0>}> : (index, index) -> tensor<?x?xf32> loc("<stdin>":12:10)
    %7 = "tensor.cast"(%4) : (tensor<8x2xf32>) -> tensor<?x?xf32> loc("<stdin>":13:10)
    %8 = "tensor.cast"(%5) : (tensor<2x4xf32>) -> tensor<?x?xf32> loc("<stdin>":14:10)
    %9 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32 loc("<stdin>":15:10)
    %10 = "linalg.fill"(%9, %6) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg4: f32 loc("<stdin>":17:10), %arg5: f32 loc("<stdin>":17:22)):
      "linalg.yield"(%arg4) : (f32) -> () loc("<stdin>":18:7)
    }) : (f32, tensor<?x?xf32>) -> tensor<?x?xf32> loc("<stdin>":16:11)
    %11 = "linalg.matmul"(%7, %8, %10) <{indexing_maps = [affine_map<(d0, d1, d2) -> (d0, d2)>, affine_map<(d0, d1, d2) -> (d2, d1)>, affine_map<(d0, d1, d2) -> (d0, d1)>], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg1: f32 loc("<stdin>":21:10), %arg2: f32 loc("<stdin>":21:22), %arg3: f32 loc("<stdin>":21:34)):
      %13 = "arith.mulf"(%arg1, %arg2) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32 loc("<stdin>":22:13)
      %14 = "arith.addf"(%arg3, %13) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32 loc("<stdin>":23:13)
      "linalg.yield"(%14) : (f32) -> () loc("<stdin>":24:7)
    }) : (tensor<?x?xf32>, tensor<?x?xf32>, tensor<?x?xf32>) -> tensor<?x?xf32> loc("<stdin>":20:11)
    %12 = "tensor.cast"(%11) : (tensor<?x?xf32>) -> tensor<*xf32> loc("<stdin>":26:11)
    "func.call"(%12) <{callee = @printMemrefF32}> : (tensor<*xf32>) -> () loc("<stdin>":27:5)
    "func.return"() : () -> () loc("<stdin>":28:5)
  }) : () -> () loc("<stdin>":7:3)
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op loc("<stdin>":32:10)):
      %0 = "transform.structured.match"(%arg0) <{ops = ["linalg.matmul"]}> : (!transform.any_op) -> !transform.any_op loc("<stdin>":33:12)
      %1 = "transform.get_parent_op"(%0) <{nth_parent = 1 : i64}> : (!transform.any_op) -> !transform.op<"func.func"> loc("<stdin>":34:12)
      "transform.structured.vectorize"(%0) <{scalable_sizes = array<i1: false, false, false>, static_vector_sizes = array<i64: 4, 4, 2>}> : (!transform.any_op) -> () loc("<stdin>":35:7)
      "transform.apply_patterns"(%1) <{max_iterations = -1 : i64, max_num_rewrites = -1 : i64}> ({
        "transform.apply_patterns.vector.reorder_multi_reduction_dims"() <{lowering_strategy = 1 : i32}> : () -> () loc("<stdin>":37:9)
        "transform.apply_patterns.vector.multi_reduction_flattening"() <{lowering_strategy = 1 : i32}> : () -> () loc("<stdin>":38:9)
        "transform.apply_patterns.vector.multi_reduction_unrolling"() <{lowering_strategy = 1 : i32}> : () -> () loc("<stdin>":39:9)
      }) : (!transform.op<"func.func">) -> () loc("<stdin>":36:7)
      "transform.yield"() : () -> () loc("<stdin>":41:7)
    }) : () -> () loc("<stdin>":31:5)
  }) {transform.with_named_sequence} : () -> () loc("<stdin>":30:3)
}) : () -> () loc("<stdin>":4:1)
