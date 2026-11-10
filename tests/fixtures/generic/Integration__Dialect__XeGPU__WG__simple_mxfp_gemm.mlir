"builtin.module"() <{sym_name = "gemm"}> ({
  "gpu.module"() <{sym_name = "kernel"}> ({
    "gpu.func"() <{function_type = (memref<256x4096xf4E2M1FN>, memref<2048x256xi8>, memref<256x128xf8E8M0FNU>, memref<128x256xf8E8M0FNU>, memref<256x256xf32>) -> (), kernel}> ({
    ^bb0(%arg16: memref<256x4096xf4E2M1FN>, %arg17: memref<2048x256xi8>, %arg18: memref<256x128xf8E8M0FNU>, %arg19: memref<128x256xf8E8M0FNU>, %arg20: memref<256x256xf32>):
      %31 = "arith.constant"() <{value = 0 : index}> : () -> index
      %32 = "arith.constant"() <{value = 32 : index}> : () -> index
      %33 = "arith.constant"() <{value = 32 : index}> : () -> index
      %34 = "arith.constant"() <{value = 1024 : index}> : () -> index
      %35 = "arith.constant"() <{value = 256 : index}> : () -> index
      %36 = "arith.constant"() <{value = 256 : index}> : () -> index
      %37 = "arith.constant"() <{value = 4096 : index}> : () -> index
      %38 = "arith.constant"() <{value = 512 : index}> : () -> index
      %39 = "arith.constant"() <{value = 32 : index}> : () -> index
      %40 = "gpu.block_id"() <{dimension = #gpu<dim x>}> : () -> index
      %41 = "gpu.block_id"() <{dimension = #gpu<dim y>}> : () -> index
      %42 = "arith.muli"(%40, %32) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
      %43 = "arith.muli"(%41, %33) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
      %44 = "xegpu.create_nd_tdesc"(%arg16) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (memref<256x4096xf4E2M1FN>) -> !xegpu.tensor_desc<32x1024xf4E2M1FN>
      %45 = "xegpu.create_nd_tdesc"(%arg17) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (memref<2048x256xi8>) -> !xegpu.tensor_desc<512x32xi8>
      %46 = "xegpu.create_nd_tdesc"(%arg18) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (memref<256x128xf8E8M0FNU>) -> !xegpu.tensor_desc<32x32xf8E8M0FNU>
      %47 = "xegpu.create_nd_tdesc"(%arg19) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (memref<128x256xf8E8M0FNU>) -> !xegpu.tensor_desc<32x32xf8E8M0FNU>
      %48 = "xegpu.create_nd_tdesc"(%arg20) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (memref<256x256xf32>) -> !xegpu.tensor_desc<32x32xf32, #xegpu.layout<sg_layout = [2, 2], sg_data = [16, 16], inst_data = [8, 16], lane_layout = [1, 16], lane_data = [1, 1]>>
      %49 = "xegpu.load_nd"(%48, %42, %43) <{const_offsets = array<i64: -9223372036854775808, -9223372036854775808>, layout = #xegpu.layout<sg_layout = [2, 2], sg_data = [16, 16], inst_data = [8, 16], lane_layout = [1, 16], lane_data = [1, 1]>}> : (!xegpu.tensor_desc<32x32xf32, #xegpu.layout<sg_layout = [2, 2], sg_data = [16, 16], inst_data = [8, 16], lane_layout = [1, 16], lane_data = [1, 1]>>, index, index) -> vector<32x32xf32>
      %50:3 = "scf.for"(%31, %37, %34, %49, %31, %31) ({
      ^bb0(%arg21: index, %arg22: vector<32x32xf32>, %arg23: index, %arg24: index):
        %51 = "xegpu.load_nd"(%44, %42, %arg21) <{const_offsets = array<i64: -9223372036854775808, -9223372036854775808>, layout = #xegpu.layout<sg_layout = [2, 2], sg_data = [16, 1024], inst_data = [8, 64], lane_layout = [1, 16], lane_data = [1, 4]>}> : (!xegpu.tensor_desc<32x1024xf4E2M1FN>, index, index) -> vector<32x1024xf4E2M1FN>
        %52 = "xegpu.load_nd"(%45, %arg23, %43) <{const_offsets = array<i64: -9223372036854775808, -9223372036854775808>, layout = #xegpu.layout<sg_layout = [2, 2], sg_data = [512, 16], inst_data = [32, 16], lane_layout = [1, 16], lane_data = [4, 1]>}> : (!xegpu.tensor_desc<512x32xi8>, index, index) -> vector<512x32xi8>
        %53 = "vector.bitcast"(%52) : (vector<512x32xi8>) -> vector<512x64xf4E2M1FN>
        %54:2 = "vector.deinterleave"(%53) : (vector<512x64xf4E2M1FN>) -> (vector<512x32xf4E2M1FN>, vector<512x32xf4E2M1FN>)
        %55 = "vector.transpose"(%54#0) <{permutation = array<i64: 1, 0>}> : (vector<512x32xf4E2M1FN>) -> vector<32x512xf4E2M1FN>
        %56 = "vector.transpose"(%54#1) <{permutation = array<i64: 1, 0>}> : (vector<512x32xf4E2M1FN>) -> vector<32x512xf4E2M1FN>
        %57 = "vector.interleave"(%55, %56) : (vector<32x512xf4E2M1FN>, vector<32x512xf4E2M1FN>) -> vector<32x1024xf4E2M1FN>
        %58 = "vector.transpose"(%57) <{permutation = array<i64: 1, 0>}> : (vector<32x1024xf4E2M1FN>) -> vector<1024x32xf4E2M1FN>
        %59 = "xegpu.load_nd"(%46, %42, %arg24) <{const_offsets = array<i64: -9223372036854775808, -9223372036854775808>, layout = #xegpu.layout<sg_layout = [2, 2], sg_data = [16, 32], inst_data = [16, 32], lane_layout = [16, 1], lane_data = [1, 1]>}> : (!xegpu.tensor_desc<32x32xf8E8M0FNU>, index, index) -> vector<32x32xf8E8M0FNU>
        %60 = "xegpu.load_nd"(%47, %arg24, %43) <{const_offsets = array<i64: -9223372036854775808, -9223372036854775808>, layout = #xegpu.layout<sg_layout = [2, 2], sg_data = [32, 16], inst_data = [32, 16], lane_layout = [1, 16], lane_data = [1, 1]>}> : (!xegpu.tensor_desc<32x32xf8E8M0FNU>, index, index) -> vector<32x32xf8E8M0FNU>
        %61 = "xegpu.dpas_mx"(%51, %58, %arg22, %59, %60) <{layout_a = #xegpu.layout<sg_layout = [2, 2], sg_data = [16, 1024], inst_data = [8, 64], lane_layout = [1, 16], lane_data = [1, 4]>, layout_a_scale = #xegpu.layout<sg_layout = [2, 2], sg_data = [16, 32], inst_data = [8, 2], lane_layout = [8, 1], lane_data = [1, 1]>, layout_b = #xegpu.layout<sg_layout = [2, 2], sg_data = [1024, 16], inst_data = [64, 16], lane_layout = [1, 16], lane_data = [8, 1]>, layout_b_scale = #xegpu.layout<sg_layout = [2, 2], sg_data = [32, 16], inst_data = [2, 16], lane_layout = [1, 16], lane_data = [1, 1]>, layout_cd = #xegpu.layout<sg_layout = [2, 2], sg_data = [16, 16], inst_data = [8, 16], lane_layout = [1, 16], lane_data = [1, 1]>, operandSegmentSizes = array<i32: 1, 1, 1, 1, 1>}> : (vector<32x1024xf4E2M1FN>, vector<1024x32xf4E2M1FN>, vector<32x32xf32>, vector<32x32xf8E8M0FNU>, vector<32x32xf8E8M0FNU>) -> vector<32x32xf32>
        %62 = "arith.addi"(%arg23, %38) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
        %63 = "arith.addi"(%arg24, %39) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
        "scf.yield"(%61, %62, %63) : (vector<32x32xf32>, index, index) -> ()
      }) : (index, index, index, vector<32x32xf32>, index, index) -> (vector<32x32xf32>, index, index)
      "xegpu.store_nd"(%50#0, %48, %42, %43) <{const_offsets = array<i64: -9223372036854775808, -9223372036854775808>, layout = #xegpu.layout<sg_layout = [2, 2], sg_data = [16, 16], inst_data = [8, 16], lane_layout = [1, 16], lane_data = [1, 1]>}> : (vector<32x32xf32>, !xegpu.tensor_desc<32x32xf32, #xegpu.layout<sg_layout = [2, 2], sg_data = [16, 16], inst_data = [8, 16], lane_layout = [1, 16], lane_data = [1, 1]>>, index, index) -> ()
      "gpu.return"() : () -> ()
    }) {sym_name = "gemm_mxfp"} : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<256x4096xf4E2M1FN>, memref<2048x256xi8>, memref<256x128xf8E8M0FNU>, memref<128x256xf8E8M0FNU>, memref<256x256xf32>) -> memref<256x256xf32>, sym_name = "test"}> ({
  ^bb0(%arg11: memref<256x4096xf4E2M1FN>, %arg12: memref<2048x256xi8>, %arg13: memref<256x128xf8E8M0FNU>, %arg14: memref<128x256xf8E8M0FNU>, %arg15: memref<256x256xf32>):
    %22 = "arith.constant"() <{value = 1 : index}> : () -> index
    %23 = "arith.constant"() <{value = 8 : index}> : () -> index
    %24 = "arith.constant"() <{value = 64 : index}> : () -> index
    %25 = "gpu.alloc"() <{operandSegmentSizes = array<i32: 0, 0, 0>}> : () -> memref<256x4096xf4E2M1FN>
    "gpu.memcpy"(%25, %arg11) : (memref<256x4096xf4E2M1FN>, memref<256x4096xf4E2M1FN>) -> ()
    %26 = "gpu.alloc"() <{operandSegmentSizes = array<i32: 0, 0, 0>}> : () -> memref<2048x256xi8>
    "gpu.memcpy"(%26, %arg12) : (memref<2048x256xi8>, memref<2048x256xi8>) -> ()
    %27 = "gpu.alloc"() <{operandSegmentSizes = array<i32: 0, 0, 0>}> : () -> memref<256x256xf32>
    "gpu.memcpy"(%27, %arg15) : (memref<256x256xf32>, memref<256x256xf32>) -> ()
    %28 = "gpu.alloc"() <{operandSegmentSizes = array<i32: 0, 0, 0>}> : () -> memref<256x128xf8E8M0FNU>
    "gpu.memcpy"(%28, %arg13) : (memref<256x128xf8E8M0FNU>, memref<256x128xf8E8M0FNU>) -> ()
    %29 = "gpu.alloc"() <{operandSegmentSizes = array<i32: 0, 0, 0>}> : () -> memref<128x256xf8E8M0FNU>
    "gpu.memcpy"(%29, %arg14) : (memref<128x256xf8E8M0FNU>, memref<128x256xf8E8M0FNU>) -> ()
    "gpu.launch_func"(%23, %23, %22, %24, %22, %22, %25, %26, %28, %29, %27) <{kernel = @kernel::@gemm_mxfp, operandSegmentSizes = array<i32: 0, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 5, 0>}> : (index, index, index, index, index, index, memref<256x4096xf4E2M1FN>, memref<2048x256xi8>, memref<256x128xf8E8M0FNU>, memref<128x256xf8E8M0FNU>, memref<256x256xf32>) -> ()
    "gpu.dealloc"(%25) : (memref<256x4096xf4E2M1FN>) -> ()
    "gpu.dealloc"(%26) : (memref<2048x256xi8>) -> ()
    "gpu.dealloc"(%28) : (memref<256x128xf8E8M0FNU>) -> ()
    "gpu.dealloc"(%29) : (memref<128x256xf8E8M0FNU>) -> ()
    %30 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<256x256xf32>
    "gpu.memcpy"(%30, %27) : (memref<256x256xf32>, memref<256x256xf32>) -> ()
    "gpu.dealloc"(%27) : (memref<256x256xf32>) -> ()
    "func.return"(%30) : (memref<256x256xf32>) -> ()
  }) {llvm.emit_c_interface} : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "main"}> ({
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = 1 : index}> : () -> index
    %2 = "arith.constant"() <{value = 128 : index}> : () -> index
    %3 = "arith.constant"() <{value = 256 : index}> : () -> index
    %4 = "arith.constant"() <{value = 2048 : index}> : () -> index
    %5 = "arith.constant"() <{value = 4096 : index}> : () -> index
    %6 = "arith.constant"() <{value = 524288 : index}> : () -> index
    %7 = "arith.constant"() <{value = 34 : i8}> : () -> i8
    %8 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %9 = "arith.constant"() <{value = 1.000000e+00 : f8E8M0FNU}> : () -> f8E8M0FNU
    %10 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<524288xi8>
    %11 = "memref.view"(%10, %0) : (memref<524288xi8>, index) -> memref<256x4096xf4E2M1FN>
    "scf.for"(%0, %6, %1) ({
    ^bb0(%arg10: index):
      "memref.store"(%7, %10, %arg10) : (i8, memref<524288xi8>, index) -> ()
      "scf.yield"() : () -> ()
    }) : (index, index, index) -> ()
    %12 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<2048x256xi8>
    "scf.for"(%0, %4, %1) ({
    ^bb0(%arg8: index):
      "scf.for"(%0, %3, %1) ({
      ^bb0(%arg9: index):
        "memref.store"(%7, %12, %arg8, %arg9) : (i8, memref<2048x256xi8>, index, index) -> ()
        "scf.yield"() : () -> ()
      }) : (index, index, index) -> ()
      "scf.yield"() : () -> ()
    }) : (index, index, index) -> ()
    %13 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<256x256xf32>
    "scf.for"(%0, %3, %1) ({
    ^bb0(%arg6: index):
      "scf.for"(%0, %3, %1) ({
      ^bb0(%arg7: index):
        "memref.store"(%8, %13, %arg6, %arg7) : (f32, memref<256x256xf32>, index, index) -> ()
        "scf.yield"() : () -> ()
      }) : (index, index, index) -> ()
      "scf.yield"() : () -> ()
    }) : (index, index, index) -> ()
    %14 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<256x128xf8E8M0FNU>
    "scf.for"(%0, %3, %1) ({
    ^bb0(%arg4: index):
      "scf.for"(%0, %2, %1) ({
      ^bb0(%arg5: index):
        "memref.store"(%9, %14, %arg4, %arg5) : (f8E8M0FNU, memref<256x128xf8E8M0FNU>, index, index) -> ()
        "scf.yield"() : () -> ()
      }) : (index, index, index) -> ()
      "scf.yield"() : () -> ()
    }) : (index, index, index) -> ()
    %15 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<128x256xf8E8M0FNU>
    "scf.for"(%0, %2, %1) ({
    ^bb0(%arg2: index):
      "scf.for"(%0, %3, %1) ({
      ^bb0(%arg3: index):
        "memref.store"(%9, %15, %arg2, %arg3) : (f8E8M0FNU, memref<128x256xf8E8M0FNU>, index, index) -> ()
        "scf.yield"() : () -> ()
      }) : (index, index, index) -> ()
      "scf.yield"() : () -> ()
    }) : (index, index, index) -> ()
    %16 = "arith.constant"() <{value = 4.096000e+03 : f32}> : () -> f32
    %17 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<256x256xf32>
    "scf.for"(%0, %3, %1) ({
    ^bb0(%arg0: index):
      "scf.for"(%0, %3, %1) ({
      ^bb0(%arg1: index):
        "memref.store"(%16, %17, %arg0, %arg1) : (f32, memref<256x256xf32>, index, index) -> ()
        "scf.yield"() : () -> ()
      }) : (index, index, index) -> ()
      "scf.yield"() : () -> ()
    }) : (index, index, index) -> ()
    %18 = "func.call"(%11, %12, %14, %15, %13) <{callee = @test}> : (memref<256x4096xf4E2M1FN>, memref<2048x256xi8>, memref<256x128xf8E8M0FNU>, memref<128x256xf8E8M0FNU>, memref<256x256xf32>) -> memref<256x256xf32>
    %19 = "memref.cast"(%18) : (memref<256x256xf32>) -> memref<*xf32>
    %20 = "memref.cast"(%17) : (memref<256x256xf32>) -> memref<*xf32>
    %21 = "func.call"(%19, %20) <{callee = @verifyMemRefF32}> : (memref<*xf32>, memref<*xf32>) -> i64
    "func.call"(%21) <{callee = @printI64}> : (i64) -> ()
    "memref.dealloc"(%10) : (memref<524288xi8>) -> ()
    "memref.dealloc"(%12) : (memref<2048x256xi8>) -> ()
    "memref.dealloc"(%14) : (memref<256x128xf8E8M0FNU>) -> ()
    "memref.dealloc"(%15) : (memref<128x256xf8E8M0FNU>) -> ()
    "memref.dealloc"(%13) : (memref<256x256xf32>) -> ()
    "memref.dealloc"(%18) : (memref<256x256xf32>) -> ()
    "func.return"() : () -> ()
  }) {llvm.emit_c_interface} : () -> ()
  "func.func"() <{function_type = (memref<*xf32>, memref<*xf32>) -> i64, sym_name = "verifyMemRefF32", sym_visibility = "private"}> ({
  }) {llvm.emit_c_interface} : () -> ()
  "func.func"() <{function_type = (i64) -> (), sym_name = "printI64", sym_visibility = "private"}> ({
  }) : () -> ()
}) {gpu.container_module} : () -> ()

