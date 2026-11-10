"builtin.module"() <{sym_name = "gemm"}> ({
  "func.func"() <{function_type = (memref<256x256xf16>, memref<256x256xf16>, memref<256x256xf32>) -> memref<256x256xf32>, sym_name = "test"}> ({
  ^bb0(%arg11: memref<256x256xf16>, %arg12: memref<256x256xf16>, %arg13: memref<256x256xf32>):
    %44 = "arith.constant"() <{value = 1 : index}> : () -> index
    %45 = "arith.constant"() <{value = 4 : index}> : () -> index
    %46 = "arith.constant"() <{value = 8 : index}> : () -> index
    %47 = "arith.constant"() <{value = 16 : index}> : () -> index
    %48 = "arith.constant"() <{value = 32 : index}> : () -> index
    %49 = "arith.constant"() <{value = 64 : index}> : () -> index
    %50 = "arith.constant"() <{value = 128 : index}> : () -> index
    %51 = "arith.constant"() <{value = 512 : index}> : () -> index
    %52 = "gpu.alloc"() <{operandSegmentSizes = array<i32: 0, 0, 0>}> : () -> memref<256x256xf16>
    "gpu.memcpy"(%52, %arg11) : (memref<256x256xf16>, memref<256x256xf16>) -> ()
    %53 = "gpu.alloc"() <{operandSegmentSizes = array<i32: 0, 0, 0>}> : () -> memref<256x256xf16>
    "gpu.memcpy"(%53, %arg12) : (memref<256x256xf16>, memref<256x256xf16>) -> ()
    %54 = "gpu.alloc"() <{operandSegmentSizes = array<i32: 0, 0, 0>}> : () -> memref<256x256xf32>
    "gpu.memcpy"(%54, %arg13) : (memref<256x256xf32>, memref<256x256xf32>) -> ()
    "gpu.launch_func"(%44, %44, %44, %51, %44, %44, %52, %53, %54) <{kernel = @test_kernel::@test_kernel, operandSegmentSizes = array<i32: 0, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 3, 0>}> : (index, index, index, index, index, index, memref<256x256xf16>, memref<256x256xf16>, memref<256x256xf32>) -> ()
    "gpu.wait"() : () -> ()
    "gpu.memcpy"(%arg13, %54) : (memref<256x256xf32>, memref<256x256xf32>) -> ()
    "gpu.dealloc"(%52) : (memref<256x256xf16>) -> ()
    "gpu.dealloc"(%53) : (memref<256x256xf16>) -> ()
    "gpu.dealloc"(%54) : (memref<256x256xf32>) -> ()
    "func.return"(%arg13) : (memref<256x256xf32>) -> ()
  }) {llvm.emit_c_interface} : () -> ()
  "gpu.module"() <{sym_name = "test_kernel"}> ({
    "gpu.func"() <{function_type = (memref<256x256xf16>, memref<256x256xf16>, memref<256x256xf32>) -> (), kernel}> ({
    ^bb0(%arg6: memref<256x256xf16>, %arg7: memref<256x256xf16>, %arg8: memref<256x256xf32>):
      %22 = "arith.constant"() <{value = 0 : index}> : () -> index
      %23 = "arith.constant"() <{value = 1 : index}> : () -> index
      %24 = "arith.constant"() <{value = 32 : index}> : () -> index
      %25 = "arith.constant"() <{value = 64 : index}> : () -> index
      %26 = "arith.constant"() <{value = 96 : index}> : () -> index
      %27 = "arith.constant"() <{value = 256 : index}> : () -> index
      %28 = "arith.constant"() <{value = 4096 : index}> : () -> index
      %29 = "gpu.block_id"() <{dimension = #gpu<dim x>}> : () -> index
      %30 = "gpu.block_id"() <{dimension = #gpu<dim y>}> : () -> index
      %31 = "arith.muli"(%29, %27) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
      %32 = "arith.muli"(%30, %27) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
      %33 = "xegpu.create_nd_tdesc"(%arg8) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (memref<256x256xf32>) -> !xegpu.tensor_desc<256x256xf32, #xegpu.layout<sg_layout = [8, 4], sg_data = [32, 64], inst_data = [8, 16]>>
      %34 = "xegpu.load_nd"(%33, %31, %32) <{const_offsets = array<i64: -9223372036854775808, -9223372036854775808>, layout = #xegpu.layout<sg_layout = [8, 4], sg_data = [32, 64], inst_data = [8, 16]>}> : (!xegpu.tensor_desc<256x256xf32, #xegpu.layout<sg_layout = [8, 4], sg_data = [32, 64], inst_data = [8, 16]>>, index, index) -> vector<256x256xf32>
      %35 = "xegpu.create_nd_tdesc"(%arg6) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (memref<256x256xf16>) -> !xegpu.tensor_desc<256x32xf16, #xegpu.layout<sg_layout = [8, 4], sg_data = [32, 32], inst_data = [8, 16]>>
      %36 = "xegpu.create_nd_tdesc"(%arg7) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (memref<256x256xf16>) -> !xegpu.tensor_desc<32x256xf16, #xegpu.layout<sg_layout = [8, 4], sg_data = [32, 64], inst_data = [16, 16]>>
      %37 = "xegpu.create_nd_tdesc"(%arg6) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (memref<256x256xf16>) -> !xegpu.tensor_desc<256x32xf16, #xegpu.layout<sg_layout = [32, 1], sg_data = [8, 32], inst_data = [8, 16]>>
      "xegpu.prefetch_nd"(%37, %31, %22) <{const_offsets = array<i64: -9223372036854775808, -9223372036854775808>, layout = #xegpu.layout<sg_layout = [32, 1], sg_data = [8, 32], inst_data = [8, 16]>}> : (!xegpu.tensor_desc<256x32xf16, #xegpu.layout<sg_layout = [32, 1], sg_data = [8, 32], inst_data = [8, 16]>>, index, index) -> ()
      "xegpu.prefetch_nd"(%37, %31, %24) <{const_offsets = array<i64: -9223372036854775808, -9223372036854775808>, layout = #xegpu.layout<sg_layout = [32, 1], sg_data = [8, 32], inst_data = [8, 16]>}> : (!xegpu.tensor_desc<256x32xf16, #xegpu.layout<sg_layout = [32, 1], sg_data = [8, 32], inst_data = [8, 16]>>, index, index) -> ()
      "xegpu.prefetch_nd"(%37, %31, %25) <{const_offsets = array<i64: -9223372036854775808, -9223372036854775808>, layout = #xegpu.layout<sg_layout = [32, 1], sg_data = [8, 32], inst_data = [8, 16]>}> : (!xegpu.tensor_desc<256x32xf16, #xegpu.layout<sg_layout = [32, 1], sg_data = [8, 32], inst_data = [8, 16]>>, index, index) -> ()
      %38 = "xegpu.create_nd_tdesc"(%arg7) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (memref<256x256xf16>) -> !xegpu.tensor_desc<32x256xf16, #xegpu.layout<sg_layout = [4, 8], sg_data = [8, 32], inst_data = [8, 16]>>
      "xegpu.prefetch_nd"(%38, %22, %32) <{const_offsets = array<i64: -9223372036854775808, -9223372036854775808>, layout = #xegpu.layout<sg_layout = [4, 8], sg_data = [8, 32], inst_data = [8, 16]>}> : (!xegpu.tensor_desc<32x256xf16, #xegpu.layout<sg_layout = [4, 8], sg_data = [8, 32], inst_data = [8, 16]>>, index, index) -> ()
      "xegpu.prefetch_nd"(%38, %24, %32) <{const_offsets = array<i64: -9223372036854775808, -9223372036854775808>, layout = #xegpu.layout<sg_layout = [4, 8], sg_data = [8, 32], inst_data = [8, 16]>}> : (!xegpu.tensor_desc<32x256xf16, #xegpu.layout<sg_layout = [4, 8], sg_data = [8, 32], inst_data = [8, 16]>>, index, index) -> ()
      "xegpu.prefetch_nd"(%38, %25, %32) <{const_offsets = array<i64: -9223372036854775808, -9223372036854775808>, layout = #xegpu.layout<sg_layout = [4, 8], sg_data = [8, 32], inst_data = [8, 16]>}> : (!xegpu.tensor_desc<32x256xf16, #xegpu.layout<sg_layout = [4, 8], sg_data = [8, 32], inst_data = [8, 16]>>, index, index) -> ()
      %39 = "scf.for"(%22, %27, %24, %34) ({
      ^bb0(%arg9: index, %arg10: vector<256x256xf32>):
        %40 = "xegpu.load_nd"(%35, %31, %arg9) <{const_offsets = array<i64: -9223372036854775808, -9223372036854775808>, layout = #xegpu.layout<sg_layout = [8, 4], sg_data = [32, 32], inst_data = [8, 16]>}> : (!xegpu.tensor_desc<256x32xf16, #xegpu.layout<sg_layout = [8, 4], sg_data = [32, 32], inst_data = [8, 16]>>, index, index) -> vector<256x32xf16>
        %41 = "xegpu.load_nd"(%36, %arg9, %32) <{const_offsets = array<i64: -9223372036854775808, -9223372036854775808>, layout = #xegpu.layout<sg_layout = [8, 4], sg_data = [32, 64], inst_data = [16, 16]>}> : (!xegpu.tensor_desc<32x256xf16, #xegpu.layout<sg_layout = [8, 4], sg_data = [32, 64], inst_data = [16, 16]>>, index, index) -> vector<32x256xf16>
        %42 = "arith.addi"(%arg9, %26) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
        "xegpu.prefetch_nd"(%37, %31, %42) <{const_offsets = array<i64: -9223372036854775808, -9223372036854775808>, layout = #xegpu.layout<sg_layout = [32, 1], sg_data = [8, 32], inst_data = [8, 16]>}> : (!xegpu.tensor_desc<256x32xf16, #xegpu.layout<sg_layout = [32, 1], sg_data = [8, 32], inst_data = [8, 16]>>, index, index) -> ()
        "xegpu.prefetch_nd"(%38, %42, %32) <{const_offsets = array<i64: -9223372036854775808, -9223372036854775808>, layout = #xegpu.layout<sg_layout = [4, 8], sg_data = [8, 32], inst_data = [8, 16]>}> : (!xegpu.tensor_desc<32x256xf16, #xegpu.layout<sg_layout = [4, 8], sg_data = [8, 32], inst_data = [8, 16]>>, index, index) -> ()
        %43 = "xegpu.dpas"(%40, %41, %arg10) <{layout_a = #xegpu.layout<sg_layout = [8, 4], sg_data = [32, 32], inst_data = [8, 16]>, layout_b = #xegpu.layout<sg_layout = [8, 4], sg_data = [32, 64], inst_data = [16, 16]>, layout_cd = #xegpu.layout<sg_layout = [8, 4], sg_data = [32, 64], inst_data = [8, 16]>}> : (vector<256x32xf16>, vector<32x256xf16>, vector<256x256xf32>) -> vector<256x256xf32>
        "scf.yield"(%43) : (vector<256x256xf32>) -> ()
      }) : (index, index, index, vector<256x256xf32>) -> vector<256x256xf32>
      "xegpu.store_nd"(%39, %33, %31, %32) <{const_offsets = array<i64: -9223372036854775808, -9223372036854775808>, layout = #xegpu.layout<sg_layout = [8, 4], sg_data = [32, 64], inst_data = [8, 16]>}> : (vector<256x256xf32>, !xegpu.tensor_desc<256x256xf32, #xegpu.layout<sg_layout = [8, 4], sg_data = [32, 64], inst_data = [8, 16]>>, index, index) -> ()
      "gpu.return"() : () -> ()
    }) {sym_name = "test_kernel"} : () -> ()
  }) : () -> ()
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

