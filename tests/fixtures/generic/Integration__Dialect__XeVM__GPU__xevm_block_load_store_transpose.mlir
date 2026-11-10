"builtin.module"() <{sym_name = "gemm"}> ({
  "gpu.module"() <{sym_name = "kernel"}> ({
    "gpu.func"() <{function_type = (!llvm.ptr<1>, !llvm.ptr<1>) -> (), kernel}> ({
    ^bb0(%arg3: !llvm.ptr<1>, %arg4: !llvm.ptr<1>):
      %31 = "arith.constant"() <{value = 32 : i32}> : () -> i32
      %32 = "arith.constant"() <{value = 16 : i32}> : () -> i32
      %33 = "arith.constant"() <{value = 32 : i32}> : () -> i32
      %34 = "arith.constant"() <{value = 0 : i32}> : () -> i32
      %35 = "arith.constant"() <{value = 0 : i32}> : () -> i32
      %36 = "xevm.blockload2d"(%arg3, %31, %32, %33, %34, %35) <{elem_size_in_bits = 32 : i32, pack_register = false, tile_height = 16 : i32, tile_width = 8 : i32, transpose = true, v_blocks = 1 : i32}> : (!llvm.ptr<1>, i32, i32, i32, i32, i32) -> vector<8xi32>
      %37 = "vector.bitcast"(%36) : (vector<8xi32>) -> vector<8xf32>
      %38 = "arith.constant"() <{value = 0 : i32}> : () -> i32
      %39 = "gpu.thread_id"() <{dimension = #gpu<dim x>}> : () -> index
      %40 = "arith.index_cast"(%39) : (index) -> i64
      %41 = "llvm.trunc"(%40) <{overflowFlags = 0 : i32}> : (i64) -> i32
      %42 = "arith.sitofp"(%41) : (i32) -> f32
      %43 = "vector.insert"(%42, %37) <{static_position = array<i64: 7>}> : (f32, vector<8xf32>) -> vector<8xf32>
      %44 = "vector.bitcast"(%43) : (vector<8xf32>) -> vector<8xi32>
      %45 = "arith.constant"() <{value = 8 : i32}> : () -> i32
      %46 = "arith.constant"() <{value = 64 : i32}> : () -> i32
      %47 = "arith.constant"() <{value = 64 : i32}> : () -> i32
      "xevm.blockstore2d"(%arg4, %46, %45, %47, %34, %35, %36) <{elem_size_in_bits = 32 : i32, tile_height = 8 : i32, tile_width = 16 : i32}> : (!llvm.ptr<1>, i32, i32, i32, i32, i32, vector<8xi32>) -> ()
      "gpu.return"() : () -> ()
    }) {sym_name = "block_load_store"} : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<16x8xf32>) -> memref<8x16xf32>, sym_name = "test"}> ({
  ^bb0(%arg2: memref<16x8xf32>):
    %18 = "arith.constant"() <{value = 1 : index}> : () -> index
    %19 = "arith.constant"() <{value = 16 : index}> : () -> index
    %20 = "gpu.alloc"() <{operandSegmentSizes = array<i32: 0, 0, 0>}> : () -> memref<16x8xf32>
    "gpu.memcpy"(%20, %arg2) : (memref<16x8xf32>, memref<16x8xf32>) -> ()
    %21 = "memref.extract_aligned_pointer_as_index"(%20) : (memref<16x8xf32>) -> index
    %22 = "arith.index_cast"(%21) : (index) -> i64
    %23 = "llvm.inttoptr"(%22) : (i64) -> !llvm.ptr
    %24 = "llvm.addrspacecast"(%23) : (!llvm.ptr) -> !llvm.ptr<1>
    %25 = "gpu.alloc"() <{operandSegmentSizes = array<i32: 0, 0, 0>}> : () -> memref<8x16xf32>
    %26 = "memref.extract_aligned_pointer_as_index"(%25) : (memref<8x16xf32>) -> index
    %27 = "arith.index_cast"(%26) : (index) -> i64
    %28 = "llvm.inttoptr"(%27) : (i64) -> !llvm.ptr
    %29 = "llvm.addrspacecast"(%28) : (!llvm.ptr) -> !llvm.ptr<1>
    "gpu.launch_func"(%18, %18, %18, %19, %18, %18, %24, %29) <{kernel = @kernel::@block_load_store, operandSegmentSizes = array<i32: 0, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 2, 0>}> : (index, index, index, index, index, index, !llvm.ptr<1>, !llvm.ptr<1>) -> ()
    "gpu.dealloc"(%20) : (memref<16x8xf32>) -> ()
    %30 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<8x16xf32>
    "gpu.memcpy"(%30, %25) : (memref<8x16xf32>, memref<8x16xf32>) -> ()
    "gpu.dealloc"(%25) : (memref<8x16xf32>) -> ()
    "func.return"(%30) : (memref<8x16xf32>) -> ()
  }) {llvm.emit_c_interface} : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "main"}> ({
    %0 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<16x8xf32>
    %1 = "arith.constant"() <{value = 0 : index}> : () -> index
    %2 = "arith.constant"() <{value = 1 : index}> : () -> index
    %3 = "arith.constant"() <{value = 8 : index}> : () -> index
    %4 = "arith.constant"() <{value = 16 : index}> : () -> index
    %5 = "arith.constant"() <{value = 1.110940e+01 : f16}> : () -> f16
    "scf.for"(%1, %4, %2) ({
    ^bb0(%arg0: index):
      "scf.for"(%1, %3, %2) ({
      ^bb0(%arg1: index):
        %9 = "arith.constant"() <{value = 1.000000e+01 : f32}> : () -> f32
        %10 = "arith.index_cast"(%arg1) : (index) -> i64
        %11 = "llvm.trunc"(%10) <{overflowFlags = 0 : i32}> : (i64) -> i32
        %12 = "arith.sitofp"(%11) : (i32) -> f32
        %13 = "arith.divf"(%12, %9) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
        %14 = "arith.index_cast"(%arg0) : (index) -> i64
        %15 = "llvm.trunc"(%14) <{overflowFlags = 0 : i32}> : (i64) -> i32
        %16 = "arith.sitofp"(%15) : (i32) -> f32
        %17 = "arith.addf"(%16, %13) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
        "memref.store"(%17, %0, %arg0, %arg1) : (f32, memref<16x8xf32>, index, index) -> ()
        "scf.yield"() : () -> ()
      }) : (index, index, index) -> ()
      "scf.yield"() : () -> ()
    }) : (index, index, index) -> ()
    %6 = "func.call"(%0) <{callee = @test}> : (memref<16x8xf32>) -> memref<8x16xf32>
    %7 = "memref.cast"(%0) : (memref<16x8xf32>) -> memref<*xf32>
    %8 = "memref.cast"(%6) : (memref<8x16xf32>) -> memref<*xf32>
    "func.call"(%7) <{callee = @printMemrefF32}> : (memref<*xf32>) -> ()
    "func.call"(%8) <{callee = @printMemrefF32}> : (memref<*xf32>) -> ()
    "memref.dealloc"(%0) : (memref<16x8xf32>) -> ()
    "memref.dealloc"(%6) : (memref<8x16xf32>) -> ()
    "func.return"() : () -> ()
  }) {llvm.emit_c_interface} : () -> ()
  "func.func"() <{function_type = (memref<*xf32>) -> (), sym_name = "printMemrefF32", sym_visibility = "private"}> ({
  }) {llvm.emit_c_interface} : () -> ()
}) {gpu.container_module} : () -> ()

