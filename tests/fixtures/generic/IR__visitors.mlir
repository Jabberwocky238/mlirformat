"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "structured_cfg"}> ({
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = 1 : index}> : () -> index
    %2 = "arith.constant"() <{value = 10 : index}> : () -> index
    "scf.for"(%1, %2, %1) ({
    ^bb0(%arg0: index):
      %3 = "use0"(%arg0) : (index) -> i1
      "scf.if"(%3) ({
        "use1"(%arg0) : (index) -> ()
        "scf.yield"() : () -> ()
      }, {
        "use2"(%arg0) : (index) -> ()
        "scf.yield"() : () -> ()
      }) : (i1) -> ()
      "use3"(%arg0) : (index) -> ()
      "scf.yield"() : () -> ()
    }) {walk_blocks, walk_regions} : (index, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "unstructured_cfg"}> ({
    "regionOp0"() ({
      "op0"() : () -> ()
      "cf.br"()[^bb2] : () -> ()
    ^bb1:  // no predecessors
      "op1"() : () -> ()
      "cf.br"()[^bb2] : () -> ()
    ^bb2:  // 2 preds: ^bb0, ^bb1
      "op2"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "unordered_cfg_with_loop"}> ({
    "regionOp0"() ({
      %0 = "op0"() : () -> i1
      "cf.cond_br"(%0)[^bb2, ^bb3] <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (i1) -> ()
    ^bb1:  // pred: ^bb2
      "op1"(%1) : (i32) -> ()
      "cf.br"()[^bb5] : () -> ()
    ^bb2:  // 3 preds: ^bb0, ^bb3, ^bb4
      %1 = "op2"() : () -> i32
      "cf.br"()[^bb1] : () -> ()
    ^bb3:  // pred: ^bb0
      "op3"() : () -> ()
      "cf.br"()[^bb2] : () -> ()
    ^bb4:  // no predecessors
      "op4"() : () -> ()
      "cf.br"()[^bb2] : () -> ()
    ^bb5:  // pred: ^bb1
      "op5"() : () -> ()
      "cf.br"()[^bb7] : () -> ()
    ^bb6:  // pred: ^bb6
      "op6"() : () -> ()
      "cf.br"()[^bb6] : () -> ()
    ^bb7:  // pred: ^bb5
      "op7"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

