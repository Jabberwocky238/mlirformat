module {
  func.func @test_const(%arg0: index) -> tensor<4xi32> {
    %0 = "tosa.const"() <{values = dense<[3, 0, 1, 2]> : tensor<4xi32>}> : () -> tensor<4xi32>
    return %0 : tensor<4xi32>
  }
}

// -----
module {
  func.func @test_const_i64(%arg0: index) -> tensor<4xi64> {
    %0 = "tosa.const"() <{values = dense<[3, 0, 1, 2]> : tensor<4xi64>}> : () -> tensor<4xi64>
    return %0 : tensor<4xi64>
  }
}

// -----
module {
  func.func @try_fold_equal_with_unranked_tensor(%arg0: tensor<4xi32>, %arg1: tensor<1xi32>) {
    %0 = tosa.equal %arg0, %arg1 : (tensor<4xi32>, tensor<1xi32>) -> tensor<*xi1>
    return
  }
}

// -----
module {
  func.func @try_fold_unranked_constant_results() {
    %cst = arith.constant dense<1> : tensor<1xi32>
    %cst_0 = arith.constant dense<2> : tensor<1xi32>
    %cst_1 = arith.constant dense<2.000000e+00> : tensor<1xf32>
    %0 = tosa.equal %cst, %cst_0 : (tensor<1xi32>, tensor<1xi32>) -> tensor<*xi1>
    %1 = tosa.greater %cst, %cst_0 : (tensor<1xi32>, tensor<1xi32>) -> tensor<*xi1>
    %2 = tosa.greater_equal %cst, %cst_0 : (tensor<1xi32>, tensor<1xi32>) -> tensor<*xi1>
    %3 = tosa.cast %cst : (tensor<1xi32>) -> tensor<*xf32>
    %4 = tosa.reciprocal %cst_1 : (tensor<1xf32>) -> tensor<*xf32>
    %5 = tosa.abs %cst_1 : (tensor<1xf32>) -> tensor<*xf32>
    return
  }
}

// -----
module {
  func.func @try_fold_unranked_identity_results(%arg0: tensor<1xf32>) {
    %cst = arith.constant dense<0.000000e+00> : tensor<1xf32>
    %0 = tosa.transpose %arg0 {perms = array<i32: 0>} : (tensor<1xf32>) -> tensor<*xf32>
    %1 = tosa.reverse %arg0 {axis = 0 : i32} : (tensor<1xf32>) -> tensor<*xf32>
    %2 = tosa.abs %arg0 : (tensor<1xf32>) -> tensor<*xf32>
    %3 = tosa.negate %arg0, %cst, %cst : (tensor<1xf32>, tensor<1xf32>, tensor<1xf32>) -> tensor<*xf32>
    return
  }
}

// -----
module {
  func.func @fold_add_zero_rhs_f32(%arg0: tensor<f32>) -> tensor<f32> {
    %0 = "tosa.const"() <{values = dense<0.000000e+00> : tensor<f32>}> : () -> tensor<f32>
    %1 = tosa.add %arg0, %0 : (tensor<f32>, tensor<f32>) -> tensor<f32>
    return %1 : tensor<f32>
  }
}

// -----
module {
  func.func @fold_add_zero_lhs_f32(%arg0: tensor<f32>) -> tensor<f32> {
    %0 = "tosa.const"() <{values = dense<0.000000e+00> : tensor<f32>}> : () -> tensor<f32>
    %1 = tosa.add %0, %arg0 : (tensor<f32>, tensor<f32>) -> tensor<f32>
    return %1 : tensor<f32>
  }
}

// -----
module {
  func.func @fold_add_zero_rhs_i32(%arg0: tensor<i32>) -> tensor<i32> {
    %0 = "tosa.const"() <{values = dense<0> : tensor<i32>}> : () -> tensor<i32>
    %1 = tosa.add %arg0, %0 : (tensor<i32>, tensor<i32>) -> tensor<i32>
    return %1 : tensor<i32>
  }
}

// -----
module {
  func.func @fold_add_zero_lhs_i32(%arg0: tensor<i32>) -> tensor<i32> {
    %0 = "tosa.const"() <{values = dense<0> : tensor<i32>}> : () -> tensor<i32>
    %1 = tosa.add %0, %arg0 : (tensor<i32>, tensor<i32>) -> tensor<i32>
    return %1 : tensor<i32>
  }
}

// -----
module {
  func.func @fold_add_splat_i32() -> tensor<10xi32> {
    %0 = "tosa.const"() <{values = dense<1> : tensor<10xi32>}> : () -> tensor<10xi32>
    %1 = "tosa.const"() <{values = dense<2> : tensor<10xi32>}> : () -> tensor<10xi32>
    %2 = tosa.add %0, %1 : (tensor<10xi32>, tensor<10xi32>) -> tensor<10xi32>
    return %2 : tensor<10xi32>
  }
}

// -----
module {
  func.func @fold_add_splat_f32() -> tensor<10xf32> {
    %0 = "tosa.const"() <{values = dense<1.000000e+00> : tensor<10xf32>}> : () -> tensor<10xf32>
    %1 = "tosa.const"() <{values = dense<2.000000e+00> : tensor<10xf32>}> : () -> tensor<10xf32>
    %2 = tosa.add %0, %1 : (tensor<10xf32>, tensor<10xf32>) -> tensor<10xf32>
    return %2 : tensor<10xf32>
  }
}

// -----
module {
  func.func @fold_add_splat_i32_positive_overflow() -> tensor<10xi32> {
    %0 = "tosa.const"() <{values = dense<2147483647> : tensor<10xi32>}> : () -> tensor<10xi32>
    %1 = "tosa.const"() <{values = dense<1> : tensor<10xi32>}> : () -> tensor<10xi32>
    %2 = tosa.add %0, %1 : (tensor<10xi32>, tensor<10xi32>) -> tensor<10xi32>
    return %2 : tensor<10xi32>
  }
}

// -----
module {
  func.func @fold_add_splat_i32_negative_overflow() -> tensor<10xi32> {
    %0 = "tosa.const"() <{values = dense<-1> : tensor<10xi32>}> : () -> tensor<10xi32>
    %1 = "tosa.const"() <{values = dense<-2147483648> : tensor<10xi32>}> : () -> tensor<10xi32>
    %2 = tosa.add %0, %1 : (tensor<10xi32>, tensor<10xi32>) -> tensor<10xi32>
    return %2 : tensor<10xi32>
  }
}

// -----
module {
  func.func @fold_add_splat_ui8() -> tensor<10xui8> {
    %0 = "tosa.const"() <{values = dense<1> : tensor<10xui8>}> : () -> tensor<10xui8>
    %1 = "tosa.const"() <{values = dense<254> : tensor<10xui8>}> : () -> tensor<10xui8>
    %2 = tosa.add %0, %1 : (tensor<10xui8>, tensor<10xui8>) -> tensor<10xui8>
    return %2 : tensor<10xui8>
  }
}

// -----
module {
  func.func @fold_add_splat_ui8_overflow() -> tensor<10xui8> {
    %0 = "tosa.const"() <{values = dense<2> : tensor<10xui8>}> : () -> tensor<10xui8>
    %1 = "tosa.const"() <{values = dense<254> : tensor<10xui8>}> : () -> tensor<10xui8>
    %2 = tosa.add %0, %1 : (tensor<10xui8>, tensor<10xui8>) -> tensor<10xui8>
    return %2 : tensor<10xui8>
  }
}

// -----
module {
  func.func @no_fold_add_unknown_broadcast_zero_lhs(%arg0: tensor<1x4xi32>) -> tensor<2x4xi32> {
    %0 = "tosa.const"() <{values = dense<0> : tensor<2x1xi32>}> : () -> tensor<2x1xi32>
    %1 = tosa.add %0, %arg0 : (tensor<2x1xi32>, tensor<1x4xi32>) -> tensor<2x4xi32>
    return %1 : tensor<2x4xi32>
  }
}

// -----
module {
  func.func @no_fold_dynamic_add_unknown_broadcast_zero_lhs(%arg0: tensor<?x4xi32>) -> tensor<?x4xi32> {
    %0 = "tosa.const"() <{values = dense<0> : tensor<2x1xi32>}> : () -> tensor<2x1xi32>
    %1 = tosa.add %0, %arg0 : (tensor<2x1xi32>, tensor<?x4xi32>) -> tensor<?x4xi32>
    return %1 : tensor<?x4xi32>
  }
}

// -----
module {
  func.func @fold_dynamic_add_broadcast_zero_lhs(%arg0: tensor<?x17xi32>) -> tensor<?x17xi32> {
    %0 = "tosa.const"() <{values = dense<0> : tensor<1x1xi32>}> : () -> tensor<1x1xi32>
    %1 = tosa.add %0, %arg0 : (tensor<1x1xi32>, tensor<?x17xi32>) -> tensor<?x17xi32>
    return %1 : tensor<?x17xi32>
  }
}

// -----
module {
  func.func @no_fold_dynamic_add_unknown_broadcast_zero_rhs(%arg0: tensor<?x4xi32>) -> tensor<?x4xi32> {
    %0 = "tosa.const"() <{values = dense<0> : tensor<2x1xi32>}> : () -> tensor<2x1xi32>
    %1 = tosa.add %arg0, %0 : (tensor<?x4xi32>, tensor<2x1xi32>) -> tensor<?x4xi32>
    return %1 : tensor<?x4xi32>
  }
}

// -----
module {
  func.func @fold_dynamic_add_broadcast_zero_rhs(%arg0: tensor<?x17xi32>) -> tensor<?x17xi32> {
    %0 = "tosa.const"() <{values = dense<0> : tensor<1x17xi32>}> : () -> tensor<1x17xi32>
    %1 = tosa.add %arg0, %0 : (tensor<?x17xi32>, tensor<1x17xi32>) -> tensor<?x17xi32>
    return %1 : tensor<?x17xi32>
  }
}

// -----
module {
  func.func @no_fold_div_zero_lhs_i32(%arg0: tensor<i32>) -> tensor<i32> {
    %0 = "tosa.const"() <{values = dense<0> : tensor<i32>}> : () -> tensor<i32>
    %1 = tosa.intdiv %0, %arg0 : (tensor<i32>, tensor<i32>) -> tensor<i32>
    return %1 : tensor<i32>
  }
}

// -----
module {
  func.func @fold_div_zero_lhs_nonzero_splat_rhs_i32() -> tensor<i32> {
    %0 = "tosa.const"() <{values = dense<0> : tensor<i32>}> : () -> tensor<i32>
    %1 = "tosa.const"() <{values = dense<2> : tensor<i32>}> : () -> tensor<i32>
    %2 = tosa.intdiv %0, %1 : (tensor<i32>, tensor<i32>) -> tensor<i32>
    return %2 : tensor<i32>
  }
}

