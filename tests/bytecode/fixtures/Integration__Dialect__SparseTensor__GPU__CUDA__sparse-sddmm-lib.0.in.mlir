"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "mgpuCreateSparseEnv", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  }) : () -> () loc("<stdin>":7:3)
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "mgpuDestroySparseEnv", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  }) : () -> () loc("<stdin>":9:3)
  "func.func"() <{function_type = (tensor<?x?xf32, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>>, tensor<?x?xf32>, tensor<?x?xf32>) -> tensor<?x?xf32, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>>, sym_name = "SDDMM"}> ({
  ^bb0(%arg13: tensor<?x?xf32, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>> loc("<stdin>":12:8), %arg14: tensor<?x?xf32> loc("<stdin>":12:42), %arg15: tensor<?x?xf32> loc("<stdin>":12:67)):
    %24 = "linalg.generic"(%arg14, %arg15, %arg13) <{doc = "S(i,j) += spy[S(i,j)] x SUM_k A(i,k) B(k,j)", indexing_maps = [affine_map<(d0, d1, d2) -> (d0, d2)>, affine_map<(d0, d1, d2) -> (d2, d1)>, affine_map<(d0, d1, d2) -> (d0, d1)>], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<reduction>], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg16: f32 loc("<stdin>":14:10), %arg17: f32 loc("<stdin>":14:23), %arg18: f32 loc("<stdin>":14:36)):
      %25 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32 loc("<stdin>":15:13)
      %26 = "sparse_tensor.unary"(%arg18) ({
      ^bb0(%arg21: f32 loc("<stdin>":17:12)):
        %29 = "arith.mulf"(%arg16, %arg17) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32 loc("<stdin>":18:15)
        "sparse_tensor.yield"(%29) : (f32) -> () loc("<stdin>":19:9)
      }, {
      }) : (f32) -> f32 loc("<stdin>":16:13)
      %27 = "sparse_tensor.reduce"(%arg18, %26, %25) ({
      ^bb0(%arg19: f32 loc("<stdin>":23:12), %arg20: f32 loc("<stdin>":23:25)):
        %28 = "arith.addf"(%arg19, %arg20) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32 loc("<stdin>":24:15)
        "sparse_tensor.yield"(%28) : (f32) -> () loc("<stdin>":25:9)
      }) : (f32, f32, f32) -> f32 loc("<stdin>":22:13)
      "linalg.yield"(%27) : (f32) -> () loc("<stdin>":27:7)
    }) : (tensor<?x?xf32>, tensor<?x?xf32>, tensor<?x?xf32, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>>) -> tensor<?x?xf32, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>> loc("<stdin>":13:11)
    "func.return"(%24) : (tensor<?x?xf32, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>>) -> () loc("<stdin>":29:5)
  }) : () -> () loc("<stdin>":11:3)
  "func.func"() <{function_type = (tensor<?x?xf32, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 floordiv 2 : dense, d1 floordiv 2 : compressed, d0 mod 2 : dense, d1 mod 2 : dense) }>>, tensor<?x?xf32>, tensor<?x?xf32>) -> tensor<?x?xf32, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 floordiv 2 : dense, d1 floordiv 2 : compressed, d0 mod 2 : dense, d1 mod 2 : dense) }>>, sym_name = "SDDMM_block"}> ({
  ^bb0(%arg4: tensor<?x?xf32, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 floordiv 2 : dense, d1 floordiv 2 : compressed, d0 mod 2 : dense, d1 mod 2 : dense) }>> loc("<stdin>":32:8), %arg5: tensor<?x?xf32> loc("<stdin>":32:42), %arg6: tensor<?x?xf32> loc("<stdin>":32:66)):
    %18 = "linalg.generic"(%arg5, %arg6, %arg4) <{doc = "S(i,j) += spy[S(i,j)] x SUM_k A(i,k) B(k,j)", indexing_maps = [affine_map<(d0, d1, d2) -> (d0, d2)>, affine_map<(d0, d1, d2) -> (d2, d1)>, affine_map<(d0, d1, d2) -> (d0, d1)>], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<reduction>], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg7: f32 loc("<stdin>":34:10), %arg8: f32 loc("<stdin>":34:22), %arg9: f32 loc("<stdin>":34:34)):
      %19 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32 loc("<stdin>":35:13)
      %20 = "sparse_tensor.unary"(%arg9) ({
      ^bb0(%arg12: f32 loc("<stdin>":37:12)):
        %23 = "arith.mulf"(%arg7, %arg8) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32 loc("<stdin>":38:15)
        "sparse_tensor.yield"(%23) : (f32) -> () loc("<stdin>":39:9)
      }, {
      }) : (f32) -> f32 loc("<stdin>":36:13)
      %21 = "sparse_tensor.reduce"(%arg9, %20, %19) ({
      ^bb0(%arg10: f32 loc("<stdin>":43:12), %arg11: f32 loc("<stdin>":43:25)):
        %22 = "arith.addf"(%arg10, %arg11) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32 loc("<stdin>":44:15)
        "sparse_tensor.yield"(%22) : (f32) -> () loc("<stdin>":45:9)
      }) : (f32, f32, f32) -> f32 loc("<stdin>":42:13)
      "linalg.yield"(%21) : (f32) -> () loc("<stdin>":47:7)
    }) : (tensor<?x?xf32>, tensor<?x?xf32>, tensor<?x?xf32, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 floordiv 2 : dense, d1 floordiv 2 : compressed, d0 mod 2 : dense, d1 mod 2 : dense) }>>) -> tensor<?x?xf32, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 floordiv 2 : dense, d1 floordiv 2 : compressed, d0 mod 2 : dense, d1 mod 2 : dense) }>> loc("<stdin>":33:11)
    "func.return"(%18) : (tensor<?x?xf32, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 floordiv 2 : dense, d1 floordiv 2 : compressed, d0 mod 2 : dense, d1 mod 2 : dense) }>>) -> () loc("<stdin>":49:5)
  }) : () -> () loc("<stdin>":31:3)
  "func.func"() <{function_type = (index) -> !llvm.ptr, sym_name = "getTensorFilename", sym_visibility = "private"}> ({
  }) : () -> () loc("<stdin>":51:3)
  "func.func"() <{function_type = () -> (), sym_name = "main"}> ({
    "llvm.call"() <{CConv = #llvm.cconv<ccc>, TailCallKind = #llvm.tailcallkind<none>, callee = @mgpuCreateSparseEnv, fastmathFlags = #llvm.fastmath<none>, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 0, 0>}> : () -> () loc("<stdin>":54:5)
    %0 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32 loc("<stdin>":55:10)
    %1 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":56:10)
    %2 = "arith.constant"() <{value = 1 : index}> : () -> index loc("<stdin>":57:10)
    %3 = "arith.constant"() <{value = 4 : index}> : () -> index loc("<stdin>":58:10)
    %4 = "arith.constant"() <{value = 6 : index}> : () -> index loc("<stdin>":59:10)
    %5 = "tensor.generate"(%3, %3) ({
    ^bb0(%arg2: index loc("<stdin>":61:10), %arg3: index loc("<stdin>":61:24)):
      %15 = "arith.addi"(%arg2, %2) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index loc("<stdin>":62:13)
      %16 = "arith.index_cast"(%15) : (index) -> i32 loc("<stdin>":63:13)
      %17 = "arith.sitofp"(%16) : (i32) -> f32 loc("<stdin>":64:13)
      "tensor.yield"(%17) : (f32) -> () loc("<stdin>":65:7)
    }) : (index, index) -> tensor<?x?xf32> loc("<stdin>":60:10)
    %6 = "tensor.generate"(%3, %4) ({
    ^bb0(%arg0: index loc("<stdin>":68:10), %arg1: index loc("<stdin>":68:24)):
      %12 = "arith.addi"(%arg1, %2) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index loc("<stdin>":69:13)
      %13 = "arith.index_cast"(%12) : (index) -> i32 loc("<stdin>":70:13)
      %14 = "arith.sitofp"(%13) : (i32) -> f32 loc("<stdin>":71:13)
      "tensor.yield"(%14) : (f32) -> () loc("<stdin>":72:7)
    }) : (index, index) -> tensor<?x?xf32> loc("<stdin>":67:10)
    %7 = "func.call"(%1) <{callee = @getTensorFilename}> : (index) -> !llvm.ptr loc("<stdin>":74:10)
    %8 = "sparse_tensor.new"(%7) : (!llvm.ptr) -> tensor<?x?xf32, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>> loc("<stdin>":75:10)
    %9 = "sparse_tensor.new"(%7) : (!llvm.ptr) -> tensor<?x?xf32, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 floordiv 2 : dense, d1 floordiv 2 : compressed, d0 mod 2 : dense, d1 mod 2 : dense) }>> loc("<stdin>":76:10)
    %10 = "func.call"(%8, %5, %6) <{callee = @SDDMM}> : (tensor<?x?xf32, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>>, tensor<?x?xf32>, tensor<?x?xf32>) -> tensor<?x?xf32, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>> loc("<stdin>":77:11)
    %11 = "func.call"(%9, %5, %6) <{callee = @SDDMM_block}> : (tensor<?x?xf32, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 floordiv 2 : dense, d1 floordiv 2 : compressed, d0 mod 2 : dense, d1 mod 2 : dense) }>>, tensor<?x?xf32>, tensor<?x?xf32>) -> tensor<?x?xf32, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 floordiv 2 : dense, d1 floordiv 2 : compressed, d0 mod 2 : dense, d1 mod 2 : dense) }>> loc("<stdin>":78:11)
    "sparse_tensor.print"(%10) : (tensor<?x?xf32, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>>) -> () loc("<stdin>":79:5)
    "sparse_tensor.print"(%11) : (tensor<?x?xf32, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 floordiv 2 : dense, d1 floordiv 2 : compressed, d0 mod 2 : dense, d1 mod 2 : dense) }>>) -> () loc("<stdin>":80:5)
    "bufferization.dealloc_tensor"(%10) : (tensor<?x?xf32, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>>) -> () loc("<stdin>":81:5)
    "bufferization.dealloc_tensor"(%11) : (tensor<?x?xf32, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 floordiv 2 : dense, d1 floordiv 2 : compressed, d0 mod 2 : dense, d1 mod 2 : dense) }>>) -> () loc("<stdin>":82:5)
    "llvm.call"() <{CConv = #llvm.cconv<ccc>, TailCallKind = #llvm.tailcallkind<none>, callee = @mgpuDestroySparseEnv, fastmathFlags = #llvm.fastmath<none>, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 0, 0>}> : () -> () loc("<stdin>":83:5)
    "func.return"() : () -> () loc("<stdin>":84:5)
  }) : () -> () loc("<stdin>":53:3)
}) : () -> () loc("<stdin>":6:1)
