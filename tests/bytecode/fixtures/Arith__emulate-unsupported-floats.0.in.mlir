"builtin.module"() ({
  "func.func"() <{function_type = (bf16) -> bf16, sym_name = "basic_expansion"}> ({
  ^bb0(%arg0: bf16 loc("<stdin>":3:8)):
    %0 = "arith.constant"() <{value = 1.000000e+00 : bf16}> : () -> bf16 loc("<stdin>":4:10)
    %1 = "arith.addf"(%arg0, %0) <{fastmath = #arith.fastmath<none>}> : (bf16, bf16) -> bf16 loc("<stdin>":5:10)
    "func.return"(%1) : (bf16) -> () loc("<stdin>":6:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