// -----
module {
  func.func @no_fold_dynamic_div_zero_lhs(%arg0: tensor<?x4xi32>) -> tensor<?x4xi32> {
    %0 = "tosa.const"() <{values = dense<0> : tensor<1x1xi32>}> : () -> tensor<1x1xi32>
    %1 = tosa.intdiv %0, %arg0 : (tensor<1x1xi32>, tensor<?x4xi32>) -> tensor<?x4xi32>
    return %1 : tensor<?x4xi32>
  }
}

// -----
module {
  func.func @no_fold_div_zero_lhs_broadcast(%arg0: tensor<2x4xi32>) -> tensor<2x4xi32> {
    %0 = "tosa.const"() <{values = dense<0> : tensor<1x1xi32>}> : () -> tensor<1x1xi32>
    %1 = tosa.intdiv %0, %arg0 : (tensor<1x1xi32>, tensor<2x4xi32>) -> tensor<2x4xi32>
    return %1 : tensor<2x4xi32>
  }
}

// -----
module {
  func.func @no_fold_div_unknown_broadcast_one_rhs(%arg0: tensor<1x4xi32>) -> tensor<2x4xi32> {
    %0 = "tosa.const"() <{values = dense<1> : tensor<2x1xi32>}> : () -> tensor<2x1xi32>
    %1 = tosa.intdiv %arg0, %0 : (tensor<1x4xi32>, tensor<2x1xi32>) -> tensor<2x4xi32>
    return %1 : tensor<2x4xi32>
  }
}

// -----
module {
  func.func @fold_div_broadcast_one_rhs(%arg0: tensor<?x17xi32>) -> tensor<?x17xi32> {
    %0 = "tosa.const"() <{values = dense<1> : tensor<1x1xi32>}> : () -> tensor<1x1xi32>
    %1 = tosa.intdiv %arg0, %0 : (tensor<?x17xi32>, tensor<1x1xi32>) -> tensor<?x17xi32>
    return %1 : tensor<?x17xi32>
  }
}

// -----
module {
  func.func @fold_div_one_rhs_i32(%arg0: tensor<i32>) -> tensor<i32> {
    %0 = "tosa.const"() <{values = dense<1> : tensor<i32>}> : () -> tensor<i32>
    %1 = tosa.intdiv %arg0, %0 : (tensor<i32>, tensor<i32>) -> tensor<i32>
    return %1 : tensor<i32>
  }
}

// -----
module {
  func.func @no_fold_dynamic_div_unknown_broadcast_one_rhs(%arg0: tensor<?x4xi32>) -> tensor<?x4xi32> {
    %0 = "tosa.const"() <{values = dense<1> : tensor<2x1xi32>}> : () -> tensor<2x1xi32>
    %1 = tosa.intdiv %arg0, %0 : (tensor<?x4xi32>, tensor<2x1xi32>) -> tensor<?x4xi32>
    return %1 : tensor<?x4xi32>
  }
}

// -----
module {
  func.func @fold_div_splat_i32() -> tensor<i32> {
    %0 = "tosa.const"() <{values = dense<10> : tensor<i32>}> : () -> tensor<i32>
    %1 = "tosa.const"() <{values = dense<-3> : tensor<i32>}> : () -> tensor<i32>
    %2 = tosa.intdiv %0, %1 : (tensor<i32>, tensor<i32>) -> tensor<i32>
    return %2 : tensor<i32>
  }
}

// -----
module {
  func.func @no_fold_div_splat_i32_overflow() -> tensor<i32> {
    %0 = "tosa.const"() <{values = dense<-2147483648> : tensor<i32>}> : () -> tensor<i32>
    %1 = "tosa.const"() <{values = dense<-1> : tensor<i32>}> : () -> tensor<i32>
    %2 = tosa.intdiv %0, %1 : (tensor<i32>, tensor<i32>) -> tensor<i32>
    return %2 : tensor<i32>
  }
}

// -----
module {
  func.func @no_fold_div_zero_lhs_zero_rhs_i32() -> tensor<i32> {
    %0 = "tosa.const"() <{values = dense<0> : tensor<i32>}> : () -> tensor<i32>
    %1 = "tosa.const"() <{values = dense<0> : tensor<i32>}> : () -> tensor<i32>
    %2 = tosa.intdiv %0, %1 : (tensor<i32>, tensor<i32>) -> tensor<i32>
    return %2 : tensor<i32>
  }
}

// -----
module {
  func.func @no_fold_div_zero_lhs_non_splat_rhs_i32() -> tensor<2xi32> {
    %0 = "tosa.const"() <{values = dense<0> : tensor<2xi32>}> : () -> tensor<2xi32>
    %1 = "tosa.const"() <{values = dense<[1, 2]> : tensor<2xi32>}> : () -> tensor<2xi32>
    %2 = tosa.intdiv %0, %1 : (tensor<2xi32>, tensor<2xi32>) -> tensor<2xi32>
    return %2 : tensor<2xi32>
  }
}

// -----
module {
  func.func @fold_mul_zero_rhs_f32(%arg0: tensor<f32>) -> tensor<f32> {
    %0 = "tosa.const"() <{values = dense<0.000000e+00> : tensor<f32>}> : () -> tensor<f32>
    %1 = "tosa.const"() <{values = dense<0> : tensor<1xi8>}> : () -> tensor<1xi8>
    %2 = tosa.mul %arg0, %0, %1 : (tensor<f32>, tensor<f32>, tensor<1xi8>) -> tensor<f32>
    return %2 : tensor<f32>
  }
}

// -----
module {
  func.func @fold_mul_zero_lhs_f32(%arg0: tensor<f32>) -> tensor<f32> {
    %0 = "tosa.const"() <{values = dense<0.000000e+00> : tensor<f32>}> : () -> tensor<f32>
    %1 = "tosa.const"() <{values = dense<0> : tensor<1xi8>}> : () -> tensor<1xi8>
    %2 = tosa.mul %0, %arg0, %1 : (tensor<f32>, tensor<f32>, tensor<1xi8>) -> tensor<f32>
    return %2 : tensor<f32>
  }
}

// -----
module {
  func.func @fold_mul_zero_rhs_i32(%arg0: tensor<i32>) -> tensor<i32> {
    %0 = "tosa.const"() <{values = dense<0> : tensor<i32>}> : () -> tensor<i32>
    %1 = "tosa.const"() <{values = dense<0> : tensor<1xi8>}> : () -> tensor<1xi8>
    %2 = tosa.mul %arg0, %0, %1 : (tensor<i32>, tensor<i32>, tensor<1xi8>) -> tensor<i32>
    return %2 : tensor<i32>
  }
}

// -----
module {
  func.func @fold_mul_zero_lhs_i32(%arg0: tensor<i32>) -> tensor<i32> {
    %0 = "tosa.const"() <{values = dense<0> : tensor<i32>}> : () -> tensor<i32>
    %1 = "tosa.const"() <{values = dense<0> : tensor<1xi8>}> : () -> tensor<1xi8>
    %2 = tosa.mul %0, %arg0, %1 : (tensor<i32>, tensor<i32>, tensor<1xi8>) -> tensor<i32>
    return %2 : tensor<i32>
  }
}

// -----
module {
  func.func @fold_mul_one_rhs_f32(%arg0: tensor<f32>) -> tensor<f32> {
    %0 = "tosa.const"() <{values = dense<1.000000e+00> : tensor<f32>}> : () -> tensor<f32>
    %1 = "tosa.const"() <{values = dense<0> : tensor<1xi8>}> : () -> tensor<1xi8>
    %2 = tosa.mul %arg0, %0, %1 : (tensor<f32>, tensor<f32>, tensor<1xi8>) -> tensor<f32>
    return %2 : tensor<f32>
  }
}

// -----
module {
  func.func @no_fold_mul_unknown_broadcast_one_rhs_f32(%arg0: tensor<1x4xf32>) -> tensor<2x4xf32> {
    %0 = "tosa.const"() <{values = dense<1.000000e+00> : tensor<2x1xf32>}> : () -> tensor<2x1xf32>
    %1 = "tosa.const"() <{values = dense<0> : tensor<1xi8>}> : () -> tensor<1xi8>
    %2 = tosa.mul %arg0, %0, %1 : (tensor<1x4xf32>, tensor<2x1xf32>, tensor<1xi8>) -> tensor<2x4xf32>
    return %2 : tensor<2x4xf32>
  }
}

// -----
module {
  func.func @no_fold_dynamic_mul_unknown_broadcast_one_rhs_f32(%arg0: tensor<?x4xf32>) -> tensor<?x4xf32> {
    %0 = "tosa.const"() <{values = dense<1.000000e+00> : tensor<2x1xf32>}> : () -> tensor<2x1xf32>
    %1 = "tosa.const"() <{values = dense<0> : tensor<1xi8>}> : () -> tensor<1xi8>
    %2 = tosa.mul %arg0, %0, %1 : (tensor<?x4xf32>, tensor<2x1xf32>, tensor<1xi8>) -> tensor<?x4xf32>
    return %2 : tensor<?x4xf32>
  }
}

// -----
module {
  func.func @fold_mul_one_lhs_f32(%arg0: tensor<f32>) -> tensor<f32> {
    %0 = "tosa.const"() <{values = dense<1.000000e+00> : tensor<f32>}> : () -> tensor<f32>
    %1 = "tosa.const"() <{values = dense<0> : tensor<1xi8>}> : () -> tensor<1xi8>
    %2 = tosa.mul %0, %arg0, %1 : (tensor<f32>, tensor<f32>, tensor<1xi8>) -> tensor<f32>
    return %2 : tensor<f32>
  }
}

// -----
module {
  func.func @fold_mul_one_rhs_i32(%arg0: tensor<i32>) -> tensor<i32> {
    %0 = "tosa.const"() <{values = dense<64> : tensor<i32>}> : () -> tensor<i32>
    %1 = "tosa.const"() <{values = dense<6> : tensor<1xi8>}> : () -> tensor<1xi8>
    %2 = tosa.mul %arg0, %0, %1 : (tensor<i32>, tensor<i32>, tensor<1xi8>) -> tensor<i32>
    return %2 : tensor<i32>
  }
}

// -----
module {
  func.func @fold_mul_one_lhs_i32(%arg0: tensor<i32>) -> tensor<i32> {
    %0 = "tosa.const"() <{values = dense<64> : tensor<i32>}> : () -> tensor<i32>
    %1 = "tosa.const"() <{values = dense<6> : tensor<1xi8>}> : () -> tensor<1xi8>
    %2 = tosa.mul %0, %arg0, %1 : (tensor<i32>, tensor<i32>, tensor<1xi8>) -> tensor<i32>
    return %2 : tensor<i32>
  }
}

