"builtin.module"() ({
  "func.func"() <{function_type = (index, index, index) -> i32, sym_name = "fully_dynamic_bounds"}> ({
  ^bb0(%arg0: index loc("<stdin>":4:8), %arg1: index loc("<stdin>":4:22), %arg2: index loc("<stdin>":4:36)):
    %0 = "arith.constant"() <{value = 0 : i32}> : () -> i32 loc("<stdin>":5:10)
    %1 = "scf.for"(%arg0, %arg1, %arg2, %0) ({
    ^bb0(%arg3: index loc("<stdin>":7:10), %arg4: i32 loc("<stdin>":7:24)):
      %2 = "affine.min"(%arg1, %arg3, %arg2) <{map = affine_map<(d0, d1)[s0] -> (s0, d0 - d1)>}> : (index, index, index) -> index loc("<stdin>":8:12)
      %3 = "arith.index_cast"(%2) : (index) -> i32 loc("<stdin>":9:12)
      %4 = "arith.addi"(%arg4, %3) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32 loc("<stdin>":10:12)
      "scf.yield"(%4) : (i32) -> () loc("<stdin>":11:7)
    }) : (index, index, index, i32) -> i32 loc("<stdin>":6:10)
    "func.return"(%1) : (i32) -> () loc("<stdin>":13:5)
  }) : () -> () loc("<stdin>":3:3)
}) : () -> () loc("<stdin>":2:1)
