"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "reduce_2d_f32"}> ({
    %25 = "arith.constant"() <{value = 16 : index}> : () -> index loc("<stdin>":5:11)
    %26 = "arith.constant"() <{value = 1000 : index}> : () -> index loc("<stdin>":6:11)
    %27 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32 loc("<stdin>":7:11)
    %28 = "bufferization.alloc_tensor"(%25, %26) <{operandSegmentSizes = array<i32: 2, 0, 0>}> : (index, index) -> tensor<?x?xf32> loc("<stdin>":8:11)
    %29 = "bufferization.alloc_tensor"(%25) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (index) -> tensor<?xf32> loc("<stdin>":9:11)
    %30 = "arith.constant"() <{value = 3.141600e+00 : f32}> : () -> f32 loc("<stdin>":10:11)
    %31 = "linalg.fill"(%30, %28) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg19: f32 loc("<stdin>":12:10), %arg20: f32 loc("<stdin>":12:23)):
      "linalg.yield"(%arg19) : (f32) -> () loc("<stdin>":13:7)
    }) : (f32, tensor<?x?xf32>) -> tensor<?x?xf32> loc("<stdin>":11:11)
    %32 = "linalg.fill"(%27, %29) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg17: f32 loc("<stdin>":16:10), %arg18: f32 loc("<stdin>":16:23)):
      "linalg.yield"(%arg17) : (f32) -> () loc("<stdin>":17:7)
    }) : (f32, tensor<?xf32>) -> tensor<?xf32> loc("<stdin>":15:11)
    %33 = "linalg.reduce"(%31, %32) <{dimensions = array<i64: 1>}> ({
    ^bb0(%arg15: f32 loc("<stdin>":20:10), %arg16: f32 loc("<stdin>":20:23)):
      %35 = "arith.addf"(%arg15, %arg16) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32 loc("<stdin>":21:13)
      "linalg.yield"(%35) : (f32) -> () loc("<stdin>":22:7)
    }) : (tensor<?x?xf32>, tensor<?xf32>) -> tensor<?xf32> loc("<stdin>":19:11)
    "vector.print"() <{punctuation = #vector.punctuation<newline>, stringLiteral = "SVE: START OF TEST OUTPUT\0A"}> : () -> () loc("<stdin>":24:5)
    %34 = "tensor.cast"(%33) : (tensor<?xf32>) -> tensor<*xf32> loc("<stdin>":25:11)
    "func.call"(%34) <{callee = @printMemrefF32}> : (tensor<*xf32>) -> () loc("<stdin>":26:5)
    "vector.print"() <{punctuation = #vector.punctuation<newline>, stringLiteral = "SVE: END OF TEST OUTPUT\0A"}> : () -> () loc("<stdin>":27:5)
    "func.return"() : () -> () loc("<stdin>":28:5)
  }) : () -> () loc("<stdin>":4:3)
  "func.func"() <{function_type = () -> (), sym_name = "generic_reduce_2d_f32"}> ({
    %14 = "arith.constant"() <{value = 16 : index}> : () -> index loc("<stdin>":31:11)
    %15 = "arith.constant"() <{value = 1000 : index}> : () -> index loc("<stdin>":32:11)
    %16 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32 loc("<stdin>":33:11)
    %17 = "bufferization.alloc_tensor"(%14, %15) <{operandSegmentSizes = array<i32: 2, 0, 0>}> : (index, index) -> tensor<?x?xf32> loc("<stdin>":34:11)
    %18 = "bufferization.alloc_tensor"(%14) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (index) -> tensor<?xf32> loc("<stdin>":35:11)
    %19 = "arith.constant"() <{value = 3.141600e+00 : f32}> : () -> f32 loc("<stdin>":36:11)
    %20 = "linalg.fill"(%19, %17) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg13: f32 loc("<stdin>":38:10), %arg14: f32 loc("<stdin>":38:23)):
      "linalg.yield"(%arg13) : (f32) -> () loc("<stdin>":39:7)
    }) : (f32, tensor<?x?xf32>) -> tensor<?x?xf32> loc("<stdin>":37:11)
    %21 = "linalg.fill"(%16, %18) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg11: f32 loc("<stdin>":42:10), %arg12: f32 loc("<stdin>":42:23)):
      "linalg.yield"(%arg11) : (f32) -> () loc("<stdin>":43:7)
    }) : (f32, tensor<?xf32>) -> tensor<?xf32> loc("<stdin>":41:11)
    %22 = "linalg.generic"(%20, %21) <{indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0)>], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<reduction>], operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg9: f32 loc("<stdin>":46:10), %arg10: f32 loc("<stdin>":46:22)):
      %24 = "arith.addf"(%arg9, %arg10) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32 loc("<stdin>":47:13)
      "linalg.yield"(%24) : (f32) -> () loc("<stdin>":48:7)
    }) : (tensor<?x?xf32>, tensor<?xf32>) -> tensor<?xf32> loc("<stdin>":45:11)
    "vector.print"() <{punctuation = #vector.punctuation<newline>, stringLiteral = "SVE: START OF TEST OUTPUT\0A"}> : () -> () loc("<stdin>":50:5)
    %23 = "tensor.cast"(%22) : (tensor<?xf32>) -> tensor<*xf32> loc("<stdin>":51:11)
    "func.call"(%23) <{callee = @printMemrefF32}> : (tensor<*xf32>) -> () loc("<stdin>":52:5)
    "vector.print"() <{punctuation = #vector.punctuation<newline>, stringLiteral = "SVE: END OF TEST OUTPUT\0A"}> : () -> () loc("<stdin>":53:5)
    "func.return"() : () -> () loc("<stdin>":54:5)
  }) : () -> () loc("<stdin>":30:3)
  "func.func"() <{function_type = () -> (), sym_name = "generic_reduce_2d_i32"}> ({
    %3 = "arith.constant"() <{value = 16 : index}> : () -> index loc("<stdin>":57:10)
    %4 = "arith.constant"() <{value = 1000 : index}> : () -> index loc("<stdin>":58:10)
    %5 = "arith.constant"() <{value = 0 : i32}> : () -> i32 loc("<stdin>":59:10)
    %6 = "bufferization.alloc_tensor"(%3, %4) <{operandSegmentSizes = array<i32: 2, 0, 0>}> : (index, index) -> tensor<?x?xi32> loc("<stdin>":60:10)
    %7 = "bufferization.alloc_tensor"(%3) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (index) -> tensor<?xi32> loc("<stdin>":61:10)
    %8 = "arith.constant"() <{value = 3 : i32}> : () -> i32 loc("<stdin>":62:10)
    %9 = "linalg.fill"(%8, %6) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg7: i32 loc("<stdin>":64:10), %arg8: i32 loc("<stdin>":64:22)):
      "linalg.yield"(%arg7) : (i32) -> () loc("<stdin>":65:7)
    }) : (i32, tensor<?x?xi32>) -> tensor<?x?xi32> loc("<stdin>":63:10)
    %10 = "linalg.fill"(%5, %7) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg5: i32 loc("<stdin>":68:10), %arg6: i32 loc("<stdin>":68:22)):
      "linalg.yield"(%arg5) : (i32) -> () loc("<stdin>":69:7)
    }) : (i32, tensor<?xi32>) -> tensor<?xi32> loc("<stdin>":67:11)
    %11 = "linalg.generic"(%9, %10) <{indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0)>], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<reduction>], operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg3: i32 loc("<stdin>":72:10), %arg4: i32 loc("<stdin>":72:22)):
      %13 = "arith.addi"(%arg3, %arg4) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32 loc("<stdin>":73:13)
      "linalg.yield"(%13) : (i32) -> () loc("<stdin>":74:7)
    }) : (tensor<?x?xi32>, tensor<?xi32>) -> tensor<?xi32> loc("<stdin>":71:11)
    "vector.print"() <{punctuation = #vector.punctuation<newline>, stringLiteral = "SVE: START OF TEST OUTPUT\0A"}> : () -> () loc("<stdin>":76:5)
    %12 = "tensor.cast"(%11) : (tensor<?xi32>) -> tensor<*xi32> loc("<stdin>":77:11)
    "func.call"(%12) <{callee = @printMemrefI32}> : (tensor<*xi32>) -> () loc("<stdin>":78:5)
    "vector.print"() <{punctuation = #vector.punctuation<newline>, stringLiteral = "SVE: END OF TEST OUTPUT\0A"}> : () -> () loc("<stdin>":79:5)
    "func.return"() : () -> () loc("<stdin>":80:5)
  }) : () -> () loc("<stdin>":56:3)
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.op<"func.func">) -> (), sym_name = "tile_and_vectorize_reduce"}> ({
    ^bb0(%arg2: !transform.op<"func.func"> loc("<stdin>":84:10)):
      %1 = "transform.structured.match"(%arg2) <{ops = ["linalg.reduce", "linalg.generic"]}> : (!transform.op<"func.func">) -> !transform.any_op loc("<stdin>":85:12)
      %2:3 = "transform.structured.tile_using_for"(%1) <{scalable_sizes = array<i1: false, true>, static_sizes = array<i64: 1, 4>}> : (!transform.any_op) -> (!transform.any_op, !transform.any_op, !transform.any_op) loc("<stdin>":86:14)
      "transform.structured.vectorize"(%2#0) <{scalable_sizes = array<i1: false, true>, static_vector_sizes = array<i64: 1, 4>}> : (!transform.any_op) -> () loc("<stdin>":87:7)
      "transform.apply_patterns"(%arg2) <{max_iterations = -1 : i64, max_num_rewrites = -1 : i64}> ({
        "transform.apply_patterns.vector.lower_masked_transfers"() : () -> () loc("<stdin>":89:9)
        "transform.apply_patterns.vector.reorder_multi_reduction_dims"() <{lowering_strategy = 1 : i32}> : () -> () loc("<stdin>":90:9)
        "transform.apply_patterns.vector.multi_reduction_flattening"() <{lowering_strategy = 1 : i32}> : () -> () loc("<stdin>":91:9)
        "transform.apply_patterns.vector.multi_reduction_unrolling"() <{lowering_strategy = 1 : i32}> : () -> () loc("<stdin>":92:9)
      }) : (!transform.op<"func.func">) -> () loc("<stdin>":88:7)
      "transform.yield"() : () -> () loc("<stdin>":94:7)
    }) : () -> () loc("<stdin>":83:5)
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op loc("<stdin>":97:10)):
      %0 = "transform.structured.match"(%arg0) <{ops = ["func.func"]}> : (!transform.any_op) -> !transform.op<"func.func"> loc("<stdin>":98:12)
      "transform.foreach"(%0) ({
      ^bb0(%arg1: !transform.op<"func.func"> loc("<stdin>":100:12)):
        "transform.include"(%arg1) <{failure_propagation_mode = 1 : i32, target = @tile_and_vectorize_reduce}> : (!transform.op<"func.func">) -> () loc("<stdin>":101:9)
        "transform.yield"() : () -> () loc("<stdin>":102:9)
      }) : (!transform.op<"func.func">) -> () loc("<stdin>":99:7)
      "transform.yield"() : () -> () loc("<stdin>":104:7)
    }) : () -> () loc("<stdin>":96:5)
  }) {transform.with_named_sequence} : () -> () loc("<stdin>":82:3)
  "func.func"() <{function_type = (tensor<*xf32>) -> (), sym_name = "printMemrefF32", sym_visibility = "private"}> ({
  }) : () -> () loc("<stdin>":107:3)
  "func.func"() <{function_type = (tensor<*xi32>) -> (), sym_name = "printMemrefI32", sym_visibility = "private"}> ({
  }) : () -> () loc("<stdin>":109:3)
}) : () -> () loc("<stdin>":3:1)