// -----
module {
  func.func @no_fold_mul_unknown_broadcast_one_lhs_f32(%arg0: tensor<1x4xf32>) -> tensor<2x4xf32> {
    %0 = "tosa.const"() <{values = dense<1.000000e+00> : tensor<2x1xf32>}> : () -> tensor<2x1xf32>
    %1 = "tosa.const"() <{values = dense<0> : tensor<1xi8>}> : () -> tensor<1xi8>
    %2 = tosa.mul %0, %arg0, %1 : (tensor<2x1xf32>, tensor<1x4xf32>, tensor<1xi8>) -> tensor<2x4xf32>
    return %2 : tensor<2x4xf32>
  }
}

// -----
module {
  func.func @no_fold_dynamic_mul_unknown_broadcast_one_lhs_f32(%arg0: tensor<?x4xf32>) -> tensor<?x4xf32> {
    %0 = "tosa.const"() <{values = dense<1.000000e+00> : tensor<2x1xf32>}> : () -> tensor<2x1xf32>
    %1 = "tosa.const"() <{values = dense<0> : tensor<1xi8>}> : () -> tensor<1xi8>
    %2 = tosa.mul %0, %arg0, %1 : (tensor<2x1xf32>, tensor<?x4xf32>, tensor<1xi8>) -> tensor<?x4xf32>
    return %2 : tensor<?x4xf32>
  }
}

// -----
module {
  func.func @fold_mul_one_float(%arg0: tensor<2x3xf32>) -> tensor<2x3xf32> {
    %0 = "tosa.const"() <{values = dense<0> : tensor<1xi8>}> : () -> tensor<1xi8>
    %1 = "tosa.const"() <{values = dense<1.000000e+00> : tensor<2x3xf32>}> : () -> tensor<2x3xf32>
    %2 = tosa.mul %arg0, %1, %0 : (tensor<2x3xf32>, tensor<2x3xf32>, tensor<1xi8>) -> tensor<2x3xf32>
    return %2 : tensor<2x3xf32>
  }
}

// -----
module {
  func.func @fold_mul_bcast_one_float(%arg0: tensor<2x3xf32>) -> tensor<2x3xf32> {
    %0 = "tosa.const"() <{values = dense<1.000000e+00> : tensor<1x1xf32>}> : () -> tensor<1x1xf32>
    %1 = "tosa.const"() <{values = dense<0> : tensor<1xi8>}> : () -> tensor<1xi8>
    %2 = tosa.mul %0, %arg0, %1 : (tensor<1x1xf32>, tensor<2x3xf32>, tensor<1xi8>) -> tensor<2x3xf32>
    return %2 : tensor<2x3xf32>
  }
}

// -----
module {
  func.func @fold_mul_one_int(%arg0: tensor<2x3xi32>) -> tensor<2x3xi32> {
    %0 = "tosa.const"() <{values = dense<0> : tensor<1xi8>}> : () -> tensor<1xi8>
    %1 = "tosa.const"() <{values = dense<1> : tensor<2x3xi32>}> : () -> tensor<2x3xi32>
    %2 = tosa.mul %arg0, %1, %0 : (tensor<2x3xi32>, tensor<2x3xi32>, tensor<1xi8>) -> tensor<2x3xi32>
    return %2 : tensor<2x3xi32>
  }
}

// -----
module {
  func.func @fold_mul_one_int_and_shift(%arg0: tensor<2x3xi32>) -> tensor<2x3xi32> {
    %0 = "tosa.const"() <{values = dense<1> : tensor<2x3xi32>}> : () -> tensor<2x3xi32>
    %1 = "tosa.const"() <{values = dense<31> : tensor<1xi8>}> : () -> tensor<1xi8>
    %2 = tosa.mul %arg0, %0, %1 : (tensor<2x3xi32>, tensor<2x3xi32>, tensor<1xi8>) -> tensor<2x3xi32>
    return %2 : tensor<2x3xi32>
  }
}

// -----
module {
  func.func @fold_mul_zero_broadcast(%arg0: tensor<2x3xf32>) -> (tensor<2x3xf32>, tensor<2x3xf32>) {
    %0 = "tosa.const"() <{values = dense<0.000000e+00> : tensor<1x1xf32>}> : () -> tensor<1x1xf32>
    %1 = "tosa.const"() <{values = dense<0> : tensor<1xi8>}> : () -> tensor<1xi8>
    %2 = tosa.mul %arg0, %0, %1 : (tensor<2x3xf32>, tensor<1x1xf32>, tensor<1xi8>) -> tensor<2x3xf32>
    %3 = tosa.mul %0, %arg0, %1 : (tensor<1x1xf32>, tensor<2x3xf32>, tensor<1xi8>) -> tensor<2x3xf32>
    return %2, %3 : tensor<2x3xf32>, tensor<2x3xf32>
  }
}

// -----
module {
  func.func @fold_mul_zero_dynamic_nofold(%arg0: tensor<?x17xf32>) -> tensor<?x17xf32> {
    %0 = "tosa.const"() <{values = dense<0.000000e+00> : tensor<1x1xf32>}> : () -> tensor<1x1xf32>
    %1 = "tosa.const"() <{values = dense<0> : tensor<1xi8>}> : () -> tensor<1xi8>
    %2 = tosa.mul %arg0, %0, %1 : (tensor<?x17xf32>, tensor<1x1xf32>, tensor<1xi8>) -> tensor<?x17xf32>
    return %2 : tensor<?x17xf32>
  }
}

// -----
module {
  func.func @fold_mul_one_dynamic_fold(%arg0: tensor<?x17xf32>) -> tensor<?x17xf32> {
    %0 = "tosa.const"() <{values = dense<1.000000e+00> : tensor<1x1xf32>}> : () -> tensor<1x1xf32>
    %1 = "tosa.const"() <{values = dense<0> : tensor<1xi8>}> : () -> tensor<1xi8>
    %2 = tosa.mul %arg0, %0, %1 : (tensor<?x17xf32>, tensor<1x1xf32>, tensor<1xi8>) -> tensor<?x17xf32>
    return %2 : tensor<?x17xf32>
  }
}

// -----
module {
  func.func @fold_mul_splat_i8() -> tensor<10xi32> {
    %0 = "tosa.const"() <{values = dense<17> : tensor<10xi8>}> : () -> tensor<10xi8>
    %1 = "tosa.const"() <{values = dense<32> : tensor<10xi8>}> : () -> tensor<10xi8>
    %2 = "tosa.const"() <{values = dense<3> : tensor<1xi8>}> : () -> tensor<1xi8>
    %3 = tosa.mul %0, %1, %2 : (tensor<10xi8>, tensor<10xi8>, tensor<1xi8>) -> tensor<10xi32>
    return %3 : tensor<10xi32>
  }
}

// -----
module {
  func.func @fold_mul_splat_f32() -> tensor<10xf32> {
    %0 = "tosa.const"() <{values = dense<3.000000e+00> : tensor<10xf32>}> : () -> tensor<10xf32>
    %1 = "tosa.const"() <{values = dense<2.000000e+00> : tensor<10xf32>}> : () -> tensor<10xf32>
    %2 = "tosa.const"() <{values = dense<0> : tensor<1xi8>}> : () -> tensor<1xi8>
    %3 = tosa.mul %0, %1, %2 : (tensor<10xf32>, tensor<10xf32>, tensor<1xi8>) -> tensor<10xf32>
    return %3 : tensor<10xf32>
  }
}

// -----
module {
  func.func @fold_sub_zero_rhs_f32(%arg0: tensor<f32>) -> tensor<f32> {
    %0 = "tosa.const"() <{values = dense<0.000000e+00> : tensor<f32>}> : () -> tensor<f32>
    %1 = tosa.sub %arg0, %0 : (tensor<f32>, tensor<f32>) -> tensor<f32>
    return %1 : tensor<f32>
  }
}

// -----
module {
  func.func @fold_sub_zero_rhs_i32(%arg0: tensor<i32>) -> tensor<i32> {
    %0 = "tosa.const"() <{values = dense<0> : tensor<i32>}> : () -> tensor<i32>
    %1 = tosa.sub %arg0, %0 : (tensor<i32>, tensor<i32>) -> tensor<i32>
    return %1 : tensor<i32>
  }
}

// -----
module {
  func.func @no_fold_sub_unknown_broadcast_zero_rhs(%arg0: tensor<1x4xi32>) -> tensor<2x4xi32> {
    %0 = "tosa.const"() <{values = dense<0> : tensor<2x1xi32>}> : () -> tensor<2x1xi32>
    %1 = tosa.sub %arg0, %0 : (tensor<1x4xi32>, tensor<2x1xi32>) -> tensor<2x4xi32>
    return %1 : tensor<2x4xi32>
  }
}

// -----
module {
  func.func @no_fold_dynamic_sub_unknown_broadcast_zero_rhs(%arg0: tensor<?x4xi32>) -> tensor<?x4xi32> {
    %0 = "tosa.const"() <{values = dense<0> : tensor<2x1xi32>}> : () -> tensor<2x1xi32>
    %1 = tosa.sub %arg0, %0 : (tensor<?x4xi32>, tensor<2x1xi32>) -> tensor<?x4xi32>
    return %1 : tensor<?x4xi32>
  }
}

// -----
module {
  func.func @fold_dynamic_sub_broadcast_zero_rhs(%arg0: tensor<?x17xi32>) -> tensor<?x17xi32> {
    %0 = "tosa.const"() <{values = dense<0> : tensor<1x17xi32>}> : () -> tensor<1x17xi32>
    %1 = tosa.sub %arg0, %0 : (tensor<?x17xi32>, tensor<1x17xi32>) -> tensor<?x17xi32>
    return %1 : tensor<?x17xi32>
  }
}

// -----
module {
  func.func @fold_sub_splat_i32() -> tensor<10xi32> {
    %0 = "tosa.const"() <{values = dense<1> : tensor<10xi32>}> : () -> tensor<10xi32>
    %1 = "tosa.const"() <{values = dense<2> : tensor<10xi32>}> : () -> tensor<10xi32>
    %2 = tosa.sub %0, %1 : (tensor<10xi32>, tensor<10xi32>) -> tensor<10xi32>
    return %2 : tensor<10xi32>
  }
}

