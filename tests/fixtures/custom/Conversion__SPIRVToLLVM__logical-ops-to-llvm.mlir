module {
  spirv.func @logical_equal_scalar(%arg0: i1, %arg1: i1) "None" {
    %0 = spirv.LogicalEqual %arg0, %arg1 : i1
    spirv.Return
  }
  spirv.func @logical_equal_vector(%arg0: vector<4xi1>, %arg1: vector<4xi1>) "None" {
    %0 = spirv.LogicalEqual %arg0, %arg1 : vector<4xi1>
    spirv.Return
  }
  spirv.func @logical_not_equal_scalar(%arg0: i1, %arg1: i1) "None" {
    %0 = spirv.LogicalNotEqual %arg0, %arg1 : i1
    spirv.Return
  }
  spirv.func @logical_not_equal_vector(%arg0: vector<4xi1>, %arg1: vector<4xi1>) "None" {
    %0 = spirv.LogicalNotEqual %arg0, %arg1 : vector<4xi1>
    spirv.Return
  }
  spirv.func @logical_not_scalar(%arg0: i1) "None" {
    %0 = spirv.LogicalNot %arg0 : i1
    spirv.Return
  }
  spirv.func @logical_not_vector(%arg0: vector<4xi1>) "None" {
    %0 = spirv.LogicalNot %arg0 : vector<4xi1>
    spirv.Return
  }
  spirv.func @logical_and_scalar(%arg0: i1, %arg1: i1) "None" {
    %0 = spirv.LogicalAnd %arg0, %arg1 : i1
    spirv.Return
  }
  spirv.func @logical_and_vector(%arg0: vector<4xi1>, %arg1: vector<4xi1>) "None" {
    %0 = spirv.LogicalAnd %arg0, %arg1 : vector<4xi1>
    spirv.Return
  }
  spirv.func @logical_or_scalar(%arg0: i1, %arg1: i1) "None" {
    %0 = spirv.LogicalOr %arg0, %arg1 : i1
    spirv.Return
  }
  spirv.func @logical_or_vector(%arg0: vector<4xi1>, %arg1: vector<4xi1>) "None" {
    %0 = spirv.LogicalOr %arg0, %arg1 : vector<4xi1>
    spirv.Return
  }
  spirv.func @ordered_scalar(%arg0: f32, %arg1: f32) "None" {
    %0 = spirv.Ordered %arg0, %arg1 : f32
    spirv.Return
  }
  spirv.func @ordered_vector(%arg0: vector<4xf32>, %arg1: vector<4xf32>) "None" {
    %0 = spirv.Ordered %arg0, %arg1 : vector<4xf32>
    spirv.Return
  }
  spirv.func @unordered_scalar(%arg0: f32, %arg1: f32) "None" {
    %0 = spirv.Unordered %arg0, %arg1 : f32
    spirv.Return
  }
  spirv.func @unordered_vector(%arg0: vector<4xf32>, %arg1: vector<4xf32>) "None" {
    %0 = spirv.Unordered %arg0, %arg1 : vector<4xf32>
    spirv.Return
  }
}

