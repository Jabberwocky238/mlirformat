"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "mgpuCreateSparseEnv", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  }) : () -> () loc("<stdin>":6:3)
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "mgpuDestroySparseEnv", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  }) : () -> () loc("<stdin>":8:3)
  "func.func"() <{function_type = (tensor<?x?xf32, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>>, tensor<?x?xf32>, tensor<?x?xf32>) -> tensor<?x?xf32, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>>, sym_name = "sampled_dense_dense"}> ({
  ^bb0(%arg4: tensor<?x?xf32, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>> loc("<stdin>":11:8), %arg5: tensor<?x?xf32> loc("<stdin>":11:41), %arg6: tensor<?x?xf32> loc("<stdin>":11:65)):
    %23 = "linalg.generic"(%arg5, %arg6, %arg4) <{doc = "S(i,j) += spy[S(i,j)] x SUM_k A(i,k) B(k,j)", indexing_maps = [affine_map<(d0, d1, d2) -> (d0, d2)>, affine_map<(d0, d1, d2) -> (d2, d1)>, affine_map<(d0, d1, d2) -> (d0, d1)>], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<reduction>], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg7: f32 loc("<stdin>":13:10), %arg8: f32 loc("<stdin>":13:22), %arg9: f32 loc("<stdin>":13:34)):
      %24 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32 loc("<stdin>":14:13)
      %25 = "sparse_tensor.unary"(%arg9) ({
      ^bb0(%arg12: f32 loc("<stdin>":16:12)):
        %28 = "arith.mulf"(%arg7, %arg8) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32 loc("<stdin>":17:15)
        "sparse_tensor.yield"(%28) : (f32) -> () loc("<stdin>":18:9)
      }, {
      }) : (f32) -> f32 loc("<stdin>":15:13)
      %26 = "sparse_tensor.reduce"(%arg9, %25, %24) ({
      ^bb0(%arg10: f32 loc("<stdin>":22:12), %arg11: f32 loc("<stdin>":22:25)):
        %27 = "arith.addf"(%arg10, %arg11) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32 loc("<stdin>":23:15)
        "sparse_tensor.yield"(%27) : (f32) -> () loc("<stdin>":24:9)
      }) : (f32, f32, f32) -> f32 loc("<stdin>":21:13)
      "linalg.yield"(%26) : (f32) -> () loc("<stdin>":26:7)
    }) : (tensor<?x?xf32>, tensor<?x?xf32>, tensor<?x?xf32, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>>) -> tensor<?x?xf32, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>> loc("<stdin>":12:11)
    "func.return"(%23) : (tensor<?x?xf32, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>>) -> () loc("<stdin>":28:5)
  }) : () -> () loc("<stdin>":10:3)
  "func.func"() <{function_type = (index) -> !llvm.ptr, sym_name = "getTensorFilename", sym_visibility = "private"}> ({
  }) : () -> () loc("<stdin>":30:3)
  "func.func"() <{function_type = () -> (), sym_name = "main"}> ({
    "llvm.call"() <{CConv = #llvm.cconv<ccc>, TailCallKind = #llvm.tailcallkind<none>, callee = @mgpuCreateSparseEnv, fastmathFlags = #llvm.fastmath<none>, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 0, 0>}> : () -> () loc("<stdin>":33:5)
    %0 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32 loc("<stdin>":34:10)
    %1 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":35:10)
    %2 = "arith.constant"() <{value = 1 : index}> : () -> index loc("<stdin>":36:10)
    %3 = "arith.constant"() <{value = 5 : index}> : () -> index loc("<stdin>":37:10)
    %4 = "arith.constant"() <{value = 10 : index}> : () -> index loc("<stdin>":38:10)
    %5 = "tensor.generate"(%3, %4) ({
    ^bb0(%arg2: index loc("<stdin>":40:10), %arg3: index loc("<stdin>":40:24)):
      %20 = "arith.addi"(%arg2, %2) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index loc("<stdin>":41:13)
      %21 = "arith.index_cast"(%20) : (index) -> i32 loc("<stdin>":42:13)
      %22 = "arith.sitofp"(%21) : (i32) -> f32 loc("<stdin>":43:13)
      "tensor.yield"(%22) : (f32) -> () loc("<stdin>":44:7)
    }) : (index, index) -> tensor<?x?xf32> loc("<stdin>":39:10)
    %6 = "tensor.generate"(%4, %3) ({
    ^bb0(%arg0: index loc("<stdin>":47:10), %arg1: index loc("<stdin>":47:24)):
      %17 = "arith.addi"(%arg1, %2) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index loc("<stdin>":48:13)
      %18 = "arith.index_cast"(%17) : (index) -> i32 loc("<stdin>":49:13)
      %19 = "arith.sitofp"(%18) : (i32) -> f32 loc("<stdin>":50:13)
      "tensor.yield"(%19) : (f32) -> () loc("<stdin>":51:7)
    }) : (index, index) -> tensor<?x?xf32> loc("<stdin>":46:10)
    %7 = "func.call"(%1) <{callee = @getTensorFilename}> : (index) -> !llvm.ptr loc("<stdin>":53:10)
    %8 = "sparse_tensor.new"(%7) : (!llvm.ptr) -> tensor<?x?xf32, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>> loc("<stdin>":54:10)
    %9 = "func.call"(%8, %5, %6) <{callee = @sampled_dense_dense}> : (tensor<?x?xf32, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>>, tensor<?x?xf32>, tensor<?x?xf32>) -> tensor<?x?xf32, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>> loc("<stdin>":55:10)
    "sparse_tensor.print"(%9) : (tensor<?x?xf32, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>>) -> () loc("<stdin>":56:5)
    %10 = "arith.constant"() <{value = sparse<[[0, 0], [0, 1], [1, 0], [3, 4], [7, 7]], [1.000000e+00, 2.000000e+00, 3.000000e+00, 4.000000e+00, 5.000000e+00]> : tensor<8x8xf32>}> : () -> tensor<8x8xf32> loc("<stdin>":57:11)
    %11 = "sparse_tensor.convert"(%10) : (tensor<8x8xf32>) -> tensor<?x?xf32, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>> loc("<stdin>":58:11)
    %12 = "arith.constant"() <{value = dense<2.000000e+00> : tensor<8x8xf32>}> : () -> tensor<8x8xf32> loc("<stdin>":59:11)
    %13 = "arith.constant"() <{value = dense<1.000000e+00> : tensor<8x8xf32>}> : () -> tensor<8x8xf32> loc("<stdin>":60:11)
    %14 = "tensor.cast"(%12) : (tensor<8x8xf32>) -> tensor<?x?xf32> loc("<stdin>":61:11)
    %15 = "tensor.cast"(%13) : (tensor<8x8xf32>) -> tensor<?x?xf32> loc("<stdin>":62:11)
    %16 = "func.call"(%11, %14, %15) <{callee = @sampled_dense_dense}> : (tensor<?x?xf32, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>>, tensor<?x?xf32>, tensor<?x?xf32>) -> tensor<?x?xf32, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>> loc("<stdin>":63:11)
    "sparse_tensor.print"(%16) : (tensor<?x?xf32, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>>) -> () loc("<stdin>":64:5)
    "bufferization.dealloc_tensor"(%9) : (tensor<?x?xf32, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>>) -> () loc("<stdin>":65:5)
    "bufferization.dealloc_tensor"(%16) : (tensor<?x?xf32, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>>) -> () loc("<stdin>":66:5)
    "llvm.call"() <{CConv = #llvm.cconv<ccc>, TailCallKind = #llvm.tailcallkind<none>, callee = @mgpuDestroySparseEnv, fastmathFlags = #llvm.fastmath<none>, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 0, 0>}> : () -> () loc("<stdin>":67:5)
    "func.return"() : () -> () loc("<stdin>":68:5)
  }) : () -> () loc("<stdin>":32:3)
}) : () -> () loc("<stdin>":5:1)
