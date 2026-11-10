"builtin.module"() ({
  "func.func"() <{function_type = (memref<8xi4>) -> memref<8xi4>, sym_name = "cf_br_block_arg_narrow_type"}> ({
  ^bb0(%arg0: memref<8xi4>):
    "cf.br"(%arg0)[^bb1] : (memref<8xi4>) -> ()
  ^bb1(%0: memref<8xi4>):  // pred: ^bb0
    "func.return"(%0) : (memref<8xi4>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (i1, memref<8xi4>, memref<8xi4>) -> memref<8xi4>, sym_name = "cf_cond_br_block_arg_narrow_type"}> ({
  ^bb0(%arg0: i1, %arg1: memref<8xi4>, %arg2: memref<8xi4>):
    "cf.cond_br"(%arg0, %arg1, %arg2)[^bb1, ^bb2] <{operandSegmentSizes = array<i32: 1, 1, 1>}> : (i1, memref<8xi4>, memref<8xi4>) -> ()
  ^bb1(%0: memref<8xi4>):  // pred: ^bb0
    "func.return"(%0) : (memref<8xi4>) -> ()
  ^bb2(%1: memref<8xi4>):  // pred: ^bb0
    "func.return"(%1) : (memref<8xi4>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (i32, memref<8xi4>) -> memref<8xi4>, sym_name = "cf_switch_block_arg_narrow_type"}> ({
  ^bb0(%arg0: i32, %arg1: memref<8xi4>):
    "cf.switch"(%arg0, %arg1, %arg1, %arg1)[^bb1, ^bb2, ^bb3] <{case_operand_segments = array<i32: 1, 1>, case_values = dense<[0, 1]> : vector<2xi32>, operandSegmentSizes = array<i32: 1, 1, 2>}> : (i32, memref<8xi4>, memref<8xi4>, memref<8xi4>) -> ()
  ^bb1(%0: memref<8xi4>):  // pred: ^bb0
    "func.return"(%0) : (memref<8xi4>) -> ()
  ^bb2(%1: memref<8xi4>):  // pred: ^bb0
    "func.return"(%1) : (memref<8xi4>) -> ()
  ^bb3(%2: memref<8xi4>):  // pred: ^bb0
    "func.return"(%2) : (memref<8xi4>) -> ()
  }) : () -> ()
}) : () -> ()

