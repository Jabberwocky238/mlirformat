"builtin.module"() ({
  "func.func"() <{function_type = (f32) -> f32, sym_name = "tanh"}> ({
  ^bb0(%arg0: f32 loc("<stdin>":3:8)):
    %0 = "math.tanh"(%arg0) <{fastmath = #arith.fastmath<none>}> : (f32) -> f32 loc("<stdin>":4:10)
    "func.return"(%0) : (f32) -> () loc("<stdin>":5:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
