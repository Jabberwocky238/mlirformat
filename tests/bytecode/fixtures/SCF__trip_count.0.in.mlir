"builtin.module"() ({
  "func.func"() <{function_type = (i32, i32) -> i32, sym_name = "trip_count_index_zero_to_zero"}> ({
  ^bb0(%arg0: i32 loc("<stdin>":3:8), %arg1: i32 loc("<stdin>":3:20)):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":4:10)
    %1 = "arith.constant"() <{value = 1 : index}> : () -> index loc("<stdin>":5:10)
    %2 = "scf.for"(%0, %0, %1, %arg0) ({
    ^bb0(%arg2: index loc("<stdin>":7:10), %arg3: i32 loc("<stdin>":7:24)):
      "scf.yield"(%arg1) : (i32) -> () loc("<stdin>":8:7)
    }) : (index, index, index, i32) -> i32 loc("<stdin>":6:10)
    "func.return"(%2) : (i32) -> () loc("<stdin>":10:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
