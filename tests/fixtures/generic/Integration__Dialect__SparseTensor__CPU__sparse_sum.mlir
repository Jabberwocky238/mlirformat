#map = affine_map<(d0, d1) -> (d0, d1)>
#map1 = affine_map<(d0, d1) -> ()>
#sparse = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x?xf64, #sparse>, tensor<f64>) -> tensor<f64>, sym_name = "kernel_sum_reduce"}> ({
  ^bb0(%arg0: tensor<?x?xf64, #sparse>, %arg1: tensor<f64>):
    %7 = "linalg.generic"(%arg0, %arg1) <{doc = "x += A(i,j)", indexing_maps = [#map, #map1], iterator_types = [#linalg.iterator_type<reduction>, #linalg.iterator_type<reduction>], operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg2: f64, %arg3: f64):
      %8 = "arith.addf"(%arg3, %arg2) <{fastmath = #arith.fastmath<none>}> : (f64, f64) -> f64
      "linalg.yield"(%8) : (f64) -> ()
    }) : (tensor<?x?xf64, #sparse>, tensor<f64>) -> tensor<f64>
    "func.return"(%7) : (tensor<f64>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (index) -> !llvm.ptr, sym_name = "getTensorFilename", sym_visibility = "private"}> ({
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "main"}> ({
    %0 = "arith.constant"() <{value = 0.000000e+00 : f64}> : () -> f64
    %1 = "arith.constant"() <{value = 0 : index}> : () -> index
    %2 = "tensor.from_elements"(%0) : (f64) -> tensor<f64>
    %3 = "func.call"(%1) <{callee = @getTensorFilename}> : (index) -> !llvm.ptr
    %4 = "sparse_tensor.new"(%3) : (!llvm.ptr) -> tensor<?x?xf64, #sparse>
    %5 = "func.call"(%4, %2) <{callee = @kernel_sum_reduce}> : (tensor<?x?xf64, #sparse>, tensor<f64>) -> tensor<f64>
    %6 = "tensor.extract"(%5) : (tensor<f64>) -> f64
    "vector.print"(%6) <{punctuation = #vector.punctuation<newline>}> : (f64) -> ()
    "bufferization.dealloc_tensor"(%4) : (tensor<?x?xf64, #sparse>) -> ()
    "bufferization.dealloc_tensor"(%5) : (tensor<f64>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

