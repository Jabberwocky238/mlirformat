"builtin.module"() ({
  "spirv.module"() <{addressing_model = #spirv.addressing_model<Logical>, memory_model = #spirv.memory_model<GLSL450>, vce_triple = #spirv.vce<v1.0, [Shader, Linkage], []>}> ({
    "spirv.GlobalVariable"() <{location = 0 : i32, sym_name = "var", type = !spirv.ptr<vector<4xf32>, Input>}> : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "spirv.module"() <{addressing_model = #spirv.addressing_model<Logical>, memory_model = #spirv.memory_model<GLSL450>, vce_triple = #spirv.vce<v1.0, [Shader, Linkage], []>}> ({
    "spirv.GlobalVariable"() <{sym_name = "var", type = !spirv.ptr<vector<4xf32>, Input>}> {no_perspective} : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "spirv.module"() <{addressing_model = #spirv.addressing_model<Logical>, memory_model = #spirv.memory_model<GLSL450>, vce_triple = #spirv.vce<v1.0, [Shader, Linkage], []>}> ({
    "spirv.GlobalVariable"() <{sym_name = "var", type = !spirv.ptr<si32, Input>}> {flat} : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "spirv.module"() <{addressing_model = #spirv.addressing_model<Logical>, memory_model = #spirv.memory_model<GLSL450>, vce_triple = #spirv.vce<v1.0, [Shader, Linkage], [SPV_KHR_variable_pointers]>}> ({
    "spirv.GlobalVariable"() <{binding = 0 : i32, descriptor_set = 0 : i32, sym_name = "var1", type = !spirv.ptr<!spirv.struct<(!spirv.array<4 x f32, stride=4> [0])>, StorageBuffer>}> {aliased} : () -> ()
    "spirv.GlobalVariable"() <{binding = 0 : i32, descriptor_set = 0 : i32, sym_name = "var2", type = !spirv.ptr<!spirv.struct<(vector<4xf32> [0])>, StorageBuffer>}> {aliased} : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "spirv.module"() <{addressing_model = #spirv.addressing_model<Logical>, memory_model = #spirv.memory_model<GLSL450>, vce_triple = #spirv.vce<v1.0, [Shader, Linkage], [SPV_KHR_variable_pointers]>}> ({
    "spirv.GlobalVariable"() <{binding = 0 : i32, descriptor_set = 0 : i32, sym_name = "var", type = !spirv.ptr<!spirv.struct<(!spirv.array<4 x f32, stride=4> [0])>, StorageBuffer>}> {non_readable} : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "spirv.module"() <{addressing_model = #spirv.addressing_model<Logical>, memory_model = #spirv.memory_model<GLSL450>, vce_triple = #spirv.vce<v1.0, [Shader, Linkage], [SPV_KHR_variable_pointers]>}> ({
    "spirv.GlobalVariable"() <{binding = 0 : i32, descriptor_set = 0 : i32, sym_name = "var", type = !spirv.ptr<!spirv.struct<(!spirv.array<4 x f32, stride=4> [0])>, StorageBuffer>}> {non_writable} : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "spirv.module"() <{addressing_model = #spirv.addressing_model<Logical>, memory_model = #spirv.memory_model<GLSL450>, vce_triple = #spirv.vce<v1.0, [Shader, Linkage], [SPV_KHR_variable_pointers]>}> ({
    "spirv.GlobalVariable"() <{binding = 0 : i32, descriptor_set = 0 : i32, sym_name = "var", type = !spirv.ptr<!spirv.struct<(!spirv.array<4 x f32, stride=4> [0])>, StorageBuffer>}> {restrict} : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "spirv.module"() <{addressing_model = #spirv.addressing_model<Logical>, memory_model = #spirv.memory_model<GLSL450>, vce_triple = #spirv.vce<v1.0, [Shader, Linkage], []>}> ({
    "spirv.GlobalVariable"() <{location = 0 : i32, sym_name = "var", type = !spirv.ptr<vector<4xf32>, Output>}> {relaxed_precision} : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "spirv.module"() <{addressing_model = #spirv.addressing_model<Logical>, memory_model = #spirv.memory_model<GLSL450>, vce_triple = #spirv.vce<v1.0, [Shader, Tessellation, Linkage], []>}> ({
    "spirv.GlobalVariable"() <{sym_name = "var", type = !spirv.ptr<vector<4xf32>, Input>}> {patch} : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "spirv.module"() <{addressing_model = #spirv.addressing_model<Logical>, memory_model = #spirv.memory_model<GLSL450>, vce_triple = #spirv.vce<v1.0, [Shader, Linkage], []>}> ({
    "spirv.GlobalVariable"() <{sym_name = "var", type = !spirv.ptr<vector<2xf32>, Output>}> {invariant} : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "spirv.module"() <{addressing_model = #spirv.addressing_model<Logical>, memory_model = #spirv.memory_model<GLSL450>, vce_triple = #spirv.vce<v1.0, [Shader, Linkage], []>}> ({
    "spirv.GlobalVariable"() <{sym_name = "var", type = !spirv.ptr<vector<2xf32>, Output>}> {coherent} : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "spirv.module"() <{addressing_model = #spirv.addressing_model<Logical>, memory_model = #spirv.memory_model<GLSL450>, vce_triple = #spirv.vce<v1.0, [Shader, Linkage], []>}> ({
    "spirv.GlobalVariable"() <{sym_name = "var", type = !spirv.ptr<vector<2xf32>, Output>}> {index = 42 : i32} : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "spirv.module"() <{addressing_model = #spirv.addressing_model<Logical>, memory_model = #spirv.memory_model<GLSL450>, vce_triple = #spirv.vce<v1.0, [Shader, Linkage], []>}> ({
    "spirv.GlobalVariable"() <{linkage_attributes = #spirv.linkage_attributes<linkage_name = "outSideGlobalVar1", linkage_type = <Import>>, sym_name = "var1", type = !spirv.ptr<f32, Private>}> : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "spirv.module"() <{addressing_model = #spirv.addressing_model<Logical>, memory_model = #spirv.memory_model<OpenCL>, vce_triple = #spirv.vce<v1.0, [Kernel, Linkage], [SPV_KHR_no_integer_wrap_decoration]>}> ({
    "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (i32) -> i32, sym_name = "iadd_decorations"}> ({
    ^bb0(%arg0: i32):
      %0 = "spirv.IAdd"(%arg0, %arg0) {no_signed_wrap, no_unsigned_wrap} : (i32, i32) -> i32
      "spirv.ReturnValue"(%0) : (i32) -> ()
    }) : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "spirv.module"() <{addressing_model = #spirv.addressing_model<Logical>, memory_model = #spirv.memory_model<OpenCL>, vce_triple = #spirv.vce<v1.0, [Kernel, Linkage], []>}> ({
    "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (f32) -> f32, sym_name = "fadd_decorations"}> ({
    ^bb0(%arg0: f32):
      %0 = "spirv.FAdd"(%arg0, %arg0) {fp_fast_math_mode = #spirv.fastmath_mode<NotNaN|NotInf|NSZ>} : (f32, f32) -> f32
      "spirv.ReturnValue"(%0) : (f32) -> ()
    }) : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "spirv.module"() <{addressing_model = #spirv.addressing_model<Logical>, memory_model = #spirv.memory_model<GLSL450>, vce_triple = #spirv.vce<v1.0, [Shader, Linkage], []>}> ({
    "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (f32) -> f32, sym_name = "fmul_decorations"}> ({
    ^bb0(%arg0: f32):
      %0 = "spirv.FMul"(%arg0, %arg0) {no_contraction} : (f32, f32) -> f32
      "spirv.ReturnValue"(%0) : (f32) -> ()
    }) : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "spirv.module"() <{addressing_model = #spirv.addressing_model<Logical>, memory_model = #spirv.memory_model<OpenCL>, vce_triple = #spirv.vce<v1.0, [Kernel, Linkage, Float16], []>}> ({
    "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (f32) -> f16, sym_name = "fp_rounding_mode"}> ({
    ^bb0(%arg0: f32):
      %0 = "spirv.FConvert"(%arg0) {fp_rounding_mode = #spirv.fp_rounding_mode<RTN>} : (f32) -> f16
      "spirv.ReturnValue"(%0) : (f16) -> ()
    }) : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "spirv.module"() <{addressing_model = #spirv.addressing_model<Logical>, memory_model = #spirv.memory_model<GLSL450>, vce_triple = #spirv.vce<v1.0, [Shader, Linkage], []>}> ({
    "spirv.func"() <{arg_attrs = [{spirv.decoration = #spirv.decoration<RelaxedPrecision>}], function_control = #spirv.function_control<None>, function_type = (!spirv.ptr<f32, Function>) -> (), sym_name = "relaxed_precision_arg"}> ({
    ^bb0(%arg0: !spirv.ptr<f32, Function>):
      "spirv.Return"() : () -> ()
    }) {relaxed_precision} : () -> ()
  }) : () -> ()
}) : () -> ()

