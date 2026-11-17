"builtin.module"() ({
  "func.func"() <{function_type = () -> i32, sym_name = "fully_static_bounds"}> ({
    %0 = "arith.constant"() <{value = 0 : i32}> : () -> i32 loc("<stdin>":4:10)
    %1 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":5:10)
    %2 = "arith.constant"() <{value = 4 : index}> : () -> index loc("<stdin>":6:10)
    %3 = "arith.constant"() <{value = 17 : index}> : () -> index loc("<stdin>":7:10)
    %4 = "scf.for"(%1, %3, %2, %0) ({
    ^bb0(%arg0: index loc("<stdin>":9:10), %arg1: i32 loc("<stdin>":9:24)):
      %5 = "affine.min"(%3, %arg0, %2) <{map = affine_map<(d0, d1)[s0] -> (s0, d0 - d1)>}> : (index, index, index) -> index loc("<stdin>":10:12)
      %6 = "arith.index_cast"(%5) : (index) -> i32 loc("<stdin>":11:12)
      %7 = "arith.addi"(%arg1, %6) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32 loc("<stdin>":12:12)
      "scf.yield"(%7) : (i32) -> () loc("<stdin>":13:7)
    }) : (index, index, index, i32) -> i32 loc("<stdin>":8:10)
    "func.return"(%4) : (i32) -> () loc("<stdin>":15:5)
  }) : () -> () loc("<stdin>":3:3)
}) : () -> () loc("<stdin>":2:1)
