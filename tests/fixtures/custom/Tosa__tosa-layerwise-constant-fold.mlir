module {
  func.func @armax_fold_dim_size_1(%arg0: tensor<2x1x3xf32>) -> tensor<2x3xi32> {
    %0 = tosa.argmax %arg0 {axis = 1 : i32} : (tensor<2x1x3xf32>) -> tensor<2x3xi32>
    return %0 : tensor<2x3xi32>
  }
}

// -----
module {
  func.func @argmax_dynamic_shape_no_fold_dim_size_1(%arg0: tensor<?x1x3xf32>) -> tensor<?x3xi32> {
    %0 = tosa.argmax %arg0 {axis = 1 : i32} : (tensor<?x1x3xf32>) -> tensor<?x3xi32>
    return %0 : tensor<?x3xi32>
  }
}

// -----
module {
  func.func @transpose_fold(%arg0: tensor<3x4xf32>) -> tensor<3x4xf32> {
    %0 = tosa.transpose %arg0 {perms = array<i32: 0, 1>} : (tensor<3x4xf32>) -> tensor<3x4xf32>
    return %0 : tensor<3x4xf32>
  }
}

// -----
module {
  func.func @transpose_nofold(%arg0: tensor<3x3xf32>) -> tensor<3x3xf32> {
    %0 = tosa.transpose %arg0 {perms = array<i32: 1, 0>} : (tensor<3x3xf32>) -> tensor<3x3xf32>
    return %0 : tensor<3x3xf32>
  }
}

// -----
module {
  func.func @transpose_nofold_shape(%arg0: tensor<3x4xf32>) -> tensor<?x?xf32> {
    %0 = tosa.transpose %arg0 {perms = array<i32: 1, 0>} : (tensor<3x4xf32>) -> tensor<?x?xf32>
    return %0 : tensor<?x?xf32>
  }
}

// -----
module {
  func.func @transpose_nofold_unranked_result_not_reshape(%arg0: tensor<6x7xf32>) -> tensor<*xf32> {
    %0 = tosa.transpose %arg0 {perms = array<i32: 1, 0>} : (tensor<6x7xf32>) -> tensor<*xf32>
    return %0 : tensor<*xf32>
  }
}

// -----
module {
  func.func @reciprocal_nofold_unranked_result() -> tensor<*xf32> {
    %0 = "tosa.const"() <{values = dense<2.000000e+00> : tensor<6x7xf32>}> : () -> tensor<6x7xf32>
    %1 = tosa.reciprocal %0 : (tensor<6x7xf32>) -> tensor<*xf32>
    return %1 : tensor<*xf32>
  }
}

// -----
module {
  func.func @transpose_fold_splat() -> tensor<3x2xf32> {
    %0 = "tosa.const"() <{values = dense<4.000000e+00> : tensor<2x3xf32>}> : () -> tensor<2x3xf32>
    %1 = tosa.transpose %0 {perms = array<i32: 1, 0>} : (tensor<2x3xf32>) -> tensor<3x2xf32>
    return %1 : tensor<3x2xf32>
  }
}

// -----
module {
  func.func @transpose_fold_2d_float() -> tensor<3x2xf32> {
    %0 = "tosa.const"() <{values = dense<[[0.000000e+00, 1.000000e+00, 2.000000e+00], [3.000000e+00, 4.000000e+00, 5.000000e+00]]> : tensor<2x3xf32>}> : () -> tensor<2x3xf32>
    %1 = tosa.transpose %0 {perms = array<i32: 1, 0>} : (tensor<2x3xf32>) -> tensor<3x2xf32>
    return %1 : tensor<3x2xf32>
  }
}

// -----
module {
  func.func @transpose_fold_2d_bool() -> tensor<3x2xi1> {
    %0 = "tosa.const"() <{values = dense<[[true, false, false], [false, false, true]]> : tensor<2x3xi1>}> : () -> tensor<2x3xi1>
    %1 = tosa.transpose %0 {perms = array<i32: 1, 0>} : (tensor<2x3xi1>) -> tensor<3x2xi1>
    return %1 : tensor<3x2xi1>
  }
}

