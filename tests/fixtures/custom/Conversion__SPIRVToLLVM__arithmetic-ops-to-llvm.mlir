module {
  spirv.func @iadd_scalar(%arg0: i32, %arg1: i32) "None" {
    %0 = spirv.IAdd %arg0, %arg1 : i32
    spirv.Return
  }
  spirv.func @iadd_vector(%arg0: vector<4xi64>, %arg1: vector<4xi64>) "None" {
    %0 = spirv.IAdd %arg0, %arg1 : vector<4xi64>
    spirv.Return
  }
  spirv.func @isub_scalar(%arg0: i8, %arg1: i8) "None" {
    %0 = spirv.ISub %arg0, %arg1 : i8
    spirv.Return
  }
  spirv.func @isub_vector(%arg0: vector<2xi16>, %arg1: vector<2xi16>) "None" {
    %0 = spirv.ISub %arg0, %arg1 : vector<2xi16>
    spirv.Return
  }
  spirv.func @imul_scalar(%arg0: i32, %arg1: i32) "None" {
    %0 = spirv.IMul %arg0, %arg1 : i32
    spirv.Return
  }
  spirv.func @imul_vector(%arg0: vector<3xi32>, %arg1: vector<3xi32>) "None" {
    %0 = spirv.IMul %arg0, %arg1 : vector<3xi32>
    spirv.Return
  }
  spirv.func @fadd_scalar(%arg0: f16, %arg1: f16) "None" {
    %0 = spirv.FAdd %arg0, %arg1 : f16
    spirv.Return
  }
  spirv.func @fadd_vector(%arg0: vector<4xf32>, %arg1: vector<4xf32>) "None" {
    %0 = spirv.FAdd %arg0, %arg1 : vector<4xf32>
    spirv.Return
  }
  spirv.func @fsub_scalar(%arg0: f32, %arg1: f32) "None" {
    %0 = spirv.FSub %arg0, %arg1 : f32
    spirv.Return
  }
  spirv.func @fsub_vector(%arg0: vector<2xf32>, %arg1: vector<2xf32>) "None" {
    %0 = spirv.FSub %arg0, %arg1 : vector<2xf32>
    spirv.Return
  }
  spirv.func @fdiv_scalar(%arg0: f32, %arg1: f32) "None" {
    %0 = spirv.FDiv %arg0, %arg1 : f32
    spirv.Return
  }
  spirv.func @fdiv_vector(%arg0: vector<3xf64>, %arg1: vector<3xf64>) "None" {
    %0 = spirv.FDiv %arg0, %arg1 : vector<3xf64>
    spirv.Return
  }
  spirv.func @fmul_scalar(%arg0: f32, %arg1: f32) "None" {
    %0 = spirv.FMul %arg0, %arg1 : f32
    spirv.Return
  }
  spirv.func @fmul_vector(%arg0: vector<2xf32>, %arg1: vector<2xf32>) "None" {
    %0 = spirv.FMul %arg0, %arg1 : vector<2xf32>
    spirv.Return
  }
  spirv.func @frem_scalar(%arg0: f32, %arg1: f32) "None" {
    %0 = spirv.FRem %arg0, %arg1 : f32
    spirv.Return
  }
  spirv.func @frem_vector(%arg0: vector<3xf64>, %arg1: vector<3xf64>) "None" {
    %0 = spirv.FRem %arg0, %arg1 : vector<3xf64>
    spirv.Return
  }
  spirv.func @fneg_scalar(%arg0: f64) "None" {
    %0 = spirv.FNegate %arg0 : f64
    spirv.Return
  }
  spirv.func @fneg_vector(%arg0: vector<2xf32>) "None" {
    %0 = spirv.FNegate %arg0 : vector<2xf32>
    spirv.Return
  }
  spirv.func @udiv_scalar(%arg0: i32, %arg1: i32) "None" {
    %0 = spirv.UDiv %arg0, %arg1 : i32
    spirv.Return
  }
  spirv.func @udiv_vector(%arg0: vector<3xi64>, %arg1: vector<3xi64>) "None" {
    %0 = spirv.UDiv %arg0, %arg1 : vector<3xi64>
    spirv.Return
  }
  spirv.func @umod_scalar(%arg0: i32, %arg1: i32) "None" {
    %0 = spirv.UMod %arg0, %arg1 : i32
    spirv.Return
  }
  spirv.func @umod_vector(%arg0: vector<3xi64>, %arg1: vector<3xi64>) "None" {
    %0 = spirv.UMod %arg0, %arg1 : vector<3xi64>
    spirv.Return
  }
  spirv.func @sdiv_scalar(%arg0: i16, %arg1: i16) "None" {
    %0 = spirv.SDiv %arg0, %arg1 : i16
    spirv.Return
  }
  spirv.func @sdiv_vector(%arg0: vector<2xi64>, %arg1: vector<2xi64>) "None" {
    %0 = spirv.SDiv %arg0, %arg1 : vector<2xi64>
    spirv.Return
  }
  spirv.func @srem_scalar(%arg0: i32, %arg1: i32) "None" {
    %0 = spirv.SRem %arg0, %arg1 : i32
    spirv.Return
  }
  spirv.func @srem_vector(%arg0: vector<4xi32>, %arg1: vector<4xi32>) "None" {
    %0 = spirv.SRem %arg0, %arg1 : vector<4xi32>
    spirv.Return
  }
}

