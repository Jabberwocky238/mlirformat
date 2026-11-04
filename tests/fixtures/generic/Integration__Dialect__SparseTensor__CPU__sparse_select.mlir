#map = affine_map<(d0) -> (d0)>
#map1 = affine_map<(d0, d1) -> (d0, d1)>
#sparse = #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>
#sparse1 = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?xf64, #sparse>) -> tensor<?xf64, #sparse>, sym_name = "vecSelect"}> ({
  ^bb0(%arg4: tensor<?xf64, #sparse>):
    %17 = "arith.constant"() <{value = 0 : index}> : () -> index
    %18 = "arith.constant"() <{value = 1.000000e+00 : f64}> : () -> f64
    %19 = "tensor.dim"(%arg4, %17) : (tensor<?xf64, #sparse>, index) -> index
    %20 = "tensor.empty"(%19) : (index) -> tensor<?xf64, #sparse>
    %21 = "linalg.generic"(%arg4, %20) <{indexing_maps = [#map, #map], iterator_types = [#linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg5: f64, %arg6: f64):
      %22 = "sparse_tensor.select"(%arg5) ({
      ^bb0(%arg7: f64):
        %23 = "arith.cmpf"(%arg7, %18) <{fastmath = #arith.fastmath<none>, predicate = 3 : i64}> : (f64, f64) -> i1
        "sparse_tensor.yield"(%23) : (i1) -> ()
      }) : (f64) -> f64
      "linalg.yield"(%22) : (f64) -> ()
    }) : (tensor<?xf64, #sparse>, tensor<?xf64, #sparse>) -> tensor<?xf64, #sparse>
    "func.return"(%21) : (tensor<?xf64, #sparse>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<?x?xf64, #sparse1>) -> tensor<?x?xf64, #sparse1>, sym_name = "matUpperTriangle"}> ({
  ^bb0(%arg0: tensor<?x?xf64, #sparse1>):
    %7 = "arith.constant"() <{value = 0 : index}> : () -> index
    %8 = "arith.constant"() <{value = 1 : index}> : () -> index
    %9 = "tensor.dim"(%arg0, %7) : (tensor<?x?xf64, #sparse1>, index) -> index
    %10 = "tensor.dim"(%arg0, %8) : (tensor<?x?xf64, #sparse1>, index) -> index
    %11 = "tensor.empty"(%9, %10) : (index, index) -> tensor<?x?xf64, #sparse1>
    %12 = "linalg.generic"(%arg0, %11) <{indexing_maps = [#map1, #map1], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg1: f64, %arg2: f64):
      %13 = "linalg.index"() <{dim = 0 : i64}> : () -> index
      %14 = "linalg.index"() <{dim = 1 : i64}> : () -> index
      %15 = "sparse_tensor.select"(%arg1) ({
      ^bb0(%arg3: f64):
        %16 = "arith.cmpi"(%14, %13) <{predicate = 8 : i64}> : (index, index) -> i1
        "sparse_tensor.yield"(%16) : (i1) -> ()
      }) : (f64) -> f64
      "linalg.yield"(%15) : (f64) -> ()
    }) : (tensor<?x?xf64, #sparse1>, tensor<?x?xf64, #sparse1>) -> tensor<?x?xf64, #sparse1>
    "func.return"(%12) : (tensor<?x?xf64, #sparse1>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "main"}> ({
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = sparse<[[1], [3], [5], [7], [9]], [1.000000e+00, 2.000000e+00, -4.000000e+00, 0.000000e+00, 5.000000e+00]> : tensor<10xf64>}> : () -> tensor<10xf64>
    %2 = "arith.constant"() <{value = sparse<[[0, 3], [1, 4], [2, 1], [2, 3], [3, 3], [3, 4], [4, 2]], [1.000000e+00, 2.000000e+00, 3.000000e+00, 4.000000e+00, 5.000000e+00, 6.000000e+00, 7.000000e+00]> : tensor<5x5xf64>}> : () -> tensor<5x5xf64>
    %3 = "sparse_tensor.convert"(%1) : (tensor<10xf64>) -> tensor<?xf64, #sparse>
    %4 = "sparse_tensor.convert"(%2) : (tensor<5x5xf64>) -> tensor<?x?xf64, #sparse1>
    %5 = "func.call"(%3) <{callee = @vecSelect}> : (tensor<?xf64, #sparse>) -> tensor<?xf64, #sparse>
    %6 = "func.call"(%4) <{callee = @matUpperTriangle}> : (tensor<?x?xf64, #sparse1>) -> tensor<?x?xf64, #sparse1>
    "sparse_tensor.print"(%3) : (tensor<?xf64, #sparse>) -> ()
    "sparse_tensor.print"(%4) : (tensor<?x?xf64, #sparse1>) -> ()
    "sparse_tensor.print"(%5) : (tensor<?xf64, #sparse>) -> ()
    "sparse_tensor.print"(%6) : (tensor<?x?xf64, #sparse1>) -> ()
    "bufferization.dealloc_tensor"(%3) : (tensor<?xf64, #sparse>) -> ()
    "bufferization.dealloc_tensor"(%4) : (tensor<?x?xf64, #sparse1>) -> ()
    "bufferization.dealloc_tensor"(%5) : (tensor<?xf64, #sparse>) -> ()
    "bufferization.dealloc_tensor"(%6) : (tensor<?x?xf64, #sparse1>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