// -----
module {
  func.func @transpose_fold_4d_int() -> tensor<3x1x4x2xi32> {
    %0 = "tosa.const"() <{values = dense<[[[[0, 1, 2, 3], [4, 5, 6, 7], [8, 9, 10, 11]], [[12, 13, 14, 15], [16, 17, 18, 19], [20, 21, 22, 23]]]]> : tensor<1x2x3x4xi32>}> : () -> tensor<1x2x3x4xi32>
    %1 = tosa.transpose %0 {perms = array<i32: 2, 0, 3, 1>} : (tensor<1x2x3x4xi32>) -> tensor<3x1x4x2xi32>
    return %1 : tensor<3x1x4x2xi32>
  }
}

// -----
module {
  func.func @transpose_nofold_non_cst_input(%arg0: tensor<2x3xf32>) -> tensor<3x2xf32> {
    %0 = tosa.transpose %arg0 {perms = array<i32: 1, 0>} : (tensor<2x3xf32>) -> tensor<3x2xf32>
    return %0 : tensor<3x2xf32>
  }
}

// -----
module {
  func.func @transpose_nofold_multi_users() -> (tensor<3x2xf32>, tensor<2x3xf32>) {
    %0 = "tosa.const"() <{values = dense<[[0.000000e+00, 1.000000e+00, 2.000000e+00], [3.000000e+00, 4.000000e+00, 5.000000e+00]]> : tensor<2x3xf32>}> : () -> tensor<2x3xf32>
    %1 = tosa.transpose %0 {perms = array<i32: 1, 0>} : (tensor<2x3xf32>) -> tensor<3x2xf32>
    return %1, %0 : tensor<3x2xf32>, tensor<2x3xf32>
  }
}

// -----
module {
  func.func @transpose_nofold_quantized_types() -> tensor<1x1x2x2x!quant.uniform<i8<-127:127>:f32:3, {1.000000e-01,1.000000e-01}>> {
    %0 = "tosa.const"() <{values = dense<-127> : tensor<2x1x1x2xi8>}> : () -> tensor<2x1x1x2x!quant.uniform<i8<-127:127>:f32:3, {1.000000e-01,1.000000e-01}>>
    %1 = tosa.transpose %0 {perms = array<i32: 1, 2, 3, 0>} : (tensor<2x1x1x2x!quant.uniform<i8<-127:127>:f32:3, {1.000000e-01,1.000000e-01}>>) -> tensor<1x1x2x2x!quant.uniform<i8<-127:127>:f32:3, {1.000000e-01,1.000000e-01}>>
    return %1 : tensor<1x1x2x2x!quant.uniform<i8<-127:127>:f32:3, {1.000000e-01,1.000000e-01}>>
  }
}

// -----
module {
  func.func @transpose_fold_dense_resource() -> tensor<2x2xf32> {
    %0 = "tosa.const"() <{values = dense_resource<resource> : tensor<2x2xf32>}> : () -> tensor<2x2xf32>
    %1 = tosa.transpose %0 {perms = array<i32: 1, 0>} : (tensor<2x2xf32>) -> tensor<2x2xf32>
    return %1 : tensor<2x2xf32>
  }
}

