"builtin.module"() <{sym_name = "add"}> ({
  "memref.global"() <{constant, initial_value = dense<[[1, 4098, 3], [16777220, 5, 4294967302], [7, 1099511627784, 9]]> : tensor<3x3xi64>, sym_name = "__constant_3x3xi64_0", sym_visibility = "private", type = memref<3x3xi64>}> : () -> ()
  "memref.global"() <{constant, initial_value = dense<[[1, 2, 3], [4, 5, 4102], [16777223, 4294967304, 1099511627785]]> : tensor<3x3xi64>, sym_name = "__constant_3x3xi64", sym_visibility = "private", type = memref<3x3xi64>}> : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "main"}> ({
    %17 = "memref.get_global"() <{name = @__constant_3x3xi64}> : () -> memref<3x3xi64>
    %18 = "memref.get_global"() <{name = @__constant_3x3xi64_0}> : () -> memref<3x3xi64>
    %19 = "func.call"(%17, %18) <{callee = @test}> : (memref<3x3xi64>, memref<3x3xi64>) -> memref<3x3xi64>
    %20 = "memref.cast"(%19) : (memref<3x3xi64>) -> memref<*xi64>
    "func.call"(%20) <{callee = @printMemrefI64}> : (memref<*xi64>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<*xi64>) -> (), sym_name = "printMemrefI64", sym_visibility = "private"}> ({
  }) : () -> ()
  "func.func"() <{function_type = (memref<3x3xi64>, memref<3x3xi64>) -> memref<3x3xi64>, sym_name = "test"}> ({
  ^bb0(%arg3: memref<3x3xi64>, %arg4: memref<3x3xi64>):
    %5 = "arith.constant"() <{value = 3 : index}> : () -> index
    %6 = "arith.constant"() <{value = 1 : index}> : () -> index
    %7 = "gpu.alloc"() <{hostShared, operandSegmentSizes = array<i32: 0, 0, 0>}> : () -> memref<3x3xi64>
    "memref.copy"(%arg4, %7) : (memref<3x3xi64>, memref<3x3xi64>) -> ()
    %8 = "gpu.alloc"() <{hostShared, operandSegmentSizes = array<i32: 0, 0, 0>}> : () -> memref<3x3xi64>
    "memref.copy"(%arg3, %8) : (memref<3x3xi64>, memref<3x3xi64>) -> ()
    %9 = "gpu.alloc"() <{hostShared, operandSegmentSizes = array<i32: 0, 0, 0>}> : () -> memref<3x3xi64>
    %10 = "gpu.wait"() : () -> !gpu.async.token
    %11 = "gpu.launch_func"(%10, %5, %5, %6, %6, %6, %6, %8, %7, %9) <{kernel = @test_kernel::@test_kernel, operandSegmentSizes = array<i32: 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 3, 0>}> : (!gpu.async.token, index, index, index, index, index, index, memref<3x3xi64>, memref<3x3xi64>, memref<3x3xi64>) -> !gpu.async.token
    "gpu.wait"(%11) : (!gpu.async.token) -> ()
    %12 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<3x3xi64>
    "memref.copy"(%9, %12) : (memref<3x3xi64>, memref<3x3xi64>) -> ()
    %13 = "gpu.wait"() : () -> !gpu.async.token
    %14 = "gpu.dealloc"(%13, %9) : (!gpu.async.token, memref<3x3xi64>) -> !gpu.async.token
    %15 = "gpu.dealloc"(%14, %8) : (!gpu.async.token, memref<3x3xi64>) -> !gpu.async.token
    %16 = "gpu.dealloc"(%15, %7) : (!gpu.async.token, memref<3x3xi64>) -> !gpu.async.token
    "gpu.wait"(%16) : (!gpu.async.token) -> ()
    "func.return"(%12) : (memref<3x3xi64>) -> ()
  }) : () -> ()
  "gpu.module"() <{sym_name = "test_kernel"}> ({
    "gpu.func"() <{function_type = (memref<3x3xi64>, memref<3x3xi64>, memref<3x3xi64>) -> (), kernel}> ({
    ^bb0(%arg0: memref<3x3xi64>, %arg1: memref<3x3xi64>, %arg2: memref<3x3xi64>):
      %0 = "gpu.block_id"() <{dimension = #gpu<dim x>}> : () -> index
      %1 = "gpu.block_id"() <{dimension = #gpu<dim y>}> : () -> index
      %2 = "memref.load"(%arg0, %0, %1) : (memref<3x3xi64>, index, index) -> i64
      %3 = "memref.load"(%arg1, %0, %1) : (memref<3x3xi64>, index, index) -> i64
      %4 = "arith.addi"(%2, %3) <{overflowFlags = #arith.overflow<none>}> : (i64, i64) -> i64
      "memref.store"(%4, %arg2, %0, %1) : (i64, memref<3x3xi64>, index, index) -> ()
      "gpu.return"() : () -> ()
    }) {gpu.known_block_size = array<i32: 1, 1, 1>, gpu.known_grid_size = array<i32: 3, 3, 1>, spirv.entry_point_abi = #spirv.entry_point_abi<>, sym_name = "test_kernel"} : () -> ()
  }) {spirv.target_env = #spirv.target_env<#spirv.vce<v1.0, [Addresses, Int64, Kernel], []>, api=OpenCL, #spirv.resource_limits<>>} : () -> ()
}) {gpu.container_module} : () -> ()

