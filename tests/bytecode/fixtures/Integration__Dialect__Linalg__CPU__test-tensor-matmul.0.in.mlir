"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "main"}> ({
    %2 = "arith.constant"() <{value = dense<[[1.000000e+00, 2.000000e+00, 3.000000e+00], [4.000000e+00, 5.000000e+00, 6.000000e+00]]> : tensor<2x3xf32>}> : () -> tensor<2x3xf32> loc("<stdin>":6:10)
    %3 = "arith.constant"() <{value = dense<[[1.000000e+00, 2.000000e+00, 3.000000e+00, 4.000000e+00], [5.000000e+00, 6.000000e+00, 7.000000e+00, 8.000000e+00], [9.000000e+00, 1.000000e+01, 1.100000e+01, 1.200000e+01]]> : tensor<3x4xf32>}> : () -> tensor<3x4xf32> loc("<stdin>":7:10)
    %4 = "arith.constant"() <{value = dense<1.000000e+03> : tensor<2x4xf32>}> : () -> tensor<2x4xf32> loc("<stdin>":8:10)
    %5 = "linalg.matmul"(%2, %3, %4) <{indexing_maps = [affine_map<(d0, d1, d2) -> (d0, d2)>, affine_map<(d0, d1, d2) -> (d2, d1)>, affine_map<(d0, d1, d2) -> (d0, d1)>], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg1: f32 loc("<stdin>":10:10), %arg2: f32 loc("<stdin>":10:22), %arg3: f32 loc("<stdin>":10:34)):
      %7 = "arith.mulf"(%arg1, %arg2) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32 loc("<stdin>":11:12)
      %8 = "arith.addf"(%arg3, %7) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32 loc("<stdin>":12:12)
      "linalg.yield"(%8) : (f32) -> () loc("<stdin>":13:7)
    }) : (tensor<2x3xf32>, tensor<3x4xf32>, tensor<2x4xf32>) -> tensor<2x4xf32> loc("<stdin>":9:10)
    %6 = "tensor.cast"(%5) : (tensor<2x4xf32>) -> tensor<*xf32> loc("<stdin>":15:10)
    "func.call"(%6) <{callee = @printMemrefF32}> : (tensor<*xf32>) -> () loc("<stdin>":16:5)
    "func.return"() : () -> () loc("<stdin>":17:5)
  }) : () -> () loc("<stdin>":5:3)
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op loc("<stdin>":21:10)):
      %0 = "transform.structured.match"(%arg0) <{ops = ["linalg.matmul"]}> : (!transform.any_op) -> !transform.any_op loc("<stdin>":22:12)
      %1:4 = "transform.structured.tile_using_for"(%0) <{scalable_sizes = array<i1: false, false, false>, static_sizes = array<i64: 1, 2, 3>}> : (!transform.any_op) -> (!transform.any_op, !transform.any_op, !transform.any_op, !transform.any_op) loc("<stdin>":23:14)
      "transform.yield"() : () -> () loc("<stdin>":24:7)
    }) : () -> () loc("<stdin>":20:5)
  }) {transform.with_named_sequence} : () -> () loc("<stdin>":19:3)
  "func.func"() <{function_type = (tensor<*xf32>) -> (), sym_name = "printMemrefF32", sym_visibility = "private"}> ({
  }) : () -> () loc("<stdin>":27:3)
}) : () -> () loc("<stdin>":4:1)
