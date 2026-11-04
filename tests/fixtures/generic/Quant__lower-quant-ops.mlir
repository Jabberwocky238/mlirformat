"builtin.module"() ({
  "func.func"() <{function_type = (!quant.uniform<i8:f32, 2.000000e+00:10>) -> f32, sym_name = "dcast_per_layer_scalar"}> ({
  ^bb0(%arg0: !quant.uniform<i8:f32, 2.000000e+00:10>):
    %0 = "quant.dcast"(%arg0) : (!quant.uniform<i8:f32, 2.000000e+00:10>) -> f32
    "func.return"(%0) : (f32) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (!quant.uniform<u8:f32, 2.000000e+00:10>) -> f32, sym_name = "dcast_per_layer_scalar_unsigned"}> ({
  ^bb0(%arg0: !quant.uniform<u8:f32, 2.000000e+00:10>):
    %0 = "quant.dcast"(%arg0) : (!quant.uniform<u8:f32, 2.000000e+00:10>) -> f32
    "func.return"(%0) : (f32) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<!quant.uniform<i8:f32, 2.000000e+00:10>>) -> tensor<f32>, sym_name = "dcast_per_layer_0d"}> ({
  ^bb0(%arg0: tensor<!quant.uniform<i8:f32, 2.000000e+00:10>>):
    %0 = "quant.dcast"(%arg0) : (tensor<!quant.uniform<i8:f32, 2.000000e+00:10>>) -> tensor<f32>
    "func.return"(%0) : (tensor<f32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<3x?x5x!quant.uniform<i8:f32, 2.000000e+00:10>>) -> tensor<3x?x5xf32>, sym_name = "dcast_per_layer_ranked"}> ({
  ^bb0(%arg0: tensor<3x?x5x!quant.uniform<i8:f32, 2.000000e+00:10>>):
    %0 = "quant.dcast"(%arg0) : (tensor<3x?x5x!quant.uniform<i8:f32, 2.000000e+00:10>>) -> tensor<3x?x5xf32>
    "func.return"(%0) : (tensor<3x?x5xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<*x!quant.uniform<i8:f32, 2.000000e+00:10>>) -> tensor<*xf32>, sym_name = "dcast_per_layer_unranked"}> ({
  ^bb0(%arg0: tensor<*x!quant.uniform<i8:f32, 2.000000e+00:10>>):
    %0 = "quant.dcast"(%arg0) : (tensor<*x!quant.uniform<i8:f32, 2.000000e+00:10>>) -> tensor<*xf32>
    "func.return"(%0) : (tensor<*xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<4x?x?x5x!quant.uniform<i8:f32:1, {2.000000e+00:10,3.000000e+00:20}>>) -> tensor<4x?x?x5xf32>, sym_name = "dcast_per_channel_ranked"}> ({
  ^bb0(%arg0: tensor<4x?x?x5x!quant.uniform<i8:f32:1, {2.000000e+00:10,3.000000e+00:20}>>):
    %0 = "quant.dcast"(%arg0) : (tensor<4x?x?x5x!quant.uniform<i8:f32:1, {2.000000e+00:10,3.000000e+00:20}>>) -> tensor<4x?x?x5xf32>
    "func.return"(%0) : (tensor<4x?x?x5xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<*x!quant.uniform<i8:f32:2, {2.000000e+00:10,3.000000e+00:20,4.000000e+00:30}>>) -> tensor<*xf32>, sym_name = "dcast_per_channel_unranked"}> ({
  ^bb0(%arg0: tensor<*x!quant.uniform<i8:f32:2, {2.000000e+00:10,3.000000e+00:20,4.000000e+00:30}>>):
    %0 = "quant.dcast"(%arg0) : (tensor<*x!quant.uniform<i8:f32:2, {2.000000e+00:10,3.000000e+00:20,4.000000e+00:30}>>) -> tensor<*xf32>
    "func.return"(%0) : (tensor<*xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (f32) -> !quant.uniform<i8:f32, 2.000000e+00:10>, sym_name = "qcast_per_layer_scalar"}> ({
  ^bb0(%arg0: f32):
    %0 = "quant.qcast"(%arg0) : (f32) -> !quant.uniform<i8:f32, 2.000000e+00:10>
    "func.return"(%0) : (!quant.uniform<i8:f32, 2.000000e+00:10>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (f32) -> !quant.uniform<i8<-5:10>:f32, 2.000000e+00>, sym_name = "qcast_per_layer_scalar_bounds"}> ({
  ^bb0(%arg0: f32):
    %0 = "quant.qcast"(%arg0) : (f32) -> !quant.uniform<i8<-5:10>:f32, 2.000000e+00>
    "func.return"(%0) : (!quant.uniform<i8<-5:10>:f32, 2.000000e+00>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (f32) -> !quant.uniform<u8<2:10>:f32, 2.000000e+00>, sym_name = "qcast_per_layer_scalar_unsigned_bounds"}> ({
  ^bb0(%arg0: f32):
    %0 = "quant.qcast"(%arg0) : (f32) -> !quant.uniform<u8<2:10>:f32, 2.000000e+00>
    "func.return"(%0) : (!quant.uniform<u8<2:10>:f32, 2.000000e+00>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<f32>) -> tensor<!quant.uniform<i8:f32, 2.000000e+00:10>>, sym_name = "qcast_per_layer_0d"}> ({
  ^bb0(%arg0: tensor<f32>):
    %0 = "quant.qcast"(%arg0) : (tensor<f32>) -> tensor<!quant.uniform<i8:f32, 2.000000e+00:10>>
    "func.return"(%0) : (tensor<!quant.uniform<i8:f32, 2.000000e+00:10>>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<3x?x5xf32>) -> tensor<3x?x5x!quant.uniform<i8:f32, 2.000000e+00:10>>, sym_name = "qcast_per_layer_ranked"}> ({
  ^bb0(%arg0: tensor<3x?x5xf32>):
    %0 = "quant.qcast"(%arg0) : (tensor<3x?x5xf32>) -> tensor<3x?x5x!quant.uniform<i8:f32, 2.000000e+00:10>>
    "func.return"(%0) : (tensor<3x?x5x!quant.uniform<i8:f32, 2.000000e+00:10>>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<3x5xf32>) -> tensor<3x5x!quant.uniform<i8<-8:7>:f32, 2.000000e+00:10>>, sym_name = "qcast_per_layer_ranked_bounds"}> ({
  ^bb0(%arg0: tensor<3x5xf32>):
    %0 = "quant.qcast"(%arg0) : (tensor<3x5xf32>) -> tensor<3x5x!quant.uniform<i8<-8:7>:f32, 2.000000e+00:10>>
    "func.return"(%0) : (tensor<3x5x!quant.uniform<i8<-8:7>:f32, 2.000000e+00:10>>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<*xf32>) -> tensor<*x!quant.uniform<i8:f32, 2.000000e+00:10>>, sym_name = "qcast_per_layer_unranked"}> ({
  ^bb0(%arg0: tensor<*xf32>):
    %0 = "quant.qcast"(%arg0) : (tensor<*xf32>) -> tensor<*x!quant.uniform<i8:f32, 2.000000e+00:10>>
    "func.return"(%0) : (tensor<*x!quant.uniform<i8:f32, 2.000000e+00:10>>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<4x?x?x5xf32>) -> tensor<4x?x?x5x!quant.uniform<i8:f32:1, {2.000000e+00:10,3.000000e+00:20}>>, sym_name = "qcast_per_channel_ranked"}> ({
  ^bb0(%arg0: tensor<4x?x?x5xf32>):
    %0 = "quant.qcast"(%arg0) : (tensor<4x?x?x5xf32>) -> tensor<4x?x?x5x!quant.uniform<i8:f32:1, {2.000000e+00:10,3.000000e+00:20}>>
    "func.return"(%0) : (tensor<4x?x?x5x!quant.uniform<i8:f32:1, {2.000000e+00:10,3.000000e+00:20}>>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<4x2x5xf32>) -> tensor<4x2x5x!quant.uniform<i8<-8:7>:f32:1, {2.000000e+00,3.000000e+00}>>, sym_name = "qcast_per_channel_ranked_bounds"}> ({
  ^bb0(%arg0: tensor<4x2x5xf32>):
    %0 = "quant.qcast"(%arg0) : (tensor<4x2x5xf32>) -> tensor<4x2x5x!quant.uniform<i8<-8:7>:f32:1, {2.000000e+00,3.000000e+00}>>
    "func.return"(%0) : (tensor<4x2x5x!quant.uniform<i8<-8:7>:f32:1, {2.000000e+00,3.000000e+00}>>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<*xf32>) -> tensor<*x!quant.uniform<i8:f32:2, {2.000000e+00:10,3.000000e+00:20,4.000000e+00:30}>>, sym_name = "qcast_per_channel_unranked"}> ({
  ^bb0(%arg0: tensor<*xf32>):
    %0 = "quant.qcast"(%arg0) : (tensor<*xf32>) -> tensor<*x!quant.uniform<i8:f32:2, {2.000000e+00:10,3.000000e+00:20,4.000000e+00:30}>>
    "func.return"(%0) : (tensor<*x!quant.uniform<i8:f32:2, {2.000000e+00:10,3.000000e+00:20,4.000000e+00:30}>>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<2x?x?x4xf32>) -> tensor<2x?x?x4x!quant.uniform<i8:f32:{0:1, 3:2}, {{{{2.000000e+00:10, 3.000000e+00:20}}}, {{{4.000000e+00:30, 5.000000e+00:40}}}}>>, sym_name = "qcast_sub_channel_ranked"}> ({
  ^bb0(%arg0: tensor<2x?x?x4xf32>):
    %0 = "quant.qcast"(%arg0) : (tensor<2x?x?x4xf32>) -> tensor<2x?x?x4x!quant.uniform<i8:f32:{0:1, 3:2}, {{{{2.000000e+00:10, 3.000000e+00:20}}}, {{{4.000000e+00:30, 5.000000e+00:40}}}}>>
    "func.return"(%0) : (tensor<2x?x?x4x!quant.uniform<i8:f32:{0:1, 3:2}, {{{{2.000000e+00:10, 3.000000e+00:20}}}, {{{4.000000e+00:30, 5.000000e+00:40}}}}>>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<2x3x5x4xf32>) -> tensor<2x3x5x4x!quant.uniform<i8:f32:{0:1, 3:2}, {{{{2.000000e+00:10, 3.000000e+00:20}}}, {{{4.000000e+00:30, 5.000000e+00:40}}}}>>, sym_name = "qcast_sub_channel_ranked_bounds"}> ({
  ^bb0(%arg0: tensor<2x3x5x4xf32>):
    %0 = "quant.qcast"(%arg0) : (tensor<2x3x5x4xf32>) -> tensor<2x3x5x4x!quant.uniform<i8:f32:{0:1, 3:2}, {{{{2.000000e+00:10, 3.000000e+00:20}}}, {{{4.000000e+00:30, 5.000000e+00:40}}}}>>
    "func.return"(%0) : (tensor<2x3x5x4x!quant.uniform<i8:f32:{0:1, 3:2}, {{{{2.000000e+00:10, 3.000000e+00:20}}}, {{{4.000000e+00:30, 5.000000e+00:40}}}}>>) -> ()
  }) : () -> ()
}) : () -> ()

