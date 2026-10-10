module {
  func.func @pow_noop(%arg0: f32, %arg1: vector<4xf32>) -> (f32, vector<4xf32>) {
    %cst = arith.constant 1.000000e+00 : f32
    %cst_0 = arith.constant dense<1.000000e+00> : vector<4xf32>
    %0 = math.powf %arg0, %cst : f32
    %1 = math.powf %arg1, %cst_0 : vector<4xf32>
    return %0, %1 : f32, vector<4xf32>
  }
  func.func @pow_square(%arg0: f32, %arg1: vector<4xf32>) -> (f32, vector<4xf32>) {
    %cst = arith.constant 2.000000e+00 : f32
    %cst_0 = arith.constant dense<2.000000e+00> : vector<4xf32>
    %0 = math.powf %arg0, %cst : f32
    %1 = math.powf %arg1, %cst_0 : vector<4xf32>
    return %0, %1 : f32, vector<4xf32>
  }
  func.func @pow_square_fast(%arg0: f32, %arg1: vector<4xf32>) -> (f32, vector<4xf32>) {
    %cst = arith.constant 2.000000e+00 : f32
    %cst_0 = arith.constant dense<2.000000e+00> : vector<4xf32>
    %0 = math.powf %arg0, %cst fastmath<fast> : f32
    %1 = math.powf %arg1, %cst_0 fastmath<fast> : vector<4xf32>
    return %0, %1 : f32, vector<4xf32>
  }
  func.func @pow_cube(%arg0: f32, %arg1: vector<4xf32>) -> (f32, vector<4xf32>) {
    %cst = arith.constant 3.000000e+00 : f32
    %cst_0 = arith.constant dense<3.000000e+00> : vector<4xf32>
    %0 = math.powf %arg0, %cst : f32
    %1 = math.powf %arg1, %cst_0 : vector<4xf32>
    return %0, %1 : f32, vector<4xf32>
  }
  func.func @pow_cube_fast(%arg0: f32, %arg1: vector<4xf32>) -> (f32, vector<4xf32>) {
    %cst = arith.constant 3.000000e+00 : f32
    %cst_0 = arith.constant dense<3.000000e+00> : vector<4xf32>
    %0 = math.powf %arg0, %cst fastmath<fast> : f32
    %1 = math.powf %arg1, %cst_0 fastmath<fast> : vector<4xf32>
    return %0, %1 : f32, vector<4xf32>
  }
  func.func @pow_recip(%arg0: f32, %arg1: vector<4xf32>) -> (f32, vector<4xf32>) {
    %cst = arith.constant -1.000000e+00 : f32
    %cst_0 = arith.constant dense<-1.000000e+00> : vector<4xf32>
    %0 = math.powf %arg0, %cst : f32
    %1 = math.powf %arg1, %cst_0 : vector<4xf32>
    return %0, %1 : f32, vector<4xf32>
  }
  func.func @pow_recip_fast(%arg0: f32, %arg1: vector<4xf32>) -> (f32, vector<4xf32>) {
    %cst = arith.constant -1.000000e+00 : f32
    %cst_0 = arith.constant dense<-1.000000e+00> : vector<4xf32>
    %0 = math.powf %arg0, %cst fastmath<fast> : f32
    %1 = math.powf %arg1, %cst_0 fastmath<fast> : vector<4xf32>
    return %0, %1 : f32, vector<4xf32>
  }
  func.func @pow_sqrt(%arg0: f32, %arg1: vector<4xf32>) -> (f32, vector<4xf32>) {
    %cst = arith.constant 5.000000e-01 : f32
    %cst_0 = arith.constant dense<5.000000e-01> : vector<4xf32>
    %0 = math.powf %arg0, %cst : f32
    %1 = math.powf %arg1, %cst_0 : vector<4xf32>
    return %0, %1 : f32, vector<4xf32>
  }
  func.func @pow_sqrt_fast(%arg0: f32, %arg1: vector<4xf32>) -> (f32, vector<4xf32>) {
    %cst = arith.constant 5.000000e-01 : f32
    %cst_0 = arith.constant dense<5.000000e-01> : vector<4xf32>
    %0 = math.powf %arg0, %cst fastmath<fast> : f32
    %1 = math.powf %arg1, %cst_0 fastmath<fast> : vector<4xf32>
    return %0, %1 : f32, vector<4xf32>
  }
  func.func @pow_rsqrt(%arg0: f32, %arg1: vector<4xf32>) -> (f32, vector<4xf32>) {
    %cst = arith.constant -5.000000e-01 : f32
    %cst_0 = arith.constant dense<-5.000000e-01> : vector<4xf32>
    %0 = math.powf %arg0, %cst : f32
    %1 = math.powf %arg1, %cst_0 : vector<4xf32>
    return %0, %1 : f32, vector<4xf32>
  }
  func.func @pow_rsqrt_fast(%arg0: f32, %arg1: vector<4xf32>) -> (f32, vector<4xf32>) {
    %cst = arith.constant -5.000000e-01 : f32
    %cst_0 = arith.constant dense<-5.000000e-01> : vector<4xf32>
    %0 = math.powf %arg0, %cst fastmath<fast> : f32
    %1 = math.powf %arg1, %cst_0 fastmath<fast> : vector<4xf32>
    return %0, %1 : f32, vector<4xf32>
  }
  func.func @pow_0_75(%arg0: f32, %arg1: vector<4xf32>) -> (f32, vector<4xf32>) {
    %cst = arith.constant 7.500000e-01 : f32
    %cst_0 = arith.constant dense<7.500000e-01> : vector<4xf32>
    %0 = math.powf %arg0, %cst : f32
    %1 = math.powf %arg1, %cst_0 : vector<4xf32>
    return %0, %1 : f32, vector<4xf32>
  }
  func.func @pow_0_75_fast(%arg0: f32, %arg1: vector<4xf32>) -> (f32, vector<4xf32>) {
    %cst = arith.constant 7.500000e-01 : f32
    %cst_0 = arith.constant dense<7.500000e-01> : vector<4xf32>
    %0 = math.powf %arg0, %cst fastmath<fast> : f32
    %1 = math.powf %arg1, %cst_0 fastmath<fast> : vector<4xf32>
    return %0, %1 : f32, vector<4xf32>
  }
  func.func @ipowi_zero_exp(%arg0: i32, %arg1: vector<4xi32>) -> (i32, vector<4xi32>) {
    %c0_i32 = arith.constant 0 : i32
    %cst = arith.constant dense<0> : vector<4xi32>
    %0 = math.ipowi %arg0, %c0_i32 : i32
    %1 = math.ipowi %arg1, %cst : vector<4xi32>
    return %0, %1 : i32, vector<4xi32>
  }
  func.func @ipowi_exp_one(%arg0: i32, %arg1: vector<4xi32>) -> (i32, vector<4xi32>, i32, vector<4xi32>) {
    %c1_i32 = arith.constant 1 : i32
    %cst = arith.constant dense<1> : vector<4xi32>
    %0 = math.ipowi %arg0, %c1_i32 : i32
    %1 = math.ipowi %arg1, %cst : vector<4xi32>
    %c-1_i32 = arith.constant -1 : i32
    %cst_0 = arith.constant dense<-1> : vector<4xi32>
    %2 = math.ipowi %arg0, %c-1_i32 : i32
    %3 = math.ipowi %arg1, %cst_0 : vector<4xi32>
    return %0, %1, %2, %3 : i32, vector<4xi32>, i32, vector<4xi32>
  }
  func.func @ipowi_exp_two(%arg0: i32, %arg1: vector<4xi32>) -> (i32, vector<4xi32>, i32, vector<4xi32>) {
    %c2_i32 = arith.constant 2 : i32
    %cst = arith.constant dense<2> : vector<4xi32>
    %0 = math.ipowi %arg0, %c2_i32 : i32
    %1 = math.ipowi %arg1, %cst : vector<4xi32>
    %c-2_i32 = arith.constant -2 : i32
    %cst_0 = arith.constant dense<-2> : vector<4xi32>
    %2 = math.ipowi %arg0, %c-2_i32 : i32
    %3 = math.ipowi %arg1, %cst_0 : vector<4xi32>
    return %0, %1, %2, %3 : i32, vector<4xi32>, i32, vector<4xi32>
  }
  func.func @ipowi_exp_three(%arg0: i32, %arg1: vector<4xi32>) -> (i32, vector<4xi32>, i32, vector<4xi32>) {
    %c3_i32 = arith.constant 3 : i32
    %cst = arith.constant dense<3> : vector<4xi32>
    %0 = math.ipowi %arg0, %c3_i32 : i32
    %1 = math.ipowi %arg1, %cst : vector<4xi32>
    %c-3_i32 = arith.constant -3 : i32
    %cst_0 = arith.constant dense<-3> : vector<4xi32>
    %2 = math.ipowi %arg0, %c-3_i32 : i32
    %3 = math.ipowi %arg1, %cst_0 : vector<4xi32>
    return %0, %1, %2, %3 : i32, vector<4xi32>, i32, vector<4xi32>
  }
  func.func @fpowi_zero_exp(%arg0: f32, %arg1: vector<4xf32>) -> (f32, vector<4xf32>) {
    %c0_i32 = arith.constant 0 : i32
    %cst = arith.constant dense<0> : vector<4xi32>
    %0 = math.fpowi %arg0, %c0_i32 : f32, i32
    %1 = math.fpowi %arg1, %cst : vector<4xf32>, vector<4xi32>
    return %0, %1 : f32, vector<4xf32>
  }
  func.func @fpowi_exp_one(%arg0: f32, %arg1: vector<4xf32>) -> (f32, vector<4xf32>, f32, vector<4xf32>) {
    %c1_i32 = arith.constant 1 : i32
    %cst = arith.constant dense<1> : vector<4xi32>
    %0 = math.fpowi %arg0, %c1_i32 : f32, i32
    %1 = math.fpowi %arg1, %cst : vector<4xf32>, vector<4xi32>
    %c-1_i32 = arith.constant -1 : i32
    %cst_0 = arith.constant dense<-1> : vector<4xi32>
    %2 = math.fpowi %arg0, %c-1_i32 : f32, i32
    %3 = math.fpowi %arg1, %cst_0 : vector<4xf32>, vector<4xi32>
    return %0, %1, %2, %3 : f32, vector<4xf32>, f32, vector<4xf32>
  }
  func.func @fpowi_exp_two(%arg0: f32, %arg1: vector<4xf32>) -> (f32, vector<4xf32>, f32, vector<4xf32>) {
    %c2_i32 = arith.constant 2 : i32
    %cst = arith.constant dense<2> : vector<4xi32>
    %0 = math.fpowi %arg0, %c2_i32 : f32, i32
    %1 = math.fpowi %arg1, %cst : vector<4xf32>, vector<4xi32>
    %c-2_i32 = arith.constant -2 : i32
    %cst_0 = arith.constant dense<-2> : vector<4xi32>
    %2 = math.fpowi %arg0, %c-2_i32 : f32, i32
    %3 = math.fpowi %arg1, %cst_0 : vector<4xf32>, vector<4xi32>
    return %0, %1, %2, %3 : f32, vector<4xf32>, f32, vector<4xf32>
  }
  func.func @fpowi_exp_three(%arg0: f32, %arg1: vector<4xf32>) -> (f32, vector<4xf32>, f32, vector<4xf32>) {
    %c3_i32 = arith.constant 3 : i32
    %cst = arith.constant dense<3> : vector<4xi32>
    %0 = math.fpowi %arg0, %c3_i32 : f32, i32
    %1 = math.fpowi %arg1, %cst : vector<4xf32>, vector<4xi32>
    %c-3_i32 = arith.constant -3 : i32
    %cst_0 = arith.constant dense<-3> : vector<4xi32>
    %2 = math.fpowi %arg0, %c-3_i32 : f32, i32
    %3 = math.fpowi %arg1, %cst_0 : vector<4xf32>, vector<4xi32>
    return %0, %1, %2, %3 : f32, vector<4xf32>, f32, vector<4xf32>
  }
}

