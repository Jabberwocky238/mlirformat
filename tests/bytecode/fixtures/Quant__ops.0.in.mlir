"builtin.module"() ({
  "func.func"() <{function_type = (!quant.uniform<i8:f32, 1.000000e+00>) -> (), sym_name = "dcast_scalar"}> ({
  ^bb0(%arg0: !quant.uniform<i8:f32, 1.000000e+00> loc("<stdin>":3:8)):
    %0 = "quant.dcast"(%arg0) : (!quant.uniform<i8:f32, 1.000000e+00>) -> f32 loc("<stdin>":4:10)
    "func.return"() : () -> () loc("<stdin>":5:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
