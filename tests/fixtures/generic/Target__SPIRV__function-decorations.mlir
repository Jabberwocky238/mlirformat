"builtin.module"() ({
  "spirv.module"() <{addressing_model = #spirv.addressing_model<Logical>, memory_model = #spirv.memory_model<GLSL450>, vce_triple = #spirv.vce<v1.0, [Shader, Linkage, Int8, Int16], []>}> ({
    "spirv.func"() <{function_control = #spirv.function_control<DontInline>, function_type = () -> (), sym_name = "linkage_attr_test_kernel"}> ({
      %0 = "spirv.Constant"() <{value = 0 : i8}> : () -> i8
      %1 = "spirv.Constant"() <{value = 1 : i16}> : () -> i16
      %2 = "spirv.Constant"() <{value = 0 : i32}> : () -> i32
      "spirv.FunctionCall"(%0) <{callee = @outside.func.with.linkage}> : (i8) -> ()
      "spirv.Return"() : () -> ()
    }) : () -> ()
    "spirv.func"() <{function_control = #spirv.function_control<Pure>, function_type = (i8) -> (), linkage_attributes = #spirv.linkage_attributes<linkage_name = "outside.func", linkage_type = <Import>>, sym_name = "outside.func.with.linkage"}> ({
    }) : () -> ()
    "spirv.func"() <{function_control = #spirv.function_control<Pure>, function_type = () -> (), sym_name = "inside.func"}> ({
      "spirv.Return"() : () -> ()
    }) : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "spirv.module"() <{addressing_model = #spirv.addressing_model<PhysicalStorageBuffer64>, memory_model = #spirv.memory_model<GLSL450>, vce_triple = #spirv.vce<v1.0, [Shader, PhysicalStorageBufferAddresses, Linkage], [SPV_KHR_physical_storage_buffer]>}> ({
    "spirv.func"() <{arg_attrs = [{spirv.decoration = #spirv.decoration<Aliased>}], function_control = #spirv.function_control<None>, function_type = (!spirv.ptr<i32, PhysicalStorageBuffer>) -> (), sym_name = "func_arg_decoration_aliased"}> ({
    ^bb0(%arg0: !spirv.ptr<i32, PhysicalStorageBuffer>):
      "spirv.Return"() : () -> ()
    }) : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "spirv.module"() <{addressing_model = #spirv.addressing_model<PhysicalStorageBuffer64>, memory_model = #spirv.memory_model<GLSL450>, vce_triple = #spirv.vce<v1.0, [Shader, PhysicalStorageBufferAddresses, Linkage], [SPV_KHR_physical_storage_buffer]>}> ({
    "spirv.func"() <{arg_attrs = [{spirv.decoration = #spirv.decoration<Restrict>}], function_control = #spirv.function_control<None>, function_type = (!spirv.ptr<i32, PhysicalStorageBuffer>) -> (), sym_name = "func_arg_decoration_restrict"}> ({
    ^bb0(%arg0: !spirv.ptr<i32, PhysicalStorageBuffer>):
      "spirv.Return"() : () -> ()
    }) : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "spirv.module"() <{addressing_model = #spirv.addressing_model<PhysicalStorageBuffer64>, memory_model = #spirv.memory_model<GLSL450>, vce_triple = #spirv.vce<v1.0, [Shader, PhysicalStorageBufferAddresses, Linkage, GenericPointer], [SPV_KHR_physical_storage_buffer]>}> ({
    "spirv.func"() <{arg_attrs = [{spirv.decoration = #spirv.decoration<AliasedPointer>}], function_control = #spirv.function_control<None>, function_type = (!spirv.ptr<!spirv.ptr<i32, PhysicalStorageBuffer>, Generic>) -> (), sym_name = "func_arg_decoration_aliased_pointer"}> ({
    ^bb0(%arg0: !spirv.ptr<!spirv.ptr<i32, PhysicalStorageBuffer>, Generic>):
      "spirv.Return"() : () -> ()
    }) : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "spirv.module"() <{addressing_model = #spirv.addressing_model<PhysicalStorageBuffer64>, memory_model = #spirv.memory_model<GLSL450>, vce_triple = #spirv.vce<v1.0, [Shader, PhysicalStorageBufferAddresses, Linkage, GenericPointer], [SPV_KHR_physical_storage_buffer]>}> ({
    "spirv.func"() <{arg_attrs = [{spirv.decoration = #spirv.decoration<RestrictPointer>}], function_control = #spirv.function_control<None>, function_type = (!spirv.ptr<!spirv.ptr<i32, PhysicalStorageBuffer>, Generic>) -> (), sym_name = "func_arg_decoration_restrict_pointer"}> ({
    ^bb0(%arg0: !spirv.ptr<!spirv.ptr<i32, PhysicalStorageBuffer>, Generic>):
      "spirv.Return"() : () -> ()
    }) : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "spirv.module"() <{addressing_model = #spirv.addressing_model<PhysicalStorageBuffer64>, memory_model = #spirv.memory_model<GLSL450>, vce_triple = #spirv.vce<v1.0, [Shader, PhysicalStorageBufferAddresses, Linkage], [SPV_KHR_physical_storage_buffer]>}> ({
    "spirv.func"() <{arg_attrs = [{}, {spirv.decoration = #spirv.decoration<Aliased>}], function_control = #spirv.function_control<None>, function_type = (i32, !spirv.ptr<i32, PhysicalStorageBuffer>) -> (), sym_name = "fn1"}> ({
    ^bb0(%arg2: i32, %arg3: !spirv.ptr<i32, PhysicalStorageBuffer>):
      "spirv.Return"() : () -> ()
    }) : () -> ()
    "spirv.func"() <{arg_attrs = [{spirv.decoration = #spirv.decoration<Aliased>}, {spirv.decoration = #spirv.decoration<Restrict>}], function_control = #spirv.function_control<None>, function_type = (!spirv.ptr<i32, PhysicalStorageBuffer>, !spirv.ptr<i32, PhysicalStorageBuffer>) -> (), sym_name = "fn2"}> ({
    ^bb0(%arg0: !spirv.ptr<i32, PhysicalStorageBuffer>, %arg1: !spirv.ptr<i32, PhysicalStorageBuffer>):
      "spirv.Return"() : () -> ()
    }) : () -> ()
  }) : () -> ()
}) : () -> ()

