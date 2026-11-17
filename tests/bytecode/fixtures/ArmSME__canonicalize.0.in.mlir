"builtin.module"() ({
  "func.func"() <{function_type = (memref<?x?xi32>) -> (), sym_name = "unused_ssa_tile_is_removed_from_blocks"}> ({
  ^bb0(%arg0: memref<?x?xi32> loc("<stdin>":3:8)):
    %0 = "arith.constant"() <{value = 10 : index}> : () -> index loc("<stdin>":4:10)
    %1 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":5:10)
    %2 = "arith.constant"() <{value = 1 : index}> : () -> index loc("<stdin>":6:10)
    %3 = "arm_sme.get_tile"() : () -> vector<[4]x[4]xf32> loc("<stdin>":7:10)
    "cf.br"(%1, %3)[^bb1] : (index, vector<[4]x[4]xf32>) -> () loc("<stdin>":8:5)
  ^bb1(%4: index loc("<stdin>":9:8), %5: vector<[4]x[4]xf32> loc("<stdin>":9:19)):  // 2 preds: ^bb0, ^bb2
    %6 = "arith.cmpi"(%4, %0) <{predicate = 2 : i64}> : (index, index) -> i1 loc("<stdin>":10:10)
    "cf.cond_br"(%6)[^bb2, ^bb3] <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (i1) -> () loc("<stdin>":11:5)
  ^bb2:  // pred: ^bb1
    %7 = "arith.addi"(%4, %2) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index loc("<stdin>":13:10)
    "cf.br"(%7, %3)[^bb1] : (index, vector<[4]x[4]xf32>) -> () loc("<stdin>":14:5)
  ^bb3:  // pred: ^bb1
    "func.return"() : () -> () loc("<stdin>":16:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
