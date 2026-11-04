"builtin.module"() ({
  "func.func"() <{function_type = (!quant.uniform<i8:f32, 1.000000e+00>) -> (), sym_name = "dcast_scalar"}> ({
  ^bb0(%arg0: !quant.uniform<i8:f32, 1.000000e+00>):
    %0 = "quant.dcast"(%arg0) : (!quant.uniform<i8:f32, 1.000000e+00>) -> f32
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<2x?x4x!quant.uniform<i8:f32, 1.000000e+00>>) -> (), sym_name = "dcast_ranked"}> ({
  ^bb0(%arg0: tensor<2x?x4x!quant.uniform<i8:f32, 1.000000e+00>>):
    %0 = "quant.dcast"(%arg0) : (tensor<2x?x4x!quant.uniform<i8:f32, 1.000000e+00>>) -> tensor<2x?x4xf32>
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<*x!quant.uniform<i8:f32, 1.000000e+00>>) -> (), sym_name = "dcast_unranked"}> ({
  ^bb0(%arg0: tensor<*x!quant.uniform<i8:f32, 1.000000e+00>>):
    %0 = "quant.dcast"(%arg0) : (tensor<*x!quant.uniform<i8:f32, 1.000000e+00>>) -> tensor<*xf32>
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<1x2x3x!quant.uniform<i8:f32:2, {1.000000e+00,2.000000e+00,3.000000e+00}>>) -> (), sym_name = "dcast_per_axis_static"}> ({
  ^bb0(%arg0: tensor<1x2x3x!quant.uniform<i8:f32:2, {1.000000e+00,2.000000e+00,3.000000e+00}>>):
    %0 = "quant.dcast"(%arg0) : (tensor<1x2x3x!quant.uniform<i8:f32:2, {1.000000e+00,2.000000e+00,3.000000e+00}>>) -> tensor<1x2x3xf32>
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x?x?x!quant.uniform<i8:f32:2, {1.000000e+00,2.000000e+00,3.000000e+00}>>) -> (), sym_name = "dcast_per_axis_dynamic"}> ({
  ^bb0(%arg0: tensor<?x?x?x!quant.uniform<i8:f32:2, {1.000000e+00,2.000000e+00,3.000000e+00}>>):
    %0 = "quant.dcast"(%arg0) : (tensor<?x?x?x!quant.uniform<i8:f32:2, {1.000000e+00,2.000000e+00,3.000000e+00}>>) -> tensor<?x?x?xf32>
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<*x!quant.uniform<i8:f32:2, {1.000000e+00,2.000000e+00,3.000000e+00}>>) -> (), sym_name = "dcast_per_axis_unranked"}> ({
  ^bb0(%arg0: tensor<*x!quant.uniform<i8:f32:2, {1.000000e+00,2.000000e+00,3.000000e+00}>>):
    %0 = "quant.dcast"(%arg0) : (tensor<*x!quant.uniform<i8:f32:2, {1.000000e+00,2.000000e+00,3.000000e+00}>>) -> tensor<*xf32>
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (f32) -> (), sym_name = "qcast_scalar"}> ({
  ^bb0(%arg0: f32):
    %0 = "quant.qcast"(%arg0) : (f32) -> !quant.uniform<i8:f32, 1.000000e+00>
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<2x?x4xf32>) -> (), sym_name = "qcast_ranked"}> ({
  ^bb0(%arg0: tensor<2x?x4xf32>):
    %0 = "quant.qcast"(%arg0) : (tensor<2x?x4xf32>) -> tensor<2x?x4x!quant.uniform<i8:f32, 1.000000e+00>>
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<*xf32>) -> (), sym_name = "qcast_unranked"}> ({
  ^bb0(%arg0: tensor<*xf32>):
    %0 = "quant.qcast"(%arg0) : (tensor<*xf32>) -> tensor<*x!quant.uniform<i8:f32, 1.000000e+00>>
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<1x2x3xf32>) -> (), sym_name = "qcast_per_axis_static"}> ({
  ^bb0(%arg0: tensor<1x2x3xf32>):
    %0 = "quant.qcast"(%arg0) : (tensor<1x2x3xf32>) -> tensor<1x2x3x!quant.uniform<i8:f32:2, {1.000000e+00,2.000000e+00,3.000000e+00}>>
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x?x?xf32>) -> (), sym_name = "qcast_per_axis_dynamic"}> ({
  ^bb0(%arg0: tensor<?x?x?xf32>):
    %0 = "quant.qcast"(%arg0) : (tensor<?x?x?xf32>) -> tensor<?x?x?x!quant.uniform<i8:f32:2, {1.000000e+00,2.000000e+00,3.000000e+00}>>
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<*xf32>) -> (), sym_name = "qcast_per_axis_unranked"}> ({
  ^bb0(%arg0: tensor<*xf32>):
    %0 = "quant.qcast"(%arg0) : (tensor<*xf32>) -> tensor<*x!quant.uniform<i8:f32:2, {1.000000e+00,2.000000e+00,3.000000e+00}>>
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (i8) -> (), sym_name = "scast_scalar"}> ({
  ^bb0(%arg0: i8):
    %0 = "quant.scast"(%arg0) : (i8) -> !quant.uniform<i8:f32, 1.000000e+00>
    %1 = "quant.scast"(%0) : (!quant.uniform<i8:f32, 1.000000e+00>) -> i8
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<2x?x4xi8>) -> (), sym_name = "scast_ranked"}> ({
  ^bb0(%arg0: tensor<2x?x4xi8>):
    %0 = "quant.scast"(%arg0) : (tensor<2x?x4xi8>) -> tensor<2x?x4x!quant.uniform<i8:f32, 1.000000e+00>>
    %1 = "quant.scast"(%0) : (tensor<2x?x4x!quant.uniform<i8:f32, 1.000000e+00>>) -> tensor<2x?x4xi8>
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<*xi8>) -> (), sym_name = "scast_unranked"}> ({
  ^bb0(%arg0: tensor<*xi8>):
    %0 = "quant.scast"(%arg0) : (tensor<*xi8>) -> tensor<*x!quant.uniform<i8:f32, 1.000000e+00>>
    %1 = "quant.scast"(%0) : (tensor<*x!quant.uniform<i8:f32, 1.000000e+00>>) -> tensor<*xi8>
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<1x2x3xi8>) -> (), sym_name = "scast_per_axis_static"}> ({
  ^bb0(%arg0: tensor<1x2x3xi8>):
    %0 = "quant.scast"(%arg0) : (tensor<1x2x3xi8>) -> tensor<1x2x3x!quant.uniform<i8:f32:2, {1.000000e+00,2.000000e+00,3.000000e+00}>>
    %1 = "quant.scast"(%0) : (tensor<1x2x3x!quant.uniform<i8:f32:2, {1.000000e+00,2.000000e+00,3.000000e+00}>>) -> tensor<1x2x3xi8>
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x?x?xi8>) -> (), sym_name = "scast_per_axis_dynamic"}> ({
  ^bb0(%arg0: tensor<?x?x?xi8>):
    %0 = "quant.scast"(%arg0) : (tensor<?x?x?xi8>) -> tensor<?x?x?x!quant.uniform<i8:f32:2, {1.000000e+00,2.000000e+00,3.000000e+00}>>
    %1 = "quant.scast"(%0) : (tensor<?x?x?x!quant.uniform<i8:f32:2, {1.000000e+00,2.000000e+00,3.000000e+00}>>) -> tensor<?x?x?xi8>
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<*xi8>) -> (), sym_name = "scast_per_axis_unranked"}> ({
  ^bb0(%arg0: tensor<*xi8>):
    %0 = "quant.scast"(%arg0) : (tensor<*xi8>) -> tensor<*x!quant.uniform<i8:f32:2, {1.000000e+00,2.000000e+00,3.000000e+00}>>
    %1 = "quant.scast"(%0) : (tensor<*x!quant.uniform<i8:f32:2, {1.000000e+00,2.000000e+00,3.000000e+00}>>) -> tensor<*xi8>
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<2x4xi8>) -> tensor<2x4xi8>, sym_name = "sub_channel_quantization"}> ({
  ^bb0(%arg0: tensor<2x4xi8>):
    %0 = "quant.scast"(%arg0) : (tensor<2x4xi8>) -> tensor<2x4x!quant.uniform<u8:f32:{0:1, 1:2}, {{2.000000e+02:120, 0.99871999:127}, {2.000000e+02, 0.99871999}}>>
    %1 = "quant.dcast"(%0) : (tensor<2x4x!quant.uniform<u8:f32:{0:1, 1:2}, {{2.000000e+02:120, 0.99871999:127}, {2.000000e+02, 0.99871999}}>>) -> tensor<2x4xf32>
    %2 = "quant.qcast"(%1) : (tensor<2x4xf32>) -> tensor<2x4x!quant.uniform<u8:f32:{0:1, 1:2}, {{2.000000e+02:120, 0.99871999:127}, {2.000000e+02, 0.99871999}}>>
    %3 = "quant.scast"(%2) : (tensor<2x4x!quant.uniform<u8:f32:{0:1, 1:2}, {{2.000000e+02:120, 0.99871999:127}, {2.000000e+02, 0.99871999}}>>) -> tensor<2x4xi8>
    "func.return"(%3) : (tensor<2x4xi8>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<2x?xf32>) -> (), sym_name = "sub_channel_quantization_with_unknown_dims"}> ({
  ^bb0(%arg0: tensor<2x?xf32>):
    %0 = "quant.qcast"(%arg0) : (tensor<2x?xf32>) -> tensor<2x?x!quant.uniform<u8:f32:{0:1, 1:2}, {{2.000000e+02:120, 0.99871999:127}, {2.000000e+02, 0.99871999}}>>
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

