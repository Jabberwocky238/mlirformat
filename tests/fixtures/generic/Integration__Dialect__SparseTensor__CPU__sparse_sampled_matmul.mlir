#map = affine_map<(d0, d1, d2) -> (d0, d1)>
#map1 = affine_map<(d0, d1, d2) -> (d0, d2)>
#map2 = affine_map<(d0, d1, d2) -> (d2, d1)>
#map3 = affine_map<(d0, d1) -> (d1)>
#sparse = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed), posWidth = 32, crdWidth = 32 }>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x?xf32, #sparse>, tensor<?x?xf32>, tensor<?x?xf32>, tensor<?x?xf32>) -> tensor<?x?xf32>, sym_name = "sampled_dense_dense"}> ({
  ^bb0(%arg7: tensor<?x?xf32, #sparse>, %arg8: tensor<?x?xf32>, %arg9: tensor<?x?xf32>, %arg10: tensor<?x?xf32>):
    %18 = "linalg.generic"(%arg7, %arg8, %arg9, %arg10) <{doc = "X(i,j) += S(i,j) SUM_k A(i,k) B(k,j)", indexing_maps = [#map, #map1, #map2, #map], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<reduction>], operandSegmentSizes = array<i32: 3, 1>}> ({
    ^bb0(%arg11: f32, %arg12: f32, %arg13: f32, %arg14: f32):
      %19 = "arith.mulf"(%arg12, %arg13) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %20 = "arith.mulf"(%arg11, %19) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %21 = "arith.addf"(%arg14, %20) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%21) : (f32) -> ()
    }) : (tensor<?x?xf32, #sparse>, tensor<?x?xf32>, tensor<?x?xf32>, tensor<?x?xf32>) -> tensor<?x?xf32>
    "func.return"(%18) : (tensor<?x?xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (index) -> !llvm.ptr, sym_name = "getTensorFilename", sym_visibility = "private"}> ({
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "main"}> ({
    %0 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %1 = "arith.constant"() <{value = 0 : index}> : () -> index
    %2 = "arith.constant"() <{value = 1 : index}> : () -> index
    %3 = "arith.constant"() <{value = 5 : index}> : () -> index
    %4 = "arith.constant"() <{value = 10 : index}> : () -> index
    %5 = "tensor.generate"(%3, %3) ({
    ^bb0(%arg5: index, %arg6: index):
      "tensor.yield"(%0) : (f32) -> ()
    }) : (index, index) -> tensor<?x?xf32>
    %6 = "tensor.generate"(%3, %4) ({
    ^bb0(%arg3: index, %arg4: index):
      %15 = "arith.addi"(%arg3, %2) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
      %16 = "arith.index_cast"(%15) : (index) -> i32
      %17 = "arith.sitofp"(%16) : (i32) -> f32
      "tensor.yield"(%17) : (f32) -> ()
    }) : (index, index) -> tensor<?x?xf32>
    %7 = "tensor.generate"(%4, %3) ({
    ^bb0(%arg1: index, %arg2: index):
      %12 = "arith.addi"(%arg2, %2) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
      %13 = "arith.index_cast"(%12) : (index) -> i32
      %14 = "arith.sitofp"(%13) : (i32) -> f32
      "tensor.yield"(%14) : (f32) -> ()
    }) : (index, index) -> tensor<?x?xf32>
    %8 = "func.call"(%1) <{callee = @getTensorFilename}> : (index) -> !llvm.ptr
    %9 = "sparse_tensor.new"(%8) : (!llvm.ptr) -> tensor<?x?xf32, #sparse>
    %10 = "func.call"(%9, %6, %7, %5) <{callee = @sampled_dense_dense}> : (tensor<?x?xf32, #sparse>, tensor<?x?xf32>, tensor<?x?xf32>, tensor<?x?xf32>) -> tensor<?x?xf32>
    "scf.for"(%1, %3, %2) ({
    ^bb0(%arg0: index):
      %11 = "vector.transfer_read"(%10, %arg0, %1, %0) <{in_bounds = [false], operandSegmentSizes = array<i32: 1, 2, 1, 0>, permutation_map = #map3}> : (tensor<?x?xf32>, index, index, f32) -> vector<5xf32>
      "vector.print"(%11) <{punctuation = #vector.punctuation<newline>}> : (vector<5xf32>) -> ()
      "scf.yield"() : () -> ()
    }) : (index, index, index) -> ()
    "bufferization.dealloc_tensor"(%9) : (tensor<?x?xf32, #sparse>) -> ()
    "bufferization.dealloc_tensor"(%10) : (tensor<?x?xf32>) -> ()
    "bufferization.dealloc_tensor"(%6) : (tensor<?x?xf32>) -> ()
    "bufferization.dealloc_tensor"(%7) : (tensor<?x?xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

