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
  "func.func"() <{function_type = (index, index) -> index, sym_name = "arith_muli_non_pure"}> ({
  ^bb0(%arg0: index, %arg1: index):
    %0 = "arith.muli"(%arg0, %arg1) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
    %1 = "test.reify_bound"(%0) <{type = "EQ"}> : (index) -> index
    "func.return"(%1) : (index) -> ()
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
  "func.func"() <{function_type = (index, index) -> index, sym_name = "arith_floordivsi_non_pure"}> ({
  ^bb0(%arg0: index, %arg1: index):
    %0 = "arith.floordivsi"(%arg0, %arg1) : (index, index) -> index
    %1 = "test.reify_bound"(%0) <{type = "EQ"}> : (index) -> index
    "func.return"(%1) : (index) -> ()
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

