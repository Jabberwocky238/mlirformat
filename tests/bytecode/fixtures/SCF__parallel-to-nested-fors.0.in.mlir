"builtin.module"() ({
  "func.func"() <{function_type = (index, index) -> (), sym_name = "callee", sym_visibility = "private"}> ({
  }) : () -> () loc("<stdin>":2:3)
  "func.func"() <{function_type = (index, index, index, index, index, index) -> (), sym_name = "two_iters"}> ({
  ^bb0(%arg0: index loc("<stdin>":5:8), %arg1: index loc("<stdin>":5:22), %arg2: index loc("<stdin>":5:36), %arg3: index loc("<stdin>":5:50), %arg4: index loc("<stdin>":5:64), %arg5: index loc("<stdin>":5:78)):
    "scf.parallel"(%arg0, %arg1, %arg2, %arg3, %arg4, %arg5) <{operandSegmentSizes = array<i32: 2, 2, 2, 0>}> ({
    ^bb0(%arg6: index loc("<stdin>":7:10), %arg7: index loc("<stdin>":7:24)):
      "func.call"(%arg6, %arg7) <{callee = @callee}> : (index, index) -> () loc("<stdin>":8:7)
      "scf.reduce"() : () -> () loc("<stdin>":9:7)
    }) : (index, index, index, index, index, index) -> () loc("<stdin>":6:5)
    "func.return"() : () -> () loc("<stdin>":11:5)
  }) : () -> () loc("<stdin>":4:3)
}) : () -> () loc("<stdin>":1:1)
