"builtin.module"() <{sym_name = "gemm"}> ({
  "gpu.module"() <{sym_name = "kernel"}> ({
    "gpu.func"() <{function_type = (memref<8x64xf4E2M1FN>, memref<32x16xi8>, memref<8x16xf32>, memref<8x2xf8E8M0FNU>, memref<2x16xf8E8M0FNU>) -> (), kernel}> ({
    ^bb0(%arg14: memref<8x64xf4E2M1FN> loc("<stdin>":4:10), %arg15: memref<32x16xi8> loc("<stdin>":4:41), %arg16: memref<8x16xf32> loc("<stdin>":4:67), %arg17: memref<8x2xf8E8M0FNU> loc("<stdin>":4:93), %arg18: memref<2x16xf8E8M0FNU> loc("<stdin>":4:124)):
      %27 = "xegpu.create_nd_tdesc"(%arg14) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (memref<8x64xf4E2M1FN>) -> !xegpu.tensor_desc<8x64xf4E2M1FN> loc("<stdin>":5:13)
      %28 = "xegpu.load_nd"(%27) <{const_offsets = array<i64: 0, 0>}> : (!xegpu.tensor_desc<8x64xf4E2M1FN>) -> vector<32xf4E2M1FN> loc("<stdin>":6:13)
      %29 = "xegpu.create_nd_tdesc"(%arg15) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (memref<32x16xi8>) -> !xegpu.tensor_desc<32x16xi8> loc("<stdin>":7:13)
      %30 = "xegpu.load_nd"(%29) <{const_offsets = array<i64: 0, 0>, packed}> : (!xegpu.tensor_desc<32x16xi8>) -> vector<32xi8> loc("<stdin>":8:13)
      %31 = "vector.bitcast"(%30) : (vector<32xi8>) -> vector<64xf4E2M1FN> loc("<stdin>":9:13)
      %32 = "xegpu.create_nd_tdesc"(%arg16) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (memref<8x16xf32>) -> !xegpu.tensor_desc<8x16xf32> loc("<stdin>":10:13)
      %33 = "xegpu.load_nd"(%32) <{const_offsets = array<i64: 0, 0>}> : (!xegpu.tensor_desc<8x16xf32>) -> vector<8xf32> loc("<stdin>":11:13)
      %34 = "gpu.thread_id"() <{dimension = #gpu<dim x>}> : () -> index loc("<stdin>":12:13)
      %35 = "arith.constant"() <{value = 8 : index}> : () -> index loc("<stdin>":13:13)
      %36 = "arith.remsi"(%34, %35) : (index, index) -> index loc("<stdin>":14:13)
      %37 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":15:13)
      %38 = "arith.constant"() <{value = 1 : index}> : () -> index loc("<stdin>":16:13)
      %39 = "memref.load"(%arg17, %36, %37) : (memref<8x2xf8E8M0FNU>, index, index) -> f8E8M0FNU loc("<stdin>":17:13)
      %40 = "memref.load"(%arg17, %36, %38) : (memref<8x2xf8E8M0FNU>, index, index) -> f8E8M0FNU loc("<stdin>":18:13)
      %41 = "arith.constant"() <{value = dense<1.000000e+00> : vector<2xf8E8M0FNU>}> : () -> vector<2xf8E8M0FNU> loc("<stdin>":19:13)
      %42 = "vector.insert"(%39, %41, %37) <{static_position = array<i64: -9223372036854775808>}> : (f8E8M0FNU, vector<2xf8E8M0FNU>, index) -> vector<2xf8E8M0FNU> loc("<stdin>":20:13)
      %43 = "vector.insert"(%40, %42, %38) <{static_position = array<i64: -9223372036854775808>}> : (f8E8M0FNU, vector<2xf8E8M0FNU>, index) -> vector<2xf8E8M0FNU> loc("<stdin>":21:13)
      %44 = "arith.constant"() <{value = dense<1.000000e+00> : vector<2xf8E8M0FNU>}> : () -> vector<2xf8E8M0FNU> loc("<stdin>":22:13)
      %45 = "memref.load"(%arg18, %37, %34) : (memref<2x16xf8E8M0FNU>, index, index) -> f8E8M0FNU loc("<stdin>":23:13)
      %46 = "memref.load"(%arg18, %38, %34) : (memref<2x16xf8E8M0FNU>, index, index) -> f8E8M0FNU loc("<stdin>":24:13)
      %47 = "vector.insert"(%45, %44, %37) <{static_position = array<i64: -9223372036854775808>}> : (f8E8M0FNU, vector<2xf8E8M0FNU>, index) -> vector<2xf8E8M0FNU> loc("<stdin>":25:13)
      %48 = "vector.insert"(%46, %47, %38) <{static_position = array<i64: -9223372036854775808>}> : (f8E8M0FNU, vector<2xf8E8M0FNU>, index) -> vector<2xf8E8M0FNU> loc("<stdin>":26:13)
      %49 = "xegpu.dpas_mx"(%28, %31, %33, %43, %48) <{operandSegmentSizes = array<i32: 1, 1, 1, 1, 1>}> : (vector<32xf4E2M1FN>, vector<64xf4E2M1FN>, vector<8xf32>, vector<2xf8E8M0FNU>, vector<2xf8E8M0FNU>) -> vector<8xf32> loc("<stdin>":27:13)
      "xegpu.store_nd"(%49, %32) <{const_offsets = array<i64: 0, 0>}> : (vector<8xf32>, !xegpu.tensor_desc<8x16xf32>) -> () loc("<stdin>":28:7)
      "gpu.return"() : () -> () loc("<stdin>":29:7)
    }) {sym_name = "dpas_mx_e2m1"} : () -> () loc("<stdin>":3:5)
  }) : () -> () loc("<stdin>":2:3)
  "func.func"() <{function_type = (memref<8x64xf4E2M1FN>, memref<32x16xi8>, memref<8x16xf32>, memref<8x2xf8E8M0FNU>, memref<2x16xf8E8M0FNU>) -> memref<8x16xf32>, sym_name = "test"}> ({
  ^bb0(%arg9: memref<8x64xf4E2M1FN> loc("<stdin>":33:8), %arg10: memref<32x16xi8> loc("<stdin>":33:38), %arg11: memref<8x16xf32> loc("<stdin>":33:64), %arg12: memref<8x2xf8E8M0FNU> loc("<stdin>":33:90), %arg13: memref<2x16xf8E8M0FNU> loc("<stdin>":33:121)):
    %19 = "arith.constant"() <{value = 1 : index}> : () -> index loc("<stdin>":34:11)
    %20 = "arith.constant"() <{value = 16 : index}> : () -> index loc("<stdin>":35:11)
    %21 = "gpu.alloc"() <{operandSegmentSizes = array<i32: 0, 0, 0>}> : () -> memref<8x64xf4E2M1FN> loc("<stdin>":36:11)
    "gpu.memcpy"(%21, %arg9) : (memref<8x64xf4E2M1FN>, memref<8x64xf4E2M1FN>) -> () loc("<stdin>":37:5)
    %22 = "gpu.alloc"() <{operandSegmentSizes = array<i32: 0, 0, 0>}> : () -> memref<32x16xi8> loc("<stdin>":38:11)
    "gpu.memcpy"(%22, %arg10) : (memref<32x16xi8>, memref<32x16xi8>) -> () loc("<stdin>":39:5)
    %23 = "gpu.alloc"() <{operandSegmentSizes = array<i32: 0, 0, 0>}> : () -> memref<8x16xf32> loc("<stdin>":40:11)
    "gpu.memcpy"(%23, %arg11) : (memref<8x16xf32>, memref<8x16xf32>) -> () loc("<stdin>":41:5)
    %24 = "gpu.alloc"() <{operandSegmentSizes = array<i32: 0, 0, 0>}> : () -> memref<8x2xf8E8M0FNU> loc("<stdin>":42:11)
    "gpu.memcpy"(%24, %arg12) : (memref<8x2xf8E8M0FNU>, memref<8x2xf8E8M0FNU>) -> () loc("<stdin>":43:5)
    %25 = "gpu.alloc"() <{operandSegmentSizes = array<i32: 0, 0, 0>}> : () -> memref<2x16xf8E8M0FNU> loc("<stdin>":44:11)
    "gpu.memcpy"(%25, %arg13) : (memref<2x16xf8E8M0FNU>, memref<2x16xf8E8M0FNU>) -> () loc("<stdin>":45:5)
    "gpu.launch_func"(%19, %19, %19, %20, %19, %19, %21, %22, %23, %24, %25) <{kernel = @kernel::@dpas_mx_e2m1, operandSegmentSizes = array<i32: 0, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 5, 0>}> : (index, index, index, index, index, index, memref<8x64xf4E2M1FN>, memref<32x16xi8>, memref<8x16xf32>, memref<8x2xf8E8M0FNU>, memref<2x16xf8E8M0FNU>) -> () loc("<stdin>":46:5)
    "gpu.dealloc"(%21) : (memref<8x64xf4E2M1FN>) -> () loc("<stdin>":47:5)
    "gpu.dealloc"(%22) : (memref<32x16xi8>) -> () loc("<stdin>":48:5)
    "gpu.dealloc"(%24) : (memref<8x2xf8E8M0FNU>) -> () loc("<stdin>":49:5)
    "gpu.dealloc"(%25) : (memref<2x16xf8E8M0FNU>) -> () loc("<stdin>":50:5)
    %26 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<8x16xf32> loc("<stdin>":51:11)
    "gpu.memcpy"(%26, %23) : (memref<8x16xf32>, memref<8x16xf32>) -> () loc("<stdin>":52:5)
    "gpu.dealloc"(%23) : (memref<8x16xf32>) -> () loc("<stdin>":53:5)
    "func.return"(%26) : (memref<8x16xf32>) -> () loc("<stdin>":54:5)
  }) {llvm.emit_c_interface} : () -> () loc("<stdin>":32:3)
  "func.func"() <{function_type = () -> (), sym_name = "main"}> ({
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":57:10)
    %1 = "arith.constant"() <{value = 1 : index}> : () -> index loc("<stdin>":58:10)
    %2 = "arith.constant"() <{value = 2 : index}> : () -> index loc("<stdin>":59:10)
    %3 = "arith.constant"() <{value = 8 : index}> : () -> index loc("<stdin>":60:10)
    %4 = "arith.constant"() <{value = 16 : index}> : () -> index loc("<stdin>":61:10)
    %5 = "arith.constant"() <{value = 32 : index}> : () -> index loc("<stdin>":62:10)
    %6 = "arith.constant"() <{value = 256 : index}> : () -> index loc("<stdin>":63:10)
    %7 = "arith.constant"() <{value = 1.000000e+00 : f4E2M1FN}> : () -> f4E2M1FN loc("<stdin>":64:10)
    %8 = "arith.constant"() <{value = 34 : i8}> : () -> i8 loc("<stdin>":65:10)
    %9 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32 loc("<stdin>":66:10)
    %10 = "arith.constant"() <{value = 1.000000e+00 : f8E8M0FNU}> : () -> f8E8M0FNU loc("<stdin>":67:11)
    %11 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<256xi8> loc("<stdin>":68:11)
    %12 = "memref.view"(%11, %0) : (memref<256xi8>, index) -> memref<8x64xf4E2M1FN> loc("<stdin>":69:11)
    "scf.for"(%0, %6, %1) ({
    ^bb0(%arg8: index loc("<stdin>":71:10)):
      "memref.store"(%8, %11, %arg8) : (i8, memref<256xi8>, index) -> () loc("<stdin>":72:7)
      "scf.yield"() : () -> () loc("<stdin>":73:7)
    }) : (index, index, index) -> () loc("<stdin>":70:5)
    %13 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<32x16xi8> loc("<stdin>":75:11)
    "scf.for"(%0, %5, %1) ({
    ^bb0(%arg6: index loc("<stdin>":77:10)):
      "scf.for"(%0, %4, %1) ({
      ^bb0(%arg7: index loc("<stdin>":79:12)):
        "memref.store"(%8, %13, %arg6, %arg7) : (i8, memref<32x16xi8>, index, index) -> () loc("<stdin>":80:9)
        "scf.yield"() : () -> () loc("<stdin>":81:9)
      }) : (index, index, index) -> () loc("<stdin>":78:7)
      "scf.yield"() : () -> () loc("<stdin>":83:7)
    }) : (index, index, index) -> () loc("<stdin>":76:5)
    %14 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<8x16xf32> loc("<stdin>":85:11)
    "scf.for"(%0, %3, %1) ({
    ^bb0(%arg4: index loc("<stdin>":87:10)):
      "scf.for"(%0, %4, %1) ({
      ^bb0(%arg5: index loc("<stdin>":89:12)):
        "memref.store"(%9, %14, %arg4, %arg5) : (f32, memref<8x16xf32>, index, index) -> () loc("<stdin>":90:9)
        "scf.yield"() : () -> () loc("<stdin>":91:9)
      }) : (index, index, index) -> () loc("<stdin>":88:7)
      "scf.yield"() : () -> () loc("<stdin>":93:7)
    }) : (index, index, index) -> () loc("<stdin>":86:5)
    %15 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<8x2xf8E8M0FNU> loc("<stdin>":95:11)
    "scf.for"(%0, %3, %1) ({
    ^bb0(%arg2: index loc("<stdin>":97:10)):
      "scf.for"(%0, %2, %1) ({
      ^bb0(%arg3: index loc("<stdin>":99:12)):
        "memref.store"(%10, %15, %arg2, %arg3) : (f8E8M0FNU, memref<8x2xf8E8M0FNU>, index, index) -> () loc("<stdin>":100:9)
        "scf.yield"() : () -> () loc("<stdin>":101:9)
      }) : (index, index, index) -> () loc("<stdin>":98:7)
      "scf.yield"() : () -> () loc("<stdin>":103:7)
    }) : (index, index, index) -> () loc("<stdin>":96:5)
    %16 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<2x16xf8E8M0FNU> loc("<stdin>":105:11)
    "scf.for"(%0, %2, %1) ({
    ^bb0(%arg0: index loc("<stdin>":107:10)):
      "scf.for"(%0, %4, %1) ({
      ^bb0(%arg1: index loc("<stdin>":109:12)):
        "memref.store"(%10, %16, %arg0, %arg1) : (f8E8M0FNU, memref<2x16xf8E8M0FNU>, index, index) -> () loc("<stdin>":110:9)
        "scf.yield"() : () -> () loc("<stdin>":111:9)
      }) : (index, index, index) -> () loc("<stdin>":108:7)
      "scf.yield"() : () -> () loc("<stdin>":113:7)
    }) : (index, index, index) -> () loc("<stdin>":106:5)
    %17 = "func.call"(%12, %13, %14, %15, %16) <{callee = @test}> : (memref<8x64xf4E2M1FN>, memref<32x16xi8>, memref<8x16xf32>, memref<8x2xf8E8M0FNU>, memref<2x16xf8E8M0FNU>) -> memref<8x16xf32> loc("<stdin>":115:11)
    %18 = "memref.cast"(%17) : (memref<8x16xf32>) -> memref<*xf32> loc("<stdin>":116:11)
    "func.call"(%18) <{callee = @printMemrefF32}> : (memref<*xf32>) -> () loc("<stdin>":117:5)
    "memref.dealloc"(%11) : (memref<256xi8>) -> () loc("<stdin>":118:5)
    "memref.dealloc"(%13) : (memref<32x16xi8>) -> () loc("<stdin>":119:5)
    "memref.dealloc"(%14) : (memref<8x16xf32>) -> () loc("<stdin>":120:5)
    "memref.dealloc"(%15) : (memref<8x2xf8E8M0FNU>) -> () loc("<stdin>":121:5)
    "memref.dealloc"(%16) : (memref<2x16xf8E8M0FNU>) -> () loc("<stdin>":122:5)
    "memref.dealloc"(%17) : (memref<8x16xf32>) -> () loc("<stdin>":123:5)
    "func.return"() : () -> () loc("<stdin>":124:5)
  }) {llvm.emit_c_interface} : () -> () loc("<stdin>":56:3)
  "func.func"() <{function_type = (memref<*xf32>) -> (), sym_name = "printMemrefF32", sym_visibility = "private"}> ({
  }) {llvm.emit_c_interface} : () -> () loc("<stdin>":126:3)
}) {gpu.container_module} : () -> () loc("<stdin>":1:1)
