"builtin.module"() ({
  "func.func"() <{function_type = (index) -> index, sym_name = "arith_addi"}> ({
  ^bb0(%arg0: index):
    %0 = "arith.constant"() <{value = 5 : index}> : () -> index
    %1 = "arith.addi"(%0, %arg0) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
    %2 = "test.reify_bound"(%1) <{type = "EQ"}> : (index) -> index
    "func.return"(%2) : (index) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (index) -> index, sym_name = "arith_subi"}> ({
  ^bb0(%arg0: index):
    %0 = "arith.constant"() <{value = 5 : index}> : () -> index
    %1 = "arith.subi"(%0, %arg0) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
    %2 = "test.reify_bound"(%1) <{type = "EQ"}> : (index) -> index
    "func.return"(%2) : (index) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (index) -> index, sym_name = "arith_muli"}> ({
  ^bb0(%arg0: index):
    %0 = "arith.constant"() <{value = 5 : index}> : () -> index
    %1 = "arith.muli"(%0, %arg0) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
    %2 = "test.reify_bound"(%1) <{type = "EQ"}> : (index) -> index
    "func.return"(%2) : (index) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (i32) -> index, sym_name = "arith_muli_integer"}> ({
  ^bb0(%arg0: i32):
    %0 = "arith.constant"() <{value = 7 : i32}> : () -> i32
    %1 = "arith.muli"(%arg0, %0) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
    %2 = "test.reify_bound"(%1) <{allow_integer_type, type = "EQ"}> : (i32) -> index
    "func.return"(%2) : (index) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (index) -> index, sym_name = "arith_floordivsi"}> ({
  ^bb0(%arg0: index):
    %0 = "arith.constant"() <{value = 5 : index}> : () -> index
    %1 = "arith.floordivsi"(%arg0, %0) : (index, index) -> index
    %2 = "test.reify_bound"(%1) <{type = "EQ"}> : (index) -> index
    "func.return"(%2) : (index) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (index) -> index, sym_name = "arith_ceildivsi"}> ({
  ^bb0(%arg0: index):
    %0 = "arith.constant"() <{value = 5 : index}> : () -> index
    %1 = "arith.ceildivsi"(%arg0, %0) : (index, index) -> index
    %2 = "test.reify_bound"(%1) <{type = "EQ"}> : (index) -> index
    "func.return"(%2) : (index) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> index, sym_name = "arith_divui_constant"}> ({
    %0 = "arith.constant"() <{value = 7 : index}> : () -> index
    %1 = "arith.constant"() <{value = 5 : index}> : () -> index
    %2 = "arith.divui"(%0, %1) : (index, index) -> index
    %3 = "test.reify_bound"(%2) <{type = "EQ"}> : (index) -> index
    "func.return"(%3) : (index) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> index, sym_name = "arith_divui_positive_lhs"}> ({
    %0 = "arith.constant"() <{value = 7 : index}> : () -> index
    %1 = "arith.constant"() <{value = 5 : index}> : () -> index
    %2 = "arith.constant"() <{value = 1 : index}> : () -> index
    %3 = "arith.maxsi"(%0, %2) : (index, index) -> index
    %4 = "arith.divui"(%3, %1) : (index, index) -> index
    %5 = "test.reify_bound"(%4) <{constant, type = "LB"}> : (index) -> index
    "func.return"(%5) : (index) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> index, sym_name = "arith_divsi_negative_positive"}> ({
    %0 = "arith.constant"() <{value = -7 : index}> : () -> index
    %1 = "arith.constant"() <{value = 5 : index}> : () -> index
    %2 = "arith.divsi"(%0, %1) : (index, index) -> index
    %3 = "test.reify_bound"(%2) <{type = "EQ"}> : (index) -> index
    "func.return"(%3) : (index) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> index, sym_name = "arith_divsi_negative_lhs"}> ({
    %0 = "arith.constant"() <{value = 2 : index}> : () -> index
    %1 = "arith.constant"() <{value = -7 : index}> : () -> index
    %2 = "arith.constant"() <{value = -5 : index}> : () -> index
    %3 = "arith.minsi"(%2, %1) : (index, index) -> index
    %4 = "arith.divsi"(%3, %0) : (index, index) -> index
    %5 = "test.reify_bound"(%4) <{constant, type = "UB"}> : (index) -> index
    "func.return"(%5) : (index) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> (index, index), sym_name = "arith_remsi_positive_positive"}> ({
    %0 = "arith.constant"() <{value = 7 : index}> : () -> index
    %1 = "arith.constant"() <{value = 5 : index}> : () -> index
    %2 = "arith.remsi"(%0, %1) : (index, index) -> index
    %3 = "test.reify_bound"(%2) <{type = "LB"}> : (index) -> index
    %4 = "test.reify_bound"(%2) <{type = "UB"}> : (index) -> index
    "func.return"(%3, %4) : (index, index) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> (index, index), sym_name = "arith_remsi_negative_positive"}> ({
    %0 = "arith.constant"() <{value = -7 : index}> : () -> index
    %1 = "arith.constant"() <{value = 5 : index}> : () -> index
    %2 = "arith.remsi"(%0, %1) : (index, index) -> index
    %3 = "test.reify_bound"(%2) <{type = "LB"}> : (index) -> index
    %4 = "test.reify_bound"(%2) <{type = "UB"}> : (index) -> index
    "func.return"(%3, %4) : (index, index) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> (index, index), sym_name = "arith_remsi_positive_negative"}> ({
    %0 = "arith.constant"() <{value = 7 : index}> : () -> index
    %1 = "arith.constant"() <{value = -5 : index}> : () -> index
    %2 = "arith.remsi"(%0, %1) : (index, index) -> index
    %3 = "test.reify_bound"(%2) <{type = "LB"}> : (index) -> index
    %4 = "test.reify_bound"(%2) <{type = "UB"}> : (index) -> index
    "func.return"(%3, %4) : (index, index) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> (index, index), sym_name = "arith_remsi_negative_negative"}> ({
    %0 = "arith.constant"() <{value = -7 : index}> : () -> index
    %1 = "arith.constant"() <{value = -5 : index}> : () -> index
    %2 = "arith.remsi"(%0, %1) : (index, index) -> index
    %3 = "test.reify_bound"(%2) <{type = "LB"}> : (index) -> index
    %4 = "test.reify_bound"(%2) <{type = "UB"}> : (index) -> index
    "func.return"(%3, %4) : (index, index) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (index) -> index, sym_name = "arith_remsi_positive_lhs_symbolic_positive_rhs"}> ({
  ^bb0(%arg0: index):
    %0 = "arith.constant"() <{value = 1 : index}> : () -> index
    %1 = "arith.constant"() <{value = 7 : index}> : () -> index
    %2 = "arith.maxsi"(%arg0, %0) : (index, index) -> index
    %3 = "arith.remsi"(%1, %2) : (index, index) -> index
    %4 = "test.reify_bound"(%3) <{constant, type = "LB"}> : (index) -> index
    "func.return"(%4) : (index) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (index) -> index, sym_name = "arith_remsi_negative_lhs_symbolic_positive_rhs"}> ({
  ^bb0(%arg0: index):
    %0 = "arith.constant"() <{value = 1 : index}> : () -> index
    %1 = "arith.constant"() <{value = -7 : index}> : () -> index
    %2 = "arith.maxsi"(%arg0, %0) : (index, index) -> index
    %3 = "arith.remsi"(%1, %2) : (index, index) -> index
    %4 = "test.reify_bound"(%3) <{constant, type = "UB"}> : (index) -> index
    "func.return"(%4) : (index) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> (index, index), sym_name = "arith_remui_constant"}> ({
    %0 = "arith.constant"() <{value = 7 : index}> : () -> index
    %1 = "arith.constant"() <{value = 5 : index}> : () -> index
    %2 = "arith.remui"(%0, %1) : (index, index) -> index
    %3 = "test.reify_bound"(%2) <{type = "LB"}> : (index) -> index
    %4 = "test.reify_bound"(%2) <{type = "UB"}> : (index) -> index
    "func.return"(%3, %4) : (index, index) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (index) -> index, sym_name = "arith_remui_symbolic_dividend"}> ({
  ^bb0(%arg0: index):
    %0 = "arith.constant"() <{value = 5 : index}> : () -> index
    %1 = "arith.remui"(%arg0, %0) : (index, index) -> index
    %2 = "test.reify_bound"(%1) <{constant, type = "UB"}> : (index) -> index
    "func.return"(%2) : (index) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> index, sym_name = "arith_const"}> ({
    %0 = "arith.constant"() <{value = 5 : index}> : () -> index
    %1 = "test.reify_bound"(%0) <{type = "EQ"}> : (index) -> index
    "func.return"(%1) : (index) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> index, sym_name = "arith_addi_integer_constant"}> ({
    %0 = "arith.constant"() <{value = 5 : i32}> : () -> i32
    %1 = "arith.constant"() <{value = 7 : i32}> : () -> i32
    %2 = "arith.addi"(%0, %1) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
    %3 = "test.reify_bound"(%2) <{allow_integer_type, constant, type = "EQ"}> : (i32) -> index
    "func.return"(%3) : (index) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (i1) -> (index, index), sym_name = "arith_select"}> ({
  ^bb0(%arg0: i1):
    %0 = "arith.constant"() <{value = 5 : index}> : () -> index
    %1 = "arith.constant"() <{value = 9 : index}> : () -> index
    %2 = "arith.select"(%arg0, %0, %1) : (i1, index, index) -> index
    %3 = "test.reify_bound"(%2) <{type = "LB"}> : (index) -> index
    %4 = "test.reify_bound"(%2) <{type = "UB"}> : (index) -> index
    "func.return"(%3, %4) : (index, index) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?xf32>, tensor<?xf32>, tensor<?xi1>) -> index, sym_name = "arith_select_elementwise"}> ({
  ^bb0(%arg0: tensor<?xf32>, %arg1: tensor<?xf32>, %arg2: tensor<?xi1>):
    %0 = "arith.select"(%arg2, %arg0, %arg1) : (tensor<?xi1>, tensor<?xf32>, tensor<?xf32>) -> tensor<?xf32>
    %1 = "test.reify_bound"(%0) <{dim = 0 : i64, type = "EQ"}> : (tensor<?xf32>) -> index
    "func.return"(%1) : (index) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (index) -> index, sym_name = "arith_minsi"}> ({
  ^bb0(%arg0: index):
    %0 = "arith.constant"() <{value = 4 : index}> : () -> index
    %1 = "arith.minsi"(%arg0, %0) : (index, index) -> index
    %2 = "test.reify_bound"(%1) <{type = "UB"}> : (index) -> index
    "func.return"(%2) : (index) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (index) -> index, sym_name = "arith_maxsi"}> ({
  ^bb0(%arg0: index):
    %0 = "arith.constant"() <{value = 4 : index}> : () -> index
    %1 = "arith.maxsi"(%arg0, %0) : (index, index) -> index
    %2 = "test.reify_bound"(%1) <{type = "LB"}> : (index) -> index
    "func.return"(%2) : (index) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> index, sym_name = "arith_extsi_const"}> ({
    %0 = "arith.constant"() <{value = -5 : i32}> : () -> i32
    %1 = "arith.extsi"(%0) : (i32) -> i64
    %2 = "test.reify_bound"(%1) <{allow_integer_type, constant, type = "EQ"}> : (i64) -> index
    "func.return"(%2) : (index) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> index, sym_name = "arith_minui"}> ({
    %0 = "arith.constant"() <{value = 4 : index}> : () -> index
    %1 = "arith.constant"() <{value = 10 : index}> : () -> index
    %2 = "arith.minui"(%1, %0) : (index, index) -> index
    %3 = "test.reify_bound"(%2) <{type = "UB"}> : (index) -> index
    "func.return"(%3) : (index) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> index, sym_name = "arith_maxui"}> ({
    %0 = "arith.constant"() <{value = 4 : index}> : () -> index
    %1 = "arith.constant"() <{value = 10 : index}> : () -> index
    %2 = "arith.maxui"(%1, %0) : (index, index) -> index
    %3 = "test.reify_bound"(%2) <{type = "LB"}> : (index) -> index
    "func.return"(%3) : (index) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (index) -> index, sym_name = "arith_maxui_unknown_operand"}> ({
  ^bb0(%arg0: index):
    %0 = "arith.constant"() <{value = 4 : index}> : () -> index
    %1 = "arith.maxui"(%arg0, %0) : (index, index) -> index
    %2 = "test.reify_bound"(%1) <{constant, type = "LB"}> : (index) -> index
    "func.return"(%2) : (index) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> index, sym_name = "arith_minui_wraparound"}> ({
    %0 = "arith.constant"() <{value = -1 : i8}> : () -> i8
    %1 = "arith.constant"() <{value = 10 : i8}> : () -> i8
    %2 = "arith.minui"(%0, %1) : (i8, i8) -> i8
    %3 = "test.reify_bound"(%2) <{allow_integer_type, type = "UB"}> : (i8) -> index
    "func.return"(%3) : (index) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> index, sym_name = "arith_maxui_wraparound"}> ({
    %0 = "arith.constant"() <{value = -1 : i8}> : () -> i8
    %1 = "arith.constant"() <{value = 10 : i8}> : () -> i8
    %2 = "arith.maxui"(%0, %1) : (i8, i8) -> i8
    %3 = "test.reify_bound"(%2) <{allow_integer_type, type = "LB"}> : (i8) -> index
    "func.return"(%3) : (index) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> index, sym_name = "arith_maxui_addi"}> ({
    %0 = "arith.constant"() <{value = 4 : index}> : () -> index
    %1 = "arith.constant"() <{value = 10 : index}> : () -> index
    %2 = "arith.addi"(%0, %1) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
    %3 = "arith.maxui"(%2, %0) : (index, index) -> index
    %4 = "test.reify_bound"(%3) <{constant, type = "LB"}> : (index) -> index
    "func.return"(%4) : (index) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (index) -> index, sym_name = "arith_minui_nonneg_symbolic"}> ({
  ^bb0(%arg0: index):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = 4 : index}> : () -> index
    %2 = "arith.maxsi"(%arg0, %0) : (index, index) -> index
    %3 = "arith.minui"(%2, %1) : (index, index) -> index
    %4 = "test.reify_bound"(%3) <{constant, type = "UB"}> : (index) -> index
    "func.return"(%4) : (index) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (index) -> index, sym_name = "arith_minui_negative_symbolic"}> ({
  ^bb0(%arg0: index):
    %0 = "arith.constant"() <{value = -1 : index}> : () -> index
    %1 = "arith.constant"() <{value = 4 : index}> : () -> index
    %2 = "arith.minsi"(%arg0, %0) : (index, index) -> index
    %3 = "arith.minui"(%2, %1) : (index, index) -> index
    %4 = "test.reify_bound"(%3) <{constant, type = "UB"}> : (index) -> index
    "func.return"(%4) : (index) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (index) -> index, sym_name = "arith_maxui_nonneg_symbolic"}> ({
  ^bb0(%arg0: index):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = 4 : index}> : () -> index
    %2 = "arith.maxsi"(%arg0, %0) : (index, index) -> index
    %3 = "arith.maxui"(%2, %1) : (index, index) -> index
    %4 = "test.reify_bound"(%3) <{constant, type = "LB"}> : (index) -> index
    "func.return"(%4) : (index) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (index) -> index, sym_name = "arith_maxui_negative_symbolic"}> ({
  ^bb0(%arg0: index):
    %0 = "arith.constant"() <{value = -1 : index}> : () -> index
    %1 = "arith.constant"() <{value = 4 : index}> : () -> index
    %2 = "arith.minsi"(%arg0, %0) : (index, index) -> index
    %3 = "arith.maxui"(%2, %1) : (index, index) -> index
    %4 = "test.reify_bound"(%3) <{constant, type = "LB"}> : (index) -> index
    "func.return"(%4) : (index) -> ()
  }) : () -> ()
}) : () -> ()

