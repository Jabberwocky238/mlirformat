"builtin.module"() <{sym_name = "add"}> ({
  "memref.global"() <{constant, initial_value = dense<[[[1.100000e+00, 2.200000e+00], [3.300000e+00, 4.400000e+00]], [[5.500000e+00, 6.600000e+00], [7.6999998, 8.800000e+00]]]> : tensor<2x2x2xf32>, sym_name = "__constant_2x2x2xf32_0", sym_visibility = "private", type = memref<2x2x2xf32>}> : () -> ()
  "memref.global"() <{constant, initial_value = dense<[[[1.200000e+00, 2.300000e+00], [4.500000e+00, 5.800000e+00]], [[7.1999998, 8.300000e+00], [1.050000e+01, 1.180000e+01]]]> : tensor<2x2x2xf32>, sym_name = "__constant_2x2x2xf32", sym_visibility = "private", type = memref<2x2x2xf32>}> : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "main"}> ({
    %18 = "memref.get_global"() <{name = @__constant_2x2x2xf32}> : () -> memref<2x2x2xf32>
    %19 = "memref.get_global"() <{name = @__constant_2x2x2xf32_0}> : () -> memref<2x2x2xf32>
    %20 = "func.call"(%18, %19) <{callee = @test}> : (memref<2x2x2xf32>, memref<2x2x2xf32>) -> memref<2x2x2xf32>
    %21 = "memref.cast"(%20) : (memref<2x2x2xf32>) -> memref<*xf32>
    "func.call"(%21) <{callee = @printMemrefF32}> : (memref<*xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<*xf32>) -> (), sym_name = "printMemrefF32", sym_visibility = "private"}> ({
  }) : () -> ()
  "func.func"() <{function_type = (memref<2x2x2xf32>, memref<2x2x2xf32>) -> memref<2x2x2xf32>, sym_name = "test"}> ({
  ^bb0(%arg3: memref<2x2x2xf32>, %arg4: memref<2x2x2xf32>):
    %6 = "arith.constant"() <{value = 2 : index}> : () -> index
    %7 = "arith.constant"() <{value = 1 : index}> : () -> index
    %8 = "gpu.alloc"() <{hostShared, operandSegmentSizes = array<i32: 0, 0, 0>}> : () -> memref<2x2x2xf32>
    "memref.copy"(%arg4, %8) : (memref<2x2x2xf32>, memref<2x2x2xf32>) -> ()
    %9 = "gpu.alloc"() <{hostShared, operandSegmentSizes = array<i32: 0, 0, 0>}> : () -> memref<2x2x2xf32>
    "memref.copy"(%arg3, %9) : (memref<2x2x2xf32>, memref<2x2x2xf32>) -> ()
    %10 = "gpu.alloc"() <{hostShared, operandSegmentSizes = array<i32: 0, 0, 0>}> : () -> memref<2x2x2xf32>
    %11 = "gpu.wait"() : () -> !gpu.async.token
    %12 = "gpu.launch_func"(%11, %6, %6, %6, %7, %7, %7, %9, %8, %10) <{kernel = @test_kernel::@test_kernel, operandSegmentSizes = array<i32: 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 3, 0>}> : (!gpu.async.token, index, index, index, index, index, index, memref<2x2x2xf32>, memref<2x2x2xf32>, memref<2x2x2xf32>) -> !gpu.async.token
    "gpu.wait"(%12) : (!gpu.async.token) -> ()
    %13 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<2x2x2xf32>
    "memref.copy"(%10, %13) : (memref<2x2x2xf32>, memref<2x2x2xf32>) -> ()
    %14 = "gpu.wait"() : () -> !gpu.async.token
    %15 = "gpu.dealloc"(%14, %10) : (!gpu.async.token, memref<2x2x2xf32>) -> !gpu.async.token
    %16 = "gpu.dealloc"(%15, %9) : (!gpu.async.token, memref<2x2x2xf32>) -> !gpu.async.token
    %17 = "gpu.dealloc"(%16, %8) : (!gpu.async.token, memref<2x2x2xf32>) -> !gpu.async.token
    "gpu.wait"(%17) : (!gpu.async.token) -> ()
    "func.return"(%13) : (memref<2x2x2xf32>) -> ()
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
    }) {gpu.known_block_size = array<i32: 1, 1, 1>, gpu.known_grid_size = array<i32: 2, 2, 2>, spirv.entry_point_abi = #spirv.entry_point_abi<>, sym_name = "test_kernel"} : () -> ()
  }) {spirv.target_env = #spirv.target_env<#spirv.vce<v1.0, [Addresses, Int64, Kernel], []>, api=OpenCL, #spirv.resource_limits<>>} : () -> ()
}) {gpu.container_module} : () -> ()

