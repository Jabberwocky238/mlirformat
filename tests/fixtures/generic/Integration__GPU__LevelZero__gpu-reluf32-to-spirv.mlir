"builtin.module"() <{sym_name = "relu"}> ({
  "memref.global"() <{constant, initial_value = dense<[[-1.000000e-01, -2.000000e-01, -3.000000e-01, 4.000000e-01, 5.000000e-01], [1.000000e-01, -2.000000e-01, 3.000000e-01, -4.000000e-01, 5.000000e-01], [1.000000e-01, 2.000000e-01, 3.000000e-01, -4.000000e-01, -5.000000e-01], [1.000000e-01, 2.000000e-01, 3.000000e-01, 4.000000e-01, 5.000000e-01]]> : tensor<4x5xf32>, sym_name = "__constant_4x5xf32", sym_visibility = "private", type = memref<4x5xf32>}> : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "main"}> ({
    %12 = "arith.constant"() <{value = 1 : index}> : () -> index
    %13 = "arith.constant"() <{value = 100 : index}> : () -> index
    %14 = "arith.constant"() <{value = 0 : index}> : () -> index
    %15 = "memref.get_global"() <{name = @__constant_4x5xf32}> : () -> memref<4x5xf32>
    "scf.for"(%14, %13, %12) ({
    ^bb0(%arg3: index):
      %16 = "func.call"(%15) <{callee = @test}> : (memref<4x5xf32>) -> memref<4x5xf32>
      %17 = "memref.cast"(%16) : (memref<4x5xf32>) -> memref<*xf32>
      "func.call"(%17) <{callee = @printMemrefF32}> : (memref<*xf32>) -> ()
      "scf.yield"() : () -> ()
    }) : (index, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<*xf32>) -> (), sym_name = "printMemrefF32", sym_visibility = "private"}> ({
  }) : () -> ()
  "func.func"() <{function_type = (memref<4x5xf32>) -> memref<4x5xf32>, sym_name = "test"}> ({
  ^bb0(%arg2: memref<4x5xf32>):
    %6 = "arith.constant"() <{value = 5 : index}> : () -> index
    %7 = "arith.constant"() <{value = 4 : index}> : () -> index
    %8 = "arith.constant"() <{value = 1 : index}> : () -> index
    %9 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<4x5xf32>
    %10 = "gpu.alloc"() <{operandSegmentSizes = array<i32: 0, 0, 0>}> : () -> memref<4x5xf32>
    "gpu.memcpy"(%10, %arg2) : (memref<4x5xf32>, memref<4x5xf32>) -> ()
    %11 = "gpu.alloc"() <{operandSegmentSizes = array<i32: 0, 0, 0>}> : () -> memref<4x5xf32>
    "gpu.launch_func"(%7, %6, %8, %8, %8, %8, %10, %11) <{kernel = @test_kernel::@test_relu, operandSegmentSizes = array<i32: 0, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 2, 0>}> : (index, index, index, index, index, index, memref<4x5xf32>, memref<4x5xf32>) -> ()
    "gpu.memcpy"(%9, %11) : (memref<4x5xf32>, memref<4x5xf32>) -> ()
    "gpu.dealloc"(%10) : (memref<4x5xf32>) -> ()
    "gpu.dealloc"(%11) : (memref<4x5xf32>) -> ()
    "func.return"(%9) : (memref<4x5xf32>) -> ()
  }) : () -> ()
  "gpu.module"() <{sym_name = "test_kernel"}> ({
    "gpu.func"() <{function_type = (memref<4x5xf32>, memref<4x5xf32>) -> ()}> ({
    ^bb0(%arg0: memref<4x5xf32>, %arg1: memref<4x5xf32>):
      %0 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
      %1 = "gpu.block_id"() <{dimension = #gpu<dim x>}> : () -> index
      %2 = "gpu.block_id"() <{dimension = #gpu<dim y>}> : () -> index
      %3 = "memref.load"(%arg0, %1, %2) : (memref<4x5xf32>, index, index) -> f32
      %4 = "arith.cmpf"(%3, %0) <{fastmath = #arith.fastmath<none>, predicate = 2 : i64}> : (f32, f32) -> i1
      %5 = "arith.select"(%4, %3, %0) : (i1, f32, f32) -> f32
      "memref.store"(%5, %arg1, %1, %2) : (f32, memref<4x5xf32>, index, index) -> ()
      "gpu.return"() : () -> ()
    }) {gpu.kernel, gpu.known_block_size = array<i32: 1, 1, 1>, gpu.known_grid_size = array<i32: 4, 5, 1>, spirv.entry_point_abi = #spirv.entry_point_abi<>, sym_name = "test_relu", workgroup_attributions = 0 : i64} : () -> ()
  }) {spirv.target_env = #spirv.target_env<#spirv.vce<v1.0, [Addresses, Int64, Int8, Kernel], []>, api=OpenCL, #spirv.resource_limits<>>} : () -> ()
}) {gpu.container_module} : () -> ()