// -----
module {
  func.func @fold_sub_splat_f32() -> tensor<10xf32> {
    %0 = "tosa.const"() <{values = dense<1.000000e+00> : tensor<10xf32>}> : () -> tensor<10xf32>
    %1 = "tosa.const"() <{values = dense<2.000000e+00> : tensor<10xf32>}> : () -> tensor<10xf32>
    %2 = tosa.sub %0, %1 : (tensor<10xf32>, tensor<10xf32>) -> tensor<10xf32>
    return %2 : tensor<10xf32>
  }
}

// -----
module {
  func.func @fold_sub_splat_i32_positive_overflow() -> tensor<10xi32> {
    %0 = "tosa.const"() <{values = dense<2147483647> : tensor<10xi32>}> : () -> tensor<10xi32>
    %1 = "tosa.const"() <{values = dense<-1> : tensor<10xi32>}> : () -> tensor<10xi32>
    %2 = tosa.sub %0, %1 : (tensor<10xi32>, tensor<10xi32>) -> tensor<10xi32>
    return %2 : tensor<10xi32>
  }
}

// -----
module {
  func.func @fold_sub_splat_i32_negative_overflow() -> tensor<10xi32> {
    %0 = "tosa.const"() <{values = dense<-2147483648> : tensor<10xi32>}> : () -> tensor<10xi32>
    %1 = "tosa.const"() <{values = dense<1> : tensor<10xi32>}> : () -> tensor<10xi32>
    %2 = tosa.sub %0, %1 : (tensor<10xi32>, tensor<10xi32>) -> tensor<10xi32>
    return %2 : tensor<10xi32>
  }
}

// -----
module {
  func.func @fold_sub_splat_ui8() -> tensor<10xui8> {
    %0 = "tosa.const"() <{values = dense<255> : tensor<10xui8>}> : () -> tensor<10xui8>
    %1 = "tosa.const"() <{values = dense<253> : tensor<10xui8>}> : () -> tensor<10xui8>
    %2 = tosa.sub %0, %1 : (tensor<10xui8>, tensor<10xui8>) -> tensor<10xui8>
    return %2 : tensor<10xui8>
  }
}

// -----
module {
  func.func @fold_sub_splat_ui8_overflow() -> tensor<10xui8> {
    %0 = "tosa.const"() <{values = dense<1> : tensor<10xui8>}> : () -> tensor<10xui8>
    %1 = "tosa.const"() <{values = dense<253> : tensor<10xui8>}> : () -> tensor<10xui8>
    %2 = tosa.sub %0, %1 : (tensor<10xui8>, tensor<10xui8>) -> tensor<10xui8>
    return %2 : tensor<10xui8>
  }
}

// -----
module {
  func.func @fold_greater_splat_f32() -> (tensor<10xi1>, tensor<10xi1>) {
    %0 = "tosa.const"() <{values = dense<4.000000e+00> : tensor<10xf32>}> : () -> tensor<10xf32>
    %1 = "tosa.const"() <{values = dense<2.000000e+00> : tensor<10xf32>}> : () -> tensor<10xf32>
    %2 = "tosa.const"() <{values = dense<1.000000e+00> : tensor<10xf32>}> : () -> tensor<10xf32>
    %3 = "tosa.const"() <{values = dense<2.000000e+00> : tensor<10xf32>}> : () -> tensor<10xf32>
    %4 = tosa.greater %0, %1 : (tensor<10xf32>, tensor<10xf32>) -> tensor<10xi1>
    %5 = tosa.greater %2, %3 : (tensor<10xf32>, tensor<10xf32>) -> tensor<10xi1>
    return %4, %5 : tensor<10xi1>, tensor<10xi1>
  }
}

// -----
module {
  func.func @fold_greater_splat_i32() -> (tensor<10xi1>, tensor<10xi1>) {
    %0 = "tosa.const"() <{values = dense<-10> : tensor<10xi32>}> : () -> tensor<10xi32>
    %1 = "tosa.const"() <{values = dense<8> : tensor<10xi32>}> : () -> tensor<10xi32>
    %2 = "tosa.const"() <{values = dense<-10> : tensor<10xi32>}> : () -> tensor<10xi32>
    %3 = "tosa.const"() <{values = dense<-12> : tensor<10xi32>}> : () -> tensor<10xi32>
    %4 = tosa.greater %0, %1 : (tensor<10xi32>, tensor<10xi32>) -> tensor<10xi1>
    %5 = tosa.greater %2, %3 : (tensor<10xi32>, tensor<10xi32>) -> tensor<10xi1>
    return %4, %5 : tensor<10xi1>, tensor<10xi1>
  }
}

// -----
module {
  func.func @fold_greater_splat_ui8() -> (tensor<10xi1>, tensor<10xi1>, tensor<10xi1>) {
    %0 = "tosa.const"() <{values = dense<1> : tensor<10xui8>}> : () -> tensor<10xui8>
    %1 = "tosa.const"() <{values = dense<1> : tensor<10xui8>}> : () -> tensor<10xui8>
    %2 = "tosa.const"() <{values = dense<246> : tensor<10xui8>}> : () -> tensor<10xui8>
    %3 = "tosa.const"() <{values = dense<245> : tensor<10xui8>}> : () -> tensor<10xui8>
    %4 = tosa.greater %2, %3 : (tensor<10xui8>, tensor<10xui8>) -> tensor<10xi1>
    %5 = tosa.greater %0, %1 : (tensor<10xui8>, tensor<10xui8>) -> tensor<10xi1>
    %6 = tosa.greater %0, %2 : (tensor<10xui8>, tensor<10xui8>) -> tensor<10xi1>
    return %4, %5, %6 : tensor<10xi1>, tensor<10xi1>, tensor<10xi1>
  }
}

// -----
module {
  func.func @fold_greater_eq_splat_f32() -> (tensor<10xi1>, tensor<10xi1>) {
    %0 = "tosa.const"() <{values = dense<4.000000e+00> : tensor<10xf32>}> : () -> tensor<10xf32>
    %1 = "tosa.const"() <{values = dense<4.000000e+00> : tensor<10xf32>}> : () -> tensor<10xf32>
    %2 = "tosa.const"() <{values = dense<1.000000e+00> : tensor<10xf32>}> : () -> tensor<10xf32>
    %3 = "tosa.const"() <{values = dense<2.000000e+00> : tensor<10xf32>}> : () -> tensor<10xf32>
    %4 = tosa.greater_equal %0, %1 : (tensor<10xf32>, tensor<10xf32>) -> tensor<10xi1>
    %5 = tosa.greater_equal %2, %3 : (tensor<10xf32>, tensor<10xf32>) -> tensor<10xi1>
    return %4, %5 : tensor<10xi1>, tensor<10xi1>
  }
}

// -----
module {
  func.func @fold_greater_eq_splat_i32() -> (tensor<10xi1>, tensor<10xi1>) {
    %0 = "tosa.const"() <{values = dense<-10> : tensor<10xi32>}> : () -> tensor<10xi32>
    %1 = "tosa.const"() <{values = dense<8> : tensor<10xi32>}> : () -> tensor<10xi32>
    %2 = "tosa.const"() <{values = dense<-10> : tensor<10xi32>}> : () -> tensor<10xi32>
    %3 = "tosa.const"() <{values = dense<-10> : tensor<10xi32>}> : () -> tensor<10xi32>
    %4 = tosa.greater_equal %2, %3 : (tensor<10xi32>, tensor<10xi32>) -> tensor<10xi1>
    %5 = tosa.greater_equal %0, %1 : (tensor<10xi32>, tensor<10xi32>) -> tensor<10xi1>
    return %4, %5 : tensor<10xi1>, tensor<10xi1>
  }
}

// -----
module {
  func.func @fold_greater_eq_splat_ui8() -> (tensor<10xi1>, tensor<10xi1>) {
    %0 = "tosa.const"() <{values = dense<1> : tensor<10xui8>}> : () -> tensor<10xui8>
    %1 = "tosa.const"() <{values = dense<255> : tensor<10xui8>}> : () -> tensor<10xui8>
    %2 = "tosa.const"() <{values = dense<245> : tensor<10xui8>}> : () -> tensor<10xui8>
    %3 = "tosa.const"() <{values = dense<245> : tensor<10xui8>}> : () -> tensor<10xui8>
    %4 = tosa.greater_equal %2, %3 : (tensor<10xui8>, tensor<10xui8>) -> tensor<10xi1>
    %5 = tosa.greater_equal %0, %1 : (tensor<10xui8>, tensor<10xui8>) -> tensor<10xi1>
    return %4, %5 : tensor<10xi1>, tensor<10xi1>
  }
}

// -----
module {
  func.func @fold_eq_splat_f32() -> (tensor<10xi1>, tensor<10xi1>) {
    %0 = "tosa.const"() <{values = dense<4.000000e+00> : tensor<10xf32>}> : () -> tensor<10xf32>
    %1 = "tosa.const"() <{values = dense<4.000000e+00> : tensor<10xf32>}> : () -> tensor<10xf32>
    %2 = "tosa.const"() <{values = dense<1.000000e+00> : tensor<10xf32>}> : () -> tensor<10xf32>
    %3 = "tosa.const"() <{values = dense<2.000000e+00> : tensor<10xf32>}> : () -> tensor<10xf32>
    %4 = tosa.equal %0, %1 : (tensor<10xf32>, tensor<10xf32>) -> tensor<10xi1>
    %5 = tosa.equal %2, %3 : (tensor<10xf32>, tensor<10xf32>) -> tensor<10xi1>
    return %4, %5 : tensor<10xi1>, tensor<10xi1>
  }
}

// -----
module {
  func.func @fold_compare_nan_f32() -> (tensor<10xi1>, tensor<10xi1>, tensor<10xi1>) {
    %0 = "tosa.const"() <{values = dense<0x7FC00000> : tensor<10xf32>}> : () -> tensor<10xf32>
    %1 = "tosa.const"() <{values = dense<1.000000e+00> : tensor<10xf32>}> : () -> tensor<10xf32>
    %2 = tosa.greater %0, %1 : (tensor<10xf32>, tensor<10xf32>) -> tensor<10xi1>
    %3 = tosa.greater_equal %1, %0 : (tensor<10xf32>, tensor<10xf32>) -> tensor<10xi1>
    %4 = tosa.equal %0, %0 : (tensor<10xf32>, tensor<10xf32>) -> tensor<10xi1>
    return %2, %3, %4 : tensor<10xi1>, tensor<10xi1>, tensor<10xi1>
  }
}

