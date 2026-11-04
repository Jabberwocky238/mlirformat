#map = affine_map<(d0, d1) -> (d0, d1)>
#sparse = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x?xf64, #sparse>) -> tensor<?x?xf64, #sparse>, sym_name = "kernel_eltwise_mult"}> ({
  ^bb0(%arg0: tensor<?x?xf64, #sparse>):
    %5 = "linalg.generic"(%arg0) <{doc = "X(i,j) *= X(i,j)", indexing_maps = [#map], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 0, 1>}> ({
    ^bb0(%arg1: f64):
      %6 = "arith.mulf"(%arg1, %arg1) <{fastmath = #arith.fastmath<none>}> : (f64, f64) -> f64
      "linalg.yield"(%6) : (f64) -> ()
    }) : (tensor<?x?xf64, #sparse>) -> tensor<?x?xf64, #sparse>
    "func.return"(%5) : (tensor<?x?xf64, #sparse>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (index) -> !llvm.ptr, sym_name = "getTensorFilename", sym_visibility = "private"}> ({
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "main"}> ({
    %0 = "arith.constant"() <{value = 0.000000e+00 : f64}> : () -> f64
    %1 = "arith.constant"() <{value = 0 : index}> : () -> index
    %2 = "func.call"(%1) <{callee = @getTensorFilename}> : (index) -> !llvm.ptr
    %3 = "sparse_tensor.new"(%2) : (!llvm.ptr) -> tensor<?x?xf64, #sparse>
    %4 = "func.call"(%3) <{callee = @kernel_eltwise_mult}> : (tensor<?x?xf64, #sparse>) -> tensor<?x?xf64, #sparse>
    "sparse_tensor.print"(%4) : (tensor<?x?xf64, #sparse>) -> ()
    "bufferization.dealloc_tensor"(%3) : (tensor<?x?xf64, #sparse>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

