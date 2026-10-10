module {
  func.func @test_argmax_rank_invalid(%arg0: tensor<1x1x1x1x29x29x4xf32>) -> tensor<1x1x1x1x29x4xi32> {
    %0 = tosa.argmax %arg0 {axis = 4 : i32} : (tensor<1x1x1x1x29x29x4xf32>) -> tensor<1x1x1x1x29x4xi32>
    return %0 : tensor<1x1x1x1x29x4xi32>
  }
}

// -----
module {
  func.func @test_clamp_rank_invalid(%arg0: tensor<1x1x1x1x13x21x3xf32>) -> tensor<1x1x1x1x13x21x3xf32> {
    %0 = tosa.clamp %arg0 {max_val = 3.40282347E+38 : f32, min_val = -3.40282347E+38 : f32} : (tensor<1x1x1x1x13x21x3xf32>) -> tensor<1x1x1x1x13x21x3xf32>
    return %0 : tensor<1x1x1x1x13x21x3xf32>
  }
}

// -----
module {
  func.func @test_erf_rank_invalid(%arg0: tensor<1x1x1x1x13x21x3xf32>) -> tensor<1x1x1x1x13x21x3xf32> {
    %0 = tosa.erf %arg0 : (tensor<1x1x1x1x13x21x3xf32>) -> tensor<1x1x1x1x13x21x3xf32>
    return %0 : tensor<1x1x1x1x13x21x3xf32>
  }
}

// -----
module {
  func.func @test_sigmoid_rank_invalid(%arg0: tensor<1x1x1x1x13x21x3xf32>) -> tensor<1x1x1x1x13x21x3xf32> {
    %0 = tosa.sigmoid %arg0 : (tensor<1x1x1x1x13x21x3xf32>) -> tensor<1x1x1x1x13x21x3xf32>
    return %0 : tensor<1x1x1x1x13x21x3xf32>
  }
}

// -----
module {
  func.func @test_tanh_rank_invalid(%arg0: tensor<1x1x1x1x13x21x3xf32>) -> tensor<1x1x1x1x13x21x3xf32> {
    %0 = tosa.tanh %arg0 : (tensor<1x1x1x1x13x21x3xf32>) -> tensor<1x1x1x1x13x21x3xf32>
    return %0 : tensor<1x1x1x1x13x21x3xf32>
  }
}

// -----
module {
  func.func @test_add_rank_invalid(%arg0: tensor<1x1x1x1x13x21x3xf32>, %arg1: tensor<1x1x1x1x13x21x3xf32>) -> tensor<1x1x1x1x13x21x3xf32> {
    %0 = tosa.add %arg0, %arg1 : (tensor<1x1x1x1x13x21x3xf32>, tensor<1x1x1x1x13x21x3xf32>) -> tensor<1x1x1x1x13x21x3xf32>
    return %0 : tensor<1x1x1x1x13x21x3xf32>
  }
}

// -----
module {
  func.func @test_arithmetic_right_shift_rank_invalid(%arg0: tensor<1x1x1x1x13x21x3xi32>, %arg1: tensor<1x1x1x1x13x21x3xi32>) -> tensor<1x1x1x1x13x21x3xi32> {
    %0 = tosa.arithmetic_right_shift %arg0, %arg1 {round = false} : (tensor<1x1x1x1x13x21x3xi32>, tensor<1x1x1x1x13x21x3xi32>) -> tensor<1x1x1x1x13x21x3xi32>
    return %0 : tensor<1x1x1x1x13x21x3xi32>
  }
}

// -----
module {
  func.func @test_bitwise_and_rank_invalid(%arg0: tensor<1x1x1x1x13x21x3xi32>, %arg1: tensor<1x1x1x1x13x21x3xi32>) -> tensor<1x1x1x1x13x21x3xi32> {
    %0 = tosa.bitwise_and %arg0, %arg1 : (tensor<1x1x1x1x13x21x3xi32>, tensor<1x1x1x1x13x21x3xi32>) -> tensor<1x1x1x1x13x21x3xi32>
    return %0 : tensor<1x1x1x1x13x21x3xi32>
  }
}

// -----
module {
  func.func @test_bitwise_or_rank_invalid(%arg0: tensor<1x1x1x1x13x21x3xi32>, %arg1: tensor<1x1x1x1x13x21x3xi32>) -> tensor<1x1x1x1x13x21x3xi32> {
    %0 = tosa.bitwise_or %arg0, %arg1 : (tensor<1x1x1x1x13x21x3xi32>, tensor<1x1x1x1x13x21x3xi32>) -> tensor<1x1x1x1x13x21x3xi32>
    return %0 : tensor<1x1x1x1x13x21x3xi32>
  }
}

// -----
module {
  func.func @test_bitwise_xor_rank_invalid(%arg0: tensor<1x1x1x1x13x21x3xi32>, %arg1: tensor<1x1x1x1x13x21x3xi32>) -> tensor<1x1x1x1x13x21x3xi32> {
    %0 = tosa.bitwise_xor %arg0, %arg1 : (tensor<1x1x1x1x13x21x3xi32>, tensor<1x1x1x1x13x21x3xi32>) -> tensor<1x1x1x1x13x21x3xi32>
    return %0 : tensor<1x1x1x1x13x21x3xi32>
  }
}

// -----
module {
  func.func @test_intdiv_rank_invalid(%arg0: tensor<1x1x1x1x13x21x3xi32>, %arg1: tensor<1x1x1x1x13x21x3xi32>) -> tensor<1x1x1x1x13x21x3xi32> {
    %0 = tosa.intdiv %arg0, %arg1 : (tensor<1x1x1x1x13x21x3xi32>, tensor<1x1x1x1x13x21x3xi32>) -> tensor<1x1x1x1x13x21x3xi32>
    return %0 : tensor<1x1x1x1x13x21x3xi32>
  }
}

// -----
module {
  func.func @test_logical_and_rank_invalid(%arg0: tensor<1x1x1x1x13x21x3xi1>, %arg1: tensor<1x1x1x1x13x21x3xi1>) -> tensor<1x1x1x1x13x21x3xi1> {
    %0 = tosa.logical_and %arg0, %arg1 : (tensor<1x1x1x1x13x21x3xi1>, tensor<1x1x1x1x13x21x3xi1>) -> tensor<1x1x1x1x13x21x3xi1>
    return %0 : tensor<1x1x1x1x13x21x3xi1>
  }
}

// -----
module {
  func.func @test_logical_left_shift_rank_invalid(%arg0: tensor<1x1x1x1x13x21x3xi32>, %arg1: tensor<1x1x1x1x13x21x3xi32>) -> tensor<1x1x1x1x13x21x3xi32> {
    %0 = tosa.logical_left_shift %arg0, %arg1 : (tensor<1x1x1x1x13x21x3xi32>, tensor<1x1x1x1x13x21x3xi32>) -> tensor<1x1x1x1x13x21x3xi32>
    return %0 : tensor<1x1x1x1x13x21x3xi32>
  }
}

// -----
module {
  func.func @test_logical_right_shift_rank_invalid(%arg0: tensor<1x1x1x1x13x21x3xi32>, %arg1: tensor<1x1x1x1x13x21x3xi32>) -> tensor<1x1x1x1x13x21x3xi32> {
    %0 = tosa.logical_right_shift %arg0, %arg1 : (tensor<1x1x1x1x13x21x3xi32>, tensor<1x1x1x1x13x21x3xi32>) -> tensor<1x1x1x1x13x21x3xi32>
    return %0 : tensor<1x1x1x1x13x21x3xi32>
  }
}

// -----
module {
  func.func @test_logical_or_rank_invalid(%arg0: tensor<1x1x1x1x13x1x3xi1>, %arg1: tensor<1x1x1x1x13x21x3xi1>) -> tensor<1x1x1x1x13x21x3xi1> {
    %0 = tosa.logical_or %arg0, %arg1 : (tensor<1x1x1x1x13x1x3xi1>, tensor<1x1x1x1x13x21x3xi1>) -> tensor<1x1x1x1x13x21x3xi1>
    return %0 : tensor<1x1x1x1x13x21x3xi1>
  }
}

// -----
module {
  func.func @test_logical_xor_rank_invalid(%arg0: tensor<1x1x1x1x13x1x3xi1>, %arg1: tensor<1x1x1x1x13x21x3xi1>) -> tensor<1x1x1x1x13x21x3xi1> {
    %0 = tosa.logical_xor %arg0, %arg1 : (tensor<1x1x1x1x13x1x3xi1>, tensor<1x1x1x1x13x21x3xi1>) -> tensor<1x1x1x1x13x21x3xi1>
    return %0 : tensor<1x1x1x1x13x21x3xi1>
  }
}

// -----
module {
  func.func @test_max_rank_invalid(%arg0: tensor<1x1x1x1x13x21x3xf32>, %arg1: tensor<1x1x1x1x13x21x1xf32>) -> tensor<1x1x1x1x13x21x3xf32> {
    %0 = tosa.maximum %arg0, %arg1 : (tensor<1x1x1x1x13x21x3xf32>, tensor<1x1x1x1x13x21x1xf32>) -> tensor<1x1x1x1x13x21x3xf32>
    return %0 : tensor<1x1x1x1x13x21x3xf32>
  }
}

// -----
module {
  func.func @test_min_rank_invalid(%arg0: tensor<1x1x1x1x13x21x3xf32>, %arg1: tensor<1x1x1x1x1x21x3xf32>) -> tensor<1x1x1x1x13x21x3xf32> {
    %0 = tosa.minimum %arg0, %arg1 : (tensor<1x1x1x1x13x21x3xf32>, tensor<1x1x1x1x1x21x3xf32>) -> tensor<1x1x1x1x13x21x3xf32>
    return %0 : tensor<1x1x1x1x13x21x3xf32>
  }
}

// -----
module {
  func.func @test_mul_rank_invalid(%arg0: tensor<1x1x1x1x13x21x3xf32>, %arg1: tensor<1x1x1x1x13x1x3xf32>) -> tensor<1x1x1x1x13x21x3xf32> {
    %0 = "tosa.const"() <{values = dense<0> : tensor<1xi8>}> : () -> tensor<1xi8>
    %1 = tosa.mul %arg0, %arg1, %0 : (tensor<1x1x1x1x13x21x3xf32>, tensor<1x1x1x1x13x1x3xf32>, tensor<1xi8>) -> tensor<1x1x1x1x13x21x3xf32>
    return %1 : tensor<1x1x1x1x13x21x3xf32>
  }
}

// -----
module {
  func.func @test_pow_rank_invalid(%arg0: tensor<1x1x1x1x13x21x3xf32>, %arg1: tensor<1x1x1x1x13x21x1xf32>) -> tensor<1x1x1x1x13x21x3xf32> {
    %0 = tosa.pow %arg0, %arg1 : (tensor<1x1x1x1x13x21x3xf32>, tensor<1x1x1x1x13x21x1xf32>) -> tensor<1x1x1x1x13x21x3xf32>
    return %0 : tensor<1x1x1x1x13x21x3xf32>
  }
}

// -----
module {
  func.func @test_sub_rank_invalid(%arg0: tensor<1x1x1x1x1x21x3xf32>, %arg1: tensor<1x1x1x1x13x21x3xf32>) -> tensor<1x1x1x1x13x21x3xf32> {
    %0 = tosa.sub %arg0, %arg1 : (tensor<1x1x1x1x1x21x3xf32>, tensor<1x1x1x1x13x21x3xf32>) -> tensor<1x1x1x1x13x21x3xf32>
    return %0 : tensor<1x1x1x1x13x21x3xf32>
  }
}

// -----
module {
  func.func @test_table_rank_invalid(%arg0: tensor<1x1x1x1x1x1x64xi16>, %arg1: tensor<513xi16>) -> tensor<1x1x1x1x1x1x64xi32> {
    %0 = tosa.table %arg0, %arg1 : (tensor<1x1x1x1x1x1x64xi16>, tensor<513xi16>) -> tensor<1x1x1x1x1x1x64xi32>
    return %0 : tensor<1x1x1x1x1x1x64xi32>
  }
}

// -----
module {
  func.func @test_table_unranked_tensor(%arg0: tensor<*xi8>) -> tensor<*xi8> {
    %0 = "tosa.const"() <{values = dense<"0x47CE492BAE8FF8AC700D8903ECF3BC45BC865CA9C35C14DBD3A9E4D1B4AEB8B6A1F20F03486D513ABFC212A4E07118ADFEA5D6B736D4510F7685692B88FFA19B0F7414B0B56635237B48E95B048E96A36001B3388971683E82E6BC40C69D6B6218F6576AF384396BC16F1D437174EA1FB5466AD719344BB8E21BE628893039F831BA1A39C30C413D3C6AA60F91F4D70F1F20473DBAC203C66FC02CBB2E9F11FB2352DD5D6A7F85CFA2F7B697489D9738E1B3C91CB4D2A59B0757C39A2C52619290B43F47340806FD6E0F7400C9373DA037E2FE35967B5D025F29D98AD5EE58BF41EB0C4E49EF73ED167BCE66D58596181DF78F8194D258B51807CAB4A4020239"> : tensor<256xi8>}> : () -> tensor<256xi8>
    %1 = tosa.table %arg0, %0 : (tensor<*xi8>, tensor<256xi8>) -> tensor<*xi8>
    return %1 : tensor<*xi8>
  }
}

// -----
module {
  func.func @test_abs_rank_invalid(%arg0: tensor<1x1x1x1x13x21x3xf32>) -> tensor<1x1x1x1x13x21x3xf32> {
    %0 = tosa.abs %arg0 : (tensor<1x1x1x1x13x21x3xf32>) -> tensor<1x1x1x1x13x21x3xf32>
    return %0 : tensor<1x1x1x1x13x21x3xf32>
  }
}

// -----
module {
  func.func @test_bitwise_not_rank_invalid(%arg0: tensor<1x1x1x1x13x21x1xi32>) -> tensor<1x1x1x1x13x21x1xi32> {
    %0 = tosa.bitwise_not %arg0 : (tensor<1x1x1x1x13x21x1xi32>) -> tensor<1x1x1x1x13x21x1xi32>
    return %0 : tensor<1x1x1x1x13x21x1xi32>
  }
}

// -----
module {
  func.func @test_ceil_rank_invalid(%arg0: tensor<1x1x1x1x13x21x3xf32>) -> tensor<1x1x1x1x13x21x3xf32> {
    %0 = tosa.ceil %arg0 : (tensor<1x1x1x1x13x21x3xf32>) -> tensor<1x1x1x1x13x21x3xf32>
    return %0 : tensor<1x1x1x1x13x21x3xf32>
  }
}

// -----
module {
  func.func @test_clz_rank_invalid(%arg0: tensor<1x1x1x1x13x21x3xi32>) -> tensor<1x1x1x1x13x21x3xi32> {
    %0 = tosa.clz %arg0 : (tensor<1x1x1x1x13x21x3xi32>) -> tensor<1x1x1x1x13x21x3xi32>
    return %0 : tensor<1x1x1x1x13x21x3xi32>
  }
}

// -----
module {
  func.func @test_cos_rank_invalid(%arg0: tensor<1x1x1x1x13x21x3xf32>) -> tensor<1x1x1x1x13x21x3xf32> {
    %0 = tosa.cos %arg0 : (tensor<1x1x1x1x13x21x3xf32>) -> tensor<1x1x1x1x13x21x3xf32>
    return %0 : tensor<1x1x1x1x13x21x3xf32>
  }
}

