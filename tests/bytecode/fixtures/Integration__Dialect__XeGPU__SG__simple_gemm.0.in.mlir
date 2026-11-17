"builtin.module"() <{sym_name = "gemm"}> ({
  "gpu.module"() <{sym_name = "kernel"}> ({
    "gpu.func"() <{function_type = (memref<256x256xf16>, memref<256x256xf16>, memref<256x256xf32>) -> (), kernel}> ({
    ^bb0(%arg9: memref<256x256xf16> loc("<stdin>":4:10), %arg10: memref<256x256xf16> loc("<stdin>":4:38), %arg11: memref<256x256xf32> loc("<stdin>":4:67)):
      %28 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":5:13)
      %29 = "arith.constant"() <{value = 1 : index}> : () -> index loc("<stdin>":6:13)
      %30 = "arith.constant"() <{value = 8 : index}> : () -> index loc("<stdin>":7:13)
      %31 = "arith.constant"() <{value = 16 : index}> : () -> index loc("<stdin>":8:13)
      %32 = "arith.constant"() <{value = 32 : index}> : () -> index loc("<stdin>":9:13)
      %33 = "arith.constant"() <{value = 256 : index}> : () -> index loc("<stdin>":10:13)
      %34 = "gpu.block_id"() <{dimension = #gpu<dim x>}> : () -> index loc("<stdin>":11:13)
      %35 = "gpu.block_id"() <{dimension = #gpu<dim y>}> : () -> index loc("<stdin>":12:13)
      %36 = "arith.muli"(%34, %30) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index loc("<stdin>":13:13)
      %37 = "arith.muli"(%35, %31) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index loc("<stdin>":14:13)
      %38 = "xegpu.create_nd_tdesc"(%arg11) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (memref<256x256xf32>) -> !xegpu.tensor_desc<8x16xf32> loc("<stdin>":15:13)
      %39 = "xegpu.load_nd"(%38, %36, %37) <{const_offsets = array<i64: -9223372036854775808, -9223372036854775808>}> : (!xegpu.tensor_desc<8x16xf32>, index, index) -> vector<8x16xf32> loc("<stdin>":16:13)
      %40 = "xegpu.create_nd_tdesc"(%arg9) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (memref<256x256xf16>) -> !xegpu.tensor_desc<8x16xf16> loc("<stdin>":17:13)
      %41 = "xegpu.create_nd_tdesc"(%arg10) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (memref<256x256xf16>) -> !xegpu.tensor_desc<16x16xf16> loc("<stdin>":18:13)
      %42 = "scf.for"(%28, %33, %31, %39) ({
      ^bb0(%arg12: index loc("<stdin>":20:12), %arg13: vector<8x16xf32> loc("<stdin>":20:27)):
        %43 = "xegpu.load_nd"(%40, %36, %arg12) <{const_offsets = array<i64: -9223372036854775808, -9223372036854775808>}> : (!xegpu.tensor_desc<8x16xf16>, index, index) -> vector<8x16xf16> loc("<stdin>":21:15)
        %44 = "xegpu.load_nd"(%41, %arg12, %37) <{const_offsets = array<i64: -9223372036854775808, -9223372036854775808>}> : (!xegpu.tensor_desc<16x16xf16>, index, index) -> vector<16x16xf16> loc("<stdin>":22:15)
        %45 = "xegpu.dpas"(%43, %44, %arg13) : (vector<8x16xf16>, vector<16x16xf16>, vector<8x16xf32>) -> vector<8x16xf32> loc("<stdin>":23:15)
        "scf.yield"(%45) : (vector<8x16xf32>) -> () loc("<stdin>":24:9)
      }) : (index, index, index, vector<8x16xf32>) -> vector<8x16xf32> loc("<stdin>":19:13)
      "xegpu.store_nd"(%42, %38, %36, %37) <{const_offsets = array<i64: -9223372036854775808, -9223372036854775808>, l1_hint = #xegpu.cache_hint<write_back>, l2_hint = #xegpu.cache_hint<uncached>}> : (vector<8x16xf32>, !xegpu.tensor_desc<8x16xf32>, index, index) -> () loc("<stdin>":26:7)
      "gpu.return"() : () -> () loc("<stdin>":27:7)
    }) {sym_name = "simple_gemm"} : () -> () loc("<stdin>":3:5)
  }) : () -> () loc("<stdin>":2:3)
  "func.func"() <{function_type = (memref<256x256xf16>, memref<256x256xf16>, memref<256x256xf32>) -> memref<256x256xf32>, sym_name = "test"}> ({
  ^bb0(%arg6: memref<256x256xf16> loc("<stdin>":31:8), %arg7: memref<256x256xf16> loc("<stdin>":31:36), %arg8: memref<256x256xf32> loc("<stdin>":31:64)):
    %22 = "arith.constant"() <{value = 1 : index}> : () -> index loc("<stdin>":32:11)
    %23 = "arith.constant"() <{value = 16 : index}> : () -> index loc("<stdin>":33:11)
    %24 = "arith.constant"() <{value = 32 : index}> : () -> index loc("<stdin>":34:11)
    %25 = "gpu.alloc"() <{operandSegmentSizes = array<i32: 0, 0, 0>}> : () -> memref<256x256xf16> loc("<stdin>":35:11)
    "gpu.memcpy"(%25, %arg6) : (memref<256x256xf16>, memref<256x256xf16>) -> () loc("<stdin>":36:5)
    %26 = "gpu.alloc"() <{operandSegmentSizes = array<i32: 0, 0, 0>}> : () -> memref<256x256xf16> loc("<stdin>":37:11)
    "gpu.memcpy"(%26, %arg7) : (memref<256x256xf16>, memref<256x256xf16>) -> () loc("<stdin>":38:5)
    %27 = "gpu.alloc"() <{operandSegmentSizes = array<i32: 0, 0, 0>}> : () -> memref<256x256xf32> loc("<stdin>":39:11)
    "gpu.memcpy"(%27, %arg8) : (memref<256x256xf32>, memref<256x256xf32>) -> () loc("<stdin>":40:5)
    "gpu.launch_func"(%24, %23, %22, %23, %22, %22, %25, %26, %27) <{kernel = @kernel::@simple_gemm, operandSegmentSizes = array<i32: 0, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 3, 0>}> : (index, index, index, index, index, index, memref<256x256xf16>, memref<256x256xf16>, memref<256x256xf32>) -> () loc("<stdin>":41:5)
    "gpu.wait"() : () -> () loc("<stdin>":42:5)
    "gpu.memcpy"(%arg8, %27) : (memref<256x256xf32>, memref<256x256xf32>) -> () loc("<stdin>":43:5)
    "gpu.dealloc"(%25) : (memref<256x256xf16>) -> () loc("<stdin>":44:5)
    "gpu.dealloc"(%26) : (memref<256x256xf16>) -> () loc("<stdin>":45:5)
    "gpu.dealloc"(%27) : (memref<256x256xf32>) -> () loc("<stdin>":46:5)
    "func.return"(%arg8) : (memref<256x256xf32>) -> () loc("<stdin>":47:5)
  }) {llvm.emit_c_interface} : () -> () loc("<stdin>":30:3)
  "func.func"() <{function_type = () -> (), sym_name = "main"}> ({
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":50:10)
    %1 = "arith.constant"() <{value = 1 : index}> : () -> index loc("<stdin>":51:10)
    %2 = "arith.constant"() <{value = 1.000000e+00 : f16}> : () -> f16 loc("<stdin>":52:10)
    %3 = "arith.constant"() <{value = 2.000000e+00 : f16}> : () -> f16 loc("<stdin>":53:10)
    %4 = "arith.constant"() <{value = 256 : index}> : () -> index loc("<stdin>":54:10)
    %5 = "arith.constant"() <{value = 0.000000e+00 : f16}> : () -> f16 loc("<stdin>":55:10)
    %6 = "arith.constant"() <{value = 1.000000e+00 : f16}> : () -> f16 loc("<stdin>":56:10)
    %7 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<256x256xf16> loc("<stdin>":57:10)
    %8 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<256x256xf16> loc("<stdin>":58:10)
    %9 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<256x256xf32> loc("<stdin>":59:10)
    %10 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<256x256xf32> loc("<stdin>":60:11)
    %11 = "arith.constant"() <{value = false}> : () -> i1 loc("<stdin>":61:11)
    %12 = "arith.constant"() <{value = -5.000000e-01 : f32}> : () -> f32 loc("<stdin>":62:11)
    %13 = "arith.constant"() <{value = 5.000000e-01 : f32}> : () -> f32 loc("<stdin>":63:11)
    "scf.for"(%0, %4, %1) ({
    ^bb0(%arg4: index loc("<stdin>":65:10)):
      "scf.for"(%0, %4, %1) ({
      ^bb0(%arg5: index loc("<stdin>":67:12)):
        %20 = "index.castu"(%arg5) : (index) -> i16 loc("<stdin>":68:15)
        %21 = "arith.uitofp"(%20) : (i16) -> f16 loc("<stdin>":69:15)
        "memref.store"(%21, %7, %arg4, %arg5) : (f16, memref<256x256xf16>, index, index) -> () loc("<stdin>":70:9)
        "scf.yield"() : () -> () loc("<stdin>":71:9)
      }) : (index, index, index) -> () loc("<stdin>":66:7)
      "scf.yield"() : () -> () loc("<stdin>":73:7)
    }) : (index, index, index) -> () loc("<stdin>":64:5)
    "scf.for"(%0, %4, %1) ({
    ^bb0(%arg2: index loc("<stdin>":76:10)):
      "scf.for"(%0, %4, %1) ({
      ^bb0(%arg3: index loc("<stdin>":78:12)):
        %17 = "index.castu"(%arg2) : (index) -> i32 loc("<stdin>":79:15)
        %18 = "index.castu"(%arg3) : (index) -> i32 loc("<stdin>":80:15)
        %19 = "arith.cmpi"(%17, %18) <{predicate = 0 : i64}> : (i32, i32) -> i1 loc("<stdin>":81:15)
        "scf.if"(%19) ({
          "memref.store"(%6, %8, %arg2, %arg3) : (f16, memref<256x256xf16>, index, index) -> () loc("<stdin>":83:11)
          "scf.yield"() : () -> () loc("<stdin>":84:11)
        }, {
          "memref.store"(%5, %8, %arg2, %arg3) : (f16, memref<256x256xf16>, index, index) -> () loc("<stdin>":86:11)
          "scf.yield"() : () -> () loc("<stdin>":87:11)
        }) : (i1) -> () loc("<stdin>":82:9)
        "scf.yield"() : () -> () loc("<stdin>":89:9)
      }) : (index, index, index) -> () loc("<stdin>":77:7)
      "scf.yield"() : () -> () loc("<stdin>":91:7)
    }) : (index, index, index) -> () loc("<stdin>":75:5)
    %14 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32 loc("<stdin>":93:11)
    "scf.for"(%0, %4, %1) ({
    ^bb0(%arg0: index loc("<stdin>":95:10)):
      "scf.for"(%0, %4, %1) ({
      ^bb0(%arg1: index loc("<stdin>":97:12)):
        "memref.store"(%14, %9, %arg0, %arg1) : (f32, memref<256x256xf32>, index, index) -> () loc("<stdin>":98:9)
        "memref.store"(%14, %10, %arg0, %arg1) : (f32, memref<256x256xf32>, index, index) -> () loc("<stdin>":99:9)
        "scf.yield"() : () -> () loc("<stdin>":100:9)
      }) : (index, index, index) -> () loc("<stdin>":96:7)
      "scf.yield"() : () -> () loc("<stdin>":102:7)
    }) : (index, index, index) -> () loc("<stdin>":94:5)
    %15 = "func.call"(%7, %8, %9) <{callee = @test}> : (memref<256x256xf16>, memref<256x256xf16>, memref<256x256xf32>) -> memref<256x256xf32> loc("<stdin>":104:11)
    %16 = "memref.cast"(%15) : (memref<256x256xf32>) -> memref<*xf32> loc("<stdin>":105:11)
    "func.call"(%16) <{callee = @printMemrefF32}> : (memref<*xf32>) -> () loc("<stdin>":106:5)
    "memref.dealloc"(%7) : (memref<256x256xf16>) -> () loc("<stdin>":107:5)
    "memref.dealloc"(%8) : (memref<256x256xf16>) -> () loc("<stdin>":108:5)
    "memref.dealloc"(%9) : (memref<256x256xf32>) -> () loc("<stdin>":109:5)
    "memref.dealloc"(%10) : (memref<256x256xf32>) -> () loc("<stdin>":110:5)
    "func.return"() : () -> () loc("<stdin>":111:5)
  }) {llvm.emit_c_interface} : () -> () loc("<stdin>":49:3)
  "func.func"() <{function_type = (memref<*xf32>) -> (), sym_name = "printMemrefF32", sym_visibility = "private"}> ({
  }) {llvm.emit_c_interface} : () -> () loc("<stdin>":113:3)
}) {gpu.container_module} : () -> () loc("<stdin>":1:1)
