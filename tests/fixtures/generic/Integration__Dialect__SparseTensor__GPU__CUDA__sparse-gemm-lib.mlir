#map = affine_map<(d0, d1, d2) -> (d0, d2)>
#map1 = affine_map<(d0, d1, d2) -> (d2, d1)>
#map2 = affine_map<(d0, d1, d2) -> (d0, d1)>
#sparse = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed), posWidth = 32, crdWidth = 32 }>
"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "mgpuCreateSparseEnv", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "mgpuDestroySparseEnv", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  }) : () -> ()
  "func.func"() <{function_type = (tensor<8x8xf32, #sparse>, tensor<8x8xf32, #sparse>) -> tensor<8x8xf32, #sparse>, sym_name = "matmulCSR"}> ({
  ^bb0(%arg0: tensor<8x8xf32, #sparse>, %arg1: tensor<8x8xf32, #sparse>):
    %5 = "tensor.empty"() : () -> tensor<8x8xf32, #sparse>
    %6 = "linalg.matmul"(%arg0, %arg1, %5) <{indexing_maps = [#map, #map1, #map2], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg2: f32, %arg3: f32, %arg4: f32):
      %7 = "arith.mulf"(%arg2, %arg3) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %8 = "arith.addf"(%arg4, %7) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%8) : (f32) -> ()
    }) : (tensor<8x8xf32, #sparse>, tensor<8x8xf32, #sparse>, tensor<8x8xf32, #sparse>) -> tensor<8x8xf32, #sparse>
    "func.return"(%6) : (tensor<8x8xf32, #sparse>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "main"}> ({
    "llvm.call"() <{CConv = #llvm.cconv<ccc>, TailCallKind = #llvm.tailcallkind<none>, callee = @mgpuCreateSparseEnv, fastmathFlags = #llvm.fastmath<none>, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 0, 0>}> : () -> ()
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %2 = "arith.constant"() <{value = dense<[[1.000000e+00, 0.000000e+00, 2.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, 3.000000e+00], [0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00], [0.000000e+00, 0.000000e+00, 4.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00], [0.000000e+00, 0.000000e+00, 0.000000e+00, 5.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00], [0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, 6.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00], [0.000000e+00, 7.000000e+00, 8.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, 9.000000e+00], [0.000000e+00, 0.000000e+00, 1.000000e+01, 0.000000e+00, 0.000000e+00, 0.000000e+00, 1.100000e+01, 1.200000e+01], [0.000000e+00, 1.300000e+01, 1.400000e+01, 0.000000e+00, 0.000000e+00, 0.000000e+00, 1.500000e+01, 1.600000e+01]]> : tensor<8x8xf32>}> : () -> tensor<8x8xf32>
    %3 = "sparse_tensor.convert"(%2) : (tensor<8x8xf32>) -> tensor<8x8xf32, #sparse>
    %4 = "func.call"(%3, %3) <{callee = @matmulCSR}> : (tensor<8x8xf32, #sparse>, tensor<8x8xf32, #sparse>) -> tensor<8x8xf32, #sparse>
    "sparse_tensor.print"(%4) : (tensor<8x8xf32, #sparse>) -> ()
    "llvm.call"() <{CConv = #llvm.cconv<ccc>, TailCallKind = #llvm.tailcallkind<none>, callee = @mgpuDestroySparseEnv, fastmathFlags = #llvm.fastmath<none>, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 0, 0>}> : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