// -----
module {
  func.func @test_exp_rank_invalid(%arg0: tensor<1x1x1x1x13x21x3xf32>) -> tensor<1x1x1x1x13x21x3xf32> {
    %0 = tosa.exp %arg0 : (tensor<1x1x1x1x13x21x3xf32>) -> tensor<1x1x1x1x13x21x3xf32>
    return %0 : tensor<1x1x1x1x13x21x3xf32>
  }
}

// -----
module {
  func.func @test_floor_rank_invalid(%arg0: tensor<1x1x1x1x13x21x3xf32>) -> tensor<1x1x1x1x13x21x3xf32> {
    %0 = tosa.floor %arg0 : (tensor<1x1x1x1x13x21x3xf32>) -> tensor<1x1x1x1x13x21x3xf32>
    return %0 : tensor<1x1x1x1x13x21x3xf32>
  }
}

// -----
module {
  func.func @test_log_rank_invalid(%arg0: tensor<1x1x1x1x13x21x3xf32>) -> tensor<1x1x1x1x13x21x3xf32> {
    %0 = tosa.log %arg0 : (tensor<1x1x1x1x13x21x3xf32>) -> tensor<1x1x1x1x13x21x3xf32>
    return %0 : tensor<1x1x1x1x13x21x3xf32>
  }
}

// -----
module {
  func.func @test_logical_not_rank_invalid(%arg0: tensor<1x1x1x1x1x21x3xi1>) -> tensor<1x1x1x1x1x21x3xi1> {
    %0 = tosa.logical_not %arg0 : (tensor<1x1x1x1x1x21x3xi1>) -> tensor<1x1x1x1x1x21x3xi1>
    return %0 : tensor<1x1x1x1x1x21x3xi1>
  }
}

// -----
module {
  func.func @test_negate_rank_invalid(%arg0: tensor<1x1x1x1x13x21x3xf32>, %arg1: tensor<1xf32>) -> tensor<1x1x1x1x13x21x3xf32> {
    %0 = tosa.negate %arg0, %arg1, %arg1 : (tensor<1x1x1x1x13x21x3xf32>, tensor<1xf32>, tensor<1xf32>) -> tensor<1x1x1x1x13x21x3xf32>
    return %0 : tensor<1x1x1x1x13x21x3xf32>
  }
}

// -----
module {
  func.func @test_reciprocal_rank_invalid(%arg0: tensor<1x1x1x1x13x21x3xf32>) -> tensor<1x1x1x1x13x21x3xf32> {
    %0 = tosa.reciprocal %arg0 : (tensor<1x1x1x1x13x21x3xf32>) -> tensor<1x1x1x1x13x21x3xf32>
    return %0 : tensor<1x1x1x1x13x21x3xf32>
  }
}

// -----
module {
  func.func @test_rsqrt_rank_invalid(%arg0: tensor<1x1x1x1x13x21x3xf32>) -> tensor<1x1x1x1x13x21x3xf32> {
    %0 = tosa.rsqrt %arg0 : (tensor<1x1x1x1x13x21x3xf32>) -> tensor<1x1x1x1x13x21x3xf32>
    return %0 : tensor<1x1x1x1x13x21x3xf32>
  }
}

// -----
module {
  func.func @test_sin_rank_invalid(%arg0: tensor<1x1x1x1x13x21x3xf32>) -> tensor<1x1x1x1x13x21x3xf32> {
    %0 = tosa.sin %arg0 : (tensor<1x1x1x1x13x21x3xf32>) -> tensor<1x1x1x1x13x21x3xf32>
    return %0 : tensor<1x1x1x1x13x21x3xf32>
  }
}

// -----
module {
  func.func @test_select_rank_invalid(%arg0: tensor<1x1x1x1x1x1x1xi1>, %arg1: tensor<1x1x1x1x13x21x3xf32>, %arg2: tensor<1x1x1x1x13x21x3xf32>) -> tensor<1x1x1x1x13x21x3xf32> {
    %0 = tosa.select %arg0, %arg1, %arg2 : (tensor<1x1x1x1x1x1x1xi1>, tensor<1x1x1x1x13x21x3xf32>, tensor<1x1x1x1x13x21x3xf32>) -> tensor<1x1x1x1x13x21x3xf32>
    return %0 : tensor<1x1x1x1x13x21x3xf32>
  }
}

// -----
module {
  func.func @test_equal_rank_invalid(%arg0: tensor<1x1x1x1x13x21x3xf32>, %arg1: tensor<1x1x1x1x13x1x3xf32>) -> tensor<1x1x1x1x13x21x3xi1> {
    %0 = tosa.equal %arg0, %arg1 : (tensor<1x1x1x1x13x21x3xf32>, tensor<1x1x1x1x13x1x3xf32>) -> tensor<1x1x1x1x13x21x3xi1>
    return %0 : tensor<1x1x1x1x13x21x3xi1>
  }
}

// -----
module {
  func.func @test_greater_rank_invalid(%arg0: tensor<1x1x1x1x13x21x1xf32>, %arg1: tensor<1x1x1x1x13x21x3xf32>) -> tensor<1x1x1x1x13x21x3xi1> {
    %0 = tosa.greater %arg0, %arg1 : (tensor<1x1x1x1x13x21x1xf32>, tensor<1x1x1x1x13x21x3xf32>) -> tensor<1x1x1x1x13x21x3xi1>
    return %0 : tensor<1x1x1x1x13x21x3xi1>
  }
}

// -----
module {
  func.func @test_greater_equal_rank_invalid(%arg0: tensor<1x1x1x1x13x1x3xf32>, %arg1: tensor<1x1x1x1x13x21x3xf32>) -> tensor<1x1x1x1x13x21x3xi1> {
    %0 = tosa.greater_equal %arg0, %arg1 : (tensor<1x1x1x1x13x1x3xf32>, tensor<1x1x1x1x13x21x3xf32>) -> tensor<1x1x1x1x13x21x3xi1>
    return %0 : tensor<1x1x1x1x13x21x3xi1>
  }
}

// -----
module {
  func.func @test_reduce_all_rank_invalid(%arg0: tensor<1x1x1x1x13x21x3xi1>) -> tensor<1x1x1x1x1x21x3xi1> {
    %0 = tosa.reduce_all %arg0 {axis = 4 : i32} : (tensor<1x1x1x1x13x21x3xi1>) -> tensor<1x1x1x1x1x21x3xi1>
    return %0 : tensor<1x1x1x1x1x21x3xi1>
  }
}

// -----
module {
  func.func @test_reduce_any_rank_invalid(%arg0: tensor<1x1x1x1x13x21x3xi1>) -> tensor<1x1x1x1x13x21x3xi1> {
    %0 = tosa.reduce_any %arg0 {axis = 0 : i32} : (tensor<1x1x1x1x13x21x3xi1>) -> tensor<1x1x1x1x13x21x3xi1>
    return %0 : tensor<1x1x1x1x13x21x3xi1>
  }
}

// -----
module {
  func.func @test_reduce_max_rank_invalid(%arg0: tensor<1x1x1x1x13x21x3xf32>) -> tensor<1x1x1x1x13x21x3xf32> {
    %0 = tosa.reduce_max %arg0 {axis = 0 : i32} : (tensor<1x1x1x1x13x21x3xf32>) -> tensor<1x1x1x1x13x21x3xf32>
    return %0 : tensor<1x1x1x1x13x21x3xf32>
  }
}

// -----
module {
  func.func @test_reduce_min_rank_invalid(%arg0: tensor<1x1x1x1x13x21x3xf32>) -> tensor<1x1x1x1x13x21x3xf32> {
    %0 = tosa.reduce_min %arg0 {axis = 0 : i32} : (tensor<1x1x1x1x13x21x3xf32>) -> tensor<1x1x1x1x13x21x3xf32>
    return %0 : tensor<1x1x1x1x13x21x3xf32>
  }
}

// -----
module {
  func.func @test_reduce_prod_rank_invalid(%arg0: tensor<1x1x1x1x13x21x3xf32>) -> tensor<1x1x1x1x13x21x3xf32> {
    %0 = tosa.reduce_product %arg0 {axis = 0 : i32} : (tensor<1x1x1x1x13x21x3xf32>) -> tensor<1x1x1x1x13x21x3xf32>
    return %0 : tensor<1x1x1x1x13x21x3xf32>
  }
}

// -----
module {
  func.func @test_reduce_sum_rank_invalid(%arg0: tensor<1x1x1x1x13x21x3xf32>) -> tensor<1x1x1x1x13x21x3xf32> {
    %0 = tosa.reduce_sum %arg0 {axis = 0 : i32} : (tensor<1x1x1x1x13x21x3xf32>) -> tensor<1x1x1x1x13x21x3xf32>
    return %0 : tensor<1x1x1x1x13x21x3xf32>
  }
}

// -----
module {
  func.func @test_concat_rank_invalid(%arg0: tensor<1x1x1x13x21x3x8xf32>, %arg1: tensor<1x1x1x13x21x3x8xf32>) -> tensor<1x1x1x26x21x3x8xf32> {
    %0 = tosa.concat %arg0, %arg1 {axis = 3 : i32} : (tensor<1x1x1x13x21x3x8xf32>, tensor<1x1x1x13x21x3x8xf32>) -> tensor<1x1x1x26x21x3x8xf32>
    return %0 : tensor<1x1x1x26x21x3x8xf32>
  }
}

// -----
module {
  func.func @test_pad_rank_invalid(%arg0: tensor<1x1x1x1x13x21x3xf32>) -> tensor<1x1x1x1x13x21x3xf32> {
    %0 = "tosa.const"() <{values = dense<3.140000e+00> : tensor<1xf32>}> : () -> tensor<1xf32>
    %1 = tosa.const_shape  {values = dense<0> : tensor<14xindex>} : () -> !tosa.shape<14>
    %2 = tosa.pad %arg0, %1, %0 : (tensor<1x1x1x1x13x21x3xf32>, !tosa.shape<14>, tensor<1xf32>) -> tensor<1x1x1x1x13x21x3xf32>
    return %2 : tensor<1x1x1x1x13x21x3xf32>
  }
}

// -----
module {
  func.func @test_reshape_rank_invalid(%arg0: tensor<13x21x3xf32>) -> tensor<1x1x1x1x1x1x819xf32> {
    %0 = tosa.const_shape  {values = dense<[1, 1, 1, 1, 1, 1, 819]> : tensor<7xindex>} : () -> !tosa.shape<7>
    %1 = tosa.reshape %arg0, %0 : (tensor<13x21x3xf32>, !tosa.shape<7>) -> tensor<1x1x1x1x1x1x819xf32>
    return %1 : tensor<1x1x1x1x1x1x819xf32>
  }
}

// -----
module {
  func.func @test_reverse_rank_invalid(%arg0: tensor<1x1x1x1x13x21x3xf32>) -> tensor<1x1x1x1x13x21x3xf32> {
    %0 = tosa.reverse %arg0 {axis = 0 : i32} : (tensor<1x1x1x1x13x21x3xf32>) -> tensor<1x1x1x1x13x21x3xf32>
    return %0 : tensor<1x1x1x1x13x21x3xf32>
  }
}

// -----
module {
  func.func @test_slice_rank_invalid(%arg0: tensor<1x1x1x1x13x21x3xf32>) -> tensor<1x1x1x1x4x11x1xf32> {
    %0 = tosa.const_shape  {values = dense<[0, 0, 0, 0, 6, 8, 0]> : tensor<7xindex>} : () -> !tosa.shape<7>
    %1 = tosa.const_shape  {values = dense<[1, 1, 1, 1, 4, 11, 1]> : tensor<7xindex>} : () -> !tosa.shape<7>
    %2 = tosa.slice %arg0, %0, %1 : (tensor<1x1x1x1x13x21x3xf32>, !tosa.shape<7>, !tosa.shape<7>) -> tensor<1x1x1x1x4x11x1xf32>
    return %2 : tensor<1x1x1x1x4x11x1xf32>
  }
}

// -----
module {
  func.func @test_tile_rank_invalid(%arg0: tensor<1x1x1x1x13x21x3xf32>) -> tensor<1x1x1x1x39x21x6xf32> {
    %0 = tosa.const_shape  {values = dense<[1, 1, 1, 1, 3, 1, 2]> : tensor<7xindex>} : () -> !tosa.shape<7>
    %1 = tosa.tile %arg0, %0 : (tensor<1x1x1x1x13x21x3xf32>, !tosa.shape<7>) -> tensor<1x1x1x1x39x21x6xf32>
    return %1 : tensor<1x1x1x1x39x21x6xf32>
  }
}

// -----
module {
  func.func @test_transpose_rank_invalid(%arg0: tensor<13x21x3x1x1x1x1xf32>) -> tensor<3x13x21x1x1x1x1xf32> {
    %0 = tosa.transpose %arg0 {perms = array<i32: 2, 0, 1, 3, 4, 5, 6>} : (tensor<13x21x3x1x1x1x1xf32>) -> tensor<3x13x21x1x1x1x1xf32>
    return %0 : tensor<3x13x21x1x1x1x1xf32>
  }
}

// -----
module {
  func.func @test_cast_rank_invalid(%arg0: tensor<1x1x1x1x13x21x3xi32>) -> tensor<1x1x1x1x13x21x3xi16> {
    %0 = tosa.cast %arg0 : (tensor<1x1x1x1x13x21x3xi32>) -> tensor<1x1x1x1x13x21x3xi16>
    return %0 : tensor<1x1x1x1x13x21x3xi16>
  }
}

// -----
module {
  func.func @test_rescale_rank_invalid(%arg0: tensor<1x1x1x1x13x21x3xi8>) -> tensor<1x1x1x1x13x21x3xi8> {
    %0 = "tosa.const"() <{values = dense<1073741824> : tensor<1xi32>}> : () -> tensor<1xi32>
    %1 = "tosa.const"() <{values = dense<30> : tensor<1xi8>}> : () -> tensor<1xi8>
    %2 = "tosa.const"() <{values = dense<127> : tensor<1xi8>}> : () -> tensor<1xi8>
    %3 = "tosa.const"() <{values = dense<-1> : tensor<1xi8>}> : () -> tensor<1xi8>
    %4 = tosa.rescale %arg0, %0, %1, %2, %3 {input_unsigned = false, input_zp = 127 : i32, output_unsigned = false, output_zp = -1 : i32, per_channel = false, rounding_mode = SINGLE_ROUND, scale32 = true} : (tensor<1x1x1x1x13x21x3xi8>, tensor<1xi32>, tensor<1xi8>, tensor<1xi8>, tensor<1xi8>) -> tensor<1x1x1x1x13x21x3xi8>
    return %4 : tensor<1x1x1x1x13x21x3xi8>
  }
}

// -----
module {
  func.func @test_const(%arg0: tensor<1x1xi32>) -> tensor<1x1x1x1x1x1x1xi32> {
    %0 = "tosa.const"() <{values = dense<0> : tensor<1x1x1x1x1x1x1xi32>}> : () -> tensor<1x1x1x1x1x1x1xi32>
    return %0 : tensor<1x1x1x1x1x1x1xi32>
  }
}

