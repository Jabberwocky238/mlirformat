"builtin.module"() <{sym_name = "gemm"}> ({
  "gpu.module"() <{sym_name = "kernel"}> ({
    "gpu.func"() <{function_type = (memref<8x32xf8E5M2>, memref<32x16xf8E5M2>, memref<8x16xf32>, memref<8x1xf8E8M0FNU>, memref<1x16xf8E8M0FNU>) -> (), kernel}> ({
    ^bb0(%arg13: memref<8x32xf8E5M2>, %arg14: memref<32x16xf8E5M2>, %arg15: memref<8x16xf32>, %arg16: memref<8x1xf8E8M0FNU>, %arg17: memref<1x16xf8E8M0FNU>):
      %23 = "xegpu.create_nd_tdesc"(%arg13) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (memref<8x32xf8E5M2>) -> !xegpu.tensor_desc<8x32xf8E5M2>
      %24 = "xegpu.load_nd"(%23) <{const_offsets = array<i64: 0, 0>}> : (!xegpu.tensor_desc<8x32xf8E5M2>) -> vector<16xf8E5M2>
      %25 = "xegpu.create_nd_tdesc"(%arg14) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (memref<32x16xf8E5M2>) -> !xegpu.tensor_desc<32x16xf8E5M2>
      %26 = "xegpu.load_nd"(%25) <{const_offsets = array<i64: 0, 0>, packed}> : (!xegpu.tensor_desc<32x16xf8E5M2>) -> vector<32xf8E5M2>
      %27 = "xegpu.create_nd_tdesc"(%arg15) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (memref<8x16xf32>) -> !xegpu.tensor_desc<8x16xf32>
      %28 = "xegpu.load_nd"(%27) <{const_offsets = array<i64: 0, 0>}> : (!xegpu.tensor_desc<8x16xf32>) -> vector<8xf32>
      %29 = "gpu.thread_id"() <{dimension = #gpu<dim x>}> : () -> index
      %30 = "arith.constant"() <{value = 8 : index}> : () -> index
      %31 = "arith.remsi"(%29, %30) : (index, index) -> index
      %32 = "arith.constant"() <{value = 0 : index}> : () -> index
      %33 = "memref.load"(%arg16, %31, %32) : (memref<8x1xf8E8M0FNU>, index, index) -> f8E8M0FNU
      %34 = "arith.constant"() <{value = dense<1.000000e+00> : vector<1xf8E8M0FNU>}> : () -> vector<1xf8E8M0FNU>
      %35 = "vector.insert"(%33, %34, %32) <{static_position = array<i64: -9223372036854775808>}> : (f8E8M0FNU, vector<1xf8E8M0FNU>, index) -> vector<1xf8E8M0FNU>
      %36 = "arith.constant"() <{value = dense<1.000000e+00> : vector<1xf8E8M0FNU>}> : () -> vector<1xf8E8M0FNU>
      %37 = "memref.load"(%arg17, %32, %29) : (memref<1x16xf8E8M0FNU>, index, index) -> f8E8M0FNU
      %38 = "vector.insert"(%37, %36, %32) <{static_position = array<i64: -9223372036854775808>}> : (f8E8M0FNU, vector<1xf8E8M0FNU>, index) -> vector<1xf8E8M0FNU>
      %39 = "xegpu.dpas_mx"(%24, %26, %28, %35, %38) <{operandSegmentSizes = array<i32: 1, 1, 1, 1, 1>}> : (vector<16xf8E5M2>, vector<32xf8E5M2>, vector<8xf32>, vector<1xf8E8M0FNU>, vector<1xf8E8M0FNU>) -> vector<8xf32>
      "xegpu.store_nd"(%39, %27) <{const_offsets = array<i64: 0, 0>}> : (vector<8xf32>, !xegpu.tensor_desc<8x16xf32>) -> ()
      "gpu.return"() : () -> ()
    }) {sym_name = "dpas_mx_bf8"} : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<8x32xf8E5M2>, memref<32x16xf8E5M2>, memref<8x16xf32>, memref<8x1xf8E8M0FNU>, memref<1x16xf8E8M0FNU>) -> memref<8x16xf32>, sym_name = "test"}> ({
  ^bb0(%arg8: memref<8x32xf8E5M2>, %arg9: memref<32x16xf8E5M2>, %arg10: memref<8x16xf32>, %arg11: memref<8x1xf8E8M0FNU>, %arg12: memref<1x16xf8E8M0FNU>):
    %15 = "arith.constant"() <{value = 1 : index}> : () -> index
    %16 = "arith.constant"() <{value = 16 : index}> : () -> index
    %17 = "gpu.alloc"() <{operandSegmentSizes = array<i32: 0, 0, 0>}> : () -> memref<8x32xf8E5M2>
    "gpu.memcpy"(%17, %arg8) : (memref<8x32xf8E5M2>, memref<8x32xf8E5M2>) -> ()
    %18 = "gpu.alloc"() <{operandSegmentSizes = array<i32: 0, 0, 0>}> : () -> memref<32x16xf8E5M2>
    "gpu.memcpy"(%18, %arg9) : (memref<32x16xf8E5M2>, memref<32x16xf8E5M2>) -> ()
    %19 = "gpu.alloc"() <{operandSegmentSizes = array<i32: 0, 0, 0>}> : () -> memref<8x16xf32>
    "gpu.memcpy"(%19, %arg10) : (memref<8x16xf32>, memref<8x16xf32>) -> ()
    %20 = "gpu.alloc"() <{operandSegmentSizes = array<i32: 0, 0, 0>}> : () -> memref<8x1xf8E8M0FNU>
    "gpu.memcpy"(%20, %arg11) : (memref<8x1xf8E8M0FNU>, memref<8x1xf8E8M0FNU>) -> ()
    %21 = "gpu.alloc"() <{operandSegmentSizes = array<i32: 0, 0, 0>}> : () -> memref<1x16xf8E8M0FNU>
    "gpu.memcpy"(%21, %arg12) : (memref<1x16xf8E8M0FNU>, memref<1x16xf8E8M0FNU>) -> ()
    "gpu.launch_func"(%15, %15, %15, %16, %15, %15, %17, %18, %19, %20, %21) <{kernel = @kernel::@dpas_mx_bf8, operandSegmentSizes = array<i32: 0, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 5, 0>}> : (index, index, index, index, index, index, memref<8x32xf8E5M2>, memref<32x16xf8E5M2>, memref<8x16xf32>, memref<8x1xf8E8M0FNU>, memref<1x16xf8E8M0FNU>) -> ()
    "gpu.dealloc"(%17) : (memref<8x32xf8E5M2>) -> ()
    "gpu.dealloc"(%18) : (memref<32x16xf8E5M2>) -> ()
    "gpu.dealloc"(%20) : (memref<8x1xf8E8M0FNU>) -> ()
    "gpu.dealloc"(%21) : (memref<1x16xf8E8M0FNU>) -> ()
    %22 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<8x16xf32>
    "gpu.memcpy"(%22, %19) : (memref<8x16xf32>, memref<8x16xf32>) -> ()
    "gpu.dealloc"(%19) : (memref<8x16xf32>) -> ()
    "func.return"(%22) : (memref<8x16xf32>) -> ()
  }) {llvm.emit_c_interface} : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "main"}> ({
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = 1 : index}> : () -> index
    %2 = "arith.constant"() <{value = 8 : index}> : () -> index
    %3 = "arith.constant"() <{value = 16 : index}> : () -> index
    %4 = "arith.constant"() <{value = 32 : index}> : () -> index
    %5 = "arith.constant"() <{value = 1.000000e+00 : f8E5M2}> : () -> f8E5M2
    %6 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %7 = "arith.constant"() <{value = 1.000000e+00 : f8E8M0FNU}> : () -> f8E8M0FNU
    %8 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<8x32xf8E5M2>
    "scf.for"(%0, %2, %1) ({
    ^bb0(%arg6: index):
      "scf.for"(%0, %4, %1) ({
      ^bb0(%arg7: index):
        "memref.store"(%5, %8, %arg6, %arg7) : (f8E5M2, memref<8x32xf8E5M2>, index, index) -> ()
        "scf.yield"() : () -> ()
      }) : (index, index, index) -> ()
      "scf.yield"() : () -> ()
    }) : (index, index, index) -> ()
    %9 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<32x16xf8E5M2>
    "scf.for"(%0, %4, %1) ({
    ^bb0(%arg4: index):
      "scf.for"(%0, %3, %1) ({
      ^bb0(%arg5: index):
        "memref.store"(%5, %9, %arg4, %arg5) : (f8E5M2, memref<32x16xf8E5M2>, index, index) -> ()
        "scf.yield"() : () -> ()
      }) : (index, index, index) -> ()
      "scf.yield"() : () -> ()
    }) : (index, index, index) -> ()
    %10 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<8x16xf32>
    "scf.for"(%0, %2, %1) ({
    ^bb0(%arg2: index):
      "scf.for"(%0, %3, %1) ({
      ^bb0(%arg3: index):
        "memref.store"(%6, %10, %arg2, %arg3) : (f32, memref<8x16xf32>, index, index) -> ()
        "scf.yield"() : () -> ()
      }) : (index, index, index) -> ()
      "scf.yield"() : () -> ()
    }) : (index, index, index) -> ()
    %11 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<8x1xf8E8M0FNU>
    "scf.for"(%0, %2, %1) ({
    ^bb0(%arg1: index):
      "memref.store"(%7, %11, %arg1, %0) : (f8E8M0FNU, memref<8x1xf8E8M0FNU>, index, index) -> ()
      "scf.yield"() : () -> ()
    }) : (index, index, index) -> ()
    %12 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<1x16xf8E8M0FNU>
    "scf.for"(%0, %3, %1) ({
    ^bb0(%arg0: index):
      "memref.store"(%7, %12, %0, %arg0) : (f8E8M0FNU, memref<1x16xf8E8M0FNU>, index, index) -> ()
      "scf.yield"() : () -> ()
    }) : (index, index, index) -> ()
    %13 = "func.call"(%8, %9, %10, %11, %12) <{callee = @test}> : (memref<8x32xf8E5M2>, memref<32x16xf8E5M2>, memref<8x16xf32>, memref<8x1xf8E8M0FNU>, memref<1x16xf8E8M0FNU>) -> memref<8x16xf32>
    %14 = "memref.cast"(%13) : (memref<8x16xf32>) -> memref<*xf32>
    "func.call"(%14) <{callee = @printMemrefF32}> : (memref<*xf32>) -> ()
    "memref.dealloc"(%8) : (memref<8x32xf8E5M2>) -> ()
    "memref.dealloc"(%9) : (memref<32x16xf8E5M2>) -> ()
    "memref.dealloc"(%10) : (memref<8x16xf32>) -> ()
    "memref.dealloc"(%11) : (memref<8x1xf8E8M0FNU>) -> ()
    "memref.dealloc"(%12) : (memref<1x16xf8E8M0FNU>) -> ()
    "memref.dealloc"(%13) : (memref<8x16xf32>) -> ()
    "func.return"() : () -> ()
  }) {llvm.emit_c_interface} : () -> ()
  "func.func"() <{function_type = (memref<*xf32>) -> (), sym_name = "printMemrefF32", sym_visibility = "private"}> ({
  }) {llvm.emit_c_interface} : () -> ()
}) {gpu.container_module} : () -> ()

