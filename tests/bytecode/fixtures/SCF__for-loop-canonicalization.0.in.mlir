"builtin.module"() ({
  "func.func"() <{function_type = (memref<i64>) -> (), sym_name = "scf_for_canonicalize_min"}> ({
  ^bb0(%arg0: memref<i64> loc("<stdin>":4:8)):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":5:10)
    %1 = "arith.constant"() <{value = 2 : index}> : () -> index loc("<stdin>":6:10)
    %2 = "arith.constant"() <{value = 4 : index}> : () -> index loc("<stdin>":7:10)
    "scf.for"(%0, %2, %1) ({
    ^bb0(%arg1: index loc("<stdin>":9:10)):
      %3 = "affine.min"(%arg1, %2) <{map = affine_map<(d0, d1) -> (2, d1 - d0)>}> : (index, index) -> index loc("<stdin>":10:12)
      %4 = "arith.index_cast"(%3) : (index) -> i64 loc("<stdin>":11:12)
      "memref.store"(%4, %arg0) : (i64, memref<i64>) -> () loc("<stdin>":12:7)
      "scf.yield"() : () -> () loc("<stdin>":13:7)
    }) : (index, index, index) -> () loc("<stdin>":8:5)
    "func.return"() : () -> () loc("<stdin>":15:5)
  }) : () -> () loc("<stdin>":3:3)
}) : () -> () loc("<stdin>":2:1)