// -----
module {
  func.func @test_add_rank_valid(%arg0: tensor<f32>, %arg1: tensor<f32>) -> tensor<f32> {
    %0 = tosa.add %arg0, %arg1 : (tensor<f32>, tensor<f32>) -> tensor<f32>
    return %0 : tensor<f32>
  }
}

// -----
module {
  func.func @test_const_rank_valid(%arg0: tensor<i32>) -> tensor<i32> {
    %0 = "tosa.const"() <{values = dense<0> : tensor<i32>}> : () -> tensor<i32>
    return %0 : tensor<i32>
  }
}

// -----
module {
  func.func @test_const_i2(%arg0: tensor<1xi2>) {
    %0 = "tosa.const"() <{values = dense<0> : tensor<1xi2>}> : () -> tensor<1xi2>
    return
  }
}

// -----
module {
  func.func @test_const_ui32(%arg0: tensor<1xui32>) {
    %0 = "tosa.const"() <{values = dense<0> : tensor<1xui32>}> : () -> tensor<1xui32>
    return
  }
}

// -----
module {
  func.func @test_const_f64(%arg0: tensor<1xf64>) {
    %0 = "tosa.const"() <{values = dense<0.000000e+00> : tensor<1xf64>}> : () -> tensor<1xf64>
    return
  }
}

// -----
module {
  func.func @test_const_ui8(%arg0: tensor<1xui8>) {
    %0 = "tosa.const"() <{values = dense<0> : tensor<1xui8>}> : () -> tensor<1xui8>
    return
  }
}

// -----
module {
  func.func @test_identity_rank_invalid(%arg0: tensor<1x1x1x1x13x21x3xi32>) -> tensor<1x1x1x1x13x21x3xi32> {
    %0 = tosa.identity %arg0 : (tensor<1x1x1x1x13x21x3xi32>) -> tensor<1x1x1x1x13x21x3xi32>
    return %0 : tensor<1x1x1x1x13x21x3xi32>
  }
}

// -----
module {
  func.func @test_identity_rank_valid(%arg0: tensor<i32>) -> tensor<i32> {
    %0 = tosa.identity %arg0 : (tensor<i32>) -> tensor<i32>
    return %0 : tensor<i32>
  }
}

// -----
module {
  func.func @test_avgpool2d_kernel_y(%arg0: tensor<1x8194x32x8xf32>, %arg1: tensor<1xf32>, %arg2: tensor<1xf32>) -> tensor<1x2x32x8xf32> {
    %0 = tosa.avg_pool2d %arg0, %arg1, %arg2 {acc_type = f32, kernel = array<i64: 8193, 1>, pad = array<i64: 0, 0, 0, 0>, stride = array<i64: 1, 1>} : (tensor<1x8194x32x8xf32>, tensor<1xf32>, tensor<1xf32>) -> tensor<1x2x32x8xf32>
    return %0 : tensor<1x2x32x8xf32>
  }
}

// -----
module {
  func.func @test_avgpool2d_kernel_x(%arg0: tensor<1x32x8194x8xf32>, %arg1: tensor<1xf32>, %arg2: tensor<1xf32>) -> tensor<1x32x2x8xf32> {
    %0 = tosa.avg_pool2d %arg0, %arg1, %arg2 {acc_type = f32, kernel = array<i64: 1, 8193>, pad = array<i64: 0, 0, 0, 0>, stride = array<i64: 1, 1>} : (tensor<1x32x8194x8xf32>, tensor<1xf32>, tensor<1xf32>) -> tensor<1x32x2x8xf32>
    return %0 : tensor<1x32x2x8xf32>
  }
}

// -----
module {
  func.func @test_avgpool2d_stride_y(%arg0: tensor<1x8194x32x8xf32>, %arg1: tensor<1xf32>, %arg2: tensor<1xf32>) -> tensor<1x2x32x8xf32> {
    %0 = tosa.avg_pool2d %arg0, %arg1, %arg2 {acc_type = f32, kernel = array<i64: 1, 1>, pad = array<i64: 0, 0, 0, 0>, stride = array<i64: 8193, 1>} : (tensor<1x8194x32x8xf32>, tensor<1xf32>, tensor<1xf32>) -> tensor<1x2x32x8xf32>
    return %0 : tensor<1x2x32x8xf32>
  }
}

// -----
module {
  func.func @test_avgpool2d_stride_x(%arg0: tensor<1x32x8194x8xf32>, %arg1: tensor<1xf32>, %arg2: tensor<1xf32>) -> tensor<1x32x2x8xf32> {
    %0 = tosa.avg_pool2d %arg0, %arg1, %arg2 {acc_type = f32, kernel = array<i64: 1, 1>, pad = array<i64: 0, 0, 0, 0>, stride = array<i64: 1, 8193>} : (tensor<1x32x8194x8xf32>, tensor<1xf32>, tensor<1xf32>) -> tensor<1x32x2x8xf32>
    return %0 : tensor<1x32x2x8xf32>
  }
}

// -----
module {
  func.func @test_conv2d_dilation_y(%arg0: tensor<1x8192x8192x1xf32>, %arg1: tensor<16x1025x1024x1xf32>, %arg2: tensor<16xf32>, %arg3: tensor<1xf32>) -> tensor<1x1x7170x16xf32> {
    %0 = tosa.conv2d %arg0, %arg1, %arg2, %arg3, %arg3 {acc_type = f32, dilation = array<i64: 8, 1>, pad = array<i64: 0, 1, 0, 1>, stride = array<i64: 1, 1>} : (tensor<1x8192x8192x1xf32>, tensor<16x1025x1024x1xf32>, tensor<16xf32>, tensor<1xf32>, tensor<1xf32>) -> tensor<1x1x7170x16xf32>
    return %0 : tensor<1x1x7170x16xf32>
  }
}

// -----
module {
  func.func @test_conv2d_dilation_x(%arg0: tensor<1x8192x8192x1xf32>, %arg1: tensor<16x1024x1025x1xf32>, %arg2: tensor<16xf32>, %arg3: tensor<1xf32>) -> tensor<1x7170x1x16xf32> {
    %0 = tosa.conv2d %arg0, %arg1, %arg2, %arg3, %arg3 {acc_type = f32, dilation = array<i64: 1, 8>, pad = array<i64: 0, 1, 0, 1>, stride = array<i64: 1, 1>} : (tensor<1x8192x8192x1xf32>, tensor<16x1024x1025x1xf32>, tensor<16xf32>, tensor<1xf32>, tensor<1xf32>) -> tensor<1x7170x1x16xf32>
    return %0 : tensor<1x7170x1x16xf32>
  }
}

// -----
module {
  func.func @test_conv2d_pad_top(%arg0: tensor<1x32x32x8xf32>, %arg1: tensor<16x2x2x8xf32>, %arg2: tensor<16xf32>, %arg3: tensor<1xf32>) -> tensor<1x8225x32x16xf32> {
    %0 = tosa.conv2d %arg0, %arg1, %arg2, %arg3, %arg3 {acc_type = f32, dilation = array<i64: 1, 1>, pad = array<i64: 8193, 1, 0, 1>, stride = array<i64: 1, 1>} : (tensor<1x32x32x8xf32>, tensor<16x2x2x8xf32>, tensor<16xf32>, tensor<1xf32>, tensor<1xf32>) -> tensor<1x8225x32x16xf32>
    return %0 : tensor<1x8225x32x16xf32>
  }
}

// -----
module {
  func.func @test_conv2d_pad_bottom(%arg0: tensor<1x32x32x8xf32>, %arg1: tensor<16x2x2x8xf32>, %arg2: tensor<16xf32>, %arg3: tensor<1xf32>) -> tensor<1x8224x32x16xf32> {
    %0 = tosa.conv2d %arg0, %arg1, %arg2, %arg3, %arg3 {acc_type = f32, dilation = array<i64: 1, 1>, pad = array<i64: 0, 8193, 0, 1>, stride = array<i64: 1, 1>} : (tensor<1x32x32x8xf32>, tensor<16x2x2x8xf32>, tensor<16xf32>, tensor<1xf32>, tensor<1xf32>) -> tensor<1x8224x32x16xf32>
    return %0 : tensor<1x8224x32x16xf32>
  }
}

// -----
module {
  func.func @test_conv2d_pad_left(%arg0: tensor<1x32x32x8xf32>, %arg1: tensor<16x2x2x8xf32>, %arg2: tensor<16xf32>, %arg3: tensor<1xf32>) -> tensor<1x32x8225x16xf32> {
    %0 = tosa.conv2d %arg0, %arg1, %arg2, %arg3, %arg3 {acc_type = f32, dilation = array<i64: 1, 1>, pad = array<i64: 0, 1, 8193, 1>, stride = array<i64: 1, 1>} : (tensor<1x32x32x8xf32>, tensor<16x2x2x8xf32>, tensor<16xf32>, tensor<1xf32>, tensor<1xf32>) -> tensor<1x32x8225x16xf32>
    return %0 : tensor<1x32x8225x16xf32>
  }
}

// -----
module {
  func.func @test_conv2d_pad_right(%arg0: tensor<1x32x32x8xf32>, %arg1: tensor<16x2x2x8xf32>, %arg2: tensor<16xf32>, %arg3: tensor<1xf32>) -> tensor<1x32x8224x16xf32> {
    %0 = tosa.conv2d %arg0, %arg1, %arg2, %arg3, %arg3 {acc_type = f32, dilation = array<i64: 1, 1>, pad = array<i64: 0, 1, 0, 8193>, stride = array<i64: 1, 1>} : (tensor<1x32x32x8xf32>, tensor<16x2x2x8xf32>, tensor<16xf32>, tensor<1xf32>, tensor<1xf32>) -> tensor<1x32x8224x16xf32>
    return %0 : tensor<1x32x8224x16xf32>
  }
}

// -----
module {
  func.func @test_conv2d_stride_y(%arg0: tensor<1x8194x33x8xf32>, %arg1: tensor<16x2x2x8xf32>, %arg2: tensor<16xf32>, %arg3: tensor<1xf32>) -> tensor<1x2x33x16xf32> {
    %0 = tosa.conv2d %arg0, %arg1, %arg2, %arg3, %arg3 {acc_type = f32, dilation = array<i64: 1, 1>, pad = array<i64: 0, 1, 0, 1>, stride = array<i64: 8193, 1>} : (tensor<1x8194x33x8xf32>, tensor<16x2x2x8xf32>, tensor<16xf32>, tensor<1xf32>, tensor<1xf32>) -> tensor<1x2x33x16xf32>
    return %0 : tensor<1x2x33x16xf32>
  }
}

// -----
module {
  func.func @test_conv2d_stride_x(%arg0: tensor<1x33x8194x8xf32>, %arg1: tensor<16x2x2x8xf32>, %arg2: tensor<16xf32>, %arg3: tensor<1xf32>) -> tensor<1x33x2x16xf32> {
    %0 = tosa.conv2d %arg0, %arg1, %arg2, %arg3, %arg3 {acc_type = f32, dilation = array<i64: 1, 1>, pad = array<i64: 0, 1, 0, 1>, stride = array<i64: 1, 8193>} : (tensor<1x33x8194x8xf32>, tensor<16x2x2x8xf32>, tensor<16xf32>, tensor<1xf32>, tensor<1xf32>) -> tensor<1x33x2x16xf32>
    return %0 : tensor<1x33x2x16xf32>
  }
}

// -----
module {
  func.func @test_conv3d_dilation_d(%arg0: tensor<1x8192x1x1x8xf32>, %arg1: tensor<16x1025x1x1x8xf32>, %arg2: tensor<16xf32>, %arg3: tensor<1xf32>, %arg4: tensor<1xf32>) -> tensor<1x1x2x2x16xf32> {
    %0 = tosa.conv3d %arg0, %arg1, %arg2, %arg3, %arg4 {acc_type = f32, dilation = array<i64: 8, 1, 1>, pad = array<i64: 0, 1, 0, 1, 0, 1>, stride = array<i64: 1, 1, 1>} : (tensor<1x8192x1x1x8xf32>, tensor<16x1025x1x1x8xf32>, tensor<16xf32>, tensor<1xf32>, tensor<1xf32>) -> tensor<1x1x2x2x16xf32>
    return %0 : tensor<1x1x2x2x16xf32>
  }
}

// -----
module {
  func.func @test_conv3d_dilation_y(%arg0: tensor<1x1x8192x1x8xf32>, %arg1: tensor<16x1x1025x1x8xf32>, %arg2: tensor<16xf32>, %arg3: tensor<1xf32>, %arg4: tensor<1xf32>) -> tensor<1x2x1x2x16xf32> {
    %0 = tosa.conv3d %arg0, %arg1, %arg2, %arg3, %arg4 {acc_type = f32, dilation = array<i64: 1, 8, 1>, pad = array<i64: 0, 1, 0, 1, 0, 1>, stride = array<i64: 1, 1, 1>} : (tensor<1x1x8192x1x8xf32>, tensor<16x1x1025x1x8xf32>, tensor<16xf32>, tensor<1xf32>, tensor<1xf32>) -> tensor<1x2x1x2x16xf32>
    return %0 : tensor<1x2x1x2x16xf32>
  }
}

// -----
module {
  func.func @test_conv3d_dilation_x(%arg0: tensor<1x1x1x8192x8xf32>, %arg1: tensor<16x1x1x1025x8xf32>, %arg2: tensor<16xf32>, %arg3: tensor<1xf32>, %arg4: tensor<1xf32>) -> tensor<1x2x2x1x16xf32> {
    %0 = tosa.conv3d %arg0, %arg1, %arg2, %arg3, %arg4 {acc_type = f32, dilation = array<i64: 1, 1, 8>, pad = array<i64: 0, 1, 0, 1, 0, 1>, stride = array<i64: 1, 1, 1>} : (tensor<1x1x1x8192x8xf32>, tensor<16x1x1x1025x8xf32>, tensor<16xf32>, tensor<1xf32>, tensor<1xf32>) -> tensor<1x2x2x1x16xf32>
    return %0 : tensor<1x2x2x1x16xf32>
  }
}

// -----
module {
  func.func @test_conv3d_pad_d0(%arg0: tensor<1x1x32x32x8xf32>, %arg1: tensor<16x2x2x2x8xf32>, %arg2: tensor<16xf32>, %arg3: tensor<1xf32>, %arg4: tensor<1xf32>) -> tensor<1x8194x32x32x16xf32> {
    %0 = tosa.conv3d %arg0, %arg1, %arg2, %arg3, %arg4 {acc_type = f32, dilation = array<i64: 1, 1, 1>, pad = array<i64: 8193, 1, 0, 1, 0, 1>, stride = array<i64: 1, 1, 1>} : (tensor<1x1x32x32x8xf32>, tensor<16x2x2x2x8xf32>, tensor<16xf32>, tensor<1xf32>, tensor<1xf32>) -> tensor<1x8194x32x32x16xf32>
    return %0 : tensor<1x8194x32x32x16xf32>
  }
}

// -----
module {
  func.func @test_conv3d_pad_d1(%arg0: tensor<1x1x32x32x8xf32>, %arg1: tensor<16x2x2x2x8xf32>, %arg2: tensor<16xf32>, %arg3: tensor<1xf32>, %arg4: tensor<1xf32>) -> tensor<1x8194x32x32x16xf32> {
    %0 = tosa.conv3d %arg0, %arg1, %arg2, %arg3, %arg4 {acc_type = f32, dilation = array<i64: 1, 1, 1>, pad = array<i64: 1, 8193, 0, 1, 0, 1>, stride = array<i64: 1, 1, 1>} : (tensor<1x1x32x32x8xf32>, tensor<16x2x2x2x8xf32>, tensor<16xf32>, tensor<1xf32>, tensor<1xf32>) -> tensor<1x8194x32x32x16xf32>
    return %0 : tensor<1x8194x32x32x16xf32>
  }
}