// -----
module {
  func.func @fold_eq_splat_i32() -> (tensor<10xi1>, tensor<10xi1>) {
    %0 = "tosa.const"() <{values = dense<-10> : tensor<10xi32>}> : () -> tensor<10xi32>
    %1 = "tosa.const"() <{values = dense<8> : tensor<10xi32>}> : () -> tensor<10xi32>
    %2 = "tosa.const"() <{values = dense<-10> : tensor<10xi32>}> : () -> tensor<10xi32>
    %3 = "tosa.const"() <{values = dense<-10> : tensor<10xi32>}> : () -> tensor<10xi32>
    %4 = tosa.equal %2, %3 : (tensor<10xi32>, tensor<10xi32>) -> tensor<10xi1>
    %5 = tosa.equal %0, %1 : (tensor<10xi32>, tensor<10xi32>) -> tensor<10xi1>
    return %4, %5 : tensor<10xi1>, tensor<10xi1>
  }
}

// -----
module {
  func.func @fold_eq_i32(%arg0: tensor<10xi32>) -> tensor<10xi1> {
    %0 = tosa.equal %arg0, %arg0 : (tensor<10xi32>, tensor<10xi32>) -> tensor<10xi1>
    return %0 : tensor<10xi1>
  }
}

// -----
module {
  func.func @reshape_splat() -> tensor<6x5x4xi32> {
    %0 = "tosa.const"() <{values = dense<42> : tensor<4x5x6xi32>}> : () -> tensor<4x5x6xi32>
    %1 = tosa.const_shape  {values = dense<[6, 5, 4]> : tensor<3xindex>} : () -> !tosa.shape<3>
    %2 = tosa.reshape %0, %1 : (tensor<4x5x6xi32>, !tosa.shape<3>) -> tensor<6x5x4xi32>
    return %2 : tensor<6x5x4xi32>
  }
}

// -----
module {
  func.func @slice_splat() -> tensor<1x1x1xi32> {
    %0 = "tosa.const"() <{values = dense<42> : tensor<4x5x6xi32>}> : () -> tensor<4x5x6xi32>
    %1 = tosa.const_shape  {values = dense<[1, 2, 3]> : tensor<3xindex>} : () -> !tosa.shape<3>
    %2 = tosa.const_shape  {values = dense<1> : tensor<3xindex>} : () -> !tosa.shape<3>
    %3 = tosa.slice %0, %1, %2 : (tensor<4x5x6xi32>, !tosa.shape<3>, !tosa.shape<3>) -> tensor<1x1x1xi32>
    return %3 : tensor<1x1x1xi32>
  }
}

// -----
module {
  func.func @slice_singleton() -> tensor<1x1xi32> {
    %0 = "tosa.const"() <{values = dense<[[0, 1, 2], [3, 4, 5], [6, 7, 8]]> : tensor<3x3xi32>}> : () -> tensor<3x3xi32>
    %1 = tosa.const_shape  {values = dense<1> : tensor<2xindex>} : () -> !tosa.shape<2>
    %2 = tosa.const_shape  {values = dense<1> : tensor<2xindex>} : () -> !tosa.shape<2>
    %3 = tosa.slice %0, %1, %2 : (tensor<3x3xi32>, !tosa.shape<2>, !tosa.shape<2>) -> tensor<1x1xi32>
    return %3 : tensor<1x1xi32>
  }
}

// -----
module {
  func.func @test_slice_resource_no_fold() -> tensor<1x1xi32> {
    %0 = "tosa.const"() <{values = dense_resource<slice_resource> : tensor<3x4xi32>}> : () -> tensor<3x4xi32>
    %1 = tosa.const_shape  {values = dense<[1, 2]> : tensor<2xindex>} : () -> !tosa.shape<2>
    %2 = tosa.const_shape  {values = dense<1> : tensor<2xindex>} : () -> !tosa.shape<2>
    %3 = tosa.slice %0, %1, %2 : (tensor<3x4xi32>, !tosa.shape<2>, !tosa.shape<2>) -> tensor<1x1xi32>
    return %3 : tensor<1x1xi32>
  }
}

