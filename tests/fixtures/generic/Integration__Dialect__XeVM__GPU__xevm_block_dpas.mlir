"builtin.module"() <{sym_name = "gemm"}> ({
  "gpu.module"() <{sym_name = "kernel"}> ({
    "gpu.func"() <{function_type = (!llvm.ptr<1>, !llvm.ptr<1>, !llvm.ptr<1>) -> ()}> ({
    ^bb0(%arg9: !llvm.ptr<1>, %arg10: !llvm.ptr<1>, %arg11: !llvm.ptr<1>):
      %33 = "arith.constant"() <{value = 32 : i32}> : () -> i32
      %34 = "arith.constant"() <{value = 8 : i32}> : () -> i32
      %35 = "arith.constant"() <{value = 32 : i32}> : () -> i32
      %36 = "arith.constant"() <{value = 0 : i32}> : () -> i32
      %37 = "arith.constant"() <{value = 0 : i32}> : () -> i32
      %38 = "xevm.blockload2d"(%arg9, %33, %34, %35, %36, %37) <{elem_size_in_bits = 16 : i32, pack_register = false, tile_height = 8 : i32, tile_width = 16 : i32, transpose = false, v_blocks = 1 : i32}> : (!llvm.ptr<1>, i32, i32, i32, i32, i32) -> vector<8xi16>
      %39 = "arith.constant"() <{value = 32 : i32}> : () -> i32
      %40 = "arith.constant"() <{value = 16 : i32}> : () -> i32
      %41 = "arith.constant"() <{value = 32 : i32}> : () -> i32
      %42 = "xevm.blockload2d"(%arg10, %39, %40, %41, %36, %37) <{elem_size_in_bits = 16 : i32, pack_register = false, tile_height = 16 : i32, tile_width = 16 : i32, transpose = false, v_blocks = 1 : i32}> : (!llvm.ptr<1>, i32, i32, i32, i32, i32) -> vector<16xi16>
      %43 = "vector.bitcast"(%42) : (vector<16xi16>) -> vector<8xi32>
      %44 = "arith.constant"() <{value = 64 : i32}> : () -> i32
      %45 = "arith.constant"() <{value = 8 : i32}> : () -> i32
      %46 = "arith.constant"() <{value = 64 : i32}> : () -> i32
      %47 = "xevm.blockload2d"(%arg11, %44, %45, %46, %36, %37) <{elem_size_in_bits = 32 : i32, pack_register = false, tile_height = 8 : i32, tile_width = 16 : i32, transpose = false, v_blocks = 1 : i32}> : (!llvm.ptr<1>, i32, i32, i32, i32, i32) -> vector<8xi32>
      %48 = "vector.bitcast"(%47) : (vector<8xi32>) -> vector<8xf32>
      %49 = "xevm.mma"(%38, %43, %48) <{shape = #xevm.mma_shape<m = 8, n = 16, k = 16>, types = #xevm.mma_types<d = f32, a = f16, b = f16, c = f32>}> : (vector<8xi16>, vector<8xi32>, vector<8xf32>) -> vector<8xf32>
      %50 = "vector.bitcast"(%49) : (vector<8xf32>) -> vector<8xi32>
      "xevm.blockstore2d"(%arg11, %44, %45, %46, %36, %37, %50) <{elem_size_in_bits = 32 : i32, tile_height = 8 : i32, tile_width = 16 : i32}> : (!llvm.ptr<1>, i32, i32, i32, i32, i32, vector<8xi32>) -> ()
      "gpu.return"() : () -> ()
    }) {gpu.kernel, sym_name = "block_dpas", workgroup_attributions = 0 : i64} : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<8x16xf16>, memref<16x16xf16>, memref<8x16xf32>) -> memref<8x16xf32>, sym_name = "test"}> ({
  ^bb0(%arg6: memref<8x16xf16>, %arg7: memref<16x16xf16>, %arg8: memref<8x16xf32>):
    %15 = "arith.constant"() <{value = 1 : index}> : () -> index
    %16 = "arith.constant"() <{value = 16 : index}> : () -> index
    %17 = "gpu.alloc"() <{operandSegmentSizes = array<i32: 0, 0, 0>}> : () -> memref<8x16xf16>
    "gpu.memcpy"(%17, %arg6) : (memref<8x16xf16>, memref<8x16xf16>) -> ()
    %18 = "memref.extract_aligned_pointer_as_index"(%17) : (memref<8x16xf16>) -> index
    %19 = "arith.index_cast"(%18) : (index) -> i64
    %20 = "llvm.inttoptr"(%19) : (i64) -> !llvm.ptr
    %21 = "llvm.addrspacecast"(%20) : (!llvm.ptr) -> !llvm.ptr<1>
    %22 = "gpu.alloc"() <{operandSegmentSizes = array<i32: 0, 0, 0>}> : () -> memref<16x16xf16>
    "gpu.memcpy"(%22, %arg7) : (memref<16x16xf16>, memref<16x16xf16>) -> ()
    %23 = "memref.extract_aligned_pointer_as_index"(%22) : (memref<16x16xf16>) -> index
    %24 = "arith.index_cast"(%23) : (index) -> i64
    %25 = "llvm.inttoptr"(%24) : (i64) -> !llvm.ptr
    %26 = "llvm.addrspacecast"(%25) : (!llvm.ptr) -> !llvm.ptr<1>
    %27 = "gpu.alloc"() <{operandSegmentSizes = array<i32: 0, 0, 0>}> : () -> memref<8x16xf32>
    "gpu.memcpy"(%27, %arg8) : (memref<8x16xf32>, memref<8x16xf32>) -> ()
    %28 = "memref.extract_aligned_pointer_as_index"(%27) : (memref<8x16xf32>) -> index
    %29 = "arith.index_cast"(%28) : (index) -> i64
    %30 = "llvm.inttoptr"(%29) : (i64) -> !llvm.ptr
    %31 = "llvm.addrspacecast"(%30) : (!llvm.ptr) -> !llvm.ptr<1>
    "gpu.launch_func"(%15, %15, %15, %16, %15, %15, %21, %26, %31) <{kernel = @kernel::@block_dpas, operandSegmentSizes = array<i32: 0, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 3, 0>}> : (index, index, index, index, index, index, !llvm.ptr<1>, !llvm.ptr<1>, !llvm.ptr<1>) -> ()
    "gpu.dealloc"(%17) : (memref<8x16xf16>) -> ()
    "gpu.dealloc"(%22) : (memref<16x16xf16>) -> ()
    %32 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<8x16xf32>
    "gpu.memcpy"(%32, %27) : (memref<8x16xf32>, memref<8x16xf32>) -> ()
    "gpu.dealloc"(%27) : (memref<8x16xf32>) -> ()
    "func.return"(%32) : (memref<8x16xf32>) -> ()
  }) {llvm.emit_c_interface} : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "main"}> ({
    %0 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<8x16xf16>
    %1 = "arith.constant"() <{value = 0 : index}> : () -> index
    %2 = "arith.constant"() <{value = 1 : index}> : () -> index
    %3 = "arith.constant"() <{value = 8 : index}> : () -> index
    %4 = "arith.constant"() <{value = 16 : index}> : () -> index
    "scf.for"(%1, %3, %2) ({
    ^bb0(%arg4: index):
      "scf.for"(%1, %4, %2) ({
      ^bb0(%arg5: index):
        %13 = "arith.index_cast"(%arg4) : (index) -> i32
        %14 = "arith.sitofp"(%13) : (i32) -> f16
        "memref.store"(%14, %0, %arg4, %arg5) : (f16, memref<8x16xf16>, index, index) -> ()
        "scf.yield"() : () -> ()
      }) : (index, index, index) -> ()
      "scf.yield"() : () -> ()
    }) : (index, index, index) -> ()
    %5 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<16x16xf16>
    "scf.for"(%1, %4, %2) ({
    ^bb0(%arg2: index):
      "scf.for"(%1, %4, %2) ({
      ^bb0(%arg3: index):
        %11 = "arith.index_cast"(%arg3) : (index) -> i32
        %12 = "arith.sitofp"(%11) : (i32) -> f16
        "memref.store"(%12, %5, %arg2, %arg3) : (f16, memref<16x16xf16>, index, index) -> ()
        "scf.yield"() : () -> ()
      }) : (index, index, index) -> ()
      "scf.yield"() : () -> ()
    }) : (index, index, index) -> ()
    %6 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<8x16xf32>
    %7 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    "scf.for"(%1, %3, %2) ({
    ^bb0(%arg0: index):
      "scf.for"(%1, %4, %2) ({
      ^bb0(%arg1: index):
        "memref.store"(%7, %6, %arg0, %arg1) : (f32, memref<8x16xf32>, index, index) -> ()
        "scf.yield"() : () -> ()
      }) : (index, index, index) -> ()
      "scf.yield"() : () -> ()
    }) : (index, index, index) -> ()
    %8 = "func.call"(%0, %5, %6) <{callee = @test}> : (memref<8x16xf16>, memref<16x16xf16>, memref<8x16xf32>) -> memref<8x16xf32>
    %9 = "memref.cast"(%8) : (memref<8x16xf32>) -> memref<*xf32>
    %10 = "memref.cast"(%0) : (memref<8x16xf16>) -> memref<*xf16>
    "func.call"(%9) <{callee = @printMemrefF32}> : (memref<*xf32>) -> ()
    "memref.dealloc"(%0) : (memref<8x16xf16>) -> ()
    "memref.dealloc"(%5) : (memref<16x16xf16>) -> ()
    "memref.dealloc"(%6) : (memref<8x16xf32>) -> ()
    "memref.dealloc"(%8) : (memref<8x16xf32>) -> ()
    "func.return"() : () -> ()
  }) {llvm.emit_c_interface} : () -> ()
  "func.func"() <{function_type = (memref<*xf16>) -> (), sym_name = "printMemrefF16", sym_visibility = "private"}> ({
  }) {llvm.emit_c_interface} : () -> ()
  "func.func"() <{function_type = (memref<*xf32>) -> (), sym_name = "printMemrefF32", sym_visibility = "private"}> ({
  }) {llvm.emit_c_interface} : () -> ()
}) {gpu.container_module} : () -> ()

