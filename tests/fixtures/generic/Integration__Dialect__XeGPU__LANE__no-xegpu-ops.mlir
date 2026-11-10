"builtin.module"() <{sym_name = "add"}> ({
  "memref.global"() <{constant, initial_value = dense<[[[1.100000e+00, 2.200000e+00], [3.300000e+00, 4.400000e+00]], [[5.500000e+00, 6.600000e+00], [7.6999998, 8.800000e+00]]]> : tensor<2x2x2xf32>, sym_name = "__constant_2x2x2xf32_0", sym_visibility = "private", type = memref<2x2x2xf32>}> : () -> ()
  "memref.global"() <{constant, initial_value = dense<[[[1.200000e+00, 2.300000e+00], [4.500000e+00, 5.800000e+00]], [[7.1999998, 8.300000e+00], [1.050000e+01, 1.180000e+01]]]> : tensor<2x2x2xf32>, sym_name = "__constant_2x2x2xf32", sym_visibility = "private", type = memref<2x2x2xf32>}> : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "main"}> ({
    %12 = "memref.get_global"() <{name = @__constant_2x2x2xf32}> : () -> memref<2x2x2xf32>
    %13 = "memref.get_global"() <{name = @__constant_2x2x2xf32_0}> : () -> memref<2x2x2xf32>
    %14 = "func.call"(%12, %13) <{callee = @test}> : (memref<2x2x2xf32>, memref<2x2x2xf32>) -> memref<2x2x2xf32>
    %15 = "memref.cast"(%14) : (memref<2x2x2xf32>) -> memref<*xf32>
    "func.call"(%15) <{callee = @printMemrefF32}> : (memref<*xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<*xf32>) -> (), sym_name = "printMemrefF32", sym_visibility = "private"}> ({
  }) : () -> ()
  "func.func"() <{function_type = (memref<2x2x2xf32>, memref<2x2x2xf32>) -> memref<2x2x2xf32>, sym_name = "test"}> ({
  ^bb0(%arg3: memref<2x2x2xf32>, %arg4: memref<2x2x2xf32>):
    %6 = "arith.constant"() <{value = 2 : index}> : () -> index
    %7 = "arith.constant"() <{value = 1 : index}> : () -> index
    %8 = "gpu.alloc"() <{operandSegmentSizes = array<i32: 0, 0, 0>}> : () -> memref<2x2x2xf32>
    "gpu.memcpy"(%8, %arg4) : (memref<2x2x2xf32>, memref<2x2x2xf32>) -> ()
    %9 = "gpu.alloc"() <{operandSegmentSizes = array<i32: 0, 0, 0>}> : () -> memref<2x2x2xf32>
    "gpu.memcpy"(%9, %arg3) : (memref<2x2x2xf32>, memref<2x2x2xf32>) -> ()
    %10 = "gpu.alloc"() <{operandSegmentSizes = array<i32: 0, 0, 0>}> : () -> memref<2x2x2xf32>
    "gpu.launch_func"(%6, %6, %6, %7, %7, %7, %9, %8, %10) <{kernel = @test_kernel::@test_kernel, operandSegmentSizes = array<i32: 0, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 3, 0>}> : (index, index, index, index, index, index, memref<2x2x2xf32>, memref<2x2x2xf32>, memref<2x2x2xf32>) -> ()
    %11 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<2x2x2xf32>
    "gpu.memcpy"(%11, %10) : (memref<2x2x2xf32>, memref<2x2x2xf32>) -> ()
    "gpu.dealloc"(%10) : (memref<2x2x2xf32>) -> ()
    "gpu.dealloc"(%9) : (memref<2x2x2xf32>) -> ()
    "gpu.dealloc"(%8) : (memref<2x2x2xf32>) -> ()
    "func.return"(%11) : (memref<2x2x2xf32>) -> ()
  }) : () -> ()
  "gpu.module"() <{sym_name = "test_kernel"}> ({
    "gpu.func"() <{function_type = (memref<2x2x2xf32>, memref<2x2x2xf32>, memref<2x2x2xf32>) -> (), kernel}> ({
    ^bb0(%arg0: memref<2x2x2xf32>, %arg1: memref<2x2x2xf32>, %arg2: memref<2x2x2xf32>):
      %0 = "gpu.block_id"() <{dimension = #gpu<dim x>}> : () -> index
      %1 = "gpu.block_id"() <{dimension = #gpu<dim y>}> : () -> index
      %2 = "gpu.block_id"() <{dimension = #gpu<dim z>}> : () -> index
      %3 = "memref.load"(%arg0, %0, %1, %2) : (memref<2x2x2xf32>, index, index, index) -> f32
      %4 = "memref.load"(%arg1, %0, %1, %2) : (memref<2x2x2xf32>, index, index, index) -> f32
      %5 = "arith.addf"(%3, %4) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "memref.store"(%5, %arg2, %0, %1, %2) : (f32, memref<2x2x2xf32>, index, index, index) -> ()
      "gpu.return"() : () -> ()
    }) {sym_name = "test_kernel"} : () -> ()
  }) : () -> ()
}) {gpu.container_module} : () -> ()

