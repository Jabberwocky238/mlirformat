module {
}

// -----
module {
  func.func @test_rescale_output_unsigned(%arg0: tensor<1x1xi8>) -> tensor<1x1xui8> {
    %0 = "tosa.const"() <{values = dense<1> : tensor<1xi8>}> : () -> tensor<1xi8>
    %1 = "tosa.const"() <{values = dense<2> : tensor<1xi32>}> : () -> tensor<1xi32>
    %2 = "tosa.const"() <{values = dense<3> : tensor<1xi8>}> : () -> tensor<1xi8>
    %3 = "tosa.const"() <{values = dense<-128> : tensor<1xi8>}> : () -> tensor<1xi8>
    %4 = tosa.rescale %arg0, %1, %0, %3, %2 {input_unsigned = false, output_unsigned = true, per_channel = false, rounding_mode = SINGLE_ROUND, scale32 = true} : (tensor<1x1xi8>, tensor<1xi32>, tensor<1xi8>, tensor<1xi8>, tensor<1xi8>) -> tensor<1x1xui8>
    return %4 : tensor<1x1xui8>
  }
}

// -----
module {
  func.func @test_rescale_input_unsigned(%arg0: tensor<1x1xui16>) -> tensor<1x1xi8> {
    %0 = "tosa.const"() <{values = dense<1> : tensor<1xi8>}> : () -> tensor<1xi8>
    %1 = "tosa.const"() <{values = dense<2> : tensor<1xi32>}> : () -> tensor<1xi32>
    %2 = "tosa.const"() <{values = dense<3> : tensor<1xi8>}> : () -> tensor<1xi8>
    %3 = "tosa.const"() <{values = dense<-32768> : tensor<1xi16>}> : () -> tensor<1xi16>
    %4 = tosa.rescale %arg0, %1, %0, %3, %2 {input_unsigned = true, output_unsigned = false, per_channel = false, rounding_mode = SINGLE_ROUND, scale32 = true} : (tensor<1x1xui16>, tensor<1xi32>, tensor<1xi8>, tensor<1xi16>, tensor<1xi8>) -> tensor<1x1xi8>
    return %4 : tensor<1x1xi8>
  }
}

// -----
module {
  func.func @test_rescale_unsigned_zp(%arg0: tensor<1x1xui8>) -> tensor<1x1xi8> {
    %0 = "tosa.const"() <{values = dense<2> : tensor<1xi32>}> : () -> tensor<1xi32>
    %1 = "tosa.const"() <{values = dense<1> : tensor<1xi8>}> : () -> tensor<1xi8>
    %2 = "tosa.const"() <{values = dense<254> : tensor<1xui8>}> : () -> tensor<1xui8>
    %3 = "tosa.const"() <{values = dense<2> : tensor<1xi8>}> : () -> tensor<1xi8>
    %4 = tosa.rescale %arg0, %0, %1, %2, %3 {input_unsigned = true, output_unsigned = false, per_channel = false, rounding_mode = SINGLE_ROUND, scale32 = true} : (tensor<1x1xui8>, tensor<1xi32>, tensor<1xi8>, tensor<1xui8>, tensor<1xi8>) -> tensor<1x1xi8>
    return %4 : tensor<1x1xi8>
  }
}

// -----
module {
  func.func @test_unsigned_function_signature(%arg0: tensor<1xui8>, %arg1: tensor<1xui8>) -> (tensor<1xui8>, tensor<1xui8>) {
    return %arg0, %arg1 : tensor<1xui8>, tensor<1xui8>
  }
}

// -----
module {
  func.func @test_unsigned_const_data() -> tensor<5xui8> {
    %0 = "tosa.const"() <{values = dense<[255, 254, 0, 1, 128]> : tensor<5xui8>}> : () -> tensor<5xui8>
    return %0 : tensor<5xui8>
  }
}

// -----
module {
  func.func @test_unsigned_const_data_i16() -> tensor<5xui16> {
    %0 = "tosa.const"() <{values = dense<[65535, 65534, 0, 1, 32768]> : tensor<5xui16>}> : () -> tensor<5xui16>
    return %0 : tensor<5xui16>
  }
}

// -----
module {
  func.func @test_unsigned_const_data_i32() -> tensor<5xui32> {
    %0 = "tosa.const"() <{values = dense<[4294967295, 4294967294, 0, 1, 2147483648]> : tensor<5xui32>}> : () -> tensor<5xui32>
    return %0 : tensor<5xui32>
  }
}

// -----
module {
  func.func @test_unsigned_const_data_i48() -> tensor<5xui48> {
    %0 = "tosa.const"() <{values = dense<[281474976710655, 281474976710654, 0, 1, 140737488355328]> : tensor<5xui48>}> : () -> tensor<5xui48>
    return %0 : tensor<5xui48>
  }
}

// -----
module {
  func.func @test_no_change(%arg0: tensor<13x21x3xi8>) -> tensor<13x21x3xi8> {
    %0 = tosa.reverse %arg0 {axis = 0 : i32} : (tensor<13x21x3xi8>) -> tensor<13x21x3xi8>
    return %0 : tensor<13x21x3xi8>
  }
}

// -----
module {
  func.func @test_regions(%arg0: tensor<ui8>, %arg1: tensor<ui8>, %arg2: tensor<i1>) -> tensor<ui8> {
    %0 = tosa.cond_if %arg2 (%arg3 = %arg0, %arg4 = %arg1) : tensor<i1> (tensor<ui8>, tensor<ui8>) -> tensor<ui8> {
    ^bb0(%arg3: tensor<ui8>, %arg4: tensor<ui8>):
      %1 = tosa.add %arg0, %arg1 : (tensor<ui8>, tensor<ui8>) -> tensor<ui8>
      tosa.yield %1 : tensor<ui8>
    } else {
    ^bb0(%arg3: tensor<ui8>, %arg4: tensor<ui8>):
      %1 = tosa.sub %arg0, %arg1 : (tensor<ui8>, tensor<ui8>) -> tensor<ui8>
      tosa.yield %1 : tensor<ui8>
    }
    return %0 : tensor<ui8>
  }
}

