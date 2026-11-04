"builtin.module"() ({
  "gpu.module"() <{sym_name = "kernels"}> ({
    "gpu.func"() <{function_type = (memref<6xi32>, memref<6xi32>) -> ()}> ({
    ^bb0(%arg0: memref<6xi32>, %arg1: memref<6xi32>):
      %8 = "arith.constant"() <{value = 2 : i32}> : () -> i32
      %9 = "arith.constant"() <{value = 0 : index}> : () -> index
      %10 = "arith.constant"() <{value = 1 : index}> : () -> index
      %11 = "arith.constant"() <{value = 2 : index}> : () -> index
      %12 = "arith.constant"() <{value = 3 : index}> : () -> index
      %13 = "arith.constant"() <{value = 4 : index}> : () -> index
      %14 = "arith.constant"() <{value = 5 : index}> : () -> index
      %15 = "memref.load"(%arg0, %9) : (memref<6xi32>, index) -> i32
      %16 = "memref.load"(%arg0, %10) : (memref<6xi32>, index) -> i32
      %17 = "memref.load"(%arg0, %11) : (memref<6xi32>, index) -> i32
      %18 = "memref.load"(%arg0, %12) : (memref<6xi32>, index) -> i32
      %19 = "memref.load"(%arg0, %13) : (memref<6xi32>, index) -> i32
      %20 = "memref.load"(%arg0, %14) : (memref<6xi32>, index) -> i32
      %21 = "arith.muli"(%15, %8) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
      %22 = "arith.muli"(%16, %8) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
      %23 = "arith.muli"(%17, %8) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
      %24 = "arith.muli"(%18, %8) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
      %25 = "arith.muli"(%19, %8) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
      %26 = "arith.muli"(%20, %8) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
      "memref.store"(%21, %arg1, %9) : (i32, memref<6xi32>, index) -> ()
      "memref.store"(%22, %arg1, %10) : (i32, memref<6xi32>, index) -> ()
      "memref.store"(%23, %arg1, %11) : (i32, memref<6xi32>, index) -> ()
      "memref.store"(%24, %arg1, %12) : (i32, memref<6xi32>, index) -> ()
      "memref.store"(%25, %arg1, %13) : (i32, memref<6xi32>, index) -> ()
      "memref.store"(%26, %arg1, %14) : (i32, memref<6xi32>, index) -> ()
      "gpu.return"() : () -> ()
    }) {gpu.kernel, spirv.entry_point_abi = #spirv.entry_point_abi<workgroup_size = [1, 1, 1]>, sym_name = "double", workgroup_attributions = 0 : i64} : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "main"}> ({
    %0 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<6xi32>
    %1 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<6xi32>
    %2 = "arith.constant"() <{value = 4 : i32}> : () -> i32
    %3 = "arith.constant"() <{value = 0 : i32}> : () -> i32
    %4 = "memref.cast"(%0) : (memref<6xi32>) -> memref<?xi32>
    %5 = "memref.cast"(%1) : (memref<6xi32>) -> memref<?xi32>
    "func.call"(%4, %2) <{callee = @fillI32Buffer}> : (memref<?xi32>, i32) -> ()
    "func.call"(%5, %3) <{callee = @fillI32Buffer}> : (memref<?xi32>, i32) -> ()
    %6 = "arith.constant"() <{value = 1 : index}> : () -> index
    "gpu.launch_func"(%6, %6, %6, %6, %6, %6, %0, %1) <{kernel = @kernels::@double, operandSegmentSizes = array<i32: 0, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 2, 0>}> : (index, index, index, index, index, index, memref<6xi32>, memref<6xi32>) -> ()
    %7 = "memref.cast"(%1) : (memref<6xi32>) -> memref<*xi32>
    "func.call"(%7) <{callee = @printMemrefI32}> : (memref<*xi32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<?xi32>, i32) -> (), sym_name = "fillI32Buffer", sym_visibility = "private"}> ({
  }) : () -> ()
  "func.func"() <{function_type = (memref<*xi32>) -> (), sym_name = "printMemrefI32", sym_visibility = "private"}> ({
  }) : () -> ()
}) {gpu.container_module, spirv.target_env = #spirv.target_env<#spirv.vce<v1.0, [Shader], [SPV_KHR_variable_pointers]>, #spirv.resource_limits<max_compute_workgroup_size = [128, 128, 64]>>} : () -> ()

