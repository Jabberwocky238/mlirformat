"builtin.module"() ({
^bb0:
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (i64) -> vector<32xf32>, sym_name = "load_step_offsets"}> ({
  ^bb0(%arg0: i64):
    %0 = "vector.step"() : () -> vector<32xindex>
    %1 = "arith.constant"() <{value = dense<true> : vector<32xi1>}> : () -> vector<32xi1>
    %2 = "xegpu.load"(%arg0, %0, %1) : (i64, vector<32xindex>, vector<32xi1>) -> vector<32xf32>
    "func.return"(%2) : (vector<32xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (i64) -> vector<32xi32>, sym_name = "load_dense_ap_offsets"}> ({
  ^bb0(%arg0: i64):
    %0 = "arith.constant"() <{value = dense<[0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31]> : vector<32xindex>}> : () -> vector<32xindex>
    %1 = "arith.constant"() <{value = dense<true> : vector<32xi1>}> : () -> vector<32xi1>
    %2 = "xegpu.load"(%arg0, %0, %1) : (i64, vector<32xindex>, vector<32xi1>) -> vector<32xi32>
    "func.return"(%2) : (vector<32xi32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (i64) -> vector<32xf32>, sym_name = "load_stride4_no_attr"}> ({
  ^bb0(%arg0: i64):
    %0 = "arith.constant"() <{value = 4 : index}> : () -> index
    %1 = "vector.step"() : () -> vector<32xindex>
    %2 = "vector.broadcast"(%0) : (index) -> vector<32xindex>
    %3 = "arith.muli"(%1, %2) <{overflowFlags = #arith.overflow<none>}> : (vector<32xindex>, vector<32xindex>) -> vector<32xindex>
    %4 = "arith.constant"() <{value = dense<true> : vector<32xi1>}> : () -> vector<32xi1>
    %5 = "xegpu.load"(%arg0, %3, %4) : (i64, vector<32xindex>, vector<32xi1>) -> vector<32xf32>
    "func.return"(%5) : (vector<32xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (i64) -> vector<32xf32>, sym_name = "load_broadcast_offsets_no_attr"}> ({
  ^bb0(%arg0: i64):
    %0 = "arith.constant"() <{value = dense<0> : vector<32xindex>}> : () -> vector<32xindex>
    %1 = "arith.constant"() <{value = dense<true> : vector<32xi1>}> : () -> vector<32xi1>
    %2 = "xegpu.load"(%arg0, %0, %1) : (i64, vector<32xindex>, vector<32xi1>) -> vector<32xf32>
    "func.return"(%2) : (vector<32xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (i64, vector<32xi1>) -> vector<32xf32>, sym_name = "load_partial_mask"}> ({
  ^bb0(%arg0: i64, %arg1: vector<32xi1>):
    %0 = "vector.step"() : () -> vector<32xindex>
    %1 = "xegpu.load"(%arg0, %0, %arg1) : (i64, vector<32xindex>, vector<32xi1>) -> vector<32xf32>
    "func.return"(%1) : (vector<32xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (i64, vector<32xf32>) -> (), sym_name = "store_step_offsets"}> ({
  ^bb0(%arg0: i64, %arg1: vector<32xf32>):
    %0 = "vector.step"() : () -> vector<32xindex>
    %1 = "arith.constant"() <{value = dense<true> : vector<32xi1>}> : () -> vector<32xi1>
    "xegpu.store"(%arg1, %arg0, %0, %1) : (vector<32xf32>, i64, vector<32xindex>, vector<32xi1>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (i64) -> vector<1x32xf32>, sym_name = "load_2d_leading_unit"}> ({
  ^bb0(%arg0: i64):
    %0 = "vector.step"() : () -> vector<32xindex>
    %1 = "vector.shape_cast"(%0) : (vector<32xindex>) -> vector<1x32xindex>
    %2 = "arith.constant"() <{value = dense<true> : vector<1x32xi1>}> : () -> vector<1x32xi1>
    %3 = "xegpu.load"(%arg0, %1, %2) : (i64, vector<1x32xindex>, vector<1x32xi1>) -> vector<1x32xf32>
    "func.return"(%3) : (vector<1x32xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (i64) -> vector<2x16xf32>, sym_name = "load_2d_dense_ap"}> ({
  ^bb0(%arg0: i64):
    %0 = "arith.constant"() <{value = dense<[[0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15], [16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31]]> : vector<2x16xindex>}> : () -> vector<2x16xindex>
    %1 = "arith.constant"() <{value = dense<true> : vector<2x16xi1>}> : () -> vector<2x16xi1>
    %2 = "xegpu.load"(%arg0, %0, %1) : (i64, vector<2x16xindex>, vector<2x16xi1>) -> vector<2x16xf32>
    "func.return"(%2) : (vector<2x16xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (i64) -> vector<2x16xf32>, sym_name = "load_2d_non_ap"}> ({
  ^bb0(%arg0: i64):
    %0 = "arith.constant"() <{value = dense<[[0, 1, 2, 3, 4, 5, 6, 7, 100, 9, 10, 11, 12, 13, 14, 15], [16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31]]> : vector<2x16xindex>}> : () -> vector<2x16xindex>
    %1 = "arith.constant"() <{value = dense<true> : vector<2x16xi1>}> : () -> vector<2x16xi1>
    %2 = "xegpu.load"(%arg0, %0, %1) : (i64, vector<2x16xindex>, vector<2x16xi1>) -> vector<2x16xf32>
    "func.return"(%2) : (vector<2x16xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (i64) -> vector<32xf32>, sym_name = "load_divui_recovers"}> ({
  ^bb0(%arg0: i64):
    %0 = "vector.step"() : () -> vector<32xindex>
    %1 = "arith.constant"() <{value = dense<2> : vector<32xindex>}> : () -> vector<32xindex>
    %2 = "arith.muli"(%0, %1) <{overflowFlags = #arith.overflow<none>}> : (vector<32xindex>, vector<32xindex>) -> vector<32xindex>
    %3 = "arith.divui"(%2, %1) : (vector<32xindex>, vector<32xindex>) -> vector<32xindex>
    %4 = "arith.constant"() <{value = dense<true> : vector<32xi1>}> : () -> vector<32xi1>
    %5 = "xegpu.load"(%arg0, %3, %4) : (i64, vector<32xindex>, vector<32xi1>) -> vector<32xf32>
    "func.return"(%5) : (vector<32xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (i64) -> vector<16xf32>, sym_name = "load_divui_non_divisor"}> ({
  ^bb0(%arg0: i64):
    %0 = "vector.step"() : () -> vector<16xindex>
    %1 = "arith.constant"() <{value = dense<2> : vector<16xindex>}> : () -> vector<16xindex>
    %2 = "arith.muli"(%0, %1) <{overflowFlags = #arith.overflow<none>}> : (vector<16xindex>, vector<16xindex>) -> vector<16xindex>
    %3 = "arith.constant"() <{value = dense<3> : vector<16xindex>}> : () -> vector<16xindex>
    %4 = "arith.divui"(%2, %3) : (vector<16xindex>, vector<16xindex>) -> vector<16xindex>
    %5 = "arith.constant"() <{value = dense<true> : vector<16xi1>}> : () -> vector<16xi1>
    %6 = "xegpu.load"(%arg0, %4, %5) : (i64, vector<16xindex>, vector<16xi1>) -> vector<16xf32>
    "func.return"(%6) : (vector<16xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (i64) -> vector<16xf32>, sym_name = "load_remui_inner_uniform"}> ({
  ^bb0(%arg0: i64):
    %0 = "vector.step"() : () -> vector<16xindex>
    %1 = "arith.constant"() <{value = dense<2> : vector<16xindex>}> : () -> vector<16xindex>
    %2 = "arith.muli"(%0, %1) <{overflowFlags = #arith.overflow<none>}> : (vector<16xindex>, vector<16xindex>) -> vector<16xindex>
    %3 = "arith.remui"(%2, %1) : (vector<16xindex>, vector<16xindex>) -> vector<16xindex>
    %4 = "arith.constant"() <{value = dense<true> : vector<16xi1>}> : () -> vector<16xi1>
    %5 = "xegpu.load"(%arg0, %3, %4) : (i64, vector<16xindex>, vector<16xi1>) -> vector<16xf32>
    "func.return"(%5) : (vector<16xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (i64) -> vector<32xf32>, sym_name = "load_shli_then_shrui"}> ({
  ^bb0(%arg0: i64):
    %0 = "vector.step"() : () -> vector<32xindex>
    %1 = "arith.constant"() <{value = dense<1> : vector<32xindex>}> : () -> vector<32xindex>
    %2 = "arith.shli"(%0, %1) <{overflowFlags = #arith.overflow<none>}> : (vector<32xindex>, vector<32xindex>) -> vector<32xindex>
    %3 = "arith.shrui"(%2, %1) : (vector<32xindex>, vector<32xindex>) -> vector<32xindex>
    %4 = "arith.constant"() <{value = dense<true> : vector<32xi1>}> : () -> vector<32xi1>
    %5 = "xegpu.load"(%arg0, %3, %4) : (i64, vector<32xindex>, vector<32xi1>) -> vector<32xf32>
    "func.return"(%5) : (vector<32xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (i64) -> vector<32xf32>, sym_name = "load_shli_unchanged"}> ({
  ^bb0(%arg0: i64):
    %0 = "vector.step"() : () -> vector<32xindex>
    %1 = "arith.constant"() <{value = dense<1> : vector<32xindex>}> : () -> vector<32xindex>
    %2 = "arith.shli"(%0, %1) <{overflowFlags = #arith.overflow<none>}> : (vector<32xindex>, vector<32xindex>) -> vector<32xindex>
    %3 = "arith.constant"() <{value = dense<true> : vector<32xi1>}> : () -> vector<32xi1>
    %4 = "xegpu.load"(%arg0, %2, %3) : (i64, vector<32xindex>, vector<32xi1>) -> vector<32xf32>
    "func.return"(%4) : (vector<32xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (i64, i1) -> vector<32xf32>, sym_name = "load_select_two_aps"}> ({
  ^bb0(%arg0: i64, %arg1: i1):
    %0 = "vector.step"() : () -> vector<32xindex>
    %1 = "arith.constant"() <{value = dense<0> : vector<32xindex>}> : () -> vector<32xindex>
    %2 = "arith.constant"() <{value = dense<64> : vector<32xindex>}> : () -> vector<32xindex>
    %3 = "arith.addi"(%0, %1) <{overflowFlags = #arith.overflow<none>}> : (vector<32xindex>, vector<32xindex>) -> vector<32xindex>
    %4 = "arith.addi"(%0, %2) <{overflowFlags = #arith.overflow<none>}> : (vector<32xindex>, vector<32xindex>) -> vector<32xindex>
    %5 = "arith.select"(%arg1, %3, %4) : (i1, vector<32xindex>, vector<32xindex>) -> vector<32xindex>
    %6 = "arith.constant"() <{value = dense<true> : vector<32xi1>}> : () -> vector<32xi1>
    %7 = "xegpu.load"(%arg0, %5, %6) : (i64, vector<32xindex>, vector<32xi1>) -> vector<32xf32>
    "func.return"(%7) : (vector<32xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (i64) -> vector<32xf32>, sym_name = "user_attr_preserved"}> ({
  ^bb0(%arg0: i64):
    %0 = "vector.step"() : () -> vector<32xindex>
    %1 = "arith.constant"() <{value = dense<true> : vector<32xi1>}> : () -> vector<32xi1>
    %2 = "xegpu.load"(%arg0, %0, %1) <{contiguity = 2 : i64}> : (i64, vector<32xindex>, vector<32xi1>) -> vector<32xf32>
    "func.return"(%2) : (vector<32xf32>) -> ()
  }) : () -> ()
}) : () -> ()

