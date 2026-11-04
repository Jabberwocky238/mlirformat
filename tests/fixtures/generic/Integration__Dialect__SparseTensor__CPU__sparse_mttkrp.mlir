#map = affine_map<(d0, d1, d2, d3) -> (d0, d2, d3)>
#map1 = affine_map<(d0, d1, d2, d3) -> (d2, d1)>
#map2 = affine_map<(d0, d1, d2, d3) -> (d3, d1)>
#map3 = affine_map<(d0, d1, d2, d3) -> (d0, d1)>
#sparse = #sparse_tensor.encoding<{ map = (d0, d1, d2) -> (d0 : compressed, d1 : compressed, d2 : compressed) }>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<*xf64>) -> (), sym_name = "printMemrefF64", sym_visibility = "private"}> ({
  }) : () -> ()
  "func.func"() <{function_type = (tensor<?x?x?xf64, #sparse>, tensor<?x?xf64>, tensor<?x?xf64>, tensor<?x?xf64>) -> tensor<?x?xf64>, sym_name = "kernel_mttkrp"}> ({
  ^bb0(%arg6: tensor<?x?x?xf64, #sparse>, %arg7: tensor<?x?xf64>, %arg8: tensor<?x?xf64>, %arg9: tensor<?x?xf64>):
    %23 = "linalg.generic"(%arg6, %arg7, %arg8, %arg9) <{doc = "A(i,j) += B(i,k,l) * D(l,j) * C(k,j)", indexing_maps = [#map, #map1, #map2, #map3], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<reduction>, #linalg.iterator_type<reduction>], operandSegmentSizes = array<i32: 3, 1>}> ({
    ^bb0(%arg10: f64, %arg11: f64, %arg12: f64, %arg13: f64):
      %24 = "arith.mulf"(%arg10, %arg11) <{fastmath = #arith.fastmath<none>}> : (f64, f64) -> f64
      %25 = "arith.mulf"(%arg12, %24) <{fastmath = #arith.fastmath<none>}> : (f64, f64) -> f64
      %26 = "arith.addf"(%arg13, %25) <{fastmath = #arith.fastmath<none>}> : (f64, f64) -> f64
      "linalg.yield"(%26) : (f64) -> ()
    }) : (tensor<?x?x?xf64, #sparse>, tensor<?x?xf64>, tensor<?x?xf64>, tensor<?x?xf64>) -> tensor<?x?xf64>
    "func.return"(%23) : (tensor<?x?xf64>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (index) -> !llvm.ptr, sym_name = "getTensorFilename", sym_visibility = "private"}> ({
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "main"}> ({
    %0 = "arith.constant"() <{value = 0.000000e+00 : f64}> : () -> f64
    %1 = "arith.constant"() <{value = 0 : index}> : () -> index
    %2 = "arith.constant"() <{value = 1 : index}> : () -> index
    %3 = "arith.constant"() <{value = 2 : index}> : () -> index
    %4 = "func.call"(%1) <{callee = @getTensorFilename}> : (index) -> !llvm.ptr
    %5 = "sparse_tensor.new"(%4) : (!llvm.ptr) -> tensor<?x?x?xf64, #sparse>
    %6 = "tensor.dim"(%5, %1) : (tensor<?x?x?xf64, #sparse>, index) -> index
    %7 = "arith.constant"() <{value = 5 : index}> : () -> index
    %8 = "tensor.dim"(%5, %2) : (tensor<?x?x?xf64, #sparse>, index) -> index
    %9 = "tensor.dim"(%5, %3) : (tensor<?x?x?xf64, #sparse>, index) -> index
    %10 = "tensor.generate"(%8, %7) ({
    ^bb0(%arg4: index, %arg5: index):
      %19 = "arith.muli"(%arg4, %7) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
      %20 = "arith.addi"(%19, %arg5) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
      %21 = "arith.index_cast"(%20) : (index) -> i32
      %22 = "arith.sitofp"(%21) : (i32) -> f64
      "tensor.yield"(%22) : (f64) -> ()
    }) : (index, index) -> tensor<?x?xf64>
    %11 = "tensor.generate"(%9, %7) ({
    ^bb0(%arg2: index, %arg3: index):
      %15 = "arith.muli"(%arg2, %7) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
      %16 = "arith.addi"(%15, %arg3) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
      %17 = "arith.index_cast"(%16) : (index) -> i32
      %18 = "arith.sitofp"(%17) : (i32) -> f64
      "tensor.yield"(%18) : (f64) -> ()
    }) : (index, index) -> tensor<?x?xf64>
    %12 = "tensor.generate"(%6, %7) ({
    ^bb0(%arg0: index, %arg1: index):
      "tensor.yield"(%0) : (f64) -> ()
    }) : (index, index) -> tensor<?x?xf64>
    %13 = "func.call"(%5, %10, %11, %12) <{callee = @kernel_mttkrp}> : (tensor<?x?x?xf64, #sparse>, tensor<?x?xf64>, tensor<?x?xf64>, tensor<?x?xf64>) -> tensor<?x?xf64>
    %14 = "tensor.cast"(%13) : (tensor<?x?xf64>) -> tensor<*xf64>
    "func.call"(%14) <{callee = @printMemrefF64}> : (tensor<*xf64>) -> ()
    "bufferization.dealloc_tensor"(%5) : (tensor<?x?x?xf64, #sparse>) -> ()
    "bufferization.dealloc_tensor"(%10) : (tensor<?x?xf64>) -> ()
    "bufferization.dealloc_tensor"(%11) : (tensor<?x?xf64>) -> ()
    "bufferization.dealloc_tensor"(%12) : (tensor<?x?xf64>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

