"builtin.module"() ({
  "func.func"() <{function_type = (f16) -> f8E5M2FNUZ, sym_name = "scalar_trunc"}> ({
  ^bb0(%arg0: f16 loc("<stdin>":3:8)):
    %0 = "arith.truncf"(%arg0) : (f16) -> f8E5M2FNUZ loc("<stdin>":4:10)
    "func.return"(%0) : (f8E5M2FNUZ) -> () loc("<stdin>":5:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
