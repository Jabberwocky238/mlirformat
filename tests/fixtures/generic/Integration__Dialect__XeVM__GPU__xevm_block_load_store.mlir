"builtin.module"() <{sym_name = "gemm"}> ({
  "gpu.module"() <{sym_name = "kernel"}> ({
    "gpu.func"() <{function_type = (!llvm.ptr<1>, !llvm.ptr<1>) -> ()}> ({
    ^bb0(%arg3: !llvm.ptr<1>, %arg4: !llvm.ptr<1>):
      %22 = "arith.constant"() <{value = 64 : i32}> : () -> i32
      %23 = "arith.constant"() <{value = 8 : i32}> : () -> i32
      %24 = "arith.constant"() <{value = 64 : i32}> : () -> i32
      %25 = "arith.constant"() <{value = 0 : i32}> : () -> i32
      %26 = "arith.constant"() <{value = 0 : i32}> : () -> i32
      %27 = "xevm.blockload2d"(%arg3, %22, %23, %24, %25, %26) <{elem_size_in_bits = 32 : i32, pack_register = false, tile_height = 8 : i32, tile_width = 16 : i32, transpose = false, v_blocks = 1 : i32}> : (!llvm.ptr<1>, i32, i32, i32, i32, i32) -> vector<8xi32>
      %28 = "vector.bitcast"(%27) : (vector<8xi32>) -> vector<8xf32>
      %29 = "arith.constant"() <{value = 0 : index}> : () -> index
      %30 = "gpu.thread_id"() <{dimension = #gpu<dim x>}> : () -> index
      %31 = "arith.index_cast"(%30) : (index) -> i64
      %32 = "llvm.trunc"(%31) <{overflowFlags = 0 : i32}> : (i64) -> i32
      %33 = "arith.sitofp"(%32) : (i32) -> f32
      %34 = "vector.insert"(%33, %28, %29) <{static_position = array<i64: -9223372036854775808>}> : (f32, vector<8xf32>, index) -> vector<8xf32>
      %35 = "vector.bitcast"(%34) : (vector<8xf32>) -> vector<8xi32>
      "xevm.blockstore2d"(%arg4, %22, %23, %24, %25, %26, %35) <{elem_size_in_bits = 32 : i32, tile_height = 8 : i32, tile_width = 16 : i32}> : (!llvm.ptr<1>, i32, i32, i32, i32, i32, vector<8xi32>) -> ()
      "gpu.return"() : () -> ()
    }) {gpu.kernel, sym_name = "block_load_store", workgroup_attributions = 0 : i64} : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<8x16xf32>) -> memref<8x16xf32>, sym_name = "test"}> ({
  ^bb0(%arg2: memref<8x16xf32>):
    %9 = "arith.constant"() <{value = 1 : index}> : () -> index
    %10 = "arith.constant"() <{value = 16 : index}> : () -> index
    %11 = "gpu.alloc"() <{operandSegmentSizes = array<i32: 0, 0, 0>}> : () -> memref<8x16xf32>
    "gpu.memcpy"(%11, %arg2) : (memref<8x16xf32>, memref<8x16xf32>) -> ()
    %12 = "memref.extract_aligned_pointer_as_index"(%11) : (memref<8x16xf32>) -> index
    %13 = "arith.index_cast"(%12) : (index) -> i64
    %14 = "llvm.inttoptr"(%13) : (i64) -> !llvm.ptr
    %15 = "llvm.addrspacecast"(%14) : (!llvm.ptr) -> !llvm.ptr<1>
    %16 = "gpu.alloc"() <{operandSegmentSizes = array<i32: 0, 0, 0>}> : () -> memref<8x16xf32>
    %17 = "memref.extract_aligned_pointer_as_index"(%16) : (memref<8x16xf32>) -> index
    %18 = "arith.index_cast"(%17) : (index) -> i64
    %19 = "llvm.inttoptr"(%18) : (i64) -> !llvm.ptr
    %20 = "llvm.addrspacecast"(%19) : (!llvm.ptr) -> !llvm.ptr<1>
    "gpu.launch_func"(%9, %9, %9, %10, %9, %9, %15, %20) <{kernel = @kernel::@block_load_store, operandSegmentSizes = array<i32: 0, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 2, 0>}> : (index, index, index, index, index, index, !llvm.ptr<1>, !llvm.ptr<1>) -> ()
    "gpu.dealloc"(%11) : (memref<8x16xf32>) -> ()
    %21 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<8x16xf32>
    "gpu.memcpy"(%21, %16) : (memref<8x16xf32>, memref<8x16xf32>) -> ()
    "gpu.dealloc"(%16) : (memref<8x16xf32>) -> ()
    "func.return"(%21) : (memref<8x16xf32>) -> ()
  }) {llvm.emit_c_interface} : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "main"}> ({
    %0 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<8x16xf32>
    %1 = "arith.constant"() <{value = 0 : index}> : () -> index
    %2 = "arith.constant"() <{value = 1 : index}> : () -> index
    %3 = "arith.constant"() <{value = 8 : index}> : () -> index
    %4 = "arith.constant"() <{value = 16 : index}> : () -> index
    %5 = "arith.constant"() <{value = 1.111000e+01 : f32}> : () -> f32
    "scf.for"(%1, %3, %2) ({
    ^bb0(%arg0: index):
      "scf.for"(%1, %4, %2) ({
      ^bb0(%arg1: index):
        "memref.store"(%5, %0, %arg0, %arg1) : (f32, memref<8x16xf32>, index, index) -> ()
        "scf.yield"() : () -> ()
      }) : (index, index, index) -> ()
      "scf.yield"() : () -> ()
    }) : (index, index, index) -> ()
    %6 = "func.call"(%0) <{callee = @test}> : (memref<8x16xf32>) -> memref<8x16xf32>
    %7 = "memref.cast"(%6) : (memref<8x16xf32>) -> memref<*xf32>
    %8 = "memref.cast"(%0) : (memref<8x16xf32>) -> memref<*xf32>
    "func.call"(%8) <{callee = @printMemrefF32}> : (memref<*xf32>) -> ()
    "func.call"(%7) <{callee = @printMemrefF32}> : (memref<*xf32>) -> ()
    "memref.dealloc"(%0) : (memref<8x16xf32>) -> ()
    "memref.dealloc"(%6) : (memref<8x16xf32>) -> ()
    "func.return"() : () -> ()
  }) {llvm.emit_c_interface} : () -> ()
  "func.func"() <{function_type = (memref<*xf32>) -> (), sym_name = "printMemrefF32", sym_visibility = "private"}> ({
  }) : () -> ()
}) {gpu.container_module} : () -> ()

