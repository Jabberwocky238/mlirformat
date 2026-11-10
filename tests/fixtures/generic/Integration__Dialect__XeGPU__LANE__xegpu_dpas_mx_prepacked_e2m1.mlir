"builtin.module"() <{sym_name = "gemm"}> ({
  "gpu.module"() <{sym_name = "kernel"}> ({
    "gpu.func"() <{function_type = (memref<8x64xf4E2M1FN>, memref<32x16xi8>, memref<8x16xf32>, memref<8x2xf8E8M0FNU>, memref<2x16xf8E8M0FNU>) -> (), kernel}> ({
    ^bb0(%arg14: memref<8x64xf4E2M1FN>, %arg15: memref<32x16xi8>, %arg16: memref<8x16xf32>, %arg17: memref<8x2xf8E8M0FNU>, %arg18: memref<2x16xf8E8M0FNU>):
      %27 = "xegpu.create_nd_tdesc"(%arg14) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (memref<8x64xf4E2M1FN>) -> !xegpu.tensor_desc<8x64xf4E2M1FN>
      %28 = "xegpu.load_nd"(%27) <{const_offsets = array<i64: 0, 0>}> : (!xegpu.tensor_desc<8x64xf4E2M1FN>) -> vector<32xf4E2M1FN>
      %29 = "xegpu.create_nd_tdesc"(%arg15) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (memref<32x16xi8>) -> !xegpu.tensor_desc<32x16xi8>
      %30 = "xegpu.load_nd"(%29) <{const_offsets = array<i64: 0, 0>, packed}> : (!xegpu.tensor_desc<32x16xi8>) -> vector<32xi8>
      %31 = "vector.bitcast"(%30) : (vector<32xi8>) -> vector<64xf4E2M1FN>
      %32 = "xegpu.create_nd_tdesc"(%arg16) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (memref<8x16xf32>) -> !xegpu.tensor_desc<8x16xf32>
      %33 = "xegpu.load_nd"(%32) <{const_offsets = array<i64: 0, 0>}> : (!xegpu.tensor_desc<8x16xf32>) -> vector<8xf32>
      %34 = "gpu.thread_id"() <{dimension = #gpu<dim x>}> : () -> index
      %35 = "arith.constant"() <{value = 8 : index}> : () -> index
      %36 = "arith.remsi"(%34, %35) : (index, index) -> index
      %37 = "arith.constant"() <{value = 0 : index}> : () -> index
      %38 = "arith.constant"() <{value = 1 : index}> : () -> index
      %39 = "memref.load"(%arg17, %36, %37) : (memref<8x2xf8E8M0FNU>, index, index) -> f8E8M0FNU
      %40 = "memref.load"(%arg17, %36, %38) : (memref<8x2xf8E8M0FNU>, index, index) -> f8E8M0FNU
      %41 = "arith.constant"() <{value = dense<1.000000e+00> : vector<2xf8E8M0FNU>}> : () -> vector<2xf8E8M0FNU>
      %42 = "vector.insert"(%39, %41, %37) <{static_position = array<i64: -9223372036854775808>}> : (f8E8M0FNU, vector<2xf8E8M0FNU>, index) -> vector<2xf8E8M0FNU>
      %43 = "vector.insert"(%40, %42, %38) <{static_position = array<i64: -9223372036854775808>}> : (f8E8M0FNU, vector<2xf8E8M0FNU>, index) -> vector<2xf8E8M0FNU>
      %44 = "arith.constant"() <{value = dense<1.000000e+00> : vector<2xf8E8M0FNU>}> : () -> vector<2xf8E8M0FNU>
      %45 = "memref.load"(%arg18, %37, %34) : (memref<2x16xf8E8M0FNU>, index, index) -> f8E8M0FNU
      %46 = "memref.load"(%arg18, %38, %34) : (memref<2x16xf8E8M0FNU>, index, index) -> f8E8M0FNU
      %47 = "vector.insert"(%45, %44, %37) <{static_position = array<i64: -9223372036854775808>}> : (f8E8M0FNU, vector<2xf8E8M0FNU>, index) -> vector<2xf8E8M0FNU>
      %48 = "vector.insert"(%46, %47, %38) <{static_position = array<i64: -9223372036854775808>}> : (f8E8M0FNU, vector<2xf8E8M0FNU>, index) -> vector<2xf8E8M0FNU>
      %49 = "xegpu.dpas_mx"(%28, %31, %33, %43, %48) <{operandSegmentSizes = array<i32: 1, 1, 1, 1, 1>}> : (vector<32xf4E2M1FN>, vector<64xf4E2M1FN>, vector<8xf32>, vector<2xf8E8M0FNU>, vector<2xf8E8M0FNU>) -> vector<8xf32>
      "xegpu.store_nd"(%49, %32) <{const_offsets = array<i64: 0, 0>}> : (vector<8xf32>, !xegpu.tensor_desc<8x16xf32>) -> ()
      "gpu.return"() : () -> ()
    }) {sym_name = "dpas_mx_e2m1"} : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<8x64xf4E2M1FN>, memref<32x16xi8>, memref<8x16xf32>, memref<8x2xf8E8M0FNU>, memref<2x16xf8E8M0FNU>) -> memref<8x16xf32>, sym_name = "test"}> ({
  ^bb0(%arg9: memref<8x64xf4E2M1FN>, %arg10: memref<32x16xi8>, %arg11: memref<8x16xf32>, %arg12: memref<8x2xf8E8M0FNU>, %arg13: memref<2x16xf8E8M0FNU>):
    %19 = "arith.constant"() <{value = 1 : index}> : () -> index
    %20 = "arith.constant"() <{value = 16 : index}> : () -> index
    %21 = "gpu.alloc"() <{operandSegmentSizes = array<i32: 0, 0, 0>}> : () -> memref<8x64xf4E2M1FN>
    "gpu.memcpy"(%21, %arg9) : (memref<8x64xf4E2M1FN>, memref<8x64xf4E2M1FN>) -> ()
    %22 = "gpu.alloc"() <{operandSegmentSizes = array<i32: 0, 0, 0>}> : () -> memref<32x16xi8>
    "gpu.memcpy"(%22, %arg10) : (memref<32x16xi8>, memref<32x16xi8>) -> ()
    %23 = "gpu.alloc"() <{operandSegmentSizes = array<i32: 0, 0, 0>}> : () -> memref<8x16xf32>
    "gpu.memcpy"(%23, %arg11) : (memref<8x16xf32>, memref<8x16xf32>) -> ()
    %24 = "gpu.alloc"() <{operandSegmentSizes = array<i32: 0, 0, 0>}> : () -> memref<8x2xf8E8M0FNU>
    "gpu.memcpy"(%24, %arg12) : (memref<8x2xf8E8M0FNU>, memref<8x2xf8E8M0FNU>) -> ()
    %25 = "gpu.alloc"() <{operandSegmentSizes = array<i32: 0, 0, 0>}> : () -> memref<2x16xf8E8M0FNU>
    "gpu.memcpy"(%25, %arg13) : (memref<2x16xf8E8M0FNU>, memref<2x16xf8E8M0FNU>) -> ()
    "gpu.launch_func"(%19, %19, %19, %20, %19, %19, %21, %22, %23, %24, %25) <{kernel = @kernel::@dpas_mx_e2m1, operandSegmentSizes = array<i32: 0, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 5, 0>}> : (index, index, index, index, index, index, memref<8x64xf4E2M1FN>, memref<32x16xi8>, memref<8x16xf32>, memref<8x2xf8E8M0FNU>, memref<2x16xf8E8M0FNU>) -> ()
    "gpu.dealloc"(%21) : (memref<8x64xf4E2M1FN>) -> ()
    "gpu.dealloc"(%22) : (memref<32x16xi8>) -> ()
    "gpu.dealloc"(%24) : (memref<8x2xf8E8M0FNU>) -> ()
    "gpu.dealloc"(%25) : (memref<2x16xf8E8M0FNU>) -> ()
    %26 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<8x16xf32>
    "gpu.memcpy"(%26, %23) : (memref<8x16xf32>, memref<8x16xf32>) -> ()
    "gpu.dealloc"(%23) : (memref<8x16xf32>) -> ()
    "func.return"(%26) : (memref<8x16xf32>) -> ()
  }) {llvm.emit_c_interface} : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "main"}> ({
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = 1 : index}> : () -> index
    %2 = "arith.constant"() <{value = 2 : index}> : () -> index
    %3 = "arith.constant"() <{value = 8 : index}> : () -> index
    %4 = "arith.constant"() <{value = 16 : index}> : () -> index
    %5 = "arith.constant"() <{value = 32 : index}> : () -> index
    %6 = "arith.constant"() <{value = 256 : index}> : () -> index
    %7 = "arith.constant"() <{value = 1.000000e+00 : f4E2M1FN}> : () -> f4E2M1FN
    %8 = "arith.constant"() <{value = 34 : i8}> : () -> i8
    %9 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %10 = "arith.constant"() <{value = 1.000000e+00 : f8E8M0FNU}> : () -> f8E8M0FNU
    %11 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<256xi8>
    %12 = "memref.view"(%11, %0) : (memref<256xi8>, index) -> memref<8x64xf4E2M1FN>
    "scf.for"(%0, %6, %1) ({
    ^bb0(%arg8: index):
      "memref.store"(%8, %11, %arg8) : (i8, memref<256xi8>, index) -> ()
      "scf.yield"() : () -> ()
    }) : (index, index, index) -> ()
    %13 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<32x16xi8>
    "scf.for"(%0, %5, %1) ({
    ^bb0(%arg6: index):
      "scf.for"(%0, %4, %1) ({
      ^bb0(%arg7: index):
        "memref.store"(%8, %13, %arg6, %arg7) : (i8, memref<32x16xi8>, index, index) -> ()
        "scf.yield"() : () -> ()
      }) : (index, index, index) -> ()
      "scf.yield"() : () -> ()
    }) : (index, index, index) -> ()
    %14 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<8x16xf32>
    "scf.for"(%0, %3, %1) ({
    ^bb0(%arg4: index):
      "scf.for"(%0, %4, %1) ({
      ^bb0(%arg5: index):
        "memref.store"(%9, %14, %arg4, %arg5) : (f32, memref<8x16xf32>, index, index) -> ()
        "scf.yield"() : () -> ()
      }) : (index, index, index) -> ()
      "scf.yield"() : () -> ()
    }) : (index, index, index) -> ()
    %15 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<8x2xf8E8M0FNU>
    "scf.for"(%0, %3, %1) ({
    ^bb0(%arg2: index):
      "scf.for"(%0, %2, %1) ({
      ^bb0(%arg3: index):
        "memref.store"(%10, %15, %arg2, %arg3) : (f8E8M0FNU, memref<8x2xf8E8M0FNU>, index, index) -> ()
        "scf.yield"() : () -> ()
      }) : (index, index, index) -> ()
      "scf.yield"() : () -> ()
    }) : (index, index, index) -> ()
    %16 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<2x16xf8E8M0FNU>
    "scf.for"(%0, %2, %1) ({
    ^bb0(%arg0: index):
      "scf.for"(%0, %4, %1) ({
      ^bb0(%arg1: index):
        "memref.store"(%10, %16, %arg0, %arg1) : (f8E8M0FNU, memref<2x16xf8E8M0FNU>, index, index) -> ()
        "scf.yield"() : () -> ()
      }) : (index, index, index) -> ()
      "scf.yield"() : () -> ()
    }) : (index, index, index) -> ()
    %17 = "func.call"(%12, %13, %14, %15, %16) <{callee = @test}> : (memref<8x64xf4E2M1FN>, memref<32x16xi8>, memref<8x16xf32>, memref<8x2xf8E8M0FNU>, memref<2x16xf8E8M0FNU>) -> memref<8x16xf32>
    %18 = "memref.cast"(%17) : (memref<8x16xf32>) -> memref<*xf32>
    "func.call"(%18) <{callee = @printMemrefF32}> : (memref<*xf32>) -> ()
    "memref.dealloc"(%11) : (memref<256xi8>) -> ()
    "memref.dealloc"(%13) : (memref<32x16xi8>) -> ()
    "memref.dealloc"(%14) : (memref<8x16xf32>) -> ()
    "memref.dealloc"(%15) : (memref<8x2xf8E8M0FNU>) -> ()
    "memref.dealloc"(%16) : (memref<2x16xf8E8M0FNU>) -> ()
    "memref.dealloc"(%17) : (memref<8x16xf32>) -> ()
    "func.return"() : () -> ()
  }) {llvm.emit_c_interface} : () -> ()
  "func.func"() <{function_type = (memref<*xf32>) -> (), sym_name = "printMemrefF32", sym_visibility = "private"}> ({
  }) {llvm.emit_c_interface} : () -> ()
}) {gpu.container_module} : () -> ()

