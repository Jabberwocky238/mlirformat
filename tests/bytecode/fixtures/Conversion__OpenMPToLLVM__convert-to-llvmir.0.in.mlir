"builtin.module"() ({
  "func.func"() <{function_type = (index, index) -> (), sym_name = "foo", sym_visibility = "private"}> ({
  }) : () -> () loc("<stdin>":2:3)
  "func.func"() <{function_type = () -> (), sym_name = "critical_block_arg"}> ({
    "omp.critical"() ({
    ^bb0(%arg0: index loc("<stdin>":6:10), %arg1: index loc("<stdin>":6:24)):
      "func.call"(%arg0, %arg1) <{callee = @foo}> : (index, index) -> () loc("<stdin>":7:7)
      "omp.terminator"() : () -> () loc("<stdin>":8:7)
    }) : () -> () loc("<stdin>":5:5)
    "func.return"() : () -> () loc("<stdin>":10:5)
  }) : () -> () loc("<stdin>":4:3)
}) : () -> () loc("<stdin>":1:1)
