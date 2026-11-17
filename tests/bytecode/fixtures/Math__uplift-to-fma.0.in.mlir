"builtin.module"() ({
  "func.func"() <{function_type = (f32, f32, f32) -> f32, sym_name = "test"}> ({
  ^bb0(%arg0: f32 loc("<stdin>":3:8), %arg1: f32 loc("<stdin>":3:20), %arg2: f32 loc("<stdin>":3:32)):
    %0 = "arith.mulf"(%arg0, %arg1) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32 loc("<stdin>":4:10)
    %1 = "arith.addf"(%0, %arg2) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32 loc("<stdin>":5:10)
    "func.return"(%1) : (f32) -> () loc("<stdin>":6:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
