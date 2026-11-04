#map = affine_map<(d0, d1) -> (d0, d1)>
#sparse = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 floordiv 2 : dense, d1 floordiv 2 : compressed, d0 mod 2 : dense, d1 mod 2 : dense) }>
#sparse1 = #sparse_tensor.encoding<{ map = (d0, d1, d2, d3) -> (d0 : dense, d1 : compressed, d2 : dense, d3 : dense) }>
"builtin.module"() ({
  "func.func"() <{function_type = (index) -> !llvm.ptr, sym_name = "getTensorFilename", sym_visibility = "private"}> ({
  }) : () -> ()
  "func.func"() <{function_type = (tensor<?x?xf64, #sparse>) -> tensor<?x?xf64, #sparse>, sym_name = "scale"}> ({
  ^bb0(%arg0: tensor<?x?xf64, #sparse>):
    %6 = "arith.constant"() <{value = 3.000000e+00 : f64}> : () -> f64
    %7 = "linalg.generic"(%arg0) <{indexing_maps = [#map], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 0, 1>}> ({
    ^bb0(%arg1: f64):
      %8 = "arith.mulf"(%arg1, %6) <{fastmath = #arith.fastmath<none>}> : (f64, f64) -> f64
      "linalg.yield"(%8) : (f64) -> ()
    }) : (tensor<?x?xf64, #sparse>) -> tensor<?x?xf64, #sparse>
    "func.return"(%7) : (tensor<?x?xf64, #sparse>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "main"}> ({
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = 0.000000e+00 : f64}> : () -> f64
    %2 = "func.call"(%0) <{callee = @getTensorFilename}> : (index) -> !llvm.ptr
    %3 = "sparse_tensor.new"(%2) : (!llvm.ptr) -> tensor<?x?xf64, #sparse>
    "sparse_tensor.print"(%3) : (tensor<?x?xf64, #sparse>) -> ()
    %4 = "sparse_tensor.reinterpret_map"(%3) : (tensor<?x?xf64, #sparse>) -> tensor<?x?x2x2xf64, #sparse1>
    "sparse_tensor.print"(%4) : (tensor<?x?x2x2xf64, #sparse1>) -> ()
    %5 = "func.call"(%3) <{callee = @scale}> : (tensor<?x?xf64, #sparse>) -> tensor<?x?xf64, #sparse>
    "sparse_tensor.print"(%5) : (tensor<?x?xf64, #sparse>) -> ()
    "bufferization.dealloc_tensor"(%3) : (tensor<?x?xf64, #sparse>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

