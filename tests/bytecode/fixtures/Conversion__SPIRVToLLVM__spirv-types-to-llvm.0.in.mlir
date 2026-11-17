"builtin.module"() ({
  "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (!spirv.array<16 x f32>, !spirv.array<32 x vector<4xf32>>) -> (), sym_name = "array"}> ({
  }) : () -> () loc("<stdin>":2:3)
  "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (!spirv.array<16 x f32, stride=4>) -> (), sym_name = "array_with_natural_stride"}> ({
  }) : () -> () loc("<stdin>":4:3)
  "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (!spirv.ptr<i1, Uniform>, !spirv.ptr<f32, Private>) -> (), sym_name = "pointer_scalar"}> ({
  }) : () -> () loc("<stdin>":6:3)
  "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (!spirv.ptr<vector<4xi32>, Function>) -> (), sym_name = "pointer_vector"}> ({
  }) : () -> () loc("<stdin>":8:3)
  "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (!spirv.rtarray<vector<4xf32>>) -> (), sym_name = "runtime_array_vector"}> ({
  }) : () -> () loc("<stdin>":10:3)
  "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (!spirv.rtarray<f32>) -> (), sym_name = "runtime_array_scalar"}> ({
  }) : () -> () loc("<stdin>":12:3)
  "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (!spirv.struct<(f64)>) -> (), sym_name = "struct"}> ({
  }) : () -> () loc("<stdin>":14:3)
  "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (!spirv.struct<(i32, !spirv.struct<(i64, i32)>)>) -> (), sym_name = "struct_nested"}> ({
  }) : () -> () loc("<stdin>":16:3)
  "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (!spirv.struct<(i8 [0], i32 [4])>) -> (), sym_name = "struct_with_natural_offset"}> ({
  }) : () -> () loc("<stdin>":18:3)
}) : () -> () loc("<stdin>":1:1)
