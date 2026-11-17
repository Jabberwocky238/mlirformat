"builtin.module"() ({
  "func.func"() <{function_type = (f8E5M2FNUZ) -> f16, sym_name = "scalar_ext"}> ({
  ^bb0(%arg0: f8E5M2FNUZ loc("<stdin>":3:8)):
    %0 = "arith.extf"(%arg0) : (f8E5M2FNUZ) -> f16 loc("<stdin>":4:10)
    "func.return"(%0) : (f16) -> () loc("<stdin>":5:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
