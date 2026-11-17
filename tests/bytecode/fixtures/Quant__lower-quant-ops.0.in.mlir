"builtin.module"() ({
  "func.func"() <{function_type = (!quant.uniform<i8:f32, 2.000000e+00:10>) -> f32, sym_name = "dcast_per_layer_scalar"}> ({
  ^bb0(%arg0: !quant.uniform<i8:f32, 2.000000e+00:10> loc("<stdin>":3:8)):
    %0 = "quant.dcast"(%arg0) : (!quant.uniform<i8:f32, 2.000000e+00:10>) -> f32 loc("<stdin>":4:10)
    "func.return"(%0) : (f32) -> () loc("<stdin>":5:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
