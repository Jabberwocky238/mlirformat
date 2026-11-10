"builtin.module"() <{sym_name = "gemm"}> ({
  "gpu.module"() <{sym_name = "kernel"}> ({
    "gpu.func"() <{function_type = (!llvm.ptr<1>, !llvm.ptr<1>, !llvm.ptr<1>) -> (), kernel}> ({
    ^bb0(%arg9: !llvm.ptr<1>, %arg10: !llvm.ptr<1>, %arg11: !llvm.ptr<1>):
      %32 = "arith.constant"() <{value = 0 : i32}> : () -> i32
      %33 = "arith.constant"() <{value = 0 : i32}> : () -> i32
      %34 = "arith.constant"() <{value = dense<1.000000e+00> : vector<16xf16>}> : () -> vector<16xf16>
      %35 = "xevm.truncf"(%34) <{dst_etype = #xevm<dst_etype dst_etype = e2m1>, src_etype = #xevm<src_etype src_etype = f16>}> : (vector<16xf16>) -> vector<8xi8>
      %36 = "vector.shuffle"(%35, %35) <{mask = array<i64: 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15>}> : (vector<8xi8>, vector<8xi8>) -> vector<16xi8>
      %37 = "vector.bitcast"(%36) : (vector<16xi8>) -> vector<8xi16>
      %38 = "arith.constant"() <{value = 16 : i32}> : () -> i32
      %39 = "arith.constant"() <{value = 32 : i32}> : () -> i32
      %40 = "arith.constant"() <{value = 16 : i32}> : () -> i32
      %41 = "xevm.blockload2d"(%arg10, %38, %39, %40, %32, %33) <{elem_size_in_bits = 8 : i32, pack_register = true, tile_height = 32 : i32, tile_width = 16 : i32, transpose = false, v_blocks = 1 : i32}> : (!llvm.ptr<1>, i32, i32, i32, i32, i32) -> vector<8xi32>
      %42 = "arith.constant"() <{value = dense<1.000000e+00> : vector<2xf8E8M0FNU>}> : () -> vector<2xf8E8M0FNU>
      %43 = "arith.constant"() <{value = dense<1.000000e+00> : vector<2xf8E8M0FNU>}> : () -> vector<2xf8E8M0FNU>
      %44 = "vector.bitcast"(%42) : (vector<2xf8E8M0FNU>) -> vector<2xi8>
      %45 = "vector.bitcast"(%43) : (vector<2xf8E8M0FNU>) -> vector<2xi8>
      %46 = "arith.constant"() <{value = dense<0.000000e+00> : vector<8xf32>}> : () -> vector<8xf32>
      %47 = "xevm.mma_mx"(%37, %41, %44, %45, %46) <{shape = #xevm.mma_shape<m = 8, n = 16, k = 64>, types = #xevm.mma_types<d = f32, a = e2m1, b = e2m1, c = f32>}> : (vector<8xi16>, vector<8xi32>, vector<2xi8>, vector<2xi8>, vector<8xf32>) -> vector<8xf32>
      %48 = "vector.bitcast"(%47) : (vector<8xf32>) -> vector<8xi32>
      %49 = "arith.constant"() <{value = 64 : i32}> : () -> i32
      %50 = "arith.constant"() <{value = 8 : i32}> : () -> i32
      %51 = "arith.constant"() <{value = 64 : i32}> : () -> i32
      "xevm.blockstore2d"(%arg11, %49, %50, %51, %32, %33, %48) <{elem_size_in_bits = 32 : i32, tile_height = 8 : i32, tile_width = 16 : i32}> : (!llvm.ptr<1>, i32, i32, i32, i32, i32, vector<8xi32>) -> ()
      "gpu.return"() : () -> ()
    }) {sym_name = "block_scaled_dpas_e2m1"} : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<8x64xf16>, memref<32x16xi8>, memref<8x16xf32>) -> memref<8x16xf32>, sym_name = "test"}> ({
  ^bb0(%arg6: memref<8x64xf16>, %arg7: memref<32x16xi8>, %arg8: memref<8x16xf32>):
    %14 = "arith.constant"() <{value = 1 : index}> : () -> index
    %15 = "arith.constant"() <{value = 16 : index}> : () -> index
    %16 = "gpu.alloc"() <{operandSegmentSizes = array<i32: 0, 0, 0>}> : () -> memref<8x64xf16>
    "gpu.memcpy"(%16, %arg6) : (memref<8x64xf16>, memref<8x64xf16>) -> ()
    %17 = "memref.extract_aligned_pointer_as_index"(%16) : (memref<8x64xf16>) -> index
    %18 = "arith.index_cast"(%17) : (index) -> i64
    %19 = "llvm.inttoptr"(%18) : (i64) -> !llvm.ptr
    %20 = "llvm.addrspacecast"(%19) : (!llvm.ptr) -> !llvm.ptr<1>
    %21 = "gpu.alloc"() <{operandSegmentSizes = array<i32: 0, 0, 0>}> : () -> memref<32x16xi8>
    "gpu.memcpy"(%21, %arg7) : (memref<32x16xi8>, memref<32x16xi8>) -> ()
    %22 = "memref.extract_aligned_pointer_as_index"(%21) : (memref<32x16xi8>) -> index
    %23 = "arith.index_cast"(%22) : (index) -> i64
    %24 = "llvm.inttoptr"(%23) : (i64) -> !llvm.ptr
    %25 = "llvm.addrspacecast"(%24) : (!llvm.ptr) -> !llvm.ptr<1>
    %26 = "gpu.alloc"() <{operandSegmentSizes = array<i32: 0, 0, 0>}> : () -> memref<8x16xf32>
    "gpu.memcpy"(%26, %arg8) : (memref<8x16xf32>, memref<8x16xf32>) -> ()
    %27 = "memref.extract_aligned_pointer_as_index"(%26) : (memref<8x16xf32>) -> index
    %28 = "arith.index_cast"(%27) : (index) -> i64
    %29 = "llvm.inttoptr"(%28) : (i64) -> !llvm.ptr
    %30 = "llvm.addrspacecast"(%29) : (!llvm.ptr) -> !llvm.ptr<1>
    "gpu.launch_func"(%14, %14, %14, %15, %14, %14, %20, %25, %30) <{kernel = @kernel::@block_scaled_dpas_e2m1, operandSegmentSizes = array<i32: 0, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 3, 0>}> : (index, index, index, index, index, index, !llvm.ptr<1>, !llvm.ptr<1>, !llvm.ptr<1>) -> ()
    "gpu.dealloc"(%16) : (memref<8x64xf16>) -> ()
    "gpu.dealloc"(%21) : (memref<32x16xi8>) -> ()
    %31 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<8x16xf32>
    "gpu.memcpy"(%31, %26) : (memref<8x16xf32>, memref<8x16xf32>) -> ()
    "gpu.dealloc"(%26) : (memref<8x16xf32>) -> ()
    "func.return"(%31) : (memref<8x16xf32>) -> ()
  }) {llvm.emit_c_interface} : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "main"}> ({
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = 1 : index}> : () -> index
    %2 = "arith.constant"() <{value = 8 : index}> : () -> index
    %3 = "arith.constant"() <{value = 16 : index}> : () -> index
    %4 = "arith.constant"() <{value = 32 : index}> : () -> index
    %5 = "arith.constant"() <{value = 64 : index}> : () -> index
    %6 = "arith.constant"() <{value = 1.000000e+00 : f16}> : () -> f16
    %7 = "arith.constant"() <{value = 34 : i8}> : () -> i8
    %8 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %9 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<8x64xf16>
    "scf.for"(%0, %2, %1) ({
    ^bb0(%arg4: index):
      "scf.for"(%0, %5, %1) ({
      ^bb0(%arg5: index):
        "memref.store"(%6, %9, %arg4, %arg5) : (f16, memref<8x64xf16>, index, index) -> ()
        "scf.yield"() : () -> ()
      }) : (index, index, index) -> ()
      "scf.yield"() : () -> ()
    }) : (index, index, index) -> ()
    %10 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<32x16xi8>
    "scf.for"(%0, %4, %1) ({
    ^bb0(%arg2: index):
      "scf.for"(%0, %3, %1) ({
      ^bb0(%arg3: index):
        "memref.store"(%7, %10, %arg2, %arg3) : (i8, memref<32x16xi8>, index, index) -> ()
        "scf.yield"() : () -> ()
      }) : (index, index, index) -> ()
      "scf.yield"() : () -> ()
    }) : (index, index, index) -> ()
    %11 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<8x16xf32>
    "scf.for"(%0, %2, %1) ({
    ^bb0(%arg0: index):
      "scf.for"(%0, %3, %1) ({
      ^bb0(%arg1: index):
        "memref.store"(%8, %11, %arg0, %arg1) : (f32, memref<8x16xf32>, index, index) -> ()
        "scf.yield"() : () -> ()
      }) : (index, index, index) -> ()
      "scf.yield"() : () -> ()
    }) : (index, index, index) -> ()
    %12 = "func.call"(%9, %10, %11) <{callee = @test}> : (memref<8x64xf16>, memref<32x16xi8>, memref<8x16xf32>) -> memref<8x16xf32>
    %13 = "memref.cast"(%12) : (memref<8x16xf32>) -> memref<*xf32>
    "func.call"(%13) <{callee = @printMemrefF32}> : (memref<*xf32>) -> ()
    "memref.dealloc"(%9) : (memref<8x64xf16>) -> ()
    "memref.dealloc"(%10) : (memref<32x16xi8>) -> ()
    "memref.dealloc"(%11) : (memref<8x16xf32>) -> ()
    "memref.dealloc"(%12) : (memref<8x16xf32>) -> ()
    "func.return"() : () -> ()
  }) {llvm.emit_c_interface} : () -> ()
  "func.func"() <{function_type = (memref<*xf32>) -> (), sym_name = "printMemrefF32", sym_visibility = "private"}> ({
  }) {llvm.emit_c_interface} : () -> ()
}) {gpu.container_module} : () -> ()

