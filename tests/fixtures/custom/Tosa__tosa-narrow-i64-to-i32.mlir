module {
}

// -----
module {
  func.func @test_i64_argmax(%arg0: tensor<1x513x513x19xi8>) -> tensor<1x513x513xi64> {
    %0 = tosa.argmax %arg0 {axis = 3 : i32} : (tensor<1x513x513x19xi8>) -> tensor<1x513x513xi64>
    return %0 : tensor<1x513x513xi64>
  }
}

// -----
module {
  func.func @test_i64_const() -> tensor<2xi64> {
    %0 = "tosa.const"() <{values = dense<[1, 2]> : tensor<2xi64>}> : () -> tensor<2xi64>
    return %0 : tensor<2xi64>
  }
}

// -----
module {
  func.func @test_i64_argmax_cast(%arg0: tensor<1x513x513x19xi8>) -> tensor<1x513x513xf32> {
    %0 = tosa.argmax %arg0 {axis = 3 : i32} : (tensor<1x513x513x19xi8>) -> tensor<1x513x513xi64>
    %1 = tosa.cast %0 : (tensor<1x513x513xi64>) -> tensor<1x513x513xf32>
    return %1 : tensor<1x513x513xf32>
  }
}

// -----
module {
  func.func @test_i64_argmax_large_axis_dim(%arg0: tensor<1x513x513x2147483650xi8>) -> tensor<1x513x513xi64> {
    %0 = tosa.argmax %arg0 {axis = 3 : i32} : (tensor<1x513x513x2147483650xi8>) -> tensor<1x513x513xi64>
    return %0 : tensor<1x513x513xi64>
  }
}

// -----
module {
  func.func @test_add(%arg0: tensor<13x21x1xi64>, %arg1: tensor<13x21x3xi64>) -> tensor<13x21x3xi64> {
    %0 = tosa.add %arg0, %arg1 : (tensor<13x21x1xi64>, tensor<13x21x3xi64>) -> tensor<13x21x3xi64>
    return %0 : tensor<13x21x3xi64>
  }
}

// -----
module {
  func.func @test_regions(%arg0: tensor<1x2xi32>, %arg1: tensor<1xi32>, %arg2: tensor<i1>) -> tensor<1xi32> {
    %0 = tosa.cond_if %arg2 : tensor<i1> -> tensor<1xi32> {
      %1 = tosa.argmax %arg0 {axis = 1 : i32} : (tensor<1x2xi32>) -> tensor<1xi64>
      %2 = tosa.cast %1 : (tensor<1xi64>) -> tensor<1xi32>
      tosa.yield %2 : tensor<1xi32>
    } else {
      tosa.yield %arg1 : tensor<1xi32>
    }
    return %0 : tensor<1xi32>
  }
}

// -----
module {
  func.func @test_concat(%arg0: tensor<13x21x3xi64>, %arg1: tensor<13x21x3xi64>) -> tensor<26x21x3xi64> {
    %0 = tosa.concat %arg0, %arg1 {axis = 0 : i32} : (tensor<13x21x3xi64>, tensor<13x21x3xi64>) -> tensor<26x21x3xi64>
    return %0 : tensor<26x21x3xi64>
  }
}

// -----
module {
  func.func @test_pad(%arg0: tensor<13x21x3xi64>, %arg1: tensor<1xi64>) -> tensor<15x23x5xi64> {
    %0 = tosa.const_shape  {values = dense<1> : tensor<6xindex>} : () -> !tosa.shape<6>
    %1 = tosa.pad %arg0, %0, %arg1 : (tensor<13x21x3xi64>, !tosa.shape<6>, tensor<1xi64>) -> tensor<15x23x5xi64>
    return %1 : tensor<15x23x5xi64>
  }
}

// -----
module {
  func.func @test_reshape(%arg0: tensor<13x21x3xi64>) -> tensor<1x819xi64> {
    %0 = tosa.const_shape  {values = dense<[1, 819]> : tensor<2xindex>} : () -> !tosa.shape<2>
    %1 = tosa.reshape %arg0, %0 : (tensor<13x21x3xi64>, !tosa.shape<2>) -> tensor<1x819xi64>
    return %1 : tensor<1x819xi64>
  }
}

