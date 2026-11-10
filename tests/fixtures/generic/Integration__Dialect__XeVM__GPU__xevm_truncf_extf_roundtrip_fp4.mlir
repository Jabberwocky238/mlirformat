"builtin.module"() <{sym_name = "roundtrip"}> ({
  "gpu.module"() <{sym_name = "kernel"}> ({
    "gpu.func"() <{function_type = (!llvm.ptr<1>) -> (), kernel}> ({
    ^bb0(%arg5: !llvm.ptr<1>):
      %35 = "gpu.lane_id"() : () -> index
      %36 = "arith.index_cast"(%35) : (index) -> i64
      %37 = "arith.constant"() <{value = 16 : i64}> : () -> i64
      %38 = "arith.muli"(%36, %37) <{overflowFlags = #arith.overflow<none>}> : (i64, i64) -> i64
      %39 = "llvm.getelementptr"(%arg5, %38) <{elem_type = f16, noWrapFlags = 0 : i32, rawConstantIndices = array<i32: -2147483648>}> : (!llvm.ptr<1>, i64) -> !llvm.ptr<1>
      %40 = "llvm.load"(%39) <{ordering = 0 : i64}> : (!llvm.ptr<1>) -> vector<16xf16>
      %41 = "xevm.truncf"(%40) <{dst_etype = #xevm<dst_etype dst_etype = e2m1>, src_etype = #xevm<src_etype src_etype = f16>}> : (vector<16xf16>) -> vector<8xi8>
      %42 = "xevm.extf"(%41) <{dst_etype = #xevm<ext_dst_etype dst_etype = f16>, src_etype = #xevm<ext_src_etype src_etype = e2m1>}> : (vector<8xi8>) -> vector<16xf16>
      "llvm.store"(%42, %39) <{ordering = 0 : i64}> : (vector<16xf16>, !llvm.ptr<1>) -> ()
      "gpu.return"() : () -> ()
    }) {sym_name = "truncf_extf_roundtrip_fp4"} : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<16x16xf16>) -> memref<16x16xf16>, sym_name = "test"}> ({
  ^bb0(%arg4: memref<16x16xf16>):
    %27 = "arith.constant"() <{value = 1 : index}> : () -> index
    %28 = "arith.constant"() <{value = 16 : index}> : () -> index
    %29 = "gpu.alloc"() <{operandSegmentSizes = array<i32: 0, 0, 0>}> : () -> memref<16x16xf16>
    "gpu.memcpy"(%29, %arg4) : (memref<16x16xf16>, memref<16x16xf16>) -> ()
    %30 = "memref.extract_aligned_pointer_as_index"(%29) : (memref<16x16xf16>) -> index
    %31 = "arith.index_cast"(%30) : (index) -> i64
    %32 = "llvm.inttoptr"(%31) : (i64) -> !llvm.ptr
    %33 = "llvm.addrspacecast"(%32) : (!llvm.ptr) -> !llvm.ptr<1>
    "gpu.launch_func"(%27, %27, %27, %28, %27, %27, %33) <{kernel = @kernel::@truncf_extf_roundtrip_fp4, operandSegmentSizes = array<i32: 0, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 1, 0>}> : (index, index, index, index, index, index, !llvm.ptr<1>) -> ()
    %34 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<16x16xf16>
    "gpu.memcpy"(%34, %29) : (memref<16x16xf16>, memref<16x16xf16>) -> ()
    "gpu.dealloc"(%29) : (memref<16x16xf16>) -> ()
    "func.return"(%34) : (memref<16x16xf16>) -> ()
  }) {llvm.emit_c_interface} : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "main"}> ({
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = 1 : index}> : () -> index
    %2 = "arith.constant"() <{value = 2 : index}> : () -> index
    %3 = "arith.constant"() <{value = 3 : index}> : () -> index
    %4 = "arith.constant"() <{value = 4 : index}> : () -> index
    %5 = "arith.constant"() <{value = 5 : index}> : () -> index
    %6 = "arith.constant"() <{value = 6 : index}> : () -> index
    %7 = "arith.constant"() <{value = 7 : index}> : () -> index
    %8 = "arith.constant"() <{value = 8 : index}> : () -> index
    %9 = "arith.constant"() <{value = 16 : index}> : () -> index
    %10 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<8xf16>
    %11 = "arith.constant"() <{value = 0.000000e+00 : f16}> : () -> f16
    %12 = "arith.constant"() <{value = 5.000000e-01 : f16}> : () -> f16
    %13 = "arith.constant"() <{value = 1.000000e+00 : f16}> : () -> f16
    %14 = "arith.constant"() <{value = 1.500000e+00 : f16}> : () -> f16
    %15 = "arith.constant"() <{value = 2.000000e+00 : f16}> : () -> f16
    %16 = "arith.constant"() <{value = 3.000000e+00 : f16}> : () -> f16
    %17 = "arith.constant"() <{value = 4.000000e+00 : f16}> : () -> f16
    %18 = "arith.constant"() <{value = 6.000000e+00 : f16}> : () -> f16
    "memref.store"(%11, %10, %0) : (f16, memref<8xf16>, index) -> ()
    "memref.store"(%12, %10, %1) : (f16, memref<8xf16>, index) -> ()
    "memref.store"(%13, %10, %2) : (f16, memref<8xf16>, index) -> ()
    "memref.store"(%14, %10, %3) : (f16, memref<8xf16>, index) -> ()
    "memref.store"(%15, %10, %4) : (f16, memref<8xf16>, index) -> ()
    "memref.store"(%16, %10, %5) : (f16, memref<8xf16>, index) -> ()
    "memref.store"(%17, %10, %6) : (f16, memref<8xf16>, index) -> ()
    "memref.store"(%18, %10, %7) : (f16, memref<8xf16>, index) -> ()
    %19 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<16x16xf16>
    "scf.for"(%0, %9, %1) ({
    ^bb0(%arg2: index):
      "scf.for"(%0, %9, %1) ({
      ^bb0(%arg3: index):
        %25 = "arith.remui"(%arg3, %8) : (index, index) -> index
        %26 = "memref.load"(%10, %25) : (memref<8xf16>, index) -> f16
        "memref.store"(%26, %19, %arg2, %arg3) : (f16, memref<16x16xf16>, index, index) -> ()
        "scf.yield"() : () -> ()
      }) : (index, index, index) -> ()
      "scf.yield"() : () -> ()
    }) : (index, index, index) -> ()
    %20 = "func.call"(%19) <{callee = @test}> : (memref<16x16xf16>) -> memref<16x16xf16>
    %21 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<16x16xf32>
    "scf.for"(%0, %9, %1) ({
    ^bb0(%arg0: index):
      "scf.for"(%0, %9, %1) ({
      ^bb0(%arg1: index):
        %23 = "memref.load"(%20, %arg0, %arg1) : (memref<16x16xf16>, index, index) -> f16
        %24 = "arith.extf"(%23) : (f16) -> f32
        "memref.store"(%24, %21, %arg0, %arg1) : (f32, memref<16x16xf32>, index, index) -> ()
        "scf.yield"() : () -> ()
      }) : (index, index, index) -> ()
      "scf.yield"() : () -> ()
    }) : (index, index, index) -> ()
    %22 = "memref.cast"(%21) : (memref<16x16xf32>) -> memref<*xf32>
    "func.call"(%22) <{callee = @printMemrefF32}> : (memref<*xf32>) -> ()
    "memref.dealloc"(%19) : (memref<16x16xf16>) -> ()
    "memref.dealloc"(%20) : (memref<16x16xf16>) -> ()
    "memref.dealloc"(%21) : (memref<16x16xf32>) -> ()
    "memref.dealloc"(%10) : (memref<8xf16>) -> ()
    "func.return"() : () -> ()
  }) {llvm.emit_c_interface} : () -> ()
  "func.func"() <{function_type = (memref<*xf32>) -> (), sym_name = "printMemrefF32", sym_visibility = "private"}> ({
  }) {llvm.emit_c_interface} : () -> ()
}) {gpu.container_module} : () -> ()

