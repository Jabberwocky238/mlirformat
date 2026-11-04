module {
  spirv.func @i_equal_scalar(%arg0: i32, %arg1: i32) "None" {
    %0 = spirv.IEqual %arg0, %arg1 : i32
    spirv.Return
  }
  spirv.func @i_equal_vector(%arg0: vector<4xi64>, %arg1: vector<4xi64>) "None" {
    %0 = spirv.IEqual %arg0, %arg1 : vector<4xi64>
    spirv.Return
  }
  spirv.func @i_not_equal_scalar(%arg0: i64, %arg1: i64) "None" {
    %0 = spirv.INotEqual %arg0, %arg1 : i64
    spirv.Return
  }
  spirv.func @i_not_equal_vector(%arg0: vector<2xi64>, %arg1: vector<2xi64>) "None" {
    %0 = spirv.INotEqual %arg0, %arg1 : vector<2xi64>
    spirv.Return
  }
  spirv.func @s_greater_than_equal_scalar(%arg0: i64, %arg1: i64) "None" {
    %0 = spirv.SGreaterThanEqual %arg0, %arg1 : i64
    spirv.Return
  }
  spirv.func @s_greater_than_equal_vector(%arg0: vector<2xi64>, %arg1: vector<2xi64>) "None" {
    %0 = spirv.SGreaterThanEqual %arg0, %arg1 : vector<2xi64>
    spirv.Return
  }
  spirv.func @s_greater_than_scalar(%arg0: i64, %arg1: i64) "None" {
    %0 = spirv.SGreaterThan %arg0, %arg1 : i64
    spirv.Return
  }
  spirv.func @s_greater_than_vector(%arg0: vector<2xi64>, %arg1: vector<2xi64>) "None" {
    %0 = spirv.SGreaterThan %arg0, %arg1 : vector<2xi64>
    spirv.Return
  }
  spirv.func @s_less_than_equal_scalar(%arg0: i64, %arg1: i64) "None" {
    %0 = spirv.SLessThanEqual %arg0, %arg1 : i64
    spirv.Return
  }
  spirv.func @s_less_than_equal_vector(%arg0: vector<2xi64>, %arg1: vector<2xi64>) "None" {
    %0 = spirv.SLessThanEqual %arg0, %arg1 : vector<2xi64>
    spirv.Return
  }
  spirv.func @s_less_than_scalar(%arg0: i64, %arg1: i64) "None" {
    %0 = spirv.SLessThan %arg0, %arg1 : i64
    spirv.Return
  }
  spirv.func @s_less_than_vector(%arg0: vector<2xi64>, %arg1: vector<2xi64>) "None" {
    %0 = spirv.SLessThan %arg0, %arg1 : vector<2xi64>
    spirv.Return
  }
  spirv.func @u_greater_than_equal_scalar(%arg0: i64, %arg1: i64) "None" {
    %0 = spirv.UGreaterThanEqual %arg0, %arg1 : i64
    spirv.Return
  }
  spirv.func @u_greater_than_equal_vector(%arg0: vector<2xi64>, %arg1: vector<2xi64>) "None" {
    %0 = spirv.UGreaterThanEqual %arg0, %arg1 : vector<2xi64>
    spirv.Return
  }
  spirv.func @u_greater_than_scalar(%arg0: i64, %arg1: i64) "None" {
    %0 = spirv.UGreaterThan %arg0, %arg1 : i64
    spirv.Return
  }
  spirv.func @u_greater_than_vector(%arg0: vector<2xi64>, %arg1: vector<2xi64>) "None" {
    %0 = spirv.UGreaterThan %arg0, %arg1 : vector<2xi64>
    spirv.Return
  }
  spirv.func @u_less_than_equal_scalar(%arg0: i64, %arg1: i64) "None" {
    %0 = spirv.ULessThanEqual %arg0, %arg1 : i64
    spirv.Return
  }
  spirv.func @u_less_than_equal_vector(%arg0: vector<2xi64>, %arg1: vector<2xi64>) "None" {
    %0 = spirv.ULessThanEqual %arg0, %arg1 : vector<2xi64>
    spirv.Return
  }
  spirv.func @u_less_than_scalar(%arg0: i64, %arg1: i64) "None" {
    %0 = spirv.ULessThan %arg0, %arg1 : i64
    spirv.Return
  }
  spirv.func @u_less_than_vector(%arg0: vector<2xi64>, %arg1: vector<2xi64>) "None" {
    %0 = spirv.ULessThan %arg0, %arg1 : vector<2xi64>
    spirv.Return
  }
  spirv.func @f_ord_equal_scalar(%arg0: f32, %arg1: f32) "None" {
    %0 = spirv.FOrdEqual %arg0, %arg1 : f32
    spirv.Return
  }
  spirv.func @f_ord_equal_vector(%arg0: vector<4xf64>, %arg1: vector<4xf64>) "None" {
    %0 = spirv.FOrdEqual %arg0, %arg1 : vector<4xf64>
    spirv.Return
  }
  spirv.func @f_ord_greater_than_equal_scalar(%arg0: f64, %arg1: f64) "None" {
    %0 = spirv.FOrdGreaterThanEqual %arg0, %arg1 : f64
    spirv.Return
  }
  spirv.func @f_ord_greater_than_equal_vector(%arg0: vector<2xf64>, %arg1: vector<2xf64>) "None" {
    %0 = spirv.FOrdGreaterThanEqual %arg0, %arg1 : vector<2xf64>
    spirv.Return
  }
  spirv.func @f_ord_greater_than_scalar(%arg0: f64, %arg1: f64) "None" {
    %0 = spirv.FOrdGreaterThan %arg0, %arg1 : f64
    spirv.Return
  }
  spirv.func @f_ord_greater_than_vector(%arg0: vector<2xf64>, %arg1: vector<2xf64>) "None" {
    %0 = spirv.FOrdGreaterThan %arg0, %arg1 : vector<2xf64>
    spirv.Return
  }
  spirv.func @f_ord_less_than_scalar(%arg0: f64, %arg1: f64) "None" {
    %0 = spirv.FOrdLessThan %arg0, %arg1 : f64
    spirv.Return
  }
  spirv.func @f_ord_less_than_vector(%arg0: vector<2xf64>, %arg1: vector<2xf64>) "None" {
    %0 = spirv.FOrdLessThan %arg0, %arg1 : vector<2xf64>
    spirv.Return
  }
  spirv.func @f_ord_less_than_equal_scalar(%arg0: f64, %arg1: f64) "None" {
    %0 = spirv.FOrdLessThanEqual %arg0, %arg1 : f64
    spirv.Return
  }
  spirv.func @f_ord_less_than_equal_vector(%arg0: vector<2xf64>, %arg1: vector<2xf64>) "None" {
    %0 = spirv.FOrdLessThanEqual %arg0, %arg1 : vector<2xf64>
    spirv.Return
  }
  spirv.func @f_ord_not_equal_scalar(%arg0: f32, %arg1: f32) "None" {
    %0 = spirv.FOrdNotEqual %arg0, %arg1 : f32
    spirv.Return
  }
  spirv.func @f_ord_not_equal_vector(%arg0: vector<4xf64>, %arg1: vector<4xf64>) "None" {
    %0 = spirv.FOrdNotEqual %arg0, %arg1 : vector<4xf64>
    spirv.Return
  }
  spirv.func @f_unord_equal_scalar(%arg0: f32, %arg1: f32) "None" {
    %0 = spirv.FUnordEqual %arg0, %arg1 : f32
    spirv.Return
  }
  spirv.func @f_unord_equal_vector(%arg0: vector<4xf64>, %arg1: vector<4xf64>) "None" {
    %0 = spirv.FUnordEqual %arg0, %arg1 : vector<4xf64>
    spirv.Return
  }
  spirv.func @f_unord_greater_than_equal_scalar(%arg0: f64, %arg1: f64) "None" {
    %0 = spirv.FUnordGreaterThanEqual %arg0, %arg1 : f64
    spirv.Return
  }
  spirv.func @f_unord_greater_than_equal_vector(%arg0: vector<2xf64>, %arg1: vector<2xf64>) "None" {
    %0 = spirv.FUnordGreaterThanEqual %arg0, %arg1 : vector<2xf64>
    spirv.Return
  }
  spirv.func @f_unord_greater_than_scalar(%arg0: f64, %arg1: f64) "None" {
    %0 = spirv.FUnordGreaterThan %arg0, %arg1 : f64
    spirv.Return
  }
  spirv.func @f_unord_greater_than_vector(%arg0: vector<2xf64>, %arg1: vector<2xf64>) "None" {
    %0 = spirv.FUnordGreaterThan %arg0, %arg1 : vector<2xf64>
    spirv.Return
  }
  spirv.func @f_unord_less_than_scalar(%arg0: f64, %arg1: f64) "None" {
    %0 = spirv.FUnordLessThan %arg0, %arg1 : f64
    spirv.Return
  }
  spirv.func @f_unord_less_than_vector(%arg0: vector<2xf64>, %arg1: vector<2xf64>) "None" {
    %0 = spirv.FUnordLessThan %arg0, %arg1 : vector<2xf64>
    spirv.Return
  }
  spirv.func @f_unord_less_than_equal_scalar(%arg0: f64, %arg1: f64) "None" {
    %0 = spirv.FUnordLessThanEqual %arg0, %arg1 : f64
    spirv.Return
  }
  spirv.func @f_unord_less_than_equal_vector(%arg0: vector<2xf64>, %arg1: vector<2xf64>) "None" {
    %0 = spirv.FUnordLessThanEqual %arg0, %arg1 : vector<2xf64>
    spirv.Return
  }
  spirv.func @f_unord_not_equal_scalar(%arg0: f32, %arg1: f32) "None" {
    %0 = spirv.FUnordNotEqual %arg0, %arg1 : f32
    spirv.Return
  }
  spirv.func @f_unord_not_equal_vector(%arg0: vector<4xf64>, %arg1: vector<4xf64>) "None" {
    %0 = spirv.FUnordNotEqual %arg0, %arg1 : vector<4xf64>
    spirv.Return
  }
}

