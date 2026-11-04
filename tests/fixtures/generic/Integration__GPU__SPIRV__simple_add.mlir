"builtin.module"() ({
  "gpu.module"() <{sym_name = "kernels"}> ({
    "gpu.func"() <{function_type = (memref<3xf32>, memref<3x3xf32>, memref<3x3x3xf32>) -> ()}> ({
    ^bb0(%arg0: memref<3xf32>, %arg1: memref<3x3xf32>, %arg2: memref<3x3x3xf32>):
      %11 = "arith.constant"() <{value = 0 : index}> : () -> index
      %12 = "arith.constant"() <{value = 1 : index}> : () -> index
      %13 = "arith.constant"() <{value = 2 : index}> : () -> index
      %14 = "memref.load"(%arg0, %11) : (memref<3xf32>, index) -> f32
      %15 = "memref.load"(%arg1, %11, %11) : (memref<3x3xf32>, index, index) -> f32
      %16 = "arith.addf"(%14, %15) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "memref.store"(%16, %arg2, %11, %11, %11) : (f32, memref<3x3x3xf32>, index, index, index) -> ()
      "memref.store"(%16, %arg2, %11, %12, %11) : (f32, memref<3x3x3xf32>, index, index, index) -> ()
      "memref.store"(%16, %arg2, %11, %13, %11) : (f32, memref<3x3x3xf32>, index, index, index) -> ()
      "memref.store"(%16, %arg2, %12, %11, %12) : (f32, memref<3x3x3xf32>, index, index, index) -> ()
      "memref.store"(%16, %arg2, %12, %12, %12) : (f32, memref<3x3x3xf32>, index, index, index) -> ()
      "memref.store"(%16, %arg2, %12, %13, %12) : (f32, memref<3x3x3xf32>, index, index, index) -> ()
      "memref.store"(%16, %arg2, %13, %11, %13) : (f32, memref<3x3x3xf32>, index, index, index) -> ()
      "memref.store"(%16, %arg2, %13, %12, %13) : (f32, memref<3x3x3xf32>, index, index, index) -> ()
      "memref.store"(%16, %arg2, %13, %13, %13) : (f32, memref<3x3x3xf32>, index, index, index) -> ()
      "gpu.return"() : () -> ()
    }) {gpu.kernel, spirv.entry_point_abi = #spirv.entry_point_abi<workgroup_size = [1, 1, 1]>, sym_name = "sum", workgroup_attributions = 0 : i64} : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "main"}> ({
    %0 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<3xf32>
    %1 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<3x3xf32>
    %2 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<3x3x3xf32>
    %3 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %4 = "arith.constant"() <{value = 3.400000e+00 : f32}> : () -> f32
    %5 = "arith.constant"() <{value = 4.300000e+00 : f32}> : () -> f32
    %6 = "memref.cast"(%0) : (memref<3xf32>) -> memref<?xf32>
    %7 = "memref.cast"(%1) : (memref<3x3xf32>) -> memref<?x?xf32>
    %8 = "memref.cast"(%2) : (memref<3x3x3xf32>) -> memref<?x?x?xf32>
    "func.call"(%6, %4) <{callee = @fillF32Buffer1D}> : (memref<?xf32>, f32) -> ()
    "func.call"(%7, %5) <{callee = @fillF32Buffer2D}> : (memref<?x?xf32>, f32) -> ()
    "func.call"(%8, %3) <{callee = @fillF32Buffer3D}> : (memref<?x?x?xf32>, f32) -> ()
    %9 = "arith.constant"() <{value = 1 : index}> : () -> index
    "gpu.launch_func"(%9, %9, %9, %9, %9, %9, %0, %1, %2) <{kernel = @kernels::@sum, operandSegmentSizes = array<i32: 0, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 3, 0>}> : (index, index, index, index, index, index, memref<3xf32>, memref<3x3xf32>, memref<3x3x3xf32>) -> ()
    %10 = "memref.cast"(%2) : (memref<3x3x3xf32>) -> memref<*xf32>
    "func.call"(%10) <{callee = @printMemrefF32}> : (memref<*xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<?xf32>, f32) -> (), sym_name = "fillF32Buffer1D", sym_visibility = "private"}> ({
  }) : () -> ()
  "func.func"() <{function_type = (memref<?x?xf32>, f32) -> (), sym_name = "fillF32Buffer2D", sym_visibility = "private"}> ({
  }) : () -> ()
  "func.func"() <{function_type = (memref<?x?x?xf32>, f32) -> (), sym_name = "fillF32Buffer3D", sym_visibility = "private"}> ({
  }) : () -> ()
  "func.func"() <{function_type = (memref<*xf32>) -> (), sym_name = "printMemrefF32", sym_visibility = "private"}> ({
  }) : () -> ()
}) {gpu.container_module, spirv.target_env = #spirv.target_env<#spirv.vce<v1.0, [Shader], [SPV_KHR_storage_buffer_storage_class, SPV_KHR_8bit_storage]>, #spirv.resource_limits<max_compute_workgroup_size = [128, 128, 64]>>} : () -> ()

