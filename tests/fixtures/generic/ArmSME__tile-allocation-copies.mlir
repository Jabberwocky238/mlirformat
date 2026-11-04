"builtin.module"() ({
  "func.func"() <{function_type = (vector<[4]x[4]xf32>) -> (), sym_name = "simple_branch"}> ({
  ^bb0(%arg0: vector<[4]x[4]xf32>):
    "cf.br"(%arg0)[^bb1] : (vector<[4]x[4]xf32>) -> ()
  ^bb1(%0: vector<[4]x[4]xf32>):  // pred: ^bb0
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (i1, vector<[4]x[4]xf32>) -> (), sym_name = "cond_branch"}> ({
  ^bb0(%arg0: i1, %arg1: vector<[4]x[4]xf32>):
    "cf.cond_br"(%arg0, %arg1)[^bb1, ^bb2] <{operandSegmentSizes = array<i32: 1, 1, 0>}> : (i1, vector<[4]x[4]xf32>) -> ()
  ^bb1(%0: vector<[4]x[4]xf32>):  // pred: ^bb0
    "func.return"() : () -> ()
  ^bb2:  // pred: ^bb0
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<[4]x[4]xf32>, vector<[4]x[4]xf32>, vector<[4]x[4]xf32>, vector<[4]x[4]xf32>, vector<[4]xf32>) -> (), sym_name = "cond_branch_with_backedge"}> ({
  ^bb0(%arg0: vector<[4]x[4]xf32>, %arg1: vector<[4]x[4]xf32>, %arg2: vector<[4]x[4]xf32>, %arg3: vector<[4]x[4]xf32>, %arg4: vector<[4]xf32>):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = 1 : index}> : () -> index
    %2 = "arith.constant"() <{value = 10 : index}> : () -> index
    "cf.br"(%0, %arg0)[^bb1] : (index, vector<[4]x[4]xf32>) -> ()
  ^bb1(%3: index, %4: vector<[4]x[4]xf32>):  // 2 preds: ^bb0, ^bb2
    %5 = "arith.cmpi"(%3, %2) <{predicate = 2 : i64}> : (index, index) -> i1
    "cf.cond_br"(%5, %4, %arg1, %arg2, %arg3)[^bb2, ^bb3] <{operandSegmentSizes = array<i32: 1, 0, 4>}> : (i1, vector<[4]x[4]xf32>, vector<[4]x[4]xf32>, vector<[4]x[4]xf32>, vector<[4]x[4]xf32>) -> ()
  ^bb2:  // pred: ^bb1
    %6 = "arm_sme.insert_tile_slice"(%arg4, %4, %3) <{layout = #arm_sme.layout<horizontal>}> : (vector<[4]xf32>, vector<[4]x[4]xf32>, index) -> vector<[4]x[4]xf32>
    %7 = "arith.addi"(%3, %1) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
    "cf.br"(%7, %6)[^bb1] : (index, vector<[4]x[4]xf32>) -> ()
  ^bb3(%8: vector<[4]x[4]xf32>, %9: vector<[4]x[4]xf32>, %10: vector<[4]x[4]xf32>, %11: vector<[4]x[4]xf32>):  // pred: ^bb1
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<[4]x[4]xf32>) -> (), sym_name = "tile_dominance"}> ({
  ^bb0(%arg0: vector<[4]x[4]xf32>):
    "cf.br"()[^bb1] : () -> ()
  ^bb1:  // 2 preds: ^bb0, ^bb4
    "test.some_use"(%arg0) : (vector<[4]x[4]xf32>) -> ()
    "func.return"() : () -> ()
  ^bb2:  // no predecessors
    %0 = "arm_sme.get_tile"() : () -> vector<[4]x[4]xf32>
    "cf.br"()[^bb3] : () -> ()
  ^bb3:  // pred: ^bb2
    "test.some_use"(%0) : (vector<[4]x[4]xf32>) -> ()
    "func.return"() : () -> ()
  ^bb4:  // no predecessors
    "cf.br"()[^bb1] : () -> ()
  ^bb5:  // no predecessors
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (i1, vector<[4]x[4]xf32>) -> (), sym_name = "cond_branch_true_and_false_tile_args"}> ({
  ^bb0(%arg0: i1, %arg1: vector<[4]x[4]xf32>):
    "cf.cond_br"(%arg0, %arg1, %arg1)[^bb1, ^bb2] <{operandSegmentSizes = array<i32: 1, 1, 1>}> : (i1, vector<[4]x[4]xf32>, vector<[4]x[4]xf32>) -> ()
  ^bb1(%0: vector<[4]x[4]xf32>):  // pred: ^bb0
    "func.return"() : () -> ()
  ^bb2(%1: vector<[4]x[4]xf32>):  // pred: ^bb0
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (i1) -> (), sym_name = "multiple_predecessors"}> ({
  ^bb0(%arg0: i1):
    "cf.cond_br"(%arg0)[^bb1, ^bb2] <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (i1) -> ()
  ^bb1:  // pred: ^bb0
    %0 = "arm_sme.get_tile"() : () -> vector<[4]x[4]xf32>
    "cf.br"(%0)[^bb3] : (vector<[4]x[4]xf32>) -> ()
  ^bb2:  // pred: ^bb0
    %1 = "arm_sme.zero"() : () -> vector<[4]x[4]xf32>
    "cf.br"(%1)[^bb3] : (vector<[4]x[4]xf32>) -> ()
  ^bb3(%2: vector<[4]x[4]xf32>):  // 2 preds: ^bb1, ^bb2
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

