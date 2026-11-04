#map = affine_map<(d0, d1) -> (d0, d1)>
#map1 = affine_map<(d0, d1) -> (d0)>
#sparse = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>
#sparse1 = #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>
#sparse2 = #sparse_tensor.encoding<{ map = (d0, d1) -> (d1 : dense, d0 : compressed) }>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x?xf64, #sparse>) -> tensor<?xf64, #sparse1>, sym_name = "redProdLex"}> ({
  ^bb0(%arg5: tensor<?x?xf64, #sparse>):
    %15 = "arith.constant"() <{value = 0 : index}> : () -> index
    %16 = "arith.constant"() <{value = 1.000000e+00 : f64}> : () -> f64
    %17 = "tensor.dim"(%arg5, %15) : (tensor<?x?xf64, #sparse>, index) -> index
    %18 = "tensor.empty"(%17) : (index) -> tensor<?xf64, #sparse1>
    %19 = "linalg.generic"(%arg5, %18) <{doc = "X(i) = PROD_j A(i,j)", indexing_maps = [#map, #map1], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<reduction>], operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg6: f64, %arg7: f64):
      %20 = "sparse_tensor.reduce"(%arg6, %arg7, %16) ({
      ^bb0(%arg8: f64, %arg9: f64):
        %21 = "arith.mulf"(%arg8, %arg9) <{fastmath = #arith.fastmath<none>}> : (f64, f64) -> f64
        "sparse_tensor.yield"(%21) : (f64) -> ()
      }) : (f64, f64, f64) -> f64
      "linalg.yield"(%20) : (f64) -> ()
    }) : (tensor<?x?xf64, #sparse>, tensor<?xf64, #sparse1>) -> tensor<?xf64, #sparse1>
    "func.return"(%19) : (tensor<?xf64, #sparse1>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<?x?xf64, #sparse2>) -> tensor<?xf64, #sparse1>, sym_name = "redProdExpand"}> ({
  ^bb0(%arg0: tensor<?x?xf64, #sparse2>):
    %8 = "arith.constant"() <{value = 0 : index}> : () -> index
    %9 = "arith.constant"() <{value = 1.000000e+00 : f64}> : () -> f64
    %10 = "tensor.dim"(%arg0, %8) : (tensor<?x?xf64, #sparse2>, index) -> index
    %11 = "tensor.empty"(%10) : (index) -> tensor<?xf64, #sparse1>
    %12 = "linalg.generic"(%arg0, %11) <{doc = "X(i) = PROD_j A(i,j)", indexing_maps = [#map, #map1], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<reduction>], operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg1: f64, %arg2: f64):
      %13 = "sparse_tensor.reduce"(%arg1, %arg2, %9) ({
      ^bb0(%arg3: f64, %arg4: f64):
        %14 = "arith.mulf"(%arg3, %arg4) <{fastmath = #arith.fastmath<none>}> : (f64, f64) -> f64
        "sparse_tensor.yield"(%14) : (f64) -> ()
      }) : (f64, f64, f64) -> f64
      "linalg.yield"(%13) : (f64) -> ()
    }) : (tensor<?x?xf64, #sparse2>, tensor<?xf64, #sparse1>) -> tensor<?xf64, #sparse1>
    "func.return"(%12) : (tensor<?xf64, #sparse1>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "main"}> ({
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = sparse<[[0, 0], [0, 1], [1, 0], [2, 2], [2, 3], [2, 4], [3, 0], [3, 2], [3, 3]], [1.000000e+00, 2.000000e+00, 3.000000e+00, 4.000000e+00, 5.000000e+00, 6.000000e+00, 7.000000e+00, 8.000000e+00, 9.000000e+00]> : tensor<4x5xf64>}> : () -> tensor<4x5xf64>
    %2 = "arith.constant"() <{value = sparse<[[0, 0], [1, 3], [2, 0], [2, 3], [3, 1], [4, 1]], [6.000000e+00, 5.000000e+00, 4.000000e+00, 3.000000e+00, 2.000000e+00, 1.100000e+01]> : tensor<5x4xf64>}> : () -> tensor<5x4xf64>
    %3 = "sparse_tensor.convert"(%1) : (tensor<4x5xf64>) -> tensor<?x?xf64, #sparse>
    %4 = "sparse_tensor.convert"(%2) : (tensor<5x4xf64>) -> tensor<?x?xf64, #sparse>
    %5 = "sparse_tensor.convert"(%2) : (tensor<5x4xf64>) -> tensor<?x?xf64, #sparse2>
    %6 = "func.call"(%3) <{callee = @redProdLex}> : (tensor<?x?xf64, #sparse>) -> tensor<?xf64, #sparse1>
    %7 = "func.call"(%5) <{callee = @redProdExpand}> : (tensor<?x?xf64, #sparse2>) -> tensor<?xf64, #sparse1>
    "sparse_tensor.print"(%3) : (tensor<?x?xf64, #sparse>) -> ()
    "sparse_tensor.print"(%4) : (tensor<?x?xf64, #sparse>) -> ()
    "sparse_tensor.print"(%6) : (tensor<?xf64, #sparse1>) -> ()
    "sparse_tensor.print"(%7) : (tensor<?xf64, #sparse1>) -> ()
    "bufferization.dealloc_tensor"(%3) : (tensor<?x?xf64, #sparse>) -> ()
    "bufferization.dealloc_tensor"(%4) : (tensor<?x?xf64, #sparse>) -> ()
    "bufferization.dealloc_tensor"(%5) : (tensor<?x?xf64, #sparse2>) -> ()
    "bufferization.dealloc_tensor"(%6) : (tensor<?xf64, #sparse1>) -> ()
    "bufferization.dealloc_tensor"(%7) : (tensor<?xf64, #sparse1>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

