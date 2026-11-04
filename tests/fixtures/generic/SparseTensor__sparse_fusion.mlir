#map = affine_map<(d0) -> (d0)>
#sparse = #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<100xf64, #sparse>) -> tensor<100xf64>, sym_name = "sparse_fusion"}> ({
  ^bb0(%arg0: tensor<100xf64, #sparse>):
    %0 = "arith.constant"() <{value = 1.000000e+00 : f64}> : () -> f64
    %1 = "arith.constant"() <{value = 1.000000e+02 : f64}> : () -> f64
    %2 = "tensor.empty"() : () -> tensor<100xf64>
    %3 = "linalg.generic"(%arg0, %2) <{doc = "B(i) = OP A(i)", indexing_maps = [#map, #map], iterator_types = [#linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg5: f64, %arg6: f64):
      %10 = "arith.addf"(%arg5, %0) <{fastmath = #arith.fastmath<none>}> : (f64, f64) -> f64
      "linalg.yield"(%10) : (f64) -> ()
    }) : (tensor<100xf64, #sparse>, tensor<100xf64>) -> tensor<100xf64>
    %4 = "tensor.empty"() : () -> tensor<100xf64>
    %5 = "linalg.generic"(%3, %4) <{doc = "B(i) = OP A(i)", indexing_maps = [#map, #map], iterator_types = [#linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg3: f64, %arg4: f64):
      %9 = "math.exp"(%arg3) <{fastmath = #arith.fastmath<none>}> : (f64) -> f64
      "linalg.yield"(%9) : (f64) -> ()
    }) : (tensor<100xf64>, tensor<100xf64>) -> tensor<100xf64>
    %6 = "tensor.empty"() : () -> tensor<100xf64>
    %7 = "linalg.generic"(%5, %6) <{doc = "B(i) = OP A(i)", indexing_maps = [#map, #map], iterator_types = [#linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg1: f64, %arg2: f64):
      %8 = "arith.maximumf"(%arg1, %1) <{fastmath = #arith.fastmath<none>}> : (f64, f64) -> f64
      "linalg.yield"(%8) : (f64) -> ()
    }) : (tensor<100xf64>, tensor<100xf64>) -> tensor<100xf64>
    "func.return"(%7) : (tensor<100xf64>) -> ()
  }) : () -> ()
}) : () -> ()

