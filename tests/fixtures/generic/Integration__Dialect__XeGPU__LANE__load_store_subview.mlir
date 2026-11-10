"builtin.module"() <{sym_name = "subview"}> ({
  "gpu.module"() <{sym_name = "kernel"}> ({
    "gpu.func"() <{function_type = (memref<256xf32>, memref<256xf32>) -> (), kernel}> ({
    ^bb0(%arg4: memref<256xf32>, %arg5: memref<256xf32>):
      %14 = "memref.subview"(%arg4) <{operandSegmentSizes = array<i32: 1, 0, 0, 0>, static_offsets = array<i64: 5>, static_sizes = array<i64: 251>, static_strides = array<i64: 1>}> : (memref<256xf32>) -> memref<251xf32, strided<[1], offset: 5>>
      %15 = "memref.subview"(%arg5) <{operandSegmentSizes = array<i32: 1, 0, 0, 0>, static_offsets = array<i64: 10>, static_sizes = array<i64: 246>, static_strides = array<i64: 1>}> : (memref<256xf32>) -> memref<246xf32, strided<[1], offset: 10>>
      %16 = "gpu.lane_id"() : () -> index
      %17 = "arith.constant"() <{value = true}> : () -> i1
      %18 = "xegpu.load"(%14, %16, %17) : (memref<251xf32, strided<[1], offset: 5>>, index, i1) -> f32
      "xegpu.store"(%18, %15, %16, %17) : (f32, memref<246xf32, strided<[1], offset: 10>>, index, i1) -> ()
      "gpu.return"() : () -> ()
    }) {sym_name = "subview"} : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<256xf32>, memref<256xf32>) -> memref<256xf32>, sym_name = "test"}> ({
  ^bb0(%arg2: memref<256xf32>, %arg3: memref<256xf32>):
    %10 = "gpu.alloc"() <{operandSegmentSizes = array<i32: 0, 0, 0>}> : () -> memref<256xf32>
    "gpu.memcpy"(%10, %arg2) : (memref<256xf32>, memref<256xf32>) -> ()
    %11 = "gpu.alloc"() <{operandSegmentSizes = array<i32: 0, 0, 0>}> : () -> memref<256xf32>
    "gpu.memcpy"(%11, %arg3) : (memref<256xf32>, memref<256xf32>) -> ()
    %12 = "arith.constant"() <{value = 1 : index}> : () -> index
    %13 = "arith.constant"() <{value = 16 : index}> : () -> index
    "gpu.launch_func"(%12, %12, %12, %13, %12, %12, %10, %11) <{kernel = @kernel::@subview, operandSegmentSizes = array<i32: 0, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 2, 0>}> : (index, index, index, index, index, index, memref<256xf32>, memref<256xf32>) -> ()
    "gpu.wait"() : () -> ()
    "gpu.memcpy"(%arg3, %11) : (memref<256xf32>, memref<256xf32>) -> ()
    "gpu.dealloc"(%10) : (memref<256xf32>) -> ()
    "gpu.dealloc"(%11) : (memref<256xf32>) -> ()
    "func.return"(%arg3) : (memref<256xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "main"}> ({
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = 1 : index}> : () -> index
    %2 = "arith.constant"() <{value = 256 : index}> : () -> index
    %3 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<256xf32>
    %4 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<256xf32>
    "scf.for"(%0, %2, %1) ({
    ^bb0(%arg1: index):
      %8 = "arith.index_cast"(%arg1) : (index) -> i32
      %9 = "arith.sitofp"(%8) : (i32) -> f32
      "memref.store"(%9, %3, %arg1) : (f32, memref<256xf32>, index) -> ()
      "scf.yield"() : () -> ()
    }) : (index, index, index) -> ()
    "scf.for"(%0, %2, %1) ({
    ^bb0(%arg0: index):
      %7 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
      "memref.store"(%7, %4, %arg0) : (f32, memref<256xf32>, index) -> ()
      "scf.yield"() : () -> ()
    }) : (index, index, index) -> ()
    %5 = "func.call"(%3, %4) <{callee = @test}> : (memref<256xf32>, memref<256xf32>) -> memref<256xf32>
    %6 = "memref.cast"(%5) : (memref<256xf32>) -> memref<*xf32>
    "func.call"(%6) <{callee = @printMemrefF32}> : (memref<*xf32>) -> ()
    "memref.dealloc"(%3) : (memref<256xf32>) -> ()
    "memref.dealloc"(%4) : (memref<256xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<*xf32>) -> (), sym_name = "printMemrefF32", sym_visibility = "private"}> ({
  }) {llvm.emit_c_interface} : () -> ()
}) {gpu.container_module} : () -> ()

