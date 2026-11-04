#map = affine_map<(d0, d1) -> (d0, d1)>
#sparse = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>
#sparse1 = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : dense) }>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x?xf64, #sparse>) -> tensor<?x?xf64, #sparse1>, sym_name = "dense_output"}> ({
  ^bb0(%arg0: tensor<?x?xf64, #sparse>):
    %6 = "arith.constant"() <{value = 0 : index}> : () -> index
    %7 = "arith.constant"() <{value = 1 : index}> : () -> index
    %8 = "arith.constant"() <{value = 2.000000e+00 : f64}> : () -> f64
    %9 = "tensor.dim"(%arg0, %6) : (tensor<?x?xf64, #sparse>, index) -> index
    %10 = "tensor.dim"(%arg0, %7) : (tensor<?x?xf64, #sparse>, index) -> index
    %11 = "tensor.empty"(%9, %10) : (index, index) -> tensor<?x?xf64, #sparse1>
    %12 = "linalg.generic"(%arg0, %11) <{doc = "X(i,j) = A(i,j) * 2", indexing_maps = [#map, #map], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg1: f64, %arg2: f64):
      %13 = "arith.mulf"(%arg1, %8) <{fastmath = #arith.fastmath<none>}> : (f64, f64) -> f64
      "linalg.yield"(%13) : (f64) -> ()
    }) : (tensor<?x?xf64, #sparse>, tensor<?x?xf64, #sparse1>) -> tensor<?x?xf64, #sparse1>
    "func.return"(%12) : (tensor<?x?xf64, #sparse1>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (index) -> !llvm.ptr, sym_name = "getTensorFilename", sym_visibility = "private"}> ({
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "main"}> ({
    %0 = "arith.constant"() <{value = 0.000000e+00 : f64}> : () -> f64
    %1 = "arith.constant"() <{value = 0 : index}> : () -> index
    %2 = "arith.constant"() <{value = 1 : index}> : () -> index
    %3 = "func.call"(%1) <{callee = @getTensorFilename}> : (index) -> !llvm.ptr
    %4 = "sparse_tensor.new"(%3) : (!llvm.ptr) -> tensor<?x?xf64, #sparse>
    %5 = "func.call"(%4) <{callee = @dense_output}> : (tensor<?x?xf64, #sparse>) -> tensor<?x?xf64, #sparse1>
    "sparse_tensor.print"(%5) : (tensor<?x?xf64, #sparse1>) -> ()
    "bufferization.dealloc_tensor"(%4) : (tensor<?x?xf64, #sparse>) -> ()
    "bufferization.dealloc_tensor"(%5) : (tensor<?x?xf64, #sparse1>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

