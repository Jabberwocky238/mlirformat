"builtin.module"() ({
  "spirv.module"() <{addressing_model = #spirv.addressing_model<Logical>, memory_model = #spirv.memory_model<GLSL450>, sym_name = "__spv__foo", vce_triple = #spirv.vce<v1.0, [Shader], [SPV_KHR_variable_pointers]>}> ({
    "spirv.GlobalVariable"() <{binding = 0 : i32, descriptor_set = 0 : i32, sym_name = "bar_arg_0", type = !spirv.ptr<!spirv.struct<(!spirv.array<6 x i32, stride=4> [0])>, StorageBuffer>}> : () -> () loc("<stdin>":3:5)
    "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = () -> (), sym_name = "bar"}> ({
      %2 = "spirv.mlir.addressof"() <{variable = @bar_arg_0}> : () -> !spirv.ptr<!spirv.struct<(!spirv.array<6 x i32, stride=4> [0])>, StorageBuffer> loc("<stdin>":5:12)
      "spirv.Return"() : () -> () loc("<stdin>":6:7)
    }) {workgroup_attributions = 0 : i64} : () -> () loc("<stdin>":4:5)
    "spirv.EntryPoint"() <{execution_model = #spirv.execution_model<GLCompute>, fn = @bar, interface = []}> : () -> () loc("<stdin>":8:5)
    "spirv.ExecutionMode"() <{execution_mode = #spirv.execution_mode<LocalSize>, fn = @bar, values = [1 : i32, 1 : i32, 1 : i32]}> : () -> () loc("<stdin>":9:5)
  }) : () -> () loc("<stdin>":2:3)
  "gpu.module"() <{sym_name = "foo"}> ({
    "gpu.func"() <{function_type = (memref<6xi32>) -> (), kernel}> ({
    ^bb0(%arg0: memref<6xi32> loc("<stdin>":13:10)):
      "gpu.return"() : () -> () loc("<stdin>":14:7)
    }) {spirv.entry_point_abi = #spirv.entry_point_abi<workgroup_size = [1, 1, 1]>, sym_name = "bar"} : () -> () loc("<stdin>":12:5)
  }) : () -> () loc("<stdin>":11:3)
  "func.func"() <{function_type = () -> (), sym_name = "main"}> ({
    %0 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<6xi32> loc("<stdin>":18:10)
    %1 = "arith.constant"() <{value = 1 : index}> : () -> index loc("<stdin>":19:10)
    "gpu.launch_func"(%1, %1, %1, %1, %1, %1, %0) <{kernel = @foo::@bar, operandSegmentSizes = array<i32: 0, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 1, 0>}> : (index, index, index, index, index, index, memref<6xi32>) -> () loc("<stdin>":20:5)
    "func.return"() : () -> () loc("<stdin>":21:5)
  }) : () -> () loc("<stdin>":17:3)
}) {gpu.container_module, spirv.target_env = #spirv.target_env<#spirv.vce<v1.0, [Shader], [SPV_KHR_variable_pointers]>, #spirv.resource_limits<max_compute_workgroup_size = [128, 128, 64]>>} : () -> () loc("<stdin>":1:1)
