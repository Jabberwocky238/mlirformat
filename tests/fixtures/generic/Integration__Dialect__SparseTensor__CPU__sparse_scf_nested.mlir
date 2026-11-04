#map = affine_map<(d0, d1, d2) -> (d0, d1, d2)>
#sparse = #sparse_tensor.encoding<{ map = (d0, d1, d2) -> (d0 : compressed, d1 : compressed, d2 : compressed) }>
"builtin.module"() <{sym_name = "func_sparse.2"}> ({
  "func.func"() <{function_type = (i1, tensor<2x3x4xf64, #sparse>) -> tensor<2x3x4xf64, #sparse>, sym_name = "condition", sym_visibility = "public"}> ({
  ^bb0(%arg0: i1, %arg1: tensor<2x3x4xf64, #sparse>):
    %6 = "scf.if"(%arg0) ({
      %12 = "arith.constant"() <{value = dense<1.000000e+00> : tensor<f64>}> : () -> tensor<f64>
      %13 = "arith.constant"() <{value = dense<1.000000e+00> : tensor<2x3x4xf64>}> : () -> tensor<2x3x4xf64>
      %14 = "tensor.empty"() : () -> tensor<2x3x4xf64, #sparse>
      %15 = "linalg.generic"(%arg1, %13, %14) <{indexing_maps = [#map, #map, #map], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 2, 1>}> ({
      ^bb0(%arg5: f64, %arg6: f64, %arg7: f64):
        %16 = "arith.subf"(%arg5, %arg6) <{fastmath = #arith.fastmath<none>}> : (f64, f64) -> f64
        "linalg.yield"(%16) : (f64) -> ()
      }) : (tensor<2x3x4xf64, #sparse>, tensor<2x3x4xf64>, tensor<2x3x4xf64, #sparse>) -> tensor<2x3x4xf64, #sparse>
      "scf.yield"(%15) : (tensor<2x3x4xf64, #sparse>) -> ()
    }, {
      %7 = "arith.constant"() <{value = dense<1.000000e+00> : tensor<f64>}> : () -> tensor<f64>
      %8 = "arith.constant"() <{value = dense<1.000000e+00> : tensor<2x3x4xf64>}> : () -> tensor<2x3x4xf64>
      %9 = "tensor.empty"() : () -> tensor<2x3x4xf64, #sparse>
      %10 = "linalg.generic"(%arg1, %8, %9) <{indexing_maps = [#map, #map, #map], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 2, 1>}> ({
      ^bb0(%arg2: f64, %arg3: f64, %arg4: f64):
        %11 = "arith.addf"(%arg2, %arg3) <{fastmath = #arith.fastmath<none>}> : (f64, f64) -> f64
        "linalg.yield"(%11) : (f64) -> ()
      }) : (tensor<2x3x4xf64, #sparse>, tensor<2x3x4xf64>, tensor<2x3x4xf64, #sparse>) -> tensor<2x3x4xf64, #sparse>
      "scf.yield"(%10) : (tensor<2x3x4xf64, #sparse>) -> ()
    }) : (i1) -> tensor<2x3x4xf64, #sparse>
    "func.return"(%6) : (tensor<2x3x4xf64, #sparse>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "main", sym_visibility = "public"}> ({
    %0 = "arith.constant"() <{value = dense<[[[1.000000e+00, 2.000000e+00, 3.000000e+00, 4.000000e+00], [5.000000e+00, 6.000000e+00, 7.000000e+00, 8.000000e+00], [9.000000e+00, 1.000000e+01, 1.100000e+01, 1.200000e+01]], [[1.300000e+01, 1.400000e+01, 1.500000e+01, 1.600000e+01], [1.700000e+01, 1.800000e+01, 1.900000e+01, 2.000000e+01], [2.100000e+01, 2.200000e+01, 2.300000e+01, 2.400000e+01]]]> : tensor<2x3x4xf64>}> : () -> tensor<2x3x4xf64>
    %1 = "arith.constant"() <{value = true}> : () -> i1
    %2 = "arith.constant"() <{value = false}> : () -> i1
    %3 = "sparse_tensor.convert"(%0) : (tensor<2x3x4xf64>) -> tensor<2x3x4xf64, #sparse>
    %4 = "func.call"(%1, %3) <{callee = @condition}> : (i1, tensor<2x3x4xf64, #sparse>) -> tensor<2x3x4xf64, #sparse>
    %5 = "func.call"(%2, %3) <{callee = @condition}> : (i1, tensor<2x3x4xf64, #sparse>) -> tensor<2x3x4xf64, #sparse>
    "sparse_tensor.print"(%4) : (tensor<2x3x4xf64, #sparse>) -> ()
    "sparse_tensor.print"(%5) : (tensor<2x3x4xf64, #sparse>) -> ()
    "bufferization.dealloc_tensor"(%3) : (tensor<2x3x4xf64, #sparse>) -> ()
    "bufferization.dealloc_tensor"(%4) : (tensor<2x3x4xf64, #sparse>) -> ()
    "bufferization.dealloc_tensor"(%5) : (tensor<2x3x4xf64, #sparse>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

