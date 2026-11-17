"builtin.module"() ({
  "builtin.module"() ({
    "func.func"() <{function_type = (i32) -> i32, sym_name = "func1"}> ({
    ^bb0(%arg1: i32 loc("<stdin>":4:10)):
      %3 = "arith.addi"(%arg1, %arg1) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32 loc("<stdin>":5:12)
      %4 = "arith.addi"(%arg1, %arg1) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32 loc("<stdin>":6:12)
      %5 = "arith.addi"(%3, %4) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32 loc("<stdin>":7:12)
      "func.return"(%5) : (i32) -> () loc("<stdin>":8:7)
    }) : () -> () loc("<stdin>":3:5)
  }) : () -> () loc("<stdin>":2:3)
  "gpu.module"() <{sym_name = "gpu_module"}> ({
    "gpu.func"() <{function_type = (i32) -> i32}> ({
    ^bb0(%arg0: i32 loc("<stdin>":13:10)):
      %0 = "arith.addi"(%arg0, %arg0) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32 loc("<stdin>":14:12)
      %1 = "arith.addi"(%arg0, %arg0) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32 loc("<stdin>":15:12)
      %2 = "arith.addi"(%0, %1) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32 loc("<stdin>":16:12)
      "gpu.return"(%2) : (i32) -> () loc("<stdin>":17:7)
    }) {sym_name = "func2"} : () -> () loc("<stdin>":12:5)
  }) : () -> () loc("<stdin>":11:3)
}) : () -> () loc("<stdin>":1:1)
