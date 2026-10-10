"builtin.module"() ({
  "func.func"() <{function_type = () -> tensor<2xf32>, sym_name = "rewrite_f32_tensor"}> ({
    %0 = "arith.constant"() <{value = dense<[1.000000e+00, 2.000000e+00]> : tensor<2xf32>}> : () -> tensor<2xf32>
    "func.return"(%0) : (tensor<2xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> tensor<3xi32>, sym_name = "rewrite_i32_tensor"}> ({
    %0 = "arith.constant"() <{value = dense<[1, 0, -1]> : tensor<3xi32>}> : () -> tensor<3xi32>
    "func.return"(%0) : (tensor<3xi32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> tensor<2xi1>, sym_name = "rewrite_i1_tensor"}> ({
    %0 = "arith.constant"() <{value = dense<[true, false]> : tensor<2xi1>}> : () -> tensor<2xi1>
    "func.return"(%0) : (tensor<2xi1>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> tensor<f32>, sym_name = "rewrite_rank0_tensor"}> ({
    %0 = "arith.constant"() <{value = dense<1.234500e+00> : tensor<f32>}> : () -> tensor<f32>
    "func.return"(%0) : (tensor<f32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> i32, sym_name = "preserve_scalar_i32"}> ({
    %0 = "arith.constant"() <{value = 42 : i32}> : () -> i32
    "func.return"(%0) : (i32) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> tensor<2xindex>, sym_name = "preserve_index_tensor"}> ({
    %0 = "arith.constant"() <{value = dense<[0, 1]> : tensor<2xindex>}> : () -> tensor<2xindex>
    "func.return"(%0) : (tensor<2xindex>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> tensor<4xf32>, sym_name = "rewrite_resource_tensor"}> ({
    %0 = "arith.constant"() <{value = dense_resource<blob1> : tensor<4xf32>}> : () -> tensor<4xf32>
    "func.return"(%0) : (tensor<4xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> tensor<2xui8>, sym_name = "rewrite_quant_tensor"}> ({
    %0 = "arith.constant"() <{value = dense<[10, 20]> : tensor<2xui8>}> : () -> tensor<2xui8>
    "func.return"(%0) : (tensor<2xui8>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> tensor<2x!quant.uniform<i8:f32, 5.000000e-01>>, sym_name = "rewrite_quant_uniform_tensor"}> ({
    %0 = "arith.constant"() <{value = dense<["10", "20"]> : tensor<2x!quant.uniform<i8:f32, 5.000000e-01>>}> : () -> tensor<2x!quant.uniform<i8:f32, 5.000000e-01>>
    "func.return"(%0) : (tensor<2x!quant.uniform<i8:f32, 5.000000e-01>>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> tensor<2xf8E4M3FN>, sym_name = "rewrite_fp8_tensor"}> ({
    %0 = "arith.constant"() <{value = dense<[1.000000e+00, -5.000000e-01]> : tensor<2xf8E4M3FN>}> : () -> tensor<2xf8E4M3FN>
    "func.return"(%0) : (tensor<2xf8E4M3FN>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> tensor<2x!tosa.mxint8>, sym_name = "rewrite_mxint8_tensor"}> ({
    %0 = "arith.constant"() <{value = dense<["0x00", "0x7F"]> : tensor<2x!tosa.mxint8>}> : () -> tensor<2x!tosa.mxint8>
    "func.return"(%0) : (tensor<2x!tosa.mxint8>) -> ()
  }) : () -> ()
}) : () -> ()

