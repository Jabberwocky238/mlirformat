#map = affine_map<(d0, d1, d2) -> (d0, d2)>
#map1 = affine_map<(d0, d1, d2) -> (d2, d1)>
#map2 = affine_map<(d0, d1, d2) -> (d0, d1)>
#sparse = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>
#sparse1 = #sparse_tensor.encoding<{ map = (d0, d1) -> (d1 : dense, d0 : compressed) }>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x?xf64, #sparse>, tensor<?x?xf64, #sparse>) -> tensor<?x?xf64, #sparse>, sym_name = "min_plus_csrcsr"}> ({
  ^bb0(%arg9: tensor<?x?xf64, #sparse>, %arg10: tensor<?x?xf64, #sparse>):
    %20 = "arith.constant"() <{value = 0 : index}> : () -> index
    %21 = "arith.constant"() <{value = 1 : index}> : () -> index
    %22 = "arith.constant"() <{value = 0x7FF0000000000000 : f64}> : () -> f64
    %23 = "tensor.dim"(%arg9, %20) : (tensor<?x?xf64, #sparse>, index) -> index
    %24 = "tensor.dim"(%arg10, %21) : (tensor<?x?xf64, #sparse>, index) -> index
    %25 = "tensor.empty"(%23, %24) : (index, index) -> tensor<?x?xf64, #sparse>
    %26 = "linalg.generic"(%arg9, %arg10, %25) <{doc = "C(i,j) = SUM_k A(i,k) * B(k,j)", indexing_maps = [#map, #map1, #map2], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<reduction>], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg11: f64, %arg12: f64, %arg13: f64):
      %27 = "sparse_tensor.binary"(%arg11, %arg12) ({
      ^bb0(%arg16: f64, %arg17: f64):
        %31 = "arith.addf"(%arg16, %arg17) <{fastmath = #arith.fastmath<none>}> : (f64, f64) -> f64
        "sparse_tensor.yield"(%31) : (f64) -> ()
      }, {
      }, {
      }) : (f64, f64) -> f64
      %28 = "sparse_tensor.reduce"(%27, %arg13, %22) ({
      ^bb0(%arg14: f64, %arg15: f64):
        %29 = "arith.cmpf"(%arg14, %arg15) <{fastmath = #arith.fastmath<none>, predicate = 4 : i64}> : (f64, f64) -> i1
        %30 = "arith.select"(%29, %arg14, %arg15) : (i1, f64, f64) -> f64
        "sparse_tensor.yield"(%30) : (f64) -> ()
      }) : (f64, f64, f64) -> f64
      "linalg.yield"(%28) : (f64) -> ()
    }) : (tensor<?x?xf64, #sparse>, tensor<?x?xf64, #sparse>, tensor<?x?xf64, #sparse>) -> tensor<?x?xf64, #sparse>
    "func.return"(%26) : (tensor<?x?xf64, #sparse>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<?x?xf64, #sparse>, tensor<?x?xf64, #sparse1>) -> tensor<?x?xf64, #sparse>, sym_name = "min_plus_csrcsc"}> ({
  ^bb0(%arg0: tensor<?x?xf64, #sparse>, %arg1: tensor<?x?xf64, #sparse1>):
    %8 = "arith.constant"() <{value = 0 : index}> : () -> index
    %9 = "arith.constant"() <{value = 1 : index}> : () -> index
    %10 = "arith.constant"() <{value = 0x7FF0000000000000 : f64}> : () -> f64
    %11 = "tensor.dim"(%arg0, %8) : (tensor<?x?xf64, #sparse>, index) -> index
    %12 = "tensor.dim"(%arg1, %9) : (tensor<?x?xf64, #sparse1>, index) -> index
    %13 = "tensor.empty"(%11, %12) : (index, index) -> tensor<?x?xf64, #sparse>
    %14 = "linalg.generic"(%arg0, %arg1, %13) <{doc = "C(i,j) = SUM_k A(i,k) * B(k,j)", indexing_maps = [#map, #map1, #map2], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<reduction>], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg2: f64, %arg3: f64, %arg4: f64):
      %15 = "sparse_tensor.binary"(%arg2, %arg3) ({
      ^bb0(%arg7: f64, %arg8: f64):
        %19 = "arith.addf"(%arg7, %arg8) <{fastmath = #arith.fastmath<none>}> : (f64, f64) -> f64
        "sparse_tensor.yield"(%19) : (f64) -> ()
      }, {
      }, {
      }) : (f64, f64) -> f64
      %16 = "sparse_tensor.reduce"(%15, %arg4, %10) ({
      ^bb0(%arg5: f64, %arg6: f64):
        %17 = "arith.cmpf"(%arg5, %arg6) <{fastmath = #arith.fastmath<none>, predicate = 4 : i64}> : (f64, f64) -> i1
        %18 = "arith.select"(%17, %arg5, %arg6) : (i1, f64, f64) -> f64
        "sparse_tensor.yield"(%18) : (f64) -> ()
      }) : (f64, f64, f64) -> f64
      "linalg.yield"(%16) : (f64) -> ()
    }) : (tensor<?x?xf64, #sparse>, tensor<?x?xf64, #sparse1>, tensor<?x?xf64, #sparse>) -> tensor<?x?xf64, #sparse>
    "func.return"(%14) : (tensor<?x?xf64, #sparse>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "main"}> ({
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = sparse<[[0, 0], [0, 1], [1, 0], [2, 2], [2, 3], [2, 4], [3, 0], [3, 2], [3, 3]], [1.000000e+00, 2.000000e+00, 3.000000e+00, 4.000000e+00, 5.000000e+00, 6.000000e+00, 7.000000e+00, 8.000000e+00, 9.000000e+00]> : tensor<4x5xf64>}> : () -> tensor<4x5xf64>
    %2 = "arith.constant"() <{value = sparse<[[0, 0], [1, 3], [2, 0], [2, 3], [3, 1], [4, 1]], [6.000000e+00, 5.000000e+00, 4.000000e+00, 3.000000e+00, 2.000000e+00, 1.100000e+01]> : tensor<5x4xf64>}> : () -> tensor<5x4xf64>
    %3 = "sparse_tensor.convert"(%1) : (tensor<4x5xf64>) -> tensor<?x?xf64, #sparse>
    %4 = "sparse_tensor.convert"(%2) : (tensor<5x4xf64>) -> tensor<?x?xf64, #sparse>
    %5 = "sparse_tensor.convert"(%2) : (tensor<5x4xf64>) -> tensor<?x?xf64, #sparse1>
    %6 = "func.call"(%3, %4) <{callee = @min_plus_csrcsr}> : (tensor<?x?xf64, #sparse>, tensor<?x?xf64, #sparse>) -> tensor<?x?xf64, #sparse>
    %7 = "func.call"(%3, %5) <{callee = @min_plus_csrcsc}> : (tensor<?x?xf64, #sparse>, tensor<?x?xf64, #sparse1>) -> tensor<?x?xf64, #sparse>
    "sparse_tensor.print"(%3) : (tensor<?x?xf64, #sparse>) -> ()
    "sparse_tensor.print"(%4) : (tensor<?x?xf64, #sparse>) -> ()
    "sparse_tensor.print"(%6) : (tensor<?x?xf64, #sparse>) -> ()
    "sparse_tensor.print"(%7) : (tensor<?x?xf64, #sparse>) -> ()
    "bufferization.dealloc_tensor"(%3) : (tensor<?x?xf64, #sparse>) -> ()
    "bufferization.dealloc_tensor"(%4) : (tensor<?x?xf64, #sparse>) -> ()
    "bufferization.dealloc_tensor"(%5) : (tensor<?x?xf64, #sparse1>) -> ()
    "bufferization.dealloc_tensor"(%6) : (tensor<?x?xf64, #sparse>) -> ()
    "bufferization.dealloc_tensor"(%7) : (tensor<?x?xf64, #sparse>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

