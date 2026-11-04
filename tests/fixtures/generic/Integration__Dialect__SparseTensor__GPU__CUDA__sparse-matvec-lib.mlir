#map = affine_map<(d0, d1) -> (d0, d1)>
#map1 = affine_map<(d0, d1) -> (d1)>
#map2 = affine_map<(d0, d1) -> (d0)>
#map3 = affine_map<(d0) -> (d0)>
#sparse = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed(nonunique), d1 : singleton) }>
#sparse1 = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed), posWidth = 32, crdWidth = 32 }>
#sparse2 = #sparse_tensor.encoding<{ map = (d0, d1) -> (d1 : dense, d0 : compressed), posWidth = 64, crdWidth = 64 }>
"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "mgpuCreateSparseEnv", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "mgpuDestroySparseEnv", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  }) : () -> ()
  "func.func"() <{function_type = (tensor<?x?xf64, #sparse>, tensor<?xf64>, tensor<?xf64>) -> tensor<?xf64>, sym_name = "matvecCOO"}> ({
  ^bb0(%arg17: tensor<?x?xf64, #sparse>, %arg18: tensor<?xf64>, %arg19: tensor<?xf64>):
    %37 = "linalg.matvec"(%arg17, %arg18, %arg19) <{operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg20: f64, %arg21: f64, %arg22: f64):
      %38 = "arith.mulf"(%arg20, %arg21) <{fastmath = #arith.fastmath<none>}> : (f64, f64) -> f64
      %39 = "arith.addf"(%arg22, %38) <{fastmath = #arith.fastmath<none>}> : (f64, f64) -> f64
      "linalg.yield"(%39) : (f64) -> ()
    }) {linalg.memoized_indexing_maps = [#map, #map1, #map2]} : (tensor<?x?xf64, #sparse>, tensor<?xf64>, tensor<?xf64>) -> tensor<?xf64>
    "func.return"(%37) : (tensor<?xf64>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<?x?xf64, #sparse1>, tensor<?xf64>, tensor<?xf64>) -> tensor<?xf64>, sym_name = "matvecCSR"}> ({
  ^bb0(%arg11: tensor<?x?xf64, #sparse1>, %arg12: tensor<?xf64>, %arg13: tensor<?xf64>):
    %34 = "linalg.matvec"(%arg11, %arg12, %arg13) <{operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg14: f64, %arg15: f64, %arg16: f64):
      %35 = "arith.mulf"(%arg14, %arg15) <{fastmath = #arith.fastmath<none>}> : (f64, f64) -> f64
      %36 = "arith.addf"(%arg16, %35) <{fastmath = #arith.fastmath<none>}> : (f64, f64) -> f64
      "linalg.yield"(%36) : (f64) -> ()
    }) {linalg.memoized_indexing_maps = [#map, #map1, #map2]} : (tensor<?x?xf64, #sparse1>, tensor<?xf64>, tensor<?xf64>) -> tensor<?xf64>
    "func.return"(%34) : (tensor<?xf64>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<?x?xf64, #sparse2>, tensor<?xf64>, tensor<?xf64>) -> tensor<?xf64>, sym_name = "matvecCSC"}> ({
  ^bb0(%arg5: tensor<?x?xf64, #sparse2>, %arg6: tensor<?xf64>, %arg7: tensor<?xf64>):
    %31 = "linalg.matvec"(%arg5, %arg6, %arg7) <{operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg8: f64, %arg9: f64, %arg10: f64):
      %32 = "arith.mulf"(%arg8, %arg9) <{fastmath = #arith.fastmath<none>}> : (f64, f64) -> f64
      %33 = "arith.addf"(%arg10, %32) <{fastmath = #arith.fastmath<none>}> : (f64, f64) -> f64
      "linalg.yield"(%33) : (f64) -> ()
    }) {linalg.memoized_indexing_maps = [#map, #map1, #map2]} : (tensor<?x?xf64, #sparse2>, tensor<?xf64>, tensor<?xf64>) -> tensor<?xf64>
    "func.return"(%31) : (tensor<?xf64>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "main"}> ({
    "llvm.call"() <{CConv = #llvm.cconv<ccc>, TailCallKind = #llvm.tailcallkind<none>, callee = @mgpuCreateSparseEnv, fastmathFlags = #llvm.fastmath<none>, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 0, 0>}> : () -> ()
    %0 = "arith.constant"() <{value = 0.000000e+00 : f64}> : () -> f64
    %1 = "arith.constant"() <{value = 1.000000e+00 : f64}> : () -> f64
    %2 = "arith.constant"() <{value = 0 : index}> : () -> index
    %3 = "arith.constant"() <{value = 1 : index}> : () -> index
    %4 = "tensor.generate"() ({
    ^bb0(%arg3: index, %arg4: index):
      %28 = "arith.addi"(%arg3, %arg4) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
      %29 = "arith.index_cast"(%28) : (index) -> i64
      %30 = "arith.uitofp"(%29) : (i64) -> f64
      "tensor.yield"(%30) : (f64) -> ()
    }) : () -> tensor<64x64xf64>
    %5 = "sparse_tensor.convert"(%4) : (tensor<64x64xf64>) -> tensor<?x?xf64, #sparse>
    %6 = "sparse_tensor.convert"(%4) : (tensor<64x64xf64>) -> tensor<?x?xf64, #sparse1>
    %7 = "sparse_tensor.convert"(%4) : (tensor<64x64xf64>) -> tensor<?x?xf64, #sparse2>
    %8 = "tensor.dim"(%5, %3) : (tensor<?x?xf64, #sparse>, index) -> index
    %9 = "tensor.generate"(%8) ({
    ^bb0(%arg2: index):
      %25 = "arith.addi"(%arg2, %3) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
      %26 = "arith.index_cast"(%25) : (index) -> i64
      %27 = "arith.uitofp"(%26) : (i64) -> f64
      "tensor.yield"(%27) : (f64) -> ()
    }) : (index) -> tensor<?xf64>
    %10 = "tensor.dim"(%5, %2) : (tensor<?x?xf64, #sparse>, index) -> index
    %11 = "tensor.generate"(%10) ({
    ^bb0(%arg1: index):
      "tensor.yield"(%0) : (f64) -> ()
    }) : (index) -> tensor<?xf64>
    %12 = "tensor.generate"(%10) ({
    ^bb0(%arg0: index):
      "tensor.yield"(%1) : (f64) -> ()
    }) : (index) -> tensor<?xf64>
    %13 = "func.call"(%5, %9, %11) <{callee = @matvecCOO}> : (tensor<?x?xf64, #sparse>, tensor<?xf64>, tensor<?xf64>) -> tensor<?xf64>
    %14 = "func.call"(%6, %9, %11) <{callee = @matvecCSR}> : (tensor<?x?xf64, #sparse1>, tensor<?xf64>, tensor<?xf64>) -> tensor<?xf64>
    %15 = "func.call"(%7, %9, %11) <{callee = @matvecCSC}> : (tensor<?x?xf64, #sparse2>, tensor<?xf64>, tensor<?xf64>) -> tensor<?xf64>
    %16 = "func.call"(%5, %9, %12) <{callee = @matvecCOO}> : (tensor<?x?xf64, #sparse>, tensor<?xf64>, tensor<?xf64>) -> tensor<?xf64>
    %17 = "func.call"(%6, %9, %12) <{callee = @matvecCSR}> : (tensor<?x?xf64, #sparse1>, tensor<?xf64>, tensor<?xf64>) -> tensor<?xf64>
    %18 = "func.call"(%7, %9, %12) <{callee = @matvecCSC}> : (tensor<?x?xf64, #sparse2>, tensor<?xf64>, tensor<?xf64>) -> tensor<?xf64>
    %19 = "vector.transfer_read"(%13, %2, %0) <{in_bounds = [false], operandSegmentSizes = array<i32: 1, 1, 1, 0>, permutation_map = #map3}> : (tensor<?xf64>, index, f64) -> vector<64xf64>
    "vector.print"(%19) <{punctuation = #vector.punctuation<newline>}> : (vector<64xf64>) -> ()
    %20 = "vector.transfer_read"(%14, %2, %0) <{in_bounds = [false], operandSegmentSizes = array<i32: 1, 1, 1, 0>, permutation_map = #map3}> : (tensor<?xf64>, index, f64) -> vector<64xf64>
    "vector.print"(%20) <{punctuation = #vector.punctuation<newline>}> : (vector<64xf64>) -> ()
    %21 = "vector.transfer_read"(%15, %2, %0) <{in_bounds = [false], operandSegmentSizes = array<i32: 1, 1, 1, 0>, permutation_map = #map3}> : (tensor<?xf64>, index, f64) -> vector<64xf64>
    "vector.print"(%21) <{punctuation = #vector.punctuation<newline>}> : (vector<64xf64>) -> ()
    %22 = "vector.transfer_read"(%16, %2, %0) <{in_bounds = [false], operandSegmentSizes = array<i32: 1, 1, 1, 0>, permutation_map = #map3}> : (tensor<?xf64>, index, f64) -> vector<64xf64>
    "vector.print"(%22) <{punctuation = #vector.punctuation<newline>}> : (vector<64xf64>) -> ()
    %23 = "vector.transfer_read"(%17, %2, %0) <{in_bounds = [false], operandSegmentSizes = array<i32: 1, 1, 1, 0>, permutation_map = #map3}> : (tensor<?xf64>, index, f64) -> vector<64xf64>
    "vector.print"(%23) <{punctuation = #vector.punctuation<newline>}> : (vector<64xf64>) -> ()
    %24 = "vector.transfer_read"(%18, %2, %0) <{in_bounds = [false], operandSegmentSizes = array<i32: 1, 1, 1, 0>, permutation_map = #map3}> : (tensor<?xf64>, index, f64) -> vector<64xf64>
    "vector.print"(%24) <{punctuation = #vector.punctuation<newline>}> : (vector<64xf64>) -> ()
    "bufferization.dealloc_tensor"(%5) : (tensor<?x?xf64, #sparse>) -> ()
    "bufferization.dealloc_tensor"(%6) : (tensor<?x?xf64, #sparse1>) -> ()
    "bufferization.dealloc_tensor"(%7) : (tensor<?x?xf64, #sparse2>) -> ()
    "llvm.call"() <{CConv = #llvm.cconv<ccc>, TailCallKind = #llvm.tailcallkind<none>, callee = @mgpuDestroySparseEnv, fastmathFlags = #llvm.fastmath<none>, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 0, 0>}> : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

