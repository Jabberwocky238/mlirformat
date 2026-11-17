"builtin.module"() ({
  "func.func"() <{function_type = (i16) -> f64, sym_name = "uitofp_i16_ext_f64"}> ({
  ^bb0(%arg0: i16 loc("<stdin>":3:8)):
    %0 = "arith.extui"(%arg0) : (i16) -> i64 loc("<stdin>":4:10)
    %1 = "arith.constant"() <{value = 1 : i64}> : () -> i64 loc("<stdin>":5:10)
    %2 = "arith.ori"(%0, %1) : (i64, i64) -> i64 loc("<stdin>":6:10)
    %3 = "arith.uitofp"(%2) : (i64) -> f64 loc("<stdin>":7:10)
    "func.return"(%3) : (f64) -> () loc("<stdin>":8:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