// -----
module {
  func.func @test_conv3d_pad_top(%arg0: tensor<1x1x32x32x8xf32>, %arg1: tensor<16x2x2x2x8xf32>, %arg2: tensor<16xf32>, %arg3: tensor<1xf32>, %arg4: tensor<1xf32>) -> tensor<1x1x8225x32x16xf32> {
    %0 = tosa.conv3d %arg0, %arg1, %arg2, %arg3, %arg4 {acc_type = f32, dilation = array<i64: 1, 1, 1>, pad = array<i64: 0, 1, 8193, 1, 0, 1>, stride = array<i64: 1, 1, 1>} : (tensor<1x1x32x32x8xf32>, tensor<16x2x2x2x8xf32>, tensor<16xf32>, tensor<1xf32>, tensor<1xf32>) -> tensor<1x1x8225x32x16xf32>
    return %0 : tensor<1x1x8225x32x16xf32>
  }
}

// -----
module {
  func.func @test_conv3d_pad_bottom(%arg0: tensor<1x1x32x32x8xf32>, %arg1: tensor<16x2x2x2x8xf32>, %arg2: tensor<16xf32>, %arg3: tensor<1xf32>, %arg4: tensor<1xf32>) -> tensor<1x1x8224x32x16xf32> {
    %0 = tosa.conv3d %arg0, %arg1, %arg2, %arg3, %arg4 {acc_type = f32, dilation = array<i64: 1, 1, 1>, pad = array<i64: 0, 1, 0, 8193, 0, 1>, stride = array<i64: 1, 1, 1>} : (tensor<1x1x32x32x8xf32>, tensor<16x2x2x2x8xf32>, tensor<16xf32>, tensor<1xf32>, tensor<1xf32>) -> tensor<1x1x8224x32x16xf32>
    return %0 : tensor<1x1x8224x32x16xf32>
  }
}

// -----
module {
  func.func @test_conv3d_pad_left(%arg0: tensor<1x1x32x32x8xf32>, %arg1: tensor<16x2x2x2x8xf32>, %arg2: tensor<16xf32>, %arg3: tensor<1xf32>, %arg4: tensor<1xf32>) -> tensor<1x1x32x8225x16xf32> {
    %0 = tosa.conv3d %arg0, %arg1, %arg2, %arg3, %arg4 {acc_type = f32, dilation = array<i64: 1, 1, 1>, pad = array<i64: 0, 1, 0, 1, 8193, 1>, stride = array<i64: 1, 1, 1>} : (tensor<1x1x32x32x8xf32>, tensor<16x2x2x2x8xf32>, tensor<16xf32>, tensor<1xf32>, tensor<1xf32>) -> tensor<1x1x32x8225x16xf32>
    return %0 : tensor<1x1x32x8225x16xf32>
  }
}

// -----
module {
  func.func @test_conv3d_pad_right(%arg0: tensor<1x1x32x32x8xf32>, %arg1: tensor<16x2x2x2x8xf32>, %arg2: tensor<16xf32>, %arg3: tensor<1xf32>, %arg4: tensor<1xf32>) -> tensor<1x1x32x8224x16xf32> {
    %0 = tosa.conv3d %arg0, %arg1, %arg2, %arg3, %arg4 {acc_type = f32, dilation = array<i64: 1, 1, 1>, pad = array<i64: 0, 1, 0, 1, 0, 8193>, stride = array<i64: 1, 1, 1>} : (tensor<1x1x32x32x8xf32>, tensor<16x2x2x2x8xf32>, tensor<16xf32>, tensor<1xf32>, tensor<1xf32>) -> tensor<1x1x32x8224x16xf32>
    return %0 : tensor<1x1x32x8224x16xf32>
  }
}

// -----
module {
  func.func @test_conv3d_stride_d(%arg0: tensor<1x1x32x32x8xf32>, %arg1: tensor<16x2x2x2x8xf32>, %arg2: tensor<16xf32>, %arg3: tensor<1xf32>, %arg4: tensor<1xf32>) -> tensor<1x1x32x32x16xf32> {
    %0 = tosa.conv3d %arg0, %arg1, %arg2, %arg3, %arg4 {acc_type = f32, dilation = array<i64: 1, 1, 1>, pad = array<i64: 0, 1, 0, 1, 0, 1>, stride = array<i64: 8193, 1, 1>} : (tensor<1x1x32x32x8xf32>, tensor<16x2x2x2x8xf32>, tensor<16xf32>, tensor<1xf32>, tensor<1xf32>) -> tensor<1x1x32x32x16xf32>
    return %0 : tensor<1x1x32x32x16xf32>
  }
}

// -----
module {
  func.func @test_conv3d_stride_y(%arg0: tensor<1x1x8194x32x8xf32>, %arg1: tensor<16x2x2x2x8xf32>, %arg2: tensor<16xf32>, %arg3: tensor<1xf32>, %arg4: tensor<1xf32>) -> tensor<1x1x2x32x16xf32> {
    %0 = tosa.conv3d %arg0, %arg1, %arg2, %arg3, %arg4 {acc_type = f32, dilation = array<i64: 1, 1, 1>, pad = array<i64: 0, 1, 0, 1, 0, 1>, stride = array<i64: 1, 8193, 1>} : (tensor<1x1x8194x32x8xf32>, tensor<16x2x2x2x8xf32>, tensor<16xf32>, tensor<1xf32>, tensor<1xf32>) -> tensor<1x1x2x32x16xf32>
    return %0 : tensor<1x1x2x32x16xf32>
  }
}

// -----
module {
  func.func @test_conv3d_stride_x(%arg0: tensor<1x1x32x8194x8xf32>, %arg1: tensor<16x2x2x2x8xf32>, %arg2: tensor<16xf32>, %arg3: tensor<1xf32>, %arg4: tensor<1xf32>) -> tensor<1x1x32x2x16xf32> {
    %0 = tosa.conv3d %arg0, %arg1, %arg2, %arg3, %arg4 {acc_type = f32, dilation = array<i64: 1, 1, 1>, pad = array<i64: 0, 1, 0, 1, 0, 1>, stride = array<i64: 1, 1, 8193>} : (tensor<1x1x32x8194x8xf32>, tensor<16x2x2x2x8xf32>, tensor<16xf32>, tensor<1xf32>, tensor<1xf32>) -> tensor<1x1x32x2x16xf32>
    return %0 : tensor<1x1x32x2x16xf32>
  }
}

// -----
module {
  func.func @test_depthwise_conv2d_dilation_y(%arg0: tensor<1x8192x8192x4xf32>, %arg1: tensor<1025x16x4x1xf32>, %arg2: tensor<4xf32>, %arg3: tensor<1xf32>, %arg4: tensor<1xf32>) -> tensor<1x1x8178x4xf32> {
    %0 = tosa.depthwise_conv2d %arg0, %arg1, %arg2, %arg3, %arg4 {acc_type = f32, dilation = array<i64: 8, 1>, pad = array<i64: 0, 1, 0, 1>, stride = array<i64: 1, 1>} : (tensor<1x8192x8192x4xf32>, tensor<1025x16x4x1xf32>, tensor<4xf32>, tensor<1xf32>, tensor<1xf32>) -> tensor<1x1x8178x4xf32>
    return %0 : tensor<1x1x8178x4xf32>
  }
}

// -----
module {
  func.func @test_depthwise_conv2d_dilation_x(%arg0: tensor<1x8192x8192x4xf32>, %arg1: tensor<16x1025x4x1xf32>, %arg2: tensor<4xf32>, %arg3: tensor<1xf32>, %arg4: tensor<1xf32>) -> tensor<1x8178x1x4xf32> {
    %0 = tosa.depthwise_conv2d %arg0, %arg1, %arg2, %arg3, %arg4 {acc_type = f32, dilation = array<i64: 1, 8>, pad = array<i64: 0, 1, 0, 1>, stride = array<i64: 1, 1>} : (tensor<1x8192x8192x4xf32>, tensor<16x1025x4x1xf32>, tensor<4xf32>, tensor<1xf32>, tensor<1xf32>) -> tensor<1x8178x1x4xf32>
    return %0 : tensor<1x8178x1x4xf32>
  }
}

// -----
module {
  func.func @test_depthwise_conv2d_pad_top(%arg0: tensor<1x32x32x8xf32>, %arg1: tensor<2x2x8x8xf32>, %arg2: tensor<64xf32>, %arg3: tensor<1xf32>, %arg4: tensor<1xf32>) -> tensor<1x8225x32x64xf32> {
    %0 = tosa.depthwise_conv2d %arg0, %arg1, %arg2, %arg3, %arg4 {acc_type = f32, dilation = array<i64: 1, 1>, pad = array<i64: 8193, 1, 0, 1>, stride = array<i64: 1, 1>} : (tensor<1x32x32x8xf32>, tensor<2x2x8x8xf32>, tensor<64xf32>, tensor<1xf32>, tensor<1xf32>) -> tensor<1x8225x32x64xf32>
    return %0 : tensor<1x8225x32x64xf32>
  }
}

// -----
module {
  func.func @test_depthwise_conv2d_pad_bottom(%arg0: tensor<1x32x32x8xf32>, %arg1: tensor<2x2x8x8xf32>, %arg2: tensor<64xf32>, %arg3: tensor<1xf32>, %arg4: tensor<1xf32>) -> tensor<1x8224x32x64xf32> {
    %0 = tosa.depthwise_conv2d %arg0, %arg1, %arg2, %arg3, %arg4 {acc_type = f32, dilation = array<i64: 1, 1>, pad = array<i64: 0, 8193, 0, 1>, stride = array<i64: 1, 1>} : (tensor<1x32x32x8xf32>, tensor<2x2x8x8xf32>, tensor<64xf32>, tensor<1xf32>, tensor<1xf32>) -> tensor<1x8224x32x64xf32>
    return %0 : tensor<1x8224x32x64xf32>
  }
}

// -----
module {
  func.func @test_depthwise_conv2d_pad_left(%arg0: tensor<1x32x32x8xf32>, %arg1: tensor<2x2x8x8xf32>, %arg2: tensor<64xf32>, %arg3: tensor<1xf32>, %arg4: tensor<1xf32>) -> tensor<1x32x8225x64xf32> {
    %0 = tosa.depthwise_conv2d %arg0, %arg1, %arg2, %arg3, %arg4 {acc_type = f32, dilation = array<i64: 1, 1>, pad = array<i64: 0, 1, 8193, 1>, stride = array<i64: 1, 1>} : (tensor<1x32x32x8xf32>, tensor<2x2x8x8xf32>, tensor<64xf32>, tensor<1xf32>, tensor<1xf32>) -> tensor<1x32x8225x64xf32>
    return %0 : tensor<1x32x8225x64xf32>
  }
}

// -----
module {
  func.func @test_depthwise_conv2d_pad_right(%arg0: tensor<1x32x32x8xf32>, %arg1: tensor<2x2x8x8xf32>, %arg2: tensor<64xf32>, %arg3: tensor<1xf32>, %arg4: tensor<1xf32>) -> tensor<1x32x8224x64xf32> {
    %0 = tosa.depthwise_conv2d %arg0, %arg1, %arg2, %arg3, %arg4 {acc_type = f32, dilation = array<i64: 1, 1>, pad = array<i64: 0, 1, 0, 8193>, stride = array<i64: 1, 1>} : (tensor<1x32x32x8xf32>, tensor<2x2x8x8xf32>, tensor<64xf32>, tensor<1xf32>, tensor<1xf32>) -> tensor<1x32x8224x64xf32>
    return %0 : tensor<1x32x8224x64xf32>
  }
}

// -----
module {
  func.func @test_depthwise_conv2d_stride_y(%arg0: tensor<1x8194x32x8xf32>, %arg1: tensor<2x2x8x8xf32>, %arg2: tensor<64xf32>, %arg3: tensor<1xf32>, %arg4: tensor<1xf32>) -> tensor<1x2x32x64xf32> {
    %0 = tosa.depthwise_conv2d %arg0, %arg1, %arg2, %arg3, %arg4 {acc_type = f32, dilation = array<i64: 1, 1>, pad = array<i64: 0, 1, 0, 1>, stride = array<i64: 8193, 1>} : (tensor<1x8194x32x8xf32>, tensor<2x2x8x8xf32>, tensor<64xf32>, tensor<1xf32>, tensor<1xf32>) -> tensor<1x2x32x64xf32>
    return %0 : tensor<1x2x32x64xf32>
  }
}

// -----
module {
  func.func @test_depthwise_conv2d_stride_x(%arg0: tensor<1x32x8194x8xf32>, %arg1: tensor<2x2x8x8xf32>, %arg2: tensor<64xf32>, %arg3: tensor<1xf32>, %arg4: tensor<1xf32>) -> tensor<1x32x2x64xf32> {
    %0 = tosa.depthwise_conv2d %arg0, %arg1, %arg2, %arg3, %arg4 {acc_type = f32, dilation = array<i64: 1, 1>, pad = array<i64: 0, 1, 0, 1>, stride = array<i64: 1, 8193>} : (tensor<1x32x8194x8xf32>, tensor<2x2x8x8xf32>, tensor<64xf32>, tensor<1xf32>, tensor<1xf32>) -> tensor<1x32x2x64xf32>
    return %0 : tensor<1x32x2x64xf32>
  }
}

// -----
module {
  func.func @test_fft2d_real_h(%arg0: tensor<32x16384x32xf32>, %arg1: tensor<32x16384x32xf32>) -> (tensor<32x16384x32xf32>, tensor<32x16384x32xf32>) {
    %output_real, %output_imag = tosa.fft2d %arg0, %arg1 {inverse = false} : (tensor<32x16384x32xf32>, tensor<32x16384x32xf32>) -> (tensor<32x16384x32xf32>, tensor<32x16384x32xf32>)
    return %output_real, %output_imag : tensor<32x16384x32xf32>, tensor<32x16384x32xf32>
  }
}

// -----
module {
  func.func @test_fft2d_real_w(%arg0: tensor<32x32x16384xf32>, %arg1: tensor<32x32x16384xf32>) -> (tensor<32x32x16384xf32>, tensor<32x32x16384xf32>) {
    %output_real, %output_imag = tosa.fft2d %arg0, %arg1 {inverse = false} : (tensor<32x32x16384xf32>, tensor<32x32x16384xf32>) -> (tensor<32x32x16384xf32>, tensor<32x32x16384xf32>)
    return %output_real, %output_imag : tensor<32x32x16384xf32>, tensor<32x32x16384xf32>
  }
}

// -----
module {
  func.func @test_fft2d_imag_h(%arg0: tensor<32x16384x32xf32>, %arg1: tensor<32x16384x32xf32>) -> (tensor<32x16384x32xf32>, tensor<32x16384x32xf32>) {
    %output_real, %output_imag = tosa.fft2d %arg0, %arg1 {inverse = false} : (tensor<32x16384x32xf32>, tensor<32x16384x32xf32>) -> (tensor<32x16384x32xf32>, tensor<32x16384x32xf32>)
    return %output_real, %output_imag : tensor<32x16384x32xf32>, tensor<32x16384x32xf32>
  }
}

