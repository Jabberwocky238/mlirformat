#map = affine_map<(d0, d1, d2) -> (d0, d2)>
#map1 = affine_map<(d0, d1, d2) -> (d2, d1)>
#map2 = affine_map<(d0, d1, d2) -> (d0, d1)>
#map3 = affine_map<(d0, d1) -> (d1)>
#sparse = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed(nonunique), d1 : singleton) }>
#sparse1 = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed), posWidth = 32, crdWidth = 32 }>
#sparse2 = #sparse_tensor.encoding<{ map = (d0, d1) -> (d1 : dense, d0 : compressed), posWidth = 64, crdWidth = 64 }>
"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "mgpuCreateSparseEnv", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "mgpuDestroySparseEnv", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  }) : () -> ()
  "func.func"() <{function_type = (tensor<8x8xf32, #sparse>, tensor<8x8xf32>, tensor<8x8xf32>) -> tensor<8x8xf32>, sym_name = "matmulCOO"}> ({
  ^bb0(%arg20: tensor<8x8xf32, #sparse>, %arg21: tensor<8x8xf32>, %arg22: tensor<8x8xf32>):
    %28 = "linalg.matmul"(%arg20, %arg21, %arg22) <{indexing_maps = [#map, #map1, #map2], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg23: f32, %arg24: f32, %arg25: f32):
      %29 = "arith.mulf"(%arg23, %arg24) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %30 = "arith.addf"(%arg25, %29) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%30) : (f32) -> ()
    }) : (tensor<8x8xf32, #sparse>, tensor<8x8xf32>, tensor<8x8xf32>) -> tensor<8x8xf32>
    "func.return"(%28) : (tensor<8x8xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<8x8xf32, #sparse1>, tensor<8x8xf32>, tensor<8x8xf32>) -> tensor<8x8xf32>, sym_name = "matmulCSR"}> ({
  ^bb0(%arg14: tensor<8x8xf32, #sparse1>, %arg15: tensor<8x8xf32>, %arg16: tensor<8x8xf32>):
    %25 = "linalg.matmul"(%arg14, %arg15, %arg16) <{indexing_maps = [#map, #map1, #map2], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg17: f32, %arg18: f32, %arg19: f32):
      %26 = "arith.mulf"(%arg17, %arg18) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %27 = "arith.addf"(%arg19, %26) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%27) : (f32) -> ()
    }) : (tensor<8x8xf32, #sparse1>, tensor<8x8xf32>, tensor<8x8xf32>) -> tensor<8x8xf32>
    "func.return"(%25) : (tensor<8x8xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<8x8xf32, #sparse2>, tensor<8x8xf32>, tensor<8x8xf32>) -> tensor<8x8xf32>, sym_name = "matmulCSC"}> ({
  ^bb0(%arg8: tensor<8x8xf32, #sparse2>, %arg9: tensor<8x8xf32>, %arg10: tensor<8x8xf32>):
    %22 = "linalg.matmul"(%arg8, %arg9, %arg10) <{indexing_maps = [#map, #map1, #map2], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg11: f32, %arg12: f32, %arg13: f32):
      %23 = "arith.mulf"(%arg11, %arg12) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %24 = "arith.addf"(%arg13, %23) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%24) : (f32) -> ()
    }) : (tensor<8x8xf32, #sparse2>, tensor<8x8xf32>, tensor<8x8xf32>) -> tensor<8x8xf32>
    "func.return"(%22) : (tensor<8x8xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<8x8xf32>) -> (), sym_name = "dump"}> ({
  ^bb0(%arg6: tensor<8x8xf32>):
    %17 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %18 = "arith.constant"() <{value = 0 : index}> : () -> index
    %19 = "arith.constant"() <{value = 1 : index}> : () -> index
    %20 = "arith.constant"() <{value = 8 : index}> : () -> index
    "scf.for"(%18, %20, %19) ({
    ^bb0(%arg7: index):
      %21 = "vector.transfer_read"(%arg6, %arg7, %18, %17) <{in_bounds = [false], operandSegmentSizes = array<i32: 1, 2, 1, 0>, permutation_map = #map3}> : (tensor<8x8xf32>, index, index, f32) -> vector<8xf32>
      "vector.print"(%21) <{punctuation = #vector.punctuation<newline>}> : (vector<8xf32>) -> ()
      "scf.yield"() : () -> ()
    }) : (index, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "main"}> ({
    "llvm.call"() <{CConv = #llvm.cconv<ccc>, TailCallKind = #llvm.tailcallkind<none>, callee = @mgpuCreateSparseEnv, fastmathFlags = #llvm.fastmath<none>, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 0, 0>}> : () -> ()
    %0 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %1 = "arith.constant"() <{value = 1.000000e+00 : f32}> : () -> f32
    %2 = "tensor.generate"() ({
    ^bb0(%arg4: index, %arg5: index):
      %14 = "arith.addi"(%arg4, %arg5) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
      %15 = "arith.index_cast"(%14) : (index) -> i64
      %16 = "arith.uitofp"(%15) : (i64) -> f32
      "tensor.yield"(%16) : (f32) -> ()
    }) : () -> tensor<8x8xf32>
    %3 = "sparse_tensor.convert"(%2) : (tensor<8x8xf32>) -> tensor<8x8xf32, #sparse>
    %4 = "sparse_tensor.convert"(%2) : (tensor<8x8xf32>) -> tensor<8x8xf32, #sparse1>
    %5 = "sparse_tensor.convert"(%2) : (tensor<8x8xf32>) -> tensor<8x8xf32, #sparse2>
    %6 = "tensor.generate"() ({
    ^bb0(%arg2: index, %arg3: index):
      "tensor.yield"(%0) : (f32) -> ()
    }) : () -> tensor<8x8xf32>
    %7 = "tensor.generate"() ({
    ^bb0(%arg0: index, %arg1: index):
      "tensor.yield"(%1) : (f32) -> ()
    }) : () -> tensor<8x8xf32>
    %8 = "func.call"(%3, %2, %6) <{callee = @matmulCOO}> : (tensor<8x8xf32, #sparse>, tensor<8x8xf32>, tensor<8x8xf32>) -> tensor<8x8xf32>
    %9 = "func.call"(%4, %2, %6) <{callee = @matmulCSR}> : (tensor<8x8xf32, #sparse1>, tensor<8x8xf32>, tensor<8x8xf32>) -> tensor<8x8xf32>
    %10 = "func.call"(%5, %2, %6) <{callee = @matmulCSC}> : (tensor<8x8xf32, #sparse2>, tensor<8x8xf32>, tensor<8x8xf32>) -> tensor<8x8xf32>
    %11 = "func.call"(%3, %2, %7) <{callee = @matmulCOO}> : (tensor<8x8xf32, #sparse>, tensor<8x8xf32>, tensor<8x8xf32>) -> tensor<8x8xf32>
    %12 = "func.call"(%4, %2, %7) <{callee = @matmulCSR}> : (tensor<8x8xf32, #sparse1>, tensor<8x8xf32>, tensor<8x8xf32>) -> tensor<8x8xf32>
    %13 = "func.call"(%5, %2, %7) <{callee = @matmulCSC}> : (tensor<8x8xf32, #sparse2>, tensor<8x8xf32>, tensor<8x8xf32>) -> tensor<8x8xf32>
    "func.call"(%8) <{callee = @dump}> : (tensor<8x8xf32>) -> ()
    "func.call"(%9) <{callee = @dump}> : (tensor<8x8xf32>) -> ()
    "func.call"(%10) <{callee = @dump}> : (tensor<8x8xf32>) -> ()
    "func.call"(%11) <{callee = @dump}> : (tensor<8x8xf32>) -> ()
    "func.call"(%12) <{callee = @dump}> : (tensor<8x8xf32>) -> ()
    "func.call"(%13) <{callee = @dump}> : (tensor<8x8xf32>) -> ()
    "bufferization.dealloc_tensor"(%3) : (tensor<8x8xf32, #sparse>) -> ()
    "bufferization.dealloc_tensor"(%4) : (tensor<8x8xf32, #sparse1>) -> ()
    "bufferization.dealloc_tensor"(%5) : (tensor<8x8xf32, #sparse2>) -> ()
    "llvm.call"() <{CConv = #llvm.cconv<ccc>, TailCallKind = #llvm.tailcallkind<none>, callee = @mgpuDestroySparseEnv, fastmathFlags = #llvm.fastmath<none>, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 0, 0>}> : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

