#map = affine_map<(d0, d1, d2, d3, d4, d5, d6, d7) -> (d0, d1, d2, d3, d4, d5, d6, d7)>
#map1 = affine_map<(d0, d1, d2, d3, d4, d5, d6, d7) -> (d0, d1)>
#sparse = #sparse_tensor.encoding<{ map = (d0, d1, d2, d3, d4, d5, d6, d7) -> (d7 : compressed, d6 : compressed, d1 : compressed, d2 : compressed, d0 : compressed, d3 : compressed, d4 : compressed, d5 : compressed) }>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<7x3x3x3x3x3x5x3xf64, #sparse>, tensor<7x3xf64>) -> tensor<7x3xf64>, sym_name = "kernel_flatten"}> ({
  ^bb0(%arg0: tensor<7x3x3x3x3x3x5x3xf64, #sparse>, %arg1: tensor<7x3xf64>):
    %10 = "linalg.generic"(%arg0, %arg1) <{doc = "X(i,j) += A(i,j,k,l,m,n,o,p)", indexing_maps = [#map, #map1], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<reduction>, #linalg.iterator_type<reduction>, #linalg.iterator_type<reduction>, #linalg.iterator_type<reduction>, #linalg.iterator_type<reduction>, #linalg.iterator_type<reduction>], operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg2: f64, %arg3: f64):
      %11 = "arith.addf"(%arg3, %arg2) <{fastmath = #arith.fastmath<none>}> : (f64, f64) -> f64
      "linalg.yield"(%11) : (f64) -> ()
    }) : (tensor<7x3x3x3x3x3x5x3xf64, #sparse>, tensor<7x3xf64>) -> tensor<7x3xf64>
    "func.return"(%10) : (tensor<7x3xf64>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (index) -> !llvm.ptr, sym_name = "getTensorFilename", sym_visibility = "private"}> ({
  }) : () -> ()
  "func.func"() <{function_type = (tensor<*xf64>) -> (), sym_name = "printMemrefF64", sym_visibility = "private"}> ({
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "main"}> ({
    %0 = "arith.constant"() <{value = 0.000000e+00 : f64}> : () -> f64
    %1 = "arith.constant"() <{value = 0 : index}> : () -> index
    %2 = "arith.constant"() <{value = 1 : index}> : () -> index
    %3 = "arith.constant"() <{value = 3 : index}> : () -> index
    %4 = "arith.constant"() <{value = 7 : index}> : () -> index
    %5 = "arith.constant"() <{value = dense<0.000000e+00> : tensor<7x3xf64>}> : () -> tensor<7x3xf64>
    %6 = "func.call"(%1) <{callee = @getTensorFilename}> : (index) -> !llvm.ptr
    %7 = "sparse_tensor.new"(%6) : (!llvm.ptr) -> tensor<7x3x3x3x3x3x5x3xf64, #sparse>
    %8 = "func.call"(%7, %5) <{callee = @kernel_flatten}> : (tensor<7x3x3x3x3x3x5x3xf64, #sparse>, tensor<7x3xf64>) -> tensor<7x3xf64>
    %9 = "tensor.cast"(%8) : (tensor<7x3xf64>) -> tensor<*xf64>
    "func.call"(%9) <{callee = @printMemrefF64}> : (tensor<*xf64>) -> ()
    "bufferization.dealloc_tensor"(%7) : (tensor<7x3x3x3x3x3x5x3xf64, #sparse>) -> ()
    "bufferization.dealloc_tensor"(%8) : (tensor<7x3xf64>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