// -----
module {
  func.func @test_fft2d_imag_w(%arg0: tensor<32x32x16384xf32>, %arg1: tensor<32x32x16384xf32>) -> (tensor<32x32x16384xf32>, tensor<32x32x16384xf32>) {
    %output_real, %output_imag = tosa.fft2d %arg0, %arg1 {inverse = false} : (tensor<32x32x16384xf32>, tensor<32x32x16384xf32>) -> (tensor<32x32x16384xf32>, tensor<32x32x16384xf32>)
    return %output_real, %output_imag : tensor<32x32x16384xf32>, tensor<32x32x16384xf32>
  }
}

// -----
module {
  func.func @test_maxpool2d_kernel_y(%arg0: tensor<1x8194x32x8xf32>) -> tensor<1x2x32x8xf32> {
    %0 = tosa.max_pool2d %arg0 {kernel = array<i64: 8193, 1>, pad = array<i64: 0, 0, 0, 0>, stride = array<i64: 1, 1>} : (tensor<1x8194x32x8xf32>) -> tensor<1x2x32x8xf32>
    return %0 : tensor<1x2x32x8xf32>
  }
}

// -----
module {
  func.func @test_maxpool2d_kernel_x(%arg0: tensor<1x32x8194x8xf32>) -> tensor<1x32x2x8xf32> {
    %0 = tosa.max_pool2d %arg0 {kernel = array<i64: 1, 8193>, pad = array<i64: 0, 0, 0, 0>, stride = array<i64: 1, 1>} : (tensor<1x32x8194x8xf32>) -> tensor<1x32x2x8xf32>
    return %0 : tensor<1x32x2x8xf32>
  }
}

// -----
module {
  func.func @test_maxpool2d_stride_y(%arg0: tensor<1x8194x32x8xf32>) -> tensor<1x2x32x8xf32> {
    %0 = tosa.max_pool2d %arg0 {kernel = array<i64: 1, 1>, pad = array<i64: 0, 0, 0, 0>, stride = array<i64: 8193, 1>} : (tensor<1x8194x32x8xf32>) -> tensor<1x2x32x8xf32>
    return %0 : tensor<1x2x32x8xf32>
  }
}

// -----
module {
  func.func @test_maxpool2d_stride_x(%arg0: tensor<1x32x8194x8xf32>) -> tensor<1x32x2x8xf32> {
    %0 = tosa.max_pool2d %arg0 {kernel = array<i64: 1, 1>, pad = array<i64: 0, 0, 0, 0>, stride = array<i64: 1, 8193>} : (tensor<1x32x8194x8xf32>) -> tensor<1x32x2x8xf32>
    return %0 : tensor<1x32x2x8xf32>
  }
}

// -----
module {
  func.func @test_rfft2d_input_h(%arg0: tensor<13x16384x16xf32>) -> (tensor<13x16384x9xf32>, tensor<13x16384x9xf32>) {
    %output_real, %output_imag = tosa.rfft2d %arg0 : (tensor<13x16384x16xf32>) -> (tensor<13x16384x9xf32>, tensor<13x16384x9xf32>)
    return %output_real, %output_imag : tensor<13x16384x9xf32>, tensor<13x16384x9xf32>
  }
}

// -----
module {
  func.func @test_rfft2d_input_w(%arg0: tensor<13x8x16384xf32>) -> (tensor<13x8x8193xf32>, tensor<13x8x8193xf32>) {
    %output_real, %output_imag = tosa.rfft2d %arg0 : (tensor<13x8x16384xf32>) -> (tensor<13x8x8193xf32>, tensor<13x8x8193xf32>)
    return %output_real, %output_imag : tensor<13x8x8193xf32>, tensor<13x8x8193xf32>
  }
}

// -----
module {
  func.func @test_transpose_conv2d_weight_h(%arg0: tensor<1x32x32x8xf32>, %arg1: tensor<16x8193x1x8xf32>, %arg2: tensor<16xf32>, %arg3: tensor<1xf32>, %arg4: tensor<1xf32>) -> tensor<1x8224x32x16xf32> {
    %0 = tosa.transpose_conv2d %arg0, %arg1, %arg2, %arg3, %arg4 {acc_type = f32, out_pad = array<i64: 0, 0, 0, 0>, stride = array<i64: 1, 1>} : (tensor<1x32x32x8xf32>, tensor<16x8193x1x8xf32>, tensor<16xf32>, tensor<1xf32>, tensor<1xf32>) -> tensor<1x8224x32x16xf32>
    return %0 : tensor<1x8224x32x16xf32>
  }
}

// -----
module {
  func.func @test_transpose_conv2d_weight_w(%arg0: tensor<1x32x32x8xf32>, %arg1: tensor<16x1x8193x8xf32>, %arg2: tensor<16xf32>, %arg3: tensor<1xf32>, %arg4: tensor<1xf32>) -> tensor<1x32x8224x16xf32> {
    %0 = tosa.transpose_conv2d %arg0, %arg1, %arg2, %arg3, %arg4 {acc_type = f32, out_pad = array<i64: 0, 0, 0, 0>, stride = array<i64: 1, 1>} : (tensor<1x32x32x8xf32>, tensor<16x1x8193x8xf32>, tensor<16xf32>, tensor<1xf32>, tensor<1xf32>) -> tensor<1x32x8224x16xf32>
    return %0 : tensor<1x32x8224x16xf32>
  }
}

// -----
module {
  func.func @test_transpose_conv2d_pad_top(%arg0: tensor<1x32x32x8xf32>, %arg1: tensor<16x1x1x8xf32>, %arg2: tensor<16xf32>, %arg3: tensor<1xf32>, %arg4: tensor<1xf32>) -> tensor<1x8225x32x16xf32> {
    %0 = tosa.transpose_conv2d %arg0, %arg1, %arg2, %arg3, %arg4 {acc_type = f32, out_pad = array<i64: 8193, 0, 0, 0>, stride = array<i64: 1, 1>} : (tensor<1x32x32x8xf32>, tensor<16x1x1x8xf32>, tensor<16xf32>, tensor<1xf32>, tensor<1xf32>) -> tensor<1x8225x32x16xf32>
    return %0 : tensor<1x8225x32x16xf32>
  }
}

// -----
module {
  func.func @test_transpose_conv2d_pad_bottom(%arg0: tensor<1x32x32x8xf32>, %arg1: tensor<16x1x1x8xf32>, %arg2: tensor<16xf32>, %arg3: tensor<1xf32>, %arg4: tensor<1xf32>) -> tensor<1x8225x32x16xf32> {
    %0 = tosa.transpose_conv2d %arg0, %arg1, %arg2, %arg3, %arg4 {acc_type = f32, out_pad = array<i64: 0, 8193, 0, 0>, stride = array<i64: 1, 1>} : (tensor<1x32x32x8xf32>, tensor<16x1x1x8xf32>, tensor<16xf32>, tensor<1xf32>, tensor<1xf32>) -> tensor<1x8225x32x16xf32>
    return %0 : tensor<1x8225x32x16xf32>
  }
}

// -----
module {
  func.func @test_transpose_conv2d_pad_left(%arg0: tensor<1x32x32x8xf32>, %arg1: tensor<16x1x1x8xf32>, %arg2: tensor<16xf32>, %arg3: tensor<1xf32>, %arg4: tensor<1xf32>) -> tensor<1x32x8225x16xf32> {
    %0 = tosa.transpose_conv2d %arg0, %arg1, %arg2, %arg3, %arg4 {acc_type = f32, out_pad = array<i64: 0, 0, 8193, 0>, stride = array<i64: 1, 1>} : (tensor<1x32x32x8xf32>, tensor<16x1x1x8xf32>, tensor<16xf32>, tensor<1xf32>, tensor<1xf32>) -> tensor<1x32x8225x16xf32>
    return %0 : tensor<1x32x8225x16xf32>
  }
}

// -----
module {
  func.func @test_transpose_conv2d_pad_right(%arg0: tensor<1x32x32x8xf32>, %arg1: tensor<16x1x1x8xf32>, %arg2: tensor<16xf32>, %arg3: tensor<1xf32>, %arg4: tensor<1xf32>) -> tensor<1x32x8225x16xf32> {
    %0 = tosa.transpose_conv2d %arg0, %arg1, %arg2, %arg3, %arg4 {acc_type = f32, out_pad = array<i64: 0, 0, 0, 8193>, stride = array<i64: 1, 1>} : (tensor<1x32x32x8xf32>, tensor<16x1x1x8xf32>, tensor<16xf32>, tensor<1xf32>, tensor<1xf32>) -> tensor<1x32x8225x16xf32>
    return %0 : tensor<1x32x8225x16xf32>
  }
}

// -----
module {
  func.func @test_transpose_conv2d_stride_y(%arg0: tensor<1x32x32x8xf32>, %arg1: tensor<16x1x1x8xf32>, %arg2: tensor<16xf32>, %arg3: tensor<1xf32>, %arg4: tensor<1xf32>) -> tensor<1x253984x32x16xf32> {
    %0 = tosa.transpose_conv2d %arg0, %arg1, %arg2, %arg3, %arg4 {acc_type = f32, out_pad = array<i64: 0, 0, 0, 0>, stride = array<i64: 8193, 1>} : (tensor<1x32x32x8xf32>, tensor<16x1x1x8xf32>, tensor<16xf32>, tensor<1xf32>, tensor<1xf32>) -> tensor<1x253984x32x16xf32>
    return %0 : tensor<1x253984x32x16xf32>
  }
}

// -----
module {
  func.func @test_transpose_conv2d_stride_x(%arg0: tensor<1x32x32x8xf32>, %arg1: tensor<16x1x1x8xf32>, %arg2: tensor<16xf32>, %arg3: tensor<1xf32>, %arg4: tensor<1xf32>) -> tensor<1x32x253984x16xf32> {
    %0 = tosa.transpose_conv2d %arg0, %arg1, %arg2, %arg3, %arg4 {acc_type = f32, out_pad = array<i64: 0, 0, 0, 0>, stride = array<i64: 1, 8193>} : (tensor<1x32x32x8xf32>, tensor<16x1x1x8xf32>, tensor<16xf32>, tensor<1xf32>, tensor<1xf32>) -> tensor<1x32x253984x16xf32>
    return %0 : tensor<1x32x253984x16xf32>
  }
}

// -----
module {
  func.func @test_resize_scale_y(%arg0: tensor<1x32x32x8xf32>) -> tensor<1x7970x64x8xf32> {
    %0 = tosa.const_shape  {values = dense<[257, 1, 4, 2]> : tensor<4xindex>} : () -> !tosa.shape<4>
    %1 = tosa.const_shape  {values = dense<-1> : tensor<2xindex>} : () -> !tosa.shape<2>
    %2 = tosa.const_shape  {values = dense<1> : tensor<2xindex>} : () -> !tosa.shape<2>
    %3 = tosa.resize %arg0, %0, %1, %2 {mode = BILINEAR} : (tensor<1x32x32x8xf32>, !tosa.shape<4>, !tosa.shape<2>, !tosa.shape<2>) -> tensor<1x7970x64x8xf32>
    return %3 : tensor<1x7970x64x8xf32>
  }
}

// -----
module {
  func.func @test_resize_scale_x(%arg0: tensor<1x32x32x8xf32>) -> tensor<1x64x7970x8xf32> {
    %0 = tosa.const_shape  {values = dense<[4, 2, 257, 1]> : tensor<4xindex>} : () -> !tosa.shape<4>
    %1 = tosa.const_shape  {values = dense<-1> : tensor<2xindex>} : () -> !tosa.shape<2>
    %2 = tosa.const_shape  {values = dense<1> : tensor<2xindex>} : () -> !tosa.shape<2>
    %3 = tosa.resize %arg0, %0, %1, %2 {mode = BILINEAR} : (tensor<1x32x32x8xf32>, !tosa.shape<4>, !tosa.shape<2>, !tosa.shape<2>) -> tensor<1x64x7970x8xf32>
    return %3 : tensor<1x64x7970x8xf32>
  }
}

// -----
module {
  func.func @test_tensor_size_valid(%arg0: tensor<1x536870911xf32>) {
    %0 = tosa.const_shape  {values = dense<0> : tensor<2xindex>} : () -> !tosa.shape<2>
    %1 = tosa.const_shape  {values = dense<1> : tensor<2xindex>} : () -> !tosa.shape<2>
    %2 = tosa.slice %arg0, %0, %1 : (tensor<1x536870911xf32>, !tosa.shape<2>, !tosa.shape<2>) -> tensor<1x1xf32>
    return
  }
}

// -----
module {
  func.func @test_slice_tensor_size_invalid(%arg0: tensor<1x536870912xf32>) {
    %0 = tosa.const_shape  {values = dense<0> : tensor<2xindex>} : () -> !tosa.shape<2>
    %1 = tosa.const_shape  {values = dense<536870912> : tensor<2xindex>} : () -> !tosa.shape<2>
    %2 = tosa.slice %arg0, %0, %1 : (tensor<1x536870912xf32>, !tosa.shape<2>, !tosa.shape<2>) -> tensor<1x1xf32>
    return
  }
}

// -----
module {
  func.func @test_resize_tensor_size_invalid(%arg0: tensor<1x23178x23178x1xf32>) {
    %0 = tosa.const_shape  {values = dense<[127, 49, 12, 49]> : tensor<4xindex>} : () -> !tosa.shape<4>
    %1 = tosa.const_shape  {values = dense<0> : tensor<2xindex>} : () -> !tosa.shape<2>
    %2 = tosa.const_shape  {values = dense<0> : tensor<2xindex>} : () -> !tosa.shape<2>
    %3 = tosa.resize %arg0, %0, %1, %2 {mode = NEAREST_NEIGHBOR} : (tensor<1x23178x23178x1xf32>, !tosa.shape<4>, !tosa.shape<2>, !tosa.shape<2>) -> tensor<?x?x?x?xf32>
    return
  }
}

// -----
module {
  func.func @test_avg_pool2d_tensor_size_invalid(%arg0: tensor<1x23178x23178x9xf32>, %arg1: tensor<1xf32>, %arg2: tensor<1xf32>) -> tensor<1x23178x23178x9xf32> {
    %0 = tosa.avg_pool2d %arg0, %arg1, %arg2 {acc_type = f32, kernel = array<i64: 2, 2>, pad = array<i64: 0, 1, 0, 1>, stride = array<i64: 1, 1>} : (tensor<1x23178x23178x9xf32>, tensor<1xf32>, tensor<1xf32>) -> tensor<1x23178x23178x9xf32>
    return %0 : tensor<1x23178x23178x9xf32>
  }
}

// -----
module {
  func.func @test_conv2d_tensor_size_invalid(%arg0: tensor<1x23178x23178x4xf32>, %arg1: tensor<8x1x1x4xf32>, %arg2: tensor<8xf32>, %arg3: tensor<1xf32>, %arg4: tensor<1xf32>) -> tensor<1x23178x23178x8xf32> {
    %0 = tosa.conv2d %arg0, %arg1, %arg2, %arg3, %arg4 {acc_type = f32, dilation = array<i64: 1, 1>, local_bound = true, pad = array<i64: 0, 0, 0, 0>, stride = array<i64: 1, 1>} : (tensor<1x23178x23178x4xf32>, tensor<8x1x1x4xf32>, tensor<8xf32>, tensor<1xf32>, tensor<1xf32>) -> tensor<1x23178x23178x8xf32>
    return %0 : tensor<1x23178x23178x8xf32>
  }
}

