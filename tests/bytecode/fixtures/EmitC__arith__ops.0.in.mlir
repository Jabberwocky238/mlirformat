"builtin.module"() ({
  "func.func"() <{function_type = (f32, f32) -> f32, sym_name = "maximumf"}> ({
  ^bb0(%arg6: f32 loc("<stdin>":3:8), %arg7: f32 loc("<stdin>":3:20)):
    %3 = "arith.maximumf"(%arg6, %arg7) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32 loc("<stdin>":4:10)
    "func.return"(%3) : (f32) -> () loc("<stdin>":5:5)
  }) : () -> () loc("<stdin>":2:3)
  "func.func"() <{function_type = (f32, f32) -> f32, sym_name = "minimumf"}> ({
  ^bb0(%arg4: f32 loc("<stdin>":8:8), %arg5: f32 loc("<stdin>":8:20)):
    %2 = "arith.minimumf"(%arg4, %arg5) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32 loc("<stdin>":9:10)
    "func.return"(%2) : (f32) -> () loc("<stdin>":10:5)
  }) : () -> () loc("<stdin>":7:3)
  "func.func"() <{function_type = (i32, i32) -> i32, sym_name = "minsi"}> ({
  ^bb0(%arg2: i32 loc("<stdin>":13:8), %arg3: i32 loc("<stdin>":13:20)):
    %1 = "arith.minsi"(%arg2, %arg3) : (i32, i32) -> i32 loc("<stdin>":14:10)
    "func.return"(%1) : (i32) -> () loc("<stdin>":15:5)
  }) : () -> () loc("<stdin>":12:3)
  "func.func"() <{function_type = (i32, i32) -> i32, sym_name = "maxsi"}> ({
  ^bb0(%arg0: i32 loc("<stdin>":18:8), %arg1: i32 loc("<stdin>":18:20)):
    %0 = "arith.maxsi"(%arg0, %arg1) : (i32, i32) -> i32 loc("<stdin>":19:10)
    "func.return"(%0) : (i32) -> () loc("<stdin>":20:5)
  }) : () -> () loc("<stdin>":17:3)
}) : () -> () loc("<stdin>":1:1)
