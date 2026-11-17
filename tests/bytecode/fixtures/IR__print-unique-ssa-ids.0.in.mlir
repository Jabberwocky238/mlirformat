"builtin.module"() ({
  "func.func"() <{function_type = (memref<i32>, memref<i32>) -> (), sym_name = "uniqueSSAIDs"}> ({
  ^bb0(%arg0: memref<i32> loc("<stdin>":3:8), %arg1: memref<i32> loc("<stdin>":3:28)):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":4:10)
    %1 = "arith.constant"() <{value = 1 : index}> : () -> index loc("<stdin>":5:10)
    %2 = "arith.constant"() <{value = 8 : index}> : () -> index loc("<stdin>":6:10)
    "scf.for"(%0, %2, %1) ({
    ^bb0(%arg3: index loc("<stdin>":8:10)):
      %7 = "memref.load"(%arg0) : (memref<i32>) -> i32 loc("<stdin>":9:12)
      %8 = "memref.load"(%arg1) : (memref<i32>) -> i32 loc("<stdin>":10:12)
      %9 = "arith.addi"(%7, %8) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32 loc("<stdin>":11:12)
      %10 = "arith.subi"(%7, %8) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32 loc("<stdin>":12:13)
      "scf.yield"() : () -> () loc("<stdin>":13:7)
    }) : (index, index, index) -> () loc("<stdin>":7:5)
    "scf.for"(%0, %2, %1) ({
    ^bb0(%arg2: index loc("<stdin>":16:10)):
      %3 = "memref.load"(%arg0) : (memref<i32>) -> i32 loc("<stdin>":17:12)
      %4 = "memref.load"(%arg1) : (memref<i32>) -> i32 loc("<stdin>":18:12)
      %5 = "arith.addi"(%3, %4) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32 loc("<stdin>":19:12)
      %6 = "arith.subi"(%3, %4) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32 loc("<stdin>":20:12)
      "scf.yield"() : () -> () loc("<stdin>":21:7)
    }) : (index, index, index) -> () loc("<stdin>":15:5)
    "func.return"() : () -> () loc("<stdin>":23:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
