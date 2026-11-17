"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "matmul_f32"}> ({
    %21 = "arith.constant"() <{value = 3 : index}> : () -> index loc("<stdin>":6:11)
    %22 = "arith.constant"() <{value = 5 : index}> : () -> index loc("<stdin>":7:11)
    %23 = "arith.constant"() <{value = 15 : index}> : () -> index loc("<stdin>":8:11)
    %24 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32 loc("<stdin>":9:11)
    %25 = "bufferization.alloc_tensor"(%22, %21) <{operandSegmentSizes = array<i32: 2, 0, 0>}> : (index, index) -> tensor<?x?xf32> loc("<stdin>":10:11)
    %26 = "bufferization.alloc_tensor"(%21, %23) <{operandSegmentSizes = array<i32: 2, 0, 0>}> : (index, index) -> tensor<?x?xf32> loc("<stdin>":11:11)
    %27 = "bufferization.alloc_tensor"(%22, %23) <{operandSegmentSizes = array<i32: 2, 0, 0>}> : (index, index) -> tensor<?x?xf32> loc("<stdin>":12:11)
    %28 = "arith.constant"() <{value = 3.140000e+00 : f32}> : () -> f32 loc("<stdin>":13:11)
    %29 = "linalg.fill"(%28, %25) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg19: f32 loc("<stdin>":15:10), %arg20: f32 loc("<stdin>":15:23)):
      "linalg.yield"(%arg19) : (f32) -> () loc("<stdin>":16:7)
    }) : (f32, tensor<?x?xf32>) -> tensor<?x?xf32> loc("<stdin>":14:11)
    %30 = "linalg.fill"(%28, %26) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg17: f32 loc("<stdin>":19:10), %arg18: f32 loc("<stdin>":19:23)):
      "linalg.yield"(%arg17) : (f32) -> () loc("<stdin>":20:7)
    }) : (f32, tensor<?x?xf32>) -> tensor<?x?xf32> loc("<stdin>":18:11)
    %31 = "linalg.fill"(%24, %27) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg15: f32 loc("<stdin>":23:10), %arg16: f32 loc("<stdin>":23:23)):
      "linalg.yield"(%arg15) : (f32) -> () loc("<stdin>":24:7)
    }) : (f32, tensor<?x?xf32>) -> tensor<?x?xf32> loc("<stdin>":22:11)
    %32 = "linalg.matmul"(%29, %30, %31) <{indexing_maps = [affine_map<(d0, d1, d2) -> (d0, d2)>, affine_map<(d0, d1, d2) -> (d2, d1)>, affine_map<(d0, d1, d2) -> (d0, d1)>], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg12: f32 loc("<stdin>":27:10), %arg13: f32 loc("<stdin>":27:23), %arg14: f32 loc("<stdin>":27:36)):
      %34 = "arith.mulf"(%arg12, %arg13) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32 loc("<stdin>":28:13)
      %35 = "arith.addf"(%arg14, %34) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32 loc("<stdin>":29:13)
      "linalg.yield"(%35) : (f32) -> () loc("<stdin>":30:7)
    }) : (tensor<?x?xf32>, tensor<?x?xf32>, tensor<?x?xf32>) -> tensor<?x?xf32> loc("<stdin>":26:11)
    "vector.print"() <{punctuation = #vector.punctuation<newline>, stringLiteral = "SVE: START OF TEST OUTPUT\0A"}> : () -> () loc("<stdin>":32:5)
    %33 = "tensor.cast"(%32) : (tensor<?x?xf32>) -> tensor<*xf32> loc("<stdin>":33:11)
    "func.call"(%33) <{callee = @printMemrefF32}> : (tensor<*xf32>) -> () loc("<stdin>":34:5)
    "vector.print"() <{punctuation = #vector.punctuation<newline>, stringLiteral = "SVE: END OF TEST OUTPUT\0A"}> : () -> () loc("<stdin>":35:5)
    "func.return"() : () -> () loc("<stdin>":36:5)
  }) : () -> () loc("<stdin>":5:3)
  "func.func"() <{function_type = () -> (), sym_name = "matmul_mixed_ty"}> ({
    %3 = "arith.constant"() <{value = 3 : index}> : () -> index loc("<stdin>":39:10)
    %4 = "arith.constant"() <{value = 5 : index}> : () -> index loc("<stdin>":40:10)
    %5 = "arith.constant"() <{value = 15 : index}> : () -> index loc("<stdin>":41:10)
    %6 = "arith.constant"() <{value = 0 : i8}> : () -> i8 loc("<stdin>":42:10)
    %7 = "arith.constant"() <{value = 0 : i32}> : () -> i32 loc("<stdin>":43:10)
    %8 = "bufferization.alloc_tensor"(%4, %3) <{operandSegmentSizes = array<i32: 2, 0, 0>}> : (index, index) -> tensor<?x?xi8> loc("<stdin>":44:10)
    %9 = "bufferization.alloc_tensor"(%3, %5) <{operandSegmentSizes = array<i32: 2, 0, 0>}> : (index, index) -> tensor<?x?xi8> loc("<stdin>":45:10)
    %10 = "bufferization.alloc_tensor"(%4, %5) <{operandSegmentSizes = array<i32: 2, 0, 0>}> : (index, index) -> tensor<?x?xi32> loc("<stdin>":46:11)
    %11 = "arith.constant"() <{value = 123 : i8}> : () -> i8 loc("<stdin>":47:11)
    %12 = "linalg.fill"(%11, %8) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg10: i8 loc("<stdin>":49:10), %arg11: i8 loc("<stdin>":49:22)):
      "linalg.yield"(%arg10) : (i8) -> () loc("<stdin>":50:7)
    }) : (i8, tensor<?x?xi8>) -> tensor<?x?xi8> loc("<stdin>":48:11)
    %13 = "linalg.fill"(%11, %9) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg8: i8 loc("<stdin>":53:10), %arg9: i8 loc("<stdin>":53:21)):
      "linalg.yield"(%arg8) : (i8) -> () loc("<stdin>":54:7)
    }) : (i8, tensor<?x?xi8>) -> tensor<?x?xi8> loc("<stdin>":52:11)
    %14 = "linalg.fill"(%7, %10) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg6: i32 loc("<stdin>":57:10), %arg7: i32 loc("<stdin>":57:22)):
      "linalg.yield"(%arg6) : (i32) -> () loc("<stdin>":58:7)
    }) : (i32, tensor<?x?xi32>) -> tensor<?x?xi32> loc("<stdin>":56:11)
    %15 = "linalg.matmul"(%12, %13, %14) <{indexing_maps = [affine_map<(d0, d1, d2) -> (d0, d2)>, affine_map<(d0, d1, d2) -> (d2, d1)>, affine_map<(d0, d1, d2) -> (d0, d1)>], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg3: i8 loc("<stdin>":61:10), %arg4: i8 loc("<stdin>":61:21), %arg5: i32 loc("<stdin>":61:32)):
      %17 = "arith.extsi"(%arg3) : (i8) -> i32 loc("<stdin>":62:13)
      %18 = "arith.extsi"(%arg4) : (i8) -> i32 loc("<stdin>":63:13)
      %19 = "arith.muli"(%17, %18) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32 loc("<stdin>":64:13)
      %20 = "arith.addi"(%arg5, %19) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32 loc("<stdin>":65:13)
      "linalg.yield"(%20) : (i32) -> () loc("<stdin>":66:7)
    }) : (tensor<?x?xi8>, tensor<?x?xi8>, tensor<?x?xi32>) -> tensor<?x?xi32> loc("<stdin>":60:11)
    "vector.print"() <{punctuation = #vector.punctuation<newline>, stringLiteral = "SVE: START OF TEST OUTPUT\0A"}> : () -> () loc("<stdin>":68:5)
    %16 = "tensor.cast"(%15) : (tensor<?x?xi32>) -> tensor<*xi32> loc("<stdin>":69:11)
    "func.call"(%16) <{callee = @printMemrefI32}> : (tensor<*xi32>) -> () loc("<stdin>":70:5)
    "vector.print"() <{punctuation = #vector.punctuation<newline>, stringLiteral = "SVE: END OF TEST OUTPUT\0A"}> : () -> () loc("<stdin>":71:5)
    "func.return"() : () -> () loc("<stdin>":72:5)
  }) : () -> () loc("<stdin>":38:3)
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.op<"func.func">) -> (), sym_name = "tile_and_vectorize_matmul"}> ({
    ^bb0(%arg2: !transform.op<"func.func"> loc("<stdin>":76:10)):
      %1 = "transform.structured.match"(%arg2) <{ops = ["linalg.matmul"]}> : (!transform.op<"func.func">) -> !transform.any_op loc("<stdin>":77:12)
      %2:4 = "transform.structured.tile_using_for"(%1) <{scalable_sizes = array<i1: false, true, false>, static_sizes = array<i64: 2, 4, 1>}> : (!transform.any_op) -> (!transform.any_op, !transform.any_op, !transform.any_op, !transform.any_op) loc("<stdin>":78:14)
      "transform.structured.vectorize"(%2#0) <{scalable_sizes = array<i1: false, true, false>, static_vector_sizes = array<i64: 2, 4, 1>}> : (!transform.any_op) -> () loc("<stdin>":79:7)
      "transform.apply_patterns"(%arg2) <{max_iterations = -1 : i64, max_num_rewrites = -1 : i64}> ({
        "transform.apply_patterns.vector.reduction_to_contract"() : () -> () loc("<stdin>":81:9)
        "transform.apply_patterns.vector.transfer_permutation_patterns"() : () -> () loc("<stdin>":82:9)
        "transform.apply_patterns.vector.lower_masked_transfers"() : () -> () loc("<stdin>":83:9)
        "transform.apply_patterns.vector.sink_ops"() : () -> () loc("<stdin>":84:9)
      }) : (!transform.op<"func.func">) -> () loc("<stdin>":80:7)
      "transform.apply_patterns"(%arg2) <{max_iterations = -1 : i64, max_num_rewrites = -1 : i64}> ({
        "transform.apply_patterns.vector.lower_contraction"() <{lowering_strategy = 2 : i32}> : () -> () loc("<stdin>":87:9)
        "transform.apply_patterns.vector.lower_outerproduct"() : () -> () loc("<stdin>":88:9)
      }) : (!transform.op<"func.func">) -> () loc("<stdin>":86:7)
      "transform.yield"() : () -> () loc("<stdin>":90:7)
    }) : () -> () loc("<stdin>":75:5)
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op loc("<stdin>":93:10)):
      %0 = "transform.structured.match"(%arg0) <{ops = ["func.func"]}> : (!transform.any_op) -> !transform.op<"func.func"> loc("<stdin>":94:12)
      "transform.foreach"(%0) ({
      ^bb0(%arg1: !transform.op<"func.func"> loc("<stdin>":96:12)):
        "transform.include"(%arg1) <{failure_propagation_mode = 1 : i32, target = @tile_and_vectorize_matmul}> : (!transform.op<"func.func">) -> () loc("<stdin>":97:9)
        "transform.yield"() : () -> () loc("<stdin>":98:9)
      }) : (!transform.op<"func.func">) -> () loc("<stdin>":95:7)
      "transform.yield"() : () -> () loc("<stdin>":100:7)
    }) : () -> () loc("<stdin>":92:5)
  }) {transform.with_named_sequence} : () -> () loc("<stdin>":74:3)
  "func.func"() <{function_type = (tensor<*xf32>) -> (), sym_name = "printMemrefF32", sym_visibility = "private"}> ({
  }) : () -> () loc("<stdin>":103:3)
  "func.func"() <{function_type = (tensor<*xi32>) -> (), sym_name = "printMemrefI32", sym_visibility = "private"}> ({
  }) : () -> () loc("<stdin>":105:3)
}) : () -> () loc("<stdin>":4:1)
