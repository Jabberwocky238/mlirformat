"builtin.module"() ({
  "func.func"() <{function_type = (index, index, index, index) -> (), sym_name = "parallel_loop"}> ({
  ^bb0(%arg0: index loc("<stdin>":3:8), %arg1: index loc("<stdin>":3:22), %arg2: index loc("<stdin>":3:36), %arg3: index loc("<stdin>":3:50)):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":4:10)
    %1 = "arith.constant"() <{value = 1 : index}> : () -> index loc("<stdin>":5:10)
    %2 = "arith.constant"() <{value = 4 : index}> : () -> index loc("<stdin>":6:10)
    "scf.parallel"(%arg0, %arg1, %arg2, %arg3, %2, %2) <{operandSegmentSizes = array<i32: 2, 2, 2, 0>}> ({
    ^bb0(%arg4: index loc("<stdin>":8:10), %arg5: index loc("<stdin>":8:24)):
      "scf.parallel"(%0, %0, %2, %2, %1, %1) <{operandSegmentSizes = array<i32: 2, 2, 2, 0>}> ({
      ^bb0(%arg6: index loc("<stdin>":10:12), %arg7: index loc("<stdin>":10:26)):
        "scf.reduce"() : () -> () loc("<stdin>":11:9)
      }) : (index, index, index, index, index, index) -> () loc("<stdin>":9:7)
      "scf.reduce"() : () -> () loc("<stdin>":13:7)
    }) : (index, index, index, index, index, index) -> () loc("<stdin>":7:5)
    "func.return"() : () -> () loc("<stdin>":15:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
