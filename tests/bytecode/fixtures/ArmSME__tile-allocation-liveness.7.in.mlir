"builtin.module"() ({
  "func.func"() <{function_type = (vector<[4]xf32>) -> (), sym_name = "cond_branch_with_backedge"}> ({
  ^bb0(%arg0: vector<[4]xf32> loc("<stdin>":4:8)):
    %0 = "arm_sme.get_tile"() : () -> vector<[4]x[4]xf32> loc("<stdin>":5:10)
    %1 = "arm_sme.get_tile"() : () -> vector<[4]x[4]xf32> loc("<stdin>":6:10)
    %2 = "arm_sme.get_tile"() : () -> vector<[4]x[4]xf32> loc("<stdin>":7:10)
    %3 = "arm_sme.get_tile"() : () -> vector<[4]x[4]xf32> loc("<stdin>":8:10)
    %4 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":9:10)
    %5 = "arith.constant"() <{value = 1 : index}> : () -> index loc("<stdin>":10:10)
    %6 = "arith.constant"() <{value = 10 : index}> : () -> index loc("<stdin>":11:10)
    "cf.br"(%4, %0)[^bb1] : (index, vector<[4]x[4]xf32>) -> () loc("<stdin>":12:5)
  ^bb1(%7: index loc("<stdin>":13:8), %8: vector<[4]x[4]xf32> loc("<stdin>":13:19)):  // 2 preds: ^bb0, ^bb2
    %9 = "arith.cmpi"(%7, %6) <{predicate = 2 : i64}> : (index, index) -> i1 loc("<stdin>":14:10)
    "cf.cond_br"(%9, %8, %1, %2, %3)[^bb2, ^bb3] <{operandSegmentSizes = array<i32: 1, 0, 4>}> : (i1, vector<[4]x[4]xf32>, vector<[4]x[4]xf32>, vector<[4]x[4]xf32>, vector<[4]x[4]xf32>) -> () loc("<stdin>":15:5)
  ^bb2:  // pred: ^bb1
    %10 = "arm_sme.insert_tile_slice"(%arg0, %8, %7) <{layout = #arm_sme.layout<horizontal>}> : (vector<[4]xf32>, vector<[4]x[4]xf32>, index) -> vector<[4]x[4]xf32> loc("<stdin>":17:11)
    %11 = "arith.addi"(%7, %5) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index loc("<stdin>":18:11)
    "cf.br"(%11, %10)[^bb1] : (index, vector<[4]x[4]xf32>) -> () loc("<stdin>":19:5)
  ^bb3(%12: vector<[4]x[4]xf32> loc("<stdin>":20:8), %13: vector<[4]x[4]xf32> loc("<stdin>":20:34), %14: vector<[4]x[4]xf32> loc("<stdin>":20:60), %15: vector<[4]x[4]xf32> loc("<stdin>":20:86)):  // pred: ^bb1
    "func.return"() : () -> () loc("<stdin>":21:5)
  }) : () -> () loc("<stdin>":3:3)
}) : () -> () loc("<stdin>":2:1)
