"builtin.module"() ({
  "func.func"() <{function_type = (index, index, index) -> (), sym_name = "parallel_loop"}> ({
  ^bb0(%arg0: index loc("<stdin>":3:8), %arg1: index loc("<stdin>":3:22), %arg2: index loc("<stdin>":3:36)):
    "scf.parallel"(%arg0, %arg1, %arg2) <{operandSegmentSizes = array<i32: 1, 1, 1, 0>}> ({
    ^bb0(%arg3: index loc("<stdin>":5:10)):
      "scf.reduce"() : () -> () loc("<stdin>":6:7)
    }) : (index, index, index) -> () loc("<stdin>":4:5)
    "func.return"() : () -> () loc("<stdin>":8:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
