"builtin.module"() ({
  "func.func"() <{function_type = (!spirv.array<16 x f32>, !spirv.array<8 x i32>) -> (), sym_name = "scalar_array_type", sym_visibility = "private"}> ({
  }) : () -> () loc("<stdin>":2:3)
  "func.func"() <{function_type = (!spirv.array<32 x vector<4xf32>>) -> (), sym_name = "vector_array_type", sym_visibility = "private"}> ({
  }) : () -> () loc("<stdin>":4:3)
  "func.func"() <{function_type = (!spirv.array<4 x !spirv.array<4 x f32, stride=4>, stride=128>) -> (), sym_name = "array_type_stride", sym_visibility = "private"}> ({
  }) : () -> () loc("<stdin>":6:3)
  "func.func"() <{function_type = (!spirv.array<32 x vector<4xbf16>>) -> (), sym_name = "vector_array_type_bf16", sym_visibility = "private"}> ({
  }) : () -> () loc("<stdin>":8:3)
  "func.func"() <{function_type = (!spirv.array<16 x f16>, !spirv.array<16 x f64>) -> (), sym_name = "scalar_array_type_f64", sym_visibility = "private"}> ({
  }) : () -> () loc("<stdin>":10:3)
  "func.func"() <{function_type = (!spirv.array<16 x f8E4M3FN>, !spirv.array<16 x f8E5M2>) -> (), sym_name = "scalar_array_type_f8", sym_visibility = "private"}> ({
  }) : () -> () loc("<stdin>":12:3)
}) : () -> () loc("<stdin>":1:1)
