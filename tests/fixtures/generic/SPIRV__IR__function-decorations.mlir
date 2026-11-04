"builtin.module"() ({
  "spirv.module"() <{addressing_model = #spirv.addressing_model<Logical>, memory_model = #spirv.memory_model<GLSL450>, vce_triple = #spirv.vce<v1.0, [Shader, Linkage], []>}> ({
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
  "spirv.func"() <{arg_attrs = [{spirv.decoration = #spirv.decoration<Aliased>}], function_control = #spirv.function_control<None>, function_type = (!spirv.ptr<i32, PhysicalStorageBuffer>) -> (), sym_name = "arg_decoration_pointer"}> ({
  ^bb0(%arg0: !spirv.ptr<i32, PhysicalStorageBuffer>):
    "spirv.Return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "spirv.func"() <{arg_attrs = [{spirv.decoration = #spirv.decoration<Restrict>}], function_control = #spirv.function_control<None>, function_type = (!spirv.ptr<i32, PhysicalStorageBuffer>) -> (), sym_name = "arg_decoration_pointer"}> ({
  ^bb0(%arg0: !spirv.ptr<i32, PhysicalStorageBuffer>):
    "spirv.Return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "spirv.func"() <{arg_attrs = [{spirv.decoration = #spirv.decoration<AliasedPointer>}], function_control = #spirv.function_control<None>, function_type = (!spirv.ptr<!spirv.ptr<i32, PhysicalStorageBuffer>, Generic>) -> (), sym_name = "arg_decoration_pointer"}> ({
  ^bb0(%arg0: !spirv.ptr<!spirv.ptr<i32, PhysicalStorageBuffer>, Generic>):
    "spirv.Return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "spirv.func"() <{arg_attrs = [{spirv.decoration = #spirv.decoration<RestrictPointer>}], function_control = #spirv.function_control<None>, function_type = (!spirv.ptr<!spirv.ptr<i32, PhysicalStorageBuffer>, Generic>) -> (), sym_name = "arg_decoration_pointer"}> ({
  ^bb0(%arg0: !spirv.ptr<!spirv.ptr<i32, PhysicalStorageBuffer>, Generic>):
    "spirv.Return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
// -----
// -----
// -----
// -----
// -----
