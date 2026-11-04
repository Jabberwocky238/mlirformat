"builtin.module"() ({
  "func.func"() <{function_type = (f32) -> (), sym_name = "cast1"}> ({
  ^bb0(%arg5: f32):
    %5 = "spirv.Bitcast"(%arg5) : (f32) -> i32
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<2xf32>) -> (), sym_name = "cast2"}> ({
  ^bb0(%arg4: vector<2xf32>):
    %4 = "spirv.Bitcast"(%arg4) : (vector<2xf32>) -> vector<2xi32>
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<2xf32>) -> (), sym_name = "cast3"}> ({
  ^bb0(%arg3: vector<2xf32>):
    %3 = "spirv.Bitcast"(%arg3) : (vector<2xf32>) -> i64
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (!spirv.ptr<f32, Function>) -> (), sym_name = "cast4"}> ({
  ^bb0(%arg2: !spirv.ptr<f32, Function>):
    %2 = "spirv.Bitcast"(%arg2) : (!spirv.ptr<f32, Function>) -> !spirv.ptr<i32, Function>
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (!spirv.ptr<f32, Function>) -> (), sym_name = "cast5"}> ({
  ^bb0(%arg1: !spirv.ptr<f32, Function>):
    %1 = "spirv.Bitcast"(%arg1) : (!spirv.ptr<f32, Function>) -> !spirv.ptr<vector<2xi32>, Function>
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<4xf32>) -> (), sym_name = "cast6"}> ({
  ^bb0(%arg0: vector<4xf32>):
    %0 = "spirv.Bitcast"(%arg0) : (vector<4xf32>) -> vector<2xi64>
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
// -----
// -----
// -----
// -----
// -----
"builtin.module"() ({
  "func.func"() <{function_type = (f32) -> i32, sym_name = "convert_f_to_s_scalar"}> ({
  ^bb0(%arg0: f32):
    %0 = "spirv.ConvertFToS"(%arg0) : (f32) -> i32
    "spirv.ReturnValue"(%0) : (i32) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (f64) -> i32, sym_name = "convert_f64_to_s32_scalar"}> ({
  ^bb0(%arg0: f64):
    %0 = "spirv.ConvertFToS"(%arg0) : (f64) -> i32
    "spirv.ReturnValue"(%0) : (i32) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<3xf32>) -> vector<3xi32>, sym_name = "convert_f_to_s_vector"}> ({
  ^bb0(%arg0: vector<3xf32>):
    %0 = "spirv.ConvertFToS"(%arg0) : (vector<3xf32>) -> vector<3xi32>
    "spirv.ReturnValue"(%0) : (vector<3xi32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (bf16) -> i32, sym_name = "convert_bf16_to_s32_scalar"}> ({
  ^bb0(%arg0: bf16):
    %0 = "spirv.ConvertFToS"(%arg0) : (bf16) -> i32
    "spirv.ReturnValue"(%0) : (i32) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (f32) -> i32, sym_name = "convert_f_to_u_scalar"}> ({
  ^bb0(%arg0: f32):
    %0 = "spirv.ConvertFToU"(%arg0) : (f32) -> i32
    "spirv.ReturnValue"(%0) : (i32) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (f64) -> i32, sym_name = "convert_f64_to_u32_scalar"}> ({
  ^bb0(%arg0: f64):
    %0 = "spirv.ConvertFToU"(%arg0) : (f64) -> i32
    "spirv.ReturnValue"(%0) : (i32) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<3xf32>) -> vector<3xi32>, sym_name = "convert_f_to_u_vector"}> ({
  ^bb0(%arg0: vector<3xf32>):
    %0 = "spirv.ConvertFToU"(%arg0) : (vector<3xf32>) -> vector<3xi32>
    "spirv.ReturnValue"(%0) : (vector<3xi32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (!spirv.coopmatrix<8x16xf32, Subgroup, MatrixB>) -> (), sym_name = "convert_f_to_u.coopmatrix"}> ({
  ^bb0(%arg0: !spirv.coopmatrix<8x16xf32, Subgroup, MatrixB>):
    %0 = "spirv.ConvertFToU"(%arg0) : (!spirv.coopmatrix<8x16xf32, Subgroup, MatrixB>) -> !spirv.coopmatrix<8x16xi32, Subgroup, MatrixB>
    "spirv.Return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (bf16) -> i32, sym_name = "convert_bf16_to_u32_scalar"}> ({
  ^bb0(%arg0: bf16):
    %0 = "spirv.ConvertFToU"(%arg0) : (bf16) -> i32
    "spirv.ReturnValue"(%0) : (i32) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (i32) -> f32, sym_name = "convert_s_to_f_scalar"}> ({
  ^bb0(%arg0: i32):
    %0 = "spirv.ConvertSToF"(%arg0) : (i32) -> f32
    "spirv.ReturnValue"(%0) : (f32) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (i64) -> f32, sym_name = "convert_s64_to_f32_scalar"}> ({
  ^bb0(%arg0: i64):
    %0 = "spirv.ConvertSToF"(%arg0) : (i64) -> f32
    "spirv.ReturnValue"(%0) : (f32) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<3xi32>) -> vector<3xf32>, sym_name = "convert_s_to_f_vector"}> ({
  ^bb0(%arg0: vector<3xi32>):
    %0 = "spirv.ConvertSToF"(%arg0) : (vector<3xi32>) -> vector<3xf32>
    "spirv.ReturnValue"(%0) : (vector<3xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (i32) -> bf16, sym_name = "convert_s32_to_bf16_scalar"}> ({
  ^bb0(%arg0: i32):
    %0 = "spirv.ConvertSToF"(%arg0) : (i32) -> bf16
    "spirv.ReturnValue"(%0) : (bf16) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (i32) -> f32, sym_name = "convert_u_to_f_scalar"}> ({
  ^bb0(%arg0: i32):
    %0 = "spirv.ConvertUToF"(%arg0) : (i32) -> f32
    "spirv.ReturnValue"(%0) : (f32) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (i64) -> f32, sym_name = "convert_u64_to_f32_scalar"}> ({
  ^bb0(%arg0: i64):
    %0 = "spirv.ConvertUToF"(%arg0) : (i64) -> f32
    "spirv.ReturnValue"(%0) : (f32) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<3xi32>) -> vector<3xf32>, sym_name = "convert_u_to_f_vector"}> ({
  ^bb0(%arg0: vector<3xi32>):
    %0 = "spirv.ConvertUToF"(%arg0) : (vector<3xi32>) -> vector<3xf32>
    "spirv.ReturnValue"(%0) : (vector<3xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (i32) -> bf16, sym_name = "convert_u32_to_bf16_scalar"}> ({
  ^bb0(%arg0: i32):
    %0 = "spirv.ConvertUToF"(%arg0) : (i32) -> bf16
    "spirv.ReturnValue"(%0) : (bf16) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (f32) -> f64, sym_name = "f_convert_scalar"}> ({
  ^bb0(%arg0: f32):
    %0 = "spirv.FConvert"(%arg0) : (f32) -> f64
    "spirv.ReturnValue"(%0) : (f64) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<3xf32>) -> vector<3xf64>, sym_name = "f_convert_vector"}> ({
  ^bb0(%arg0: vector<3xf32>):
    %0 = "spirv.FConvert"(%arg0) : (vector<3xf32>) -> vector<3xf64>
    "spirv.ReturnValue"(%0) : (vector<3xf64>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (!spirv.coopmatrix<8x16xf32, Subgroup, MatrixA>) -> (), sym_name = "f_convert_coop_matrix"}> ({
  ^bb0(%arg0: !spirv.coopmatrix<8x16xf32, Subgroup, MatrixA>):
    %0 = "spirv.FConvert"(%arg0) : (!spirv.coopmatrix<8x16xf32, Subgroup, MatrixA>) -> !spirv.coopmatrix<8x16xf64, Subgroup, MatrixA>
    "spirv.Return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
// -----
"builtin.module"() ({
  "func.func"() <{function_type = (bf16) -> f32, sym_name = "f_convert_bf16_to_f32_scalar"}> ({
  ^bb0(%arg0: bf16):
    %0 = "spirv.FConvert"(%arg0) : (bf16) -> f32
    "spirv.ReturnValue"(%0) : (f32) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<3xf32>) -> vector<3xbf16>, sym_name = "f_convert_f32_to_bf16_vector"}> ({
  ^bb0(%arg0: vector<3xf32>):
    %0 = "spirv.FConvert"(%arg0) : (vector<3xf32>) -> vector<3xbf16>
    "spirv.ReturnValue"(%0) : (vector<3xbf16>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (!spirv.coopmatrix<8x16xf32, Subgroup, MatrixA>) -> !spirv.coopmatrix<8x16xbf16, Subgroup, MatrixA>, sym_name = "f_convert_f32_to_bf16_coop_matrix"}> ({
  ^bb0(%arg0: !spirv.coopmatrix<8x16xf32, Subgroup, MatrixA>):
    %0 = "spirv.FConvert"(%arg0) : (!spirv.coopmatrix<8x16xf32, Subgroup, MatrixA>) -> !spirv.coopmatrix<8x16xbf16, Subgroup, MatrixA>
    "spirv.ReturnValue"(%0) : (!spirv.coopmatrix<8x16xbf16, Subgroup, MatrixA>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (i32) -> i64, sym_name = "s_convert_scalar"}> ({
  ^bb0(%arg0: i32):
    %0 = "spirv.SConvert"(%arg0) : (i32) -> i64
    "spirv.ReturnValue"(%0) : (i64) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (i32) -> i64, sym_name = "u_convert_scalar"}> ({
  ^bb0(%arg0: i32):
    %0 = "spirv.UConvert"(%arg0) : (i32) -> i64
    "spirv.ReturnValue"(%0) : (i64) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (!spirv.ptr<f32, CrossWorkgroup>) -> (), sym_name = "ptrcasttogeneric1"}> ({
  ^bb0(%arg0: !spirv.ptr<f32, CrossWorkgroup>):
    %0 = "spirv.PtrCastToGeneric"(%arg0) : (!spirv.ptr<f32, CrossWorkgroup>) -> !spirv.ptr<f32, Generic>
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
// -----
// -----
// -----
"builtin.module"() ({
  "func.func"() <{function_type = (!spirv.ptr<vector<2xi32>, Generic>) -> (), sym_name = "genericcasttoptr1"}> ({
  ^bb0(%arg0: !spirv.ptr<vector<2xi32>, Generic>):
    %0 = "spirv.GenericCastToPtr"(%arg0) : (!spirv.ptr<vector<2xi32>, Generic>) -> !spirv.ptr<vector<2xi32>, CrossWorkgroup>
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
// -----
// -----
// -----
"builtin.module"() ({
  "func.func"() <{function_type = (!spirv.ptr<vector<2xi32>, Generic>) -> (), sym_name = "genericcasttoptrexplicit1"}> ({
  ^bb0(%arg0: !spirv.ptr<vector<2xi32>, Generic>):
    %0 = "spirv.GenericCastToPtrExplicit"(%arg0) : (!spirv.ptr<vector<2xi32>, Generic>) -> !spirv.ptr<vector<2xi32>, CrossWorkgroup>
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
// -----
// -----
// -----
"builtin.module"() ({
  "spirv.module"() <{addressing_model = #spirv.addressing_model<Physical64>, memory_model = #spirv.memory_model<OpenCL>, vce_triple = #spirv.vce<v1.0, [Kernel, Addresses], []>}> ({
    "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (!spirv.ptr<i32, Generic>) -> (), sym_name = "covert_ptr_to_u"}> ({
    ^bb0(%arg2: !spirv.ptr<i32, Generic>):
      %2 = "spirv.ConvertPtrToU"(%arg2) : (!spirv.ptr<i32, Generic>) -> i32
      "spirv.Return"() : () -> ()
    }) : () -> ()
    "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (!spirv.ptr<i64, Generic>) -> (), sym_name = "covert_ptr_to_u_truncate"}> ({
    ^bb0(%arg1: !spirv.ptr<i64, Generic>):
      %1 = "spirv.ConvertPtrToU"(%arg1) : (!spirv.ptr<i64, Generic>) -> i32
      "spirv.Return"() : () -> ()
    }) : () -> ()
    "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (!spirv.ptr<i32, Generic>) -> (), sym_name = "covert_ptr_to_u_extend"}> ({
    ^bb0(%arg0: !spirv.ptr<i32, Generic>):
      %0 = "spirv.ConvertPtrToU"(%arg0) : (!spirv.ptr<i32, Generic>) -> i64
      "spirv.Return"() : () -> ()
    }) : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "spirv.module"() <{addressing_model = #spirv.addressing_model<PhysicalStorageBuffer64>, memory_model = #spirv.memory_model<OpenCL>, vce_triple = #spirv.vce<v1.0, [Kernel, Addresses, PhysicalStorageBufferAddresses], []>}> ({
    "spirv.func"() <{arg_attrs = [{spirv.decoration = #spirv.decoration<Aliased>}], function_control = #spirv.function_control<None>, function_type = (!spirv.ptr<i32, PhysicalStorageBuffer>) -> (), sym_name = "covert_ptr_to_u_PhysicalStorageBuffer"}> ({
    ^bb0(%arg0: !spirv.ptr<i32, PhysicalStorageBuffer>):
      %0 = "spirv.ConvertPtrToU"(%arg0) : (!spirv.ptr<i32, PhysicalStorageBuffer>) -> i32
      "spirv.Return"() : () -> ()
    }) : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
// -----
// -----
"builtin.module"() ({
  "spirv.module"() <{addressing_model = #spirv.addressing_model<Physical64>, memory_model = #spirv.memory_model<OpenCL>, vce_triple = #spirv.vce<v1.0, [Kernel, Addresses], []>}> ({
    "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (i32) -> (), sym_name = "covert_u_to_ptr"}> ({
    ^bb0(%arg2: i32):
      %2 = "spirv.ConvertUToPtr"(%arg2) : (i32) -> !spirv.ptr<i32, Generic>
      "spirv.Return"() : () -> ()
    }) : () -> ()
    "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (i64) -> (), sym_name = "covert_u_to_ptr_truncate"}> ({
    ^bb0(%arg1: i64):
      %1 = "spirv.ConvertUToPtr"(%arg1) : (i64) -> !spirv.ptr<i32, Generic>
      "spirv.Return"() : () -> ()
    }) : () -> ()
    "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (i32) -> (), sym_name = "covert_u_to_ptr_extend"}> ({
    ^bb0(%arg0: i32):
      %0 = "spirv.ConvertUToPtr"(%arg0) : (i32) -> !spirv.ptr<i64, Generic>
      "spirv.Return"() : () -> ()
    }) : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "spirv.module"() <{addressing_model = #spirv.addressing_model<PhysicalStorageBuffer64>, memory_model = #spirv.memory_model<OpenCL>, vce_triple = #spirv.vce<v1.0, [Kernel, Addresses, PhysicalStorageBufferAddresses], []>}> ({
    "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (i32) -> (), sym_name = "covert_u_to_ptr_PhysicalStorageBuffer"}> ({
    ^bb0(%arg0: i32):
      %0 = "spirv.ConvertUToPtr"(%arg0) : (i32) -> !spirv.ptr<i32, PhysicalStorageBuffer>
      "spirv.Return"() : () -> ()
    }) : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
// -----
