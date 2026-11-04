#map = affine_map<(d0, d1, d2) -> (d0, d2)>
#map1 = affine_map<(d0, d1, d2) -> (d2, d1)>
#map2 = affine_map<(d0, d1, d2) -> (d0, d1)>
#sparse = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>
"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "mgpuCreateSparseEnv", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "mgpuDestroySparseEnv", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  }) : () -> ()
  "func.func"() <{function_type = (tensor<?x?xf32, #sparse>, tensor<?x?xf32>, tensor<?x?xf32>) -> tensor<?x?xf32, #sparse>, sym_name = "sampled_dense_dense"}> ({
  ^bb0(%arg4: tensor<?x?xf32, #sparse>, %arg5: tensor<?x?xf32>, %arg6: tensor<?x?xf32>):
    %23 = "linalg.generic"(%arg5, %arg6, %arg4) <{doc = "S(i,j) += spy[S(i,j)] x SUM_k A(i,k) B(k,j)", indexing_maps = [#map, #map1, #map2], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<reduction>], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg7: f32, %arg8: f32, %arg9: f32):
      %24 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
      %25 = "sparse_tensor.unary"(%arg9) ({
      ^bb0(%arg12: f32):
        %28 = "arith.mulf"(%arg7, %arg8) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
        "sparse_tensor.yield"(%28) : (f32) -> ()
      }, {
      }) : (f32) -> f32
      %26 = "sparse_tensor.reduce"(%arg9, %25, %24) ({
      ^bb0(%arg10: f32, %arg11: f32):
        %27 = "arith.addf"(%arg10, %arg11) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
        "sparse_tensor.yield"(%27) : (f32) -> ()
      }) : (f32, f32, f32) -> f32
      "linalg.yield"(%26) : (f32) -> ()
    }) : (tensor<?x?xf32>, tensor<?x?xf32>, tensor<?x?xf32, #sparse>) -> tensor<?x?xf32, #sparse>
    "func.return"(%23) : (tensor<?x?xf32, #sparse>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (index) -> !llvm.ptr, sym_name = "getTensorFilename", sym_visibility = "private"}> ({
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "main"}> ({
    "llvm.call"() <{CConv = #llvm.cconv<ccc>, TailCallKind = #llvm.tailcallkind<none>, callee = @mgpuCreateSparseEnv, fastmathFlags = #llvm.fastmath<none>, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 0, 0>}> : () -> ()
    %0 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %1 = "arith.constant"() <{value = 0 : index}> : () -> index
    %2 = "arith.constant"() <{value = 1 : index}> : () -> index
    %3 = "arith.constant"() <{value = 5 : index}> : () -> index
    %4 = "arith.constant"() <{value = 10 : index}> : () -> index
    %5 = "tensor.generate"(%3, %4) ({
    ^bb0(%arg2: index, %arg3: index):
      %20 = "arith.addi"(%arg2, %2) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
      %21 = "arith.index_cast"(%20) : (index) -> i32
      %22 = "arith.sitofp"(%21) : (i32) -> f32
      "tensor.yield"(%22) : (f32) -> ()
    }) : (index, index) -> tensor<?x?xf32>
    %6 = "tensor.generate"(%4, %3) ({
    ^bb0(%arg0: index, %arg1: index):
      %17 = "arith.addi"(%arg1, %2) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
      %18 = "arith.index_cast"(%17) : (index) -> i32
      %19 = "arith.sitofp"(%18) : (i32) -> f32
      "tensor.yield"(%19) : (f32) -> ()
    }) : (index, index) -> tensor<?x?xf32>
    %7 = "func.call"(%1) <{callee = @getTensorFilename}> : (index) -> !llvm.ptr
    %8 = "sparse_tensor.new"(%7) : (!llvm.ptr) -> tensor<?x?xf32, #sparse>
    %9 = "func.call"(%8, %5, %6) <{callee = @sampled_dense_dense}> : (tensor<?x?xf32, #sparse>, tensor<?x?xf32>, tensor<?x?xf32>) -> tensor<?x?xf32, #sparse>
    "sparse_tensor.print"(%9) : (tensor<?x?xf32, #sparse>) -> ()
    %10 = "arith.constant"() <{value = sparse<[[0, 0], [0, 1], [1, 0], [3, 4], [7, 7]], [1.000000e+00, 2.000000e+00, 3.000000e+00, 4.000000e+00, 5.000000e+00]> : tensor<8x8xf32>}> : () -> tensor<8x8xf32>
    %11 = "sparse_tensor.convert"(%10) : (tensor<8x8xf32>) -> tensor<?x?xf32, #sparse>
    %12 = "arith.constant"() <{value = dense<2.000000e+00> : tensor<8x8xf32>}> : () -> tensor<8x8xf32>
    %13 = "arith.constant"() <{value = dense<1.000000e+00> : tensor<8x8xf32>}> : () -> tensor<8x8xf32>
    %14 = "tensor.cast"(%12) : (tensor<8x8xf32>) -> tensor<?x?xf32>
    %15 = "tensor.cast"(%13) : (tensor<8x8xf32>) -> tensor<?x?xf32>
    %16 = "func.call"(%11, %14, %15) <{callee = @sampled_dense_dense}> : (tensor<?x?xf32, #sparse>, tensor<?x?xf32>, tensor<?x?xf32>) -> tensor<?x?xf32, #sparse>
    "sparse_tensor.print"(%16) : (tensor<?x?xf32, #sparse>) -> ()
    "bufferization.dealloc_tensor"(%9) : (tensor<?x?xf32, #sparse>) -> ()
    "bufferization.dealloc_tensor"(%16) : (tensor<?x?xf32, #sparse>) -> ()
    "llvm.call"() <{CConv = #llvm.cconv<ccc>, TailCallKind = #llvm.tailcallkind<none>, callee = @mgpuDestroySparseEnv, fastmathFlags = #llvm.fastmath<none>, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 0, 0>}> : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