// -----
module {
  func.func @test_fft2d_tensor_size_invalid(%arg0: tensor<123456x8192x8192xf32>, %arg1: tensor<123456x8192x8192xf32>) -> (tensor<123456x8192x8192xf32>, tensor<123456x8192x8192xf32>) {
    %output_real, %output_imag = tosa.fft2d %arg0, %arg1 {inverse = false} : (tensor<123456x8192x8192xf32>, tensor<123456x8192x8192xf32>) -> (tensor<123456x8192x8192xf32>, tensor<123456x8192x8192xf32>)
    return %output_real, %output_imag : tensor<123456x8192x8192xf32>, tensor<123456x8192x8192xf32>
  }
}

// -----
module {
  func.func @test_rfft2d_tensor_size_invalid(%arg0: tensor<536870912x8x16xf32>) -> (tensor<536870912x8x9xf32>, tensor<536870912x8x9xf32>) {
    %output_real, %output_imag = tosa.rfft2d %arg0 : (tensor<536870912x8x16xf32>) -> (tensor<536870912x8x9xf32>, tensor<536870912x8x9xf32>)
    return %output_real, %output_imag : tensor<536870912x8x9xf32>, tensor<536870912x8x9xf32>
  }
}

// -----
module {
  func.func @test_matmul_tensor_size_invalid(%arg0: tensor<23178x20000x19xf32>, %arg1: tensor<23178x19x28xf32>) -> tensor<23178x20000x28xf32> {
    %0 = "tosa.const"() <{values = dense<0.000000e+00> : tensor<1xf32>}> : () -> tensor<1xf32>
    %1 = tosa.matmul %arg0, %arg1, %0, %0 : (tensor<23178x20000x19xf32>, tensor<23178x19x28xf32>, tensor<1xf32>, tensor<1xf32>) -> tensor<23178x20000x28xf32>
    return %1 : tensor<23178x20000x28xf32>
  }
}

// -----
module {
  func.func @test_gather_tensor_size_invalid(%arg0: tensor<536870912x21x3xf32>, %arg1: tensor<536870912x26xi32>) -> tensor<536870912x26x3xf32> {
    %0 = tosa.gather %arg0, %arg1 : (tensor<536870912x21x3xf32>, tensor<536870912x26xi32>) -> tensor<536870912x26x3xf32>
    return %0 : tensor<536870912x26x3xf32>
  }
}

// -----
module {
  func.func @test_custom_tensor_size_invalid(%arg0: tensor<536870912xi32>) -> tensor<536870912xi32> {
    %0 = tosa.custom %arg0 {domain_name = "tosa.mlir_test", implementation_attrs = "", operator_name = "custom_test"} : (tensor<536870912xi32>) -> tensor<536870912xi32>
    return %0 : tensor<536870912xi32>
  }
}

// -----
module {
  func.func @test_gather_tensor_size_invalid(%arg0: tensor<268435456x21x3xf32>, %arg1: tensor<268435456x26xi32>) -> tensor<268435456x26x3xf32> {
    %0 = tosa.gather %arg0, %arg1 : (tensor<268435456x21x3xf32>, tensor<268435456x26xi32>) -> tensor<268435456x26x3xf32>
    return %0 : tensor<268435456x26x3xf32>
  }
}

// -----
module {
  func.func @test_scatter_tensor_size_invalid(%arg0: tensor<13x260000000x3xf32>, %arg1: tensor<13x260000000xi32>, %arg2: tensor<13x260000000x3xf32>) -> tensor<13x260000000x3xf32> {
    %0 = tosa.scatter %arg0, %arg1, %arg2 : (tensor<13x260000000x3xf32>, tensor<13x260000000xi32>, tensor<13x260000000x3xf32>) -> tensor<13x260000000x3xf32>
    return %0 : tensor<13x260000000x3xf32>
  }
}

// -----
module {
  tosa.variable @stored_var : tensor<536870912xf32>
  func.func @test_variable_read_write_tensor_size_invalid() {
    %0 = tosa.variable_read @stored_var : tensor<536870912xf32>
    tosa.variable_write @stored_var, %0 : tensor<536870912xf32>
    return
  }
}

// -----
module {
  func.func @test_while_loop_tensor_size_invalid(%arg0: tensor<536870912xi32>, %arg1: tensor<i32>) {
    %0 = "tosa.const"() <{values = dense<0> : tensor<i32>}> : () -> tensor<i32>
    %1:3 = tosa.while_loop (%arg2 = %0, %arg3 = %0, %arg4 = %arg0) : (tensor<i32>, tensor<i32>, tensor<536870912xi32>) -> (tensor<i32>, tensor<i32>, tensor<536870912xi32>) {
      %2 = tosa.greater_equal %arg3, %arg1 : (tensor<i32>, tensor<i32>) -> tensor<i1>
      %3 = tosa.logical_not %2 : (tensor<i1>) -> tensor<i1>
      tosa.yield %2 : tensor<i1>
    } do {
    ^bb0(%arg2: tensor<i32>, %arg3: tensor<i32>, %arg4: tensor<536870912xi32>):
      %2 = "tosa.const"() <{values = dense<1> : tensor<i32>}> : () -> tensor<i32>
      %3 = "tosa.const"() <{values = dense<4> : tensor<1xi32>}> : () -> tensor<1xi32>
      %4 = tosa.add %arg3, %2 : (tensor<i32>, tensor<i32>) -> tensor<i32>
      %5 = tosa.add %arg4, %3 : (tensor<536870912xi32>, tensor<1xi32>) -> tensor<536870912xi32>
      %6 = tosa.add %arg2, %2 : (tensor<i32>, tensor<i32>) -> tensor<i32>
      tosa.yield %6, %4, %5 : tensor<i32>, tensor<i32>, tensor<536870912xi32>
    }
    return
  }
}

// -----
module {
  func.func @test_const_shape() -> !tosa.shape<4> {
    %0 = tosa.const_shape  {values = dense<[1, 1, 536870912, 1]> : tensor<4xindex>} : () -> !tosa.shape<4>
    return %0 : !tosa.shape<4>
  }
}

// -----
module {
  func.func @test_cond_if_rank_valid(%arg0: tensor<1x1x1x1x1x1x1xf32>, %arg1: tensor<1x1x1x1x1x1x1xf32>, %arg2: tensor<i1>) -> tensor<1x1x1x1x1x1x1xf32> {
    %0 = tosa.cond_if %arg2 (%arg3 = %arg0, %arg4 = %arg1) : tensor<i1> (tensor<1x1x1x1x1x1x1xf32>, tensor<1x1x1x1x1x1x1xf32>) -> tensor<1x1x1x1x1x1x1xf32> {
    ^bb0(%arg3: tensor<1x1x1x1x1x1x1xf32>, %arg4: tensor<1x1x1x1x1x1x1xf32>):
      tosa.yield %arg3 : tensor<1x1x1x1x1x1x1xf32>
    } else {
    ^bb0(%arg3: tensor<1x1x1x1x1x1x1xf32>, %arg4: tensor<1x1x1x1x1x1x1xf32>):
      tosa.yield %arg4 : tensor<1x1x1x1x1x1x1xf32>
    }
    return %0 : tensor<1x1x1x1x1x1x1xf32>
  }
}

// -----
module {
  func.func @test_cond_if_rank_invalid(%arg0: tensor<1x1x1x1x1x1x1x1xf32>, %arg1: tensor<1x1x1x1x1x1x1x1xf32>, %arg2: tensor<1x1x1x1x1x1x1x1xi1>) -> tensor<1x1x1x1x1x1x1x1xf32> {
    %0 = tosa.cond_if %arg2 (%arg3 = %arg0, %arg4 = %arg1) : tensor<1x1x1x1x1x1x1x1xi1> (tensor<1x1x1x1x1x1x1x1xf32>, tensor<1x1x1x1x1x1x1x1xf32>) -> tensor<1x1x1x1x1x1x1x1xf32> {
    ^bb0(%arg3: tensor<1x1x1x1x1x1x1x1xf32>, %arg4: tensor<1x1x1x1x1x1x1x1xf32>):
      tosa.yield %arg3 : tensor<1x1x1x1x1x1x1x1xf32>
    } else {
    ^bb0(%arg3: tensor<1x1x1x1x1x1x1x1xf32>, %arg4: tensor<1x1x1x1x1x1x1x1xf32>):
      tosa.yield %arg4 : tensor<1x1x1x1x1x1x1x1xf32>
    }
    return %0 : tensor<1x1x1x1x1x1x1x1xf32>
  }
}

// -----
module {
  tosa.variable @stored_var : tensor<1x1x1x1x1x1x1x1xf32>
  func.func @test_variable_read_write_rank_invalid() {
    %0 = tosa.variable_read @stored_var : tensor<1x1x1x1x1x1x1x1xf32>
    tosa.variable_write @stored_var, %0 : tensor<1x1x1x1x1x1x1x1xf32>
    return
  }
}

// -----
module {
  func.func @test_while_loop(%arg0: tensor<1x1x1x1x1x1x1xf32>, %arg1: tensor<i32>) {
    %0 = "tosa.const"() <{values = dense<0> : tensor<i32>}> : () -> tensor<i32>
    %1:2 = tosa.while_loop (%arg2 = %0, %arg3 = %arg0) : (tensor<i32>, tensor<1x1x1x1x1x1x1xf32>) -> (tensor<i32>, tensor<1x1x1x1x1x1x1xf32>) {
      %2 = tosa.greater_equal %arg2, %arg1 : (tensor<i32>, tensor<i32>) -> tensor<i1>
      %3 = tosa.logical_not %2 : (tensor<i1>) -> tensor<i1>
      tosa.yield %3 : tensor<i1>
    } do {
    ^bb0(%arg2: tensor<i32>, %arg3: tensor<1x1x1x1x1x1x1xf32>):
      %2 = "tosa.const"() <{values = dense<1> : tensor<i32>}> : () -> tensor<i32>
      %3 = tosa.add %arg2, %2 : (tensor<i32>, tensor<i32>) -> tensor<i32>
      tosa.yield %3, %arg3 : tensor<i32>, tensor<1x1x1x1x1x1x1xf32>
    }
    return
  }
}

// -----
module {
  func.func @test_custom_rank_valid(%arg0: tensor<1x1x1x1x1x1x10xi32>) -> tensor<1x1x1x1x1x1x10xi32> {
    %0 = tosa.custom %arg0 {domain_name = "tosa_mlir_test", implementation_attrs = "", operator_name = "custom_test"} : (tensor<1x1x1x1x1x1x10xi32>) -> tensor<1x1x1x1x1x1x10xi32>
    return %0 : tensor<1x1x1x1x1x1x10xi32>
  }
}

// -----
module {
  func.func @test_unranked_tensor(%arg0: tensor<*xf32>) {
    %0 = tosa.const_shape  {values = dense<0> : tensor<1xindex>} : () -> !tosa.shape<1>
    %1 = tosa.const_shape  {values = dense<1> : tensor<1xindex>} : () -> !tosa.shape<1>
    %2 = tosa.slice %arg0, %0, %1 : (tensor<*xf32>, !tosa.shape<1>, !tosa.shape<1>) -> tensor<*xf32>
    return
  }
}

// -----
module {
  func.func @test_tensor_dim(%arg0: tensor<1x2147483648xf32>) {
    %0 = tosa.const_shape  {values = dense<0> : tensor<2xindex>} : () -> !tosa.shape<2>
    %1 = tosa.const_shape  {values = dense<1> : tensor<2xindex>} : () -> !tosa.shape<2>
    %2 = tosa.slice %arg0, %0, %1 : (tensor<1x2147483648xf32>, !tosa.shape<2>, !tosa.shape<2>) -> tensor<1x1xf32>
    return
  }
}

// -----
module {
  func.func @test_tensor_size(%arg0: tensor<1x1073741824xf32>) {
    %0 = tosa.const_shape  {values = dense<0> : tensor<2xindex>} : () -> !tosa.shape<2>
    %1 = tosa.const_shape  {values = dense<1> : tensor<2xindex>} : () -> !tosa.shape<2>
    %2 = tosa.slice %arg0, %0, %1 : (tensor<1x1073741824xf32>, !tosa.shape<2>, !tosa.shape<2>) -> tensor<1x1xf32>
    return
  }
}

// -----
module {
  func.func @test_tensor_size_ok(%arg0: tensor<1x536870911xf32>) {
    %0 = tosa.const_shape  {values = dense<0> : tensor<2xindex>} : () -> !tosa.shape<2>
    %1 = tosa.const_shape  {values = dense<1> : tensor<2xindex>} : () -> !tosa.shape<2>
    %2 = tosa.slice %arg0, %0, %1 : (tensor<1x536870911xf32>, !tosa.shape<2>, !tosa.shape<2>) -> tensor<1x1xf32>
    return
  }
}

// -----
module {
  func.func @test_concat_tensor_list_size() {
    %0 = "tosa.const"() <{values = dense<0> : tensor<1xi32>}> : () -> tensor<1xi32>
    %1 = tosa.concat %0, %0, %0, %0, %0, %0, %0, %0, %0, %0, %0, %0, %0, %0, %0, %0, %0, %0, %0, %0, %0, %0, %0, %0, %0, %0, %0, %0, %0, %0, %0, %0, %0, %0, %0, %0, %0, %0, %0, %0, %0, %0, %0, %0, %0, %0, %0, %0, %0, %0, %0, %0, %0, %0, %0, %0, %0, %0, %0, %0, %0, %0, %0, %0, %0 {axis = 0 : i32} : (tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>) -> tensor<65xi32>
    return
  }
}

// -----
module {
  func.func @test_custom_tensor_list_size() {
    %0 = "tosa.const"() <{values = dense<0> : tensor<1xi32>}> : () -> tensor<1xi32>
    %1 = tosa.custom %0, %0, %0, %0, %0, %0, %0, %0, %0, %0, %0, %0, %0, %0, %0, %0, %0, %0, %0, %0, %0, %0, %0, %0, %0, %0, %0, %0, %0, %0, %0, %0, %0, %0, %0, %0, %0, %0, %0, %0, %0, %0, %0, %0, %0, %0, %0, %0, %0, %0, %0, %0, %0, %0, %0, %0, %0, %0, %0, %0, %0, %0, %0, %0, %0 {domain_name = "tosa_mlir_test", implementation_attrs = "", operator_name = "custom_test"} : (tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>) -> tensor<65xi32>
    return
  }
}

// -----
module {
  func.func @test_custom_tensor_list_size_results() {
    %0 = "tosa.const"() <{values = dense<0> : tensor<1xi32>}> : () -> tensor<1xi32>
    %1:65 = tosa.custom %0 {domain_name = "tosa_mlir_test", implementation_attrs = "", operator_name = "custom_test"} : (tensor<1xi32>) -> (tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>)
    return
  }
}

