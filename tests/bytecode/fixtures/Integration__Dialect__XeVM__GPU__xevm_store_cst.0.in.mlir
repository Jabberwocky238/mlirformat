"builtin.module"() <{sym_name = "gemm"}> ({
  "gpu.module"() <{sym_name = "kernel"}> ({
    "gpu.func"() <{function_type = (!llvm.ptr<1>) -> (), kernel}> ({
    ^bb0(%arg3: !llvm.ptr<1> loc("<stdin>":4:10)):
      %17 = "arith.constant"() <{value = 4.200000e+01 : f32}> : () -> f32 loc("<stdin>":5:13)
      %18 = "gpu.lane_id"() : () -> index loc("<stdin>":6:13)
      %19 = "arith.index_cast"(%18) : (index) -> i64 loc("<stdin>":7:13)
      %20 = "llvm.getelementptr"(%arg3, %19) <{elem_type = i32, noWrapFlags = 0 : i32, rawConstantIndices = array<i32: -2147483648>}> : (!llvm.ptr<1>, i64) -> !llvm.ptr<1> loc("<stdin>":8:13)
      "llvm.store"(%17, %20) <{ordering = 0 : i64}> : (f32, !llvm.ptr<1>) -> () loc("<stdin>":9:7)
      "gpu.return"() : () -> () loc("<stdin>":10:7)
    }) {sym_name = "store_constant"} : () -> () loc("<stdin>":3:5)
  }) : () -> () loc("<stdin>":2:3)
  "func.func"() <{function_type = (memref<8x16xf32>) -> memref<8x16xf32>, sym_name = "test"}> ({
  ^bb0(%arg2: memref<8x16xf32> loc("<stdin>":14:8)):
    %9 = "arith.constant"() <{value = 1 : index}> : () -> index loc("<stdin>":15:10)
    %10 = "arith.constant"() <{value = 16 : index}> : () -> index loc("<stdin>":16:11)
    %11 = "gpu.alloc"() <{operandSegmentSizes = array<i32: 0, 0, 0>}> : () -> memref<8x16xf32> loc("<stdin>":17:11)
    "gpu.memcpy"(%11, %arg2) : (memref<8x16xf32>, memref<8x16xf32>) -> () loc("<stdin>":18:5)
    %12 = "memref.extract_aligned_pointer_as_index"(%11) : (memref<8x16xf32>) -> index loc("<stdin>":19:11)
    %13 = "arith.index_cast"(%12) : (index) -> i64 loc("<stdin>":20:11)
    %14 = "llvm.inttoptr"(%13) : (i64) -> !llvm.ptr loc("<stdin>":21:11)
    %15 = "llvm.addrspacecast"(%14) : (!llvm.ptr) -> !llvm.ptr<1> loc("<stdin>":22:11)
    "gpu.launch_func"(%9, %9, %9, %10, %9, %9, %15) <{kernel = @kernel::@store_constant, operandSegmentSizes = array<i32: 0, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 1, 0>}> : (index, index, index, index, index, index, !llvm.ptr<1>) -> () loc("<stdin>":23:5)
    %16 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<8x16xf32> loc("<stdin>":24:11)
    "gpu.memcpy"(%16, %11) : (memref<8x16xf32>, memref<8x16xf32>) -> () loc("<stdin>":25:5)
    "gpu.dealloc"(%11) : (memref<8x16xf32>) -> () loc("<stdin>":26:5)
    "func.return"(%16) : (memref<8x16xf32>) -> () loc("<stdin>":27:5)
  }) {llvm.emit_c_interface} : () -> () loc("<stdin>":13:3)
  "func.func"() <{function_type = () -> (), sym_name = "main"}> ({
    %0 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<8x16xf32> loc("<stdin>":30:10)
    %1 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":31:10)
    %2 = "arith.constant"() <{value = 1 : index}> : () -> index loc("<stdin>":32:10)
    %3 = "arith.constant"() <{value = 8 : index}> : () -> index loc("<stdin>":33:10)
    %4 = "arith.constant"() <{value = 16 : index}> : () -> index loc("<stdin>":34:10)
    %5 = "arith.constant"() <{value = 1.111000e+01 : f32}> : () -> f32 loc("<stdin>":35:10)
    "scf.for"(%1, %3, %2) ({
    ^bb0(%arg0: index loc("<stdin>":37:10)):
      "scf.for"(%1, %4, %2) ({
      ^bb0(%arg1: index loc("<stdin>":39:12)):
        "memref.store"(%5, %0, %arg0, %arg1) : (f32, memref<8x16xf32>, index, index) -> () loc("<stdin>":40:9)
        "scf.yield"() : () -> () loc("<stdin>":41:9)
      }) : (index, index, index) -> () loc("<stdin>":38:7)
      "scf.yield"() : () -> () loc("<stdin>":43:7)
    }) : (index, index, index) -> () loc("<stdin>":36:5)
    %6 = "func.call"(%0) <{callee = @test}> : (memref<8x16xf32>) -> memref<8x16xf32> loc("<stdin>":45:10)
    %7 = "memref.cast"(%6) : (memref<8x16xf32>) -> memref<*xf32> loc("<stdin>":46:10)
    %8 = "memref.cast"(%0) : (memref<8x16xf32>) -> memref<*xf32> loc("<stdin>":47:10)
    "func.call"(%8) <{callee = @printMemrefF32}> : (memref<*xf32>) -> () loc("<stdin>":48:5)
    "func.call"(%7) <{callee = @printMemrefF32}> : (memref<*xf32>) -> () loc("<stdin>":49:5)
    "memref.dealloc"(%0) : (memref<8x16xf32>) -> () loc("<stdin>":50:5)
    "memref.dealloc"(%6) : (memref<8x16xf32>) -> () loc("<stdin>":51:5)
    "func.return"() : () -> () loc("<stdin>":52:5)
  }) {llvm.emit_c_interface} : () -> () loc("<stdin>":29:3)
  "func.func"() <{function_type = (memref<*xf32>) -> (), sym_name = "printMemrefF32", sym_visibility = "private"}> ({
  }) : () -> () loc("<stdin>":54:3)
}) {gpu.container_module} : () -> () loc("<stdin>":1:1)
