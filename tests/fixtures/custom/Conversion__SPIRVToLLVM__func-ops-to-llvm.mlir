module {
  spirv.func @return() "None" {
    spirv.Return
  }
  spirv.func @return_value(%arg0: i32) -> i32 "None" {
    spirv.ReturnValue %arg0 : i32
  }
  spirv.func @none() "None" {
    spirv.Return
  }
  spirv.func @inline() "Inline" {
    spirv.Return
  }
  spirv.func @dont_inline() "DontInline" {
    spirv.Return
  }
  spirv.func @pure() "Pure" {
    spirv.Return
  }
  spirv.func @const() "Const" {
    spirv.Return
  }
  spirv.func @scalar_types(%arg0: i32, %arg1: i1, %arg2: f64, %arg3: f32) "None" {
    spirv.Return
  }
  spirv.func @vector_types(%arg0: vector<2xi64>, %arg1: vector<2xi64>) -> vector<2xi64> "None" {
    %0 = spirv.IAdd %arg0, %arg1 : vector<2xi64>
    spirv.ReturnValue %0 : vector<2xi64>
  }
  spirv.func @function_calls(%arg0: i32, %arg1: i1, %arg2: f64, %arg3: vector<2xi64>, %arg4: vector<2xf32>) "None" {
    spirv.FunctionCall @void_1() : () -> ()
    spirv.FunctionCall @void_2(%arg3) : (vector<2xi64>) -> ()
    %0 = spirv.FunctionCall @value_scalar(%arg0, %arg1, %arg2) : (i32, i1, f64) -> i32
    %1 = spirv.FunctionCall @value_vector(%arg3, %arg4) : (vector<2xi64>, vector<2xf32>) -> vector<2xf32>
    spirv.Return
  }
  spirv.func @void_1() "None" {
    spirv.Return
  }
  spirv.func @void_2(%arg0: vector<2xi64>) "None" {
    spirv.Return
  }
  spirv.func @value_scalar(%arg0: i32, %arg1: i1, %arg2: f64) -> i32 "None" {
    spirv.ReturnValue %arg0 : i32
  }
  spirv.func @value_vector(%arg0: vector<2xi64>, %arg1: vector<2xf32>) -> vector<2xf32> "None" {
    spirv.ReturnValue %arg1 : vector<2xf32>
  }
}

