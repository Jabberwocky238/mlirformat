"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "mgpuCreateSparseLtEnv", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  }) : () -> () loc("<stdin>":3:3)
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "mgpuDestroySparseLtEnv", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  }) : () -> () loc("<stdin>":5:3)
  "func.func"() <{function_type = (memref<16x32xf16>, memref<32x16xf16>, memref<16x16xf16>) -> (), sym_name = "matmul24"}> ({
  ^bb0(%arg9: memref<16x32xf16> loc("<stdin>":8:8), %arg10: memref<32x16xf16> loc("<stdin>":8:34), %arg11: memref<16x16xf16> loc("<stdin>":8:61)):
    %25 = "arith.constant"() <{value = 0.000000e+00 : f16}> : () -> f16 loc("<stdin>":9:11)
    %26 = "arith.constant"() <{value = 1 : index}> : () -> index loc("<stdin>":10:11)
    %27 = "arith.constant"() <{value = 2 : index}> : () -> index loc("<stdin>":11:11)
    %28 = "arith.constant"() <{value = 8 : index}> : () -> index loc("<stdin>":12:11)
    %29 = "arith.constant"() <{value = 16 : index}> : () -> index loc("<stdin>":13:11)
    %30 = "arith.constant"() <{value = 32 : index}> : () -> index loc("<stdin>":14:11)
    %31 = "arith.constant"() <{value = 1048576 : index}> : () -> index loc("<stdin>":15:11)
    %32 = "gpu.wait"() : () -> !gpu.async.token loc("<stdin>":16:11)
    %33:2 = "gpu.alloc"(%32) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (!gpu.async.token) -> (memref<16x32xf16>, !gpu.async.token) loc("<stdin>":17:13)
    %34:2 = "gpu.alloc"(%33#1) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (!gpu.async.token) -> (memref<32x16xf16>, !gpu.async.token) loc("<stdin>":18:13)
    %35:2 = "gpu.alloc"(%34#1) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (!gpu.async.token) -> (memref<16x16xf16>, !gpu.async.token) loc("<stdin>":19:13)
    %36 = "gpu.memcpy"(%35#1, %33#0, %arg9) : (!gpu.async.token, memref<16x32xf16>, memref<16x32xf16>) -> !gpu.async.token loc("<stdin>":20:11)
    %37 = "gpu.memcpy"(%36, %34#0, %arg10) : (!gpu.async.token, memref<32x16xf16>, memref<32x16xf16>) -> !gpu.async.token loc("<stdin>":21:11)
    %38 = "gpu.memcpy"(%37, %35#0, %arg11) : (!gpu.async.token, memref<16x16xf16>, memref<16x16xf16>) -> !gpu.async.token loc("<stdin>":22:11)
    %39:2 = "gpu.create_2to4_spmat"(%38, %29, %30, %33#0) <{pruneFlag = #gpu<prune_2to4_spmat_flag PRUNE_AND_CHECK>}> : (!gpu.async.token, index, index, memref<16x32xf16>) -> (!gpu.sparse.spmat_handle, !gpu.async.token) loc("<stdin>":23:13)
    %40:2 = "gpu.create_dn_tensor"(%39#1, %34#0, %30, %29) <{operandSegmentSizes = array<i32: 1, 1, 2>}> : (!gpu.async.token, memref<32x16xf16>, index, index) -> (!gpu.sparse.dntensor_handle, !gpu.async.token) loc("<stdin>":24:13)
    %41:2 = "gpu.create_dn_tensor"(%40#1, %35#0, %29, %29) <{operandSegmentSizes = array<i32: 1, 1, 2>}> : (!gpu.async.token, memref<16x16xf16>, index, index) -> (!gpu.sparse.dntensor_handle, !gpu.async.token) loc("<stdin>":25:13)
    %42:4 = "gpu.spmm_buffer_size"(%41#1, %39#0, %40#0, %41#0) <{computeType = f16, modeA = #gpu<mat_transpose_mode NON_TRANSPOSE>, modeB = #gpu<mat_transpose_mode NON_TRANSPOSE>, resultSegmentSizes = array<i32: 3, 1>}> : (!gpu.async.token, !gpu.sparse.spmat_handle, !gpu.sparse.dntensor_handle, !gpu.sparse.dntensor_handle) -> (index, index, index, !gpu.async.token) loc("<stdin>":26:13)
    %43:2 = "gpu.alloc"(%42#3, %42#0) <{operandSegmentSizes = array<i32: 1, 1, 0>}> : (!gpu.async.token, index) -> (memref<?xf16>, !gpu.async.token) loc("<stdin>":27:13)
    %44:2 = "gpu.alloc"(%43#1, %42#1) <{operandSegmentSizes = array<i32: 1, 1, 0>}> : (!gpu.async.token, index) -> (memref<?xf16>, !gpu.async.token) loc("<stdin>":28:13)
    %45:2 = "gpu.alloc"(%44#1, %42#2) <{operandSegmentSizes = array<i32: 1, 1, 0>}> : (!gpu.async.token, index) -> (memref<?xf16>, !gpu.async.token) loc("<stdin>":29:13)
    %46 = "gpu.spmm"(%45#1, %39#0, %40#0, %41#0, %43#0, %44#0, %45#0) <{computeType = f16, modeA = #gpu<mat_transpose_mode NON_TRANSPOSE>, modeB = #gpu<mat_transpose_mode NON_TRANSPOSE>, operandSegmentSizes = array<i32: 1, 1, 1, 1, 3>}> : (!gpu.async.token, !gpu.sparse.spmat_handle, !gpu.sparse.dntensor_handle, !gpu.sparse.dntensor_handle, memref<?xf16>, memref<?xf16>, memref<?xf16>) -> !gpu.async.token loc("<stdin>":30:11)
    %47 = "gpu.destroy_sp_mat"(%46, %39#0) : (!gpu.async.token, !gpu.sparse.spmat_handle) -> !gpu.async.token loc("<stdin>":31:11)
    %48 = "gpu.destroy_dn_tensor"(%47, %40#0) : (!gpu.async.token, !gpu.sparse.dntensor_handle) -> !gpu.async.token loc("<stdin>":32:11)
    %49 = "gpu.destroy_dn_tensor"(%48, %41#0) : (!gpu.async.token, !gpu.sparse.dntensor_handle) -> !gpu.async.token loc("<stdin>":33:11)
    %50 = "gpu.memcpy"(%49, %arg11, %35#0) : (!gpu.async.token, memref<16x16xf16>, memref<16x16xf16>) -> !gpu.async.token loc("<stdin>":34:11)
    %51 = "gpu.dealloc"(%50, %35#0) : (!gpu.async.token, memref<16x16xf16>) -> !gpu.async.token loc("<stdin>":35:11)
    %52 = "gpu.dealloc"(%51, %34#0) : (!gpu.async.token, memref<32x16xf16>) -> !gpu.async.token loc("<stdin>":36:11)
    %53 = "gpu.dealloc"(%52, %33#0) : (!gpu.async.token, memref<16x32xf16>) -> !gpu.async.token loc("<stdin>":37:11)
    %54 = "gpu.dealloc"(%53, %45#0) : (!gpu.async.token, memref<?xf16>) -> !gpu.async.token loc("<stdin>":38:11)
    %55 = "gpu.dealloc"(%54, %44#0) : (!gpu.async.token, memref<?xf16>) -> !gpu.async.token loc("<stdin>":39:11)
    %56 = "gpu.dealloc"(%55, %43#0) : (!gpu.async.token, memref<?xf16>) -> !gpu.async.token loc("<stdin>":40:11)
    "gpu.wait"(%56) : (!gpu.async.token) -> () loc("<stdin>":41:5)
    "func.return"() : () -> () loc("<stdin>":42:5)
  }) : () -> () loc("<stdin>":7:3)
  "func.func"() <{function_type = () -> (), sym_name = "main"}> ({
    "llvm.call"() <{CConv = #llvm.cconv<ccc>, TailCallKind = #llvm.tailcallkind<none>, callee = @mgpuCreateSparseLtEnv, fastmathFlags = #llvm.fastmath<none>, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 0, 0>}> : () -> () loc("<stdin>":45:5)
    %0 = "arith.constant"() <{value = 0.000000e+00 : f16}> : () -> f16 loc("<stdin>":46:10)
    %1 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":47:10)
    %2 = "arith.constant"() <{value = 1 : index}> : () -> index loc("<stdin>":48:10)
    %3 = "arith.constant"() <{value = 2 : index}> : () -> index loc("<stdin>":49:10)
    %4 = "arith.constant"() <{value = 8 : index}> : () -> index loc("<stdin>":50:10)
    %5 = "arith.constant"() <{value = 16 : index}> : () -> index loc("<stdin>":51:10)
    %6 = "arith.constant"() <{value = 32 : index}> : () -> index loc("<stdin>":52:10)
    %7 = "arith.constant"() <{value = 64 : index}> : () -> index loc("<stdin>":53:10)
    %8 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<16x32xf16> loc("<stdin>":54:10)
    %9 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<32x16xf16> loc("<stdin>":55:10)
    %10 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<16x16xf16> loc("<stdin>":56:11)
    "scf.for"(%1, %5, %2) ({
    ^bb0(%arg7: index loc("<stdin>":58:10)):
      "scf.for"(%1, %5, %2) ({
      ^bb0(%arg8: index loc("<stdin>":60:12)):
        %18 = "arith.constant"() <{value = 0.000000e+00 : f16}> : () -> f16 loc("<stdin>":61:15)
        %19 = "arith.addi"(%arg7, %arg8) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index loc("<stdin>":62:15)
        %20 = "arith.addi"(%19, %2) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index loc("<stdin>":63:15)
        %21 = "arith.index_cast"(%20) : (index) -> i32 loc("<stdin>":64:15)
        %22 = "arith.sitofp"(%21) : (i32) -> f16 loc("<stdin>":65:15)
        %23 = "arith.muli"(%arg8, %3) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index loc("<stdin>":66:15)
        %24 = "arith.addi"(%23, %2) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index loc("<stdin>":67:15)
        "memref.store"(%22, %8, %arg7, %23) : (f16, memref<16x32xf16>, index, index) -> () loc("<stdin>":68:9)
        "memref.store"(%18, %8, %arg7, %24) : (f16, memref<16x32xf16>, index, index) -> () loc("<stdin>":69:9)
        "scf.yield"() : () -> () loc("<stdin>":70:9)
      }) : (index, index, index) -> () loc("<stdin>":59:7)
      "scf.yield"() : () -> () loc("<stdin>":72:7)
    }) : (index, index, index) -> () loc("<stdin>":57:5)
    "scf.for"(%1, %4, %2) ({
    ^bb0(%arg5: index loc("<stdin>":75:10)):
      "scf.for"(%1, %6, %2) ({
      ^bb0(%arg6: index loc("<stdin>":77:12)):
        %14 = "arith.subi"(%arg5, %arg6) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index loc("<stdin>":78:15)
        %15 = "arith.index_cast"(%14) : (index) -> i32 loc("<stdin>":79:15)
        %16 = "arith.sitofp"(%15) : (i32) -> f16 loc("<stdin>":80:15)
        %17 = "arith.addi"(%arg5, %4) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index loc("<stdin>":81:15)
        "memref.store"(%16, %9, %arg6, %arg5) : (f16, memref<32x16xf16>, index, index) -> () loc("<stdin>":82:9)
        "memref.store"(%16, %9, %arg6, %17) : (f16, memref<32x16xf16>, index, index) -> () loc("<stdin>":83:9)
        "scf.yield"() : () -> () loc("<stdin>":84:9)
      }) : (index, index, index) -> () loc("<stdin>":76:7)
      "scf.yield"() : () -> () loc("<stdin>":86:7)
    }) : (index, index, index) -> () loc("<stdin>":74:5)
    "scf.for"(%1, %5, %2) ({
    ^bb0(%arg3: index loc("<stdin>":89:10)):
      "scf.for"(%1, %5, %2) ({
      ^bb0(%arg4: index loc("<stdin>":91:12)):
        "memref.store"(%0, %10, %arg3, %arg4) : (f16, memref<16x16xf16>, index, index) -> () loc("<stdin>":92:9)
        "scf.yield"() : () -> () loc("<stdin>":93:9)
      }) : (index, index, index) -> () loc("<stdin>":90:7)
      "scf.yield"() : () -> () loc("<stdin>":95:7)
    }) : (index, index, index) -> () loc("<stdin>":88:5)
    "scf.for"(%1, %5, %2) ({
    ^bb0(%arg2: index loc("<stdin>":98:10)):
      %13 = "vector.transfer_read"(%8, %arg2, %1, %0) <{in_bounds = [false], operandSegmentSizes = array<i32: 1, 2, 1, 0>, permutation_map = affine_map<(d0, d1) -> (d1)>}> : (memref<16x32xf16>, index, index, f16) -> vector<32xf16> loc("<stdin>":99:13)
      "vector.print"(%13) <{punctuation = #vector.punctuation<newline>}> : (vector<32xf16>) -> () loc("<stdin>":100:7)
      "scf.yield"() : () -> () loc("<stdin>":101:7)
    }) : (index, index, index) -> () loc("<stdin>":97:5)
    "scf.for"(%1, %6, %2) ({
    ^bb0(%arg1: index loc("<stdin>":104:10)):
      %12 = "vector.transfer_read"(%9, %arg1, %1, %0) <{in_bounds = [false], operandSegmentSizes = array<i32: 1, 2, 1, 0>, permutation_map = affine_map<(d0, d1) -> (d1)>}> : (memref<32x16xf16>, index, index, f16) -> vector<16xf16> loc("<stdin>":105:13)
      "vector.print"(%12) <{punctuation = #vector.punctuation<newline>}> : (vector<16xf16>) -> () loc("<stdin>":106:7)
      "scf.yield"() : () -> () loc("<stdin>":107:7)
    }) : (index, index, index) -> () loc("<stdin>":103:5)
    "func.call"(%8, %9, %10) <{callee = @matmul24}> : (memref<16x32xf16>, memref<32x16xf16>, memref<16x16xf16>) -> () loc("<stdin>":109:5)
    "scf.for"(%1, %5, %2) ({
    ^bb0(%arg0: index loc("<stdin>":111:10)):
      %11 = "vector.transfer_read"(%10, %arg0, %1, %0) <{in_bounds = [false], operandSegmentSizes = array<i32: 1, 2, 1, 0>, permutation_map = affine_map<(d0, d1) -> (d1)>}> : (memref<16x16xf16>, index, index, f16) -> vector<16xf16> loc("<stdin>":112:13)
      "vector.print"(%11) <{punctuation = #vector.punctuation<newline>}> : (vector<16xf16>) -> () loc("<stdin>":113:7)
      "scf.yield"() : () -> () loc("<stdin>":114:7)
    }) : (index, index, index) -> () loc("<stdin>":110:5)
    "llvm.call"() <{CConv = #llvm.cconv<ccc>, TailCallKind = #llvm.tailcallkind<none>, callee = @mgpuDestroySparseLtEnv, fastmathFlags = #llvm.fastmath<none>, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 0, 0>}> : () -> () loc("<stdin>":116:5)
    "func.return"() : () -> () loc("<stdin>":117:5)
  }) : () -> () loc("<stdin>":44:3)
}) : () -> () loc("<stdin>":2:1)
