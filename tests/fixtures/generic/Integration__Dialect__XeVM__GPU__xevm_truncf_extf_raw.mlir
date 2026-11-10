"builtin.module"() <{sym_name = "raw_convert"}> ({
  "gpu.module"() <{sym_name = "kernel"}> ({
    "gpu.func"() <{function_type = (!llvm.ptr<1>, !llvm.ptr<1>) -> (), kernel}> ({
    ^bb0(%arg7: !llvm.ptr<1>, %arg8: !llvm.ptr<1>):
      %31 = "gpu.lane_id"() : () -> index
      %32 = "arith.index_cast"(%31) : (index) -> i64
      %33 = "arith.constant"() <{value = 16 : i64}> : () -> i64
      %34 = "arith.muli"(%32, %33) <{overflowFlags = #arith.overflow<none>}> : (i64, i64) -> i64
      %35 = "llvm.getelementptr"(%arg7, %34) <{elem_type = f16, noWrapFlags = 0 : i32, rawConstantIndices = array<i32: -2147483648>}> : (!llvm.ptr<1>, i64) -> !llvm.ptr<1>
      %36 = "llvm.getelementptr"(%arg8, %34) <{elem_type = i8, noWrapFlags = 0 : i32, rawConstantIndices = array<i32: -2147483648>}> : (!llvm.ptr<1>, i64) -> !llvm.ptr<1>
      %37 = "llvm.load"(%35) <{ordering = 0 : i64}> : (!llvm.ptr<1>) -> vector<16xf16>
      %38 = "xevm.truncf"(%37) <{dst_etype = #xevm<dst_etype dst_etype = f8>, src_etype = #xevm<src_etype src_etype = f16>}> : (vector<16xf16>) -> vector<16xi8>
      "llvm.store"(%38, %36) <{ordering = 0 : i64}> : (vector<16xi8>, !llvm.ptr<1>) -> ()
      %39 = "xevm.extf"(%38) <{dst_etype = #xevm<ext_dst_etype dst_etype = f16>, src_etype = #xevm<ext_src_etype src_etype = f8>}> : (vector<16xi8>) -> vector<16xf16>
      "llvm.store"(%39, %35) <{ordering = 0 : i64}> : (vector<16xf16>, !llvm.ptr<1>) -> ()
      "gpu.return"() : () -> ()
    }) {sym_name = "truncf_extf"} : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<16x16xf16>) -> (memref<16x16xf16>, memref<16x16xi8>), sym_name = "test"}> ({
  ^bb0(%arg6: memref<16x16xf16>):
    %17 = "arith.constant"() <{value = 1 : index}> : () -> index
    %18 = "arith.constant"() <{value = 16 : index}> : () -> index
    %19 = "gpu.alloc"() <{operandSegmentSizes = array<i32: 0, 0, 0>}> : () -> memref<16x16xf16>
    "gpu.memcpy"(%19, %arg6) : (memref<16x16xf16>, memref<16x16xf16>) -> ()
    %20 = "gpu.alloc"() <{operandSegmentSizes = array<i32: 0, 0, 0>}> : () -> memref<16x16xi8>
    %21 = "memref.extract_aligned_pointer_as_index"(%19) : (memref<16x16xf16>) -> index
    %22 = "arith.index_cast"(%21) : (index) -> i64
    %23 = "llvm.inttoptr"(%22) : (i64) -> !llvm.ptr
    %24 = "llvm.addrspacecast"(%23) : (!llvm.ptr) -> !llvm.ptr<1>
    %25 = "memref.extract_aligned_pointer_as_index"(%20) : (memref<16x16xi8>) -> index
    %26 = "arith.index_cast"(%25) : (index) -> i64
    %27 = "llvm.inttoptr"(%26) : (i64) -> !llvm.ptr
    %28 = "llvm.addrspacecast"(%27) : (!llvm.ptr) -> !llvm.ptr<1>
    "gpu.launch_func"(%17, %17, %17, %18, %17, %17, %24, %28) <{kernel = @kernel::@truncf_extf, operandSegmentSizes = array<i32: 0, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 2, 0>}> : (index, index, index, index, index, index, !llvm.ptr<1>, !llvm.ptr<1>) -> ()
    %29 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<16x16xf16>
    "gpu.memcpy"(%29, %19) : (memref<16x16xf16>, memref<16x16xf16>) -> ()
    %30 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<16x16xi8>
    "gpu.memcpy"(%30, %20) : (memref<16x16xi8>, memref<16x16xi8>) -> ()
    "gpu.dealloc"(%19) : (memref<16x16xf16>) -> ()
    "gpu.dealloc"(%20) : (memref<16x16xi8>) -> ()
    "func.return"(%29, %30) : (memref<16x16xf16>, memref<16x16xi8>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "main"}> ({
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = 1 : index}> : () -> index
    %2 = "arith.constant"() <{value = 16 : index}> : () -> index
    %3 = "arith.constant"() <{value = 1 : i32}> : () -> i32
    %4 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<16x16xf16>
    "scf.for"(%0, %2, %1) ({
    ^bb0(%arg4: index):
      %14 = "arith.index_cast"(%arg4) : (index) -> i32
      %15 = "arith.addi"(%14, %3) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
      %16 = "arith.sitofp"(%15) : (i32) -> f16
      "scf.for"(%0, %2, %1) ({
      ^bb0(%arg5: index):
        "memref.store"(%16, %4, %arg4, %arg5) : (f16, memref<16x16xf16>, index, index) -> ()
        "scf.yield"() : () -> ()
      }) : (index, index, index) -> ()
      "scf.yield"() : () -> ()
    }) : (index, index, index) -> ()
    %5:2 = "func.call"(%4) <{callee = @test}> : (memref<16x16xf16>) -> (memref<16x16xf16>, memref<16x16xi8>)
    %6 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<16x16xi32>
    "scf.for"(%0, %2, %1) ({
    ^bb0(%arg2: index):
      "scf.for"(%0, %2, %1) ({
      ^bb0(%arg3: index):
        %12 = "memref.load"(%5#1, %arg2, %arg3) : (memref<16x16xi8>, index, index) -> i8
        %13 = "arith.extsi"(%12) : (i8) -> i32
        "memref.store"(%13, %6, %arg2, %arg3) : (i32, memref<16x16xi32>, index, index) -> ()
        "scf.yield"() : () -> ()
      }) : (index, index, index) -> ()
      "scf.yield"() : () -> ()
    }) : (index, index, index) -> ()
    %7 = "memref.cast"(%6) : (memref<16x16xi32>) -> memref<*xi32>
    "func.call"(%7) <{callee = @printMemrefI32}> : (memref<*xi32>) -> ()
    %8 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<16x16xf32>
    "scf.for"(%0, %2, %1) ({
    ^bb0(%arg0: index):
      "scf.for"(%0, %2, %1) ({
      ^bb0(%arg1: index):
        %10 = "memref.load"(%5#0, %arg0, %arg1) : (memref<16x16xf16>, index, index) -> f16
        %11 = "arith.extf"(%10) : (f16) -> f32
        "memref.store"(%11, %8, %arg0, %arg1) : (f32, memref<16x16xf32>, index, index) -> ()
        "scf.yield"() : () -> ()
      }) : (index, index, index) -> ()
      "scf.yield"() : () -> ()
    }) : (index, index, index) -> ()
    %9 = "memref.cast"(%8) : (memref<16x16xf32>) -> memref<*xf32>
    "func.call"(%9) <{callee = @printMemrefF32}> : (memref<*xf32>) -> ()
    "memref.dealloc"(%4) : (memref<16x16xf16>) -> ()
    "memref.dealloc"(%5#0) : (memref<16x16xf16>) -> ()
    "memref.dealloc"(%5#1) : (memref<16x16xi8>) -> ()
    "memref.dealloc"(%6) : (memref<16x16xi32>) -> ()
    "memref.dealloc"(%8) : (memref<16x16xf32>) -> ()
    "func.return"() : () -> ()
  }) {llvm.emit_c_interface} : () -> ()
  "func.func"() <{function_type = (memref<*xi32>) -> (), sym_name = "printMemrefI32", sym_visibility = "private"}> ({
  }) {llvm.emit_c_interface} : () -> ()
  "func.func"() <{function_type = (memref<*xf32>) -> (), sym_name = "printMemrefF32", sym_visibility = "private"}> ({
  }) {llvm.emit_c_interface} : () -> ()
}) {gpu.container_module} : () -> ()

