"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "conv"}> ({
    %1 = "tensor.empty"() : () -> tensor<1x8x6xi32> loc("<stdin>":6:10)
    %2 = "tensor.empty"() : () -> tensor<1x7x6xi32> loc("<stdin>":7:10)
    %3 = "arith.constant"() <{value = 5 : i32}> : () -> i32 loc("<stdin>":8:10)
    %4 = "arith.constant"() <{value = 0 : i32}> : () -> i32 loc("<stdin>":9:10)
    %5 = "linalg.fill"(%3, %1) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg6: i32 loc("<stdin>":11:10), %arg7: i32 loc("<stdin>":11:22)):
      "linalg.yield"(%arg6) : (i32) -> () loc("<stdin>":12:7)
    }) : (i32, tensor<1x8x6xi32>) -> tensor<1x8x6xi32> loc("<stdin>":10:10)
    %6 = "linalg.fill"(%4, %2) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg4: i32 loc("<stdin>":15:10), %arg5: i32 loc("<stdin>":15:22)):
      "linalg.yield"(%arg4) : (i32) -> () loc("<stdin>":16:7)
    }) : (i32, tensor<1x7x6xi32>) -> tensor<1x7x6xi32> loc("<stdin>":14:10)
    %7 = "arith.constant"() <{value = dense<[[1, 2, 3, 4, 5, 6], [11, 12, 13, 14, 15, 16]]> : tensor<2x6xi32>}> : () -> tensor<2x6xi32> loc("<stdin>":18:10)
    %8 = "tensor.cast"(%1) : (tensor<1x8x6xi32>) -> tensor<1x8x?xi32> loc("<stdin>":19:10)
    %9 = "tensor.cast"(%6) : (tensor<1x7x6xi32>) -> tensor<1x7x?xi32> loc("<stdin>":20:10)
    %10 = "tensor.cast"(%7) : (tensor<2x6xi32>) -> tensor<2x?xi32> loc("<stdin>":21:11)
    %11 = "linalg.depthwise_conv_1d_nwc_wc"(%8, %10, %9) <{operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg1: i32 loc("<stdin>":23:10), %arg2: i32 loc("<stdin>":23:22), %arg3: i32 loc("<stdin>":23:34)):
      %13 = "arith.muli"(%arg1, %arg2) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32 loc("<stdin>":24:13)
      %14 = "arith.addi"(%arg3, %13) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32 loc("<stdin>":25:13)
      "linalg.yield"(%14) : (i32) -> () loc("<stdin>":26:7)
    }) {linalg.memoized_indexing_maps = [affine_map<(d0, d1, d2, d3) -> (d0, d1 + d3, d2)>, affine_map<(d0, d1, d2, d3) -> (d3, d2)>, affine_map<(d0, d1, d2, d3) -> (d0, d1, d2)>]} : (tensor<1x8x?xi32>, tensor<2x?xi32>, tensor<1x7x?xi32>) -> tensor<1x7x?xi32> loc("<stdin>":22:11)
    "vector.print"() <{punctuation = #vector.punctuation<newline>, stringLiteral = "SVE: START OF TEST OUTPUT\0A"}> : () -> () loc("<stdin>":28:5)
    %12 = "tensor.cast"(%11) : (tensor<1x7x?xi32>) -> tensor<*xi32> loc("<stdin>":29:11)
    "func.call"(%12) <{callee = @printMemrefI32}> : (tensor<*xi32>) -> () loc("<stdin>":30:5)
    "vector.print"() <{punctuation = #vector.punctuation<newline>, stringLiteral = "SVE: END OF TEST OUTPUT\0A"}> : () -> () loc("<stdin>":31:5)
    "func.return"() : () -> () loc("<stdin>":32:5)
  }) : () -> () loc("<stdin>":5:3)
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op loc("<stdin>":36:10)):
      %0 = "transform.structured.match"(%arg0) <{ops = ["linalg.depthwise_conv_1d_nwc_wc"]}> : (!transform.any_op) -> !transform.any_op loc("<stdin>":37:12)
      "transform.structured.vectorize"(%0) <{scalable_sizes = array<i1: false, false, true, false>, static_vector_sizes = array<i64: 1, 7, 8, 2>}> : (!transform.any_op) -> () loc("<stdin>":38:7)
      "transform.yield"() : () -> () loc("<stdin>":39:7)
    }) : () -> () loc("<stdin>":35:5)
  }) {transform.with_named_sequence} : () -> () loc("<stdin>":34:3)
  "func.func"() <{function_type = (tensor<*xi32>) -> (), sym_name = "printMemrefI32", sym_visibility = "private"}> ({
  }) : () -> () loc("<stdin>":42:3)
}) : () -> () loc("<stdin>":4:1)
