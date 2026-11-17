"builtin.module"() <{sym_name = "raw_convert"}> ({
  "gpu.module"() <{sym_name = "kernel"}> ({
    "gpu.func"() <{function_type = (!llvm.ptr<1>, !llvm.ptr<1>) -> (), kernel}> ({
    ^bb0(%arg7: !llvm.ptr<1> loc("<stdin>":4:10), %arg8: !llvm.ptr<1> loc("<stdin>":4:31)):
      %31 = "gpu.lane_id"() : () -> index loc("<stdin>":5:13)
      %32 = "arith.index_cast"(%31) : (index) -> i64 loc("<stdin>":6:13)
      %33 = "arith.constant"() <{value = 16 : i64}> : () -> i64 loc("<stdin>":7:13)
      %34 = "arith.muli"(%32, %33) <{overflowFlags = #arith.overflow<none>}> : (i64, i64) -> i64 loc("<stdin>":8:13)
      %35 = "llvm.getelementptr"(%arg7, %34) <{elem_type = f16, noWrapFlags = 0 : i32, rawConstantIndices = array<i32: -2147483648>}> : (!llvm.ptr<1>, i64) -> !llvm.ptr<1> loc("<stdin>":9:13)
      %36 = "llvm.getelementptr"(%arg8, %34) <{elem_type = i8, noWrapFlags = 0 : i32, rawConstantIndices = array<i32: -2147483648>}> : (!llvm.ptr<1>, i64) -> !llvm.ptr<1> loc("<stdin>":10:13)
      %37 = "llvm.load"(%35) <{ordering = 0 : i64}> : (!llvm.ptr<1>) -> vector<16xf16> loc("<stdin>":11:13)
      %38 = "xevm.truncf"(%37) <{dst_etype = #xevm<dst_etype dst_etype = f8>, src_etype = #xevm<src_etype src_etype = f16>}> : (vector<16xf16>) -> vector<16xi8> loc("<stdin>":12:13)
      "llvm.store"(%38, %36) <{ordering = 0 : i64}> : (vector<16xi8>, !llvm.ptr<1>) -> () loc("<stdin>":13:7)
      %39 = "xevm.extf"(%38) <{dst_etype = #xevm<ext_dst_etype dst_etype = f16>, src_etype = #xevm<ext_src_etype src_etype = f8>}> : (vector<16xi8>) -> vector<16xf16> loc("<stdin>":14:13)
      "llvm.store"(%39, %35) <{ordering = 0 : i64}> : (vector<16xf16>, !llvm.ptr<1>) -> () loc("<stdin>":15:7)
      "gpu.return"() : () -> () loc("<stdin>":16:7)
    }) {sym_name = "truncf_extf"} : () -> () loc("<stdin>":3:5)
  }) : () -> () loc("<stdin>":2:3)
  "func.func"() <{function_type = (memref<16x16xf16>) -> (memref<16x16xf16>, memref<16x16xi8>), sym_name = "test"}> ({
  ^bb0(%arg6: memref<16x16xf16> loc("<stdin>":20:8)):
    %17 = "arith.constant"() <{value = 1 : index}> : () -> index loc("<stdin>":21:11)
    %18 = "arith.constant"() <{value = 16 : index}> : () -> index loc("<stdin>":22:11)
    %19 = "gpu.alloc"() <{operandSegmentSizes = array<i32: 0, 0, 0>}> : () -> memref<16x16xf16> loc("<stdin>":23:11)
    "gpu.memcpy"(%19, %arg6) : (memref<16x16xf16>, memref<16x16xf16>) -> () loc("<stdin>":24:5)
    %20 = "gpu.alloc"() <{operandSegmentSizes = array<i32: 0, 0, 0>}> : () -> memref<16x16xi8> loc("<stdin>":25:11)
    %21 = "memref.extract_aligned_pointer_as_index"(%19) : (memref<16x16xf16>) -> index loc("<stdin>":26:11)
    %22 = "arith.index_cast"(%21) : (index) -> i64 loc("<stdin>":27:11)
    %23 = "llvm.inttoptr"(%22) : (i64) -> !llvm.ptr loc("<stdin>":28:11)
    %24 = "llvm.addrspacecast"(%23) : (!llvm.ptr) -> !llvm.ptr<1> loc("<stdin>":29:11)
    %25 = "memref.extract_aligned_pointer_as_index"(%20) : (memref<16x16xi8>) -> index loc("<stdin>":30:11)
    %26 = "arith.index_cast"(%25) : (index) -> i64 loc("<stdin>":31:11)
    %27 = "llvm.inttoptr"(%26) : (i64) -> !llvm.ptr loc("<stdin>":32:11)
    %28 = "llvm.addrspacecast"(%27) : (!llvm.ptr) -> !llvm.ptr<1> loc("<stdin>":33:11)
    "gpu.launch_func"(%17, %17, %17, %18, %17, %17, %24, %28) <{kernel = @kernel::@truncf_extf, operandSegmentSizes = array<i32: 0, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 2, 0>}> : (index, index, index, index, index, index, !llvm.ptr<1>, !llvm.ptr<1>) -> () loc("<stdin>":34:5)
    %29 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<16x16xf16> loc("<stdin>":35:11)
    "gpu.memcpy"(%29, %19) : (memref<16x16xf16>, memref<16x16xf16>) -> () loc("<stdin>":36:5)
    %30 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<16x16xi8> loc("<stdin>":37:11)
    "gpu.memcpy"(%30, %20) : (memref<16x16xi8>, memref<16x16xi8>) -> () loc("<stdin>":38:5)
    "gpu.dealloc"(%19) : (memref<16x16xf16>) -> () loc("<stdin>":39:5)
    "gpu.dealloc"(%20) : (memref<16x16xi8>) -> () loc("<stdin>":40:5)
    "func.return"(%29, %30) : (memref<16x16xf16>, memref<16x16xi8>) -> () loc("<stdin>":41:5)
  }) : () -> () loc("<stdin>":19:3)
  "func.func"() <{function_type = () -> (), sym_name = "main"}> ({
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":44:10)
    %1 = "arith.constant"() <{value = 1 : index}> : () -> index loc("<stdin>":45:10)
    %2 = "arith.constant"() <{value = 16 : index}> : () -> index loc("<stdin>":46:10)
    %3 = "arith.constant"() <{value = 1 : i32}> : () -> i32 loc("<stdin>":47:10)
    %4 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<16x16xf16> loc("<stdin>":48:10)
    "scf.for"(%0, %2, %1) ({
    ^bb0(%arg4: index loc("<stdin>":50:10)):
      %14 = "arith.index_cast"(%arg4) : (index) -> i32 loc("<stdin>":51:13)
      %15 = "arith.addi"(%14, %3) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32 loc("<stdin>":52:13)
      %16 = "arith.sitofp"(%15) : (i32) -> f16 loc("<stdin>":53:13)
      "scf.for"(%0, %2, %1) ({
      ^bb0(%arg5: index loc("<stdin>":55:12)):
        "memref.store"(%16, %4, %arg4, %arg5) : (f16, memref<16x16xf16>, index, index) -> () loc("<stdin>":56:9)
        "scf.yield"() : () -> () loc("<stdin>":57:9)
      }) : (index, index, index) -> () loc("<stdin>":54:7)
      "scf.yield"() : () -> () loc("<stdin>":59:7)
    }) : (index, index, index) -> () loc("<stdin>":49:5)
    %5:2 = "func.call"(%4) <{callee = @test}> : (memref<16x16xf16>) -> (memref<16x16xf16>, memref<16x16xi8>) loc("<stdin>":61:12)
    %6 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<16x16xi32> loc("<stdin>":62:10)
    "scf.for"(%0, %2, %1) ({
    ^bb0(%arg2: index loc("<stdin>":64:10)):
      "scf.for"(%0, %2, %1) ({
      ^bb0(%arg3: index loc("<stdin>":66:12)):
        %12 = "memref.load"(%5#1, %arg2, %arg3) : (memref<16x16xi8>, index, index) -> i8 loc("<stdin>":67:15)
        %13 = "arith.extsi"(%12) : (i8) -> i32 loc("<stdin>":68:15)
        "memref.store"(%13, %6, %arg2, %arg3) : (i32, memref<16x16xi32>, index, index) -> () loc("<stdin>":69:9)
        "scf.yield"() : () -> () loc("<stdin>":70:9)
      }) : (index, index, index) -> () loc("<stdin>":65:7)
      "scf.yield"() : () -> () loc("<stdin>":72:7)
    }) : (index, index, index) -> () loc("<stdin>":63:5)
    %7 = "memref.cast"(%6) : (memref<16x16xi32>) -> memref<*xi32> loc("<stdin>":74:10)
    "func.call"(%7) <{callee = @printMemrefI32}> : (memref<*xi32>) -> () loc("<stdin>":75:5)
    %8 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<16x16xf32> loc("<stdin>":76:10)
    "scf.for"(%0, %2, %1) ({
    ^bb0(%arg0: index loc("<stdin>":78:10)):
      "scf.for"(%0, %2, %1) ({
      ^bb0(%arg1: index loc("<stdin>":80:12)):
        %10 = "memref.load"(%5#0, %arg0, %arg1) : (memref<16x16xf16>, index, index) -> f16 loc("<stdin>":81:15)
        %11 = "arith.extf"(%10) : (f16) -> f32 loc("<stdin>":82:15)
        "memref.store"(%11, %8, %arg0, %arg1) : (f32, memref<16x16xf32>, index, index) -> () loc("<stdin>":83:9)
        "scf.yield"() : () -> () loc("<stdin>":84:9)
      }) : (index, index, index) -> () loc("<stdin>":79:7)
      "scf.yield"() : () -> () loc("<stdin>":86:7)
    }) : (index, index, index) -> () loc("<stdin>":77:5)
    %9 = "memref.cast"(%8) : (memref<16x16xf32>) -> memref<*xf32> loc("<stdin>":88:10)
    "func.call"(%9) <{callee = @printMemrefF32}> : (memref<*xf32>) -> () loc("<stdin>":89:5)
    "memref.dealloc"(%4) : (memref<16x16xf16>) -> () loc("<stdin>":90:5)
    "memref.dealloc"(%5#0) : (memref<16x16xf16>) -> () loc("<stdin>":91:5)
    "memref.dealloc"(%5#1) : (memref<16x16xi8>) -> () loc("<stdin>":92:5)
    "memref.dealloc"(%6) : (memref<16x16xi32>) -> () loc("<stdin>":93:5)
    "memref.dealloc"(%8) : (memref<16x16xf32>) -> () loc("<stdin>":94:5)
    "func.return"() : () -> () loc("<stdin>":95:5)
  }) {llvm.emit_c_interface} : () -> () loc("<stdin>":43:3)
  "func.func"() <{function_type = (memref<*xi32>) -> (), sym_name = "printMemrefI32", sym_visibility = "private"}> ({
  }) {llvm.emit_c_interface} : () -> () loc("<stdin>":97:3)
  "func.func"() <{function_type = (memref<*xf32>) -> (), sym_name = "printMemrefF32", sym_visibility = "private"}> ({
  }) {llvm.emit_c_interface} : () -> () loc("<stdin>":99:3)
}) {gpu.container_module} : () -> () loc("<stdin>":1:1)
