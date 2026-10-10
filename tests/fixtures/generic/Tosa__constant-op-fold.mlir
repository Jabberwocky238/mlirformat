"builtin.module"() ({
  "func.func"() <{function_type = (tensor<2x1x3xf32>) -> tensor<2x3xi32>, sym_name = "armax_fold_dim_size_1"}> ({
  ^bb0(%arg5: tensor<2x1x3xf32>):
    %19 = "tosa.argmax"(%arg5) <{axis = 1 : i32, nan_mode = #tosa.nan_mode<PROPAGATE>}> : (tensor<2x1x3xf32>) -> tensor<2x3xi32>
    "func.return"(%19) : (tensor<2x3xi32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<?x1x3xf32>) -> tensor<?x3xi32>, sym_name = "argmax_dynamic_shape_no_fold_dim_size_1"}> ({
  ^bb0(%arg4: tensor<?x1x3xf32>):
    %18 = "tosa.argmax"(%arg4) <{axis = 1 : i32, nan_mode = #tosa.nan_mode<PROPAGATE>}> : (tensor<?x1x3xf32>) -> tensor<?x3xi32>
    "func.return"(%18) : (tensor<?x3xi32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<3x4xf32>) -> tensor<3x4xf32>, sym_name = "transpose_fold"}> ({
  ^bb0(%arg3: tensor<3x4xf32>):
    %17 = "tosa.transpose"(%arg3) <{perms = array<i32: 0, 1>}> : (tensor<3x4xf32>) -> tensor<3x4xf32>
    "func.return"(%17) : (tensor<3x4xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<3x3xf32>) -> tensor<3x3xf32>, sym_name = "transpose_nofold"}> ({
  ^bb0(%arg2: tensor<3x3xf32>):
    %16 = "tosa.transpose"(%arg2) <{perms = array<i32: 1, 0>}> : (tensor<3x3xf32>) -> tensor<3x3xf32>
    "func.return"(%16) : (tensor<3x3xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<3x4xf32>) -> tensor<?x?xf32>, sym_name = "transpose_nofold_shape"}> ({
  ^bb0(%arg1: tensor<3x4xf32>):
    %15 = "tosa.transpose"(%arg1) <{perms = array<i32: 1, 0>}> : (tensor<3x4xf32>) -> tensor<?x?xf32>
    "func.return"(%15) : (tensor<?x?xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> tensor<3x2xf32>, sym_name = "transpose_fold_splat"}> ({
    %13 = "tosa.const"() <{values = dense<4.000000e+00> : tensor<2x3xf32>}> : () -> tensor<2x3xf32>
    %14 = "tosa.transpose"(%13) <{perms = array<i32: 1, 0>}> : (tensor<2x3xf32>) -> tensor<3x2xf32>
    "func.return"(%14) : (tensor<3x2xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> tensor<3x2xf32>, sym_name = "transpose_fold_2d_float"}> ({
    %11 = "tosa.const"() <{values = dense<[[0.000000e+00, 1.000000e+00, 2.000000e+00], [3.000000e+00, 4.000000e+00, 5.000000e+00]]> : tensor<2x3xf32>}> : () -> tensor<2x3xf32>
    %12 = "tosa.transpose"(%11) <{perms = array<i32: 1, 0>}> : (tensor<2x3xf32>) -> tensor<3x2xf32>
    "func.return"(%12) : (tensor<3x2xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> tensor<3x2xi1>, sym_name = "transpose_fold_2d_bool"}> ({
    %9 = "tosa.const"() <{values = dense<[[true, false, false], [false, false, true]]> : tensor<2x3xi1>}> : () -> tensor<2x3xi1>
    %10 = "tosa.transpose"(%9) <{perms = array<i32: 1, 0>}> : (tensor<2x3xi1>) -> tensor<3x2xi1>
    "func.return"(%10) : (tensor<3x2xi1>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> tensor<3x1x4x2xi32>, sym_name = "transpose_fold_4d_int"}> ({
    %7 = "tosa.const"() <{values = dense<[[[[0, 1, 2, 3], [4, 5, 6, 7], [8, 9, 10, 11]], [[12, 13, 14, 15], [16, 17, 18, 19], [20, 21, 22, 23]]]]> : tensor<1x2x3x4xi32>}> : () -> tensor<1x2x3x4xi32>
    %8 = "tosa.transpose"(%7) <{perms = array<i32: 2, 0, 3, 1>}> : (tensor<1x2x3x4xi32>) -> tensor<3x1x4x2xi32>
    "func.return"(%8) : (tensor<3x1x4x2xi32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<2x3xf32>) -> tensor<3x2xf32>, sym_name = "transpose_nofold_non_cst_input"}> ({
  ^bb0(%arg0: tensor<2x3xf32>):
    %6 = "tosa.transpose"(%arg0) <{perms = array<i32: 1, 0>}> : (tensor<2x3xf32>) -> tensor<3x2xf32>
    "func.return"(%6) : (tensor<3x2xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (tensor<3x2xf32>, tensor<2x3xf32>), sym_name = "transpose_nofold_multi_users"}> ({
    %4 = "tosa.const"() <{values = dense<[[0.000000e+00, 1.000000e+00, 2.000000e+00], [3.000000e+00, 4.000000e+00, 5.000000e+00]]> : tensor<2x3xf32>}> : () -> tensor<2x3xf32>
    %5 = "tosa.transpose"(%4) <{perms = array<i32: 1, 0>}> : (tensor<2x3xf32>) -> tensor<3x2xf32>
    "func.return"(%5, %4) : (tensor<3x2xf32>, tensor<2x3xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> tensor<1x1x2x2x!quant.uniform<i8<-127:127>:f32:3, {1.000000e-01,1.000000e-01}>>, sym_name = "transpose_nofold_quantized_types"}> ({
    %2 = "tosa.const"() <{values = dense<-127> : tensor<2x1x1x2xi8>}> : () -> tensor<2x1x1x2x!quant.uniform<i8<-127:127>:f32:3, {1.000000e-01,1.000000e-01}>>
    %3 = "tosa.transpose"(%2) <{perms = array<i32: 1, 2, 3, 0>}> : (tensor<2x1x1x2x!quant.uniform<i8<-127:127>:f32:3, {1.000000e-01,1.000000e-01}>>) -> tensor<1x1x2x2x!quant.uniform<i8<-127:127>:f32:3, {1.000000e-01,1.000000e-01}>>
    "func.return"(%3) : (tensor<1x1x2x2x!quant.uniform<i8<-127:127>:f32:3, {1.000000e-01,1.000000e-01}>>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> tensor<2x2xf32>, sym_name = "transpose_fold_dense_resource"}> ({
    %0 = "tosa.const"() <{values = dense_resource<resource> : tensor<2x2xf32>}> : () -> tensor<2x2xf32>
    %1 = "tosa.transpose"(%0) <{perms = array<i32: 1, 0>}> : (tensor<2x2xf32>) -> tensor<2x2xf32>
    "func.return"(%1) : (tensor<2x2xf32>) -> ()
  }) : () -> ()
}) : () -> ()

{-#
  dialect_resources: {
    builtin: {
      resource: "0x040000003F800000400000004040000040800000"
    }
  }
#-}

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<f32>) -> tensor<f32>, sym_name = "fold_add_zero_rhs_f32"}> ({
  ^bb0(%arg0: tensor<f32>):
    %0 = "tosa.const"() <{values = dense<0.000000e+00> : tensor<f32>}> : () -> tensor<f32>
    %1 = "tosa.add"(%arg0, %0) : (tensor<f32>, tensor<f32>) -> tensor<f32>
    "func.return"(%1) : (tensor<f32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<f32>) -> tensor<f32>, sym_name = "fold_add_zero_lhs_f32"}> ({
  ^bb0(%arg0: tensor<f32>):
    %0 = "tosa.const"() <{values = dense<0.000000e+00> : tensor<f32>}> : () -> tensor<f32>
    %1 = "tosa.add"(%0, %arg0) : (tensor<f32>, tensor<f32>) -> tensor<f32>
    "func.return"(%1) : (tensor<f32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<i32>) -> tensor<i32>, sym_name = "fold_add_zero_rhs_i32"}> ({
  ^bb0(%arg0: tensor<i32>):
    %0 = "tosa.const"() <{values = dense<0> : tensor<i32>}> : () -> tensor<i32>
    %1 = "tosa.add"(%arg0, %0) : (tensor<i32>, tensor<i32>) -> tensor<i32>
    "func.return"(%1) : (tensor<i32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<i32>) -> tensor<i32>, sym_name = "fold_add_zero_lhs_i32"}> ({
  ^bb0(%arg0: tensor<i32>):
    %0 = "tosa.const"() <{values = dense<0> : tensor<i32>}> : () -> tensor<i32>
    %1 = "tosa.add"(%0, %arg0) : (tensor<i32>, tensor<i32>) -> tensor<i32>
    "func.return"(%1) : (tensor<i32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> tensor<10xi32>, sym_name = "fold_add_splat_i32"}> ({
    %0 = "tosa.const"() <{values = dense<1> : tensor<10xi32>}> : () -> tensor<10xi32>
    %1 = "tosa.const"() <{values = dense<2> : tensor<10xi32>}> : () -> tensor<10xi32>
    %2 = "tosa.add"(%0, %1) : (tensor<10xi32>, tensor<10xi32>) -> tensor<10xi32>
    "func.return"(%2) : (tensor<10xi32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> tensor<10xf32>, sym_name = "fold_add_splat_f32"}> ({
    %0 = "tosa.const"() <{values = dense<1.000000e+00> : tensor<10xf32>}> : () -> tensor<10xf32>
    %1 = "tosa.const"() <{values = dense<2.000000e+00> : tensor<10xf32>}> : () -> tensor<10xf32>
    %2 = "tosa.add"(%0, %1) : (tensor<10xf32>, tensor<10xf32>) -> tensor<10xf32>
    "func.return"(%2) : (tensor<10xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<i32>) -> tensor<i32>, sym_name = "fold_div_zero_lhs_i32"}> ({
  ^bb0(%arg0: tensor<i32>):
    %0 = "tosa.const"() <{values = dense<0> : tensor<i32>}> : () -> tensor<i32>
    %1 = "tosa.intdiv"(%0, %arg0) : (tensor<i32>, tensor<i32>) -> tensor<i32>
    "func.return"(%1) : (tensor<i32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<i32>) -> tensor<i32>, sym_name = "fold_div_one_rhs_i32"}> ({
  ^bb0(%arg0: tensor<i32>):
    %0 = "tosa.const"() <{values = dense<1> : tensor<i32>}> : () -> tensor<i32>
    %1 = "tosa.intdiv"(%arg0, %0) : (tensor<i32>, tensor<i32>) -> tensor<i32>
    "func.return"(%1) : (tensor<i32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> tensor<i32>, sym_name = "fold_div_splat_i32"}> ({
    %0 = "tosa.const"() <{values = dense<10> : tensor<i32>}> : () -> tensor<i32>
    %1 = "tosa.const"() <{values = dense<-3> : tensor<i32>}> : () -> tensor<i32>
    %2 = "tosa.intdiv"(%0, %1) : (tensor<i32>, tensor<i32>) -> tensor<i32>
    "func.return"(%2) : (tensor<i32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<f32>) -> tensor<f32>, sym_name = "fold_mul_zero_rhs_f32"}> ({
  ^bb0(%arg0: tensor<f32>):
    %0 = "tosa.const"() <{values = dense<0.000000e+00> : tensor<f32>}> : () -> tensor<f32>
    %1 = "tosa.const"() <{values = dense<0> : tensor<1xi8>}> : () -> tensor<1xi8>
    %2 = "tosa.mul"(%arg0, %0, %1) : (tensor<f32>, tensor<f32>, tensor<1xi8>) -> tensor<f32>
    "func.return"(%2) : (tensor<f32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<f32>) -> tensor<f32>, sym_name = "fold_mul_zero_lhs_f32"}> ({
  ^bb0(%arg0: tensor<f32>):
    %0 = "tosa.const"() <{values = dense<0.000000e+00> : tensor<f32>}> : () -> tensor<f32>
    %1 = "tosa.const"() <{values = dense<0> : tensor<1xi8>}> : () -> tensor<1xi8>
    %2 = "tosa.mul"(%0, %arg0, %1) : (tensor<f32>, tensor<f32>, tensor<1xi8>) -> tensor<f32>
    "func.return"(%2) : (tensor<f32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<i32>) -> tensor<i32>, sym_name = "fold_mul_zero_rhs_i32"}> ({
  ^bb0(%arg0: tensor<i32>):
    %0 = "tosa.const"() <{values = dense<0> : tensor<i32>}> : () -> tensor<i32>
    %1 = "tosa.const"() <{values = dense<0> : tensor<1xi8>}> : () -> tensor<1xi8>
    %2 = "tosa.mul"(%arg0, %0, %1) : (tensor<i32>, tensor<i32>, tensor<1xi8>) -> tensor<i32>
    "func.return"(%2) : (tensor<i32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<i32>) -> tensor<i32>, sym_name = "fold_mul_zero_lhs_i32"}> ({
  ^bb0(%arg0: tensor<i32>):
    %0 = "tosa.const"() <{values = dense<0> : tensor<i32>}> : () -> tensor<i32>
    %1 = "tosa.const"() <{values = dense<0> : tensor<1xi8>}> : () -> tensor<1xi8>
    %2 = "tosa.mul"(%0, %arg0, %1) : (tensor<i32>, tensor<i32>, tensor<1xi8>) -> tensor<i32>
    "func.return"(%2) : (tensor<i32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<f32>) -> tensor<f32>, sym_name = "fold_mul_one_rhs_f32"}> ({
  ^bb0(%arg0: tensor<f32>):
    %0 = "tosa.const"() <{values = dense<1.000000e+00> : tensor<f32>}> : () -> tensor<f32>
    %1 = "tosa.const"() <{values = dense<0> : tensor<1xi8>}> : () -> tensor<1xi8>
    %2 = "tosa.mul"(%arg0, %0, %1) : (tensor<f32>, tensor<f32>, tensor<1xi8>) -> tensor<f32>
    "func.return"(%2) : (tensor<f32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<f32>) -> tensor<f32>, sym_name = "fold_mul_one_lhs_f32"}> ({
  ^bb0(%arg0: tensor<f32>):
    %0 = "tosa.const"() <{values = dense<1.000000e+00> : tensor<f32>}> : () -> tensor<f32>
    %1 = "tosa.const"() <{values = dense<0> : tensor<1xi8>}> : () -> tensor<1xi8>
    %2 = "tosa.mul"(%0, %arg0, %1) : (tensor<f32>, tensor<f32>, tensor<1xi8>) -> tensor<f32>
    "func.return"(%2) : (tensor<f32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<i32>) -> tensor<i32>, sym_name = "fold_mul_one_rhs_i32"}> ({
  ^bb0(%arg0: tensor<i32>):
    %0 = "tosa.const"() <{values = dense<64> : tensor<i32>}> : () -> tensor<i32>
    %1 = "tosa.const"() <{values = dense<6> : tensor<1xi8>}> : () -> tensor<1xi8>
    %2 = "tosa.mul"(%arg0, %0, %1) : (tensor<i32>, tensor<i32>, tensor<1xi8>) -> tensor<i32>
    "func.return"(%2) : (tensor<i32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<i32>) -> tensor<i32>, sym_name = "fold_mul_one_lhs_i32"}> ({
  ^bb0(%arg0: tensor<i32>):
    %0 = "tosa.const"() <{values = dense<64> : tensor<i32>}> : () -> tensor<i32>
    %1 = "tosa.const"() <{values = dense<6> : tensor<1xi8>}> : () -> tensor<1xi8>
    %2 = "tosa.mul"(%0, %arg0, %1) : (tensor<i32>, tensor<i32>, tensor<1xi8>) -> tensor<i32>
    "func.return"(%2) : (tensor<i32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> tensor<10xi32>, sym_name = "fold_mul_splat_i8"}> ({
    %0 = "tosa.const"() <{values = dense<17> : tensor<10xi8>}> : () -> tensor<10xi8>
    %1 = "tosa.const"() <{values = dense<32> : tensor<10xi8>}> : () -> tensor<10xi8>
    %2 = "tosa.const"() <{values = dense<3> : tensor<1xi8>}> : () -> tensor<1xi8>
    %3 = "tosa.mul"(%0, %1, %2) : (tensor<10xi8>, tensor<10xi8>, tensor<1xi8>) -> tensor<10xi32>
    "func.return"(%3) : (tensor<10xi32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> tensor<10xf32>, sym_name = "fold_mul_splat_f32"}> ({
    %0 = "tosa.const"() <{values = dense<3.000000e+00> : tensor<10xf32>}> : () -> tensor<10xf32>
    %1 = "tosa.const"() <{values = dense<2.000000e+00> : tensor<10xf32>}> : () -> tensor<10xf32>
    %2 = "tosa.const"() <{values = dense<0> : tensor<1xi8>}> : () -> tensor<1xi8>
    %3 = "tosa.mul"(%0, %1, %2) : (tensor<10xf32>, tensor<10xf32>, tensor<1xi8>) -> tensor<10xf32>
    "func.return"(%3) : (tensor<10xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<f32>) -> tensor<f32>, sym_name = "fold_sub_zero_rhs_f32"}> ({
  ^bb0(%arg0: tensor<f32>):
    %0 = "tosa.const"() <{values = dense<0.000000e+00> : tensor<f32>}> : () -> tensor<f32>
    %1 = "tosa.sub"(%arg0, %0) : (tensor<f32>, tensor<f32>) -> tensor<f32>
    "func.return"(%1) : (tensor<f32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<i32>) -> tensor<i32>, sym_name = "fold_sub_zero_rhs_i32"}> ({
  ^bb0(%arg0: tensor<i32>):
    %0 = "tosa.const"() <{values = dense<0> : tensor<i32>}> : () -> tensor<i32>
    %1 = "tosa.sub"(%arg0, %0) : (tensor<i32>, tensor<i32>) -> tensor<i32>
    "func.return"(%1) : (tensor<i32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> tensor<10xi32>, sym_name = "fold_sub_splat_i32"}> ({
    %0 = "tosa.const"() <{values = dense<1> : tensor<10xi32>}> : () -> tensor<10xi32>
    %1 = "tosa.const"() <{values = dense<2> : tensor<10xi32>}> : () -> tensor<10xi32>
    %2 = "tosa.sub"(%0, %1) : (tensor<10xi32>, tensor<10xi32>) -> tensor<10xi32>
    "func.return"(%2) : (tensor<10xi32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> tensor<10xf32>, sym_name = "fold_sub_splat_f32"}> ({
    %0 = "tosa.const"() <{values = dense<1.000000e+00> : tensor<10xf32>}> : () -> tensor<10xf32>
    %1 = "tosa.const"() <{values = dense<2.000000e+00> : tensor<10xf32>}> : () -> tensor<10xf32>
    %2 = "tosa.sub"(%0, %1) : (tensor<10xf32>, tensor<10xf32>) -> tensor<10xf32>
    "func.return"(%2) : (tensor<10xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> (tensor<10xi1>, tensor<10xi1>), sym_name = "fold_greater_splat_f32"}> ({
    %0 = "tosa.const"() <{values = dense<4.000000e+00> : tensor<10xf32>}> : () -> tensor<10xf32>
    %1 = "tosa.const"() <{values = dense<2.000000e+00> : tensor<10xf32>}> : () -> tensor<10xf32>
    %2 = "tosa.const"() <{values = dense<1.000000e+00> : tensor<10xf32>}> : () -> tensor<10xf32>
    %3 = "tosa.const"() <{values = dense<2.000000e+00> : tensor<10xf32>}> : () -> tensor<10xf32>
    %4 = "tosa.greater"(%0, %1) : (tensor<10xf32>, tensor<10xf32>) -> tensor<10xi1>
    %5 = "tosa.greater"(%2, %3) : (tensor<10xf32>, tensor<10xf32>) -> tensor<10xi1>
    "func.return"(%4, %5) : (tensor<10xi1>, tensor<10xi1>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> (tensor<10xi1>, tensor<10xi1>), sym_name = "fold_greater_splat_i32"}> ({
    %0 = "tosa.const"() <{values = dense<-10> : tensor<10xi32>}> : () -> tensor<10xi32>
    %1 = "tosa.const"() <{values = dense<8> : tensor<10xi32>}> : () -> tensor<10xi32>
    %2 = "tosa.const"() <{values = dense<-10> : tensor<10xi32>}> : () -> tensor<10xi32>
    %3 = "tosa.const"() <{values = dense<-12> : tensor<10xi32>}> : () -> tensor<10xi32>
    %4 = "tosa.greater"(%0, %1) : (tensor<10xi32>, tensor<10xi32>) -> tensor<10xi1>
    %5 = "tosa.greater"(%2, %3) : (tensor<10xi32>, tensor<10xi32>) -> tensor<10xi1>
    "func.return"(%4, %5) : (tensor<10xi1>, tensor<10xi1>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> (tensor<10xi1>, tensor<10xi1>), sym_name = "fold_greater_eq_splat_f32"}> ({
    %0 = "tosa.const"() <{values = dense<4.000000e+00> : tensor<10xf32>}> : () -> tensor<10xf32>
    %1 = "tosa.const"() <{values = dense<4.000000e+00> : tensor<10xf32>}> : () -> tensor<10xf32>
    %2 = "tosa.const"() <{values = dense<1.000000e+00> : tensor<10xf32>}> : () -> tensor<10xf32>
    %3 = "tosa.const"() <{values = dense<2.000000e+00> : tensor<10xf32>}> : () -> tensor<10xf32>
    %4 = "tosa.greater_equal"(%0, %1) : (tensor<10xf32>, tensor<10xf32>) -> tensor<10xi1>
    %5 = "tosa.greater_equal"(%2, %3) : (tensor<10xf32>, tensor<10xf32>) -> tensor<10xi1>
    "func.return"(%4, %5) : (tensor<10xi1>, tensor<10xi1>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> (tensor<10xi1>, tensor<10xi1>), sym_name = "fold_greater_eq_splat_i32"}> ({
    %0 = "tosa.const"() <{values = dense<-10> : tensor<10xi32>}> : () -> tensor<10xi32>
    %1 = "tosa.const"() <{values = dense<8> : tensor<10xi32>}> : () -> tensor<10xi32>
    %2 = "tosa.const"() <{values = dense<-10> : tensor<10xi32>}> : () -> tensor<10xi32>
    %3 = "tosa.const"() <{values = dense<-10> : tensor<10xi32>}> : () -> tensor<10xi32>
    %4 = "tosa.greater_equal"(%2, %3) : (tensor<10xi32>, tensor<10xi32>) -> tensor<10xi1>
    %5 = "tosa.greater_equal"(%0, %1) : (tensor<10xi32>, tensor<10xi32>) -> tensor<10xi1>
    "func.return"(%4, %5) : (tensor<10xi1>, tensor<10xi1>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> (tensor<10xi1>, tensor<10xi1>), sym_name = "fold_eq_splat_f32"}> ({
    %0 = "tosa.const"() <{values = dense<4.000000e+00> : tensor<10xf32>}> : () -> tensor<10xf32>
    %1 = "tosa.const"() <{values = dense<4.000000e+00> : tensor<10xf32>}> : () -> tensor<10xf32>
    %2 = "tosa.const"() <{values = dense<1.000000e+00> : tensor<10xf32>}> : () -> tensor<10xf32>
    %3 = "tosa.const"() <{values = dense<2.000000e+00> : tensor<10xf32>}> : () -> tensor<10xf32>
    %4 = "tosa.equal"(%0, %1) : (tensor<10xf32>, tensor<10xf32>) -> tensor<10xi1>
    %5 = "tosa.equal"(%2, %3) : (tensor<10xf32>, tensor<10xf32>) -> tensor<10xi1>
    "func.return"(%4, %5) : (tensor<10xi1>, tensor<10xi1>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> (tensor<10xi1>, tensor<10xi1>), sym_name = "fold_eq_splat_i32"}> ({
    %0 = "tosa.const"() <{values = dense<-10> : tensor<10xi32>}> : () -> tensor<10xi32>
    %1 = "tosa.const"() <{values = dense<8> : tensor<10xi32>}> : () -> tensor<10xi32>
    %2 = "tosa.const"() <{values = dense<-10> : tensor<10xi32>}> : () -> tensor<10xi32>
    %3 = "tosa.const"() <{values = dense<-10> : tensor<10xi32>}> : () -> tensor<10xi32>
    %4 = "tosa.equal"(%2, %3) : (tensor<10xi32>, tensor<10xi32>) -> tensor<10xi1>
    %5 = "tosa.equal"(%0, %1) : (tensor<10xi32>, tensor<10xi32>) -> tensor<10xi1>
    "func.return"(%4, %5) : (tensor<10xi1>, tensor<10xi1>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<10xi32>) -> tensor<10xi1>, sym_name = "fold_eq_i32"}> ({
  ^bb0(%arg0: tensor<10xi32>):
    %0 = "tosa.equal"(%arg0, %arg0) : (tensor<10xi32>, tensor<10xi32>) -> tensor<10xi1>
    "func.return"(%0) : (tensor<10xi1>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> tensor<6x5x4xi32>, sym_name = "reshape_splat"}> ({
    %0 = "tosa.const"() <{values = dense<42> : tensor<4x5x6xi32>}> : () -> tensor<4x5x6xi32>
    %1 = "tosa.const_shape"() <{values = dense<[6, 5, 4]> : tensor<3xindex>}> : () -> !tosa.shape<3>
    %2 = "tosa.reshape"(%0, %1) : (tensor<4x5x6xi32>, !tosa.shape<3>) -> tensor<6x5x4xi32>
    "func.return"(%2) : (tensor<6x5x4xi32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> tensor<1x1x1xi32>, sym_name = "slice_splat"}> ({
    %0 = "tosa.const"() <{values = dense<42> : tensor<4x5x6xi32>}> : () -> tensor<4x5x6xi32>
    %1 = "tosa.const_shape"() <{values = dense<[1, 2, 3]> : tensor<3xindex>}> : () -> !tosa.shape<3>
    %2 = "tosa.const_shape"() <{values = dense<1> : tensor<3xindex>}> : () -> !tosa.shape<3>
    %3 = "tosa.slice"(%0, %1, %2) : (tensor<4x5x6xi32>, !tosa.shape<3>, !tosa.shape<3>) -> tensor<1x1x1xi32>
    "func.return"(%3) : (tensor<1x1x1xi32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> tensor<1x1xi32>, sym_name = "slice_singleton"}> ({
    %0 = "tosa.const"() <{values = dense<[[0, 1, 2], [3, 4, 5], [6, 7, 8]]> : tensor<3x3xi32>}> : () -> tensor<3x3xi32>
    %1 = "tosa.const_shape"() <{values = dense<1> : tensor<2xindex>}> : () -> !tosa.shape<2>
    %2 = "tosa.const_shape"() <{values = dense<1> : tensor<2xindex>}> : () -> !tosa.shape<2>
    %3 = "tosa.slice"(%0, %1, %2) : (tensor<3x3xi32>, !tosa.shape<2>, !tosa.shape<2>) -> tensor<1x1xi32>
    "func.return"(%3) : (tensor<1x1xi32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> tensor<f16>, sym_name = "cast_float_to_float"}> ({
    %0 = "tosa.const"() <{values = dense<4.200000e+01> : tensor<f32>}> : () -> tensor<f32>
    %1 = "tosa.cast"(%0) : (tensor<f32>) -> tensor<f16>
    "func.return"(%1) : (tensor<f16>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> tensor<f16>, sym_name = "cast_int_to_float"}> ({
    %0 = "tosa.const"() <{values = dense<4> : tensor<i32>}> : () -> tensor<i32>
    %1 = "tosa.cast"(%0) : (tensor<i32>) -> tensor<f16>
    "func.return"(%1) : (tensor<f16>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> tensor<i16>, sym_name = "cast_float_to_int"}> ({
    %0 = "tosa.const"() <{values = dense<-4.000000e+00> : tensor<f32>}> : () -> tensor<f32>
    %1 = "tosa.cast"(%0) : (tensor<f32>) -> tensor<i16>
    "func.return"(%1) : (tensor<i16>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> tensor<i16>, sym_name = "cast_float_to_int_round"}> ({
    %0 = "tosa.const"() <{values = dense<-3.500000e+00> : tensor<f32>}> : () -> tensor<f32>
    %1 = "tosa.cast"(%0) : (tensor<f32>) -> tensor<i16>
    "func.return"(%1) : (tensor<i16>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> tensor<i16>, sym_name = "cast_int_to_int_trunc"}> ({
    %0 = "tosa.const"() <{values = dense<-1> : tensor<i32>}> : () -> tensor<i32>
    %1 = "tosa.cast"(%0) : (tensor<i32>) -> tensor<i16>
    "func.return"(%1) : (tensor<i16>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> tensor<i32>, sym_name = "cast_int_to_int_sign"}> ({
    %0 = "tosa.const"() <{values = dense<-1> : tensor<i16>}> : () -> tensor<i16>
    %1 = "tosa.cast"(%0) : (tensor<i16>) -> tensor<i32>
    "func.return"(%1) : (tensor<i32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> tensor<10xi32>, sym_name = "reverse_splat"}> ({
    %0 = "tosa.const"() <{values = dense<42> : tensor<10xi32>}> : () -> tensor<10xi32>
    %1 = "tosa.reverse"(%0) <{axis = 0 : i32}> : (tensor<10xi32>) -> tensor<10xi32>
    "func.return"(%1) : (tensor<10xi32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<10x1xi32>) -> (tensor<10x1xi32>, tensor<10x1xi32>), sym_name = "reverse_length_one"}> ({
  ^bb0(%arg0: tensor<10x1xi32>):
    %0 = "tosa.reverse"(%arg0) <{axis = 0 : i32}> : (tensor<10x1xi32>) -> tensor<10x1xi32>
    %1 = "tosa.reverse"(%arg0) <{axis = 1 : i32}> : (tensor<10x1xi32>) -> tensor<10x1xi32>
    "func.return"(%0, %1) : (tensor<10x1xi32>, tensor<10x1xi32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> tensor<1x3xi32>, sym_name = "reduce_sum_constant"}> ({
    %0 = "tosa.const"() <{values = dense<[[1, 2, 3], [4, 5, 6]]> : tensor<2x3xi32>}> : () -> tensor<2x3xi32>
    %1 = "tosa.reduce_sum"(%0) <{axis = 0 : i32}> : (tensor<2x3xi32>) -> tensor<1x3xi32>
    "func.return"(%1) : (tensor<1x3xi32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> tensor<2x1xi32>, sym_name = "reduce_sum_constant"}> ({
    %0 = "tosa.const"() <{values = dense<[[1, 2, 3], [4, 5, 6]]> : tensor<2x3xi32>}> : () -> tensor<2x3xi32>
    %1 = "tosa.reduce_sum"(%0) <{axis = 1 : i32}> : (tensor<2x3xi32>) -> tensor<2x1xi32>
    "func.return"(%1) : (tensor<2x1xi32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> tensor<3x1xi32>, sym_name = "reduce_sum_constant"}> ({
    %0 = "tosa.const"() <{values = dense<[[1, 2, 3], [4, 5, 6], [7, 8, 9]]> : tensor<3x3xi32>}> : () -> tensor<3x3xi32>
    %1 = "tosa.reduce_sum"(%0) <{axis = 1 : i32}> : (tensor<3x3xi32>) -> tensor<3x1xi32>
    "func.return"(%1) : (tensor<3x1xi32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> tensor<2x1x4xi32>, sym_name = "reduce_sum_constant"}> ({
    %0 = "tosa.const"() <{values = dense<[[[1, 2, 3, 4], [5, 6, 7, 8], [9, 10, 11, 12]], [[13, 14, 15, 16], [17, 18, 19, 20], [21, 22, 23, 24]]]> : tensor<2x3x4xi32>}> : () -> tensor<2x3x4xi32>
    %1 = "tosa.reduce_sum"(%0) <{axis = 1 : i32}> : (tensor<2x3x4xi32>) -> tensor<2x1x4xi32>
    "func.return"(%1) : (tensor<2x1x4xi32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> tensor<1x3x3xi32>, sym_name = "reduce_sum_constant"}> ({
    %0 = "tosa.const"() <{values = dense<[[[1, 2, 3], [4, 5, 6], [7, 8, 9]], [[10, 11, 12], [13, 14, 15], [16, 17, 18]], [[19, 20, 21], [22, 23, 24], [25, 26, 27]]]> : tensor<3x3x3xi32>}> : () -> tensor<3x3x3xi32>
    %1 = "tosa.reduce_sum"(%0) <{axis = 0 : i32}> : (tensor<3x3x3xi32>) -> tensor<1x3x3xi32>
    "func.return"(%1) : (tensor<1x3x3xi32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> tensor<2x2x2x1xi32>, sym_name = "reduce_sum_constant"}> ({
    %0 = "tosa.const"() <{values = dense<[[[[1, 2], [3, 4]], [[5, 6], [7, 8]]], [[[9, 10], [11, 12]], [[13, 14], [15, 16]]]]> : tensor<2x2x2x2xi32>}> : () -> tensor<2x2x2x2xi32>
    %1 = "tosa.reduce_sum"(%0) <{axis = 3 : i32}> : (tensor<2x2x2x2xi32>) -> tensor<2x2x2x1xi32>
    "func.return"(%1) : (tensor<2x2x2x1xi32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> tensor<1x1x1xi32>, sym_name = "reduce_sum_constant"}> ({
    %0 = "tosa.const"() <{values = dense<42> : tensor<1x1x1xi32>}> : () -> tensor<1x1x1xi32>
    %1 = "tosa.reduce_sum"(%0) <{axis = 0 : i32}> : (tensor<1x1x1xi32>) -> tensor<1x1x1xi32>
    "func.return"(%1) : (tensor<1x1x1xi32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> tensor<2x3x1x5xi32>, sym_name = "reduce_sum_constant"}> ({
    %0 = "tosa.const"() <{values = dense<"0x0100000002000000030000000400000005000000060000000700000008000000090000000A0000000B0000000C0000000D0000000E0000000F000000100000001100000012000000130000001400000015000000160000001700000018000000190000001A0000001B0000001C0000001D0000001E0000001F000000200000002100000022000000230000002400000025000000260000002700000028000000290000002A0000002B0000002C0000002D0000002E0000002F000000300000003100000032000000330000003400000035000000360000003700000038000000390000003A0000003B0000003C0000003D0000003E0000003F000000400000004100000042000000430000004400000045000000460000004700000048000000490000004A0000004B0000004C0000004D0000004E0000004F000000500000005100000052000000530000005400000055000000560000005700000058000000590000005A0000005B0000005C0000005D0000005E0000005F000000600000006100000062000000630000006400000065000000660000006700000068000000690000006A0000006B0000006C0000006D0000006E0000006F000000700000007100000072000000730000007400000075000000760000007700000078000000"> : tensor<2x3x4x5xi32>}> : () -> tensor<2x3x4x5xi32>
    %1 = "tosa.reduce_sum"(%0) <{axis = 2 : i32}> : (tensor<2x3x4x5xi32>) -> tensor<2x3x1x5xi32>
    "func.return"(%1) : (tensor<2x3x1x5xi32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> tensor<1x3xi32>, sym_name = "reduce_prod_constant"}> ({
    %0 = "tosa.const"() <{values = dense<[[1, 2, 3], [4, 5, 6]]> : tensor<2x3xi32>}> : () -> tensor<2x3xi32>
    %1 = "tosa.reduce_product"(%0) <{axis = 0 : i32}> : (tensor<2x3xi32>) -> tensor<1x3xi32>
    "func.return"(%1) : (tensor<1x3xi32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> tensor<2x1xi32>, sym_name = "reduce_prod_constant"}> ({
    %0 = "tosa.const"() <{values = dense<[[1, 2, 3], [4, 5, 6]]> : tensor<2x3xi32>}> : () -> tensor<2x3xi32>
    %1 = "tosa.reduce_product"(%0) <{axis = 1 : i32}> : (tensor<2x3xi32>) -> tensor<2x1xi32>
    "func.return"(%1) : (tensor<2x1xi32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> tensor<3x1xi32>, sym_name = "reduce_prod_constant"}> ({
    %0 = "tosa.const"() <{values = dense<[[1, 2, 3], [4, 5, 6], [7, 8, 9]]> : tensor<3x3xi32>}> : () -> tensor<3x3xi32>
    %1 = "tosa.reduce_product"(%0) <{axis = 1 : i32}> : (tensor<3x3xi32>) -> tensor<3x1xi32>
    "func.return"(%1) : (tensor<3x1xi32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> tensor<2x1x4xi32>, sym_name = "reduce_prod_constant"}> ({
    %0 = "tosa.const"() <{values = dense<[[[1, 2, 3, 4], [5, 6, 7, 8], [9, 10, 11, 12]], [[13, 14, 15, 16], [17, 18, 19, 20], [21, 22, 23, 24]]]> : tensor<2x3x4xi32>}> : () -> tensor<2x3x4xi32>
    %1 = "tosa.reduce_product"(%0) <{axis = 1 : i32}> : (tensor<2x3x4xi32>) -> tensor<2x1x4xi32>
    "func.return"(%1) : (tensor<2x1x4xi32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> tensor<1x3x3xi32>, sym_name = "reduce_prod_constant"}> ({
    %0 = "tosa.const"() <{values = dense<[[[1, 2, 3], [4, 5, 6], [7, 8, 9]], [[10, 11, 12], [13, 14, 15], [16, 17, 18]], [[19, 20, 21], [22, 23, 24], [25, 26, 27]]]> : tensor<3x3x3xi32>}> : () -> tensor<3x3x3xi32>
    %1 = "tosa.reduce_product"(%0) <{axis = 0 : i32}> : (tensor<3x3x3xi32>) -> tensor<1x3x3xi32>
    "func.return"(%1) : (tensor<1x3x3xi32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> tensor<2x2x2x1xi32>, sym_name = "reduce_prod_constant"}> ({
    %0 = "tosa.const"() <{values = dense<[[[[1, 2], [3, 4]], [[5, 6], [7, 8]]], [[[9, 10], [11, 12]], [[13, 14], [15, 16]]]]> : tensor<2x2x2x2xi32>}> : () -> tensor<2x2x2x2xi32>
    %1 = "tosa.reduce_product"(%0) <{axis = 3 : i32}> : (tensor<2x2x2x2xi32>) -> tensor<2x2x2x1xi32>
    "func.return"(%1) : (tensor<2x2x2x1xi32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> tensor<1x1x1xi32>, sym_name = "reduce_prod_constant"}> ({
    %0 = "tosa.const"() <{values = dense<42> : tensor<1x1x1xi32>}> : () -> tensor<1x1x1xi32>
    %1 = "tosa.reduce_product"(%0) <{axis = 0 : i32}> : (tensor<1x1x1xi32>) -> tensor<1x1x1xi32>
    "func.return"(%1) : (tensor<1x1x1xi32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> tensor<1x3xi32>, sym_name = "reduce_max_constant"}> ({
    %0 = "tosa.const"() <{values = dense<[[1, 2, 3], [4, 5, 6]]> : tensor<2x3xi32>}> : () -> tensor<2x3xi32>
    %1 = "tosa.reduce_max"(%0) <{axis = 0 : i32, nan_mode = #tosa.nan_mode<PROPAGATE>}> : (tensor<2x3xi32>) -> tensor<1x3xi32>
    "func.return"(%1) : (tensor<1x3xi32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> tensor<2x1xi32>, sym_name = "reduce_max_constant"}> ({
    %0 = "tosa.const"() <{values = dense<[[1, 2, 3], [4, 5, 6]]> : tensor<2x3xi32>}> : () -> tensor<2x3xi32>
    %1 = "tosa.reduce_max"(%0) <{axis = 1 : i32, nan_mode = #tosa.nan_mode<PROPAGATE>}> : (tensor<2x3xi32>) -> tensor<2x1xi32>
    "func.return"(%1) : (tensor<2x1xi32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> tensor<3x1xi32>, sym_name = "reduce_max_constant"}> ({
    %0 = "tosa.const"() <{values = dense<[[1, 2, 3], [4, 5, 6], [7, 8, 9]]> : tensor<3x3xi32>}> : () -> tensor<3x3xi32>
    %1 = "tosa.reduce_max"(%0) <{axis = 1 : i32, nan_mode = #tosa.nan_mode<PROPAGATE>}> : (tensor<3x3xi32>) -> tensor<3x1xi32>
    "func.return"(%1) : (tensor<3x1xi32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> tensor<2x1x4xi32>, sym_name = "reduce_max_constant"}> ({
    %0 = "tosa.const"() <{values = dense<[[[1, 2, 3, 4], [5, 6, 7, 8], [9, 10, 11, 12]], [[13, 14, 15, 16], [17, 18, 19, 20], [21, 22, 23, 24]]]> : tensor<2x3x4xi32>}> : () -> tensor<2x3x4xi32>
    %1 = "tosa.reduce_max"(%0) <{axis = 1 : i32, nan_mode = #tosa.nan_mode<PROPAGATE>}> : (tensor<2x3x4xi32>) -> tensor<2x1x4xi32>
    "func.return"(%1) : (tensor<2x1x4xi32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> tensor<1x3x3xi32>, sym_name = "reduce_max_constant"}> ({
    %0 = "tosa.const"() <{values = dense<[[[1, 2, 3], [4, 5, 6], [7, 8, 9]], [[10, 11, 12], [13, 14, 15], [16, 17, 18]], [[19, 20, 21], [22, 23, 24], [25, 26, 27]]]> : tensor<3x3x3xi32>}> : () -> tensor<3x3x3xi32>
    %1 = "tosa.reduce_max"(%0) <{axis = 0 : i32, nan_mode = #tosa.nan_mode<PROPAGATE>}> : (tensor<3x3x3xi32>) -> tensor<1x3x3xi32>
    "func.return"(%1) : (tensor<1x3x3xi32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> tensor<2x2x2x1xi32>, sym_name = "reduce_max_constant"}> ({
    %0 = "tosa.const"() <{values = dense<[[[[1, 2], [3, 4]], [[5, 6], [7, 8]]], [[[9, 10], [11, 12]], [[13, 14], [15, 16]]]]> : tensor<2x2x2x2xi32>}> : () -> tensor<2x2x2x2xi32>
    %1 = "tosa.reduce_max"(%0) <{axis = 3 : i32, nan_mode = #tosa.nan_mode<PROPAGATE>}> : (tensor<2x2x2x2xi32>) -> tensor<2x2x2x1xi32>
    "func.return"(%1) : (tensor<2x2x2x1xi32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> tensor<1x1x1xi32>, sym_name = "reduce_max_constant"}> ({
    %0 = "tosa.const"() <{values = dense<42> : tensor<1x1x1xi32>}> : () -> tensor<1x1x1xi32>
    %1 = "tosa.reduce_max"(%0) <{axis = 0 : i32, nan_mode = #tosa.nan_mode<PROPAGATE>}> : (tensor<1x1x1xi32>) -> tensor<1x1x1xi32>
    "func.return"(%1) : (tensor<1x1x1xi32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> tensor<1xi8>, sym_name = "reduce_max_constant_no_overflow"}> ({
    %0 = "tosa.const"() <{values = dense<[-127, 120, -126]> : tensor<3xi8>}> : () -> tensor<3xi8>
    %1 = "tosa.reduce_max"(%0) <{axis = 0 : i32, nan_mode = #tosa.nan_mode<PROPAGATE>}> : (tensor<3xi8>) -> tensor<1xi8>
    "func.return"(%1) : (tensor<1xi8>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> tensor<1x3xi32>, sym_name = "reduce_min_constant"}> ({
    %0 = "tosa.const"() <{values = dense<[[1, 2, 3], [4, 5, 6]]> : tensor<2x3xi32>}> : () -> tensor<2x3xi32>
    %1 = "tosa.reduce_min"(%0) <{axis = 0 : i32, nan_mode = #tosa.nan_mode<PROPAGATE>}> : (tensor<2x3xi32>) -> tensor<1x3xi32>
    "func.return"(%1) : (tensor<1x3xi32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> tensor<2x1xi32>, sym_name = "reduce_min_constant"}> ({
    %0 = "tosa.const"() <{values = dense<[[1, 2, 3], [4, 5, 6]]> : tensor<2x3xi32>}> : () -> tensor<2x3xi32>
    %1 = "tosa.reduce_min"(%0) <{axis = 1 : i32, nan_mode = #tosa.nan_mode<PROPAGATE>}> : (tensor<2x3xi32>) -> tensor<2x1xi32>
    "func.return"(%1) : (tensor<2x1xi32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> tensor<3x1xi32>, sym_name = "reduce_min_constant"}> ({
    %0 = "tosa.const"() <{values = dense<[[1, 2, 3], [4, 5, 6], [7, 8, 9]]> : tensor<3x3xi32>}> : () -> tensor<3x3xi32>
    %1 = "tosa.reduce_min"(%0) <{axis = 1 : i32, nan_mode = #tosa.nan_mode<PROPAGATE>}> : (tensor<3x3xi32>) -> tensor<3x1xi32>
    "func.return"(%1) : (tensor<3x1xi32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> tensor<2x1x4xi32>, sym_name = "reduce_min_constant"}> ({
    %0 = "tosa.const"() <{values = dense<[[[1, 2, 3, 4], [5, 6, 7, 8], [9, 10, 11, 12]], [[13, 14, 15, 16], [17, 18, 19, 20], [21, 22, 23, 24]]]> : tensor<2x3x4xi32>}> : () -> tensor<2x3x4xi32>
    %1 = "tosa.reduce_min"(%0) <{axis = 1 : i32, nan_mode = #tosa.nan_mode<PROPAGATE>}> : (tensor<2x3x4xi32>) -> tensor<2x1x4xi32>
    "func.return"(%1) : (tensor<2x1x4xi32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> tensor<1x3x3xi32>, sym_name = "reduce_min_constant"}> ({
    %0 = "tosa.const"() <{values = dense<[[[1, 2, 3], [4, 5, 6], [7, 8, 9]], [[10, 11, 12], [13, 14, 15], [16, 17, 18]], [[19, 20, 21], [22, 23, 24], [25, 26, 27]]]> : tensor<3x3x3xi32>}> : () -> tensor<3x3x3xi32>
    %1 = "tosa.reduce_min"(%0) <{axis = 0 : i32, nan_mode = #tosa.nan_mode<PROPAGATE>}> : (tensor<3x3x3xi32>) -> tensor<1x3x3xi32>
    "func.return"(%1) : (tensor<1x3x3xi32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> tensor<2x2x2x1xi32>, sym_name = "reduce_min_constant"}> ({
    %0 = "tosa.const"() <{values = dense<[[[[1, 2], [3, 4]], [[5, 6], [7, 8]]], [[[9, 10], [11, 12]], [[13, 14], [15, 16]]]]> : tensor<2x2x2x2xi32>}> : () -> tensor<2x2x2x2xi32>
    %1 = "tosa.reduce_min"(%0) <{axis = 3 : i32, nan_mode = #tosa.nan_mode<PROPAGATE>}> : (tensor<2x2x2x2xi32>) -> tensor<2x2x2x1xi32>
    "func.return"(%1) : (tensor<2x2x2x1xi32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> tensor<1x1x1xi32>, sym_name = "reduce_min_constant"}> ({
    %0 = "tosa.const"() <{values = dense<42> : tensor<1x1x1xi32>}> : () -> tensor<1x1x1xi32>
    %1 = "tosa.reduce_min"(%0) <{axis = 0 : i32, nan_mode = #tosa.nan_mode<PROPAGATE>}> : (tensor<1x1x1xi32>) -> tensor<1x1x1xi32>
    "func.return"(%1) : (tensor<1x1x1xi32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> tensor<1xi8>, sym_name = "reduce_min_constant_no_overflow"}> ({
    %0 = "tosa.const"() <{values = dense<[-127, 120, -126]> : tensor<3xi8>}> : () -> tensor<3xi8>
    %1 = "tosa.reduce_min"(%0) <{axis = 0 : i32, nan_mode = #tosa.nan_mode<PROPAGATE>}> : (tensor<3xi8>) -> tensor<1xi8>
    "func.return"(%1) : (tensor<1xi8>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> tensor<1x3xi1>, sym_name = "reduce_any_constant"}> ({
    %0 = "tosa.const"() <{values = dense<[[true, true, true], [true, false, true]]> : tensor<2x3xi1>}> : () -> tensor<2x3xi1>
    %1 = "tosa.reduce_any"(%0) <{axis = 0 : i32}> : (tensor<2x3xi1>) -> tensor<1x3xi1>
    "func.return"(%1) : (tensor<1x3xi1>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> tensor<2x1xi1>, sym_name = "reduce_any_constant"}> ({
    %0 = "tosa.const"() <{values = dense<[[true, true, true], [true, false, true]]> : tensor<2x3xi1>}> : () -> tensor<2x3xi1>
    %1 = "tosa.reduce_any"(%0) <{axis = 1 : i32}> : (tensor<2x3xi1>) -> tensor<2x1xi1>
    "func.return"(%1) : (tensor<2x1xi1>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> tensor<3x1xi1>, sym_name = "reduce_any_constant"}> ({
    %0 = "tosa.const"() <{values = dense<[[true, false, false], [false, false, false], [false, false, true]]> : tensor<3x3xi1>}> : () -> tensor<3x3xi1>
    %1 = "tosa.reduce_any"(%0) <{axis = 1 : i32}> : (tensor<3x3xi1>) -> tensor<3x1xi1>
    "func.return"(%1) : (tensor<3x1xi1>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> tensor<2x1x4xi1>, sym_name = "reduce_any_constant"}> ({
    %0 = "tosa.const"() <{values = dense<[[[true, false, false, true], [false, false, true, false], [true, false, true, true]], [[false, false, false, false], [false, false, true, false], [true, false, true, false]]]> : tensor<2x3x4xi1>}> : () -> tensor<2x3x4xi1>
    %1 = "tosa.reduce_any"(%0) <{axis = 1 : i32}> : (tensor<2x3x4xi1>) -> tensor<2x1x4xi1>
    "func.return"(%1) : (tensor<2x1x4xi1>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> tensor<1x3xi1>, sym_name = "reduce_all_constant"}> ({
    %0 = "tosa.const"() <{values = dense<[[true, true, true], [true, false, true]]> : tensor<2x3xi1>}> : () -> tensor<2x3xi1>
    %1 = "tosa.reduce_all"(%0) <{axis = 0 : i32}> : (tensor<2x3xi1>) -> tensor<1x3xi1>
    "func.return"(%1) : (tensor<1x3xi1>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> tensor<2x1xi1>, sym_name = "reduce_all_constant"}> ({
    %0 = "tosa.const"() <{values = dense<[[true, true, true], [true, false, true]]> : tensor<2x3xi1>}> : () -> tensor<2x3xi1>
    %1 = "tosa.reduce_all"(%0) <{axis = 1 : i32}> : (tensor<2x3xi1>) -> tensor<2x1xi1>
    "func.return"(%1) : (tensor<2x1xi1>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> tensor<3x1xi1>, sym_name = "reduce_all_constant"}> ({
    %0 = "tosa.const"() <{values = dense<[[true, false, false], [false, false, false], [false, false, true]]> : tensor<3x3xi1>}> : () -> tensor<3x3xi1>
    %1 = "tosa.reduce_all"(%0) <{axis = 1 : i32}> : (tensor<3x3xi1>) -> tensor<3x1xi1>
    "func.return"(%1) : (tensor<3x1xi1>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> tensor<2x1x4xi1>, sym_name = "reduce_all_constant"}> ({
    %0 = "tosa.const"() <{values = dense<[[[true, false, false, true], [false, false, true, false], [true, false, true, true]], [[false, false, false, false], [false, false, true, false], [true, false, true, false]]]> : tensor<2x3x4xi1>}> : () -> tensor<2x3x4xi1>
    %1 = "tosa.reduce_all"(%0) <{axis = 1 : i32}> : (tensor<2x3x4xi1>) -> tensor<2x1x4xi1>
    "func.return"(%1) : (tensor<2x1x4xi1>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> tensor<1x3xi32>, sym_name = "reduce_sum_constant"}> ({
    %0 = "tosa.const"() <{values = dense<1> : tensor<2x3xi32>}> : () -> tensor<2x3xi32>
    %1 = "tosa.reduce_sum"(%0) <{axis = 0 : i32}> : (tensor<2x3xi32>) -> tensor<1x3xi32>
    "func.return"(%1) : (tensor<1x3xi32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> tensor<1x3xi32>, sym_name = "reduce_sum_constant"}> ({
    %0 = "tosa.const"() <{values = dense<[[1, 2, 3], [4, 5, 6]]> : tensor<2x3xi32>}> : () -> tensor<2x3xi32>
    %1 = "tosa.const"() <{values = dense<[[1, 2, 3], [4, 5, 7]]> : tensor<2x3xi32>}> : () -> tensor<2x3xi32>
    %2 = "tosa.add"(%0, %1) : (tensor<2x3xi32>, tensor<2x3xi32>) -> tensor<2x3xi32>
    %3 = "tosa.reduce_sum"(%2) <{axis = 0 : i32}> : (tensor<2x3xi32>) -> tensor<1x3xi32>
    "func.return"(%3) : (tensor<1x3xi32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> tensor<1x3xi32>, sym_name = "reduce_sum_constant_aggressive"}> ({
    %0 = "tosa.const"() <{values = dense<1> : tensor<2x3xi32>}> : () -> tensor<2x3xi32>
    %1 = "tosa.reduce_sum"(%0) <{axis = 0 : i32}> : (tensor<2x3xi32>) -> tensor<1x3xi32>
    %2 = "tosa.reduce_sum"(%0) <{axis = 0 : i32}> : (tensor<2x3xi32>) -> tensor<1x3xi32>
    %3 = "tosa.add"(%1, %2) : (tensor<1x3xi32>, tensor<1x3xi32>) -> tensor<1x3xi32>
    "func.return"(%3) : (tensor<1x3xi32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> tensor<2x3xi32>, sym_name = "reduce_sum_constant_aggressive"}> ({
    %0 = "tosa.const"() <{values = dense<1> : tensor<2x2x3xi32>}> : () -> tensor<2x2x3xi32>
    %1 = "tosa.const"() <{values = dense<2> : tensor<2x3xi32>}> : () -> tensor<2x3xi32>
    %2 = "tosa.reduce_sum"(%0) <{axis = 0 : i32}> : (tensor<2x2x3xi32>) -> tensor<1x2x3xi32>
    %3 = "tosa.argmax"(%2) <{axis = 1 : i32, nan_mode = #tosa.nan_mode<PROPAGATE>}> : (tensor<1x2x3xi32>) -> tensor<1x3xi32>
    %4 = "tosa.argmax"(%0) <{axis = 0 : i32, nan_mode = #tosa.nan_mode<PROPAGATE>}> : (tensor<2x2x3xi32>) -> tensor<2x3xi32>
    %5 = "tosa.add"(%3, %1) : (tensor<1x3xi32>, tensor<2x3xi32>) -> tensor<2x3xi32>
    %6 = "tosa.add"(%5, %4) : (tensor<2x3xi32>, tensor<2x3xi32>) -> tensor<2x3xi32>
    "func.return"(%6) : (tensor<2x3xi32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<44x1xi16>, tensor<1xi8>) -> tensor<44x57xi32>, sym_name = "no_shift_op_reorder"}> ({
  ^bb0(%arg0: tensor<44x1xi16>, %arg1: tensor<1xi8>):
    %0 = "tosa.const"() <{values = dense<1> : tensor<44x57xi16>}> : () -> tensor<44x57xi16>
    %1 = "tosa.mul"(%arg0, %0, %arg1) : (tensor<44x1xi16>, tensor<44x57xi16>, tensor<1xi8>) -> tensor<44x57xi32>
    "func.return"(%1) : (tensor<44x57xi32>) -> ()
  }) : () -> ()
}) : () -> ()

