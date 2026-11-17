"builtin.module"() ({
  "func.func"() <{function_type = (index, index) -> (), sym_name = "func_with_assert"}> ({
  ^bb0(%arg0: index loc("<stdin>":3:8), %arg1: index loc("<stdin>":3:22)):
    %0 = "arith.cmpi"(%arg0, %arg1) <{predicate = 2 : i64}> : (index, index) -> i1 loc("<stdin>":4:10)
    "cf.assert"(%0) <{msg = "%arg0 must be less than %arg1"}> : (i1) -> () loc("<stdin>":5:5)
    "func.return"() : () -> () loc("<stdin>":6:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
