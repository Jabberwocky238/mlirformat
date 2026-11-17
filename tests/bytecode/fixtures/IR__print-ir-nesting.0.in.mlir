"builtin.module"() ({
  %0:4 = "dialect.op1"() {"attribute name" = 42 : i32} : () -> (i1, i16, i32, i64) loc("<stdin>":2:10)
  "dialect.op2"() ({
    "dialect.innerop1"(%0#0, %0#1) : (i1, i16) -> () loc("<stdin>":4:5)
  }, {
    "dialect.innerop2"() : () -> () loc("<stdin>":6:5)
    "dialect.innerop3"(%0#0, %0#2, %0#3)[^bb1, ^bb2] : (i1, i32, i64) -> () loc("<stdin>":7:5)
  ^bb1(%1: i32 loc("<stdin>":8:8)):  // pred: ^bb0
    "dialect.innerop4"() : () -> () loc("<stdin>":9:5)
    "dialect.innerop5"() : () -> () loc("<stdin>":10:5)
  ^bb2(%2: i64 loc("<stdin>":11:8)):  // pred: ^bb0
    "dialect.innerop6"() : () -> () loc("<stdin>":12:5)
    "dialect.innerop7"() : () -> () loc("<stdin>":13:5)
  }) {"other attribute" = 42 : i64} : () -> () loc("<stdin>":3:3)
}) : () -> () loc("<stdin>":1:1)
