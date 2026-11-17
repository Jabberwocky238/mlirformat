"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "reduce_1d_f32"}> ({
    %23 = "arith.constant"() <{value = 1000 : index}> : () -> index loc("<stdin>":5:11)
    %24 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32 loc("<stdin>":6:11)
    %25 = "bufferization.alloc_tensor"(%23) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (index) -> tensor<?xf32> loc("<stdin>":7:11)
    %26 = "bufferization.alloc_tensor"() <{operandSegmentSizes = array<i32: 0, 0, 0>}> : () -> tensor<f32> loc("<stdin>":8:11)
    %27 = "arith.constant"() <{value = 3.141600e+00 : f32}> : () -> f32 loc("<stdin>":9:11)
    %28 = "linalg.fill"(%27, %25) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg13: f32 loc("<stdin>":11:10), %arg14: f32 loc("<stdin>":11:23)):
      "linalg.yield"(%arg13) : (f32) -> () loc("<stdin>":12:7)
    }) : (f32, tensor<?xf32>) -> tensor<?xf32> loc("<stdin>":10:11)
    %29 = "tensor.insert"(%24, %26) : (f32, tensor<f32>) -> tensor<f32> loc("<stdin>":14:11)
    %30 = "linalg.reduce"(%28, %29) <{dimensions = array<i64: 0>}> ({
    ^bb0(%arg11: f32 loc("<stdin>":16:10), %arg12: f32 loc("<stdin>":16:23)):
      %32 = "arith.addf"(%arg11, %arg12) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32 loc("<stdin>":17:13)
      "linalg.yield"(%32) : (f32) -> () loc("<stdin>":18:7)
    }) : (tensor<?xf32>, tensor<f32>) -> tensor<f32> loc("<stdin>":15:11)
    "vector.print"() <{punctuation = #vector.punctuation<newline>, stringLiteral = "SVE: START OF TEST OUTPUT\0A"}> : () -> () loc("<stdin>":20:5)
    %31 = "tensor.cast"(%30) : (tensor<f32>) -> tensor<*xf32> loc("<stdin>":21:11)
    "func.call"(%31) <{callee = @printMemrefF32}> : (tensor<*xf32>) -> () loc("<stdin>":22:5)
    "vector.print"() <{punctuation = #vector.punctuation<newline>, stringLiteral = "SVE: END OF TEST OUTPUT\0A"}> : () -> () loc("<stdin>":23:5)
    "func.return"() : () -> () loc("<stdin>":24:5)
  }) : () -> () loc("<stdin>":4:3)
  "func.func"() <{function_type = () -> (), sym_name = "reduce_1d_i32"}> ({
    %13 = "arith.constant"() <{value = 1000 : index}> : () -> index loc("<stdin>":27:11)
    %14 = "arith.constant"() <{value = 0 : i32}> : () -> i32 loc("<stdin>":28:11)
    %15 = "bufferization.alloc_tensor"(%13) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (index) -> tensor<?xi32> loc("<stdin>":29:11)
    %16 = "bufferization.alloc_tensor"() <{operandSegmentSizes = array<i32: 0, 0, 0>}> : () -> tensor<i32> loc("<stdin>":30:11)
    %17 = "arith.constant"() <{value = 3 : i32}> : () -> i32 loc("<stdin>":31:11)
    %18 = "linalg.fill"(%17, %15) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg9: i32 loc("<stdin>":33:10), %arg10: i32 loc("<stdin>":33:22)):
      "linalg.yield"(%arg9) : (i32) -> () loc("<stdin>":34:7)
    }) : (i32, tensor<?xi32>) -> tensor<?xi32> loc("<stdin>":32:11)
    %19 = "tensor.insert"(%14, %16) : (i32, tensor<i32>) -> tensor<i32> loc("<stdin>":36:11)
    %20 = "linalg.reduce"(%18, %19) <{dimensions = array<i64: 0>}> ({
    ^bb0(%arg7: i32 loc("<stdin>":38:10), %arg8: i32 loc("<stdin>":38:22)):
      %22 = "arith.addi"(%arg7, %arg8) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32 loc("<stdin>":39:13)
      "linalg.yield"(%22) : (i32) -> () loc("<stdin>":40:7)
    }) : (tensor<?xi32>, tensor<i32>) -> tensor<i32> loc("<stdin>":37:11)
    "vector.print"() <{punctuation = #vector.punctuation<newline>, stringLiteral = "SVE: START OF TEST OUTPUT\0A"}> : () -> () loc("<stdin>":42:5)
    %21 = "tensor.cast"(%20) : (tensor<i32>) -> tensor<*xi32> loc("<stdin>":43:11)
    "func.call"(%21) <{callee = @printMemrefI32}> : (tensor<*xi32>) -> () loc("<stdin>":44:5)
    "vector.print"() <{punctuation = #vector.punctuation<newline>, stringLiteral = "SVE: END OF TEST OUTPUT\0A"}> : () -> () loc("<stdin>":45:5)
    "func.return"() : () -> () loc("<stdin>":46:5)
  }) : () -> () loc("<stdin>":26:3)
  "func.func"() <{function_type = () -> (), sym_name = "generic_reduce_1d_f32"}> ({
    %3 = "arith.constant"() <{value = 1000 : index}> : () -> index loc("<stdin>":49:10)
    %4 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32 loc("<stdin>":50:10)
    %5 = "bufferization.alloc_tensor"(%3) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (index) -> tensor<?xf32> loc("<stdin>":51:10)
    %6 = "bufferization.alloc_tensor"() <{operandSegmentSizes = array<i32: 0, 0, 0>}> : () -> tensor<f32> loc("<stdin>":52:10)
    %7 = "arith.constant"() <{value = 3.141600e+00 : f32}> : () -> f32 loc("<stdin>":53:10)
    %8 = "linalg.fill"(%7, %5) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg5: f32 loc("<stdin>":55:10), %arg6: f32 loc("<stdin>":55:22)):
      "linalg.yield"(%arg5) : (f32) -> () loc("<stdin>":56:7)
    }) : (f32, tensor<?xf32>) -> tensor<?xf32> loc("<stdin>":54:10)
    %9 = "tensor.insert"(%4, %6) : (f32, tensor<f32>) -> tensor<f32> loc("<stdin>":58:10)
    %10 = "linalg.generic"(%8, %9) <{indexing_maps = [affine_map<(d0) -> (d0)>, affine_map<(d0) -> ()>], iterator_types = [#linalg.iterator_type<reduction>], operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg3: f32 loc("<stdin>":60:10), %arg4: f32 loc("<stdin>":60:22)):
      %12 = "arith.addf"(%arg3, %arg4) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32 loc("<stdin>":61:13)
      "linalg.yield"(%12) : (f32) -> () loc("<stdin>":62:7)
    }) : (tensor<?xf32>, tensor<f32>) -> tensor<f32> loc("<stdin>":59:11)
    "vector.print"() <{punctuation = #vector.punctuation<newline>, stringLiteral = "SVE: START OF TEST OUTPUT\0A"}> : () -> () loc("<stdin>":64:5)
    %11 = "tensor.cast"(%10) : (tensor<f32>) -> tensor<*xf32> loc("<stdin>":65:11)
    "func.call"(%11) <{callee = @printMemrefF32}> : (tensor<*xf32>) -> () loc("<stdin>":66:5)
    "vector.print"() <{punctuation = #vector.punctuation<newline>, stringLiteral = "SVE: END OF TEST OUTPUT\0A"}> : () -> () loc("<stdin>":67:5)
    "func.return"() : () -> () loc("<stdin>":68:5)
  }) : () -> () loc("<stdin>":48:3)
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.op<"func.func">) -> (), sym_name = "tile_and_vectorize_reduce"}> ({
    ^bb0(%arg2: !transform.op<"func.func"> loc("<stdin>":72:10)):
      %1 = "transform.structured.match"(%arg2) <{ops = ["linalg.reduce", "linalg.generic"]}> : (!transform.op<"func.func">) -> !transform.any_op loc("<stdin>":73:12)
      %2:2 = "transform.structured.tile_using_for"(%1) <{scalable_sizes = array<i1: true>, static_sizes = array<i64: 4>}> : (!transform.any_op) -> (!transform.any_op, !transform.any_op) loc("<stdin>":74:14)
      "transform.structured.vectorize"(%2#0) <{scalable_sizes = array<i1: true>, static_vector_sizes = array<i64: 4>}> : (!transform.any_op) -> () loc("<stdin>":75:7)
      "transform.apply_patterns"(%arg2) <{max_iterations = -1 : i64, max_num_rewrites = -1 : i64}> ({
        "transform.apply_patterns.vector.lower_masked_transfers"() : () -> () loc("<stdin>":77:9)
        "transform.apply_patterns.vector.reorder_multi_reduction_dims"() <{lowering_strategy = 1 : i32}> : () -> () loc("<stdin>":78:9)
        "transform.apply_patterns.vector.multi_reduction_flattening"() <{lowering_strategy = 1 : i32}> : () -> () loc("<stdin>":79:9)
        "transform.apply_patterns.vector.multi_reduction_unrolling"() <{lowering_strategy = 1 : i32}> : () -> () loc("<stdin>":80:9)
      }) : (!transform.op<"func.func">) -> () loc("<stdin>":76:7)
      "transform.yield"() : () -> () loc("<stdin>":82:7)
    }) : () -> () loc("<stdin>":71:5)
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op loc("<stdin>":85:10)):
      %0 = "transform.structured.match"(%arg0) <{ops = ["func.func"]}> : (!transform.any_op) -> !transform.op<"func.func"> loc("<stdin>":86:12)
      "transform.foreach"(%0) ({
      ^bb0(%arg1: !transform.op<"func.func"> loc("<stdin>":88:12)):
        "transform.include"(%arg1) <{failure_propagation_mode = 1 : i32, target = @tile_and_vectorize_reduce}> : (!transform.op<"func.func">) -> () loc("<stdin>":89:9)
        "transform.yield"() : () -> () loc("<stdin>":90:9)
      }) : (!transform.op<"func.func">) -> () loc("<stdin>":87:7)
      "transform.yield"() : () -> () loc("<stdin>":92:7)
    }) : () -> () loc("<stdin>":84:5)
  }) {transform.with_named_sequence} : () -> () loc("<stdin>":70:3)
  "func.func"() <{function_type = (tensor<*xf32>) -> (), sym_name = "printMemrefF32", sym_visibility = "private"}> ({
  }) : () -> () loc("<stdin>":95:3)
  "func.func"() <{function_type = (tensor<*xi32>) -> (), sym_name = "printMemrefI32", sym_visibility = "private"}> ({
  }) : () -> () loc("<stdin>":97:3)
}) : () -> () loc("<stdin>":3:1)
