#map = affine_map<(d0, d1, d2) -> (d0, d1)>
#map1 = affine_map<(d0, d1, d2) -> (d0, d2)>
#map2 = affine_map<(d0, d1, d2) -> (d2, d1)>
#map3 = affine_map<(d0, d1, d2) -> (d1, d0)>
#map4 = affine_map<(d0, d1, d2) -> (d1, d2)>
#map5 = affine_map<(d0, d1) -> (d0, d1)>
#sparse = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<8x8xf64, #sparse>, tensor<8x8xf64>, tensor<8x8xf64>) -> tensor<8x8xf64>, sym_name = "sampled_dd"}> ({
  ^bb0(%arg25: tensor<8x8xf64, #sparse>, %arg26: tensor<8x8xf64>, %arg27: tensor<8x8xf64>):
    %30 = "arith.constant"() <{value = dense<0.000000e+00> : tensor<8x8xf64>}> : () -> tensor<8x8xf64>
    %31 = "linalg.generic"(%arg25, %arg26, %arg27, %30) <{doc = "X(i,j) += S(i,j) SUM_k A(i,k) B(k,j)", indexing_maps = [#map, #map1, #map2, #map], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<reduction>], operandSegmentSizes = array<i32: 3, 1>}> ({
    ^bb0(%arg28: f64, %arg29: f64, %arg30: f64, %arg31: f64):
      %32 = "arith.mulf"(%arg29, %arg30) <{fastmath = #arith.fastmath<none>}> : (f64, f64) -> f64
      %33 = "arith.mulf"(%arg28, %32) <{fastmath = #arith.fastmath<none>}> : (f64, f64) -> f64
      %34 = "arith.addf"(%arg31, %33) <{fastmath = #arith.fastmath<none>}> : (f64, f64) -> f64
      "linalg.yield"(%34) : (f64) -> ()
    }) : (tensor<8x8xf64, #sparse>, tensor<8x8xf64>, tensor<8x8xf64>, tensor<8x8xf64>) -> tensor<8x8xf64>
    "func.return"(%31) : (tensor<8x8xf64>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<8x8xf64, #sparse>, tensor<8x8xf64>, tensor<8x8xf64>) -> tensor<8x8xf64>, sym_name = "sampled_dd_unfused"}> ({
  ^bb0(%arg16: tensor<8x8xf64, #sparse>, %arg17: tensor<8x8xf64>, %arg18: tensor<8x8xf64>):
    %24 = "arith.constant"() <{value = dense<0.000000e+00> : tensor<8x8xf64>}> : () -> tensor<8x8xf64>
    %25 = "linalg.generic"(%arg17, %arg18, %24) <{indexing_maps = [#map3, #map1, #map4], iterator_types = [#linalg.iterator_type<reduction>, #linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg22: f64, %arg23: f64, %arg24: f64):
      %28 = "arith.mulf"(%arg22, %arg23) <{fastmath = #arith.fastmath<none>}> : (f64, f64) -> f64
      %29 = "arith.addf"(%arg24, %28) <{fastmath = #arith.fastmath<none>}> : (f64, f64) -> f64
      "linalg.yield"(%29) : (f64) -> ()
    }) : (tensor<8x8xf64>, tensor<8x8xf64>, tensor<8x8xf64>) -> tensor<8x8xf64>
    %26 = "linalg.generic"(%25, %arg16, %24) <{indexing_maps = [#map5, #map5, #map5], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg19: f64, %arg20: f64, %arg21: f64):
      %27 = "arith.mulf"(%arg19, %arg20) <{fastmath = #arith.fastmath<none>}> : (f64, f64) -> f64
      "linalg.yield"(%27) : (f64) -> ()
    }) : (tensor<8x8xf64>, tensor<8x8xf64, #sparse>, tensor<8x8xf64>) -> tensor<8x8xf64>
    "bufferization.dealloc_tensor"(%25) : (tensor<8x8xf64>) -> ()
    "func.return"(%26) : (tensor<8x8xf64>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<8x8xf64, #sparse>, tensor<8x8xf64>, tensor<8x8xf64>) -> tensor<8x8xf64, #sparse>, sym_name = "sparse_sampled_dd"}> ({
  ^bb0(%arg9: tensor<8x8xf64, #sparse>, %arg10: tensor<8x8xf64>, %arg11: tensor<8x8xf64>):
    %19 = "tensor.empty"() : () -> tensor<8x8xf64, #sparse>
    %20 = "linalg.generic"(%arg9, %arg10, %arg11, %19) <{doc = "X(i,j) += S(i,j) SUM_k A(i,k) B(k,j)", indexing_maps = [#map, #map1, #map2, #map], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<reduction>], operandSegmentSizes = array<i32: 3, 1>}> ({
    ^bb0(%arg12: f64, %arg13: f64, %arg14: f64, %arg15: f64):
      %21 = "arith.mulf"(%arg13, %arg14) <{fastmath = #arith.fastmath<none>}> : (f64, f64) -> f64
      %22 = "arith.mulf"(%arg12, %21) <{fastmath = #arith.fastmath<none>}> : (f64, f64) -> f64
      %23 = "arith.addf"(%arg15, %22) <{fastmath = #arith.fastmath<none>}> : (f64, f64) -> f64
      "linalg.yield"(%23) : (f64) -> ()
    }) : (tensor<8x8xf64, #sparse>, tensor<8x8xf64>, tensor<8x8xf64>, tensor<8x8xf64, #sparse>) -> tensor<8x8xf64, #sparse>
    "func.return"(%20) : (tensor<8x8xf64, #sparse>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<8x8xf64, #sparse>, tensor<8x8xf64>, tensor<8x8xf64>) -> tensor<8x8xf64, #sparse>, sym_name = "sparse_sampled_dd_unfused"}> ({
  ^bb0(%arg0: tensor<8x8xf64, #sparse>, %arg1: tensor<8x8xf64>, %arg2: tensor<8x8xf64>):
    %12 = "arith.constant"() <{value = dense<0.000000e+00> : tensor<8x8xf64>}> : () -> tensor<8x8xf64>
    %13 = "linalg.generic"(%arg1, %arg2, %12) <{indexing_maps = [#map3, #map1, #map4], iterator_types = [#linalg.iterator_type<reduction>, #linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg6: f64, %arg7: f64, %arg8: f64):
      %17 = "arith.mulf"(%arg6, %arg7) <{fastmath = #arith.fastmath<none>}> : (f64, f64) -> f64
      %18 = "arith.addf"(%arg8, %17) <{fastmath = #arith.fastmath<none>}> : (f64, f64) -> f64
      "linalg.yield"(%18) : (f64) -> ()
    }) : (tensor<8x8xf64>, tensor<8x8xf64>, tensor<8x8xf64>) -> tensor<8x8xf64>
    %14 = "tensor.empty"() : () -> tensor<8x8xf64, #sparse>
    %15 = "linalg.generic"(%13, %arg0, %14) <{indexing_maps = [#map5, #map5, #map5], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg3: f64, %arg4: f64, %arg5: f64):
      %16 = "arith.mulf"(%arg3, %arg4) <{fastmath = #arith.fastmath<none>}> : (f64, f64) -> f64
      "linalg.yield"(%16) : (f64) -> ()
    }) : (tensor<8x8xf64>, tensor<8x8xf64, #sparse>, tensor<8x8xf64, #sparse>) -> tensor<8x8xf64, #sparse>
    "func.return"(%15) : (tensor<8x8xf64, #sparse>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "main"}> ({
    %0 = "arith.constant"() <{value = 0.000000e+00 : f64}> : () -> f64
    %1 = "arith.constant"() <{value = 0 : index}> : () -> index
    %2 = "arith.constant"() <{value = sparse<[[0, 0], [7, 7]], [1.000000e+00, 2.000000e+00]> : tensor<8x8xf64>}> : () -> tensor<8x8xf64>
    %3 = "sparse_tensor.convert"(%2) : (tensor<8x8xf64>) -> tensor<8x8xf64, #sparse>
    %4 = "arith.constant"() <{value = dense<3.000000e+00> : tensor<8x8xf64>}> : () -> tensor<8x8xf64>
    %5 = "arith.constant"() <{value = dense<4.000000e+00> : tensor<8x8xf64>}> : () -> tensor<8x8xf64>
    %6 = "func.call"(%3, %4, %5) <{callee = @sampled_dd}> : (tensor<8x8xf64, #sparse>, tensor<8x8xf64>, tensor<8x8xf64>) -> tensor<8x8xf64>
    %7 = "func.call"(%3, %4, %5) <{callee = @sampled_dd_unfused}> : (tensor<8x8xf64, #sparse>, tensor<8x8xf64>, tensor<8x8xf64>) -> tensor<8x8xf64>
    %8 = "func.call"(%3, %4, %5) <{callee = @sparse_sampled_dd}> : (tensor<8x8xf64, #sparse>, tensor<8x8xf64>, tensor<8x8xf64>) -> tensor<8x8xf64, #sparse>
    %9 = "func.call"(%3, %4, %5) <{callee = @sparse_sampled_dd_unfused}> : (tensor<8x8xf64, #sparse>, tensor<8x8xf64>, tensor<8x8xf64>) -> tensor<8x8xf64, #sparse>
    %10 = "vector.transfer_read"(%6, %1, %1, %0) <{in_bounds = [false, false], operandSegmentSizes = array<i32: 1, 2, 1, 0>, permutation_map = #map5}> : (tensor<8x8xf64>, index, index, f64) -> vector<8x8xf64>
    %11 = "vector.transfer_read"(%7, %1, %1, %0) <{in_bounds = [false, false], operandSegmentSizes = array<i32: 1, 2, 1, 0>, permutation_map = #map5}> : (tensor<8x8xf64>, index, index, f64) -> vector<8x8xf64>
    "vector.print"(%10) <{punctuation = #vector.punctuation<newline>}> : (vector<8x8xf64>) -> ()
    "vector.print"(%11) <{punctuation = #vector.punctuation<newline>}> : (vector<8x8xf64>) -> ()
    "sparse_tensor.print"(%8) : (tensor<8x8xf64, #sparse>) -> ()
    "sparse_tensor.print"(%9) : (tensor<8x8xf64, #sparse>) -> ()
    "bufferization.dealloc_tensor"(%3) : (tensor<8x8xf64, #sparse>) -> ()
    "bufferization.dealloc_tensor"(%6) : (tensor<8x8xf64>) -> ()
    "bufferization.dealloc_tensor"(%7) : (tensor<8x8xf64>) -> ()
    "bufferization.dealloc_tensor"(%8) : (tensor<8x8xf64, #sparse>) -> ()
    "bufferization.dealloc_tensor"(%9) : (tensor<8x8xf64, #sparse>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

