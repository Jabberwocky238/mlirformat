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
  "func.func"() <{function_type = (tensor<16x32xf16>, tensor<32x16xf16>, tensor<16x16xf16>) -> tensor<16x16xf16>, sym_name = "matmul24"}> ({
  ^bb0(%arg9: tensor<16x32xf16>, %arg10: tensor<32x16xf16>, %arg11: tensor<16x16xf16>):
    %34 = "sparse_tensor.convert"(%arg9) : (tensor<16x32xf16>) -> tensor<16x32xf16, #sparse>
    %35 = "linalg.matmul"(%34, %arg10, %arg11) <{indexing_maps = [#map, #map1, #map2], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg12: f16, %arg13: f16, %arg14: f16):
      %36 = "arith.mulf"(%arg12, %arg13) <{fastmath = #arith.fastmath<none>}> : (f16, f16) -> f16
      %37 = "arith.addf"(%arg14, %36) <{fastmath = #arith.fastmath<none>}> : (f16, f16) -> f16
      "linalg.yield"(%37) : (f16) -> ()
    }) : (tensor<16x32xf16, #sparse>, tensor<32x16xf16>, tensor<16x16xf16>) -> tensor<16x16xf16>
    "func.return"(%35) : (tensor<16x16xf16>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "main"}> ({
    "llvm.call"() <{CConv = #llvm.cconv<ccc>, TailCallKind = #llvm.tailcallkind<none>, callee = @mgpuCreateSparseLtEnv, fastmathFlags = #llvm.fastmath<none>, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 0, 0>}> : () -> ()
    %0 = "arith.constant"() <{value = 0.000000e+00 : f16}> : () -> f16
    %1 = "arith.constant"() <{value = 0 : index}> : () -> index
    %2 = "arith.constant"() <{value = 1 : index}> : () -> index
    %3 = "arith.constant"() <{value = 2 : index}> : () -> index
    %4 = "arith.constant"() <{value = 8 : index}> : () -> index
    %5 = "arith.constant"() <{value = 16 : index}> : () -> index
    %6 = "arith.constant"() <{value = 32 : index}> : () -> index
    %7 = "arith.constant"() <{value = 64 : index}> : () -> index
    %8 = "tensor.generate"() ({
    ^bb0(%arg7: index, %arg8: index):
      %24 = "arith.constant"() <{value = 0.000000e+00 : f16}> : () -> f16
      %25 = "arith.constant"() <{value = 1.000000e+00 : f16}> : () -> f16
      %26 = "arith.floordivsi"(%arg8, %3) : (index, index) -> index
      %27 = "arith.remsi"(%arg8, %3) : (index, index) -> index
      %28 = "arith.addi"(%arg7, %26) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
      %29 = "arith.index_cast"(%28) : (index) -> i64
      %30 = "arith.uitofp"(%29) : (i64) -> f16
      %31 = "arith.addf"(%30, %25) <{fastmath = #arith.fastmath<none>}> : (f16, f16) -> f16
      %32 = "arith.cmpi"(%27, %1) <{predicate = 0 : i64}> : (index, index) -> i1
      %33 = "arith.select"(%32, %31, %24) : (i1, f16, f16) -> f16
      "tensor.yield"(%33) : (f16) -> ()
    }) : () -> tensor<16x32xf16>
    %9 = "tensor.generate"() ({
    ^bb0(%arg5: index, %arg6: index):
      %18 = "arith.cmpi"(%arg6, %4) <{predicate = 5 : i64}> : (index, index) -> i1
      %19 = "arith.subi"(%arg6, %4) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
      %20 = "arith.select"(%18, %19, %arg6) : (i1, index, index) -> index
      %21 = "arith.subi"(%20, %arg5) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
      %22 = "arith.index_cast"(%21) : (index) -> i64
      %23 = "arith.sitofp"(%22) : (i64) -> f16
      "tensor.yield"(%23) : (f16) -> ()
    }) : () -> tensor<32x16xf16>
    %10 = "tensor.generate"() ({
    ^bb0(%arg3: index, %arg4: index):
      %17 = "arith.constant"() <{value = 0.000000e+00 : f16}> : () -> f16
      "tensor.yield"(%17) : (f16) -> ()
    }) : () -> tensor<16x16xf16>
    "scf.for"(%1, %5, %2) ({
    ^bb0(%arg2: index):
      %16 = "vector.transfer_read"(%8, %arg2, %1, %0) <{in_bounds = [false], operandSegmentSizes = array<i32: 1, 2, 1, 0>, permutation_map = #map3}> : (tensor<16x32xf16>, index, index, f16) -> vector<32xf16>
      "vector.print"(%16) <{punctuation = #vector.punctuation<newline>}> : (vector<32xf16>) -> ()
      "scf.yield"() : () -> ()
    }) : (index, index, index) -> ()
    "scf.for"(%1, %6, %2) ({
    ^bb0(%arg1: index):
      %15 = "vector.transfer_read"(%9, %arg1, %1, %0) <{in_bounds = [false], operandSegmentSizes = array<i32: 1, 2, 1, 0>, permutation_map = #map3}> : (tensor<32x16xf16>, index, index, f16) -> vector<16xf16>
      "vector.print"(%15) <{punctuation = #vector.punctuation<newline>}> : (vector<16xf16>) -> ()
      "scf.yield"() : () -> ()
    }) : (index, index, index) -> ()
    %11 = "arith.constant"() <{value = 1 : index}> : () -> index
    %12 = "arith.constant"() <{value = 32 : index}> : () -> index
    %13 = "func.call"(%8, %9, %10) <{callee = @matmul24}> : (tensor<16x32xf16>, tensor<32x16xf16>, tensor<16x16xf16>) -> tensor<16x16xf16>
    "scf.for"(%1, %5, %2) ({
    ^bb0(%arg0: index):
      %14 = "vector.transfer_read"(%13, %arg0, %1, %0) <{in_bounds = [false], operandSegmentSizes = array<i32: 1, 2, 1, 0>, permutation_map = #map3}> : (tensor<16x16xf16>, index, index, f16) -> vector<16xf16>
      "vector.print"(%14) <{punctuation = #vector.punctuation<newline>}> : (vector<16xf16>) -> ()
      "scf.yield"() : () -> ()
    }) : (index, index, index) -> ()
    "llvm.call"() <{CConv = #llvm.cconv<ccc>, TailCallKind = #llvm.tailcallkind<none>, callee = @mgpuDestroySparseLtEnv, fastmathFlags = #llvm.fastmath<none>, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 0, 0>}> : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

