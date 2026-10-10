module {
  func.func @reduce_1x_fp32(%arg0: vector<8xf32>) -> f32 {
    %cst = arith.constant 0.000000e+00 : f32
    %0 = vector.reduction <add>, %arg0, %cst : vector<8xf32> into f32
    return %0 : f32
  }
  func.func @reduce_2x_fp32(%arg0: vector<8xf32>, %arg1: vector<8xf32>) -> f32 {
    %cst = arith.constant 0.000000e+00 : f32
    %0 = vector.reduction <add>, %arg0, %cst : vector<8xf32> into f32
    %1 = vector.reduction <add>, %arg1, %0 : vector<8xf32> into f32
    return %1 : f32
  }
  func.func @reduce_2x_no_acc_fp32(%arg0: vector<8xf32>, %arg1: vector<8xf32>) -> f32 {
    %0 = vector.reduction <add>, %arg0 : vector<8xf32> into f32
    %1 = vector.reduction <add>, %arg1, %0 : vector<8xf32> into f32
    return %1 : f32
  }
  func.func @reduce_2x_zero_add_fp32(%arg0: vector<8xf32>, %arg1: vector<8xf32>) -> f32 {
    %cst = arith.constant dense<0.000000e+00> : vector<8xf32>
    %0 = arith.addf %arg0, %cst : vector<8xf32>
    %1 = vector.reduction <add>, %0 : vector<8xf32> into f32
    %2 = vector.reduction <add>, %arg1, %1 : vector<8xf32> into f32
    return %2 : f32
  }
  func.func @reduce_3x_fp32(%arg0: vector<8xf32>, %arg1: vector<8xf32>, %arg2: vector<8xf32>) -> f32 {
    %cst = arith.constant 0.000000e+00 : f32
    %0 = vector.reduction <add>, %arg0, %cst : vector<8xf32> into f32
    %1 = vector.reduction <add>, %arg1, %0 : vector<8xf32> into f32
    %2 = vector.reduction <add>, %arg2, %1 : vector<8xf32> into f32
    return %2 : f32
  }
  func.func @reduce_1x_i32(%arg0: vector<8xi32>) -> i32 {
    %c0_i32 = arith.constant 0 : i32
    %0 = vector.reduction <add>, %arg0, %c0_i32 : vector<8xi32> into i32
    return %0 : i32
  }
  func.func @reduce_2x_i32(%arg0: vector<8xi32>, %arg1: vector<8xi32>) -> i32 {
    %c0_i32 = arith.constant 0 : i32
    %0 = vector.reduction <add>, %arg0, %c0_i32 : vector<8xi32> into i32
    %1 = vector.reduction <add>, %arg1, %0 : vector<8xi32> into i32
    return %1 : i32
  }
  func.func @reduce_2x_no_acc_i32(%arg0: vector<8xi32>, %arg1: vector<8xi32>) -> i32 {
    %0 = vector.reduction <add>, %arg0 : vector<8xi32> into i32
    %1 = vector.reduction <add>, %arg1, %0 : vector<8xi32> into i32
    return %1 : i32
  }
  func.func @reduce_2x_zero_add_i32(%arg0: vector<8xi32>, %arg1: vector<8xi32>) -> i32 {
    %c0_i32 = arith.constant 0 : i32
    %cst = arith.constant dense<0> : vector<8xi32>
    %0 = arith.addi %arg0, %cst : vector<8xi32>
    %1 = vector.reduction <add>, %0, %c0_i32 : vector<8xi32> into i32
    %2 = vector.reduction <add>, %arg1, %1 : vector<8xi32> into i32
    return %2 : i32
  }
}

