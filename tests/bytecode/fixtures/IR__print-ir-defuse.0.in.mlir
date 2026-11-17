"builtin.module"() ({
  %0:4 = "dialect.op1"() : () -> (i1, i16, i32, i64) loc("<stdin>":2:10)
  "dialect.op2"(%0#0, %0#2) : (i1, i32) -> () loc("<stdin>":3:3)
  "dialect.op3"() ({
  ^bb0(%arg0: i1 loc("<stdin>":5:8)):
    "dialect.innerop1"(%arg0, %0#2) : (i1, i32) -> () loc("<stdin>":6:5)
  }) : () -> () loc("<stdin>":4:3)
}) : () -> () loc("<stdin>":1:1)
