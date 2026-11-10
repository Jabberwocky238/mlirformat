"builtin.module"() <{sym_name = "roundtrip"}> ({
  "gpu.module"() <{sym_name = "kernel"}> ({
    "gpu.func"() <{function_type = (!llvm.ptr<1>) -> (), kernel}> ({
    ^bb0(%arg5: !llvm.ptr<1>):
      %21 = "gpu.lane_id"() : () -> index
      %22 = "arith.index_cast"(%21) : (index) -> i64
      %23 = "arith.constant"() <{value = 16 : i64}> : () -> i64
      %24 = "arith.muli"(%22, %23) <{overflowFlags = #arith.overflow<none>}> : (i64, i64) -> i64
      %25 = "llvm.getelementptr"(%arg5, %24) <{elem_type = f16, noWrapFlags = 0 : i32, rawConstantIndices = array<i32: -2147483648>}> : (!llvm.ptr<1>, i64) -> !llvm.ptr<1>
      %26 = "llvm.load"(%25) <{ordering = 0 : i64}> : (!llvm.ptr<1>) -> vector<16xf16>
      %27 = "xevm.truncf"(%26) <{dst_etype = #xevm<dst_etype dst_etype = f8>, src_etype = #xevm<src_etype src_etype = f16>}> : (vector<16xf16>) -> vector<16xi8>
      %28 = "xevm.extf"(%27) <{dst_etype = #xevm<ext_dst_etype dst_etype = f16>, src_etype = #xevm<ext_src_etype src_etype = f8>}> : (vector<16xi8>) -> vector<16xf16>
      "llvm.store"(%28, %25) <{ordering = 0 : i64}> : (vector<16xf16>, !llvm.ptr<1>) -> ()
      "gpu.return"() : () -> ()
    }) {sym_name = "truncf_extf_roundtrip"} : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<16x16xf16>) -> memref<16x16xf16>, sym_name = "test"}> ({
  ^bb0(%arg4: memref<16x16xf16>):
    %13 = "arith.constant"() <{value = 1 : index}> : () -> index
    %14 = "arith.constant"() <{value = 16 : index}> : () -> index
    %15 = "gpu.alloc"() <{operandSegmentSizes = array<i32: 0, 0, 0>}> : () -> memref<16x16xf16>
    "gpu.memcpy"(%15, %arg4) : (memref<16x16xf16>, memref<16x16xf16>) -> ()
    %16 = "memref.extract_aligned_pointer_as_index"(%15) : (memref<16x16xf16>) -> index
    %17 = "arith.index_cast"(%16) : (index) -> i64
    %18 = "llvm.inttoptr"(%17) : (i64) -> !llvm.ptr
    %19 = "llvm.addrspacecast"(%18) : (!llvm.ptr) -> !llvm.ptr<1>
    "gpu.launch_func"(%13, %13, %13, %14, %13, %13, %19) <{kernel = @kernel::@truncf_extf_roundtrip, operandSegmentSizes = array<i32: 0, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 1, 0>}> : (index, index, index, index, index, index, !llvm.ptr<1>) -> ()
    %20 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<16x16xf16>
    "gpu.memcpy"(%20, %15) : (memref<16x16xf16>, memref<16x16xf16>) -> ()
    "gpu.dealloc"(%15) : (memref<16x16xf16>) -> ()
    "func.return"(%20) : (memref<16x16xf16>) -> ()
  }) {llvm.emit_c_interface} : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "main"}> ({
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = 1 : index}> : () -> index
    %2 = "arith.constant"() <{value = 16 : index}> : () -> index
    %3 = "arith.constant"() <{value = 1 : i32}> : () -> i32
    %4 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<16x16xf16>
    "scf.for"(%0, %2, %1) ({
    ^bb0(%arg2: index):
      %10 = "arith.index_cast"(%arg2) : (index) -> i32
      %11 = "arith.addi"(%10, %3) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
      %12 = "arith.sitofp"(%11) : (i32) -> f16
      "scf.for"(%0, %2, %1) ({
      ^bb0(%arg3: index):
        "memref.store"(%12, %4, %arg2, %arg3) : (f16, memref<16x16xf16>, index, index) -> ()
        "scf.yield"() : () -> ()
      }) : (index, index, index) -> ()
      "scf.yield"() : () -> ()
    }) : (index, index, index) -> ()
    %5 = "func.call"(%4) <{callee = @test}> : (memref<16x16xf16>) -> memref<16x16xf16>
    %6 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<16x16xf32>
    "scf.for"(%0, %2, %1) ({
    ^bb0(%arg0: index):
      "scf.for"(%0, %2, %1) ({
      ^bb0(%arg1: index):
        %8 = "memref.load"(%5, %arg0, %arg1) : (memref<16x16xf16>, index, index) -> f16
        %9 = "arith.extf"(%8) : (f16) -> f32
        "memref.store"(%9, %6, %arg0, %arg1) : (f32, memref<16x16xf32>, index, index) -> ()
        "scf.yield"() : () -> ()
      }) : (index, index, index) -> ()
      "scf.yield"() : () -> ()
    }) : (index, index, index) -> ()
    %7 = "memref.cast"(%6) : (memref<16x16xf32>) -> memref<*xf32>
    "func.call"(%7) <{callee = @printMemrefF32}> : (memref<*xf32>) -> ()
    "memref.dealloc"(%4) : (memref<16x16xf16>) -> ()
    "memref.dealloc"(%5) : (memref<16x16xf16>) -> ()
    "memref.dealloc"(%6) : (memref<16x16xf32>) -> ()
    "func.return"() : () -> ()
  }) {llvm.emit_c_interface} : () -> ()
  "func.func"() <{function_type = (memref<*xf32>) -> (), sym_name = "printMemrefF32", sym_visibility = "private"}> ({
  }) {llvm.emit_c_interface} : () -> ()
}) {gpu.container_module} : () -> ()

