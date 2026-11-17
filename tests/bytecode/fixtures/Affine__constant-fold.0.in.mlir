"builtin.module"() ({
  "func.func"() <{function_type = (index) -> (index, index, index), sym_name = "affine_apply"}> ({
  ^bb0(%arg0: index loc("<stdin>":6:8)):
    %0 = "arith.constant"() <{value = 177 : index}> : () -> index loc("<stdin>":7:10)
    %1 = "arith.constant"() <{value = 211 : index}> : () -> index loc("<stdin>":8:10)
    %2 = "arith.constant"() <{value = 1075 : index}> : () -> index loc("<stdin>":9:10)
    %3 = "affine.apply"(%0, %1, %2) <{map = affine_map<(d0, d1)[s0] -> (d0 floordiv 128 + s0 + d1 mod 128)>}> : (index, index, index) -> index loc("<stdin>":10:10)
    %4 = "affine.apply"(%0, %1, %2) <{map = affine_map<(d0, d1)[s0] -> ((s0 ceildiv 128) * 128)>}> : (index, index, index) -> index loc("<stdin>":11:10)
    %5 = "affine.apply"(%arg0) <{map = affine_map<(d0) -> (42)>}> : (index) -> index loc("<stdin>":12:10)
    "func.return"(%3, %4, %5) : (index, index, index) -> () loc("<stdin>":13:5)
  }) : () -> () loc("<stdin>":5:3)
}) : () -> () loc("<stdin>":4:1)
