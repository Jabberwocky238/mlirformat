module {
  spirv.func @bitcast_float_to_integer_scalar(%arg0: f32) "None" {
    %0 = spirv.Bitcast %arg0 : f32 to i32
    spirv.Return
  }
  spirv.func @bitcast_float_to_integer_vector(%arg0: vector<3xf32>) "None" {
    %0 = spirv.Bitcast %arg0 : vector<3xf32> to vector<3xi32>
    spirv.Return
  }
  spirv.func @bitcast_vector_to_scalar(%arg0: vector<2xf32>) "None" {
    %0 = spirv.Bitcast %arg0 : vector<2xf32> to i64
    spirv.Return
  }
  spirv.func @bitcast_scalar_to_vector(%arg0: f64) "None" {
    %0 = spirv.Bitcast %arg0 : f64 to vector<2xi32>
    spirv.Return
  }
  spirv.func @bitcast_vector_to_vector(%arg0: vector<4xf32>) "None" {
    %0 = spirv.Bitcast %arg0 : vector<4xf32> to vector<2xi64>
    spirv.Return
  }
  spirv.func @bitcast_pointer(%arg0: !spirv.ptr<f32, Function>) "None" {
    %0 = spirv.Bitcast %arg0 : !spirv.ptr<f32, Function> to !spirv.ptr<i32, Function>
    spirv.Return
  }
  spirv.func @convert_float_to_signed_scalar(%arg0: f32) "None" {
    %0 = spirv.ConvertFToS %arg0 : f32 to i32
    spirv.Return
  }
  spirv.func @convert_float_to_signed_vector(%arg0: vector<2xf32>) "None" {
    %0 = spirv.ConvertFToS %arg0 : vector<2xf32> to vector<2xi32>
    spirv.Return
  }
  spirv.func @convert_float_to_unsigned_scalar(%arg0: f32) "None" {
    %0 = spirv.ConvertFToU %arg0 : f32 to i32
    spirv.Return
  }
  spirv.func @convert_float_to_unsigned_vector(%arg0: vector<2xf32>) "None" {
    %0 = spirv.ConvertFToU %arg0 : vector<2xf32> to vector<2xi32>
    spirv.Return
  }
  spirv.func @convert_signed_to_float_scalar(%arg0: i32) "None" {
    %0 = spirv.ConvertSToF %arg0 : i32 to f32
    spirv.Return
  }
  spirv.func @convert_signed_to_float_vector(%arg0: vector<3xi32>) "None" {
    %0 = spirv.ConvertSToF %arg0 : vector<3xi32> to vector<3xf32>
    spirv.Return
  }
  spirv.func @convert_unsigned_to_float_scalar(%arg0: i32) "None" {
    %0 = spirv.ConvertUToF %arg0 : i32 to f32
    spirv.Return
  }
  spirv.func @convert_unsigned_to_float_vector(%arg0: vector<3xi32>) "None" {
    %0 = spirv.ConvertUToF %arg0 : vector<3xi32> to vector<3xf32>
    spirv.Return
  }
  spirv.func @fconvert_scalar(%arg0: f32, %arg1: f64) "None" {
    %0 = spirv.FConvert %arg0 : f32 to f64
    %1 = spirv.FConvert %arg1 : f64 to f32
    spirv.Return
  }
  spirv.func @fconvert_vector(%arg0: vector<2xf32>, %arg1: vector<2xf64>) "None" {
    %0 = spirv.FConvert %arg0 : vector<2xf32> to vector<2xf64>
    %1 = spirv.FConvert %arg1 : vector<2xf64> to vector<2xf32>
    spirv.Return
  }
  spirv.func @sconvert_scalar(%arg0: i32, %arg1: i64) "None" {
    %0 = spirv.SConvert %arg0 : i32 to i64
    %1 = spirv.SConvert %arg1 : i64 to i32
    spirv.Return
  }
  spirv.func @sconvert_vector(%arg0: vector<3xi32>, %arg1: vector<3xi64>) "None" {
    %0 = spirv.SConvert %arg0 : vector<3xi32> to vector<3xi64>
    %1 = spirv.SConvert %arg1 : vector<3xi64> to vector<3xi32>
    spirv.Return
  }
  spirv.func @uconvert_scalar(%arg0: i32, %arg1: i64) "None" {
    %0 = spirv.UConvert %arg0 : i32 to i64
    %1 = spirv.UConvert %arg1 : i64 to i32
    spirv.Return
  }
  spirv.func @uconvert_vector(%arg0: vector<3xi32>, %arg1: vector<3xi64>) "None" {
    %0 = spirv.UConvert %arg0 : vector<3xi32> to vector<3xi64>
    %1 = spirv.UConvert %arg1 : vector<3xi64> to vector<3xi32>
    spirv.Return
  }
}

