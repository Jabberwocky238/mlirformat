"builtin.module"() ({
  "func.func"() <{function_type = () -> tensor<f32>, sym_name = "reciprocal_fold_single_valued"}> ({
    %21 = "tosa.const"() <{values = dense<4.000000e+00> : tensor<f32>}> : () -> tensor<f32>
    %22 = "tosa.reciprocal"(%21) : (tensor<f32>) -> tensor<f32>
    "func.return"(%22) : (tensor<f32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> tensor<12x7xf32>, sym_name = "reciprocal_fold_splat"}> ({
    %19 = "tosa.const"() <{values = dense<4.000000e+00> : tensor<12x7xf32>}> : () -> tensor<12x7xf32>
    %20 = "tosa.reciprocal"(%19) : (tensor<12x7xf32>) -> tensor<12x7xf32>
    "func.return"(%20) : (tensor<12x7xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> tensor<f32>, sym_name = "reciprocal_div_zero"}> ({
    %17 = "tosa.const"() <{values = dense<0.000000e+00> : tensor<f32>}> : () -> tensor<f32>
    %18 = "tosa.reciprocal"(%17) : (tensor<f32>) -> tensor<f32>
    "func.return"(%18) : (tensor<f32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> tensor<f32>, sym_name = "reciprocal_div_neg_zero"}> ({
    %15 = "tosa.const"() <{values = dense<-0.000000e+00> : tensor<f32>}> : () -> tensor<f32>
    %16 = "tosa.reciprocal"(%15) : (tensor<f32>) -> tensor<f32>
    "func.return"(%16) : (tensor<f32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> tensor<f32>, sym_name = "reciprocal_div_nan"}> ({
    %13 = "tosa.const"() <{values = dense<0x7FC00000> : tensor<f32>}> : () -> tensor<f32>
    %14 = "tosa.reciprocal"(%13) : (tensor<f32>) -> tensor<f32>
    "func.return"(%14) : (tensor<f32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> tensor<f32>, sym_name = "reciprocal_div_infinity"}> ({
    %11 = "tosa.const"() <{values = dense<0x7F800000> : tensor<f32>}> : () -> tensor<f32>
    %12 = "tosa.reciprocal"(%11) : (tensor<f32>) -> tensor<f32>
    "func.return"(%12) : (tensor<f32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> tensor<f32>, sym_name = "reciprocal_div_neg_infinity"}> ({
    %9 = "tosa.const"() <{values = dense<0xFF800000> : tensor<f32>}> : () -> tensor<f32>
    %10 = "tosa.reciprocal"(%9) : (tensor<f32>) -> tensor<f32>
    "func.return"(%10) : (tensor<f32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> tensor<2xf16>, sym_name = "reciprocal_div_underflow"}> ({
    %7 = "tosa.const"() <{values = dense<[0xFC00, 0x7C00]> : tensor<2xf16>}> : () -> tensor<2xf16>
    %8 = "tosa.reciprocal"(%7) : (tensor<2xf16>) -> tensor<2xf16>
    "func.return"(%8) : (tensor<2xf16>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> tensor<2xf16>, sym_name = "reciprocal_div_overflow"}> ({
    %5 = "tosa.const"() <{values = dense<[1.192090e-07, -1.192090e-07]> : tensor<2xf16>}> : () -> tensor<2xf16>
    %6 = "tosa.reciprocal"(%5) : (tensor<2xf16>) -> tensor<2xf16>
    "func.return"(%6) : (tensor<2xf16>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<?x?xf32>) -> tensor<?x?xf32>, sym_name = "reciprocal_no_fold"}> ({
  ^bb0(%arg0: tensor<?x?xf32>):
    %4 = "tosa.reciprocal"(%arg0) : (tensor<?x?xf32>) -> tensor<?x?xf32>
    "func.return"(%4) : (tensor<?x?xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> tensor<4x6xf32>, sym_name = "reciprocal_fold"}> ({
    %2 = "tosa.const"() <{values = dense<[[1.758000e-01, 0.0873999968, 5.924000e-01, 1.470000e+00, -1.142400e+00, 2.921300e+00], [-2.078000e-01, 1.432500e+00, 1.528300e+00, -1.210000e-02, -2.306000e-01, -1.337700e+00], [-0.0803999975, 7.610000e-02, 5.277000e-01, 1.129200e+00, 2.446000e-01, 6.946000e-01], [4.929000e-01, -6.524000e-01, 1.809200e+00, 1.397000e-01, 1.550500e+00, -1.027000e+00]]> : tensor<4x6xf32>}> : () -> tensor<4x6xf32>
    %3 = "tosa.reciprocal"(%2) : (tensor<4x6xf32>) -> tensor<4x6xf32>
    "func.return"(%3) : (tensor<4x6xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> tensor<32xbf16>, sym_name = "reciprocal_of_const_sparse"}> ({
    %0 = "tosa.const"() <{values = sparse<[[0], [3], [11], [17], [20], [23], [25], [30], [31]], [1.000000e+00, 2.000000e+00, 3.000000e+00, 4.000000e+00, 5.000000e+00, 6.000000e+00, 7.000000e+00, 8.000000e+00, 9.000000e+00]> : tensor<32xbf16>}> : () -> tensor<32xbf16>
    %1 = "tosa.reciprocal"(%0) : (tensor<32xbf16>) -> tensor<32xbf16>
    "func.return"(%1) : (tensor<32xbf16>) -> ()
  }) : () -> ()
}) : () -> ()

