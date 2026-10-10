#map = affine_map<(d0) -> (d0 + 1)>
#map1 = affine_map<()[s0] -> (s0 + 1)>
#map2 = affine_map<(d0) -> (d0)>
module {
  func.func @func_with_ops(%arg0: f32) {
    %0 = "getTensor"() : () -> tensor<4x4x?xf32>
    %c2 = arith.constant 2 : index
    %dim = tensor.dim %0, %c2 : tensor<4x4x?xf32>
    %1 = arith.addf %arg0, %arg0 : f32
    return
  }
  func.func @standard_instrs(%arg0: tensor<4x4x?xf32>, %arg1: f32, %arg2: i32, %arg3: index, %arg4: i64, %arg5: f16) {
    %c2 = arith.constant 2 : index
    %dim = tensor.dim %arg0, %c2 : tensor<4x4x?xf32>
    %f = constant @func_with_ops : (f32) -> ()
    %f_0 = constant @affine_apply : () -> ()
    %0 = arith.addi %arg2, %arg2 : i32
    %1 = arith.addi %0, %arg2 : i32
    %2 = arith.addi %0, %1 : i32
    %3 = arith.addf %arg1, %arg1 : f32
    %4 = arith.addf %arg1, %3 : f32
    %true = arith.constant true
    %cst = arith.constant dense<0> : tensor<42xi32>
    %cst_1 = arith.constant dense<0> : vector<42xi32>
    %cst_2 = arith.constant dense<true> : tensor<42xi1>
    %cst_3 = arith.constant dense<true> : vector<42xi1>
    %5 = arith.select %true, %arg3, %arg3 : index
    %6 = arith.select %cst_2, %cst, %cst : tensor<42xi1>, tensor<42xi32>
    %7 = arith.select %cst_3, %cst_1, %cst_1 : vector<42xi1>, vector<42xi32>
    %8 = arith.select %true, %arg3, %arg3 : index
    %9 = arith.select %true, %cst, %cst : tensor<42xi32>
    %cst_4 = arith.constant dense<0.000000e+00> : vector<4xf32>
    %cst_5 = arith.constant dense<0.000000e+00> : tensor<42xf32>
    %cst_6 = arith.constant dense<0.000000e+00> : vector<4xf32>
    %10 = arith.cmpf ogt, %3, %4 : f32
    %11 = arith.cmpf oeq, %3, %4 : f32
    %12 = arith.cmpf olt, %cst_6, %cst_6 : vector<4xf32>
    %13 = arith.cmpf oeq, %cst_6, %cst_6 : vector<4xf32>
    %14 = arith.cmpf oeq, %cst_5, %cst_5 : tensor<42xf32>
    %15 = arith.cmpf oeq, %cst_6, %cst_6 : vector<4xf32>
    %true_7 = arith.constant true
    %false = arith.constant false
    %16 = math.absf %arg1 : f32
    %17 = math.absf %arg1 : f32
    %18 = math.absf %cst_6 : vector<4xf32>
    %19 = math.absf %arg0 : tensor<4x4x?xf32>
    %20 = math.ceil %arg1 : f32
    %21 = math.ceil %arg1 : f32
    %22 = math.ceil %cst_6 : vector<4xf32>
    %23 = math.ceil %arg0 : tensor<4x4x?xf32>
    %24 = math.copysign %arg1, %arg1 : f32
    %25 = math.copysign %arg1, %arg1 : f32
    %26 = math.copysign %cst_6, %cst_6 : vector<4xf32>
    %27 = math.copysign %arg0, %arg0 : tensor<4x4x?xf32>
    %28 = math.rsqrt %arg1 : f32
    %29 = math.floor %arg1 : f32
    %30 = math.floor %arg1 : f32
    %31 = math.floor %cst_6 : vector<4xf32>
    %32 = math.floor %arg0 : tensor<4x4x?xf32>
    return
  }
  func.func @affine_apply() {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %0 = affine.apply #map(%c0)
    %1 = affine.apply #map1()[%c0]
    return
  }
  func.func @return_op(%arg0: i32) -> i32 {
    return %arg0 : i32
  }
  func.func @calls(%arg0: i32) {
    %0 = call @return_op(%arg0) : (i32) -> i32
    %1 = call @return_op(%0) : (i32) -> i32
    %2 = call @return_op(%0) : (i32) -> i32
    %f = constant @affine_apply : () -> ()
    call_indirect %f() : () -> ()
    %f_0 = constant @return_op : (i32) -> i32
    %3 = call_indirect %f_0(%arg0) : (i32) -> i32
    %4 = call_indirect %f_0(%arg0) : (i32) -> i32
    return
  }
  func.func @test_dimop(%arg0: tensor<4x4x?xf32>) {
    %c2 = arith.constant 2 : index
    %dim = tensor.dim %arg0, %c2 : tensor<4x4x?xf32>
    %0 = affine.apply #map2(%dim)
    return
  }
}

