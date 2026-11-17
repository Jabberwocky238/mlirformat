"builtin.module"() <{sym_name = "gemm"}> ({
  "gpu.module"() <{sym_name = "kernel"}> ({
    "gpu.func"() <{function_type = (memref<8x32xf8E5M2>, memref<32x16xf8E5M2>, memref<8x16xf32>, memref<8x1xf8E8M0FNU>, memref<1x16xf8E8M0FNU>) -> (), kernel}> ({
    ^bb0(%arg13: memref<8x32xf8E5M2> loc("<stdin>":4:10), %arg14: memref<32x16xf8E5M2> loc("<stdin>":4:39), %arg15: memref<8x16xf32> loc("<stdin>":4:69), %arg16: memref<8x1xf8E8M0FNU> loc("<stdin>":4:95), %arg17: memref<1x16xf8E8M0FNU> loc("<stdin>":4:126)):
      %23 = "xegpu.create_nd_tdesc"(%arg13) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (memref<8x32xf8E5M2>) -> !xegpu.tensor_desc<8x32xf8E5M2> loc("<stdin>":5:13)
      %24 = "xegpu.load_nd"(%23) <{const_offsets = array<i64: 0, 0>}> : (!xegpu.tensor_desc<8x32xf8E5M2>) -> vector<16xf8E5M2> loc("<stdin>":6:13)
      %25 = "xegpu.create_nd_tdesc"(%arg14) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (memref<32x16xf8E5M2>) -> !xegpu.tensor_desc<32x16xf8E5M2> loc("<stdin>":7:13)
      %26 = "xegpu.load_nd"(%25) <{const_offsets = array<i64: 0, 0>, packed}> : (!xegpu.tensor_desc<32x16xf8E5M2>) -> vector<32xf8E5M2> loc("<stdin>":8:13)
      %27 = "xegpu.create_nd_tdesc"(%arg15) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (memref<8x16xf32>) -> !xegpu.tensor_desc<8x16xf32> loc("<stdin>":9:13)
      %28 = "xegpu.load_nd"(%27) <{const_offsets = array<i64: 0, 0>}> : (!xegpu.tensor_desc<8x16xf32>) -> vector<8xf32> loc("<stdin>":10:13)
      %29 = "gpu.thread_id"() <{dimension = #gpu<dim x>}> : () -> index loc("<stdin>":11:13)
      %30 = "arith.constant"() <{value = 8 : index}> : () -> index loc("<stdin>":12:13)
      %31 = "arith.remsi"(%29, %30) : (index, index) -> index loc("<stdin>":13:13)
      %32 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":14:13)
      %33 = "memref.load"(%arg16, %31, %32) : (memref<8x1xf8E8M0FNU>, index, index) -> f8E8M0FNU loc("<stdin>":15:13)
      %34 = "arith.constant"() <{value = dense<1.000000e+00> : vector<1xf8E8M0FNU>}> : () -> vector<1xf8E8M0FNU> loc("<stdin>":16:13)
      %35 = "vector.insert"(%33, %34, %32) <{static_position = array<i64: -9223372036854775808>}> : (f8E8M0FNU, vector<1xf8E8M0FNU>, index) -> vector<1xf8E8M0FNU> loc("<stdin>":17:13)
      %36 = "arith.constant"() <{value = dense<1.000000e+00> : vector<1xf8E8M0FNU>}> : () -> vector<1xf8E8M0FNU> loc("<stdin>":18:13)
      %37 = "memref.load"(%arg17, %32, %29) : (memref<1x16xf8E8M0FNU>, index, index) -> f8E8M0FNU loc("<stdin>":19:13)
      %38 = "vector.insert"(%37, %36, %32) <{static_position = array<i64: -9223372036854775808>}> : (f8E8M0FNU, vector<1xf8E8M0FNU>, index) -> vector<1xf8E8M0FNU> loc("<stdin>":20:13)
      %39 = "xegpu.dpas_mx"(%24, %26, %28, %35, %38) <{operandSegmentSizes = array<i32: 1, 1, 1, 1, 1>}> : (vector<16xf8E5M2>, vector<32xf8E5M2>, vector<8xf32>, vector<1xf8E8M0FNU>, vector<1xf8E8M0FNU>) -> vector<8xf32> loc("<stdin>":21:13)
      "xegpu.store_nd"(%39, %27) <{const_offsets = array<i64: 0, 0>}> : (vector<8xf32>, !xegpu.tensor_desc<8x16xf32>) -> () loc("<stdin>":22:7)
      "gpu.return"() : () -> () loc("<stdin>":23:7)
    }) {sym_name = "dpas_mx_bf8"} : () -> () loc("<stdin>":3:5)
  }) : () -> () loc("<stdin>":2:3)
  "func.func"() <{function_type = (memref<8x32xf8E5M2>, memref<32x16xf8E5M2>, memref<8x16xf32>, memref<8x1xf8E8M0FNU>, memref<1x16xf8E8M0FNU>) -> memref<8x16xf32>, sym_name = "test"}> ({
  ^bb0(%arg8: memref<8x32xf8E5M2> loc("<stdin>":27:8), %arg9: memref<32x16xf8E5M2> loc("<stdin>":27:36), %arg10: memref<8x16xf32> loc("<stdin>":27:65), %arg11: memref<8x1xf8E8M0FNU> loc("<stdin>":27:91), %arg12: memref<1x16xf8E8M0FNU> loc("<stdin>":27:122)):
    %15 = "arith.constant"() <{value = 1 : index}> : () -> index loc("<stdin>":28:11)
    %16 = "arith.constant"() <{value = 16 : index}> : () -> index loc("<stdin>":29:11)
    %17 = "gpu.alloc"() <{operandSegmentSizes = array<i32: 0, 0, 0>}> : () -> memref<8x32xf8E5M2> loc("<stdin>":30:11)
    "gpu.memcpy"(%17, %arg8) : (memref<8x32xf8E5M2>, memref<8x32xf8E5M2>) -> () loc("<stdin>":31:5)
    %18 = "gpu.alloc"() <{operandSegmentSizes = array<i32: 0, 0, 0>}> : () -> memref<32x16xf8E5M2> loc("<stdin>":32:11)
    "gpu.memcpy"(%18, %arg9) : (memref<32x16xf8E5M2>, memref<32x16xf8E5M2>) -> () loc("<stdin>":33:5)
    %19 = "gpu.alloc"() <{operandSegmentSizes = array<i32: 0, 0, 0>}> : () -> memref<8x16xf32> loc("<stdin>":34:11)
    "gpu.memcpy"(%19, %arg10) : (memref<8x16xf32>, memref<8x16xf32>) -> () loc("<stdin>":35:5)
    %20 = "gpu.alloc"() <{operandSegmentSizes = array<i32: 0, 0, 0>}> : () -> memref<8x1xf8E8M0FNU> loc("<stdin>":36:11)
    "gpu.memcpy"(%20, %arg11) : (memref<8x1xf8E8M0FNU>, memref<8x1xf8E8M0FNU>) -> () loc("<stdin>":37:5)
    %21 = "gpu.alloc"() <{operandSegmentSizes = array<i32: 0, 0, 0>}> : () -> memref<1x16xf8E8M0FNU> loc("<stdin>":38:11)
    "gpu.memcpy"(%21, %arg12) : (memref<1x16xf8E8M0FNU>, memref<1x16xf8E8M0FNU>) -> () loc("<stdin>":39:5)
    "gpu.launch_func"(%15, %15, %15, %16, %15, %15, %17, %18, %19, %20, %21) <{kernel = @kernel::@dpas_mx_bf8, operandSegmentSizes = array<i32: 0, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 5, 0>}> : (index, index, index, index, index, index, memref<8x32xf8E5M2>, memref<32x16xf8E5M2>, memref<8x16xf32>, memref<8x1xf8E8M0FNU>, memref<1x16xf8E8M0FNU>) -> () loc("<stdin>":40:5)
    "gpu.dealloc"(%17) : (memref<8x32xf8E5M2>) -> () loc("<stdin>":41:5)
    "gpu.dealloc"(%18) : (memref<32x16xf8E5M2>) -> () loc("<stdin>":42:5)
    "gpu.dealloc"(%20) : (memref<8x1xf8E8M0FNU>) -> () loc("<stdin>":43:5)
    "gpu.dealloc"(%21) : (memref<1x16xf8E8M0FNU>) -> () loc("<stdin>":44:5)
    %22 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<8x16xf32> loc("<stdin>":45:11)
    "gpu.memcpy"(%22, %19) : (memref<8x16xf32>, memref<8x16xf32>) -> () loc("<stdin>":46:5)
    "gpu.dealloc"(%19) : (memref<8x16xf32>) -> () loc("<stdin>":47:5)
    "func.return"(%22) : (memref<8x16xf32>) -> () loc("<stdin>":48:5)
  }) {llvm.emit_c_interface} : () -> () loc("<stdin>":26:3)
  "func.func"() <{function_type = () -> (), sym_name = "main"}> ({
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":51:10)
    %1 = "arith.constant"() <{value = 1 : index}> : () -> index loc("<stdin>":52:10)
    %2 = "arith.constant"() <{value = 8 : index}> : () -> index loc("<stdin>":53:10)
    %3 = "arith.constant"() <{value = 16 : index}> : () -> index loc("<stdin>":54:10)
    %4 = "arith.constant"() <{value = 32 : index}> : () -> index loc("<stdin>":55:10)
    %5 = "arith.constant"() <{value = 1.000000e+00 : f8E5M2}> : () -> f8E5M2 loc("<stdin>":56:10)
    %6 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32 loc("<stdin>":57:10)
    %7 = "arith.constant"() <{value = 1.000000e+00 : f8E8M0FNU}> : () -> f8E8M0FNU loc("<stdin>":58:10)
    %8 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<8x32xf8E5M2> loc("<stdin>":59:10)
    "scf.for"(%0, %2, %1) ({
    ^bb0(%arg6: index loc("<stdin>":61:10)):
      "scf.for"(%0, %4, %1) ({
      ^bb0(%arg7: index loc("<stdin>":63:12)):
        "memref.store"(%5, %8, %arg6, %arg7) : (f8E5M2, memref<8x32xf8E5M2>, index, index) -> () loc("<stdin>":64:9)
        "scf.yield"() : () -> () loc("<stdin>":65:9)
      }) : (index, index, index) -> () loc("<stdin>":62:7)
      "scf.yield"() : () -> () loc("<stdin>":67:7)
    }) : (index, index, index) -> () loc("<stdin>":60:5)
    %9 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<32x16xf8E5M2> loc("<stdin>":69:10)
    "scf.for"(%0, %4, %1) ({
    ^bb0(%arg4: index loc("<stdin>":71:10)):
      "scf.for"(%0, %3, %1) ({
      ^bb0(%arg5: index loc("<stdin>":73:12)):
        "memref.store"(%5, %9, %arg4, %arg5) : (f8E5M2, memref<32x16xf8E5M2>, index, index) -> () loc("<stdin>":74:9)
        "scf.yield"() : () -> () loc("<stdin>":75:9)
      }) : (index, index, index) -> () loc("<stdin>":72:7)
      "scf.yield"() : () -> () loc("<stdin>":77:7)
    }) : (index, index, index) -> () loc("<stdin>":70:5)
    %10 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<8x16xf32> loc("<stdin>":79:11)
    "scf.for"(%0, %2, %1) ({
    ^bb0(%arg2: index loc("<stdin>":81:10)):
      "scf.for"(%0, %3, %1) ({
      ^bb0(%arg3: index loc("<stdin>":83:12)):
        "memref.store"(%6, %10, %arg2, %arg3) : (f32, memref<8x16xf32>, index, index) -> () loc("<stdin>":84:9)
        "scf.yield"() : () -> () loc("<stdin>":85:9)
      }) : (index, index, index) -> () loc("<stdin>":82:7)
      "scf.yield"() : () -> () loc("<stdin>":87:7)
    }) : (index, index, index) -> () loc("<stdin>":80:5)
    %11 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<8x1xf8E8M0FNU> loc("<stdin>":89:11)
    "scf.for"(%0, %2, %1) ({
    ^bb0(%arg1: index loc("<stdin>":91:10)):
      "memref.store"(%7, %11, %arg1, %0) : (f8E8M0FNU, memref<8x1xf8E8M0FNU>, index, index) -> () loc("<stdin>":92:7)
      "scf.yield"() : () -> () loc("<stdin>":93:7)
    }) : (index, index, index) -> () loc("<stdin>":90:5)
    %12 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<1x16xf8E8M0FNU> loc("<stdin>":95:11)
    "scf.for"(%0, %3, %1) ({
    ^bb0(%arg0: index loc("<stdin>":97:10)):
      "memref.store"(%7, %12, %0, %arg0) : (f8E8M0FNU, memref<1x16xf8E8M0FNU>, index, index) -> () loc("<stdin>":98:7)
      "scf.yield"() : () -> () loc("<stdin>":99:7)
    }) : (index, index, index) -> () loc("<stdin>":96:5)
    %13 = "func.call"(%8, %9, %10, %11, %12) <{callee = @test}> : (memref<8x32xf8E5M2>, memref<32x16xf8E5M2>, memref<8x16xf32>, memref<8x1xf8E8M0FNU>, memref<1x16xf8E8M0FNU>) -> memref<8x16xf32> loc("<stdin>":101:11)
    %14 = "memref.cast"(%13) : (memref<8x16xf32>) -> memref<*xf32> loc("<stdin>":102:11)
    "func.call"(%14) <{callee = @printMemrefF32}> : (memref<*xf32>) -> () loc("<stdin>":103:5)
    "memref.dealloc"(%8) : (memref<8x32xf8E5M2>) -> () loc("<stdin>":104:5)
    "memref.dealloc"(%9) : (memref<32x16xf8E5M2>) -> () loc("<stdin>":105:5)
    "memref.dealloc"(%10) : (memref<8x16xf32>) -> () loc("<stdin>":106:5)
    "memref.dealloc"(%11) : (memref<8x1xf8E8M0FNU>) -> () loc("<stdin>":107:5)
    "memref.dealloc"(%12) : (memref<1x16xf8E8M0FNU>) -> () loc("<stdin>":108:5)
    "memref.dealloc"(%13) : (memref<8x16xf32>) -> () loc("<stdin>":109:5)
    "func.return"() : () -> () loc("<stdin>":110:5)
  }) {llvm.emit_c_interface} : () -> () loc("<stdin>":50:3)
  "func.func"() <{function_type = (memref<*xf32>) -> (), sym_name = "printMemrefF32", sym_visibility = "private"}> ({
  }) {llvm.emit_c_interface} : () -> () loc("<stdin>":112:3)
}) {gpu.container_module} : () -> () loc("<stdin>":1:1)
