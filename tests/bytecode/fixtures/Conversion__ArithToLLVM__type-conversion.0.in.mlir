"builtin.module"() ({
  "func.func"() <{function_type = (i1, i17, i17) -> i17, sym_name = "arith_select"}> ({
  ^bb0(%arg0: i1 loc("<stdin>":3:8), %arg1: i17 loc("<stdin>":3:19), %arg2: i17 loc("<stdin>":3:31)):
    %0 = "arith.select"(%arg0, %arg1, %arg2) : (i1, i17, i17) -> i17 loc("<stdin>":4:10)
    "func.return"(%0) : (i17) -> () loc("<stdin>":5:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
