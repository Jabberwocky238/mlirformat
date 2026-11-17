"builtin.module"() ({
  "func.func"() <{function_type = (i1, i32) -> i32, sym_name = "test_scf_if_sink"}> ({
  ^bb0(%arg0: i1 loc("<stdin>":3:8), %arg1: i32 loc("<stdin>":3:19)):
    %0 = "arith.addi"(%arg1, %arg1) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32 loc("<stdin>":4:10)
    %1 = "arith.muli"(%arg1, %arg1) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32 loc("<stdin>":5:10)
    %2 = "scf.if"(%arg0) ({
      "scf.yield"(%0) : (i32) -> () loc("<stdin>":7:7)
    }, {
      "scf.yield"(%1) : (i32) -> () loc("<stdin>":9:7)
    }) : (i1) -> i32 loc("<stdin>":6:10)
    "func.return"(%2) : (i32) -> () loc("<stdin>":11:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
