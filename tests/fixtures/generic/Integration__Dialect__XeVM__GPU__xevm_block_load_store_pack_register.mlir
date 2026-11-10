"builtin.module"() <{sym_name = "gemm"}> ({
  "gpu.module"() <{sym_name = "kernel"}> ({
    "gpu.func"() <{function_type = (!llvm.ptr<1>, !llvm.ptr<1>) -> (), kernel}> ({
    ^bb0(%arg3: !llvm.ptr<1>, %arg4: !llvm.ptr<1>):
      %22 = "arith.constant"() <{value = 32 : i32}> : () -> i32
      %23 = "arith.constant"() <{value = 16 : i32}> : () -> i32
      %24 = "arith.constant"() <{value = 32 : i32}> : () -> i32
      %25 = "arith.constant"() <{value = 0 : i32}> : () -> i32
      %26 = "arith.constant"() <{value = 0 : i32}> : () -> i32
      %27 = "xevm.blockload2d"(%arg3, %22, %23, %24, %25, %26) <{elem_size_in_bits = 16 : i32, pack_register = false, tile_height = 16 : i32, tile_width = 16 : i32, transpose = false, v_blocks = 1 : i32}> : (!llvm.ptr<1>, i32, i32, i32, i32, i32) -> vector<16xi16>
      %28 = "vector.bitcast"(%27) : (vector<16xi16>) -> vector<16xf16>
      %29 = "vector.shape_cast"(%28) : (vector<16xf16>) -> vector<8x1x2xf16>
      %30 = "xevm.blockload2d"(%arg3, %22, %23, %24, %25, %26) <{elem_size_in_bits = 16 : i32, pack_register = true, tile_height = 16 : i32, tile_width = 16 : i32, transpose = false, v_blocks = 1 : i32}> : (!llvm.ptr<1>, i32, i32, i32, i32, i32) -> vector<8xi32>
      %31 = "vector.bitcast"(%30) : (vector<8xi32>) -> vector<16xf16>
      %32 = "vector.shape_cast"(%31) : (vector<16xf16>) -> vector<8x1x2xf16>
      %33 = "gpu.thread_id"() <{dimension = #gpu<dim x>}> : () -> index
      %34 = "arith.index_cast"(%33) : (index) -> i64
      %35 = "llvm.trunc"(%34) <{overflowFlags = 0 : i32}> : (i64) -> i32
      %36 = "arith.sitofp"(%35) : (i32) -> f16
      %37 = "vector.insert"(%36, %32) <{static_position = array<i64: 0, 0, 1>}> : (f16, vector<8x1x2xf16>) -> vector<8x1x2xf16>
      %38 = "vector.extract_strided_slice"(%37) <{offsets = [0, 0, 0], sizes = [4, 1, 2], strides = [1, 1, 1]}> : (vector<8x1x2xf16>) -> vector<4x1x2xf16>
      %39 = "vector.shape_cast"(%38) : (vector<4x1x2xf16>) -> vector<8xf16>
      %40 = "arith.constant"() <{value = 8 : i32}> : () -> i32
      %41 = "arith.constant"() <{value = 32 : i32}> : () -> i32
      %42 = "arith.constant"() <{value = 32 : i32}> : () -> i32
      "xevm.blockstore2d"(%arg4, %41, %40, %42, %25, %26, %39) <{elem_size_in_bits = 16 : i32, tile_height = 8 : i32, tile_width = 16 : i32}> : (!llvm.ptr<1>, i32, i32, i32, i32, i32, vector<8xf16>) -> ()
      %43 = "vector.extract_strided_slice"(%37) <{offsets = [4, 0, 0], sizes = [4, 1, 2], strides = [1, 1, 1]}> : (vector<8x1x2xf16>) -> vector<4x1x2xf16>
      %44 = "vector.shape_cast"(%43) : (vector<4x1x2xf16>) -> vector<8xf16>
      %45 = "arith.muli"(%42, %40) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
      %46 = "llvm.getelementptr"(%arg4, %45) <{elem_type = i8, noWrapFlags = 0 : i32, rawConstantIndices = array<i32: -2147483648>}> : (!llvm.ptr<1>, i32) -> !llvm.ptr<1>
      "xevm.blockstore2d"(%46, %41, %40, %42, %25, %26, %44) <{elem_size_in_bits = 16 : i32, tile_height = 8 : i32, tile_width = 16 : i32}> : (!llvm.ptr<1>, i32, i32, i32, i32, i32, vector<8xf16>) -> ()
      "gpu.return"() : () -> ()
    }) {sym_name = "block_load_store"} : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<16x16xf16>) -> memref<16x16xf16>, sym_name = "test"}> ({
  ^bb0(%arg2: memref<16x16xf16>):
    %9 = "arith.constant"() <{value = 1 : index}> : () -> index
    %10 = "arith.constant"() <{value = 16 : index}> : () -> index
    %11 = "gpu.alloc"() <{operandSegmentSizes = array<i32: 0, 0, 0>}> : () -> memref<16x16xf16>
    "gpu.memcpy"(%11, %arg2) : (memref<16x16xf16>, memref<16x16xf16>) -> ()
    %12 = "memref.extract_aligned_pointer_as_index"(%11) : (memref<16x16xf16>) -> index
    %13 = "arith.index_cast"(%12) : (index) -> i64
    %14 = "llvm.inttoptr"(%13) : (i64) -> !llvm.ptr
    %15 = "llvm.addrspacecast"(%14) : (!llvm.ptr) -> !llvm.ptr<1>
    %16 = "gpu.alloc"() <{operandSegmentSizes = array<i32: 0, 0, 0>}> : () -> memref<16x16xf16>
    %17 = "memref.extract_aligned_pointer_as_index"(%16) : (memref<16x16xf16>) -> index
    %18 = "arith.index_cast"(%17) : (index) -> i64
    %19 = "llvm.inttoptr"(%18) : (i64) -> !llvm.ptr
    %20 = "llvm.addrspacecast"(%19) : (!llvm.ptr) -> !llvm.ptr<1>
    "gpu.launch_func"(%9, %9, %9, %10, %9, %9, %15, %20) <{kernel = @kernel::@block_load_store, operandSegmentSizes = array<i32: 0, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 2, 0>}> : (index, index, index, index, index, index, !llvm.ptr<1>, !llvm.ptr<1>) -> ()
    "gpu.dealloc"(%11) : (memref<16x16xf16>) -> ()
    %21 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<16x16xf16>
    "gpu.memcpy"(%21, %16) : (memref<16x16xf16>, memref<16x16xf16>) -> ()
    "gpu.dealloc"(%16) : (memref<16x16xf16>) -> ()
    "func.return"(%21) : (memref<16x16xf16>) -> ()
  }) {llvm.emit_c_interface} : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "main"}> ({
    %0 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<16x16xf16>
    %1 = "arith.constant"() <{value = 0 : index}> : () -> index
    %2 = "arith.constant"() <{value = 1 : index}> : () -> index
    %3 = "arith.constant"() <{value = 16 : index}> : () -> index
    %4 = "arith.constant"() <{value = 16 : index}> : () -> index
    %5 = "arith.constant"() <{value = 1.110160e+01 : f16}> : () -> f16
    "scf.for"(%1, %3, %2) ({
    ^bb0(%arg0: index):
      "scf.for"(%1, %4, %2) ({
      ^bb0(%arg1: index):
        "memref.store"(%5, %0, %arg0, %arg1) : (f16, memref<16x16xf16>, index, index) -> ()
        "scf.yield"() : () -> ()
      }) : (index, index, index) -> ()
      "scf.yield"() : () -> ()
    }) : (index, index, index) -> ()
    %6 = "func.call"(%0) <{callee = @test}> : (memref<16x16xf16>) -> memref<16x16xf16>
    %7 = "memref.cast"(%6) : (memref<16x16xf16>) -> memref<*xf16>
    %8 = "memref.cast"(%0) : (memref<16x16xf16>) -> memref<*xf16>
    "func.call"(%8) <{callee = @printMemrefF16}> : (memref<*xf16>) -> ()
    "func.call"(%7) <{callee = @printMemrefF16}> : (memref<*xf16>) -> ()
    "memref.dealloc"(%0) : (memref<16x16xf16>) -> ()
    "memref.dealloc"(%6) : (memref<16x16xf16>) -> ()
    "func.return"() : () -> ()
  }) {llvm.emit_c_interface} : () -> ()
  "func.func"() <{function_type = (memref<*xf16>) -> (), sym_name = "printMemrefF16", sym_visibility = "private"}> ({
  }) {llvm.emit_c_interface} : () -> ()
}) {gpu.container_module} : () -> ()

