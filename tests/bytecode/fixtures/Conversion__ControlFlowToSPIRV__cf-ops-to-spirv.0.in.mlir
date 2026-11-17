"builtin.module"() ({
  "func.func"() <{function_type = (i32, i32, i32) -> (), sym_name = "simple_loop"}> ({
  ^bb0(%arg0: i32 loc("<stdin>":3:8), %arg1: i32 loc("<stdin>":3:20), %arg2: i32 loc("<stdin>":3:32)):
    "cf.br"()[^bb1] : () -> () loc("<stdin>":4:5)
  ^bb1:  // pred: ^bb0
    "cf.br"(%arg0)[^bb2] : (i32) -> () loc("<stdin>":6:5)
  ^bb2(%0: i32 loc("<stdin>":7:8)):  // 2 preds: ^bb1, ^bb3
    %1 = "arith.cmpi"(%0, %arg1) <{predicate = 2 : i64}> : (i32, i32) -> i1 loc("<stdin>":8:10)
    "cf.cond_br"(%1)[^bb3, ^bb4] <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (i1) -> () loc("<stdin>":9:5)
  ^bb3:  // pred: ^bb2
    %2 = "arith.addi"(%0, %arg2) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32 loc("<stdin>":11:10)
    "cf.br"(%2)[^bb2] : (i32) -> () loc("<stdin>":12:5)
  ^bb4:  // pred: ^bb2
    "func.return"() : () -> () loc("<stdin>":14:5)
  }) : () -> () loc("<stdin>":2:3)
}) {spirv.target_env = #spirv.target_env<#spirv.vce<v1.0, [], []>, #spirv.resource_limits<>>} : () -> () loc("<stdin>":1:1)
