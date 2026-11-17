"builtin.module"() ({
  "func.func"() <{function_type = (i1024, i1024) -> i1024, sym_name = "muli_scalar"}> ({
  ^bb0(%arg0: i1024 loc("<stdin>":3:8), %arg1: i1024 loc("<stdin>":3:22)):
    %0 = "arith.muli"(%arg0, %arg1) <{overflowFlags = #arith.overflow<none>}> : (i1024, i1024) -> i1024 loc("<stdin>":4:10)
    "func.return"(%0) : (i1024) -> () loc("<stdin>":5:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
