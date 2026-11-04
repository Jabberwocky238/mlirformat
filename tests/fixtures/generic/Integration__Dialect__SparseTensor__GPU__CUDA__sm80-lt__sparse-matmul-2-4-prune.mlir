#map = affine_map<(d0, d1, d2) -> (d0, d2)>
#map1 = affine_map<(d0, d1, d2) -> (d2, d1)>
#map2 = affine_map<(d0, d1, d2) -> (d0, d1)>
#map3 = affine_map<(d0, d1) -> (d1)>
#sparse = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 floordiv 4 : dense, d1 mod 4 : structured[2, 4]) }>
"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "mgpuCreateSparseLtEnv", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "mgpuDestroySparseLtEnv", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  }) : () -> ()
  "func.func"() <{function_type = (tensor<16x16xf16>, tensor<16x16xf16>, tensor<16x16xf16>) -> tensor<16x16xf16>, sym_name = "matmul24"}> ({
  ^bb0(%arg8: tensor<16x16xf16>, %arg9: tensor<16x16xf16>, %arg10: tensor<16x16xf16>):
    %17 = "sparse_tensor.convert"(%arg8) : (tensor<16x16xf16>) -> tensor<16x16xf16, #sparse>
    %18 = "linalg.matmul"(%17, %arg9, %arg10) <{indexing_maps = [#map, #map1, #map2], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg11: f16, %arg12: f16, %arg13: f16):
      %19 = "arith.mulf"(%arg11, %arg12) <{fastmath = #arith.fastmath<none>}> : (f16, f16) -> f16
      %20 = "arith.addf"(%arg13, %19) <{fastmath = #arith.fastmath<none>}> : (f16, f16) -> f16
      "linalg.yield"(%20) : (f16) -> ()
    }) : (tensor<16x16xf16, #sparse>, tensor<16x16xf16>, tensor<16x16xf16>) -> tensor<16x16xf16>
    "func.return"(%18) : (tensor<16x16xf16>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "main"}> ({
    "llvm.call"() <{CConv = #llvm.cconv<ccc>, TailCallKind = #llvm.tailcallkind<none>, callee = @mgpuCreateSparseLtEnv, fastmathFlags = #llvm.fastmath<none>, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 0, 0>}> : () -> ()
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = 1 : index}> : () -> index
    %2 = "arith.constant"() <{value = 16 : index}> : () -> index
    %3 = "arith.constant"() <{value = 0.000000e+00 : f16}> : () -> f16
    %4 = "arith.constant"() <{value = 1.000000e+00 : f16}> : () -> f16
    %5 = "arith.constant"() <{value = 4.000000e+00 : f16}> : () -> f16
    %6 = "tensor.generate"() ({
    ^bb0(%arg6: index, %arg7: index):
      %14 = "arith.andi"(%arg7, %1) : (index, index) -> index
      %15 = "arith.cmpi"(%14, %0) <{predicate = 0 : i64}> : (index, index) -> i1
      %16 = "arith.select"(%15, %5, %4) : (i1, f16, f16) -> f16
      "tensor.yield"(%16) : (f16) -> ()
    }) : () -> tensor<16x16xf16>
    %7 = "tensor.generate"() ({
    ^bb0(%arg4: index, %arg5: index):
      %12 = "arith.cmpi"(%arg4, %arg5) <{predicate = 0 : i64}> : (index, index) -> i1
      %13 = "arith.select"(%12, %4, %3) : (i1, f16, f16) -> f16
      "tensor.yield"(%13) : (f16) -> ()
    }) : () -> tensor<16x16xf16>
    %8 = "tensor.generate"() ({
    ^bb0(%arg2: index, %arg3: index):
      "tensor.yield"(%3) : (f16) -> ()
    }) : () -> tensor<16x16xf16>
    %9 = "func.call"(%6, %7, %8) <{callee = @matmul24}> : (tensor<16x16xf16>, tensor<16x16xf16>, tensor<16x16xf16>) -> tensor<16x16xf16>
    "scf.for"(%0, %2, %1) ({
    ^bb0(%arg1: index):
      %11 = "vector.transfer_read"(%6, %arg1, %0, %3) <{in_bounds = [false], operandSegmentSizes = array<i32: 1, 2, 1, 0>, permutation_map = #map3}> : (tensor<16x16xf16>, index, index, f16) -> vector<16xf16>
      "vector.print"(%11) <{punctuation = #vector.punctuation<newline>}> : (vector<16xf16>) -> ()
      "scf.yield"() : () -> ()
    }) : (index, index, index) -> ()
    "scf.for"(%0, %2, %1) ({
    ^bb0(%arg0: index):
      %10 = "vector.transfer_read"(%9, %arg0, %0, %3) <{in_bounds = [false], operandSegmentSizes = array<i32: 1, 2, 1, 0>, permutation_map = #map3}> : (tensor<16x16xf16>, index, index, f16) -> vector<16xf16>
      "vector.print"(%10) <{punctuation = #vector.punctuation<newline>}> : (vector<16xf16>) -> ()
      "scf.yield"() : () -> ()
    }) : (index, index, index) -> ()
    "llvm.call"() <{CConv = #llvm.cconv<ccc>, TailCallKind = #llvm.tailcallkind<none>, callee = @mgpuDestroySparseLtEnv, fastmathFlags = #llvm.fastmath<none>, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 0, 0>}> : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

