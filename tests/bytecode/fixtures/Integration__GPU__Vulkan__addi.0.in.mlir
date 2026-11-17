"builtin.module"() ({
  "gpu.module"() <{sym_name = "kernels"}> ({
    "gpu.func"() <{function_type = (memref<8xi32>, memref<8x8xi32>, memref<8x8x8xi32>) -> (), kernel}> ({
    ^bb0(%arg0: memref<8xi32> loc("<stdin>":4:10), %arg1: memref<8x8xi32> loc("<stdin>":4:32), %arg2: memref<8x8x8xi32> loc("<stdin>":4:56)):
      %12 = "gpu.block_id"() <{dimension = #gpu<dim x>}> : () -> index loc("<stdin>":5:13)
      %13 = "gpu.block_id"() <{dimension = #gpu<dim y>}> : () -> index loc("<stdin>":6:13)
      %14 = "gpu.block_id"() <{dimension = #gpu<dim z>}> : () -> index loc("<stdin>":7:13)
      %15 = "memref.load"(%arg0, %12) : (memref<8xi32>, index) -> i32 loc("<stdin>":8:13)
      %16 = "memref.load"(%arg1, %13, %12) : (memref<8x8xi32>, index, index) -> i32 loc("<stdin>":9:13)
      %17 = "arith.addi"(%15, %16) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32 loc("<stdin>":10:13)
      "memref.store"(%17, %arg2, %14, %13, %12) : (i32, memref<8x8x8xi32>, index, index, index) -> () loc("<stdin>":11:7)
      "gpu.return"() : () -> () loc("<stdin>":12:7)
    }) {spirv.entry_point_abi = #spirv.entry_point_abi<workgroup_size = [1, 1, 1]>, sym_name = "kernel_addi"} : () -> () loc("<stdin>":3:5)
  }) : () -> () loc("<stdin>":2:3)
  "func.func"() <{function_type = () -> (), sym_name = "main"}> ({
    %0 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<8xi32> loc("<stdin>":16:10)
    %1 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<8x8xi32> loc("<stdin>":17:10)
    %2 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<8x8x8xi32> loc("<stdin>":18:10)
    %3 = "arith.constant"() <{value = 0 : i32}> : () -> i32 loc("<stdin>":19:10)
    %4 = "arith.constant"() <{value = 1 : i32}> : () -> i32 loc("<stdin>":20:10)
    %5 = "arith.constant"() <{value = 2 : i32}> : () -> i32 loc("<stdin>":21:10)
    %6 = "memref.cast"(%0) : (memref<8xi32>) -> memref<?xi32> loc("<stdin>":22:10)
    %7 = "memref.cast"(%1) : (memref<8x8xi32>) -> memref<?x?xi32> loc("<stdin>":23:10)
    %8 = "memref.cast"(%2) : (memref<8x8x8xi32>) -> memref<?x?x?xi32> loc("<stdin>":24:10)
    "func.call"(%6, %4) <{callee = @fillResource1DInt}> : (memref<?xi32>, i32) -> () loc("<stdin>":25:5)
    "func.call"(%7, %5) <{callee = @fillResource2DInt}> : (memref<?x?xi32>, i32) -> () loc("<stdin>":26:5)
    "func.call"(%8, %3) <{callee = @fillResource3DInt}> : (memref<?x?x?xi32>, i32) -> () loc("<stdin>":27:5)
    %9 = "arith.constant"() <{value = 1 : index}> : () -> index loc("<stdin>":28:10)
    %10 = "arith.constant"() <{value = 8 : index}> : () -> index loc("<stdin>":29:11)
    "gpu.launch_func"(%10, %10, %10, %9, %9, %9, %0, %1, %2) <{kernel = @kernels::@kernel_addi, operandSegmentSizes = array<i32: 0, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 3, 0>}> : (index, index, index, index, index, index, memref<8xi32>, memref<8x8xi32>, memref<8x8x8xi32>) -> () loc("<stdin>":30:5)
    %11 = "memref.cast"(%8) : (memref<?x?x?xi32>) -> memref<*xi32> loc("<stdin>":31:11)
    "func.call"(%11) <{callee = @printMemrefI32}> : (memref<*xi32>) -> () loc("<stdin>":32:5)
    "func.return"() : () -> () loc("<stdin>":33:5)
  }) : () -> () loc("<stdin>":15:3)
  "func.func"() <{function_type = (memref<?xi32>, i32) -> (), sym_name = "fillResource1DInt", sym_visibility = "private"}> ({
  }) : () -> () loc("<stdin>":35:3)
  "func.func"() <{function_type = (memref<?x?xi32>, i32) -> (), sym_name = "fillResource2DInt", sym_visibility = "private"}> ({
  }) : () -> () loc("<stdin>":37:3)
  "func.func"() <{function_type = (memref<?x?x?xi32>, i32) -> (), sym_name = "fillResource3DInt", sym_visibility = "private"}> ({
  }) : () -> () loc("<stdin>":39:3)
  "func.func"() <{function_type = (memref<*xi32>) -> (), sym_name = "printMemrefI32", sym_visibility = "private"}> ({
  }) : () -> () loc("<stdin>":41:3)
}) {gpu.container_module, spirv.target_env = #spirv.target_env<#spirv.vce<v1.0, [Shader], [SPV_KHR_storage_buffer_storage_class]>, #spirv.resource_limits<>>} : () -> () loc("<stdin>":1:1)
