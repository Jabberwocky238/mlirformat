#map = affine_map<(d0, d1, d2) -> (d0, d2)>
#map1 = affine_map<(d0, d1, d2) -> (d2, d1)>
#map2 = affine_map<(d0, d1, d2) -> (d0, d1)>
#sparse = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>
#sparse1 = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 floordiv 2 : dense, d1 floordiv 2 : compressed, d0 mod 2 : dense, d1 mod 2 : dense) }>
"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "mgpuCreateSparseEnv", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "mgpuDestroySparseEnv", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  }) : () -> ()
  "func.func"() <{function_type = (tensor<?x?xf32, #sparse>, tensor<?x?xf32>, tensor<?x?xf32>) -> tensor<?x?xf32, #sparse>, sym_name = "SDDMM"}> ({
  ^bb0(%arg13: tensor<?x?xf32, #sparse>, %arg14: tensor<?x?xf32>, %arg15: tensor<?x?xf32>):
    %24 = "linalg.generic"(%arg14, %arg15, %arg13) <{doc = "S(i,j) += spy[S(i,j)] x SUM_k A(i,k) B(k,j)", indexing_maps = [#map, #map1, #map2], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<reduction>], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg16: f32, %arg17: f32, %arg18: f32):
      %25 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
      %26 = "sparse_tensor.unary"(%arg18) ({
      ^bb0(%arg21: f32):
        %29 = "arith.mulf"(%arg16, %arg17) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
        "sparse_tensor.yield"(%29) : (f32) -> ()
      }, {
      }) : (f32) -> f32
      %27 = "sparse_tensor.reduce"(%arg18, %26, %25) ({
      ^bb0(%arg19: f32, %arg20: f32):
        %28 = "arith.addf"(%arg19, %arg20) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
        "sparse_tensor.yield"(%28) : (f32) -> ()
      }) : (f32, f32, f32) -> f32
      "linalg.yield"(%27) : (f32) -> ()
    }) : (tensor<?x?xf32>, tensor<?x?xf32>, tensor<?x?xf32, #sparse>) -> tensor<?x?xf32, #sparse>
    "func.return"(%24) : (tensor<?x?xf32, #sparse>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<?x?xf32, #sparse1>, tensor<?x?xf32>, tensor<?x?xf32>) -> tensor<?x?xf32, #sparse1>, sym_name = "SDDMM_block"}> ({
  ^bb0(%arg4: tensor<?x?xf32, #sparse1>, %arg5: tensor<?x?xf32>, %arg6: tensor<?x?xf32>):
    %18 = "linalg.generic"(%arg5, %arg6, %arg4) <{doc = "S(i,j) += spy[S(i,j)] x SUM_k A(i,k) B(k,j)", indexing_maps = [#map, #map1, #map2], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<reduction>], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg7: f32, %arg8: f32, %arg9: f32):
      %19 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
      %20 = "sparse_tensor.unary"(%arg9) ({
      ^bb0(%arg12: f32):
        %23 = "arith.mulf"(%arg7, %arg8) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
        "sparse_tensor.yield"(%23) : (f32) -> ()
      }, {
      }) : (f32) -> f32
      %21 = "sparse_tensor.reduce"(%arg9, %20, %19) ({
      ^bb0(%arg10: f32, %arg11: f32):
        %22 = "arith.addf"(%arg10, %arg11) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
        "sparse_tensor.yield"(%22) : (f32) -> ()
      }) : (f32, f32, f32) -> f32
      "linalg.yield"(%21) : (f32) -> ()
    }) : (tensor<?x?xf32>, tensor<?x?xf32>, tensor<?x?xf32, #sparse1>) -> tensor<?x?xf32, #sparse1>
    "func.return"(%18) : (tensor<?x?xf32, #sparse1>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (index) -> !llvm.ptr, sym_name = "getTensorFilename", sym_visibility = "private"}> ({
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "main"}> ({
    "llvm.call"() <{CConv = #llvm.cconv<ccc>, TailCallKind = #llvm.tailcallkind<none>, callee = @mgpuCreateSparseEnv, fastmathFlags = #llvm.fastmath<none>, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 0, 0>}> : () -> ()
    %0 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %1 = "arith.constant"() <{value = 0 : index}> : () -> index
    %2 = "arith.constant"() <{value = 1 : index}> : () -> index
    %3 = "arith.constant"() <{value = 4 : index}> : () -> index
    %4 = "arith.constant"() <{value = 6 : index}> : () -> index
    %5 = "tensor.generate"(%3, %3) ({
    ^bb0(%arg2: index, %arg3: index):
      %15 = "arith.addi"(%arg2, %2) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
      %16 = "arith.index_cast"(%15) : (index) -> i32
      %17 = "arith.sitofp"(%16) : (i32) -> f32
      "tensor.yield"(%17) : (f32) -> ()
    }) : (index, index) -> tensor<?x?xf32>
    %6 = "tensor.generate"(%3, %4) ({
    ^bb0(%arg0: index, %arg1: index):
      %12 = "arith.addi"(%arg1, %2) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
      %13 = "arith.index_cast"(%12) : (index) -> i32
      %14 = "arith.sitofp"(%13) : (i32) -> f32
      "tensor.yield"(%14) : (f32) -> ()
    }) : (index, index) -> tensor<?x?xf32>
    %7 = "func.call"(%1) <{callee = @getTensorFilename}> : (index) -> !llvm.ptr
    %8 = "sparse_tensor.new"(%7) : (!llvm.ptr) -> tensor<?x?xf32, #sparse>
    %9 = "sparse_tensor.new"(%7) : (!llvm.ptr) -> tensor<?x?xf32, #sparse1>
    %10 = "func.call"(%8, %5, %6) <{callee = @SDDMM}> : (tensor<?x?xf32, #sparse>, tensor<?x?xf32>, tensor<?x?xf32>) -> tensor<?x?xf32, #sparse>
    %11 = "func.call"(%9, %5, %6) <{callee = @SDDMM_block}> : (tensor<?x?xf32, #sparse1>, tensor<?x?xf32>, tensor<?x?xf32>) -> tensor<?x?xf32, #sparse1>
    "sparse_tensor.print"(%10) : (tensor<?x?xf32, #sparse>) -> ()
    "sparse_tensor.print"(%11) : (tensor<?x?xf32, #sparse1>) -> ()
    "bufferization.dealloc_tensor"(%10) : (tensor<?x?xf32, #sparse>) -> ()
    "bufferization.dealloc_tensor"(%11) : (tensor<?x?xf32, #sparse1>) -> ()
    "llvm.call"() <{CConv = #llvm.cconv<ccc>, TailCallKind = #llvm.tailcallkind<none>, callee = @mgpuDestroySparseEnv, fastmathFlags = #llvm.fastmath<none>, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 0, 0>}> : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

