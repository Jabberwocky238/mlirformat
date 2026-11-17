"builtin.module"() ({
  "gpu.module"() <{sym_name = "kernels"}> ({
    "gpu.func"() <{function_type = (memref<8xf32>, memref<8xf32>, memref<8xf32>) -> (), kernel}> ({
    ^bb0(%arg0: memref<8xf32> loc("<stdin>":4:10), %arg1: memref<8xf32> loc("<stdin>":4:32), %arg2: memref<8xf32> loc("<stdin>":4:54)):
      %15 = "gpu.block_id"() <{dimension = #gpu<dim x>}> : () -> index loc("<stdin>":5:13)
      %16 = "arith.constant"() <{value = 4 : index}> : () -> index loc("<stdin>":6:13)
      %17 = "arith.cmpi"(%15, %16) <{predicate = 2 : i64}> : (index, index) -> i1 loc("<stdin>":7:13)
      "scf.if"(%17) ({
        %18 = "memref.load"(%arg0, %15) : (memref<8xf32>, index) -> f32 loc("<stdin>":9:15)
        %19 = "memref.load"(%arg1, %15) : (memref<8xf32>, index) -> f32 loc("<stdin>":10:15)
        %20 = "arith.addf"(%18, %19) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32 loc("<stdin>":11:15)
        "memref.store"(%20, %arg2, %15) : (f32, memref<8xf32>, index) -> () loc("<stdin>":12:9)
        "scf.yield"() : () -> () loc("<stdin>":13:9)
      }, {
      }) : (i1) -> () loc("<stdin>":8:7)
      "gpu.return"() : () -> () loc("<stdin>":16:7)
    }) {spirv.entry_point_abi = #spirv.entry_point_abi<workgroup_size = [1, 1, 1]>, sym_name = "kernel_add"} : () -> () loc("<stdin>":3:5)
  }) : () -> () loc("<stdin>":2:3)
  "func.func"() <{function_type = () -> (), sym_name = "main"}> ({
    %0 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<8xf32> loc("<stdin>":20:10)
    %1 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<8xf32> loc("<stdin>":21:10)
    %2 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<8xf32> loc("<stdin>":22:10)
    %3 = "arith.constant"() <{value = 0 : i32}> : () -> i32 loc("<stdin>":23:10)
    %4 = "arith.constant"() <{value = 1 : i32}> : () -> i32 loc("<stdin>":24:10)
    %5 = "arith.constant"() <{value = 2 : i32}> : () -> i32 loc("<stdin>":25:10)
    %6 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32 loc("<stdin>":26:10)
    %7 = "arith.constant"() <{value = 1.100000e+00 : f32}> : () -> f32 loc("<stdin>":27:10)
    %8 = "arith.constant"() <{value = 2.200000e+00 : f32}> : () -> f32 loc("<stdin>":28:10)
    %9 = "memref.cast"(%0) : (memref<8xf32>) -> memref<?xf32> loc("<stdin>":29:10)
    %10 = "memref.cast"(%1) : (memref<8xf32>) -> memref<?xf32> loc("<stdin>":30:11)
    %11 = "memref.cast"(%2) : (memref<8xf32>) -> memref<?xf32> loc("<stdin>":31:11)
    "func.call"(%9, %7) <{callee = @fillResource1DFloat}> : (memref<?xf32>, f32) -> () loc("<stdin>":32:5)
    "func.call"(%10, %8) <{callee = @fillResource1DFloat}> : (memref<?xf32>, f32) -> () loc("<stdin>":33:5)
    "func.call"(%11, %6) <{callee = @fillResource1DFloat}> : (memref<?xf32>, f32) -> () loc("<stdin>":34:5)
    %12 = "arith.constant"() <{value = 1 : index}> : () -> index loc("<stdin>":35:11)
    %13 = "arith.constant"() <{value = 8 : index}> : () -> index loc("<stdin>":36:11)
    "gpu.launch_func"(%13, %12, %12, %12, %12, %12, %0, %1, %2) <{kernel = @kernels::@kernel_add, operandSegmentSizes = array<i32: 0, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 3, 0>}> : (index, index, index, index, index, index, memref<8xf32>, memref<8xf32>, memref<8xf32>) -> () loc("<stdin>":37:5)
    %14 = "memref.cast"(%11) : (memref<?xf32>) -> memref<*xf32> loc("<stdin>":38:11)
    "func.call"(%14) <{callee = @printMemrefF32}> : (memref<*xf32>) -> () loc("<stdin>":39:5)
    "func.return"() : () -> () loc("<stdin>":40:5)
  }) : () -> () loc("<stdin>":19:3)
  "func.func"() <{function_type = (memref<?xf32>, f32) -> (), sym_name = "fillResource1DFloat", sym_visibility = "private"}> ({
  }) : () -> () loc("<stdin>":42:3)
  "func.func"() <{function_type = (memref<*xf32>) -> (), sym_name = "printMemrefF32", sym_visibility = "private"}> ({
  }) : () -> () loc("<stdin>":44:3)
}) {gpu.container_module, spirv.target_env = #spirv.target_env<#spirv.vce<v1.0, [Shader], [SPV_KHR_storage_buffer_storage_class]>, #spirv.resource_limits<>>} : () -> () loc("<stdin>":1:1)
