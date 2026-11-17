"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "mgpuCreateSparseEnv", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  }) : () -> () loc("<stdin>":9:3)
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "mgpuDestroySparseEnv", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  }) : () -> () loc("<stdin>":11:3)
  "func.func"() <{function_type = (tensor<?x?xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed(nonunique), d1 : singleton) }>>, tensor<?xf64>, tensor<?xf64>) -> tensor<?xf64>, sym_name = "matvecCOO"}> ({
  ^bb0(%arg17: tensor<?x?xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed(nonunique), d1 : singleton) }>> loc("<stdin>":14:8), %arg18: tensor<?xf64> loc("<stdin>":14:42), %arg19: tensor<?xf64> loc("<stdin>":14:65)):
    %37 = "linalg.matvec"(%arg17, %arg18, %arg19) <{operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg20: f64 loc("<stdin>":16:10), %arg21: f64 loc("<stdin>":16:23), %arg22: f64 loc("<stdin>":16:36)):
      %38 = "arith.mulf"(%arg20, %arg21) <{fastmath = #arith.fastmath<none>}> : (f64, f64) -> f64 loc("<stdin>":17:13)
      %39 = "arith.addf"(%arg22, %38) <{fastmath = #arith.fastmath<none>}> : (f64, f64) -> f64 loc("<stdin>":18:13)
      "linalg.yield"(%39) : (f64) -> () loc("<stdin>":19:7)
    }) {linalg.memoized_indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d1)>, affine_map<(d0, d1) -> (d0)>]} : (tensor<?x?xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed(nonunique), d1 : singleton) }>>, tensor<?xf64>, tensor<?xf64>) -> tensor<?xf64> loc("<stdin>":15:11)
    "func.return"(%37) : (tensor<?xf64>) -> () loc("<stdin>":21:5)
  }) : () -> () loc("<stdin>":13:3)
  "func.func"() <{function_type = (tensor<?x?xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed), posWidth = 32, crdWidth = 32 }>>, tensor<?xf64>, tensor<?xf64>) -> tensor<?xf64>, sym_name = "matvecCSR"}> ({
  ^bb0(%arg11: tensor<?x?xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed), posWidth = 32, crdWidth = 32 }>> loc("<stdin>":24:8), %arg12: tensor<?xf64> loc("<stdin>":24:43), %arg13: tensor<?xf64> loc("<stdin>":24:66)):
    %34 = "linalg.matvec"(%arg11, %arg12, %arg13) <{operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg14: f64 loc("<stdin>":26:10), %arg15: f64 loc("<stdin>":26:23), %arg16: f64 loc("<stdin>":26:36)):
      %35 = "arith.mulf"(%arg14, %arg15) <{fastmath = #arith.fastmath<none>}> : (f64, f64) -> f64 loc("<stdin>":27:13)
      %36 = "arith.addf"(%arg16, %35) <{fastmath = #arith.fastmath<none>}> : (f64, f64) -> f64 loc("<stdin>":28:13)
      "linalg.yield"(%36) : (f64) -> () loc("<stdin>":29:7)
    }) {linalg.memoized_indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d1)>, affine_map<(d0, d1) -> (d0)>]} : (tensor<?x?xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed), posWidth = 32, crdWidth = 32 }>>, tensor<?xf64>, tensor<?xf64>) -> tensor<?xf64> loc("<stdin>":25:11)
    "func.return"(%34) : (tensor<?xf64>) -> () loc("<stdin>":31:5)
  }) : () -> () loc("<stdin>":23:3)
  "func.func"() <{function_type = (tensor<?x?xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d1 : dense, d0 : compressed), posWidth = 64, crdWidth = 64 }>>, tensor<?xf64>, tensor<?xf64>) -> tensor<?xf64>, sym_name = "matvecCSC"}> ({
  ^bb0(%arg5: tensor<?x?xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d1 : dense, d0 : compressed), posWidth = 64, crdWidth = 64 }>> loc("<stdin>":34:8), %arg6: tensor<?xf64> loc("<stdin>":34:42), %arg7: tensor<?xf64> loc("<stdin>":34:64)):
    %31 = "linalg.matvec"(%arg5, %arg6, %arg7) <{operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg8: f64 loc("<stdin>":36:10), %arg9: f64 loc("<stdin>":36:22), %arg10: f64 loc("<stdin>":36:34)):
      %32 = "arith.mulf"(%arg8, %arg9) <{fastmath = #arith.fastmath<none>}> : (f64, f64) -> f64 loc("<stdin>":37:13)
      %33 = "arith.addf"(%arg10, %32) <{fastmath = #arith.fastmath<none>}> : (f64, f64) -> f64 loc("<stdin>":38:13)
      "linalg.yield"(%33) : (f64) -> () loc("<stdin>":39:7)
    }) {linalg.memoized_indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d1)>, affine_map<(d0, d1) -> (d0)>]} : (tensor<?x?xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d1 : dense, d0 : compressed), posWidth = 64, crdWidth = 64 }>>, tensor<?xf64>, tensor<?xf64>) -> tensor<?xf64> loc("<stdin>":35:11)
    "func.return"(%31) : (tensor<?xf64>) -> () loc("<stdin>":41:5)
  }) : () -> () loc("<stdin>":33:3)
  "func.func"() <{function_type = () -> (), sym_name = "main"}> ({
    "llvm.call"() <{CConv = #llvm.cconv<ccc>, TailCallKind = #llvm.tailcallkind<none>, callee = @mgpuCreateSparseEnv, fastmathFlags = #llvm.fastmath<none>, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 0, 0>}> : () -> () loc("<stdin>":44:5)
    %0 = "arith.constant"() <{value = 0.000000e+00 : f64}> : () -> f64 loc("<stdin>":45:10)
    %1 = "arith.constant"() <{value = 1.000000e+00 : f64}> : () -> f64 loc("<stdin>":46:10)
    %2 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":47:10)
    %3 = "arith.constant"() <{value = 1 : index}> : () -> index loc("<stdin>":48:10)
    %4 = "tensor.generate"() ({
    ^bb0(%arg3: index loc("<stdin>":50:10), %arg4: index loc("<stdin>":50:24)):
      %28 = "arith.addi"(%arg3, %arg4) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index loc("<stdin>":51:13)
      %29 = "arith.index_cast"(%28) : (index) -> i64 loc("<stdin>":52:13)
      %30 = "arith.uitofp"(%29) : (i64) -> f64 loc("<stdin>":53:13)
      "tensor.yield"(%30) : (f64) -> () loc("<stdin>":54:7)
    }) : () -> tensor<64x64xf64> loc("<stdin>":49:10)
    %5 = "sparse_tensor.convert"(%4) : (tensor<64x64xf64>) -> tensor<?x?xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed(nonunique), d1 : singleton) }>> loc("<stdin>":56:10)
    %6 = "sparse_tensor.convert"(%4) : (tensor<64x64xf64>) -> tensor<?x?xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed), posWidth = 32, crdWidth = 32 }>> loc("<stdin>":57:10)
    %7 = "sparse_tensor.convert"(%4) : (tensor<64x64xf64>) -> tensor<?x?xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d1 : dense, d0 : compressed), posWidth = 64, crdWidth = 64 }>> loc("<stdin>":58:10)
    %8 = "tensor.dim"(%5, %3) : (tensor<?x?xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed(nonunique), d1 : singleton) }>>, index) -> index loc("<stdin>":59:10)
    %9 = "tensor.generate"(%8) ({
    ^bb0(%arg2: index loc("<stdin>":61:10)):
      %25 = "arith.addi"(%arg2, %3) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index loc("<stdin>":62:13)
      %26 = "arith.index_cast"(%25) : (index) -> i64 loc("<stdin>":63:13)
      %27 = "arith.uitofp"(%26) : (i64) -> f64 loc("<stdin>":64:13)
      "tensor.yield"(%27) : (f64) -> () loc("<stdin>":65:7)
    }) : (index) -> tensor<?xf64> loc("<stdin>":60:10)
    %10 = "tensor.dim"(%5, %2) : (tensor<?x?xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed(nonunique), d1 : singleton) }>>, index) -> index loc("<stdin>":67:11)
    %11 = "tensor.generate"(%10) ({
    ^bb0(%arg1: index loc("<stdin>":69:10)):
      "tensor.yield"(%0) : (f64) -> () loc("<stdin>":70:7)
    }) : (index) -> tensor<?xf64> loc("<stdin>":68:11)
    %12 = "tensor.generate"(%10) ({
    ^bb0(%arg0: index loc("<stdin>":73:10)):
      "tensor.yield"(%1) : (f64) -> () loc("<stdin>":74:7)
    }) : (index) -> tensor<?xf64> loc("<stdin>":72:11)
    %13 = "func.call"(%5, %9, %11) <{callee = @matvecCOO}> : (tensor<?x?xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed(nonunique), d1 : singleton) }>>, tensor<?xf64>, tensor<?xf64>) -> tensor<?xf64> loc("<stdin>":76:11)
    %14 = "func.call"(%6, %9, %11) <{callee = @matvecCSR}> : (tensor<?x?xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed), posWidth = 32, crdWidth = 32 }>>, tensor<?xf64>, tensor<?xf64>) -> tensor<?xf64> loc("<stdin>":77:11)
    %15 = "func.call"(%7, %9, %11) <{callee = @matvecCSC}> : (tensor<?x?xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d1 : dense, d0 : compressed), posWidth = 64, crdWidth = 64 }>>, tensor<?xf64>, tensor<?xf64>) -> tensor<?xf64> loc("<stdin>":78:11)
    %16 = "func.call"(%5, %9, %12) <{callee = @matvecCOO}> : (tensor<?x?xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed(nonunique), d1 : singleton) }>>, tensor<?xf64>, tensor<?xf64>) -> tensor<?xf64> loc("<stdin>":79:11)
    %17 = "func.call"(%6, %9, %12) <{callee = @matvecCSR}> : (tensor<?x?xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed), posWidth = 32, crdWidth = 32 }>>, tensor<?xf64>, tensor<?xf64>) -> tensor<?xf64> loc("<stdin>":80:11)
    %18 = "func.call"(%7, %9, %12) <{callee = @matvecCSC}> : (tensor<?x?xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d1 : dense, d0 : compressed), posWidth = 64, crdWidth = 64 }>>, tensor<?xf64>, tensor<?xf64>) -> tensor<?xf64> loc("<stdin>":81:11)
    %19 = "vector.transfer_read"(%13, %2, %0) <{in_bounds = [false], operandSegmentSizes = array<i32: 1, 1, 1, 0>, permutation_map = affine_map<(d0) -> (d0)>}> : (tensor<?xf64>, index, f64) -> vector<64xf64> loc("<stdin>":82:11)
    "vector.print"(%19) <{punctuation = #vector.punctuation<newline>}> : (vector<64xf64>) -> () loc("<stdin>":83:5)
    %20 = "vector.transfer_read"(%14, %2, %0) <{in_bounds = [false], operandSegmentSizes = array<i32: 1, 1, 1, 0>, permutation_map = affine_map<(d0) -> (d0)>}> : (tensor<?xf64>, index, f64) -> vector<64xf64> loc("<stdin>":84:11)
    "vector.print"(%20) <{punctuation = #vector.punctuation<newline>}> : (vector<64xf64>) -> () loc("<stdin>":85:5)
    %21 = "vector.transfer_read"(%15, %2, %0) <{in_bounds = [false], operandSegmentSizes = array<i32: 1, 1, 1, 0>, permutation_map = affine_map<(d0) -> (d0)>}> : (tensor<?xf64>, index, f64) -> vector<64xf64> loc("<stdin>":86:11)
    "vector.print"(%21) <{punctuation = #vector.punctuation<newline>}> : (vector<64xf64>) -> () loc("<stdin>":87:5)
    %22 = "vector.transfer_read"(%16, %2, %0) <{in_bounds = [false], operandSegmentSizes = array<i32: 1, 1, 1, 0>, permutation_map = affine_map<(d0) -> (d0)>}> : (tensor<?xf64>, index, f64) -> vector<64xf64> loc("<stdin>":88:11)
    "vector.print"(%22) <{punctuation = #vector.punctuation<newline>}> : (vector<64xf64>) -> () loc("<stdin>":89:5)
    %23 = "vector.transfer_read"(%17, %2, %0) <{in_bounds = [false], operandSegmentSizes = array<i32: 1, 1, 1, 0>, permutation_map = affine_map<(d0) -> (d0)>}> : (tensor<?xf64>, index, f64) -> vector<64xf64> loc("<stdin>":90:11)
    "vector.print"(%23) <{punctuation = #vector.punctuation<newline>}> : (vector<64xf64>) -> () loc("<stdin>":91:5)
    %24 = "vector.transfer_read"(%18, %2, %0) <{in_bounds = [false], operandSegmentSizes = array<i32: 1, 1, 1, 0>, permutation_map = affine_map<(d0) -> (d0)>}> : (tensor<?xf64>, index, f64) -> vector<64xf64> loc("<stdin>":92:11)
    "vector.print"(%24) <{punctuation = #vector.punctuation<newline>}> : (vector<64xf64>) -> () loc("<stdin>":93:5)
    "bufferization.dealloc_tensor"(%5) : (tensor<?x?xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed(nonunique), d1 : singleton) }>>) -> () loc("<stdin>":94:5)
    "bufferization.dealloc_tensor"(%6) : (tensor<?x?xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed), posWidth = 32, crdWidth = 32 }>>) -> () loc("<stdin>":95:5)
    "bufferization.dealloc_tensor"(%7) : (tensor<?x?xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d1 : dense, d0 : compressed), posWidth = 64, crdWidth = 64 }>>) -> () loc("<stdin>":96:5)
    "llvm.call"() <{CConv = #llvm.cconv<ccc>, TailCallKind = #llvm.tailcallkind<none>, callee = @mgpuDestroySparseEnv, fastmathFlags = #llvm.fastmath<none>, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 0, 0>}> : () -> () loc("<stdin>":97:5)
    "func.return"() : () -> () loc("<stdin>":98:5)
  }) : () -> () loc("<stdin>":43:3)
}) : () -> () loc("<stdin>":8:1)
