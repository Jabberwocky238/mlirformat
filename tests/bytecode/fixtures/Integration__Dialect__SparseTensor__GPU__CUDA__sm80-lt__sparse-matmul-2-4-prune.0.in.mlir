"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "mgpuCreateSparseLtEnv", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  }) : () -> () loc("<stdin>":7:3)
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "mgpuDestroySparseLtEnv", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  }) : () -> () loc("<stdin>":9:3)
  "func.func"() <{function_type = (tensor<16x16xf16>, tensor<16x16xf16>, tensor<16x16xf16>) -> tensor<16x16xf16>, sym_name = "matmul24"}> ({
  ^bb0(%arg8: tensor<16x16xf16> loc("<stdin>":12:8), %arg9: tensor<16x16xf16> loc("<stdin>":12:34), %arg10: tensor<16x16xf16> loc("<stdin>":12:60)):
    %17 = "sparse_tensor.convert"(%arg8) : (tensor<16x16xf16>) -> tensor<16x16xf16, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 floordiv 4 : dense, d1 mod 4 : structured[2, 4]) }>> loc("<stdin>":13:11)
    %18 = "linalg.matmul"(%17, %arg9, %arg10) <{indexing_maps = [affine_map<(d0, d1, d2) -> (d0, d2)>, affine_map<(d0, d1, d2) -> (d2, d1)>, affine_map<(d0, d1, d2) -> (d0, d1)>], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg11: f16 loc("<stdin>":15:10), %arg12: f16 loc("<stdin>":15:23), %arg13: f16 loc("<stdin>":15:36)):
      %19 = "arith.mulf"(%arg11, %arg12) <{fastmath = #arith.fastmath<none>}> : (f16, f16) -> f16 loc("<stdin>":16:13)
      %20 = "arith.addf"(%arg13, %19) <{fastmath = #arith.fastmath<none>}> : (f16, f16) -> f16 loc("<stdin>":17:13)
      "linalg.yield"(%20) : (f16) -> () loc("<stdin>":18:7)
    }) : (tensor<16x16xf16, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 floordiv 4 : dense, d1 mod 4 : structured[2, 4]) }>>, tensor<16x16xf16>, tensor<16x16xf16>) -> tensor<16x16xf16> loc("<stdin>":14:11)
    "func.return"(%18) : (tensor<16x16xf16>) -> () loc("<stdin>":20:5)
  }) : () -> () loc("<stdin>":11:3)
  "func.func"() <{function_type = () -> (), sym_name = "main"}> ({
    "llvm.call"() <{CConv = #llvm.cconv<ccc>, TailCallKind = #llvm.tailcallkind<none>, callee = @mgpuCreateSparseLtEnv, fastmathFlags = #llvm.fastmath<none>, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 0, 0>}> : () -> () loc("<stdin>":23:5)
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":24:10)
    %1 = "arith.constant"() <{value = 1 : index}> : () -> index loc("<stdin>":25:10)
    %2 = "arith.constant"() <{value = 16 : index}> : () -> index loc("<stdin>":26:10)
    %3 = "arith.constant"() <{value = 0.000000e+00 : f16}> : () -> f16 loc("<stdin>":27:10)
    %4 = "arith.constant"() <{value = 1.000000e+00 : f16}> : () -> f16 loc("<stdin>":28:10)
    %5 = "arith.constant"() <{value = 4.000000e+00 : f16}> : () -> f16 loc("<stdin>":29:10)
    %6 = "tensor.generate"() ({
    ^bb0(%arg6: index loc("<stdin>":31:10), %arg7: index loc("<stdin>":31:24)):
      %14 = "arith.andi"(%arg7, %1) : (index, index) -> index loc("<stdin>":32:13)
      %15 = "arith.cmpi"(%14, %0) <{predicate = 0 : i64}> : (index, index) -> i1 loc("<stdin>":33:13)
      %16 = "arith.select"(%15, %5, %4) : (i1, f16, f16) -> f16 loc("<stdin>":34:13)
      "tensor.yield"(%16) : (f16) -> () loc("<stdin>":35:7)
    }) : () -> tensor<16x16xf16> loc("<stdin>":30:10)
    %7 = "tensor.generate"() ({
    ^bb0(%arg4: index loc("<stdin>":38:10), %arg5: index loc("<stdin>":38:24)):
      %12 = "arith.cmpi"(%arg4, %arg5) <{predicate = 0 : i64}> : (index, index) -> i1 loc("<stdin>":39:13)
      %13 = "arith.select"(%12, %4, %3) : (i1, f16, f16) -> f16 loc("<stdin>":40:13)
      "tensor.yield"(%13) : (f16) -> () loc("<stdin>":41:7)
    }) : () -> tensor<16x16xf16> loc("<stdin>":37:10)
    %8 = "tensor.generate"() ({
    ^bb0(%arg2: index loc("<stdin>":44:10), %arg3: index loc("<stdin>":44:24)):
      "tensor.yield"(%3) : (f16) -> () loc("<stdin>":45:7)
    }) : () -> tensor<16x16xf16> loc("<stdin>":43:10)
    %9 = "func.call"(%6, %7, %8) <{callee = @matmul24}> : (tensor<16x16xf16>, tensor<16x16xf16>, tensor<16x16xf16>) -> tensor<16x16xf16> loc("<stdin>":47:10)
    "scf.for"(%0, %2, %1) ({
    ^bb0(%arg1: index loc("<stdin>":49:10)):
      %11 = "vector.transfer_read"(%6, %arg1, %0, %3) <{in_bounds = [false], operandSegmentSizes = array<i32: 1, 2, 1, 0>, permutation_map = affine_map<(d0, d1) -> (d1)>}> : (tensor<16x16xf16>, index, index, f16) -> vector<16xf16> loc("<stdin>":50:13)
      "vector.print"(%11) <{punctuation = #vector.punctuation<newline>}> : (vector<16xf16>) -> () loc("<stdin>":51:7)
      "scf.yield"() : () -> () loc("<stdin>":52:7)
    }) : (index, index, index) -> () loc("<stdin>":48:5)
    "scf.for"(%0, %2, %1) ({
    ^bb0(%arg0: index loc("<stdin>":55:10)):
      %10 = "vector.transfer_read"(%9, %arg0, %0, %3) <{in_bounds = [false], operandSegmentSizes = array<i32: 1, 2, 1, 0>, permutation_map = affine_map<(d0, d1) -> (d1)>}> : (tensor<16x16xf16>, index, index, f16) -> vector<16xf16> loc("<stdin>":56:13)
      "vector.print"(%10) <{punctuation = #vector.punctuation<newline>}> : (vector<16xf16>) -> () loc("<stdin>":57:7)
      "scf.yield"() : () -> () loc("<stdin>":58:7)
    }) : (index, index, index) -> () loc("<stdin>":54:5)
    "llvm.call"() <{CConv = #llvm.cconv<ccc>, TailCallKind = #llvm.tailcallkind<none>, callee = @mgpuDestroySparseLtEnv, fastmathFlags = #llvm.fastmath<none>, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 0, 0>}> : () -> () loc("<stdin>":60:5)
    "func.return"() : () -> () loc("<stdin>":61:5)
  }) : () -> () loc("<stdin>":22:3)
}) : () -> () loc("<stdin>":6:1)
