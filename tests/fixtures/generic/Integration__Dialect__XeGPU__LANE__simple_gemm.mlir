"builtin.module"() <{sym_name = "gemm"}> ({
  "gpu.module"() <{sym_name = "kernel"}> ({
    "gpu.func"() <{function_type = (memref<256x256xf16>, memref<256x256xf16>, memref<256x256xf32>) -> (), kernel}> ({
    ^bb0(%arg9: memref<256x256xf16>, %arg10: memref<256x256xf16>, %arg11: memref<256x256xf32>):
      %28 = "arith.constant"() <{value = 0 : index}> : () -> index
      %29 = "arith.constant"() <{value = 1 : index}> : () -> index
      %30 = "arith.constant"() <{value = 8 : index}> : () -> index
      %31 = "arith.constant"() <{value = 16 : index}> : () -> index
      %32 = "arith.constant"() <{value = 32 : index}> : () -> index
      %33 = "arith.constant"() <{value = 256 : index}> : () -> index
      %34 = "gpu.block_id"() <{dimension = #gpu<dim x>}> : () -> index
      %35 = "gpu.block_id"() <{dimension = #gpu<dim y>}> : () -> index
      %36 = "arith.muli"(%34, %30) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
      %37 = "arith.muli"(%35, %31) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
      %38 = "xegpu.create_nd_tdesc"(%arg11) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (memref<256x256xf32>) -> !xegpu.tensor_desc<8x16xf32>
      %39 = "xegpu.load_nd"(%38, %36, %37) <{const_offsets = array<i64: -9223372036854775808, -9223372036854775808>}> : (!xegpu.tensor_desc<8x16xf32>, index, index) -> vector<8xf32>
      %40 = "xegpu.create_nd_tdesc"(%arg9) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (memref<256x256xf16>) -> !xegpu.tensor_desc<8x16xf16>
      %41 = "xegpu.create_nd_tdesc"(%arg10) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (memref<256x256xf16>) -> !xegpu.tensor_desc<16x16xf16>
      %42 = "scf.for"(%28, %33, %31, %39) ({
      ^bb0(%arg12: index, %arg13: vector<8xf32>):
        %43 = "xegpu.load_nd"(%40, %36, %arg12) <{const_offsets = array<i64: -9223372036854775808, -9223372036854775808>}> : (!xegpu.tensor_desc<8x16xf16>, index, index) -> vector<8xf16>
        %44 = "xegpu.load_nd"(%41, %arg12, %37) <{const_offsets = array<i64: -9223372036854775808, -9223372036854775808>}> : (!xegpu.tensor_desc<16x16xf16>, index, index) -> vector<16xf16>
        %45 = "xegpu.dpas"(%43, %44, %arg13) : (vector<8xf16>, vector<16xf16>, vector<8xf32>) -> vector<8xf32>
        "scf.yield"(%45) : (vector<8xf32>) -> ()
      }) : (index, index, index, vector<8xf32>) -> vector<8xf32>
      "xegpu.store_nd"(%42, %38, %36, %37) <{const_offsets = array<i64: -9223372036854775808, -9223372036854775808>, l1_hint = #xegpu.cache_hint<write_back>, l2_hint = #xegpu.cache_hint<uncached>}> : (vector<8xf32>, !xegpu.tensor_desc<8x16xf32>, index, index) -> ()
      "gpu.return"() : () -> ()
    }) {sym_name = "simple_gemm"} : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<256x256xf16>, memref<256x256xf16>, memref<256x256xf32>) -> memref<256x256xf32>, sym_name = "test"}> ({
  ^bb0(%arg6: memref<256x256xf16>, %arg7: memref<256x256xf16>, %arg8: memref<256x256xf32>):
    %22 = "arith.constant"() <{value = 1 : index}> : () -> index
    %23 = "arith.constant"() <{value = 16 : index}> : () -> index
    %24 = "arith.constant"() <{value = 32 : index}> : () -> index
    %25 = "gpu.alloc"() <{operandSegmentSizes = array<i32: 0, 0, 0>}> : () -> memref<256x256xf16>
    "gpu.memcpy"(%25, %arg6) : (memref<256x256xf16>, memref<256x256xf16>) -> ()
    %26 = "gpu.alloc"() <{operandSegmentSizes = array<i32: 0, 0, 0>}> : () -> memref<256x256xf16>
    "gpu.memcpy"(%26, %arg7) : (memref<256x256xf16>, memref<256x256xf16>) -> ()
    %27 = "gpu.alloc"() <{operandSegmentSizes = array<i32: 0, 0, 0>}> : () -> memref<256x256xf32>
    "gpu.memcpy"(%27, %arg8) : (memref<256x256xf32>, memref<256x256xf32>) -> ()
    "gpu.launch_func"(%24, %23, %22, %23, %22, %22, %25, %26, %27) <{kernel = @kernel::@simple_gemm, operandSegmentSizes = array<i32: 0, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 3, 0>}> : (index, index, index, index, index, index, memref<256x256xf16>, memref<256x256xf16>, memref<256x256xf32>) -> ()
    "gpu.wait"() : () -> ()
    "gpu.memcpy"(%arg8, %27) : (memref<256x256xf32>, memref<256x256xf32>) -> ()
    "gpu.dealloc"(%25) : (memref<256x256xf16>) -> ()
    "gpu.dealloc"(%26) : (memref<256x256xf16>) -> ()
    "gpu.dealloc"(%27) : (memref<256x256xf32>) -> ()
    "func.return"(%arg8) : (memref<256x256xf32>) -> ()
  }) {llvm.emit_c_interface} : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "main"}> ({
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = 1 : index}> : () -> index
    %2 = "arith.constant"() <{value = 1.000000e+00 : f16}> : () -> f16
    %3 = "arith.constant"() <{value = 2.000000e+00 : f16}> : () -> f16
    %4 = "arith.constant"() <{value = 256 : index}> : () -> index
    %5 = "arith.constant"() <{value = 0.000000e+00 : f16}> : () -> f16
    %6 = "arith.constant"() <{value = 1.000000e+00 : f16}> : () -> f16
    %7 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<256x256xf16>
    %8 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<256x256xf16>
    %9 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<256x256xf32>
    %10 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<256x256xf32>
    %11 = "arith.constant"() <{value = false}> : () -> i1
    %12 = "arith.constant"() <{value = -5.000000e-01 : f32}> : () -> f32
    %13 = "arith.constant"() <{value = 5.000000e-01 : f32}> : () -> f32
    "scf.for"(%0, %4, %1) ({
    ^bb0(%arg4: index):
      "scf.for"(%0, %4, %1) ({
      ^bb0(%arg5: index):
        %20 = "index.castu"(%arg5) : (index) -> i16
        %21 = "arith.uitofp"(%20) : (i16) -> f16
        "memref.store"(%21, %7, %arg4, %arg5) : (f16, memref<256x256xf16>, index, index) -> ()
        "scf.yield"() : () -> ()
      }) : (index, index, index) -> ()
      "scf.yield"() : () -> ()
    }) : (index, index, index) -> ()
    "scf.for"(%0, %4, %1) ({
    ^bb0(%arg2: index):
      "scf.for"(%0, %4, %1) ({
      ^bb0(%arg3: index):
        %17 = "index.castu"(%arg2) : (index) -> i32
        %18 = "index.castu"(%arg3) : (index) -> i32
        %19 = "arith.cmpi"(%17, %18) <{predicate = 0 : i64}> : (i32, i32) -> i1
        "scf.if"(%19) ({
          "memref.store"(%6, %8, %arg2, %arg3) : (f16, memref<256x256xf16>, index, index) -> ()
          "scf.yield"() : () -> ()
        }, {
          "memref.store"(%5, %8, %arg2, %arg3) : (f16, memref<256x256xf16>, index, index) -> ()
          "scf.yield"() : () -> ()
        }) : (i1) -> ()
        "scf.yield"() : () -> ()
      }) : (index, index, index) -> ()
      "scf.yield"() : () -> ()
    }) : (index, index, index) -> ()
    %14 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    "scf.for"(%0, %4, %1) ({
    ^bb0(%arg0: index):
      "scf.for"(%0, %4, %1) ({
      ^bb0(%arg1: index):
        "memref.store"(%14, %9, %arg0, %arg1) : (f32, memref<256x256xf32>, index, index) -> ()
        "memref.store"(%14, %10, %arg0, %arg1) : (f32, memref<256x256xf32>, index, index) -> ()
        "scf.yield"() : () -> ()
      }) : (index, index, index) -> ()
      "scf.yield"() : () -> ()
    }) : (index, index, index) -> ()
    %15 = "func.call"(%7, %8, %9) <{callee = @test}> : (memref<256x256xf16>, memref<256x256xf16>, memref<256x256xf32>) -> memref<256x256xf32>
    %16 = "memref.cast"(%15) : (memref<256x256xf32>) -> memref<*xf32>
    "func.call"(%16) <{callee = @printMemrefF32}> : (memref<*xf32>) -> ()
    "memref.dealloc"(%7) : (memref<256x256xf16>) -> ()
    "memref.dealloc"(%8) : (memref<256x256xf16>) -> ()
    "memref.dealloc"(%9) : (memref<256x256xf32>) -> ()
    "memref.dealloc"(%10) : (memref<256x256xf32>) -> ()
    "func.return"() : () -> ()
  }) {llvm.emit_c_interface} : () -> ()
  "func.func"() <{function_type = (memref<*xf32>) -> (), sym_name = "printMemrefF32", sym_visibility = "private"}> ({
  }) {llvm.emit_c_interface} : () -> ()
}) {gpu.container_module} : () -> ()