{-#
  dialect_resources: {
    builtin: {
      resource: "0x040000003F800000400000004040000040800000"
    }
  }
#-}

// -----
module {
  func.func @reduce_sum_constant() -> tensor<1x3xi32> {
    %0 = "tosa.const"() <{values = dense<[[1, 2, 3], [4, 5, 6]]> : tensor<2x3xi32>}> : () -> tensor<2x3xi32>
    %1 = tosa.reduce_sum %0 {axis = 0 : i32} : (tensor<2x3xi32>) -> tensor<1x3xi32>
    return %1 : tensor<1x3xi32>
  }
}

// -----
module {
  func.func @reduce_sum_constant() -> tensor<2x1xi32> {
    %0 = "tosa.const"() <{values = dense<[[1, 2, 3], [4, 5, 6]]> : tensor<2x3xi32>}> : () -> tensor<2x3xi32>
    %1 = tosa.reduce_sum %0 {axis = 1 : i32} : (tensor<2x3xi32>) -> tensor<2x1xi32>
    return %1 : tensor<2x1xi32>
  }
}

// -----
module {
  func.func @reduce_sum_constant() -> tensor<3x1xi32> {
    %0 = "tosa.const"() <{values = dense<[[1, 2, 3], [4, 5, 6], [7, 8, 9]]> : tensor<3x3xi32>}> : () -> tensor<3x3xi32>
    %1 = tosa.reduce_sum %0 {axis = 1 : i32} : (tensor<3x3xi32>) -> tensor<3x1xi32>
    return %1 : tensor<3x1xi32>
  }
}

// -----
module {
  func.func @reduce_sum_constant() -> tensor<2x1x4xi32> {
    %0 = "tosa.const"() <{values = dense<[[[1, 2, 3, 4], [5, 6, 7, 8], [9, 10, 11, 12]], [[13, 14, 15, 16], [17, 18, 19, 20], [21, 22, 23, 24]]]> : tensor<2x3x4xi32>}> : () -> tensor<2x3x4xi32>
    %1 = tosa.reduce_sum %0 {axis = 1 : i32} : (tensor<2x3x4xi32>) -> tensor<2x1x4xi32>
    return %1 : tensor<2x1x4xi32>
  }
}

// -----
module {
  func.func @reduce_sum_constant() -> tensor<1x3x3xi32> {
    %0 = "tosa.const"() <{values = dense<[[[1, 2, 3], [4, 5, 6], [7, 8, 9]], [[10, 11, 12], [13, 14, 15], [16, 17, 18]], [[19, 20, 21], [22, 23, 24], [25, 26, 27]]]> : tensor<3x3x3xi32>}> : () -> tensor<3x3x3xi32>
    %1 = tosa.reduce_sum %0 {axis = 0 : i32} : (tensor<3x3x3xi32>) -> tensor<1x3x3xi32>
    return %1 : tensor<1x3x3xi32>
  }
}

// -----
module {
  func.func @reduce_sum_constant() -> tensor<2x2x2x1xi32> {
    %0 = "tosa.const"() <{values = dense<[[[[1, 2], [3, 4]], [[5, 6], [7, 8]]], [[[9, 10], [11, 12]], [[13, 14], [15, 16]]]]> : tensor<2x2x2x2xi32>}> : () -> tensor<2x2x2x2xi32>
    %1 = tosa.reduce_sum %0 {axis = 3 : i32} : (tensor<2x2x2x2xi32>) -> tensor<2x2x2x1xi32>
    return %1 : tensor<2x2x2x1xi32>
  }
}

// -----
module {
  func.func @reduce_sum_constant() -> tensor<1x1x1xi32> {
    %0 = "tosa.const"() <{values = dense<42> : tensor<1x1x1xi32>}> : () -> tensor<1x1x1xi32>
    %1 = tosa.reduce_sum %0 {axis = 0 : i32} : (tensor<1x1x1xi32>) -> tensor<1x1x1xi32>
    return %1 : tensor<1x1x1xi32>
  }
}

// -----
module {
  func.func @reduce_sum_constant() -> tensor<2x3x1x5xi32> {
    %0 = "tosa.const"() <{values = dense<"0x0100000002000000030000000400000005000000060000000700000008000000090000000A0000000B0000000C0000000D0000000E0000000F000000100000001100000012000000130000001400000015000000160000001700000018000000190000001A0000001B0000001C0000001D0000001E0000001F000000200000002100000022000000230000002400000025000000260000002700000028000000290000002A0000002B0000002C0000002D0000002E0000002F000000300000003100000032000000330000003400000035000000360000003700000038000000390000003A0000003B0000003C0000003D0000003E0000003F000000400000004100000042000000430000004400000045000000460000004700000048000000490000004A0000004B0000004C0000004D0000004E0000004F000000500000005100000052000000530000005400000055000000560000005700000058000000590000005A0000005B0000005C0000005D0000005E0000005F000000600000006100000062000000630000006400000065000000660000006700000068000000690000006A0000006B0000006C0000006D0000006E0000006F000000700000007100000072000000730000007400000075000000760000007700000078000000"> : tensor<2x3x4x5xi32>}> : () -> tensor<2x3x4x5xi32>
    %1 = tosa.reduce_sum %0 {axis = 2 : i32} : (tensor<2x3x4x5xi32>) -> tensor<2x3x1x5xi32>
    return %1 : tensor<2x3x1x5xi32>
  }
}

// -----
module {
  func.func @reduce_prod_constant() -> tensor<1x3xi32> {
    %0 = "tosa.const"() <{values = dense<[[1, 2, 3], [4, 5, 6]]> : tensor<2x3xi32>}> : () -> tensor<2x3xi32>
    %1 = tosa.reduce_product %0 {axis = 0 : i32} : (tensor<2x3xi32>) -> tensor<1x3xi32>
    return %1 : tensor<1x3xi32>
  }
}

// -----
module {
  func.func @reduce_prod_constant() -> tensor<2x1xi32> {
    %0 = "tosa.const"() <{values = dense<[[1, 2, 3], [4, 5, 6]]> : tensor<2x3xi32>}> : () -> tensor<2x3xi32>
    %1 = tosa.reduce_product %0 {axis = 1 : i32} : (tensor<2x3xi32>) -> tensor<2x1xi32>
    return %1 : tensor<2x1xi32>
  }
}

// -----
module {
  func.func @reduce_prod_constant() -> tensor<3x1xi32> {
    %0 = "tosa.const"() <{values = dense<[[1, 2, 3], [4, 5, 6], [7, 8, 9]]> : tensor<3x3xi32>}> : () -> tensor<3x3xi32>
    %1 = tosa.reduce_product %0 {axis = 1 : i32} : (tensor<3x3xi32>) -> tensor<3x1xi32>
    return %1 : tensor<3x1xi32>
  }
}

// -----
module {
  func.func @reduce_prod_constant() -> tensor<2x1x4xi32> {
    %0 = "tosa.const"() <{values = dense<[[[1, 2, 3, 4], [5, 6, 7, 8], [9, 10, 11, 12]], [[13, 14, 15, 16], [17, 18, 19, 20], [21, 22, 23, 24]]]> : tensor<2x3x4xi32>}> : () -> tensor<2x3x4xi32>
    %1 = tosa.reduce_product %0 {axis = 1 : i32} : (tensor<2x3x4xi32>) -> tensor<2x1x4xi32>
    return %1 : tensor<2x1x4xi32>
  }
}

// -----
module {
  func.func @reduce_prod_constant() -> tensor<1x3x3xi32> {
    %0 = "tosa.const"() <{values = dense<[[[1, 2, 3], [4, 5, 6], [7, 8, 9]], [[10, 11, 12], [13, 14, 15], [16, 17, 18]], [[19, 20, 21], [22, 23, 24], [25, 26, 27]]]> : tensor<3x3x3xi32>}> : () -> tensor<3x3x3xi32>
    %1 = tosa.reduce_product %0 {axis = 0 : i32} : (tensor<3x3x3xi32>) -> tensor<1x3x3xi32>
    return %1 : tensor<1x3x3xi32>
  }
}

// -----
module {
  func.func @reduce_prod_constant() -> tensor<2x2x2x1xi32> {
    %0 = "tosa.const"() <{values = dense<[[[[1, 2], [3, 4]], [[5, 6], [7, 8]]], [[[9, 10], [11, 12]], [[13, 14], [15, 16]]]]> : tensor<2x2x2x2xi32>}> : () -> tensor<2x2x2x2xi32>
    %1 = tosa.reduce_product %0 {axis = 3 : i32} : (tensor<2x2x2x2xi32>) -> tensor<2x2x2x1xi32>
    return %1 : tensor<2x2x2x1xi32>
  }
}

// -----
module {
  func.func @reduce_prod_constant() -> tensor<1x1x1xi32> {
    %0 = "tosa.const"() <{values = dense<42> : tensor<1x1x1xi32>}> : () -> tensor<1x1x1xi32>
    %1 = tosa.reduce_product %0 {axis = 0 : i32} : (tensor<1x1x1xi32>) -> tensor<1x1x1xi32>
    return %1 : tensor<1x1x1xi32>
  }
}

// -----
module {
  func.func @reduce_max_constant() -> tensor<1x3xi32> {
    %0 = "tosa.const"() <{values = dense<[[1, 2, 3], [4, 5, 6]]> : tensor<2x3xi32>}> : () -> tensor<2x3xi32>
    %1 = tosa.reduce_max %0 {axis = 0 : i32} : (tensor<2x3xi32>) -> tensor<1x3xi32>
    return %1 : tensor<1x3xi32>
  }
}

// -----
module {
  func.func @reduce_max_constant() -> tensor<2x1xi32> {
    %0 = "tosa.const"() <{values = dense<[[1, 2, 3], [4, 5, 6]]> : tensor<2x3xi32>}> : () -> tensor<2x3xi32>
    %1 = tosa.reduce_max %0 {axis = 1 : i32} : (tensor<2x3xi32>) -> tensor<2x1xi32>
    return %1 : tensor<2x1xi32>
  }
}

// -----
module {
  func.func @reduce_max_constant() -> tensor<3x1xi32> {
    %0 = "tosa.const"() <{values = dense<[[1, 2, 3], [4, 5, 6], [7, 8, 9]]> : tensor<3x3xi32>}> : () -> tensor<3x3xi32>
    %1 = tosa.reduce_max %0 {axis = 1 : i32} : (tensor<3x3xi32>) -> tensor<3x1xi32>
    return %1 : tensor<3x1xi32>
  }
}

// -----
module {
  func.func @reduce_max_constant() -> tensor<2x1x4xi32> {
    %0 = "tosa.const"() <{values = dense<[[[1, 2, 3, 4], [5, 6, 7, 8], [9, 10, 11, 12]], [[13, 14, 15, 16], [17, 18, 19, 20], [21, 22, 23, 24]]]> : tensor<2x3x4xi32>}> : () -> tensor<2x3x4xi32>
    %1 = tosa.reduce_max %0 {axis = 1 : i32} : (tensor<2x3x4xi32>) -> tensor<2x1x4xi32>
    return %1 : tensor<2x1x4xi32>
  }
}

// -----
module {
  func.func @reduce_max_constant() -> tensor<1x3x3xi32> {
    %0 = "tosa.const"() <{values = dense<[[[1, 2, 3], [4, 5, 6], [7, 8, 9]], [[10, 11, 12], [13, 14, 15], [16, 17, 18]], [[19, 20, 21], [22, 23, 24], [25, 26, 27]]]> : tensor<3x3x3xi32>}> : () -> tensor<3x3x3xi32>
    %1 = tosa.reduce_max %0 {axis = 0 : i32} : (tensor<3x3x3xi32>) -> tensor<1x3x3xi32>
    return %1 : tensor<1x3x3xi32>
  }
}

// -----
module {
  func.func @reduce_max_constant() -> tensor<2x2x2x1xi32> {
    %0 = "tosa.const"() <{values = dense<[[[[1, 2], [3, 4]], [[5, 6], [7, 8]]], [[[9, 10], [11, 12]], [[13, 14], [15, 16]]]]> : tensor<2x2x2x2xi32>}> : () -> tensor<2x2x2x2xi32>
    %1 = tosa.reduce_max %0 {axis = 3 : i32} : (tensor<2x2x2x2xi32>) -> tensor<2x2x2x1xi32>
    return %1 : tensor<2x2x2x1xi32>
  }
}

// -----
module {
  func.func @reduce_max_constant() -> tensor<1x1x1xi32> {
    %0 = "tosa.const"() <{values = dense<42> : tensor<1x1x1xi32>}> : () -> tensor<1x1x1xi32>
    %1 = tosa.reduce_max %0 {axis = 0 : i32} : (tensor<1x1x1xi32>) -> tensor<1x1x1xi32>
    return %1 : tensor<1x1x1xi32>
  }
}

// -----
module {
  func.func @reduce_max_constant_no_overflow() -> tensor<1xi8> {
    %0 = "tosa.const"() <{values = dense<[-127, 120, -126]> : tensor<3xi8>}> : () -> tensor<3xi8>
    %1 = tosa.reduce_max %0 {axis = 0 : i32} : (tensor<3xi8>) -> tensor<1xi8>
    return %1 : tensor<1xi8>
  }
}

// -----
module {
  func.func @reduce_min_constant() -> tensor<1x3xi32> {
    %0 = "tosa.const"() <{values = dense<[[1, 2, 3], [4, 5, 6]]> : tensor<2x3xi32>}> : () -> tensor<2x3xi32>
    %1 = tosa.reduce_min %0 {axis = 0 : i32} : (tensor<2x3xi32>) -> tensor<1x3xi32>
    return %1 : tensor<1x3xi32>
  }
}

// -----
module {
  func.func @reduce_min_constant() -> tensor<2x1xi32> {
    %0 = "tosa.const"() <{values = dense<[[1, 2, 3], [4, 5, 6]]> : tensor<2x3xi32>}> : () -> tensor<2x3xi32>
    %1 = tosa.reduce_min %0 {axis = 1 : i32} : (tensor<2x3xi32>) -> tensor<2x1xi32>
    return %1 : tensor<2x1xi32>
  }
}

// -----
module {
  func.func @reduce_min_constant() -> tensor<3x1xi32> {
    %0 = "tosa.const"() <{values = dense<[[1, 2, 3], [4, 5, 6], [7, 8, 9]]> : tensor<3x3xi32>}> : () -> tensor<3x3xi32>
    %1 = tosa.reduce_min %0 {axis = 1 : i32} : (tensor<3x3xi32>) -> tensor<3x1xi32>
    return %1 : tensor<3x1xi32>
  }
}

// -----
module {
  func.func @reduce_min_constant() -> tensor<2x1x4xi32> {
    %0 = "tosa.const"() <{values = dense<[[[1, 2, 3, 4], [5, 6, 7, 8], [9, 10, 11, 12]], [[13, 14, 15, 16], [17, 18, 19, 20], [21, 22, 23, 24]]]> : tensor<2x3x4xi32>}> : () -> tensor<2x3x4xi32>
    %1 = tosa.reduce_min %0 {axis = 1 : i32} : (tensor<2x3x4xi32>) -> tensor<2x1x4xi32>
    return %1 : tensor<2x1x4xi32>
  }
}

// -----
module {
  func.func @reduce_min_constant() -> tensor<1x3x3xi32> {
    %0 = "tosa.const"() <{values = dense<[[[1, 2, 3], [4, 5, 6], [7, 8, 9]], [[10, 11, 12], [13, 14, 15], [16, 17, 18]], [[19, 20, 21], [22, 23, 24], [25, 26, 27]]]> : tensor<3x3x3xi32>}> : () -> tensor<3x3x3xi32>
    %1 = tosa.reduce_min %0 {axis = 0 : i32} : (tensor<3x3x3xi32>) -> tensor<1x3x3xi32>
    return %1 : tensor<1x3x3xi32>
  }
}

// -----
module {
  func.func @reduce_min_constant() -> tensor<2x2x2x1xi32> {
    %0 = "tosa.const"() <{values = dense<[[[[1, 2], [3, 4]], [[5, 6], [7, 8]]], [[[9, 10], [11, 12]], [[13, 14], [15, 16]]]]> : tensor<2x2x2x2xi32>}> : () -> tensor<2x2x2x2xi32>
    %1 = tosa.reduce_min %0 {axis = 3 : i32} : (tensor<2x2x2x2xi32>) -> tensor<2x2x2x1xi32>
    return %1 : tensor<2x2x2x1xi32>
  }
}

// -----
module {
  func.func @reduce_min_constant() -> tensor<1x1x1xi32> {
    %0 = "tosa.const"() <{values = dense<42> : tensor<1x1x1xi32>}> : () -> tensor<1x1x1xi32>
    %1 = tosa.reduce_min %0 {axis = 0 : i32} : (tensor<1x1x1xi32>) -> tensor<1x1x1xi32>
    return %1 : tensor<1x1x1xi32>
  }
}

// -----
module {
  func.func @reduce_min_constant_no_overflow() -> tensor<1xi8> {
    %0 = "tosa.const"() <{values = dense<[-127, 120, -126]> : tensor<3xi8>}> : () -> tensor<3xi8>
    %1 = tosa.reduce_min %0 {axis = 0 : i32} : (tensor<3xi8>) -> tensor<1xi8>
    return %1 : tensor<1xi8>
  }
}

// -----
module {
  func.func @reduce_any_constant() -> tensor<1x3xi1> {
    %0 = "tosa.const"() <{values = dense<[[true, true, true], [true, false, true]]> : tensor<2x3xi1>}> : () -> tensor<2x3xi1>
    %1 = tosa.reduce_any %0 {axis = 0 : i32} : (tensor<2x3xi1>) -> tensor<1x3xi1>
    return %1 : tensor<1x3xi1>
  }
}

// -----
module {
  func.func @reduce_any_constant() -> tensor<2x1xi1> {
    %0 = "tosa.const"() <{values = dense<[[true, true, true], [true, false, true]]> : tensor<2x3xi1>}> : () -> tensor<2x3xi1>
    %1 = tosa.reduce_any %0 {axis = 1 : i32} : (tensor<2x3xi1>) -> tensor<2x1xi1>
    return %1 : tensor<2x1xi1>
  }
}

// -----
module {
  func.func @reduce_any_constant() -> tensor<3x1xi1> {
    %0 = "tosa.const"() <{values = dense<[[true, false, false], [false, false, false], [false, false, true]]> : tensor<3x3xi1>}> : () -> tensor<3x3xi1>
    %1 = tosa.reduce_any %0 {axis = 1 : i32} : (tensor<3x3xi1>) -> tensor<3x1xi1>
    return %1 : tensor<3x1xi1>
  }
}

// -----
module {
  func.func @reduce_any_constant() -> tensor<2x1x4xi1> {
    %0 = "tosa.const"() <{values = dense<[[[true, false, false, true], [false, false, true, false], [true, false, true, true]], [[false, false, false, false], [false, false, true, false], [true, false, true, false]]]> : tensor<2x3x4xi1>}> : () -> tensor<2x3x4xi1>
    %1 = tosa.reduce_any %0 {axis = 1 : i32} : (tensor<2x3x4xi1>) -> tensor<2x1x4xi1>
    return %1 : tensor<2x1x4xi1>
  }
}

// -----
module {
  func.func @reduce_all_constant() -> tensor<1x3xi1> {
    %0 = "tosa.const"() <{values = dense<[[true, true, true], [true, false, true]]> : tensor<2x3xi1>}> : () -> tensor<2x3xi1>
    %1 = tosa.reduce_all %0 {axis = 0 : i32} : (tensor<2x3xi1>) -> tensor<1x3xi1>
    return %1 : tensor<1x3xi1>
  }
}

// -----
module {
  func.func @reduce_all_constant() -> tensor<2x1xi1> {
    %0 = "tosa.const"() <{values = dense<[[true, true, true], [true, false, true]]> : tensor<2x3xi1>}> : () -> tensor<2x3xi1>
    %1 = tosa.reduce_all %0 {axis = 1 : i32} : (tensor<2x3xi1>) -> tensor<2x1xi1>
    return %1 : tensor<2x1xi1>
  }
}

// -----
module {
  func.func @reduce_all_constant() -> tensor<3x1xi1> {
    %0 = "tosa.const"() <{values = dense<[[true, false, false], [false, false, false], [false, false, true]]> : tensor<3x3xi1>}> : () -> tensor<3x3xi1>
    %1 = tosa.reduce_all %0 {axis = 1 : i32} : (tensor<3x3xi1>) -> tensor<3x1xi1>
    return %1 : tensor<3x1xi1>
  }
}

// -----
module {
  func.func @reduce_all_constant() -> tensor<2x1x4xi1> {
    %0 = "tosa.const"() <{values = dense<[[[true, false, false, true], [false, false, true, false], [true, false, true, true]], [[false, false, false, false], [false, false, true, false], [true, false, true, false]]]> : tensor<2x3x4xi1>}> : () -> tensor<2x3x4xi1>
    %1 = tosa.reduce_all %0 {axis = 1 : i32} : (tensor<2x3x4xi1>) -> tensor<2x1x4xi1>
    return %1 : tensor<2x1x4xi1>
  }
}

// -----
module {
  func.func @reduce_sum_constant() -> tensor<1x3xi32> {
    %0 = "tosa.const"() <{values = dense<1> : tensor<2x3xi32>}> : () -> tensor<2x3xi32>
    %1 = tosa.reduce_sum %0 {axis = 0 : i32} : (tensor<2x3xi32>) -> tensor<1x3xi32>
    return %1 : tensor<1x3xi32>
  }
}

// -----
module {
  func.func @reduce_sum_constant() -> tensor<1x3xi32> {
    %0 = "tosa.const"() <{values = dense<[[1, 2, 3], [4, 5, 6]]> : tensor<2x3xi32>}> : () -> tensor<2x3xi32>
    %1 = "tosa.const"() <{values = dense<[[1, 2, 3], [4, 5, 7]]> : tensor<2x3xi32>}> : () -> tensor<2x3xi32>
    %2 = tosa.add %0, %1 : (tensor<2x3xi32>, tensor<2x3xi32>) -> tensor<2x3xi32>
    %3 = tosa.reduce_sum %2 {axis = 0 : i32} : (tensor<2x3xi32>) -> tensor<1x3xi32>
    return %3 : tensor<1x3xi32>
  }
}

// -----
module {
  func.func @reduce_sum_constant_aggressive() -> tensor<1x3xi32> {
    %0 = "tosa.const"() <{values = dense<1> : tensor<2x3xi32>}> : () -> tensor<2x3xi32>
    %1 = tosa.reduce_sum %0 {axis = 0 : i32} : (tensor<2x3xi32>) -> tensor<1x3xi32>
    %2 = tosa.reduce_sum %0 {axis = 0 : i32} : (tensor<2x3xi32>) -> tensor<1x3xi32>
    %3 = tosa.add %1, %2 : (tensor<1x3xi32>, tensor<1x3xi32>) -> tensor<1x3xi32>
    return %3 : tensor<1x3xi32>
  }
}

// -----
module {
  func.func @reduce_sum_constant_aggressive() -> tensor<2x3xi32> {
    %0 = "tosa.const"() <{values = dense<1> : tensor<2x2x3xi32>}> : () -> tensor<2x2x3xi32>
    %1 = "tosa.const"() <{values = dense<2> : tensor<2x3xi32>}> : () -> tensor<2x3xi32>
    %2 = tosa.reduce_sum %0 {axis = 0 : i32} : (tensor<2x2x3xi32>) -> tensor<1x2x3xi32>
    %3 = tosa.argmax %2 {axis = 1 : i32} : (tensor<1x2x3xi32>) -> tensor<1x3xi32>
    %4 = tosa.argmax %0 {axis = 0 : i32} : (tensor<2x2x3xi32>) -> tensor<2x3xi32>
    %5 = tosa.add %3, %1 : (tensor<1x3xi32>, tensor<2x3xi32>) -> tensor<2x3xi32>
    %6 = tosa.add %5, %4 : (tensor<2x3xi32>, tensor<2x3xi32>) -> tensor<2x3xi32>
    return %6 : tensor<2x3xi32>
  }
}

