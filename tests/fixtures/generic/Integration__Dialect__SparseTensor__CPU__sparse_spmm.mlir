#map = affine_map<(d0, d1, d2) -> (d0, d2)>
#map1 = affine_map<(d0, d1, d2) -> (d2, d1)>
#map2 = affine_map<(d0, d1, d2) -> (d0, d1)>
#map3 = affine_map<(d0, d1) -> (d0, d1)>
#sparse = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x?xf64, #sparse>, tensor<?x?xf64>, tensor<?x?xf64>) -> tensor<?x?xf64>, sym_name = "kernel_spmm"}> ({
  ^bb0(%arg4: tensor<?x?xf64, #sparse>, %arg5: tensor<?x?xf64>, %arg6: tensor<?x?xf64>):
    %15 = "linalg.generic"(%arg4, %arg5, %arg6) <{doc = "X(i,j) += A(i,k) * B(k,j)", indexing_maps = [#map, #map1, #map2], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<reduction>], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg7: f64, %arg8: f64, %arg9: f64):
      %16 = "arith.mulf"(%arg7, %arg8) <{fastmath = #arith.fastmath<none>}> : (f64, f64) -> f64
      %17 = "arith.addf"(%arg9, %16) <{fastmath = #arith.fastmath<none>}> : (f64, f64) -> f64
      "linalg.yield"(%17) : (f64) -> ()
    }) : (tensor<?x?xf64, #sparse>, tensor<?x?xf64>, tensor<?x?xf64>) -> tensor<?x?xf64>
    "func.return"(%15) : (tensor<?x?xf64>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (index) -> !llvm.ptr, sym_name = "getTensorFilename", sym_visibility = "private"}> ({
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "main"}> ({
    %0 = "arith.constant"() <{value = 0.000000e+00 : f64}> : () -> f64
    %1 = "arith.constant"() <{value = 0 : index}> : () -> index
    %2 = "arith.constant"() <{value = 1 : index}> : () -> index
    %3 = "arith.constant"() <{value = 4 : index}> : () -> index
    %4 = "arith.constant"() <{value = 256 : index}> : () -> index
    %5 = "func.call"(%1) <{callee = @getTensorFilename}> : (index) -> !llvm.ptr
    %6 = "sparse_tensor.new"(%5) : (!llvm.ptr) -> tensor<?x?xf64, #sparse>
    %7 = "tensor.generate"(%4, %3) ({
    ^bb0(%arg2: index, %arg3: index):
      %11 = "arith.muli"(%arg2, %3) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
      %12 = "arith.addi"(%arg3, %11) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
      %13 = "arith.index_cast"(%12) : (index) -> i32
      %14 = "arith.sitofp"(%13) : (i32) -> f64
      "tensor.yield"(%14) : (f64) -> ()
    }) : (index, index) -> tensor<?x?xf64>
    %8 = "tensor.generate"(%3, %3) ({
    ^bb0(%arg0: index, %arg1: index):
      "tensor.yield"(%0) : (f64) -> ()
    }) : (index, index) -> tensor<?x?xf64>
    %9 = "func.call"(%6, %7, %8) <{callee = @kernel_spmm}> : (tensor<?x?xf64, #sparse>, tensor<?x?xf64>, tensor<?x?xf64>) -> tensor<?x?xf64>
    %10 = "vector.transfer_read"(%9, %1, %1, %0) <{in_bounds = [false, false], operandSegmentSizes = array<i32: 1, 2, 1, 0>, permutation_map = #map3}> : (tensor<?x?xf64>, index, index, f64) -> vector<4x4xf64>
    "vector.print"(%10) <{punctuation = #vector.punctuation<newline>}> : (vector<4x4xf64>) -> ()
    "bufferization.dealloc_tensor"(%6) : (tensor<?x?xf64, #sparse>) -> ()
    "bufferization.dealloc_tensor"(%7) : (tensor<?x?xf64>) -> ()
    "bufferization.dealloc_tensor"(%9) : (tensor<?x?xf64>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

