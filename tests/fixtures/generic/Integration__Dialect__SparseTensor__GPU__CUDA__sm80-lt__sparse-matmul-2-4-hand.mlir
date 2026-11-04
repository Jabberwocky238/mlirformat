#map = affine_map<(d0, d1) -> (d1)>
"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "mgpuCreateSparseLtEnv", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "mgpuDestroySparseLtEnv", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  }) : () -> ()
  "func.func"() <{function_type = (memref<16x32xf16>, memref<32x16xf16>, memref<16x16xf16>) -> (), sym_name = "matmul24"}> ({
  ^bb0(%arg9: memref<16x32xf16>, %arg10: memref<32x16xf16>, %arg11: memref<16x16xf16>):
    %25 = "arith.constant"() <{value = 0.000000e+00 : f16}> : () -> f16
    %26 = "arith.constant"() <{value = 1 : index}> : () -> index
    %27 = "arith.constant"() <{value = 2 : index}> : () -> index
    %28 = "arith.constant"() <{value = 8 : index}> : () -> index
    %29 = "arith.constant"() <{value = 16 : index}> : () -> index
    %30 = "arith.constant"() <{value = 32 : index}> : () -> index
    %31 = "arith.constant"() <{value = 1048576 : index}> : () -> index
    %32 = "gpu.wait"() : () -> !gpu.async.token
    %33:2 = "gpu.alloc"(%32) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (!gpu.async.token) -> (memref<16x32xf16>, !gpu.async.token)
    %34:2 = "gpu.alloc"(%33#1) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (!gpu.async.token) -> (memref<32x16xf16>, !gpu.async.token)
    %35:2 = "gpu.alloc"(%34#1) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (!gpu.async.token) -> (memref<16x16xf16>, !gpu.async.token)
    %36 = "gpu.memcpy"(%35#1, %33#0, %arg9) : (!gpu.async.token, memref<16x32xf16>, memref<16x32xf16>) -> !gpu.async.token
    %37 = "gpu.memcpy"(%36, %34#0, %arg10) : (!gpu.async.token, memref<32x16xf16>, memref<32x16xf16>) -> !gpu.async.token
    %38 = "gpu.memcpy"(%37, %35#0, %arg11) : (!gpu.async.token, memref<16x16xf16>, memref<16x16xf16>) -> !gpu.async.token
    %39:2 = "gpu.create_2to4_spmat"(%38, %29, %30, %33#0) <{pruneFlag = #gpu<prune_2to4_spmat_flag PRUNE_AND_CHECK>}> : (!gpu.async.token, index, index, memref<16x32xf16>) -> (!gpu.sparse.spmat_handle, !gpu.async.token)
    %40:2 = "gpu.create_dn_tensor"(%39#1, %34#0, %30, %29) <{operandSegmentSizes = array<i32: 1, 1, 2>}> : (!gpu.async.token, memref<32x16xf16>, index, index) -> (!gpu.sparse.dntensor_handle, !gpu.async.token)
    %41:2 = "gpu.create_dn_tensor"(%40#1, %35#0, %29, %29) <{operandSegmentSizes = array<i32: 1, 1, 2>}> : (!gpu.async.token, memref<16x16xf16>, index, index) -> (!gpu.sparse.dntensor_handle, !gpu.async.token)
    %42:4 = "gpu.spmm_buffer_size"(%41#1, %39#0, %40#0, %41#0) <{computeType = f16, modeA = #gpu<mat_transpose_mode NON_TRANSPOSE>, modeB = #gpu<mat_transpose_mode NON_TRANSPOSE>, resultSegmentSizes = array<i32: 3, 1>}> : (!gpu.async.token, !gpu.sparse.spmat_handle, !gpu.sparse.dntensor_handle, !gpu.sparse.dntensor_handle) -> (index, index, index, !gpu.async.token)
    %43:2 = "gpu.alloc"(%42#3, %42#0) <{operandSegmentSizes = array<i32: 1, 1, 0>}> : (!gpu.async.token, index) -> (memref<?xf16>, !gpu.async.token)
    %44:2 = "gpu.alloc"(%43#1, %42#1) <{operandSegmentSizes = array<i32: 1, 1, 0>}> : (!gpu.async.token, index) -> (memref<?xf16>, !gpu.async.token)
    %45:2 = "gpu.alloc"(%44#1, %42#2) <{operandSegmentSizes = array<i32: 1, 1, 0>}> : (!gpu.async.token, index) -> (memref<?xf16>, !gpu.async.token)
    %46 = "gpu.spmm"(%45#1, %39#0, %40#0, %41#0, %43#0, %44#0, %45#0) <{computeType = f16, modeA = #gpu<mat_transpose_mode NON_TRANSPOSE>, modeB = #gpu<mat_transpose_mode NON_TRANSPOSE>, operandSegmentSizes = array<i32: 1, 1, 1, 1, 3>}> : (!gpu.async.token, !gpu.sparse.spmat_handle, !gpu.sparse.dntensor_handle, !gpu.sparse.dntensor_handle, memref<?xf16>, memref<?xf16>, memref<?xf16>) -> !gpu.async.token
    %47 = "gpu.destroy_sp_mat"(%46, %39#0) : (!gpu.async.token, !gpu.sparse.spmat_handle) -> !gpu.async.token
    %48 = "gpu.destroy_dn_tensor"(%47, %40#0) : (!gpu.async.token, !gpu.sparse.dntensor_handle) -> !gpu.async.token
    %49 = "gpu.destroy_dn_tensor"(%48, %41#0) : (!gpu.async.token, !gpu.sparse.dntensor_handle) -> !gpu.async.token
    %50 = "gpu.memcpy"(%49, %arg11, %35#0) : (!gpu.async.token, memref<16x16xf16>, memref<16x16xf16>) -> !gpu.async.token
    %51 = "gpu.dealloc"(%50, %35#0) : (!gpu.async.token, memref<16x16xf16>) -> !gpu.async.token
    %52 = "gpu.dealloc"(%51, %34#0) : (!gpu.async.token, memref<32x16xf16>) -> !gpu.async.token
    %53 = "gpu.dealloc"(%52, %33#0) : (!gpu.async.token, memref<16x32xf16>) -> !gpu.async.token
    %54 = "gpu.dealloc"(%53, %45#0) : (!gpu.async.token, memref<?xf16>) -> !gpu.async.token
    %55 = "gpu.dealloc"(%54, %44#0) : (!gpu.async.token, memref<?xf16>) -> !gpu.async.token
    %56 = "gpu.dealloc"(%55, %43#0) : (!gpu.async.token, memref<?xf16>) -> !gpu.async.token
    "gpu.wait"(%56) : (!gpu.async.token) -> ()
    "func.return"() : () -> ()
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
    %8 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<16x32xf16>
    %9 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<32x16xf16>
    %10 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<16x16xf16>
    "scf.for"(%1, %5, %2) ({
    ^bb0(%arg7: index):
      "scf.for"(%1, %5, %2) ({
      ^bb0(%arg8: index):
        %18 = "arith.constant"() <{value = 0.000000e+00 : f16}> : () -> f16
        %19 = "arith.addi"(%arg7, %arg8) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
        %20 = "arith.addi"(%19, %2) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
        %21 = "arith.index_cast"(%20) : (index) -> i32
        %22 = "arith.sitofp"(%21) : (i32) -> f16
        %23 = "arith.muli"(%arg8, %3) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
        %24 = "arith.addi"(%23, %2) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
        "memref.store"(%22, %8, %arg7, %23) : (f16, memref<16x32xf16>, index, index) -> ()
        "memref.store"(%18, %8, %arg7, %24) : (f16, memref<16x32xf16>, index, index) -> ()
        "scf.yield"() : () -> ()
      }) : (index, index, index) -> ()
      "scf.yield"() : () -> ()
    }) : (index, index, index) -> ()
    "scf.for"(%1, %4, %2) ({
    ^bb0(%arg5: index):
      "scf.for"(%1, %6, %2) ({
      ^bb0(%arg6: index):
        %14 = "arith.subi"(%arg5, %arg6) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
        %15 = "arith.index_cast"(%14) : (index) -> i32
        %16 = "arith.sitofp"(%15) : (i32) -> f16
        %17 = "arith.addi"(%arg5, %4) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
        "memref.store"(%16, %9, %arg6, %arg5) : (f16, memref<32x16xf16>, index, index) -> ()
        "memref.store"(%16, %9, %arg6, %17) : (f16, memref<32x16xf16>, index, index) -> ()
        "scf.yield"() : () -> ()
      }) : (index, index, index) -> ()
      "scf.yield"() : () -> ()
    }) : (index, index, index) -> ()
    "scf.for"(%1, %5, %2) ({
    ^bb0(%arg3: index):
      "scf.for"(%1, %5, %2) ({
      ^bb0(%arg4: index):
        "memref.store"(%0, %10, %arg3, %arg4) : (f16, memref<16x16xf16>, index, index) -> ()
        "scf.yield"() : () -> ()
      }) : (index, index, index) -> ()
      "scf.yield"() : () -> ()
    }) : (index, index, index) -> ()
    "scf.for"(%1, %5, %2) ({
    ^bb0(%arg2: index):
      %13 = "vector.transfer_read"(%8, %arg2, %1, %0) <{in_bounds = [false], operandSegmentSizes = array<i32: 1, 2, 1, 0>, permutation_map = #map}> : (memref<16x32xf16>, index, index, f16) -> vector<32xf16>
      "vector.print"(%13) <{punctuation = #vector.punctuation<newline>}> : (vector<32xf16>) -> ()
      "scf.yield"() : () -> ()
    }) : (index, index, index) -> ()
    "scf.for"(%1, %6, %2) ({
    ^bb0(%arg1: index):
      %12 = "vector.transfer_read"(%9, %arg1, %1, %0) <{in_bounds = [false], operandSegmentSizes = array<i32: 1, 2, 1, 0>, permutation_map = #map}> : (memref<32x16xf16>, index, index, f16) -> vector<16xf16>
      "vector.print"(%12) <{punctuation = #vector.punctuation<newline>}> : (vector<16xf16>) -> ()
      "scf.yield"() : () -> ()
    }) : (index, index, index) -> ()
    "func.call"(%8, %9, %10) <{callee = @matmul24}> : (memref<16x32xf16>, memref<32x16xf16>, memref<16x16xf16>) -> ()
    "scf.for"(%1, %5, %2) ({
    ^bb0(%arg0: index):
      %11 = "vector.transfer_read"(%10, %arg0, %1, %0) <{in_bounds = [false], operandSegmentSizes = array<i32: 1, 2, 1, 0>, permutation_map = #map}> : (memref<16x16xf16>, index, index, f16) -> vector<16xf16>
      "vector.print"(%11) <{punctuation = #vector.punctuation<newline>}> : (vector<16xf16>) -> ()
      "scf.yield"() : () -> ()
    }) : (index, index, index) -> ()
    "llvm.call"() <{CConv = #llvm.cconv<ccc>, TailCallKind = #llvm.tailcallkind<none>, callee = @mgpuDestroySparseLtEnv, fastmathFlags = #llvm.fastmath<none>, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 0, 0>}> : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