// -----
module {
  func.func @test_if_tensor_list_size(%arg0: tensor<i1>) {
    %0 = "tosa.const"() <{values = dense<0> : tensor<1xi32>}> : () -> tensor<1xi32>
    %1 = tosa.cond_if %arg0 (%arg1 = %0, %arg2 = %0, %arg3 = %0, %arg4 = %0, %arg5 = %0, %arg6 = %0, %arg7 = %0, %arg8 = %0, %arg9 = %0, %arg10 = %0, %arg11 = %0, %arg12 = %0, %arg13 = %0, %arg14 = %0, %arg15 = %0, %arg16 = %0, %arg17 = %0, %arg18 = %0, %arg19 = %0, %arg20 = %0, %arg21 = %0, %arg22 = %0, %arg23 = %0, %arg24 = %0, %arg25 = %0, %arg26 = %0, %arg27 = %0, %arg28 = %0, %arg29 = %0, %arg30 = %0, %arg31 = %0, %arg32 = %0, %arg33 = %0, %arg34 = %0, %arg35 = %0, %arg36 = %0, %arg37 = %0, %arg38 = %0, %arg39 = %0, %arg40 = %0, %arg41 = %0, %arg42 = %0, %arg43 = %0, %arg44 = %0, %arg45 = %0, %arg46 = %0, %arg47 = %0, %arg48 = %0, %arg49 = %0, %arg50 = %0, %arg51 = %0, %arg52 = %0, %arg53 = %0, %arg54 = %0, %arg55 = %0, %arg56 = %0, %arg57 = %0, %arg58 = %0, %arg59 = %0, %arg60 = %0, %arg61 = %0, %arg62 = %0, %arg63 = %0, %arg64 = %0, %arg65 = %0) : tensor<i1> (tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>) -> tensor<1xi32> {
    ^bb0(%arg1: tensor<1xi32>, %arg2: tensor<1xi32>, %arg3: tensor<1xi32>, %arg4: tensor<1xi32>, %arg5: tensor<1xi32>, %arg6: tensor<1xi32>, %arg7: tensor<1xi32>, %arg8: tensor<1xi32>, %arg9: tensor<1xi32>, %arg10: tensor<1xi32>, %arg11: tensor<1xi32>, %arg12: tensor<1xi32>, %arg13: tensor<1xi32>, %arg14: tensor<1xi32>, %arg15: tensor<1xi32>, %arg16: tensor<1xi32>, %arg17: tensor<1xi32>, %arg18: tensor<1xi32>, %arg19: tensor<1xi32>, %arg20: tensor<1xi32>, %arg21: tensor<1xi32>, %arg22: tensor<1xi32>, %arg23: tensor<1xi32>, %arg24: tensor<1xi32>, %arg25: tensor<1xi32>, %arg26: tensor<1xi32>, %arg27: tensor<1xi32>, %arg28: tensor<1xi32>, %arg29: tensor<1xi32>, %arg30: tensor<1xi32>, %arg31: tensor<1xi32>, %arg32: tensor<1xi32>, %arg33: tensor<1xi32>, %arg34: tensor<1xi32>, %arg35: tensor<1xi32>, %arg36: tensor<1xi32>, %arg37: tensor<1xi32>, %arg38: tensor<1xi32>, %arg39: tensor<1xi32>, %arg40: tensor<1xi32>, %arg41: tensor<1xi32>, %arg42: tensor<1xi32>, %arg43: tensor<1xi32>, %arg44: tensor<1xi32>, %arg45: tensor<1xi32>, %arg46: tensor<1xi32>, %arg47: tensor<1xi32>, %arg48: tensor<1xi32>, %arg49: tensor<1xi32>, %arg50: tensor<1xi32>, %arg51: tensor<1xi32>, %arg52: tensor<1xi32>, %arg53: tensor<1xi32>, %arg54: tensor<1xi32>, %arg55: tensor<1xi32>, %arg56: tensor<1xi32>, %arg57: tensor<1xi32>, %arg58: tensor<1xi32>, %arg59: tensor<1xi32>, %arg60: tensor<1xi32>, %arg61: tensor<1xi32>, %arg62: tensor<1xi32>, %arg63: tensor<1xi32>, %arg64: tensor<1xi32>, %arg65: tensor<1xi32>):
      tosa.yield %arg65 : tensor<1xi32>
    } else {
    ^bb0(%arg1: tensor<1xi32>, %arg2: tensor<1xi32>, %arg3: tensor<1xi32>, %arg4: tensor<1xi32>, %arg5: tensor<1xi32>, %arg6: tensor<1xi32>, %arg7: tensor<1xi32>, %arg8: tensor<1xi32>, %arg9: tensor<1xi32>, %arg10: tensor<1xi32>, %arg11: tensor<1xi32>, %arg12: tensor<1xi32>, %arg13: tensor<1xi32>, %arg14: tensor<1xi32>, %arg15: tensor<1xi32>, %arg16: tensor<1xi32>, %arg17: tensor<1xi32>, %arg18: tensor<1xi32>, %arg19: tensor<1xi32>, %arg20: tensor<1xi32>, %arg21: tensor<1xi32>, %arg22: tensor<1xi32>, %arg23: tensor<1xi32>, %arg24: tensor<1xi32>, %arg25: tensor<1xi32>, %arg26: tensor<1xi32>, %arg27: tensor<1xi32>, %arg28: tensor<1xi32>, %arg29: tensor<1xi32>, %arg30: tensor<1xi32>, %arg31: tensor<1xi32>, %arg32: tensor<1xi32>, %arg33: tensor<1xi32>, %arg34: tensor<1xi32>, %arg35: tensor<1xi32>, %arg36: tensor<1xi32>, %arg37: tensor<1xi32>, %arg38: tensor<1xi32>, %arg39: tensor<1xi32>, %arg40: tensor<1xi32>, %arg41: tensor<1xi32>, %arg42: tensor<1xi32>, %arg43: tensor<1xi32>, %arg44: tensor<1xi32>, %arg45: tensor<1xi32>, %arg46: tensor<1xi32>, %arg47: tensor<1xi32>, %arg48: tensor<1xi32>, %arg49: tensor<1xi32>, %arg50: tensor<1xi32>, %arg51: tensor<1xi32>, %arg52: tensor<1xi32>, %arg53: tensor<1xi32>, %arg54: tensor<1xi32>, %arg55: tensor<1xi32>, %arg56: tensor<1xi32>, %arg57: tensor<1xi32>, %arg58: tensor<1xi32>, %arg59: tensor<1xi32>, %arg60: tensor<1xi32>, %arg61: tensor<1xi32>, %arg62: tensor<1xi32>, %arg63: tensor<1xi32>, %arg64: tensor<1xi32>, %arg65: tensor<1xi32>):
      tosa.yield %arg2 : tensor<1xi32>
    }
    return
  }
}

// -----
module {
  func.func @test_if_tensor_list_size_outputs(%arg0: tensor<i1>) {
    %0 = "tosa.const"() <{values = dense<0> : tensor<1xi32>}> : () -> tensor<1xi32>
    %1:65 = tosa.cond_if %arg0 (%arg1 = %0) : tensor<i1> (tensor<1xi32>) -> (tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>) {
    ^bb0(%arg1: tensor<1xi32>):
      tosa.yield %arg1, %arg1, %arg1, %arg1, %arg1, %arg1, %arg1, %arg1, %arg1, %arg1, %arg1, %arg1, %arg1, %arg1, %arg1, %arg1, %arg1, %arg1, %arg1, %arg1, %arg1, %arg1, %arg1, %arg1, %arg1, %arg1, %arg1, %arg1, %arg1, %arg1, %arg1, %arg1, %arg1, %arg1, %arg1, %arg1, %arg1, %arg1, %arg1, %arg1, %arg1, %arg1, %arg1, %arg1, %arg1, %arg1, %arg1, %arg1, %arg1, %arg1, %arg1, %arg1, %arg1, %arg1, %arg1, %arg1, %arg1, %arg1, %arg1, %arg1, %arg1, %arg1, %arg1, %arg1, %arg1 : tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>
    } else {
    ^bb0(%arg1: tensor<1xi32>):
      tosa.yield %arg1, %arg1, %arg1, %arg1, %arg1, %arg1, %arg1, %arg1, %arg1, %arg1, %arg1, %arg1, %arg1, %arg1, %arg1, %arg1, %arg1, %arg1, %arg1, %arg1, %arg1, %arg1, %arg1, %arg1, %arg1, %arg1, %arg1, %arg1, %arg1, %arg1, %arg1, %arg1, %arg1, %arg1, %arg1, %arg1, %arg1, %arg1, %arg1, %arg1, %arg1, %arg1, %arg1, %arg1, %arg1, %arg1, %arg1, %arg1, %arg1, %arg1, %arg1, %arg1, %arg1, %arg1, %arg1, %arg1, %arg1, %arg1, %arg1, %arg1, %arg1, %arg1, %arg1, %arg1, %arg1 : tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>
    }
    return
  }
}

// -----
module {
  func.func @test_while_tensor_list_size(%arg0: tensor<1x1x1x1x1x1x1xf32>, %arg1: tensor<1xi32>) {
    %0 = "tosa.const"() <{values = dense<0> : tensor<1xi32>}> : () -> tensor<1xi32>
    %1:65 = tosa.while_loop (%arg2 = %0, %arg3 = %arg0, %arg4 = %0, %arg5 = %0, %arg6 = %0, %arg7 = %0, %arg8 = %0, %arg9 = %0, %arg10 = %0, %arg11 = %0, %arg12 = %0, %arg13 = %0, %arg14 = %0, %arg15 = %0, %arg16 = %0, %arg17 = %0, %arg18 = %0, %arg19 = %0, %arg20 = %0, %arg21 = %0, %arg22 = %0, %arg23 = %0, %arg24 = %0, %arg25 = %0, %arg26 = %0, %arg27 = %0, %arg28 = %0, %arg29 = %0, %arg30 = %0, %arg31 = %0, %arg32 = %0, %arg33 = %0, %arg34 = %0, %arg35 = %0, %arg36 = %0, %arg37 = %0, %arg38 = %0, %arg39 = %0, %arg40 = %0, %arg41 = %0, %arg42 = %0, %arg43 = %0, %arg44 = %0, %arg45 = %0, %arg46 = %0, %arg47 = %0, %arg48 = %0, %arg49 = %0, %arg50 = %0, %arg51 = %0, %arg52 = %0, %arg53 = %0, %arg54 = %0, %arg55 = %0, %arg56 = %0, %arg57 = %0, %arg58 = %0, %arg59 = %0, %arg60 = %0, %arg61 = %0, %arg62 = %0, %arg63 = %0, %arg64 = %0, %arg65 = %0, %arg66 = %0) : (tensor<1xi32>, tensor<1x1x1x1x1x1x1xf32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>) -> (tensor<1xi32>, tensor<1x1x1x1x1x1x1xf32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>) {
      %2 = tosa.greater_equal %arg2, %arg1 : (tensor<1xi32>, tensor<1xi32>) -> tensor<1xi1>
      %3 = tosa.logical_not %2 : (tensor<1xi1>) -> tensor<1xi1>
      tosa.yield %3 : tensor<1xi1>
    } do {
    ^bb0(%arg2: tensor<1xi32>, %arg3: tensor<1x1x1x1x1x1x1xf32>, %arg4: tensor<1xi32>, %arg5: tensor<1xi32>, %arg6: tensor<1xi32>, %arg7: tensor<1xi32>, %arg8: tensor<1xi32>, %arg9: tensor<1xi32>, %arg10: tensor<1xi32>, %arg11: tensor<1xi32>, %arg12: tensor<1xi32>, %arg13: tensor<1xi32>, %arg14: tensor<1xi32>, %arg15: tensor<1xi32>, %arg16: tensor<1xi32>, %arg17: tensor<1xi32>, %arg18: tensor<1xi32>, %arg19: tensor<1xi32>, %arg20: tensor<1xi32>, %arg21: tensor<1xi32>, %arg22: tensor<1xi32>, %arg23: tensor<1xi32>, %arg24: tensor<1xi32>, %arg25: tensor<1xi32>, %arg26: tensor<1xi32>, %arg27: tensor<1xi32>, %arg28: tensor<1xi32>, %arg29: tensor<1xi32>, %arg30: tensor<1xi32>, %arg31: tensor<1xi32>, %arg32: tensor<1xi32>, %arg33: tensor<1xi32>, %arg34: tensor<1xi32>, %arg35: tensor<1xi32>, %arg36: tensor<1xi32>, %arg37: tensor<1xi32>, %arg38: tensor<1xi32>, %arg39: tensor<1xi32>, %arg40: tensor<1xi32>, %arg41: tensor<1xi32>, %arg42: tensor<1xi32>, %arg43: tensor<1xi32>, %arg44: tensor<1xi32>, %arg45: tensor<1xi32>, %arg46: tensor<1xi32>, %arg47: tensor<1xi32>, %arg48: tensor<1xi32>, %arg49: tensor<1xi32>, %arg50: tensor<1xi32>, %arg51: tensor<1xi32>, %arg52: tensor<1xi32>, %arg53: tensor<1xi32>, %arg54: tensor<1xi32>, %arg55: tensor<1xi32>, %arg56: tensor<1xi32>, %arg57: tensor<1xi32>, %arg58: tensor<1xi32>, %arg59: tensor<1xi32>, %arg60: tensor<1xi32>, %arg61: tensor<1xi32>, %arg62: tensor<1xi32>, %arg63: tensor<1xi32>, %arg64: tensor<1xi32>, %arg65: tensor<1xi32>, %arg66: tensor<1xi32>):
      %2 = "tosa.const"() <{values = dense<1> : tensor<1xi32>}> : () -> tensor<1xi32>
      %3 = tosa.add %arg2, %2 : (tensor<1xi32>, tensor<1xi32>) -> tensor<1xi32>
      tosa.yield %3, %arg3, %0, %0, %0, %0, %0, %0, %0, %0, %0, %0, %0, %0, %0, %0, %0, %0, %0, %0, %0, %0, %0, %0, %0, %0, %0, %0, %0, %0, %0, %0, %0, %0, %0, %0, %0, %0, %0, %0, %0, %0, %0, %0, %0, %0, %0, %0, %0, %0, %0, %0, %0, %0, %0, %0, %0, %0, %0, %0, %0, %0, %0, %0, %0 : tensor<1xi32>, tensor<1x1x1x1x1x1x1xf32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>, tensor<1xi32>
    }
    return
  }
}

// -----
module {
  func.func @test_cond_if_max_nested_depth(%arg0: tensor<f32>, %arg1: tensor<f32>, %arg2: tensor<i1>, %arg3: tensor<i1>) -> tensor<f32> {
    %0 = tosa.cond_if %arg2 : tensor<i1> -> tensor<f32> {
      %1 = tosa.cond_if %arg3 : tensor<i1> -> tensor<f32> {
        %2 = tosa.cond_if %arg2 : tensor<i1> -> tensor<f32> {
          %3 = tosa.cond_if %arg3 : tensor<i1> -> tensor<f32> {
            %4 = tosa.cond_if %arg2 : tensor<i1> -> tensor<f32> {
              %5 = tosa.cond_if %arg3 : tensor<i1> -> tensor<f32> {
                %6 = tosa.sub %arg0, %arg1 : (tensor<f32>, tensor<f32>) -> tensor<f32>
                tosa.yield %6 : tensor<f32>
              } else {
                tosa.yield %arg0 : tensor<f32>
              }
              tosa.yield %5 : tensor<f32>
            } else {
              tosa.yield %arg0 : tensor<f32>
            }
            tosa.yield %4 : tensor<f32>
          } else {
            tosa.yield %arg0 : tensor<f32>
          }
          tosa.yield %3 : tensor<f32>
        } else {
          tosa.yield %arg0 : tensor<f32>
        }
        tosa.yield %2 : tensor<f32>
      } else {
        tosa.yield %arg0 : tensor<f32>
      }
      tosa.yield %1 : tensor<f32>
    } else {
      %1 = tosa.sub %arg0, %arg1 : (tensor<f32>, tensor<f32>) -> tensor<f32>
      tosa.yield %1 : tensor<f32>
    }
    return %0 : tensor<f32>
  }
}

