"builtin.module"() <{sym_name = "gemm"}> ({
  "gpu.module"() <{sym_name = "kernel"}> ({
    "gpu.func"() <{function_type = (!llvm.ptr<1>) -> ()}> ({
    ^bb0(%arg3: !llvm.ptr<1>):
      %17 = "arith.constant"() <{value = 4.200000e+01 : f32}> : () -> f32
      %18 = "gpu.lane_id"() : () -> index
      %19 = "arith.index_cast"(%18) : (index) -> i64
      %20 = "llvm.getelementptr"(%arg3, %19) <{elem_type = i32, noWrapFlags = 0 : i32, rawConstantIndices = array<i32: -2147483648>}> : (!llvm.ptr<1>, i64) -> !llvm.ptr<1>
      "llvm.store"(%17, %20) <{ordering = 0 : i64}> : (f32, !llvm.ptr<1>) -> ()
      "gpu.return"() : () -> ()
    }) {gpu.kernel, sym_name = "store_constant", workgroup_attributions = 0 : i64} : () -> ()
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
    "gpu.launch_func"(%9, %9, %9, %10, %9, %9, %15) <{kernel = @kernel::@store_constant, operandSegmentSizes = array<i32: 0, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 1, 0>}> : (index, index, index, index, index, index, !llvm.ptr<1>) -> ()
    %16 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<8x16xf32>
    "gpu.memcpy"(%16, %11) : (memref<8x16xf32>, memref<8x16xf32>) -> ()
    "gpu.dealloc"(%11) : (memref<8x16xf32>) -> ()
    "func.return"(%16) : (memref<8x16xf32>) -> ()
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

