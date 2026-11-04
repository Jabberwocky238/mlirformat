"builtin.module"() ({
  "func.func"() <{function_type = (i1, memref<2xf32>, memref<2xf32>) -> (), sym_name = "condBranch"}> ({
  ^bb0(%arg0: i1, %arg1: memref<2xf32>, %arg2: memref<2xf32>):
    "cf.cond_br"(%arg0, %arg1)[^bb2, ^bb1] <{operandSegmentSizes = array<i32: 1, 1, 0>}> : (i1, memref<2xf32>) -> ()
  ^bb1:  // pred: ^bb0
    %0 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<2xf32>
    "test.buffer_based"(%arg1, %0) : (memref<2xf32>, memref<2xf32>) -> ()
    "cf.br"(%0)[^bb2] : (memref<2xf32>) -> ()
  ^bb2(%1: memref<2xf32>):  // 2 preds: ^bb0, ^bb1
    "test.copy"(%1, %arg2) : (memref<2xf32>, memref<2xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (i1, memref<?xf32>, memref<?xf32>, index) -> (), sym_name = "condBranchDynamicType"}> ({
  ^bb0(%arg0: i1, %arg1: memref<?xf32>, %arg2: memref<?xf32>, %arg3: index):
    "cf.cond_br"(%arg0, %arg1, %arg3)[^bb2, ^bb1] <{operandSegmentSizes = array<i32: 1, 1, 1>}> : (i1, memref<?xf32>, index) -> ()
  ^bb1(%0: index):  // pred: ^bb0
    %1 = "memref.alloc"(%0) <{operandSegmentSizes = array<i32: 1, 0>}> : (index) -> memref<?xf32>
    "test.buffer_based"(%arg1, %1) : (memref<?xf32>, memref<?xf32>) -> ()
    "cf.br"(%1)[^bb2] : (memref<?xf32>) -> ()
  ^bb2(%2: memref<?xf32>):  // 2 preds: ^bb0, ^bb1
    "test.copy"(%2, %arg2) : (memref<?xf32>, memref<?xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (i1, memref<*xf32>, memref<*xf32>, index) -> (), sym_name = "condBranchUnrankedType"}> ({
  ^bb0(%arg0: i1, %arg1: memref<*xf32>, %arg2: memref<*xf32>, %arg3: index):
    "cf.cond_br"(%arg0, %arg1, %arg3)[^bb2, ^bb1] <{operandSegmentSizes = array<i32: 1, 1, 1>}> : (i1, memref<*xf32>, index) -> ()
  ^bb1(%0: index):  // pred: ^bb0
    %1 = "memref.alloc"(%0) <{operandSegmentSizes = array<i32: 1, 0>}> : (index) -> memref<?xf32>
    %2 = "memref.cast"(%1) : (memref<?xf32>) -> memref<*xf32>
    "test.buffer_based"(%arg1, %2) : (memref<*xf32>, memref<*xf32>) -> ()
    "cf.br"(%2)[^bb2] : (memref<*xf32>) -> ()
  ^bb2(%3: memref<*xf32>):  // 2 preds: ^bb0, ^bb1
    "test.copy"(%3, %arg2) : (memref<*xf32>, memref<*xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (i1, memref<?xf32>, memref<?xf32>, index) -> (), sym_name = "condBranchDynamicTypeNested"}> ({
  ^bb0(%arg0: i1, %arg1: memref<?xf32>, %arg2: memref<?xf32>, %arg3: index):
    "cf.cond_br"(%arg0, %arg3)[^bb1, ^bb2] <{operandSegmentSizes = array<i32: 1, 0, 1>}> : (i1, index) -> ()
  ^bb1:  // pred: ^bb0
    "cf.br"(%arg1)[^bb6] : (memref<?xf32>) -> ()
  ^bb2(%0: index):  // pred: ^bb0
    %1 = "memref.alloc"(%0) <{operandSegmentSizes = array<i32: 1, 0>}> : (index) -> memref<?xf32>
    "test.buffer_based"(%arg1, %1) : (memref<?xf32>, memref<?xf32>) -> ()
    "cf.cond_br"(%arg0)[^bb3, ^bb4] <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (i1) -> ()
  ^bb3:  // pred: ^bb2
    "cf.br"(%1)[^bb5] : (memref<?xf32>) -> ()
  ^bb4:  // pred: ^bb2
    "cf.br"(%1)[^bb5] : (memref<?xf32>) -> ()
  ^bb5(%2: memref<?xf32>):  // 2 preds: ^bb3, ^bb4
    "cf.br"(%2)[^bb6] : (memref<?xf32>) -> ()
  ^bb6(%3: memref<?xf32>):  // 2 preds: ^bb1, ^bb5
    "cf.br"(%3)[^bb7] : (memref<?xf32>) -> ()
  ^bb7(%4: memref<?xf32>):  // pred: ^bb6
    "test.copy"(%4, %arg2) : (memref<?xf32>, memref<?xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (i1, memref<2xf32>, memref<2xf32>) -> (), sym_name = "criticalEdge"}> ({
  ^bb0(%arg0: i1, %arg1: memref<2xf32>, %arg2: memref<2xf32>):
    "cf.cond_br"(%arg0, %arg1)[^bb1, ^bb2] <{operandSegmentSizes = array<i32: 1, 0, 1>}> : (i1, memref<2xf32>) -> ()
  ^bb1:  // pred: ^bb0
    %0 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<2xf32>
    "test.buffer_based"(%arg1, %0) : (memref<2xf32>, memref<2xf32>) -> ()
    "cf.br"(%0)[^bb2] : (memref<2xf32>) -> ()
  ^bb2(%1: memref<2xf32>):  // 2 preds: ^bb0, ^bb1
    "test.copy"(%1, %arg2) : (memref<2xf32>, memref<2xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (i1, memref<2xf32>, memref<2xf32>) -> (), sym_name = "invCriticalEdge"}> ({
  ^bb0(%arg0: i1, %arg1: memref<2xf32>, %arg2: memref<2xf32>):
    %0 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<2xf32>
    "test.buffer_based"(%arg1, %0) : (memref<2xf32>, memref<2xf32>) -> ()
    "cf.cond_br"(%arg0, %arg1)[^bb1, ^bb2] <{operandSegmentSizes = array<i32: 1, 0, 1>}> : (i1, memref<2xf32>) -> ()
  ^bb1:  // pred: ^bb0
    "cf.br"(%0)[^bb2] : (memref<2xf32>) -> ()
  ^bb2(%1: memref<2xf32>):  // 2 preds: ^bb0, ^bb1
    "test.copy"(%1, %arg2) : (memref<2xf32>, memref<2xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (i1, memref<2xf32>, memref<2xf32>) -> (), sym_name = "ifElse"}> ({
  ^bb0(%arg0: i1, %arg1: memref<2xf32>, %arg2: memref<2xf32>):
    %0 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<2xf32>
    "test.buffer_based"(%arg1, %0) : (memref<2xf32>, memref<2xf32>) -> ()
    "cf.cond_br"(%arg0, %arg1, %0, %0, %arg1)[^bb1, ^bb2] <{operandSegmentSizes = array<i32: 1, 2, 2>}> : (i1, memref<2xf32>, memref<2xf32>, memref<2xf32>, memref<2xf32>) -> ()
  ^bb1(%1: memref<2xf32>, %2: memref<2xf32>):  // pred: ^bb0
    "cf.br"(%1, %2)[^bb3] : (memref<2xf32>, memref<2xf32>) -> ()
  ^bb2(%3: memref<2xf32>, %4: memref<2xf32>):  // pred: ^bb0
    "cf.br"(%3, %4)[^bb3] : (memref<2xf32>, memref<2xf32>) -> ()
  ^bb3(%5: memref<2xf32>, %6: memref<2xf32>):  // 2 preds: ^bb1, ^bb2
    %7 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<2xf32>
    "test.buffer_based"(%5, %7) : (memref<2xf32>, memref<2xf32>) -> ()
    "test.copy"(%7, %arg2) : (memref<2xf32>, memref<2xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (i1, memref<2xf32>, memref<2xf32>) -> (), sym_name = "ifElseNoUsers"}> ({
  ^bb0(%arg0: i1, %arg1: memref<2xf32>, %arg2: memref<2xf32>):
    %0 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<2xf32>
    "test.buffer_based"(%arg1, %0) : (memref<2xf32>, memref<2xf32>) -> ()
    "cf.cond_br"(%arg0, %arg1, %0, %0, %arg1)[^bb1, ^bb2] <{operandSegmentSizes = array<i32: 1, 2, 2>}> : (i1, memref<2xf32>, memref<2xf32>, memref<2xf32>, memref<2xf32>) -> ()
  ^bb1(%1: memref<2xf32>, %2: memref<2xf32>):  // pred: ^bb0
    "cf.br"(%1, %2)[^bb3] : (memref<2xf32>, memref<2xf32>) -> ()
  ^bb2(%3: memref<2xf32>, %4: memref<2xf32>):  // pred: ^bb0
    "cf.br"(%3, %4)[^bb3] : (memref<2xf32>, memref<2xf32>) -> ()
  ^bb3(%5: memref<2xf32>, %6: memref<2xf32>):  // 2 preds: ^bb1, ^bb2
    "test.copy"(%arg1, %arg2) : (memref<2xf32>, memref<2xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (i1, memref<2xf32>, memref<2xf32>) -> (), sym_name = "ifElseNested"}> ({
  ^bb0(%arg0: i1, %arg1: memref<2xf32>, %arg2: memref<2xf32>):
    %0 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<2xf32>
    "test.buffer_based"(%arg1, %0) : (memref<2xf32>, memref<2xf32>) -> ()
    "cf.cond_br"(%arg0, %arg1, %0, %0, %arg1)[^bb1, ^bb2] <{operandSegmentSizes = array<i32: 1, 2, 2>}> : (i1, memref<2xf32>, memref<2xf32>, memref<2xf32>, memref<2xf32>) -> ()
  ^bb1(%1: memref<2xf32>, %2: memref<2xf32>):  // pred: ^bb0
    "cf.br"(%1, %2)[^bb5] : (memref<2xf32>, memref<2xf32>) -> ()
  ^bb2(%3: memref<2xf32>, %4: memref<2xf32>):  // pred: ^bb0
    "cf.cond_br"(%arg0, %3, %4)[^bb3, ^bb4] <{operandSegmentSizes = array<i32: 1, 1, 1>}> : (i1, memref<2xf32>, memref<2xf32>) -> ()
  ^bb3(%5: memref<2xf32>):  // pred: ^bb2
    "cf.br"(%5, %3)[^bb5] : (memref<2xf32>, memref<2xf32>) -> ()
  ^bb4(%6: memref<2xf32>):  // pred: ^bb2
    "cf.br"(%3, %6)[^bb5] : (memref<2xf32>, memref<2xf32>) -> ()
  ^bb5(%7: memref<2xf32>, %8: memref<2xf32>):  // 3 preds: ^bb1, ^bb3, ^bb4
    %9 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<2xf32>
    "test.buffer_based"(%7, %9) : (memref<2xf32>, memref<2xf32>) -> ()
    "test.copy"(%9, %arg2) : (memref<2xf32>, memref<2xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (i1, memref<2xf32>, memref<2xf32>) -> (), sym_name = "moving_alloc_and_inserting_missing_dealloc"}> ({
  ^bb0(%arg0: i1, %arg1: memref<2xf32>, %arg2: memref<2xf32>):
    "cf.cond_br"(%arg0)[^bb1, ^bb2] <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (i1) -> ()
  ^bb1:  // pred: ^bb0
    %0 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<2xf32>
    "test.buffer_based"(%arg1, %0) : (memref<2xf32>, memref<2xf32>) -> ()
    "cf.br"(%0)[^bb3] : (memref<2xf32>) -> ()
  ^bb2:  // pred: ^bb0
    %1 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<2xf32>
    "test.buffer_based"(%1, %arg1) : (memref<2xf32>, memref<2xf32>) -> ()
    "cf.br"(%1)[^bb3] : (memref<2xf32>) -> ()
  ^bb3(%2: memref<2xf32>):  // 2 preds: ^bb1, ^bb2
    "test.copy"(%2, %arg2) : (memref<2xf32>, memref<2xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (index, memref<?xi8>, i1) -> (), sym_name = "select_aliases"}> ({
  ^bb0(%arg0: index, %arg1: memref<?xi8>, %arg2: i1):
    %0 = "memref.alloc"(%arg0) <{operandSegmentSizes = array<i32: 1, 0>}> : (index) -> memref<?xi8>
    %1 = "memref.alloc"(%arg0) <{operandSegmentSizes = array<i32: 1, 0>}> : (index) -> memref<?xi8>
    %2 = "arith.select"(%arg2, %0, %1) : (i1, memref<?xi8>, memref<?xi8>) -> memref<?xi8>
    "test.copy"(%2, %arg1) : (memref<?xi8>, memref<?xi8>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (index, memref<?xi8>, i1) -> (), sym_name = "select_aliases_not_same_ownership"}> ({
  ^bb0(%arg0: index, %arg1: memref<?xi8>, %arg2: i1):
    %0 = "memref.alloc"(%arg0) <{operandSegmentSizes = array<i32: 1, 0>}> : (index) -> memref<?xi8>
    %1 = "memref.alloca"(%arg0) <{operandSegmentSizes = array<i32: 1, 0>}> : (index) -> memref<?xi8>
    %2 = "arith.select"(%arg2, %0, %1) : (i1, memref<?xi8>, memref<?xi8>) -> memref<?xi8>
    "cf.br"(%2)[^bb1] : (memref<?xi8>) -> ()
  ^bb1(%3: memref<?xi8>):  // pred: ^bb0
    "test.copy"(%3, %arg1) : (memref<?xi8>, memref<?xi8>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (index, memref<?xi8>, i1, i1) -> (), sym_name = "select_captured_in_next_block"}> ({
  ^bb0(%arg0: index, %arg1: memref<?xi8>, %arg2: i1, %arg3: i1):
    %0 = "memref.alloc"(%arg0) <{operandSegmentSizes = array<i32: 1, 0>}> : (index) -> memref<?xi8>
    %1 = "memref.alloca"(%arg0) <{operandSegmentSizes = array<i32: 1, 0>}> : (index) -> memref<?xi8>
    %2 = "arith.select"(%arg2, %0, %1) : (i1, memref<?xi8>, memref<?xi8>) -> memref<?xi8>
    "cf.cond_br"(%arg3, %0, %arg1)[^bb1, ^bb1] <{operandSegmentSizes = array<i32: 1, 1, 1>}> : (i1, memref<?xi8>, memref<?xi8>) -> ()
  ^bb1(%3: memref<?xi8>):  // 2 preds: ^bb0, ^bb0
    "test.copy"(%3, %2) : (memref<?xi8>, memref<?xi8>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "blocks_not_preordered_by_dominance"}> ({
    "cf.br"()[^bb2] : () -> ()
  ^bb1:  // pred: ^bb2
    "test.read_buffer"(%0) : (memref<2xi32>) -> ()
    "func.return"() : () -> ()
  ^bb2:  // pred: ^bb0
    %0 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<2xi32>
    "cf.br"()[^bb1] : () -> ()
  }) : () -> ()
}) : () -> ()

