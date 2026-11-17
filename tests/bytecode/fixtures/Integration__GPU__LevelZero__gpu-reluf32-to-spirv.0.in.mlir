"builtin.module"() <{sym_name = "relu"}> ({
  "memref.global"() <{constant, initial_value = dense<[[-1.000000e-01, -2.000000e-01, -3.000000e-01, 4.000000e-01, 5.000000e-01], [1.000000e-01, -2.000000e-01, 3.000000e-01, -4.000000e-01, 5.000000e-01], [1.000000e-01, 2.000000e-01, 3.000000e-01, -4.000000e-01, -5.000000e-01], [1.000000e-01, 2.000000e-01, 3.000000e-01, 4.000000e-01, 5.000000e-01]]> : tensor<4x5xf32>, sym_name = "__constant_4x5xf32", sym_visibility = "private", type = memref<4x5xf32>}> : () -> () loc("<stdin>":2:3)
  "func.func"() <{function_type = () -> (), sym_name = "main"}> ({
    %12 = "arith.constant"() <{value = 1 : index}> : () -> index loc("<stdin>":4:11)
    %13 = "arith.constant"() <{value = 100 : index}> : () -> index loc("<stdin>":5:11)
    %14 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":6:11)
    %15 = "memref.get_global"() <{name = @__constant_4x5xf32}> : () -> memref<4x5xf32> loc("<stdin>":7:11)
    "scf.for"(%14, %13, %12) ({
    ^bb0(%arg3: index loc("<stdin>":9:10)):
      %16 = "func.call"(%15) <{callee = @test}> : (memref<4x5xf32>) -> memref<4x5xf32> loc("<stdin>":10:13)
      %17 = "memref.cast"(%16) : (memref<4x5xf32>) -> memref<*xf32> loc("<stdin>":11:13)
      "func.call"(%17) <{callee = @printMemrefF32}> : (memref<*xf32>) -> () loc("<stdin>":12:7)
      "scf.yield"() : () -> () loc("<stdin>":13:7)
    }) : (index, index, index) -> () loc("<stdin>":8:5)
    "func.return"() : () -> () loc("<stdin>":15:5)
  }) : () -> () loc("<stdin>":3:3)
  "func.func"() <{function_type = (memref<*xf32>) -> (), sym_name = "printMemrefF32", sym_visibility = "private"}> ({
  }) : () -> () loc("<stdin>":17:3)
  "func.func"() <{function_type = (memref<4x5xf32>) -> memref<4x5xf32>, sym_name = "test"}> ({
  ^bb0(%arg2: memref<4x5xf32> loc("<stdin>":20:8)):
    %6 = "arith.constant"() <{value = 5 : index}> : () -> index loc("<stdin>":21:10)
    %7 = "arith.constant"() <{value = 4 : index}> : () -> index loc("<stdin>":22:10)
    %8 = "arith.constant"() <{value = 1 : index}> : () -> index loc("<stdin>":23:10)
    %9 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<4x5xf32> loc("<stdin>":24:10)
    %10 = "gpu.alloc"() <{operandSegmentSizes = array<i32: 0, 0, 0>}> : () -> memref<4x5xf32> loc("<stdin>":25:11)
    "gpu.memcpy"(%10, %arg2) : (memref<4x5xf32>, memref<4x5xf32>) -> () loc("<stdin>":26:5)
    %11 = "gpu.alloc"() <{operandSegmentSizes = array<i32: 0, 0, 0>}> : () -> memref<4x5xf32> loc("<stdin>":27:11)
    "gpu.launch_func"(%7, %6, %8, %8, %8, %8, %10, %11) <{kernel = @test_kernel::@test_relu, operandSegmentSizes = array<i32: 0, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 2, 0>}> : (index, index, index, index, index, index, memref<4x5xf32>, memref<4x5xf32>) -> () loc("<stdin>":28:5)
    "gpu.memcpy"(%9, %11) : (memref<4x5xf32>, memref<4x5xf32>) -> () loc("<stdin>":29:5)
    "gpu.dealloc"(%10) : (memref<4x5xf32>) -> () loc("<stdin>":30:5)
    "gpu.dealloc"(%11) : (memref<4x5xf32>) -> () loc("<stdin>":31:5)
    "func.return"(%9) : (memref<4x5xf32>) -> () loc("<stdin>":32:5)
  }) : () -> () loc("<stdin>":19:3)
  "gpu.module"() <{sym_name = "test_kernel"}> ({
    "gpu.func"() <{function_type = (memref<4x5xf32>, memref<4x5xf32>) -> (), kernel}> ({
    ^bb0(%arg0: memref<4x5xf32> loc("<stdin>":36:10), %arg1: memref<4x5xf32> loc("<stdin>":36:34)):
      %0 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32 loc("<stdin>":37:12)
      %1 = "gpu.block_id"() <{dimension = #gpu<dim x>}> : () -> index loc("<stdin>":38:12)
      %2 = "gpu.block_id"() <{dimension = #gpu<dim y>}> : () -> index loc("<stdin>":39:12)
      %3 = "memref.load"(%arg0, %1, %2) : (memref<4x5xf32>, index, index) -> f32 loc("<stdin>":40:12)
      %4 = "arith.cmpf"(%3, %0) <{fastmath = #arith.fastmath<none>, predicate = 2 : i64}> : (f32, f32) -> i1 loc("<stdin>":41:12)
      %5 = "arith.select"(%4, %3, %0) : (i1, f32, f32) -> f32 loc("<stdin>":42:12)
      "memref.store"(%5, %arg1, %1, %2) : (f32, memref<4x5xf32>, index, index) -> () loc("<stdin>":43:7)
      "gpu.return"() : () -> () loc("<stdin>":44:7)
    }) {gpu.known_block_size = array<i32: 1, 1, 1>, gpu.known_grid_size = array<i32: 4, 5, 1>, spirv.entry_point_abi = #spirv.entry_point_abi<>, sym_name = "test_relu"} : () -> () loc("<stdin>":35:5)
  }) {spirv.target_env = #spirv.target_env<#spirv.vce<v1.0, [Addresses, Int64, Int8, Kernel], []>, api=OpenCL, #spirv.resource_limits<>>} : () -> () loc("<stdin>":34:3)
}) {gpu.container_module} : () -> () loc("<stdin>":1:1)