// -----
module {
  func.func @test_reverse(%arg0: tensor<13x21x3xi64>) -> tensor<13x21x3xi64> {
    %0 = tosa.reverse %arg0 {axis = 0 : i32} : (tensor<13x21x3xi64>) -> tensor<13x21x3xi64>
    return %0 : tensor<13x21x3xi64>
  }
}

// -----
module {
  func.func @test_slice(%arg0: tensor<13x21x3xi64>) -> tensor<4x11x1xi64> {
    %0 = tosa.const_shape  {values = dense<[4, 11, 1]> : tensor<3xindex>} : () -> !tosa.shape<3>
    %1 = tosa.const_shape  {values = dense<[6, 8, 0]> : tensor<3xindex>} : () -> !tosa.shape<3>
    %2 = tosa.slice %arg0, %0, %1 : (tensor<13x21x3xi64>, !tosa.shape<3>, !tosa.shape<3>) -> tensor<4x11x1xi64>
    return %2 : tensor<4x11x1xi64>
  }
}

// -----
module {
  func.func @test_tile(%arg0: tensor<13x21x3xi64>) -> tensor<39x21x6xi64> {
    %0 = tosa.const_shape  {values = dense<[3, 1, 2]> : tensor<3xindex>} : () -> !tosa.shape<3>
    %1 = tosa.tile %arg0, %0 : (tensor<13x21x3xi64>, !tosa.shape<3>) -> tensor<39x21x6xi64>
    return %1 : tensor<39x21x6xi64>
  }
}

// -----
module {
  func.func @test_transpose(%arg0: tensor<13x21x3xi64>) -> tensor<3x13x21xi64> {
    %0 = tosa.transpose %arg0 {perms = array<i32: 2, 0, 1>} : (tensor<13x21x3xi64>) -> tensor<3x13x21xi64>
    return %0 : tensor<3x13x21xi64>
  }
}

// -----
module {
  func.func @test_transition_to_i64(%arg0: tensor<1xi32>) -> tensor<1xi64> {
    %0 = tosa.cast %arg0 : (tensor<1xi32>) -> tensor<1xi64>
    %1 = tosa.identity %0 : (tensor<1xi64>) -> tensor<1xi64>
    %2 = tosa.identity %1 : (tensor<1xi64>) -> tensor<1xi64>
    return %2 : tensor<1xi64>
  }
}

// -----
module {
  func.func @test_transition_from_i64(%arg0: tensor<1xi64>) -> tensor<1xi32> {
    %0 = tosa.identity %arg0 : (tensor<1xi64>) -> tensor<1xi64>
    %1 = tosa.identity %0 : (tensor<1xi64>) -> tensor<1xi64>
    %2 = tosa.cast %1 : (tensor<1xi64>) -> tensor<1xi32>
    return %2 : tensor<1xi32>
  }
}

// -----
module {
  func.func @test_clamp(%arg0: tensor<100xi64>) -> tensor<100xi64> {
    %0 = tosa.clamp %arg0 {max_val = 2147483647 : i64, min_val = -2147483648 : i64} : (tensor<100xi64>) -> tensor<100xi64>
    return %0 : tensor<100xi64>
  }
}

// -----
module {
  func.func @test_clamp_max_outside_i32_range(%arg0: tensor<100xi64>) -> tensor<100xi64> {
    %0 = tosa.clamp %arg0 {max_val = 2147483648 : i64, min_val = -2147483648 : i64} : (tensor<100xi64>) -> tensor<100xi64>
    return %0 : tensor<100xi64>
  }
}

// -----
module {
  func.func @test_clamp_min_outside_i32_range(%arg0: tensor<100xi64>) -> tensor<100xi64> {
    %0 = tosa.clamp %arg0 {max_val = 2147483647 : i64, min_val = -2147483649 : i64} : (tensor<100xi64>) -> tensor<100xi64>
    return %0 : tensor<100xi64>
  }
}