// -----
module {
  func.func @test_while_loop_max_nested_depth(%arg0: tensor<i32>) {
    %0 = "tosa.const"() <{values = dense<0> : tensor<i32>}> : () -> tensor<i32>
    %1 = "tosa.const"() <{values = dense<1> : tensor<i32>}> : () -> tensor<i32>
    %2:2 = tosa.while_loop (%arg1 = %0, %arg2 = %arg0) : (tensor<i32>, tensor<i32>) -> (tensor<i32>, tensor<i32>) {
      %3 = tosa.greater_equal %arg2, %arg1 : (tensor<i32>, tensor<i32>) -> tensor<i1>
      tosa.yield %3 : tensor<i1>
    } do {
    ^bb0(%arg1: tensor<i32>, %arg2: tensor<i32>):
      %3:2 = tosa.while_loop (%arg3 = %0, %arg4 = %arg0) : (tensor<i32>, tensor<i32>) -> (tensor<i32>, tensor<i32>) {
        %5 = tosa.greater_equal %arg4, %arg3 : (tensor<i32>, tensor<i32>) -> tensor<i1>
        tosa.yield %5 : tensor<i1>
      } do {
      ^bb0(%arg3: tensor<i32>, %arg4: tensor<i32>):
        %5:2 = tosa.while_loop (%arg5 = %0, %arg6 = %arg0) : (tensor<i32>, tensor<i32>) -> (tensor<i32>, tensor<i32>) {
          %7 = tosa.greater_equal %arg6, %arg5 : (tensor<i32>, tensor<i32>) -> tensor<i1>
          tosa.yield %7 : tensor<i1>
        } do {
        ^bb0(%arg5: tensor<i32>, %arg6: tensor<i32>):
          %7:2 = tosa.while_loop (%arg7 = %0, %arg8 = %arg0) : (tensor<i32>, tensor<i32>) -> (tensor<i32>, tensor<i32>) {
            %9 = tosa.greater_equal %arg8, %arg7 : (tensor<i32>, tensor<i32>) -> tensor<i1>
            tosa.yield %9 : tensor<i1>
          } do {
          ^bb0(%arg7: tensor<i32>, %arg8: tensor<i32>):
            %9:2 = tosa.while_loop (%arg9 = %0, %arg10 = %arg0) : (tensor<i32>, tensor<i32>) -> (tensor<i32>, tensor<i32>) {
              %11 = tosa.greater_equal %arg10, %arg9 : (tensor<i32>, tensor<i32>) -> tensor<i1>
              tosa.yield %11 : tensor<i1>
            } do {
            ^bb0(%arg9: tensor<i32>, %arg10: tensor<i32>):
              %11:2 = tosa.while_loop (%arg11 = %0, %arg12 = %arg0) : (tensor<i32>, tensor<i32>) -> (tensor<i32>, tensor<i32>) {
                %13 = tosa.greater_equal %arg12, %arg11 : (tensor<i32>, tensor<i32>) -> tensor<i1>
                tosa.yield %13 : tensor<i1>
              } do {
              ^bb0(%arg11: tensor<i32>, %arg12: tensor<i32>):
                %13 = tosa.add %arg11, %1 : (tensor<i32>, tensor<i32>) -> tensor<i32>
                tosa.yield %arg1, %13 : tensor<i32>, tensor<i32>
              }
              %12 = tosa.add %arg9, %1 : (tensor<i32>, tensor<i32>) -> tensor<i32>
              tosa.yield %arg1, %12 : tensor<i32>, tensor<i32>
            }
            %10 = tosa.add %arg7, %1 : (tensor<i32>, tensor<i32>) -> tensor<i32>
            tosa.yield %arg1, %10 : tensor<i32>, tensor<i32>
          }
          %8 = tosa.add %arg5, %1 : (tensor<i32>, tensor<i32>) -> tensor<i32>
          tosa.yield %arg1, %8 : tensor<i32>, tensor<i32>
        }
        %6 = tosa.add %arg3, %1 : (tensor<i32>, tensor<i32>) -> tensor<i32>
        tosa.yield %arg1, %6 : tensor<i32>, tensor<i32>
      }
      %4 = tosa.add %arg1, %1 : (tensor<i32>, tensor<i32>) -> tensor<i32>
      tosa.yield %arg1, %4 : tensor<i32>, tensor<i32>
    }
    return
  }
}

// -----
module {
  func.func @test_unranked_weight_conv2d(%arg0: tensor<1x4x4x4xf32>, %arg1: tensor<*xf32>, %arg2: tensor<8xf32>, %arg3: tensor<1xf32>, %arg4: tensor<1xf32>) -> tensor<*xf32> {
    %0 = tosa.conv2d %arg0, %arg1, %arg2, %arg3, %arg4 {acc_type = f32, dilation = array<i64: 1, 1>, local_bound = true, pad = array<i64: 0, 0, 0, 0>, stride = array<i64: 1, 1>} : (tensor<1x4x4x4xf32>, tensor<*xf32>, tensor<8xf32>, tensor<1xf32>, tensor<1xf32>) -> tensor<*xf32>
    return %0 : tensor<*xf32>
  }
}

// -----
module {
  func.func @test_matmul_t_block_scaled_invalid_size(%arg0: tensor<4x8x536870912xf4E2M1FN>, %arg1: tensor<4x8x16777216xf8E8M0FNU>, %arg2: tensor<4x16x536870912xf4E2M1FN>, %arg3: tensor<4x16x16777216xf8E8M0FNU>) -> tensor<*xf32> {
    %0 = tosa.matmul_t_block_scaled %arg0, %arg1, %arg2, %arg3 {block_size = BLOCK_SIZE_32} : (tensor<4x8x536870912xf4E2M1FN>, tensor<4x8x16777216xf8E8M0FNU>, tensor<4x16x536870912xf4E2M1FN>, tensor<4x16x16777216xf8E8M0FNU>) -> tensor<*xf32>
    return %0 : tensor<*xf32>
  }
}

// -----
module {
  func.func @test_cast_from_block_scaled_invalid_size(%arg0: tensor<67108864x32xf6E2M3FN>, %arg1: tensor<67108864x1xf8E8M0FNU>) -> tensor<67108864x32xf32> {
    %0 = tosa.cast_from_block_scaled %arg0, %arg1 {block_size = BLOCK_SIZE_32} : (tensor<67108864x32xf6E2M3FN>, tensor<67108864x1xf8E8M0FNU>) -> tensor<67108864x32xf32>
    return %0 : tensor<67108864x32xf32>
  }
}

// -----
module {
  func.func @test_cast_from_block_scaled_invalid_rank(%arg0: tensor<1x2x3x4x5x6x7x32xf6E2M3FN>, %arg1: tensor<1x2x3x4x5x6x7x1xf8E8M0FNU>) -> tensor<1x2x3x4x5x6x7x32xf32> {
    %0 = tosa.cast_from_block_scaled %arg0, %arg1 {block_size = BLOCK_SIZE_32} : (tensor<1x2x3x4x5x6x7x32xf6E2M3FN>, tensor<1x2x3x4x5x6x7x1xf8E8M0FNU>) -> tensor<1x2x3x4x5x6x7x32xf32>
    return %0 : tensor<1x2x3x4x5x6x7x32xf32>
  }
}

// -----
module {
  func.func @test_cast_to_block_scaled_invalid_size(%arg0: tensor<67108864x32xf32>) -> (tensor<67108864x32xf6E2M3FN>, tensor<67108864x1xf8E8M0FNU>) {
    %output_data, %output_scale = tosa.cast_to_block_scaled %arg0 {block_size = BLOCK_SIZE_32} : (tensor<67108864x32xf32>) -> (tensor<67108864x32xf6E2M3FN>, tensor<67108864x1xf8E8M0FNU>)
    return %output_data, %output_scale : tensor<67108864x32xf6E2M3FN>, tensor<67108864x1xf8E8M0FNU>
  }
}

// -----
module {
  func.func @test_cast_to_block_scaled_invalid_rank(%arg0: tensor<1x2x3x4x5x6x7x32xf32>) -> (tensor<1x2x3x4x5x6x7x32xf6E2M3FN>, tensor<1x2x3x4x5x6x7x1xf8E8M0FNU>) {
    %output_data, %output_scale = tosa.cast_to_block_scaled %arg0 {block_size = BLOCK_SIZE_32} : (tensor<1x2x3x4x5x6x7x32xf32>) -> (tensor<1x2x3x4x5x6x7x32xf6E2M3FN>, tensor<1x2x3x4x5x6x7x1xf8E8M0FNU>)
    return %output_data, %output_scale : tensor<1x2x3x4x5x6x7x32xf6E2M3FN>, tensor<1x2x3x4x5x6x7x1xf8E8M0FNU>
  }
}

// -----
module {
  func.func @test_add_shape_invalid_rank() -> !tosa.shape<13> {
    %0 = tosa.const_shape  {values = dense<[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13]> : tensor<13xindex>} : () -> !tosa.shape<13>
    %1 = tosa.const_shape  {values = dense<[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13]> : tensor<13xindex>} : () -> !tosa.shape<13>
    %2 = tosa.add_shape %0, %1 : (!tosa.shape<13>, !tosa.shape<13>) -> !tosa.shape<13>
    return %2 : !tosa.shape<13>
  }
}

// -----
module {
  func.func @test_div_floor_shape_invalid_rank() -> !tosa.shape<7> {
    %0 = tosa.const_shape  {values = dense<[1, 2, 3, 4, 5, 6, 7]> : tensor<7xindex>} : () -> !tosa.shape<7>
    %1 = tosa.const_shape  {values = dense<[1, 2, 3, 4, 5, 6, 7]> : tensor<7xindex>} : () -> !tosa.shape<7>
    %2 = tosa.div_floor_shape %0, %1 : (!tosa.shape<7>, !tosa.shape<7>) -> !tosa.shape<7>
    return %2 : !tosa.shape<7>
  }
}

// -----
module {
  func.func @test_dim(%arg0: tensor<1x2x3x4x5x6x7x8xi32>) -> !tosa.shape<1> {
    %0 = tosa.dim %arg0 {axis = 2 : i32} : (tensor<1x2x3x4x5x6x7x8xi32>) -> !tosa.shape<1>
    return %0 : !tosa.shape<1>
  }
}

// -----
module {
  func.func @test_concat_shape_invalid_list_size() {
    %0 = tosa.const_shape  {values = dense<> : tensor<0xindex>} : () -> !tosa.shape<0>
    %1 = tosa.concat_shape %0, %0, %0, %0, %0, %0, %0, %0, %0, %0, %0, %0, %0, %0, %0, %0, %0, %0, %0, %0, %0, %0, %0, %0, %0, %0, %0, %0, %0, %0, %0, %0, %0, %0, %0, %0, %0, %0, %0, %0, %0, %0, %0, %0, %0, %0, %0, %0, %0, %0, %0, %0, %0, %0, %0, %0, %0, %0, %0, %0, %0, %0, %0, %0, %0 : (!tosa.shape<0>, !tosa.shape<0>, !tosa.shape<0>, !tosa.shape<0>, !tosa.shape<0>, !tosa.shape<0>, !tosa.shape<0>, !tosa.shape<0>, !tosa.shape<0>, !tosa.shape<0>, !tosa.shape<0>, !tosa.shape<0>, !tosa.shape<0>, !tosa.shape<0>, !tosa.shape<0>, !tosa.shape<0>, !tosa.shape<0>, !tosa.shape<0>, !tosa.shape<0>, !tosa.shape<0>, !tosa.shape<0>, !tosa.shape<0>, !tosa.shape<0>, !tosa.shape<0>, !tosa.shape<0>, !tosa.shape<0>, !tosa.shape<0>, !tosa.shape<0>, !tosa.shape<0>, !tosa.shape<0>, !tosa.shape<0>, !tosa.shape<0>, !tosa.shape<0>, !tosa.shape<0>, !tosa.shape<0>, !tosa.shape<0>, !tosa.shape<0>, !tosa.shape<0>, !tosa.shape<0>, !tosa.shape<0>, !tosa.shape<0>, !tosa.shape<0>, !tosa.shape<0>, !tosa.shape<0>, !tosa.shape<0>, !tosa.shape<0>, !tosa.shape<0>, !tosa.shape<0>, !tosa.shape<0>, !tosa.shape<0>, !tosa.shape<0>, !tosa.shape<0>, !tosa.shape<0>, !tosa.shape<0>, !tosa.shape<0>, !tosa.shape<0>, !tosa.shape<0>, !tosa.shape<0>, !tosa.shape<0>, !tosa.shape<0>, !tosa.shape<0>, !tosa.shape<0>, !tosa.shape<0>, !tosa.shape<0>, !tosa.shape<0>) -> !tosa.shape<0>
    return
  }
}

// -----
module {
  func.func @test_exp2_shape_invalid_rank() -> !tosa.shape<7> {
    %0 = tosa.const_shape  {values = dense<[1, 2, 3, 4, 5, 6, 7]> : tensor<7xindex>} : () -> !tosa.shape<7>
    %1 = tosa.exp2_shape %0 : (!tosa.shape<7>) -> !tosa.shape<7>
    return %1 : !tosa.shape<7>
  }
}

// -----
module {
  func.func @test_log2_floor_shape_invalid_rank() -> !tosa.shape<7> {
    %0 = tosa.const_shape  {values = dense<[1, 2, 3, 4, 5, 6, 7]> : tensor<7xindex>} : () -> !tosa.shape<7>
    %1 = tosa.log2_floor_shape %0 : (!tosa.shape<7>) -> !tosa.shape<7>
    return %1 : !tosa.shape<7>
  }
}

// -----
module {
  func.func @test_log2_ceil_shape_invalid_rank() -> !tosa.shape<7> {
    %0 = tosa.const_shape  {values = dense<[1, 2, 3, 4, 5, 6, 7]> : tensor<7xindex>} : () -> !tosa.shape<7>
    %1 = tosa.log2_ceil_shape %0 : (!tosa.shape<7>) -> !tosa.shape<7>
    return %1 : !tosa.shape<7>
  }
}

// -----
module {
  func.func @test_mod_shape_invalid_rank() -> !tosa.shape<9> {
    %0 = tosa.const_shape  {values = dense<[1, 2, 3, 4, 5, 6, 7, 8, 9]> : tensor<9xindex>} : () -> !tosa.shape<9>
    %1 = tosa.const_shape  {values = dense<[1, 2, 3, 4, 5, 6, 7, 8, 9]> : tensor<9xindex>} : () -> !tosa.shape<9>
    %2 = tosa.mod_shape %0, %1 : (!tosa.shape<9>, !tosa.shape<9>) -> !tosa.shape<9>
    return %2 : !tosa.shape<9>
  }
}

