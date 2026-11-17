"builtin.module"() ({
  "func.func"() <{function_type = (i16) -> i16, sym_name = "simple_test"}> ({
  ^bb0(%arg0: i16 loc("<stdin>":3:8)):
    %0 = "arith.constant"() <{value = 5 : i16}> : () -> i16 loc("<stdin>":4:10)
    %1 = "arith.addi"(%0, %arg0) <{overflowFlags = #arith.overflow<none>}> : (i16, i16) -> i16 loc("<stdin>":5:10)
    %2 = "arith.addi"(%1, %1) <{overflowFlags = #arith.overflow<none>}> : (i16, i16) -> i16 loc("<stdin>":6:10)
    %3 = "arith.addi"(%2, %1) <{overflowFlags = #arith.overflow<none>}> : (i16, i16) -> i16 loc("<stdin>":7:10)
    "func.return"(%1) : (i16) -> () loc("<stdin>":8:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
