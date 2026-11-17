"builtin.module"() ({
  "func.func"() <{function_type = (index, index) -> (index, index), sym_name = "no_crash_index_reduction"}> ({
  ^bb0(%arg0: index loc("<stdin>":3:8), %arg1: index loc("<stdin>":3:22)):
    %0 = "arith.constant"() <{value = 1 : index}> : () -> index loc("<stdin>":4:10)
    %1 = "arith.constant"() <{value = 2 : index}> : () -> index loc("<stdin>":5:10)
    %2 = "arith.constant"() <{value = 3 : index}> : () -> index loc("<stdin>":6:10)
    %3 = "arith.constant"() <{value = 6 : index}> : () -> index loc("<stdin>":7:10)
    %4:2 = "scf.parallel"(%0, %2, %1, %3, %0, %2, %arg0, %arg1) <{operandSegmentSizes = array<i32: 2, 2, 2, 2>}> ({
    ^bb0(%arg2: index loc("<stdin>":9:10), %arg3: index loc("<stdin>":9:24)):
      "scf.reduce"(%arg2, %arg3) ({
      ^bb0(%arg6: index loc("<stdin>":11:12), %arg7: index loc("<stdin>":11:26)):
        %6 = "arith.addi"(%arg6, %arg7) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index loc("<stdin>":12:14)
        "scf.reduce.return"(%6) : (index) -> () loc("<stdin>":13:9)
      }, {
      ^bb0(%arg4: index loc("<stdin>":15:12), %arg5: index loc("<stdin>":15:26)):
        %5 = "arith.muli"(%arg4, %arg5) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index loc("<stdin>":16:14)
        "scf.reduce.return"(%5) : (index) -> () loc("<stdin>":17:9)
      }) : (index, index) -> () loc("<stdin>":10:7)
    }) : (index, index, index, index, index, index, index, index) -> (index, index) loc("<stdin>":8:12)
    "func.return"(%4#0, %4#1) : (index, index) -> () loc("<stdin>":20:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
