"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "mgpuCreateSparseEnv", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  }) : () -> () loc("<stdin>":9:3)
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "mgpuDestroySparseEnv", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  }) : () -> () loc("<stdin>":11:3)
  "func.func"() <{function_type = (tensor<8x8xf32, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed(nonunique), d1 : singleton) }>>, tensor<8x8xf32>, tensor<8x8xf32>) -> tensor<8x8xf32>, sym_name = "matmulCOO"}> ({
  ^bb0(%arg20: tensor<8x8xf32, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed(nonunique), d1 : singleton) }>> loc("<stdin>":14:8), %arg21: tensor<8x8xf32> loc("<stdin>":14:42), %arg22: tensor<8x8xf32> loc("<stdin>":14:67)):
    %28 = "linalg.matmul"(%arg20, %arg21, %arg22) <{indexing_maps = [affine_map<(d0, d1, d2) -> (d0, d2)>, affine_map<(d0, d1, d2) -> (d2, d1)>, affine_map<(d0, d1, d2) -> (d0, d1)>], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg23: f32 loc("<stdin>":16:10), %arg24: f32 loc("<stdin>":16:23), %arg25: f32 loc("<stdin>":16:36)):
      %29 = "arith.mulf"(%arg23, %arg24) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32 loc("<stdin>":17:13)
      %30 = "arith.addf"(%arg25, %29) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32 loc("<stdin>":18:13)
      "linalg.yield"(%30) : (f32) -> () loc("<stdin>":19:7)
    }) : (tensor<8x8xf32, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed(nonunique), d1 : singleton) }>>, tensor<8x8xf32>, tensor<8x8xf32>) -> tensor<8x8xf32> loc("<stdin>":15:11)
    "func.return"(%28) : (tensor<8x8xf32>) -> () loc("<stdin>":21:5)
  }) : () -> () loc("<stdin>":13:3)
  "func.func"() <{function_type = (tensor<8x8xf32, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed), posWidth = 32, crdWidth = 32 }>>, tensor<8x8xf32>, tensor<8x8xf32>) -> tensor<8x8xf32>, sym_name = "matmulCSR"}> ({
  ^bb0(%arg14: tensor<8x8xf32, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed), posWidth = 32, crdWidth = 32 }>> loc("<stdin>":24:8), %arg15: tensor<8x8xf32> loc("<stdin>":24:43), %arg16: tensor<8x8xf32> loc("<stdin>":24:68)):
    %25 = "linalg.matmul"(%arg14, %arg15, %arg16) <{indexing_maps = [affine_map<(d0, d1, d2) -> (d0, d2)>, affine_map<(d0, d1, d2) -> (d2, d1)>, affine_map<(d0, d1, d2) -> (d0, d1)>], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg17: f32 loc("<stdin>":26:10), %arg18: f32 loc("<stdin>":26:23), %arg19: f32 loc("<stdin>":26:36)):
      %26 = "arith.mulf"(%arg17, %arg18) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32 loc("<stdin>":27:13)
      %27 = "arith.addf"(%arg19, %26) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32 loc("<stdin>":28:13)
      "linalg.yield"(%27) : (f32) -> () loc("<stdin>":29:7)
    }) : (tensor<8x8xf32, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed), posWidth = 32, crdWidth = 32 }>>, tensor<8x8xf32>, tensor<8x8xf32>) -> tensor<8x8xf32> loc("<stdin>":25:11)
    "func.return"(%25) : (tensor<8x8xf32>) -> () loc("<stdin>":31:5)
  }) : () -> () loc("<stdin>":23:3)
  "func.func"() <{function_type = (tensor<8x8xf32, #sparse_tensor.encoding<{ map = (d0, d1) -> (d1 : dense, d0 : compressed), posWidth = 64, crdWidth = 64 }>>, tensor<8x8xf32>, tensor<8x8xf32>) -> tensor<8x8xf32>, sym_name = "matmulCSC"}> ({
  ^bb0(%arg8: tensor<8x8xf32, #sparse_tensor.encoding<{ map = (d0, d1) -> (d1 : dense, d0 : compressed), posWidth = 64, crdWidth = 64 }>> loc("<stdin>":34:8), %arg9: tensor<8x8xf32> loc("<stdin>":34:42), %arg10: tensor<8x8xf32> loc("<stdin>":34:66)):
    %22 = "linalg.matmul"(%arg8, %arg9, %arg10) <{indexing_maps = [affine_map<(d0, d1, d2) -> (d0, d2)>, affine_map<(d0, d1, d2) -> (d2, d1)>, affine_map<(d0, d1, d2) -> (d0, d1)>], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg11: f32 loc("<stdin>":36:10), %arg12: f32 loc("<stdin>":36:23), %arg13: f32 loc("<stdin>":36:36)):
      %23 = "arith.mulf"(%arg11, %arg12) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32 loc("<stdin>":37:13)
      %24 = "arith.addf"(%arg13, %23) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32 loc("<stdin>":38:13)
      "linalg.yield"(%24) : (f32) -> () loc("<stdin>":39:7)
    }) : (tensor<8x8xf32, #sparse_tensor.encoding<{ map = (d0, d1) -> (d1 : dense, d0 : compressed), posWidth = 64, crdWidth = 64 }>>, tensor<8x8xf32>, tensor<8x8xf32>) -> tensor<8x8xf32> loc("<stdin>":35:11)
    "func.return"(%22) : (tensor<8x8xf32>) -> () loc("<stdin>":41:5)
  }) : () -> () loc("<stdin>":33:3)
  "func.func"() <{function_type = (tensor<8x8xf32>) -> (), sym_name = "dump"}> ({
  ^bb0(%arg6: tensor<8x8xf32> loc("<stdin>":44:8)):
    %17 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32 loc("<stdin>":45:11)
    %18 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":46:11)
    %19 = "arith.constant"() <{value = 1 : index}> : () -> index loc("<stdin>":47:11)
    %20 = "arith.constant"() <{value = 8 : index}> : () -> index loc("<stdin>":48:11)
    "scf.for"(%18, %20, %19) ({
    ^bb0(%arg7: index loc("<stdin>":50:10)):
      %21 = "vector.transfer_read"(%arg6, %arg7, %18, %17) <{in_bounds = [false], operandSegmentSizes = array<i32: 1, 2, 1, 0>, permutation_map = affine_map<(d0, d1) -> (d1)>}> : (tensor<8x8xf32>, index, index, f32) -> vector<8xf32> loc("<stdin>":51:13)
      "vector.print"(%21) <{punctuation = #vector.punctuation<newline>}> : (vector<8xf32>) -> () loc("<stdin>":52:7)
      "scf.yield"() : () -> () loc("<stdin>":53:7)
    }) : (index, index, index) -> () loc("<stdin>":49:5)
    "func.return"() : () -> () loc("<stdin>":55:5)
  }) : () -> () loc("<stdin>":43:3)
  "func.func"() <{function_type = () -> (), sym_name = "main"}> ({
    "llvm.call"() <{CConv = #llvm.cconv<ccc>, TailCallKind = #llvm.tailcallkind<none>, callee = @mgpuCreateSparseEnv, fastmathFlags = #llvm.fastmath<none>, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 0, 0>}> : () -> () loc("<stdin>":58:5)
    %0 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32 loc("<stdin>":59:10)
    %1 = "arith.constant"() <{value = 1.000000e+00 : f32}> : () -> f32 loc("<stdin>":60:10)
    %2 = "tensor.generate"() ({
    ^bb0(%arg4: index loc("<stdin>":62:10), %arg5: index loc("<stdin>":62:24)):
      %14 = "arith.addi"(%arg4, %arg5) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index loc("<stdin>":63:13)
      %15 = "arith.index_cast"(%14) : (index) -> i64 loc("<stdin>":64:13)
      %16 = "arith.uitofp"(%15) : (i64) -> f32 loc("<stdin>":65:13)
      "tensor.yield"(%16) : (f32) -> () loc("<stdin>":66:7)
    }) : () -> tensor<8x8xf32> loc("<stdin>":61:10)
    %3 = "sparse_tensor.convert"(%2) : (tensor<8x8xf32>) -> tensor<8x8xf32, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed(nonunique), d1 : singleton) }>> loc("<stdin>":68:10)
    %4 = "sparse_tensor.convert"(%2) : (tensor<8x8xf32>) -> tensor<8x8xf32, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed), posWidth = 32, crdWidth = 32 }>> loc("<stdin>":69:10)
    %5 = "sparse_tensor.convert"(%2) : (tensor<8x8xf32>) -> tensor<8x8xf32, #sparse_tensor.encoding<{ map = (d0, d1) -> (d1 : dense, d0 : compressed), posWidth = 64, crdWidth = 64 }>> loc("<stdin>":70:10)
    %6 = "tensor.generate"() ({
    ^bb0(%arg2: index loc("<stdin>":72:10), %arg3: index loc("<stdin>":72:24)):
      "tensor.yield"(%0) : (f32) -> () loc("<stdin>":73:7)
    }) : () -> tensor<8x8xf32> loc("<stdin>":71:10)
    %7 = "tensor.generate"() ({
    ^bb0(%arg0: index loc("<stdin>":76:10), %arg1: index loc("<stdin>":76:24)):
      "tensor.yield"(%1) : (f32) -> () loc("<stdin>":77:7)
    }) : () -> tensor<8x8xf32> loc("<stdin>":75:10)
    %8 = "func.call"(%3, %2, %6) <{callee = @matmulCOO}> : (tensor<8x8xf32, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed(nonunique), d1 : singleton) }>>, tensor<8x8xf32>, tensor<8x8xf32>) -> tensor<8x8xf32> loc("<stdin>":79:10)
    %9 = "func.call"(%4, %2, %6) <{callee = @matmulCSR}> : (tensor<8x8xf32, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed), posWidth = 32, crdWidth = 32 }>>, tensor<8x8xf32>, tensor<8x8xf32>) -> tensor<8x8xf32> loc("<stdin>":80:10)
    %10 = "func.call"(%5, %2, %6) <{callee = @matmulCSC}> : (tensor<8x8xf32, #sparse_tensor.encoding<{ map = (d0, d1) -> (d1 : dense, d0 : compressed), posWidth = 64, crdWidth = 64 }>>, tensor<8x8xf32>, tensor<8x8xf32>) -> tensor<8x8xf32> loc("<stdin>":81:11)
    %11 = "func.call"(%3, %2, %7) <{callee = @matmulCOO}> : (tensor<8x8xf32, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed(nonunique), d1 : singleton) }>>, tensor<8x8xf32>, tensor<8x8xf32>) -> tensor<8x8xf32> loc("<stdin>":82:11)
    %12 = "func.call"(%4, %2, %7) <{callee = @matmulCSR}> : (tensor<8x8xf32, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed), posWidth = 32, crdWidth = 32 }>>, tensor<8x8xf32>, tensor<8x8xf32>) -> tensor<8x8xf32> loc("<stdin>":83:11)
    %13 = "func.call"(%5, %2, %7) <{callee = @matmulCSC}> : (tensor<8x8xf32, #sparse_tensor.encoding<{ map = (d0, d1) -> (d1 : dense, d0 : compressed), posWidth = 64, crdWidth = 64 }>>, tensor<8x8xf32>, tensor<8x8xf32>) -> tensor<8x8xf32> loc("<stdin>":84:11)
    "func.call"(%8) <{callee = @dump}> : (tensor<8x8xf32>) -> () loc("<stdin>":85:5)
    "func.call"(%9) <{callee = @dump}> : (tensor<8x8xf32>) -> () loc("<stdin>":86:5)
    "func.call"(%10) <{callee = @dump}> : (tensor<8x8xf32>) -> () loc("<stdin>":87:5)
    "func.call"(%11) <{callee = @dump}> : (tensor<8x8xf32>) -> () loc("<stdin>":88:5)
    "func.call"(%12) <{callee = @dump}> : (tensor<8x8xf32>) -> () loc("<stdin>":89:5)
    "func.call"(%13) <{callee = @dump}> : (tensor<8x8xf32>) -> () loc("<stdin>":90:5)
    "bufferization.dealloc_tensor"(%3) : (tensor<8x8xf32, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed(nonunique), d1 : singleton) }>>) -> () loc("<stdin>":91:5)
    "bufferization.dealloc_tensor"(%4) : (tensor<8x8xf32, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed), posWidth = 32, crdWidth = 32 }>>) -> () loc("<stdin>":92:5)
    "bufferization.dealloc_tensor"(%5) : (tensor<8x8xf32, #sparse_tensor.encoding<{ map = (d0, d1) -> (d1 : dense, d0 : compressed), posWidth = 64, crdWidth = 64 }>>) -> () loc("<stdin>":93:5)
    "llvm.call"() <{CConv = #llvm.cconv<ccc>, TailCallKind = #llvm.tailcallkind<none>, callee = @mgpuDestroySparseEnv, fastmathFlags = #llvm.fastmath<none>, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 0, 0>}> : () -> () loc("<stdin>":94:5)
    "func.return"() : () -> () loc("<stdin>":95:5)
  }) : () -> () loc("<stdin>":57:3)
}) : () -> () loc("<stdin>":8:1)
