module {
  spirv.func @bool_constant_scalar() "None" {
    %true = spirv.Constant true
    %false = spirv.Constant false
    spirv.Return
  }
  spirv.func @bool_constant_vector() "None" {
    %cst_vec_2xi1 = spirv.Constant dense<[true, false]> : vector<2xi1>
    %cst_vec_3xi1 = spirv.Constant dense<false> : vector<3xi1>
    spirv.Return
  }
  spirv.func @integer_constant_scalar() "None" {
    %cst0_i8 = spirv.Constant 0 : i8
    %cst-5_si64 = spirv.Constant -5 : si64
    %cst10_ui16 = spirv.Constant 10 : ui16
    spirv.Return
  }
  spirv.func @integer_constant_vector() "None" {
    %cst_vec_2xi32 = spirv.Constant dense<[2, 3]> : vector<2xi32>
    %cst_vec_2xsi32 = spirv.Constant dense<-4> : vector<2xsi32>
    %cst_vec_3xui32 = spirv.Constant dense<[2, 3, 4]> : vector<3xui32>
    spirv.Return
  }
  spirv.func @float_constant_scalar() "None" {
    %cst_f16 = spirv.Constant 5.000000e+00 : f16
    %cst_f64 = spirv.Constant 5.000000e+00 : f64
    spirv.Return
  }
  spirv.func @float_constant_vector() "None" {
    %cst_vec_2xf32 = spirv.Constant dense<[2.000000e+00, 3.000000e+00]> : vector<2xf32>
    spirv.Return
  }
}

