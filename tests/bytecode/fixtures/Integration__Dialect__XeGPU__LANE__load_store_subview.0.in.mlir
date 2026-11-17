"builtin.module"() <{sym_name = "subview"}> ({
  "gpu.module"() <{sym_name = "kernel"}> ({
    "gpu.func"() <{function_type = (memref<256xf32>, memref<256xf32>) -> (), kernel}> ({
    ^bb0(%arg4: memref<256xf32> loc("<stdin>":4:10), %arg5: memref<256xf32> loc("<stdin>":4:34)):
      %14 = "memref.subview"(%arg4) <{operandSegmentSizes = array<i32: 1, 0, 0, 0>, static_offsets = array<i64: 5>, static_sizes = array<i64: 251>, static_strides = array<i64: 1>}> : (memref<256xf32>) -> memref<251xf32, strided<[1], offset: 5>> loc("<stdin>":5:13)
      %15 = "memref.subview"(%arg5) <{operandSegmentSizes = array<i32: 1, 0, 0, 0>, static_offsets = array<i64: 10>, static_sizes = array<i64: 246>, static_strides = array<i64: 1>}> : (memref<256xf32>) -> memref<246xf32, strided<[1], offset: 10>> loc("<stdin>":6:13)
      %16 = "gpu.lane_id"() : () -> index loc("<stdin>":7:13)
      %17 = "arith.constant"() <{value = true}> : () -> i1 loc("<stdin>":8:13)
      %18 = "xegpu.load"(%14, %16, %17) : (memref<251xf32, strided<[1], offset: 5>>, index, i1) -> f32 loc("<stdin>":9:13)
      "xegpu.store"(%18, %15, %16, %17) : (f32, memref<246xf32, strided<[1], offset: 10>>, index, i1) -> () loc("<stdin>":10:7)
      "gpu.return"() : () -> () loc("<stdin>":11:7)
    }) {sym_name = "subview"} : () -> () loc("<stdin>":3:5)
  }) : () -> () loc("<stdin>":2:3)
  "func.func"() <{function_type = (memref<256xf32>, memref<256xf32>) -> memref<256xf32>, sym_name = "test"}> ({
  ^bb0(%arg2: memref<256xf32> loc("<stdin>":15:8), %arg3: memref<256xf32> loc("<stdin>":15:32)):
    %10 = "gpu.alloc"() <{operandSegmentSizes = array<i32: 0, 0, 0>}> : () -> memref<256xf32> loc("<stdin>":16:11)
    "gpu.memcpy"(%10, %arg2) : (memref<256xf32>, memref<256xf32>) -> () loc("<stdin>":17:5)
    %11 = "gpu.alloc"() <{operandSegmentSizes = array<i32: 0, 0, 0>}> : () -> memref<256xf32> loc("<stdin>":18:11)
    "gpu.memcpy"(%11, %arg3) : (memref<256xf32>, memref<256xf32>) -> () loc("<stdin>":19:5)
    %12 = "arith.constant"() <{value = 1 : index}> : () -> index loc("<stdin>":20:11)
    %13 = "arith.constant"() <{value = 16 : index}> : () -> index loc("<stdin>":21:11)
    "gpu.launch_func"(%12, %12, %12, %13, %12, %12, %10, %11) <{kernel = @kernel::@subview, operandSegmentSizes = array<i32: 0, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 2, 0>}> : (index, index, index, index, index, index, memref<256xf32>, memref<256xf32>) -> () loc("<stdin>":22:5)
    "gpu.wait"() : () -> () loc("<stdin>":23:5)
    "gpu.memcpy"(%arg3, %11) : (memref<256xf32>, memref<256xf32>) -> () loc("<stdin>":24:5)
    "gpu.dealloc"(%10) : (memref<256xf32>) -> () loc("<stdin>":25:5)
    "gpu.dealloc"(%11) : (memref<256xf32>) -> () loc("<stdin>":26:5)
    "func.return"(%arg3) : (memref<256xf32>) -> () loc("<stdin>":27:5)
  }) : () -> () loc("<stdin>":14:3)
  "func.func"() <{function_type = () -> (), sym_name = "main"}> ({
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":30:10)
    %1 = "arith.constant"() <{value = 1 : index}> : () -> index loc("<stdin>":31:10)
    %2 = "arith.constant"() <{value = 256 : index}> : () -> index loc("<stdin>":32:10)
    %3 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<256xf32> loc("<stdin>":33:10)
    %4 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<256xf32> loc("<stdin>":34:10)
    "scf.for"(%0, %2, %1) ({
    ^bb0(%arg1: index loc("<stdin>":36:10)):
      %8 = "arith.index_cast"(%arg1) : (index) -> i32 loc("<stdin>":37:12)
      %9 = "arith.sitofp"(%8) : (i32) -> f32 loc("<stdin>":38:12)
      "memref.store"(%9, %3, %arg1) : (f32, memref<256xf32>, index) -> () loc("<stdin>":39:7)
      "scf.yield"() : () -> () loc("<stdin>":40:7)
    }) : (index, index, index) -> () loc("<stdin>":35:5)
    "scf.for"(%0, %2, %1) ({
    ^bb0(%arg0: index loc("<stdin>":43:10)):
      %7 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32 loc("<stdin>":44:12)
      "memref.store"(%7, %4, %arg0) : (f32, memref<256xf32>, index) -> () loc("<stdin>":45:7)
      "scf.yield"() : () -> () loc("<stdin>":46:7)
    }) : (index, index, index) -> () loc("<stdin>":42:5)
    %5 = "func.call"(%3, %4) <{callee = @test}> : (memref<256xf32>, memref<256xf32>) -> memref<256xf32> loc("<stdin>":48:10)
    %6 = "memref.cast"(%5) : (memref<256xf32>) -> memref<*xf32> loc("<stdin>":49:10)
    "func.call"(%6) <{callee = @printMemrefF32}> : (memref<*xf32>) -> () loc("<stdin>":50:5)
    "memref.dealloc"(%3) : (memref<256xf32>) -> () loc("<stdin>":51:5)
    "memref.dealloc"(%4) : (memref<256xf32>) -> () loc("<stdin>":52:5)
    "func.return"() : () -> () loc("<stdin>":53:5)
  }) : () -> () loc("<stdin>":29:3)
  "func.func"() <{function_type = (memref<*xf32>) -> (), sym_name = "printMemrefF32", sym_visibility = "private"}> ({
  }) {llvm.emit_c_interface} : () -> () loc("<stdin>":55:3)
}) {gpu.container_module} : () -> () loc("<stdin>":1:1)
