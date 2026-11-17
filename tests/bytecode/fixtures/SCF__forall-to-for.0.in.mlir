"builtin.module"() ({
  "func.func"() <{function_type = (index, index) -> (), sym_name = "callee", sym_visibility = "private"}> ({
  }) : () -> () loc("<stdin>":2:3)
  "func.func"() <{function_type = (index, index) -> (), sym_name = "two_iters"}> ({
  ^bb0(%arg0: index loc("<stdin>":5:8), %arg1: index loc("<stdin>":5:22)):
    "scf.forall"(%arg0, %arg1) <{operandSegmentSizes = array<i32: 0, 2, 0, 0>, staticLowerBound = array<i64: 0, 0>, staticStep = array<i64: 1, 1>, staticUpperBound = array<i64: -9223372036854775808, -9223372036854775808>}> ({
    ^bb0(%arg2: index loc("<stdin>":7:10), %arg3: index loc("<stdin>":7:24)):
      "func.call"(%arg2, %arg3) <{callee = @callee}> : (index, index) -> () loc("<stdin>":8:7)
      "scf.forall.in_parallel"() ({
      ^bb0:
      }) : () -> () loc("<stdin>":9:7)
    }) : (index, index) -> () loc("<stdin>":6:5)
    "func.return"() : () -> () loc("<stdin>":13:5)
  }) : () -> () loc("<stdin>":4:3)
}) : () -> () loc("<stdin>":1:1)
