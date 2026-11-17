"builtin.module"() ({
  "func.func"() <{function_type = (i32) -> (), sym_name = "no_fold_cast_to_f32"}> ({
  ^bb0(%arg1: i32 loc("<stdin>":3:8)):
    %1 = "emitc.cast"(%arg1) : (i32) -> f32 loc("<stdin>":4:10)
    "func.return"() : () -> () loc("<stdin>":5:5)
  }) : () -> () loc("<stdin>":2:3)
  "func.func"() <{function_type = (i32) -> (), sym_name = "fold_cast_to_i64"}> ({
  ^bb0(%arg0: i32 loc("<stdin>":8:8)):
    %0 = "emitc.cast"(%arg0) <{pure}> : (i32) -> i64 loc("<stdin>":9:10)
    "func.return"() : () -> () loc("<stdin>":10:5)
  }) : () -> () loc("<stdin>":7:3)
}) : () -> () loc("<stdin>":1:1)