{-#
  dialect_resources: {
    builtin: {
      slice_resource: "0x040000000700000000000000000000000000000000000000000000000900000000000000000000000000000000000000"
    }
  }
#-}

// -----
module {
  func.func @cast_float_to_float() -> tensor<f16> {
    %0 = "tosa.const"() <{values = dense<4.200000e+01> : tensor<f32>}> : () -> tensor<f32>
    %1 = tosa.cast %0 : (tensor<f32>) -> tensor<f16>
    return %1 : tensor<f16>
  }
}

// -----
module {
  func.func @cast_int_to_float() -> tensor<f16> {
    %0 = "tosa.const"() <{values = dense<4> : tensor<i32>}> : () -> tensor<i32>
    %1 = tosa.cast %0 : (tensor<i32>) -> tensor<f16>
    return %1 : tensor<f16>
  }
}

// -----
module {
  func.func @cast_float_to_int() -> tensor<i16> {
    %0 = "tosa.const"() <{values = dense<-4.000000e+00> : tensor<f32>}> : () -> tensor<f32>
    %1 = tosa.cast %0 : (tensor<f32>) -> tensor<i16>
    return %1 : tensor<i16>
  }
}

// -----
module {
  func.func @cast_float_to_int_round() -> tensor<i16> {
    %0 = "tosa.const"() <{values = dense<-3.500000e+00> : tensor<f32>}> : () -> tensor<f32>
    %1 = tosa.cast %0 : (tensor<f32>) -> tensor<i16>
    return %1 : tensor<i16>
  }
}

// -----
module {
  func.func @cast_float_to_int_saturates_high() -> tensor<i8> {
    %0 = "tosa.const"() <{values = dense<1.000000e+20> : tensor<f32>}> : () -> tensor<f32>
    %1 = tosa.cast %0 : (tensor<f32>) -> tensor<i8>
    return %1 : tensor<i8>
  }
}

// -----
module {
  func.func @cast_float_to_int_saturates_low() -> tensor<i8> {
    %0 = "tosa.const"() <{values = dense<-1.000000e+20> : tensor<f32>}> : () -> tensor<f32>
    %1 = tosa.cast %0 : (tensor<f32>) -> tensor<i8>
    return %1 : tensor<i8>
  }
}

// -----
module {
  func.func @cast_float_to_unsigned_int_saturates_low() -> tensor<ui8> {
    %0 = "tosa.const"() <{values = dense<-1.000000e+20> : tensor<f32>}> : () -> tensor<f32>
    %1 = tosa.cast %0 : (tensor<f32>) -> tensor<ui8>
    return %1 : tensor<ui8>
  }
}

// -----
module {
  func.func @cast_float_to_unsigned_int_saturates_high() -> tensor<ui8> {
    %0 = "tosa.const"() <{values = dense<1.000000e+20> : tensor<f32>}> : () -> tensor<f32>
    %1 = tosa.cast %0 : (tensor<f32>) -> tensor<ui8>
    return %1 : tensor<ui8>
  }
}

// -----
module {
  func.func @cast_int_to_int_trunc() -> tensor<i16> {
    %0 = "tosa.const"() <{values = dense<-1> : tensor<i32>}> : () -> tensor<i32>
    %1 = tosa.cast %0 : (tensor<i32>) -> tensor<i16>
    return %1 : tensor<i16>
  }
}

// -----
module {
  func.func @cast_int_to_int_sign() -> tensor<i32> {
    %0 = "tosa.const"() <{values = dense<-1> : tensor<i16>}> : () -> tensor<i16>
    %1 = tosa.cast %0 : (tensor<i16>) -> tensor<i32>
    return %1 : tensor<i32>
  }
}

// -----
module {
  func.func @reverse_splat() -> tensor<10xi32> {
    %0 = "tosa.const"() <{values = dense<42> : tensor<10xi32>}> : () -> tensor<10xi32>
    %1 = tosa.reverse %0 {axis = 0 : i32} : (tensor<10xi32>) -> tensor<10xi32>
    return %1 : tensor<10xi32>
  }
}

// -----
module {
  func.func @reverse_length_one(%arg0: tensor<10x1xi32>) -> (tensor<10x1xi32>, tensor<10x1xi32>) {
    %0 = tosa.reverse %arg0 {axis = 0 : i32} : (tensor<10x1xi32>) -> tensor<10x1xi32>
    %1 = tosa.reverse %arg0 {axis = 1 : i32} : (tensor<10x1xi32>) -> tensor<10x1xi32>
    return %0, %1 : tensor<10x1xi32>, tensor<10x1xi32>
  }
}

// -----
module {
  func.func @no_shift_op_reorder(%arg0: tensor<44x1xi16>, %arg1: tensor<1xi8>) -> tensor<44x57xi32> {
    %0 = "tosa.const"() <{values = dense<1> : tensor<44x57xi16>}> : () -> tensor<44x57xi16>
    %1 = tosa.mul %arg0, %0, %arg1 : (tensor<44x1xi16>, tensor<44x57xi16>, tensor<1xi8>) -> tensor<44x57xi32>
    return %1 : tensor<44x57xi32>
  }
}

// -----
module {
  func.func @fold_select_same_value(%arg0: tensor<2x3xi1>, %arg1: tensor<2x3xi32>) -> tensor<2x3xi32> {
    %0 = tosa.select %arg0, %arg1, %arg1 : (tensor<2x3xi1>, tensor<2x3xi32>, tensor<2x3xi32>) -> tensor<2x3xi32>
    return %0 : tensor<2x3xi32>
  }
}

// -----
module {
  func.func @fold_select_same_value_dynamic_broadcast(%arg0: tensor<1x1xi1>, %arg1: tensor<?x3xi32>) -> tensor<?x3xi32> {
    %0 = tosa.select %arg0, %arg1, %arg1 : (tensor<1x1xi1>, tensor<?x3xi32>, tensor<?x3xi32>) -> tensor<?x3xi32>
    return %0 : tensor<?x3xi32>
  }
}

// -----
module {
  func.func @fold_select_true_value(%arg0: tensor<2x3xi32>, %arg1: tensor<2x3xi32>) -> tensor<2x3xi32> {
    %0 = "tosa.const"() <{values = dense<true> : tensor<2x3xi1>}> : () -> tensor<2x3xi1>
    %1 = tosa.select %0, %arg0, %arg1 : (tensor<2x3xi1>, tensor<2x3xi32>, tensor<2x3xi32>) -> tensor<2x3xi32>
    return %1 : tensor<2x3xi32>
  }
}

// -----
module {
  func.func @fold_select_false_value(%arg0: tensor<2x3xi32>, %arg1: tensor<2x3xi32>) -> tensor<2x3xi32> {
    %0 = "tosa.const"() <{values = dense<false> : tensor<2x3xi1>}> : () -> tensor<2x3xi1>
    %1 = tosa.select %0, %arg0, %arg1 : (tensor<2x3xi1>, tensor<2x3xi32>, tensor<2x3xi32>) -> tensor<2x3xi32>
    return %1 : tensor<2x3xi32>
  }
}

// -----
module {
  func.func @no_fold_select_broadcast_same_value(%arg0: tensor<2x2xi1>, %arg1: tensor<1x1xf32>) -> tensor<2x2xf32> {
    %0 = tosa.select %arg0, %arg1, %arg1 : (tensor<2x2xi1>, tensor<1x1xf32>, tensor<1x1xf32>) -> tensor<2x2xf32>
    return %0 : tensor<2x2xf32>
  }
}

// -----
module {
  func.func @no_fold_select_broadcast_true_value(%arg0: tensor<1x1xf32>, %arg1: tensor<2x2xf32>) -> tensor<?x?xf32> {
    %0 = "tosa.const"() <{values = dense<true> : tensor<2x2xi1>}> : () -> tensor<2x2xi1>
    %1 = tosa.select %0, %arg0, %arg1 : (tensor<2x2xi1>, tensor<1x1xf32>, tensor<2x2xf32>) -> tensor<?x?xf32>
    return %1 : tensor<?x?xf32>
  }
}

// -----
module {
  func.func @no_fold_select_broadcast_false_value(%arg0: tensor<2x2xf32>, %arg1: tensor<1x1xf32>) -> tensor<2x2xf32> {
    %0 = "tosa.const"() <{values = dense<false> : tensor<2x2xi1>}> : () -> tensor<2x2xi1>
    %1 = tosa.select %0, %arg0, %arg1 : (tensor<2x2xi1>, tensor<2x2xf32>, tensor<1x1xf32>) -> tensor<2x2xf32>
    return %1 : tensor<2x2xf32>
  }
}

// -----
module {
  func.func @no_fold_select_unknown_broadcast_true_value_dynamic_operand(%arg0: tensor<2x?xf32>, %arg1: tensor<2x2xf32>) -> tensor<2x?xf32> {
    %0 = "tosa.const"() <{values = dense<true> : tensor<2x2xi1>}> : () -> tensor<2x2xi1>
    %1 = tosa.select %0, %arg0, %arg1 : (tensor<2x2xi1>, tensor<2x?xf32>, tensor<2x2xf32>) -> tensor<2x?xf32>
    return %1 : tensor<2x?xf32>
  }
}

// -----
module {
  func.func @no_fold_select_unknown_broadcast_false_value_dynamic_operand(%arg0: tensor<2x?xf32>, %arg1: tensor<2x2xf32>) -> tensor<2x2xf32> {
    %0 = "tosa.const"() <{values = dense<false> : tensor<2x2xi1>}> : () -> tensor<2x2xi1>
    %1 = tosa.select %0, %arg0, %arg1 : (tensor<2x2xi1>, tensor<2x?xf32>, tensor<2x2xf32>) -> tensor<2x2xf32>
    return %1 : tensor<2x2xf32>
  }
}

// -----
module {
  func.func @fold_select_dynamic_broadcast_true_value(%arg0: tensor<2x?xf32>, %arg1: tensor<2x1xf32>) -> tensor<2x?xf32> {
    %0 = "tosa.const"() <{values = dense<true> : tensor<2x1xi1>}> : () -> tensor<2x1xi1>
    %1 = tosa.select %0, %arg0, %arg1 : (tensor<2x1xi1>, tensor<2x?xf32>, tensor<2x1xf32>) -> tensor<2x?xf32>
    return %1 : tensor<2x?xf32>
  }
}

// -----
module {
  func.func @fold_select_dynamic_broadcast_false_value(%arg0: tensor<1x1xf32>, %arg1: tensor<?x2xf32>) -> tensor<?x2xf32> {
    %0 = "tosa.const"() <{values = dense<false> : tensor<1x1xi1>}> : () -> tensor<1x1xi1>
    %1 = tosa.select %0, %arg0, %arg1 : (tensor<1x1xi1>, tensor<1x1xf32>, tensor<?x2xf32>) -> tensor<?x2xf32>
    return %1 : tensor<?x2xf32>
  }
}

// -----
module {
  func.func @test_fold_add_shape() -> !tosa.shape<6> {
    %0 = tosa.const_shape  {values = dense<[1, 2, 3, 4, 5, 6]> : tensor<6xindex>} : () -> !tosa.shape<6>
    %1 = tosa.const_shape  {values = dense<[1, 2, 3, 4, 5, 6]> : tensor<6xindex>} : () -> !tosa.shape<6>
    %2 = tosa.add_shape %0, %1 : (!tosa.shape<6>, !tosa.shape<6>) -> !tosa.shape<6>
    return %2 : !tosa.shape<6>
  }
}

// -----
module {
  func.func @test_no_fold_add_shape_positive_overflow() -> !tosa.shape<6> {
    %0 = tosa.const_shape  {values = dense<[1, 2, 3, 4, 5, 9223372036854775807]> : tensor<6xindex>} : () -> !tosa.shape<6>
    %1 = tosa.const_shape  {values = dense<[1, 2, 3, 4, 5, 1]> : tensor<6xindex>} : () -> !tosa.shape<6>
    %2 = tosa.add_shape %0, %1 : (!tosa.shape<6>, !tosa.shape<6>) -> !tosa.shape<6>
    return %2 : !tosa.shape<6>
  }
}

// -----
module {
  func.func @test_no_fold_add_shape_negative_overflow() -> !tosa.shape<6> {
    %0 = tosa.const_shape  {values = dense<[1, 2, 3, 4, 5, -9223372036854775808]> : tensor<6xindex>} : () -> !tosa.shape<6>
    %1 = tosa.const_shape  {values = dense<[1, 2, 3, 4, 5, -1]> : tensor<6xindex>} : () -> !tosa.shape<6>
    %2 = tosa.add_shape %0, %1 : (!tosa.shape<6>, !tosa.shape<6>) -> !tosa.shape<6>
    return %2 : !tosa.shape<6>
  }
}

// -----
module {
  func.func @test_fold_dim(%arg0: tensor<6xi32>) -> !tosa.shape<1> {
    %0 = tosa.dim %arg0 {axis = 0 : i32} : (tensor<6xi32>) -> !tosa.shape<1>
    return %0 : !tosa.shape<1>
  }
}

// -----
module {
  func.func @test_fold_sub_shape() -> !tosa.shape<6> {
    %0 = tosa.const_shape  {values = dense<[12, 22, 32, 42, 52, 62]> : tensor<6xindex>} : () -> !tosa.shape<6>
    %1 = tosa.const_shape  {values = dense<[10, 18, 26, 34, 42, 50]> : tensor<6xindex>} : () -> !tosa.shape<6>
    %2 = tosa.sub_shape %0, %1 : (!tosa.shape<6>, !tosa.shape<6>) -> !tosa.shape<6>
    return %2 : !tosa.shape<6>
  }
}

// -----
module {
  func.func @test_no_fold_dim_unranked_input(%arg0: tensor<*xi32>) -> !tosa.shape<1> {
    %0 = tosa.dim %arg0 {axis = 0 : i32} : (tensor<*xi32>) -> !tosa.shape<1>
    return %0 : !tosa.shape<1>
  }
}

// -----
module {
  func.func @test_no_fold_sub_shape_positive_overflow() -> !tosa.shape<6> {
    %0 = tosa.const_shape  {values = dense<[1, 2, 3, 4, 5, 9223372036854775807]> : tensor<6xindex>} : () -> !tosa.shape<6>
    %1 = tosa.const_shape  {values = dense<[1, 2, 3, 4, 5, -1]> : tensor<6xindex>} : () -> !tosa.shape<6>
    %2 = tosa.sub_shape %0, %1 : (!tosa.shape<6>, !tosa.shape<6>) -> !tosa.shape<6>
    return %2 : !tosa.shape<6>
  }
}

// -----
module {
  func.func @test_no_fold_dim_dynamic(%arg0: tensor<4x?xi32>) -> !tosa.shape<1> {
    %0 = tosa.dim %arg0 {axis = 1 : i32} : (tensor<4x?xi32>) -> !tosa.shape<1>
    return %0 : !tosa.shape<1>
  }
}

// -----
module {
  func.func @test_no_fold_sub_shape_negative_overflow() -> !tosa.shape<6> {
    %0 = tosa.const_shape  {values = dense<[1, 2, 3, 4, 5, -9223372036854775808]> : tensor<6xindex>} : () -> !tosa.shape<6>
    %1 = tosa.const_shape  {values = dense<[1, 2, 3, 4, 5, 1]> : tensor<6xindex>} : () -> !tosa.shape<6>
    %2 = tosa.sub_shape %0, %1 : (!tosa.shape<6>, !tosa.shape<6>) -> !tosa.shape<6>
    return %2 : !tosa.shape<6>
  }
}

// -----
module {
  func.func @test_fold_mul_shape() -> !tosa.shape<6> {
    %0 = tosa.const_shape  {values = dense<[2, 2, 3, 4, 2, 3]> : tensor<6xindex>} : () -> !tosa.shape<6>
    %1 = tosa.const_shape  {values = dense<[1, 2, 2, 2, 5, 4]> : tensor<6xindex>} : () -> !tosa.shape<6>
    %2 = tosa.mul_shape %0, %1 : (!tosa.shape<6>, !tosa.shape<6>) -> !tosa.shape<6>
    return %2 : !tosa.shape<6>
  }
}

// -----
module {
  func.func @test_no_fold_mul_shape_positive_overflow() -> !tosa.shape<6> {
    %0 = tosa.const_shape  {values = dense<[1, 2, 3, 4, 5, 9223372036854775807]> : tensor<6xindex>} : () -> !tosa.shape<6>
    %1 = tosa.const_shape  {values = dense<[1, 2, 3, 4, 5, 2]> : tensor<6xindex>} : () -> !tosa.shape<6>
    %2 = tosa.mul_shape %0, %1 : (!tosa.shape<6>, !tosa.shape<6>) -> !tosa.shape<6>
    return %2 : !tosa.shape<6>
  }
}

// -----
module {
  func.func @test_no_fold_mul_shape_negative_overflow() -> !tosa.shape<6> {
    %0 = tosa.const_shape  {values = dense<[1, 2, 3, 4, 5, -9223372036854775808]> : tensor<6xindex>} : () -> !tosa.shape<6>
    %1 = tosa.const_shape  {values = dense<[1, 2, 3, 4, 5, 2]> : tensor<6xindex>} : () -> !tosa.shape<6>
    %2 = tosa.mul_shape %0, %1 : (!tosa.shape<6>, !tosa.shape<6>) -> !tosa.shape<6>
    return %2 : !tosa.shape<6>
  }
}

// -----
module {
  func.func @test_fold_div_ceil_shape() -> !tosa.shape<6> {
    %0 = tosa.const_shape  {values = dense<[2, 7, 11, 22, 47, 46]> : tensor<6xindex>} : () -> !tosa.shape<6>
    %1 = tosa.const_shape  {values = dense<[1, 2, 2, 3, 5, 4]> : tensor<6xindex>} : () -> !tosa.shape<6>
    %2 = tosa.div_ceil_shape %0, %1 : (!tosa.shape<6>, !tosa.shape<6>) -> !tosa.shape<6>
    return %2 : !tosa.shape<6>
  }
}

// -----
module {
  func.func @test_no_fold_div_ceil_shape_negative_input() -> !tosa.shape<6> {
    %0 = tosa.const_shape  {values = dense<[2, 7, 11, 22, 47, -7]> : tensor<6xindex>} : () -> !tosa.shape<6>
    %1 = tosa.const_shape  {values = dense<[1, 2, 2, 3, 5, 2]> : tensor<6xindex>} : () -> !tosa.shape<6>
    %2 = tosa.div_ceil_shape %0, %1 : (!tosa.shape<6>, !tosa.shape<6>) -> !tosa.shape<6>
    return %2 : !tosa.shape<6>
  }
}

// -----
module {
  func.func @test_no_fold_div_ceil_shape_negative_divisor() -> !tosa.shape<6> {
    %0 = tosa.const_shape  {values = dense<[2, 7, 11, 22, 47, 7]> : tensor<6xindex>} : () -> !tosa.shape<6>
    %1 = tosa.const_shape  {values = dense<[1, 2, 2, 3, 5, -2]> : tensor<6xindex>} : () -> !tosa.shape<6>
    %2 = tosa.div_ceil_shape %0, %1 : (!tosa.shape<6>, !tosa.shape<6>) -> !tosa.shape<6>
    return %2 : !tosa.shape<6>
  }
}

// -----
module {
  func.func @test_no_fold_div_ceil_shape_positive_overflow() -> !tosa.shape<6> {
    %0 = tosa.const_shape  {values = dense<[2, 7, 11, 22, 47, 9223372036854775807]> : tensor<6xindex>} : () -> !tosa.shape<6>
    %1 = tosa.const_shape  {values = dense<[1, 2, 2, 3, 5, 0]> : tensor<6xindex>} : () -> !tosa.shape<6>
    %2 = tosa.div_ceil_shape %0, %1 : (!tosa.shape<6>, !tosa.shape<6>) -> !tosa.shape<6>
    return %2 : !tosa.shape<6>
  }
}

// -----
module {
  func.func @test_no_fold_div_ceil_shape_negative_overflow() -> !tosa.shape<6> {
    %0 = tosa.const_shape  {values = dense<[2, 7, 11, 22, 47, -9223372036854775808]> : tensor<6xindex>} : () -> !tosa.shape<6>
    %1 = tosa.const_shape  {values = dense<[1, 2, 2, 3, 5, 0]> : tensor<6xindex>} : () -> !tosa.shape<6>
    %2 = tosa.div_ceil_shape %0, %1 : (!tosa.shape<6>, !tosa.shape<6>) -> !tosa.shape<6>
    return %2 : !tosa.shape<6>
  }
}

// -----
module {
  func.func @test_fold_div_floor_shape() -> !tosa.shape<6> {
    %0 = tosa.const_shape  {values = dense<[2, 7, 11, 22, 47, 46]> : tensor<6xindex>} : () -> !tosa.shape<6>
    %1 = tosa.const_shape  {values = dense<[1, 2, 2, 3, 5, 4]> : tensor<6xindex>} : () -> !tosa.shape<6>
    %2 = tosa.div_floor_shape %0, %1 : (!tosa.shape<6>, !tosa.shape<6>) -> !tosa.shape<6>
    return %2 : !tosa.shape<6>
  }
}

// -----
module {
  func.func @test_no_fold_div_floor_shape_negative_input() -> !tosa.shape<6> {
    %0 = tosa.const_shape  {values = dense<[2, 7, 11, 22, 47, -7]> : tensor<6xindex>} : () -> !tosa.shape<6>
    %1 = tosa.const_shape  {values = dense<[1, 2, 2, 3, 5, 2]> : tensor<6xindex>} : () -> !tosa.shape<6>
    %2 = tosa.div_floor_shape %0, %1 : (!tosa.shape<6>, !tosa.shape<6>) -> !tosa.shape<6>
    return %2 : !tosa.shape<6>
  }
}

// -----
module {
  func.func @test_no_fold_div_floor_shape_negative_divisor() -> !tosa.shape<6> {
    %0 = tosa.const_shape  {values = dense<[2, 7, 11, 22, 47, 7]> : tensor<6xindex>} : () -> !tosa.shape<6>
    %1 = tosa.const_shape  {values = dense<[1, 2, 2, 3, 5, -2]> : tensor<6xindex>} : () -> !tosa.shape<6>
    %2 = tosa.div_floor_shape %0, %1 : (!tosa.shape<6>, !tosa.shape<6>) -> !tosa.shape<6>
    return %2 : !tosa.shape<6>
  }
}

// -----
module {
  func.func @test_no_fold_div_floor_shape_positive_overflow() -> !tosa.shape<6> {
    %0 = tosa.const_shape  {values = dense<[2, 7, 11, 22, 47, 9223372036854775807]> : tensor<6xindex>} : () -> !tosa.shape<6>
    %1 = tosa.const_shape  {values = dense<[1, 2, 2, 3, 5, 0]> : tensor<6xindex>} : () -> !tosa.shape<6>
    %2 = tosa.div_floor_shape %0, %1 : (!tosa.shape<6>, !tosa.shape<6>) -> !tosa.shape<6>
    return %2 : !tosa.shape<6>
  }
}

// -----
module {
  func.func @test_no_fold_div_floor_shape_negative_overflow() -> !tosa.shape<6> {
    %0 = tosa.const_shape  {values = dense<[2, 7, 11, 22, 47, -9223372036854775808]> : tensor<6xindex>} : () -> !tosa.shape<6>
    %1 = tosa.const_shape  {values = dense<[1, 2, 2, 3, 5, 0]> : tensor<6xindex>} : () -> !tosa.shape<6>
    %2 = tosa.div_floor_shape %0, %1 : (!tosa.shape<6>, !tosa.shape<6>) -> !tosa.shape<6>
    return %2 : !tosa.shape<6>
  }
}

// -----
module {
  func.func @test_fold_mod_shape() -> !tosa.shape<6> {
    %0 = tosa.const_shape  {values = dense<[24, 7, 65, 33, 39, 39]> : tensor<6xindex>} : () -> !tosa.shape<6>
    %1 = tosa.const_shape  {values = dense<[11, 2, 12, 13, 15, 14]> : tensor<6xindex>} : () -> !tosa.shape<6>
    %2 = tosa.mod_shape %0, %1 : (!tosa.shape<6>, !tosa.shape<6>) -> !tosa.shape<6>
    return %2 : !tosa.shape<6>
  }
}

// -----
module {
  func.func @test_no_fold_mod_shape_negative_input() -> !tosa.shape<6> {
    %0 = tosa.const_shape  {values = dense<[24, 7, 65, 33, 39, -7]> : tensor<6xindex>} : () -> !tosa.shape<6>
    %1 = tosa.const_shape  {values = dense<[11, 2, 12, 13, 15, 2]> : tensor<6xindex>} : () -> !tosa.shape<6>
    %2 = tosa.mod_shape %0, %1 : (!tosa.shape<6>, !tosa.shape<6>) -> !tosa.shape<6>
    return %2 : !tosa.shape<6>
  }
}

// -----
module {
  func.func @test_no_fold_mod_shape_negative_divisor() -> !tosa.shape<6> {
    %0 = tosa.const_shape  {values = dense<[24, 7, 65, 33, 39, 7]> : tensor<6xindex>} : () -> !tosa.shape<6>
    %1 = tosa.const_shape  {values = dense<[11, 2, 12, 13, 15, -2]> : tensor<6xindex>} : () -> !tosa.shape<6>
    %2 = tosa.mod_shape %0, %1 : (!tosa.shape<6>, !tosa.shape<6>) -> !tosa.shape<6>
    return %2 : !tosa.shape<6>
  }
}

// -----
module {
  func.func @test_no_fold_mod_shape_positive_overflow() -> !tosa.shape<6> {
    %0 = tosa.const_shape  {values = dense<[24, 7, 65, 33, 39, 9223372036854775807]> : tensor<6xindex>} : () -> !tosa.shape<6>
    %1 = tosa.const_shape  {values = dense<[11, 2, 12, 13, 15, 0]> : tensor<6xindex>} : () -> !tosa.shape<6>
    %2 = tosa.mod_shape %0, %1 : (!tosa.shape<6>, !tosa.shape<6>) -> !tosa.shape<6>
    return %2 : !tosa.shape<6>
  }
}

// -----
module {
  func.func @test_no_fold_mod_shape_negative_overflow() -> !tosa.shape<6> {
    %0 = tosa.const_shape  {values = dense<[24, 7, 65, 33, 39, -9223372036854775808]> : tensor<6xindex>} : () -> !tosa.shape<6>
    %1 = tosa.const_shape  {values = dense<[11, 2, 12, 13, 15, 0]> : tensor<6xindex>} : () -> !tosa.shape<6>
    %2 = tosa.mod_shape %0, %1 : (!tosa.shape<6>, !tosa.shape<6>) -> !tosa.shape<6>
    return %2 : !tosa.shape<6>
  }
}

// -----
module {
  func.func @test_max_shape() -> !tosa.shape<6> {
    %0 = tosa.const_shape  {values = dense<[24, 7, 65, 33, 39, 1]> : tensor<6xindex>} : () -> !tosa.shape<6>
    %1 = tosa.const_shape  {values = dense<[11, 2, 12, 13, 15, 5]> : tensor<6xindex>} : () -> !tosa.shape<6>
    %2 = tosa.max_shape %0, %1 : (!tosa.shape<6>, !tosa.shape<6>) -> !tosa.shape<6>
    return %2 : !tosa.shape<6>
  }
}

// -----
module {
  func.func @test_min_shape() -> !tosa.shape<6> {
    %0 = tosa.const_shape  {values = dense<[24, 7, 65, 33, 39, 1]> : tensor<6xindex>} : () -> !tosa.shape<6>
    %1 = tosa.const_shape  {values = dense<[11, 2, 12, 13, 15, 5]> : tensor<6xindex>} : () -> !tosa.shape<6>
    %2 = tosa.min_shape %0, %1 : (!tosa.shape<6>, !tosa.shape<6>) -> !tosa.shape<6>
    return %2 : !tosa.shape<6>
  }
}

// -----
module {
  func.func @test_exp2_shape() -> !tosa.shape<6> {
    %0 = tosa.const_shape  {values = dense<[2, 3, 1, 4, 6, 5]> : tensor<6xindex>} : () -> !tosa.shape<6>
    %1 = tosa.exp2_shape %0 : (!tosa.shape<6>) -> !tosa.shape<6>
    return %1 : !tosa.shape<6>
  }
}

// -----
module {
  func.func @test_neg_exp2_shape() -> !tosa.shape<6> {
    %0 = tosa.const_shape  {values = dense<[-10, 3, 1, 4, 6, 5]> : tensor<6xindex>} : () -> !tosa.shape<6>
    %1 = tosa.exp2_shape %0 : (!tosa.shape<6>) -> !tosa.shape<6>
    return %1 : !tosa.shape<6>
  }
}

// -----
module {
  func.func @test_high_exp2_shape() -> !tosa.shape<6> {
    %0 = tosa.const_shape  {values = dense<[32, 64, 1, 4, 6, 5]> : tensor<6xindex>} : () -> !tosa.shape<6>
    %1 = tosa.exp2_shape %0 : (!tosa.shape<6>) -> !tosa.shape<6>
    return %1 : !tosa.shape<6>
  }
}

// -----
module {
  func.func @test_log2_ceil_shape() -> !tosa.shape<6> {
    %0 = tosa.const_shape  {values = dense<[4, 9, 14, 1, 7, 30]> : tensor<6xindex>} : () -> !tosa.shape<6>
    %1 = tosa.log2_ceil_shape %0 : (!tosa.shape<6>) -> !tosa.shape<6>
    return %1 : !tosa.shape<6>
  }
}

// -----
module {
  func.func @test_log2_ceil_shape_zero() -> !tosa.shape<6> {
    %0 = tosa.const_shape  {values = dense<[4, 9, 0, 1, 7, 30]> : tensor<6xindex>} : () -> !tosa.shape<6>
    %1 = tosa.log2_ceil_shape %0 : (!tosa.shape<6>) -> !tosa.shape<6>
    return %1 : !tosa.shape<6>
  }
}

// -----
module {
  func.func @test_log2_ceil_shape_neg() -> !tosa.shape<6> {
    %0 = tosa.const_shape  {values = dense<[4, 9, -123, 1, 7, 30]> : tensor<6xindex>} : () -> !tosa.shape<6>
    %1 = tosa.log2_ceil_shape %0 : (!tosa.shape<6>) -> !tosa.shape<6>
    return %1 : !tosa.shape<6>
  }
}

// -----
module {
  func.func @test_log2_floor_shape() -> !tosa.shape<6> {
    %0 = tosa.const_shape  {values = dense<[4, 9, 14, 1, 7, 30]> : tensor<6xindex>} : () -> !tosa.shape<6>
    %1 = tosa.log2_floor_shape %0 : (!tosa.shape<6>) -> !tosa.shape<6>
    return %1 : !tosa.shape<6>
  }
}

// -----
module {
  func.func @test_log2_floor_shape_zero() -> !tosa.shape<6> {
    %0 = tosa.const_shape  {values = dense<[4, 9, 0, 1, 7, 30]> : tensor<6xindex>} : () -> !tosa.shape<6>
    %1 = tosa.log2_floor_shape %0 : (!tosa.shape<6>) -> !tosa.shape<6>
    return %1 : !tosa.shape<6>
  }
}

// -----
module {
  func.func @test_log2_floor_shape_neg() -> !tosa.shape<6> {
    %0 = tosa.const_shape  {values = dense<[4, 9, -123, 1, 7, 30]> : tensor<6xindex>} : () -> !tosa.shape<6>
    %1 = tosa.log2_floor_shape %0 : (!tosa.shape<6>) -> !tosa.shape<6>
    return %1 : !tosa.shape<6>
  }
}

// -----
module {
  func.func @test_concat_shape() -> !tosa.shape<4> {
    %0 = tosa.const_shape  {values = dense<[4, 9]> : tensor<2xindex>} : () -> !tosa.shape<2>
    %1 = tosa.const_shape  {values = dense<[5, 19]> : tensor<2xindex>} : () -> !tosa.shape<2>
    %2 = tosa.concat_shape %0, %1 : (!tosa.shape<2>, !tosa.shape<2>) -> !tosa.shape<4>
    return %2 : !tosa.shape<4>
  }
}

// -----
module {
  func.func @test_concat_shape_rank6() -> !tosa.shape<12> {
    %0 = tosa.const_shape  {values = dense<[1, 2, 3, 4, 5, 6]> : tensor<6xindex>} : () -> !tosa.shape<6>
    %1 = tosa.const_shape  {values = dense<[7, 8, 9, 10, 11, 12]> : tensor<6xindex>} : () -> !tosa.shape<6>
    %2 = tosa.concat_shape %0, %1 : (!tosa.shape<6>, !tosa.shape<6>) -> !tosa.shape<12>
    return %2 : !tosa.shape<12>
  }
}

// -----
module {
  func.func @test_concat_shape_total_rank12_5inputs() -> !tosa.shape<12> {
    %0 = tosa.const_shape  {values = dense<[1, 2, 3]> : tensor<3xindex>} : () -> !tosa.shape<3>
    %1 = tosa.const_shape  {values = dense<[4, 5]> : tensor<2xindex>} : () -> !tosa.shape<2>
    %2 = tosa.const_shape  {values = dense<[6, 7, 8, 9]> : tensor<4xindex>} : () -> !tosa.shape<4>
    %3 = tosa.const_shape  {values = dense<10> : tensor<1xindex>} : () -> !tosa.shape<1>
    %4 = tosa.const_shape  {values = dense<[11, 12]> : tensor<2xindex>} : () -> !tosa.shape<2>
    %5 = tosa.concat_shape %0, %1 : (!tosa.shape<3>, !tosa.shape<2>) -> !tosa.shape<5>
    %6 = tosa.concat_shape %5, %2 : (!tosa.shape<5>, !tosa.shape<4>) -> !tosa.shape<9>
    %7 = tosa.concat_shape %6, %3 : (!tosa.shape<9>, !tosa.shape<1>) -> !tosa.shape<10>
    %8 = tosa.concat_shape %7, %4 : (!tosa.shape<10>, !tosa.shape<2>) -> !tosa.shape<12>
    return %8 : !tosa.shape<12>
  }
}

// -----
module {
  func.func @test_concat_shape_rank6_4inputs() -> !tosa.shape<24> {
    %0 = tosa.const_shape  {values = dense<[1, 2, 3, 4, 5, 6]> : tensor<6xindex>} : () -> !tosa.shape<6>
    %1 = tosa.const_shape  {values = dense<[7, 8, 9, 10, 11, 12]> : tensor<6xindex>} : () -> !tosa.shape<6>
    %2 = tosa.const_shape  {values = dense<[13, 14, 15, 16, 17, 18]> : tensor<6xindex>} : () -> !tosa.shape<6>
    %3 = tosa.const_shape  {values = dense<[19, 20, 21, 22, 23, 24]> : tensor<6xindex>} : () -> !tosa.shape<6>
    %4 = tosa.concat_shape %0, %1 : (!tosa.shape<6>, !tosa.shape<6>) -> !tosa.shape<12>
    %5 = tosa.concat_shape %2, %3 : (!tosa.shape<6>, !tosa.shape<6>) -> !tosa.shape<12>
    %6 = tosa.concat_shape %4, %5 : (!tosa.shape<12>, !tosa.shape<12>) -> !tosa.shape<24>
    return %6 : !tosa.shape<24>
  }
}

// -----
module {
  func.func @test_concat_shape_total_rank13_5inputs() -> !tosa.shape<13> {
    %0 = tosa.const_shape  {values = dense<[1, 2, 3]> : tensor<3xindex>} : () -> !tosa.shape<3>
    %1 = tosa.const_shape  {values = dense<[4, 5]> : tensor<2xindex>} : () -> !tosa.shape<2>
    %2 = tosa.const_shape  {values = dense<[6, 7, 8, 9]> : tensor<4xindex>} : () -> !tosa.shape<4>
    %3 = tosa.const_shape  {values = dense<10> : tensor<1xindex>} : () -> !tosa.shape<1>
    %4 = tosa.const_shape  {values = dense<[11, 12, 13]> : tensor<3xindex>} : () -> !tosa.shape<3>
    %5 = tosa.concat_shape %0, %1 : (!tosa.shape<3>, !tosa.shape<2>) -> !tosa.shape<5>
    %6 = tosa.concat_shape %5, %2 : (!tosa.shape<5>, !tosa.shape<4>) -> !tosa.shape<9>
    %7 = tosa.concat_shape %6, %3 : (!tosa.shape<9>, !tosa.shape<1>) -> !tosa.shape<10>
    %8 = tosa.concat_shape %7, %4 : (!tosa.shape<10>, !tosa.shape<3>) -> !tosa.shape<13>
    return %8 : !tosa.shape<13>
  }
}

// -----
module {
  func.func @test_concat_shape_total_rank9_shapes() -> !tosa.shape<9> {
    %0 = tosa.const_shape  {values = dense<[1, 2, 3]> : tensor<3xindex>} : () -> !tosa.shape<3>
    %1 = tosa.const_shape  {values = dense<[4, 5]> : tensor<2xindex>} : () -> !tosa.shape<2>
    %2 = tosa.const_shape  {values = dense<[6, 7, 8, 9]> : tensor<4xindex>} : () -> !tosa.shape<4>
    %3 = tosa.concat_shape %0, %1, %2 : (!tosa.shape<3>, !tosa.shape<2>, !tosa.shape<4>) -> !tosa.shape<9>
    return %3 : !tosa.shape<9>
  }
}

// -----
module {
  func.func @test_slice_shape() -> !tosa.shape<4> {
    %0 = tosa.const_shape  {values = dense<[1, 2, 3, 4, 5, 6]> : tensor<6xindex>} : () -> !tosa.shape<6>
    %1 = "tosa.const"() <{values = dense<2> : tensor<1xi32>}> : () -> tensor<1xi32>
    %2 = "tosa.const"() <{values = dense<4> : tensor<1xi32>}> : () -> tensor<1xi32>
    %3 = tosa.slice_shape %0, %1, %2 : (!tosa.shape<6>, tensor<1xi32>, tensor<1xi32>) -> !tosa.shape<4>
    return %3 : !tosa.shape<4>
  }
}

