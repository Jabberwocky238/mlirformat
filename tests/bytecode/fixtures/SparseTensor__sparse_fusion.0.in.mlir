"builtin.module"() ({
  "func.func"() <{function_type = (tensor<100xf64, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>>) -> tensor<100xf64>, sym_name = "sparse_fusion"}> ({
  ^bb0(%arg0: tensor<100xf64, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>> loc("<stdin>":5:8)):
    %0 = "arith.constant"() <{value = 1.000000e+00 : f64}> : () -> f64 loc("<stdin>":6:10)
    %1 = "arith.constant"() <{value = 1.000000e+02 : f64}> : () -> f64 loc("<stdin>":7:10)
    %2 = "tensor.empty"() : () -> tensor<100xf64> loc("<stdin>":8:10)
    %3 = "linalg.generic"(%arg0, %2) <{doc = "B(i) = OP A(i)", indexing_maps = [affine_map<(d0) -> (d0)>, affine_map<(d0) -> (d0)>], iterator_types = [#linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg5: f64 loc("<stdin>":10:10), %arg6: f64 loc("<stdin>":10:22)):
      %10 = "arith.addf"(%arg5, %0) <{fastmath = #arith.fastmath<none>}> : (f64, f64) -> f64 loc("<stdin>":11:13)
      "linalg.yield"(%10) : (f64) -> () loc("<stdin>":12:7)
    }) : (tensor<100xf64, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>>, tensor<100xf64>) -> tensor<100xf64> loc("<stdin>":9:10)
    %4 = "tensor.empty"() : () -> tensor<100xf64> loc("<stdin>":14:10)
    %5 = "linalg.generic"(%3, %4) <{doc = "B(i) = OP A(i)", indexing_maps = [affine_map<(d0) -> (d0)>, affine_map<(d0) -> (d0)>], iterator_types = [#linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg3: f64 loc("<stdin>":16:10), %arg4: f64 loc("<stdin>":16:22)):
      %9 = "math.exp"(%arg3) <{fastmath = #arith.fastmath<none>}> : (f64) -> f64 loc("<stdin>":17:12)
      "linalg.yield"(%9) : (f64) -> () loc("<stdin>":18:7)
    }) : (tensor<100xf64>, tensor<100xf64>) -> tensor<100xf64> loc("<stdin>":15:10)
    %6 = "tensor.empty"() : () -> tensor<100xf64> loc("<stdin>":20:10)
    %7 = "linalg.generic"(%5, %6) <{doc = "B(i) = OP A(i)", indexing_maps = [affine_map<(d0) -> (d0)>, affine_map<(d0) -> (d0)>], iterator_types = [#linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg1: f64 loc("<stdin>":22:10), %arg2: f64 loc("<stdin>":22:22)):
      %8 = "arith.maximumf"(%arg1, %1) <{fastmath = #arith.fastmath<none>}> : (f64, f64) -> f64 loc("<stdin>":23:12)
      "linalg.yield"(%8) : (f64) -> () loc("<stdin>":24:7)
    }) : (tensor<100xf64>, tensor<100xf64>) -> tensor<100xf64> loc("<stdin>":21:10)
    "func.return"(%7) : (tensor<100xf64>) -> () loc("<stdin>":26:5)
  }) : () -> () loc("<stdin>":4:3)
}) : () -> () loc("<stdin>":3:1)
