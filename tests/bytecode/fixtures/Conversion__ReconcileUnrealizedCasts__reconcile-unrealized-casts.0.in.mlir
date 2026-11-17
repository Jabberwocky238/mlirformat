"builtin.module"() ({
  "func.func"() <{function_type = (i64) -> i64, sym_name = "unusedCast"}> ({
  ^bb0(%arg0: i64 loc("<stdin>":3:8)):
    %0 = "builtin.unrealized_conversion_cast"(%arg0) : (i64) -> i32 loc("<stdin>":4:10)
    "func.return"(%arg0) : (i64) -> () loc("<stdin>":5:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
