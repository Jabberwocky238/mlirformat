"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "mgpuCreateSparseLtEnv", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  }) : () -> () loc("<stdin>":7:3)
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "mgpuDestroySparseLtEnv", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  }) : () -> () loc("<stdin>":9:3)
  "func.func"() <{function_type = (tensor<16x32xf16>, tensor<32x16xf16>, tensor<16x16xf16>) -> tensor<16x16xf16>, sym_name = "matmul24"}> ({
  ^bb0(%arg9: tensor<16x32xf16> loc("<stdin>":12:8), %arg10: tensor<32x16xf16> loc("<stdin>":12:34), %arg11: tensor<16x16xf16> loc("<stdin>":12:61)):
    %34 = "sparse_tensor.convert"(%arg9) : (tensor<16x32xf16>) -> tensor<16x32xf16, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 floordiv 4 : dense, d1 mod 4 : structured[2, 4]) }>> loc("<stdin>":13:11)
    %35 = "linalg.matmul"(%34, %arg10, %arg11) <{indexing_maps = [affine_map<(d0, d1, d2) -> (d0, d2)>, affine_map<(d0, d1, d2) -> (d2, d1)>, affine_map<(d0, d1, d2) -> (d0, d1)>], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg12: f16 loc("<stdin>":15:10), %arg13: f16 loc("<stdin>":15:23), %arg14: f16 loc("<stdin>":15:36)):
      %36 = "arith.mulf"(%arg12, %arg13) <{fastmath = #arith.fastmath<none>}> : (f16, f16) -> f16 loc("<stdin>":16:13)
      %37 = "arith.addf"(%arg14, %36) <{fastmath = #arith.fastmath<none>}> : (f16, f16) -> f16 loc("<stdin>":17:13)
      "linalg.yield"(%37) : (f16) -> () loc("<stdin>":18:7)
    }) : (tensor<16x32xf16, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 floordiv 4 : dense, d1 mod 4 : structured[2, 4]) }>>, tensor<32x16xf16>, tensor<16x16xf16>) -> tensor<16x16xf16> loc("<stdin>":14:11)
    "func.return"(%35) : (tensor<16x16xf16>) -> () loc("<stdin>":20:5)
  }) : () -> () loc("<stdin>":11:3)
  "func.func"() <{function_type = () -> (), sym_name = "main"}> ({
    "llvm.call"() <{CConv = #llvm.cconv<ccc>, TailCallKind = #llvm.tailcallkind<none>, callee = @mgpuCreateSparseLtEnv, fastmathFlags = #llvm.fastmath<none>, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 0, 0>}> : () -> () loc("<stdin>":23:5)
    %0 = "arith.constant"() <{value = 0.000000e+00 : f16}> : () -> f16 loc("<stdin>":24:10)
    %1 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":25:10)
    %2 = "arith.constant"() <{value = 1 : index}> : () -> index loc("<stdin>":26:10)
    %3 = "arith.constant"() <{value = 2 : index}> : () -> index loc("<stdin>":27:10)
    %4 = "arith.constant"() <{value = 8 : index}> : () -> index loc("<stdin>":28:10)
    %5 = "arith.constant"() <{value = 16 : index}> : () -> index loc("<stdin>":29:10)
    %6 = "arith.constant"() <{value = 32 : index}> : () -> index loc("<stdin>":30:10)
    %7 = "arith.constant"() <{value = 64 : index}> : () -> index loc("<stdin>":31:10)
    %8 = "tensor.generate"() ({
    ^bb0(%arg7: index loc("<stdin>":33:10), %arg8: index loc("<stdin>":33:24)):
      %24 = "arith.constant"() <{value = 0.000000e+00 : f16}> : () -> f16 loc("<stdin>":34:13)
      %25 = "arith.constant"() <{value = 1.000000e+00 : f16}> : () -> f16 loc("<stdin>":35:13)
      %26 = "arith.floordivsi"(%arg8, %3) : (index, index) -> index loc("<stdin>":36:13)
      %27 = "arith.remsi"(%arg8, %3) : (index, index) -> index loc("<stdin>":37:13)
      %28 = "arith.addi"(%arg7, %26) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index loc("<stdin>":38:13)
      %29 = "arith.index_cast"(%28) : (index) -> i64 loc("<stdin>":39:13)
      %30 = "arith.uitofp"(%29) : (i64) -> f16 loc("<stdin>":40:13)
      %31 = "arith.addf"(%30, %25) <{fastmath = #arith.fastmath<none>}> : (f16, f16) -> f16 loc("<stdin>":41:13)
      %32 = "arith.cmpi"(%27, %1) <{predicate = 0 : i64}> : (index, index) -> i1 loc("<stdin>":42:13)
      %33 = "arith.select"(%32, %31, %24) : (i1, f16, f16) -> f16 loc("<stdin>":43:13)
      "tensor.yield"(%33) : (f16) -> () loc("<stdin>":44:7)
    }) : () -> tensor<16x32xf16> loc("<stdin>":32:10)
    %9 = "tensor.generate"() ({
    ^bb0(%arg5: index loc("<stdin>":47:10), %arg6: index loc("<stdin>":47:24)):
      %18 = "arith.cmpi"(%arg6, %4) <{predicate = 5 : i64}> : (index, index) -> i1 loc("<stdin>":48:13)
      %19 = "arith.subi"(%arg6, %4) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index loc("<stdin>":49:13)
      %20 = "arith.select"(%18, %19, %arg6) : (i1, index, index) -> index loc("<stdin>":50:13)
      %21 = "arith.subi"(%20, %arg5) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index loc("<stdin>":51:13)
      %22 = "arith.index_cast"(%21) : (index) -> i64 loc("<stdin>":52:13)
      %23 = "arith.sitofp"(%22) : (i64) -> f16 loc("<stdin>":53:13)
      "tensor.yield"(%23) : (f16) -> () loc("<stdin>":54:7)
    }) : () -> tensor<32x16xf16> loc("<stdin>":46:10)
    %10 = "tensor.generate"() ({
    ^bb0(%arg3: index loc("<stdin>":57:10), %arg4: index loc("<stdin>":57:24)):
      %17 = "arith.constant"() <{value = 0.000000e+00 : f16}> : () -> f16 loc("<stdin>":58:13)
      "tensor.yield"(%17) : (f16) -> () loc("<stdin>":59:7)
    }) : () -> tensor<16x16xf16> loc("<stdin>":56:11)
    "scf.for"(%1, %5, %2) ({
    ^bb0(%arg2: index loc("<stdin>":62:10)):
      %16 = "vector.transfer_read"(%8, %arg2, %1, %0) <{in_bounds = [false], operandSegmentSizes = array<i32: 1, 2, 1, 0>, permutation_map = affine_map<(d0, d1) -> (d1)>}> : (tensor<16x32xf16>, index, index, f16) -> vector<32xf16> loc("<stdin>":63:13)
      "vector.print"(%16) <{punctuation = #vector.punctuation<newline>}> : (vector<32xf16>) -> () loc("<stdin>":64:7)
      "scf.yield"() : () -> () loc("<stdin>":65:7)
    }) : (index, index, index) -> () loc("<stdin>":61:5)
    "scf.for"(%1, %6, %2) ({
    ^bb0(%arg1: index loc("<stdin>":68:10)):
      %15 = "vector.transfer_read"(%9, %arg1, %1, %0) <{in_bounds = [false], operandSegmentSizes = array<i32: 1, 2, 1, 0>, permutation_map = affine_map<(d0, d1) -> (d1)>}> : (tensor<32x16xf16>, index, index, f16) -> vector<16xf16> loc("<stdin>":69:13)
      "vector.print"(%15) <{punctuation = #vector.punctuation<newline>}> : (vector<16xf16>) -> () loc("<stdin>":70:7)
      "scf.yield"() : () -> () loc("<stdin>":71:7)
    }) : (index, index, index) -> () loc("<stdin>":67:5)
    %11 = "arith.constant"() <{value = 1 : index}> : () -> index loc("<stdin>":73:11)
    %12 = "arith.constant"() <{value = 32 : index}> : () -> index loc("<stdin>":74:11)
    %13 = "func.call"(%8, %9, %10) <{callee = @matmul24}> : (tensor<16x32xf16>, tensor<32x16xf16>, tensor<16x16xf16>) -> tensor<16x16xf16> loc("<stdin>":75:11)
    "scf.for"(%1, %5, %2) ({
    ^bb0(%arg0: index loc("<stdin>":77:10)):
      %14 = "vector.transfer_read"(%13, %arg0, %1, %0) <{in_bounds = [false], operandSegmentSizes = array<i32: 1, 2, 1, 0>, permutation_map = affine_map<(d0, d1) -> (d1)>}> : (tensor<16x16xf16>, index, index, f16) -> vector<16xf16> loc("<stdin>":78:13)
      "vector.print"(%14) <{punctuation = #vector.punctuation<newline>}> : (vector<16xf16>) -> () loc("<stdin>":79:7)
      "scf.yield"() : () -> () loc("<stdin>":80:7)
    }) : (index, index, index) -> () loc("<stdin>":76:5)
    "llvm.call"() <{CConv = #llvm.cconv<ccc>, TailCallKind = #llvm.tailcallkind<none>, callee = @mgpuDestroySparseLtEnv, fastmathFlags = #llvm.fastmath<none>, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 0, 0>}> : () -> () loc("<stdin>":82:5)
    "func.return"() : () -> () loc("<stdin>":83:5)
  }) : () -> () loc("<stdin>":22:3)
}) : () -> () loc("<stdin>":6:1)
