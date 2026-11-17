"builtin.module"() ({
  "func.func"() <{function_type = (f32) -> f32, sym_name = "region_branch_op_followed_by_cf_br"}> ({
  ^bb0(%arg0: f32 loc("<stdin>":4:8)):
    "cf.br"()[^bb1] : () -> () loc("<stdin>":5:5)
  ^bb1:  // pred: ^bb0
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":7:10)
    %1 = "arith.constant"() <{value = 1 : index}> : () -> index loc("<stdin>":8:10)
    %2 = "arith.constant"() <{value = 10 : index}> : () -> index loc("<stdin>":9:10)
    %3 = "scf.for"(%0, %2, %1, %arg0) ({
    ^bb0(%arg1: index loc("<stdin>":11:10), %arg2: f32 loc("<stdin>":11:24)):
      %4 = "arith.addf"(%arg2, %arg2) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32 loc("<stdin>":12:12)
      "scf.yield"(%4) : (f32) -> () loc("<stdin>":13:7)
    }) : (index, index, index, f32) -> f32 loc("<stdin>":10:10)
    "cf.br"()[^bb2] : () -> () loc("<stdin>":15:5)
  ^bb2:  // pred: ^bb1
    "func.return"(%3) : (f32) -> () loc("<stdin>":17:5)
  }) : () -> () loc("<stdin>":3:3)
}) : () -> () loc("<stdin>":2:1)
