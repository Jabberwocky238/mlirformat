"builtin.module"() ({
  "func.func"() <{function_type = (tensor<1x8x?xi8>, tensor<1x?xi8>, tensor<1x8x?xi8>) -> tensor<1x8x?xi8>, sym_name = "depthwise_conv1d_nwc_wc_1x8x3xi8_tensor"}> ({
  ^bb0(%arg1: tensor<1x8x?xi8> loc("<stdin>":6:8), %arg2: tensor<1x?xi8> loc("<stdin>":6:33), %arg3: tensor<1x8x?xi8> loc("<stdin>":6:56)):
    %1 = "linalg.depthwise_conv_1d_nwc_wc"(%arg1, %arg2, %arg3) <{dilations = dense<1> : vector<1xi64>, operandSegmentSizes = array<i32: 2, 1>, strides = dense<1> : vector<1xi64>}> ({
    ^bb0(%arg4: i8 loc("<stdin>":8:10), %arg5: i8 loc("<stdin>":8:21), %arg6: i8 loc("<stdin>":8:32)):
      %2 = "arith.muli"(%arg4, %arg5) <{overflowFlags = #arith.overflow<none>}> : (i8, i8) -> i8 loc("<stdin>":9:12)
      %3 = "arith.addi"(%arg6, %2) <{overflowFlags = #arith.overflow<none>}> : (i8, i8) -> i8 loc("<stdin>":10:12)
      "linalg.yield"(%3) : (i8) -> () loc("<stdin>":11:7)
    }) {linalg.memoized_indexing_maps = [affine_map<(d0, d1, d2, d3) -> (d0, d1 + d3, d2)>, affine_map<(d0, d1, d2, d3) -> (d3, d2)>, affine_map<(d0, d1, d2, d3) -> (d0, d1, d2)>]} : (tensor<1x8x?xi8>, tensor<1x?xi8>, tensor<1x8x?xi8>) -> tensor<1x8x?xi8> loc("<stdin>":7:10)
    "func.return"(%1) : (tensor<1x8x?xi8>) -> () loc("<stdin>":13:5)
  }) : () -> () loc("<stdin>":5:3)
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op loc("<stdin>":17:10)):
      %0 = "transform.structured.match"(%arg0) <{ops = ["linalg.depthwise_conv_1d_nwc_wc", "linalg.generic"]}> : (!transform.any_op) -> !transform.any_op loc("<stdin>":18:12)
      "transform.structured.vectorize"(%0) <{scalable_sizes = array<i1: false, false, false, false>, static_vector_sizes = array<i64: 1, 8, 4, 1>}> : (!transform.any_op) -> () loc("<stdin>":19:7)
      "transform.yield"() : () -> () loc("<stdin>":20:7)
    }) : () -> () loc("<stdin>":16:5)
  }) {transform.with_named_sequence} : () -> () loc("<stdin>":15:3)
}) : () -> () loc("<stdin>":4:1)
