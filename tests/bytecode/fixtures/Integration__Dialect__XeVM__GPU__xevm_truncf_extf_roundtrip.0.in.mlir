"builtin.module"() <{sym_name = "roundtrip"}> ({
  "gpu.module"() <{sym_name = "kernel"}> ({
    "gpu.func"() <{function_type = (!llvm.ptr<1>) -> (), kernel}> ({
    ^bb0(%arg5: !llvm.ptr<1> loc("<stdin>":4:10)):
      %21 = "gpu.lane_id"() : () -> index loc("<stdin>":5:13)
      %22 = "arith.index_cast"(%21) : (index) -> i64 loc("<stdin>":6:13)
      %23 = "arith.constant"() <{value = 16 : i64}> : () -> i64 loc("<stdin>":7:13)
      %24 = "arith.muli"(%22, %23) <{overflowFlags = #arith.overflow<none>}> : (i64, i64) -> i64 loc("<stdin>":8:13)
      %25 = "llvm.getelementptr"(%arg5, %24) <{elem_type = f16, noWrapFlags = 0 : i32, rawConstantIndices = array<i32: -2147483648>}> : (!llvm.ptr<1>, i64) -> !llvm.ptr<1> loc("<stdin>":9:13)
      %26 = "llvm.load"(%25) <{ordering = 0 : i64}> : (!llvm.ptr<1>) -> vector<16xf16> loc("<stdin>":10:13)
      %27 = "xevm.truncf"(%26) <{dst_etype = #xevm<dst_etype dst_etype = f8>, src_etype = #xevm<src_etype src_etype = f16>}> : (vector<16xf16>) -> vector<16xi8> loc("<stdin>":11:13)
      %28 = "xevm.extf"(%27) <{dst_etype = #xevm<ext_dst_etype dst_etype = f16>, src_etype = #xevm<ext_src_etype src_etype = f8>}> : (vector<16xi8>) -> vector<16xf16> loc("<stdin>":12:13)
      "llvm.store"(%28, %25) <{ordering = 0 : i64}> : (vector<16xf16>, !llvm.ptr<1>) -> () loc("<stdin>":13:7)
      "gpu.return"() : () -> () loc("<stdin>":14:7)
    }) {sym_name = "truncf_extf_roundtrip"} : () -> () loc("<stdin>":3:5)
  }) : () -> () loc("<stdin>":2:3)
  "func.func"() <{function_type = (memref<16x16xf16>) -> memref<16x16xf16>, sym_name = "test"}> ({
  ^bb0(%arg4: memref<16x16xf16> loc("<stdin>":18:8)):
    %13 = "arith.constant"() <{value = 1 : index}> : () -> index loc("<stdin>":19:11)
    %14 = "arith.constant"() <{value = 16 : index}> : () -> index loc("<stdin>":20:11)
    %15 = "gpu.alloc"() <{operandSegmentSizes = array<i32: 0, 0, 0>}> : () -> memref<16x16xf16> loc("<stdin>":21:11)
    "gpu.memcpy"(%15, %arg4) : (memref<16x16xf16>, memref<16x16xf16>) -> () loc("<stdin>":22:5)
    %16 = "memref.extract_aligned_pointer_as_index"(%15) : (memref<16x16xf16>) -> index loc("<stdin>":23:11)
    %17 = "arith.index_cast"(%16) : (index) -> i64 loc("<stdin>":24:11)
    %18 = "llvm.inttoptr"(%17) : (i64) -> !llvm.ptr loc("<stdin>":25:11)
    %19 = "llvm.addrspacecast"(%18) : (!llvm.ptr) -> !llvm.ptr<1> loc("<stdin>":26:11)
    "gpu.launch_func"(%13, %13, %13, %14, %13, %13, %19) <{kernel = @kernel::@truncf_extf_roundtrip, operandSegmentSizes = array<i32: 0, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 1, 0>}> : (index, index, index, index, index, index, !llvm.ptr<1>) -> () loc("<stdin>":27:5)
    %20 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<16x16xf16> loc("<stdin>":28:11)
    "gpu.memcpy"(%20, %15) : (memref<16x16xf16>, memref<16x16xf16>) -> () loc("<stdin>":29:5)
    "gpu.dealloc"(%15) : (memref<16x16xf16>) -> () loc("<stdin>":30:5)
    "func.return"(%20) : (memref<16x16xf16>) -> () loc("<stdin>":31:5)
  }) {llvm.emit_c_interface} : () -> () loc("<stdin>":17:3)
  "func.func"() <{function_type = () -> (), sym_name = "main"}> ({
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":34:10)
    %1 = "arith.constant"() <{value = 1 : index}> : () -> index loc("<stdin>":35:10)
    %2 = "arith.constant"() <{value = 16 : index}> : () -> index loc("<stdin>":36:10)
    %3 = "arith.constant"() <{value = 1 : i32}> : () -> i32 loc("<stdin>":37:10)
    %4 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<16x16xf16> loc("<stdin>":38:10)
    "scf.for"(%0, %2, %1) ({
    ^bb0(%arg2: index loc("<stdin>":40:10)):
      %10 = "arith.index_cast"(%arg2) : (index) -> i32 loc("<stdin>":41:13)
      %11 = "arith.addi"(%10, %3) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32 loc("<stdin>":42:13)
      %12 = "arith.sitofp"(%11) : (i32) -> f16 loc("<stdin>":43:13)
      "scf.for"(%0, %2, %1) ({
      ^bb0(%arg3: index loc("<stdin>":45:12)):
        "memref.store"(%12, %4, %arg2, %arg3) : (f16, memref<16x16xf16>, index, index) -> () loc("<stdin>":46:9)
        "scf.yield"() : () -> () loc("<stdin>":47:9)
      }) : (index, index, index) -> () loc("<stdin>":44:7)
      "scf.yield"() : () -> () loc("<stdin>":49:7)
    }) : (index, index, index) -> () loc("<stdin>":39:5)
    %5 = "func.call"(%4) <{callee = @test}> : (memref<16x16xf16>) -> memref<16x16xf16> loc("<stdin>":51:10)
    %6 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<16x16xf32> loc("<stdin>":52:10)
    "scf.for"(%0, %2, %1) ({
    ^bb0(%arg0: index loc("<stdin>":54:10)):
      "scf.for"(%0, %2, %1) ({
      ^bb0(%arg1: index loc("<stdin>":56:12)):
        %8 = "memref.load"(%5, %arg0, %arg1) : (memref<16x16xf16>, index, index) -> f16 loc("<stdin>":57:14)
        %9 = "arith.extf"(%8) : (f16) -> f32 loc("<stdin>":58:14)
        "memref.store"(%9, %6, %arg0, %arg1) : (f32, memref<16x16xf32>, index, index) -> () loc("<stdin>":59:9)
        "scf.yield"() : () -> () loc("<stdin>":60:9)
      }) : (index, index, index) -> () loc("<stdin>":55:7)
      "scf.yield"() : () -> () loc("<stdin>":62:7)
    }) : (index, index, index) -> () loc("<stdin>":53:5)
    %7 = "memref.cast"(%6) : (memref<16x16xf32>) -> memref<*xf32> loc("<stdin>":64:10)
    "func.call"(%7) <{callee = @printMemrefF32}> : (memref<*xf32>) -> () loc("<stdin>":65:5)
    "memref.dealloc"(%4) : (memref<16x16xf16>) -> () loc("<stdin>":66:5)
    "memref.dealloc"(%5) : (memref<16x16xf16>) -> () loc("<stdin>":67:5)
    "memref.dealloc"(%6) : (memref<16x16xf32>) -> () loc("<stdin>":68:5)
    "func.return"() : () -> () loc("<stdin>":69:5)
  }) {llvm.emit_c_interface} : () -> () loc("<stdin>":33:3)
  "func.func"() <{function_type = (memref<*xf32>) -> (), sym_name = "printMemrefF32", sym_visibility = "private"}> ({
  }) {llvm.emit_c_interface} : () -> () loc("<stdin>":71:3)
}) {gpu.container_module} : () -> () loc("<stdin>":1:1)
