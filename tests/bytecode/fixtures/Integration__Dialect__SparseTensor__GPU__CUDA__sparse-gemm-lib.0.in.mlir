"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "mgpuCreateSparseEnv", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  }) : () -> () loc("<stdin>":6:3)
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "mgpuDestroySparseEnv", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  }) : () -> () loc("<stdin>":8:3)
  "func.func"() <{function_type = (tensor<8x8xf32, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed), posWidth = 32, crdWidth = 32 }>>, tensor<8x8xf32, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed), posWidth = 32, crdWidth = 32 }>>) -> tensor<8x8xf32, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed), posWidth = 32, crdWidth = 32 }>>, sym_name = "matmulCSR"}> ({
  ^bb0(%arg0: tensor<8x8xf32, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed), posWidth = 32, crdWidth = 32 }>> loc("<stdin>":11:8), %arg1: tensor<8x8xf32, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed), posWidth = 32, crdWidth = 32 }>> loc("<stdin>":11:41)):
    %5 = "tensor.empty"() : () -> tensor<8x8xf32, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed), posWidth = 32, crdWidth = 32 }>> loc("<stdin>":12:10)
    %6 = "linalg.matmul"(%arg0, %arg1, %5) <{indexing_maps = [affine_map<(d0, d1, d2) -> (d0, d2)>, affine_map<(d0, d1, d2) -> (d2, d1)>, affine_map<(d0, d1, d2) -> (d0, d1)>], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg2: f32 loc("<stdin>":14:10), %arg3: f32 loc("<stdin>":14:22), %arg4: f32 loc("<stdin>":14:34)):
      %7 = "arith.mulf"(%arg2, %arg3) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32 loc("<stdin>":15:12)
      %8 = "arith.addf"(%arg4, %7) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32 loc("<stdin>":16:12)
      "linalg.yield"(%8) : (f32) -> () loc("<stdin>":17:7)
    }) : (tensor<8x8xf32, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed), posWidth = 32, crdWidth = 32 }>>, tensor<8x8xf32, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed), posWidth = 32, crdWidth = 32 }>>, tensor<8x8xf32, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed), posWidth = 32, crdWidth = 32 }>>) -> tensor<8x8xf32, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed), posWidth = 32, crdWidth = 32 }>> loc("<stdin>":13:10)
    "func.return"(%6) : (tensor<8x8xf32, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed), posWidth = 32, crdWidth = 32 }>>) -> () loc("<stdin>":19:5)
  }) : () -> () loc("<stdin>":10:3)
  "func.func"() <{function_type = () -> (), sym_name = "main"}> ({
    "llvm.call"() <{CConv = #llvm.cconv<ccc>, TailCallKind = #llvm.tailcallkind<none>, callee = @mgpuCreateSparseEnv, fastmathFlags = #llvm.fastmath<none>, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 0, 0>}> : () -> () loc("<stdin>":22:5)
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":23:10)
    %1 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32 loc("<stdin>":24:10)
    %2 = "arith.constant"() <{value = dense<[[1.000000e+00, 0.000000e+00, 2.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, 3.000000e+00], [0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00], [0.000000e+00, 0.000000e+00, 4.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00], [0.000000e+00, 0.000000e+00, 0.000000e+00, 5.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00], [0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, 6.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00], [0.000000e+00, 7.000000e+00, 8.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, 9.000000e+00], [0.000000e+00, 0.000000e+00, 1.000000e+01, 0.000000e+00, 0.000000e+00, 0.000000e+00, 1.100000e+01, 1.200000e+01], [0.000000e+00, 1.300000e+01, 1.400000e+01, 0.000000e+00, 0.000000e+00, 0.000000e+00, 1.500000e+01, 1.600000e+01]]> : tensor<8x8xf32>}> : () -> tensor<8x8xf32> loc("<stdin>":25:10)
    %3 = "sparse_tensor.convert"(%2) : (tensor<8x8xf32>) -> tensor<8x8xf32, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed), posWidth = 32, crdWidth = 32 }>> loc("<stdin>":26:10)
    %4 = "func.call"(%3, %3) <{callee = @matmulCSR}> : (tensor<8x8xf32, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed), posWidth = 32, crdWidth = 32 }>>, tensor<8x8xf32, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed), posWidth = 32, crdWidth = 32 }>>) -> tensor<8x8xf32, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed), posWidth = 32, crdWidth = 32 }>> loc("<stdin>":27:10)
    "sparse_tensor.print"(%4) : (tensor<8x8xf32, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed), posWidth = 32, crdWidth = 32 }>>) -> () loc("<stdin>":28:5)
    "llvm.call"() <{CConv = #llvm.cconv<ccc>, TailCallKind = #llvm.tailcallkind<none>, callee = @mgpuDestroySparseEnv, fastmathFlags = #llvm.fastmath<none>, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 0, 0>}> : () -> () loc("<stdin>":29:5)
    "func.return"() : () -> () loc("<stdin>":30:5)
  }) : () -> () loc("<stdin>":21:3)
}) : () -> () loc("<stdin>":5:1)
