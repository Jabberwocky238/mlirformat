"builtin.module"() ({
  "func.func"() <{function_type = (f32, f32, i32, i32, f64) -> (), sym_name = "ops"}> ({
  ^bb0(%arg0: f32 loc("<stdin>":3:8), %arg1: f32 loc("<stdin>":3:20), %arg2: i32 loc("<stdin>":3:32), %arg3: i32 loc("<stdin>":3:44), %arg4: f64 loc("<stdin>":3:56)):
    %0 = "math.exp"(%arg0) <{fastmath = #arith.fastmath<none>}> : (f32) -> f32 loc("<stdin>":4:10)
    %1 = "math.exp2"(%arg0) <{fastmath = #arith.fastmath<none>}> : (f32) -> f32 loc("<stdin>":5:10)
    %2 = "math.sqrt"(%arg0) <{fastmath = #arith.fastmath<none>}> : (f32) -> f32 loc("<stdin>":6:10)
    %3 = "math.sqrt"(%arg4) <{fastmath = #arith.fastmath<none>}> : (f64) -> f64 loc("<stdin>":7:10)
    "func.return"() : () -> () loc("<stdin>":8:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
