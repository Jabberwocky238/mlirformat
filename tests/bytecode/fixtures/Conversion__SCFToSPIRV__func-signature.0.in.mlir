"builtin.module"() ({
  "func.func"() <{function_type = (i32) -> i32, sym_name = "add_scalar"}> ({
  ^bb0(%arg1: i32 loc("<stdin>":3:8)):
    %1 = "arith.addi"(%arg1, %arg1) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32 loc("<stdin>":4:10)
    "func.return"(%1) : (i32) -> () loc("<stdin>":5:5)
  }) : () -> () loc("<stdin>":2:3)
  "func.func"() <{function_type = (index) -> index, sym_name = "add_index"}> ({
  ^bb0(%arg0: index loc("<stdin>":8:8)):
    %0 = "arith.addi"(%arg0, %arg0) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index loc("<stdin>":9:10)
    "func.return"(%0) : (index) -> () loc("<stdin>":10:5)
  }) : () -> () loc("<stdin>":7:3)
}) : () -> () loc("<stdin>":1:1)
