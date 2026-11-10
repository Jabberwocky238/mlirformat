"builtin.module"() <{sym_name = "gemm"}> ({
  "gpu.module"() <{sym_name = "kernel"}> ({
    "gpu.func"() <{function_type = (!llvm.ptr<1>, !llvm.ptr<1>, !llvm.ptr<1>) -> (), kernel}> ({
    ^bb0(%arg9: !llvm.ptr<1>, %arg10: !llvm.ptr<1>, %arg11: !llvm.ptr<1>):
      %31 = "arith.constant"() <{value = 64 : i32}> : () -> i32
      %32 = "arith.constant"() <{value = 8 : i32}> : () -> i32
      %33 = "arith.constant"() <{value = 64 : i32}> : () -> i32
      %34 = "arith.constant"() <{value = 0 : i32}> : () -> i32
      %35 = "arith.constant"() <{value = 0 : i32}> : () -> i32
      %36 = "xevm.blockload2d"(%arg9, %31, %32, %33, %34, %35) <{elem_size_in_bits = 32 : i32, pack_register = false, tile_height = 8 : i32, tile_width = 16 : i32, transpose = false, v_blocks = 1 : i32}> : (!llvm.ptr<1>, i32, i32, i32, i32, i32) -> vector<8xi32>
      %37 = "vector.bitcast"(%36) : (vector<8xi32>) -> vector<16xf16>
      %38 = "xevm.truncf"(%37) <{dst_etype = #xevm<dst_etype dst_etype = bf8>, src_etype = #xevm<src_etype src_etype = f16>}> : (vector<16xf16>) -> vector<16xi8>
      %39 = "vector.bitcast"(%38) : (vector<16xi8>) -> vector<8xi16>
      %40 = "arith.constant"() <{value = 16 : i32}> : () -> i32
      %41 = "arith.constant"() <{value = 32 : i32}> : () -> i32
      %42 = "arith.constant"() <{value = 16 : i32}> : () -> i32
      %43 = "xevm.blockload2d"(%arg10, %40, %41, %42, %34, %35) <{elem_size_in_bits = 8 : i32, pack_register = true, tile_height = 32 : i32, tile_width = 16 : i32, transpose = false, v_blocks = 1 : i32}> : (!llvm.ptr<1>, i32, i32, i32, i32, i32) -> vector<8xi32>
      %44 = "arith.constant"() <{value = 1.000000e+00 : f8E8M0FNU}> : () -> f8E8M0FNU
      %45 = "arith.constant"() <{value = 1.000000e+00 : f8E8M0FNU}> : () -> f8E8M0FNU
      %46 = "arith.bitcast"(%44) : (f8E8M0FNU) -> i8
      %47 = "arith.bitcast"(%45) : (f8E8M0FNU) -> i8
      %48 = "arith.constant"() <{value = dense<0.000000e+00> : vector<8xf32>}> : () -> vector<8xf32>
      %49 = "xevm.mma_mx"(%39, %43, %46, %47, %48) <{shape = #xevm.mma_shape<m = 8, n = 16, k = 32>, types = #xevm.mma_types<d = f32, a = bf8, b = bf8, c = f32>}> : (vector<8xi16>, vector<8xi32>, i8, i8, vector<8xf32>) -> vector<8xf32>
      %50 = "vector.bitcast"(%49) : (vector<8xf32>) -> vector<8xi32>
      %51 = "arith.constant"() <{value = 64 : i32}> : () -> i32
      %52 = "arith.constant"() <{value = 8 : i32}> : () -> i32
      %53 = "arith.constant"() <{value = 64 : i32}> : () -> i32
      "xevm.blockstore2d"(%arg11, %51, %52, %53, %34, %35, %50) <{elem_size_in_bits = 32 : i32, tile_height = 8 : i32, tile_width = 16 : i32}> : (!llvm.ptr<1>, i32, i32, i32, i32, i32, vector<8xi32>) -> ()
      "gpu.return"() : () -> ()
    }) {sym_name = "block_scaled_dpas_bf8"} : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<8x32xf16>, memref<32x16xf8E5M2>, memref<8x16xf32>) -> memref<8x16xf32>, sym_name = "test"}> ({
  ^bb0(%arg6: memref<8x32xf16>, %arg7: memref<32x16xf8E5M2>, %arg8: memref<8x16xf32>):
    %13 = "arith.constant"() <{value = 1 : index}> : () -> index
    %14 = "arith.constant"() <{value = 16 : index}> : () -> index
    %15 = "gpu.alloc"() <{operandSegmentSizes = array<i32: 0, 0, 0>}> : () -> memref<8x32xf16>
    "gpu.memcpy"(%15, %arg6) : (memref<8x32xf16>, memref<8x32xf16>) -> ()
    %16 = "memref.extract_aligned_pointer_as_index"(%15) : (memref<8x32xf16>) -> index
    %17 = "arith.index_cast"(%16) : (index) -> i64
    %18 = "llvm.inttoptr"(%17) : (i64) -> !llvm.ptr
    %19 = "llvm.addrspacecast"(%18) : (!llvm.ptr) -> !llvm.ptr<1>
    %20 = "gpu.alloc"() <{operandSegmentSizes = array<i32: 0, 0, 0>}> : () -> memref<32x16xf8E5M2>
    "gpu.memcpy"(%20, %arg7) : (memref<32x16xf8E5M2>, memref<32x16xf8E5M2>) -> ()
    %21 = "memref.extract_aligned_pointer_as_index"(%20) : (memref<32x16xf8E5M2>) -> index
    %22 = "arith.index_cast"(%21) : (index) -> i64
    %23 = "llvm.inttoptr"(%22) : (i64) -> !llvm.ptr
    %24 = "llvm.addrspacecast"(%23) : (!llvm.ptr) -> !llvm.ptr<1>
    %25 = "gpu.alloc"() <{operandSegmentSizes = array<i32: 0, 0, 0>}> : () -> memref<8x16xf32>
    "gpu.memcpy"(%25, %arg8) : (memref<8x16xf32>, memref<8x16xf32>) -> ()
    %26 = "memref.extract_aligned_pointer_as_index"(%25) : (memref<8x16xf32>) -> index
    %27 = "arith.index_cast"(%26) : (index) -> i64
    %28 = "llvm.inttoptr"(%27) : (i64) -> !llvm.ptr
    %29 = "llvm.addrspacecast"(%28) : (!llvm.ptr) -> !llvm.ptr<1>
    "gpu.launch_func"(%13, %13, %13, %14, %13, %13, %19, %24, %29) <{kernel = @kernel::@block_scaled_dpas_bf8, operandSegmentSizes = array<i32: 0, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 3, 0>}> : (index, index, index, index, index, index, !llvm.ptr<1>, !llvm.ptr<1>, !llvm.ptr<1>) -> ()
    "gpu.dealloc"(%15) : (memref<8x32xf16>) -> ()
    "gpu.dealloc"(%20) : (memref<32x16xf8E5M2>) -> ()
    %30 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<8x16xf32>
    "gpu.memcpy"(%30, %25) : (memref<8x16xf32>, memref<8x16xf32>) -> ()
    "gpu.dealloc"(%25) : (memref<8x16xf32>) -> ()
    "func.return"(%30) : (memref<8x16xf32>) -> ()
  }) {llvm.emit_c_interface} : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "main"}> ({
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = 1 : index}> : () -> index
    %2 = "arith.constant"() <{value = 8 : index}> : () -> index
    %3 = "arith.constant"() <{value = 16 : index}> : () -> index
    %4 = "arith.constant"() <{value = 32 : index}> : () -> index
    %5 = "arith.constant"() <{value = 1.000000e+00 : f16}> : () -> f16
    %6 = "arith.constant"() <{value = 1.000000e+00 : f8E5M2}> : () -> f8E5M2
    %7 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %8 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<8x32xf16>
    "scf.for"(%0, %2, %1) ({
    ^bb0(%arg4: index):
      "scf.for"(%0, %4, %1) ({
      ^bb0(%arg5: index):
        "memref.store"(%5, %8, %arg4, %arg5) : (f16, memref<8x32xf16>, index, index) -> ()
        "scf.yield"() : () -> ()
      }) : (index, index, index) -> ()
      "scf.yield"() : () -> ()
    }) : (index, index, index) -> ()
    %9 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<32x16xf8E5M2>
    "scf.for"(%0, %4, %1) ({
    ^bb0(%arg2: index):
      "scf.for"(%0, %3, %1) ({
      ^bb0(%arg3: index):
        "memref.store"(%6, %9, %arg2, %arg3) : (f8E5M2, memref<32x16xf8E5M2>, index, index) -> ()
        "scf.yield"() : () -> ()
      }) : (index, index, index) -> ()
      "scf.yield"() : () -> ()
    }) : (index, index, index) -> ()
    %10 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<8x16xf32>
    "scf.for"(%0, %2, %1) ({
    ^bb0(%arg0: index):
      "scf.for"(%0, %3, %1) ({
      ^bb0(%arg1: index):
        "memref.store"(%7, %10, %arg0, %arg1) : (f32, memref<8x16xf32>, index, index) -> ()
        "scf.yield"() : () -> ()
      }) : (index, index, index) -> ()
      "scf.yield"() : () -> ()
    }) : (index, index, index) -> ()
    %11 = "func.call"(%8, %9, %10) <{callee = @test}> : (memref<8x32xf16>, memref<32x16xf8E5M2>, memref<8x16xf32>) -> memref<8x16xf32>
    %12 = "memref.cast"(%11) : (memref<8x16xf32>) -> memref<*xf32>
    "func.call"(%12) <{callee = @printMemrefF32}> : (memref<*xf32>) -> ()
    "memref.dealloc"(%8) : (memref<8x32xf16>) -> ()
    "memref.dealloc"(%9) : (memref<32x16xf8E5M2>) -> ()
    "memref.dealloc"(%10) : (memref<8x16xf32>) -> ()
    "memref.dealloc"(%11) : (memref<8x16xf32>) -> ()
    "func.return"() : () -> ()
  }) {llvm.emit_c_interface} : () -> ()
  "func.func"() <{function_type = (memref<*xf32>) -> (), sym_name = "printMemrefF32", sym_visibility = "private"}> ({
  }) {llvm.emit_c_interface} : () -> ()
}) {gpu.container_module} : () -> ()

