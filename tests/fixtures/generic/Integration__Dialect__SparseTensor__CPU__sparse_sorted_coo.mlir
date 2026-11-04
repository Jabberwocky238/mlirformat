#map = affine_map<(d0, d1) -> (d0, d1)>
#sparse = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed(nonunique), d1 : singleton(soa)) }>
#sparse1 = #sparse_tensor.encoding<{ map = (d0, d1) -> (d1 : compressed(nonunique), d0 : singleton(soa)) }>
#sparse2 = #sparse_tensor.encoding<{ map = (d0, d1, d2) -> (d0 : compressed(nonunique), d1 : singleton(nonunique, soa), d2 : singleton(soa)) }>
#sparse3 = #sparse_tensor.encoding<{ map = (d0, d1, d2) -> (d2 : compressed(nonunique), d0 : singleton(nonunique, soa), d1 : singleton(soa)) }>
"builtin.module"() ({
  "func.func"() <{function_type = (index) -> !llvm.ptr, sym_name = "getTensorFilename", sym_visibility = "private"}> ({
  }) : () -> ()
  "func.func"() <{function_type = (tensor<?x?xf64, #sparse>) -> tensor<?x?xf64, #sparse>, sym_name = "sparse_scale"}> ({
  ^bb0(%arg0: tensor<?x?xf64, #sparse>):
    %11 = "arith.constant"() <{value = 2.000000e+00 : f64}> : () -> f64
    %12 = "linalg.generic"(%arg0) <{doc = "X(i,j) = X(i,j) * 2.0", indexing_maps = [#map], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 0, 1>}> ({
    ^bb0(%arg1: f64):
      %13 = "arith.mulf"(%arg1, %11) <{fastmath = #arith.fastmath<none>}> : (f64, f64) -> f64
      "linalg.yield"(%13) : (f64) -> ()
    }) : (tensor<?x?xf64, #sparse>) -> tensor<?x?xf64, #sparse>
    "func.return"(%12) : (tensor<?x?xf64, #sparse>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "main"}> ({
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = 1 : index}> : () -> index
    %2 = "func.call"(%0) <{callee = @getTensorFilename}> : (index) -> !llvm.ptr
    %3 = "func.call"(%1) <{callee = @getTensorFilename}> : (index) -> !llvm.ptr
    %4 = "sparse_tensor.new"(%2) : (!llvm.ptr) -> tensor<?x?xf64, #sparse>
    %5 = "sparse_tensor.new"(%2) : (!llvm.ptr) -> tensor<?x?xf64, #sparse1>
    %6 = "sparse_tensor.new"(%3) : (!llvm.ptr) -> tensor<?x?x?xf64, #sparse2>
    %7 = "sparse_tensor.new"(%3) : (!llvm.ptr) -> tensor<?x?x?xf64, #sparse3>
    %8 = "arith.constant"() <{value = sparse<[[0, 0], [1, 3], [2, 0], [2, 3], [3, 1], [4, 1]], [6.000000e+00, 5.000000e+00, 4.000000e+00, 3.000000e+00, 2.000000e+00, 1.100000e+01]> : tensor<5x4xf64>}> : () -> tensor<5x4xf64>
    %9 = "sparse_tensor.convert"(%8) : (tensor<5x4xf64>) -> tensor<?x?xf64, #sparse>
    "sparse_tensor.print"(%4) : (tensor<?x?xf64, #sparse>) -> ()
    "sparse_tensor.print"(%5) : (tensor<?x?xf64, #sparse1>) -> ()
    "sparse_tensor.print"(%6) : (tensor<?x?x?xf64, #sparse2>) -> ()
    "sparse_tensor.print"(%7) : (tensor<?x?x?xf64, #sparse3>) -> ()
    "sparse_tensor.print"(%9) : (tensor<?x?xf64, #sparse>) -> ()
    %10 = "func.call"(%9) <{callee = @sparse_scale}> : (tensor<?x?xf64, #sparse>) -> tensor<?x?xf64, #sparse>
    "sparse_tensor.print"(%10) : (tensor<?x?xf64, #sparse>) -> ()
    "bufferization.dealloc_tensor"(%4) : (tensor<?x?xf64, #sparse>) -> ()
    "bufferization.dealloc_tensor"(%5) : (tensor<?x?xf64, #sparse1>) -> ()
    "bufferization.dealloc_tensor"(%6) : (tensor<?x?x?xf64, #sparse2>) -> ()
    "bufferization.dealloc_tensor"(%7) : (tensor<?x?x?xf64, #sparse3>) -> ()
    "bufferization.dealloc_tensor"(%9) : (tensor<?x?xf64, #sparse>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

