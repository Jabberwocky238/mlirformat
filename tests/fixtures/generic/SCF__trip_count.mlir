"builtin.module"() ({
  "func.func"() <{function_type = (i32, i32) -> i32, sym_name = "trip_count_index_zero_to_zero"}> ({
  ^bb0(%arg0: i32, %arg1: i32):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = 1 : index}> : () -> index
    %2 = "scf.for"(%0, %0, %1, %arg0) ({
    ^bb0(%arg2: index, %arg3: i32):
      "scf.yield"(%arg1) : (i32) -> ()
    }) : (index, index, index, i32) -> i32
    "func.return"(%2) : (i32) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (i32, i32, index) -> i32, sym_name = "trip_count_index_zero_to_zero_step_dyn"}> ({
  ^bb0(%arg0: i32, %arg1: i32, %arg2: index):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "scf.for"(%0, %0, %arg2, %arg0) ({
    ^bb0(%arg3: index, %arg4: i32):
      "scf.yield"(%arg1) : (i32) -> ()
    }) : (index, index, index, i32) -> i32
    "func.return"(%1) : (i32) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (i32, i32) -> i32, sym_name = "trip_count_i32_zero_to_zero"}> ({
  ^bb0(%arg0: i32, %arg1: i32):
    %0 = "arith.constant"() <{value = 0 : i32}> : () -> i32
    %1 = "arith.constant"() <{value = 1 : i32}> : () -> i32
    %2 = "scf.for"(%0, %0, %1, %arg0) ({
    ^bb0(%arg2: i32, %arg3: i32):
      "scf.yield"(%arg1) : (i32) -> ()
    }) : (i32, i32, i32, i32) -> i32
    "func.return"(%2) : (i32) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (i32, i32, i32) -> i32, sym_name = "trip_count_i32_zero_to_zero_step_dyn"}> ({
  ^bb0(%arg0: i32, %arg1: i32, %arg2: i32):
    %0 = "arith.constant"() <{value = 0 : i32}> : () -> i32
    %1 = "scf.for"(%0, %0, %arg2, %arg0) ({
    ^bb0(%arg3: i32, %arg4: i32):
      "scf.yield"(%arg1) : (i32) -> ()
    }) : (i32, i32, i32, i32) -> i32
    "func.return"(%1) : (i32) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (i32, i32) -> i32, sym_name = "trip_count_index_one_to_zero"}> ({
  ^bb0(%arg0: i32, %arg1: i32):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = 1 : index}> : () -> index
    %2 = "scf.for"(%1, %0, %1, %arg0) ({
    ^bb0(%arg2: index, %arg3: i32):
      "scf.yield"(%arg1) : (i32) -> ()
    }) : (index, index, index, i32) -> i32
    "func.return"(%2) : (i32) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (i32, i32) -> i32, sym_name = "trip_count_i32_one_to_zero"}> ({
  ^bb0(%arg0: i32, %arg1: i32):
    %0 = "arith.constant"() <{value = 0 : i32}> : () -> i32
    %1 = "arith.constant"() <{value = 1 : i32}> : () -> i32
    %2 = "scf.for"(%1, %0, %1, %arg0) ({
    ^bb0(%arg2: i32, %arg3: i32):
      "scf.yield"(%arg1) : (i32) -> ()
    }) : (i32, i32, i32, i32) -> i32
    "func.return"(%2) : (i32) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (i32, i32, i32) -> i32, sym_name = "trip_count_i32_one_to_zero_dyn_step"}> ({
  ^bb0(%arg0: i32, %arg1: i32, %arg2: i32):
    %0 = "arith.constant"() <{value = 0 : i32}> : () -> i32
    %1 = "arith.constant"() <{value = 1 : i32}> : () -> i32
    %2 = "scf.for"(%1, %0, %arg2, %arg0) ({
    ^bb0(%arg3: i32, %arg4: i32):
      "scf.yield"(%arg1) : (i32) -> ()
    }) : (i32, i32, i32, i32) -> i32
    "func.return"(%2) : (i32) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (i32, i32) -> i32, sym_name = "trip_count_index_negative_step"}> ({
  ^bb0(%arg0: i32, %arg1: i32):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = 1 : index}> : () -> index
    %2 = "arith.constant"() <{value = -1 : index}> : () -> index
    %3 = "scf.for"(%1, %0, %2, %arg0) ({
    ^bb0(%arg2: index, %arg3: i32):
      "scf.yield"(%arg1) : (i32) -> ()
    }) : (index, index, index, i32) -> i32
    "func.return"(%3) : (i32) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (i32, i32) -> i32, sym_name = "trip_count_i32_negative_step"}> ({
  ^bb0(%arg0: i32, %arg1: i32):
    %0 = "arith.constant"() <{value = 0 : i32}> : () -> i32
    %1 = "arith.constant"() <{value = 1 : i32}> : () -> i32
    %2 = "arith.constant"() <{value = -1 : i32}> : () -> i32
    %3 = "scf.for"(%1, %0, %2, %arg0) ({
    ^bb0(%arg2: i32, %arg3: i32):
      "scf.yield"(%arg1) : (i32) -> ()
    }) : (i32, i32, i32, i32) -> i32
    "func.return"(%3) : (i32) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (i32, i32) -> i32, sym_name = "trip_count_index_negative_step_unsigned_loop"}> ({
  ^bb0(%arg0: i32, %arg1: i32):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = 1 : index}> : () -> index
    %2 = "arith.constant"() <{value = -1 : index}> : () -> index
    %3 = "scf.for"(%1, %0, %2, %arg0) <{unsignedCmp}> ({
    ^bb0(%arg2: index, %arg3: i32):
      "scf.yield"(%arg1) : (i32) -> ()
    }) : (index, index, index, i32) -> i32
    "func.return"(%3) : (i32) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (i32, i32) -> i32, sym_name = "trip_count_i32_negative_step_unsigned_loop"}> ({
  ^bb0(%arg0: i32, %arg1: i32):
    %0 = "arith.constant"() <{value = 0 : i32}> : () -> i32
    %1 = "arith.constant"() <{value = 1 : i32}> : () -> i32
    %2 = "arith.constant"() <{value = -1 : i32}> : () -> i32
    %3 = "scf.for"(%1, %0, %2, %arg0) <{unsignedCmp}> ({
    ^bb0(%arg2: i32, %arg3: i32):
      "scf.yield"(%arg1) : (i32) -> ()
    }) : (i32, i32, i32, i32) -> i32
    "func.return"(%3) : (i32) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (i32, i32) -> i32, sym_name = "trip_count_index_normal_loop"}> ({
  ^bb0(%arg0: i32, %arg1: i32):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = 2 : index}> : () -> index
    %2 = "arith.constant"() <{value = 10 : index}> : () -> index
    %3 = "scf.for"(%0, %2, %1, %arg0) ({
    ^bb0(%arg2: index, %arg3: i32):
      "scf.yield"(%arg1) : (i32) -> ()
    }) : (index, index, index, i32) -> i32
    "func.return"(%3) : (i32) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (i32, i32) -> i32, sym_name = "trip_count_i32_normal_loop"}> ({
  ^bb0(%arg0: i32, %arg1: i32):
    %0 = "arith.constant"() <{value = 0 : i32}> : () -> i32
    %1 = "arith.constant"() <{value = 2 : i32}> : () -> i32
    %2 = "arith.constant"() <{value = 10 : i32}> : () -> i32
    %3 = "scf.for"(%0, %2, %1, %arg0) ({
    ^bb0(%arg2: i32, %arg3: i32):
      "scf.yield"(%arg1) : (i32) -> ()
    }) : (i32, i32, i32, i32) -> i32
    "func.return"(%3) : (i32) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (i32, i32) -> i32, sym_name = "trip_count_index_signed_crossing_zero"}> ({
  ^bb0(%arg0: i32, %arg1: i32):
    %0 = "arith.constant"() <{value = -1 : index}> : () -> index
    %1 = "arith.constant"() <{value = 1 : index}> : () -> index
    %2 = "scf.for"(%0, %1, %1, %arg0) ({
    ^bb0(%arg2: index, %arg3: i32):
      "scf.yield"(%arg1) : (i32) -> ()
    }) : (index, index, index, i32) -> i32
    "func.return"(%2) : (i32) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (i32, i32) -> i32, sym_name = "trip_count_i32_signed_crossing_zero"}> ({
  ^bb0(%arg0: i32, %arg1: i32):
    %0 = "arith.constant"() <{value = -1 : i32}> : () -> i32
    %1 = "arith.constant"() <{value = 1 : i32}> : () -> i32
    %2 = "scf.for"(%0, %1, %1, %arg0) ({
    ^bb0(%arg2: i32, %arg3: i32):
      "scf.yield"(%arg1) : (i32) -> ()
    }) : (i32, i32, i32, i32) -> i32
    "func.return"(%2) : (i32) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (i32, i32) -> i32, sym_name = "trip_count_index_unsigned_crossing_zero"}> ({
  ^bb0(%arg0: i32, %arg1: i32):
    %0 = "arith.constant"() <{value = -1 : index}> : () -> index
    %1 = "arith.constant"() <{value = 1 : index}> : () -> index
    %2 = "scf.for"(%0, %1, %1, %arg0) <{unsignedCmp}> ({
    ^bb0(%arg2: index, %arg3: i32):
      "scf.yield"(%arg1) : (i32) -> ()
    }) : (index, index, index, i32) -> i32
    "func.return"(%2) : (i32) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (i32, i32) -> i32, sym_name = "trip_count_i32_unsigned_crossing_zero"}> ({
  ^bb0(%arg0: i32, %arg1: i32):
    %0 = "arith.constant"() <{value = -1 : i32}> : () -> i32
    %1 = "arith.constant"() <{value = 1 : i32}> : () -> i32
    %2 = "scf.for"(%0, %1, %1, %arg0) <{unsignedCmp}> ({
    ^bb0(%arg2: i32, %arg3: i32):
      "scf.yield"(%arg1) : (i32) -> ()
    }) : (i32, i32, i32, i32) -> i32
    "func.return"(%2) : (i32) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (i32, i32, i32) -> i32, sym_name = "trip_count_i32_unsigned_crossing_zero_dyn_step"}> ({
  ^bb0(%arg0: i32, %arg1: i32, %arg2: i32):
    %0 = "arith.constant"() <{value = -1 : i32}> : () -> i32
    %1 = "arith.constant"() <{value = 1 : i32}> : () -> i32
    %2 = "scf.for"(%0, %1, %arg2, %arg0) <{unsignedCmp}> ({
    ^bb0(%arg3: i32, %arg4: i32):
      "scf.yield"(%arg1) : (i32) -> ()
    }) : (i32, i32, i32, i32) -> i32
    "func.return"(%2) : (i32) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (i32, i32) -> i32, sym_name = "trip_count_index_negative_bounds_signed"}> ({
  ^bb0(%arg0: i32, %arg1: i32):
    %0 = "arith.constant"() <{value = -10 : index}> : () -> index
    %1 = "arith.constant"() <{value = -1 : index}> : () -> index
    %2 = "arith.constant"() <{value = 2 : index}> : () -> index
    %3 = "scf.for"(%0, %1, %2, %arg0) ({
    ^bb0(%arg2: index, %arg3: i32):
      "scf.yield"(%arg1) : (i32) -> ()
    }) : (index, index, index, i32) -> i32
    "func.return"(%3) : (i32) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (i32, i32) -> i32, sym_name = "trip_count_i32_negative_bounds_signed"}> ({
  ^bb0(%arg0: i32, %arg1: i32):
    %0 = "arith.constant"() <{value = -10 : i32}> : () -> i32
    %1 = "arith.constant"() <{value = -1 : i32}> : () -> i32
    %2 = "arith.constant"() <{value = 2 : i32}> : () -> i32
    %3 = "scf.for"(%0, %1, %2, %arg0) ({
    ^bb0(%arg2: i32, %arg3: i32):
      "scf.yield"(%arg1) : (i32) -> ()
    }) : (i32, i32, i32, i32) -> i32
    "func.return"(%3) : (i32) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (i32, i32) -> i32, sym_name = "trip_count_index_negative_bounds_unsigned"}> ({
  ^bb0(%arg0: i32, %arg1: i32):
    %0 = "arith.constant"() <{value = -10 : index}> : () -> index
    %1 = "arith.constant"() <{value = -1 : index}> : () -> index
    %2 = "arith.constant"() <{value = 2 : index}> : () -> index
    %3 = "scf.for"(%0, %1, %2, %arg0) ({
    ^bb0(%arg2: index, %arg3: i32):
      "scf.yield"(%arg1) : (i32) -> ()
    }) : (index, index, index, i32) -> i32
    "func.return"(%3) : (i32) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (i32, i32) -> i32, sym_name = "trip_count_i32_negative_bounds_unsigned"}> ({
  ^bb0(%arg0: i32, %arg1: i32):
    %0 = "arith.constant"() <{value = -10 : i32}> : () -> i32
    %1 = "arith.constant"() <{value = -1 : i32}> : () -> i32
    %2 = "arith.constant"() <{value = 2 : i32}> : () -> i32
    %3 = "scf.for"(%0, %1, %2, %arg0) ({
    ^bb0(%arg2: i32, %arg3: i32):
      "scf.yield"(%arg1) : (i32) -> ()
    }) : (i32, i32, i32, i32) -> i32
    "func.return"(%3) : (i32) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (i32, i32) -> i32, sym_name = "trip_count_index_overflow_signed"}> ({
  ^bb0(%arg0: i32, %arg1: i32):
    %0 = "arith.constant"() <{value = 1 : index}> : () -> index
    %1 = "arith.constant"() <{value = 2147483647 : index}> : () -> index
    %2 = "arith.constant"() <{value = 2147483648 : index}> : () -> index
    %3 = "scf.for"(%1, %2, %0, %arg0) ({
    ^bb0(%arg2: index, %arg3: i32):
      "scf.yield"(%arg1) : (i32) -> ()
    }) : (index, index, index, i32) -> i32
    "func.return"(%3) : (i32) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (i32, i32) -> i32, sym_name = "trip_count_i32_overflow_signed"}> ({
  ^bb0(%arg0: i32, %arg1: i32):
    %0 = "arith.constant"() <{value = 1 : i32}> : () -> i32
    %1 = "arith.constant"() <{value = 2147483647 : i32}> : () -> i32
    %2 = "arith.constant"() <{value = -2147483648 : i32}> : () -> i32
    %3 = "scf.for"(%1, %2, %0, %arg0) ({
    ^bb0(%arg2: i32, %arg3: i32):
      "scf.yield"(%arg1) : (i32) -> ()
    }) : (i32, i32, i32, i32) -> i32
    "func.return"(%3) : (i32) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (i32, i32, i32) -> i32, sym_name = "trip_count_i32_overflow_signed_dyn_step"}> ({
  ^bb0(%arg0: i32, %arg1: i32, %arg2: i32):
    %0 = "arith.constant"() <{value = 2147483647 : i32}> : () -> i32
    %1 = "arith.constant"() <{value = -2147483648 : i32}> : () -> i32
    %2 = "scf.for"(%0, %1, %arg2, %arg0) ({
    ^bb0(%arg3: i32, %arg4: i32):
      "scf.yield"(%arg1) : (i32) -> ()
    }) : (i32, i32, i32, i32) -> i32
    "func.return"(%2) : (i32) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (i32, i32) -> i32, sym_name = "trip_count_index_overflow_unsigned"}> ({
  ^bb0(%arg0: i32, %arg1: i32):
    %0 = "arith.constant"() <{value = 1 : index}> : () -> index
    %1 = "arith.constant"() <{value = 2147483647 : index}> : () -> index
    %2 = "arith.constant"() <{value = 2147483648 : index}> : () -> index
    %3 = "scf.for"(%1, %2, %0, %arg0) <{unsignedCmp}> ({
    ^bb0(%arg2: index, %arg3: i32):
      "scf.yield"(%arg1) : (i32) -> ()
    }) : (index, index, index, i32) -> i32
    "func.return"(%3) : (i32) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (i32, i32) -> i32, sym_name = "trip_count_i32_overflow_unsigned"}> ({
  ^bb0(%arg0: i32, %arg1: i32):
    %0 = "arith.constant"() <{value = 1 : i32}> : () -> i32
    %1 = "arith.constant"() <{value = 2147483647 : i32}> : () -> i32
    %2 = "arith.constant"() <{value = -2147483648 : i32}> : () -> i32
    %3 = "scf.for"(%1, %2, %0, %arg0) <{unsignedCmp}> ({
    ^bb0(%arg2: i32, %arg3: i32):
      "scf.yield"(%arg1) : (i32) -> ()
    }) : (i32, i32, i32, i32) -> i32
    "func.return"(%3) : (i32) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (i32, i32) -> i32, sym_name = "trip_count_index_overflow_64bit_signed"}> ({
  ^bb0(%arg0: i32, %arg1: i32):
    %0 = "arith.constant"() <{value = 1 : index}> : () -> index
    %1 = "arith.constant"() <{value = 9223372036854775807 : index}> : () -> index
    %2 = "arith.constant"() <{value = -9223372036854775808 : index}> : () -> index
    %3 = "scf.for"(%1, %2, %0, %arg0) ({
    ^bb0(%arg2: index, %arg3: i32):
      "scf.yield"(%arg1) : (i32) -> ()
    }) : (index, index, index, i32) -> i32
    "func.return"(%3) : (i32) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (i32, i32) -> i32, sym_name = "trip_count_i64_overflow_64bit_signed"}> ({
  ^bb0(%arg0: i32, %arg1: i32):
    %0 = "arith.constant"() <{value = 1 : i64}> : () -> i64
    %1 = "arith.constant"() <{value = 9223372036854775807 : i64}> : () -> i64
    %2 = "arith.constant"() <{value = -9223372036854775808 : i64}> : () -> i64
    %3 = "scf.for"(%1, %2, %0, %arg0) ({
    ^bb0(%arg2: i64, %arg3: i32):
      "scf.yield"(%arg1) : (i32) -> ()
    }) : (i64, i64, i64, i32) -> i32
    "func.return"(%3) : (i32) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (i32, i32) -> i32, sym_name = "trip_count_index_overflow_64bit_unsigned"}> ({
  ^bb0(%arg0: i32, %arg1: i32):
    %0 = "arith.constant"() <{value = 1 : index}> : () -> index
    %1 = "arith.constant"() <{value = 9223372036854775807 : index}> : () -> index
    %2 = "arith.constant"() <{value = -9223372036854775808 : index}> : () -> index
    %3 = "scf.for"(%1, %2, %0, %arg0) <{unsignedCmp}> ({
    ^bb0(%arg2: index, %arg3: i32):
      "scf.yield"(%arg1) : (i32) -> ()
    }) : (index, index, index, i32) -> i32
    "func.return"(%3) : (i32) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (i32, i32) -> i32, sym_name = "trip_count_i32_overflow_64bit_unsigned"}> ({
  ^bb0(%arg0: i32, %arg1: i32):
    %0 = "arith.constant"() <{value = 1 : i64}> : () -> i64
    %1 = "arith.constant"() <{value = 9223372036854775807 : i64}> : () -> i64
    %2 = "arith.constant"() <{value = -9223372036854775808 : i64}> : () -> i64
    %3 = "scf.for"(%1, %2, %0, %arg0) <{unsignedCmp}> ({
    ^bb0(%arg2: i64, %arg3: i32):
      "scf.yield"(%arg1) : (i32) -> ()
    }) : (i64, i64, i64, i32) -> i32
    "func.return"(%3) : (i32) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> i32, sym_name = "trip_count_step_greater_than_iteration"}> ({
    %0 = "arith.constant"() <{value = 0 : i32}> : () -> i32
    %1 = "arith.constant"() <{value = 4 : i32}> : () -> i32
    %2 = "arith.constant"() <{value = 17 : i32}> : () -> i32
    %3 = "arith.constant"() <{value = 16 : i32}> : () -> i32
    %4 = "scf.for"(%3, %2, %1, %0) ({
    ^bb0(%arg0: i32, %arg1: i32):
      "scf.yield"(%arg0) : (i32) -> ()
    }) : (i32, i32, i32, i32) -> i32
    "func.return"(%4) : (i32) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (i32) -> i32, sym_name = "trip_count_arith_add"}> ({
  ^bb0(%arg0: i32):
    %0 = "arith.constant"() <{value = 0 : i32}> : () -> i32
    %1 = "arith.constant"() <{value = 4 : i32}> : () -> i32
    %2 = "arith.constant"() <{value = 17 : i32}> : () -> i32
    %3 = "arith.constant"() <{value = 16 : i32}> : () -> i32
    %4 = "arith.addi"(%arg0, %3) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
    %5 = "scf.for"(%arg0, %4, %1, %0) ({
    ^bb0(%arg1: i32, %arg2: i32):
      "scf.yield"(%arg1) : (i32) -> ()
    }) : (i32, i32, i32, i32) -> i32
    "func.return"(%5) : (i32) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (i32) -> i32, sym_name = "trip_count_arith_add_negative"}> ({
  ^bb0(%arg0: i32):
    %0 = "arith.constant"() <{value = 0 : i32}> : () -> i32
    %1 = "arith.constant"() <{value = 4 : i32}> : () -> i32
    %2 = "arith.constant"() <{value = -16 : i32}> : () -> i32
    %3 = "arith.addi"(%arg0, %2) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
    %4 = "scf.for"(%arg0, %3, %1, %0) ({
    ^bb0(%arg1: i32, %arg2: i32):
      "scf.yield"(%arg1) : (i32) -> ()
    }) : (i32, i32, i32, i32) -> i32
    "func.return"(%4) : (i32) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (i32) -> i32, sym_name = "trip_count_arith_add_nsw_loop_signed"}> ({
  ^bb0(%arg0: i32):
    %0 = "arith.constant"() <{value = 0 : i32}> : () -> i32
    %1 = "arith.constant"() <{value = 4 : i32}> : () -> i32
    %2 = "arith.constant"() <{value = 16 : i32}> : () -> i32
    %3 = "arith.addi"(%arg0, %2) <{overflowFlags = #arith.overflow<nsw>}> : (i32, i32) -> i32
    %4 = "scf.for"(%arg0, %3, %1, %0) ({
    ^bb0(%arg1: i32, %arg2: i32):
      "scf.yield"(%arg1) : (i32) -> ()
    }) : (i32, i32, i32, i32) -> i32
    "func.return"(%4) : (i32) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (i32) -> i32, sym_name = "trip_count_arith_add_negative_nsw_loop_signed"}> ({
  ^bb0(%arg0: i32):
    %0 = "arith.constant"() <{value = 0 : i32}> : () -> i32
    %1 = "arith.constant"() <{value = 4 : i32}> : () -> i32
    %2 = "arith.constant"() <{value = -16 : i32}> : () -> i32
    %3 = "arith.addi"(%arg0, %2) <{overflowFlags = #arith.overflow<nsw>}> : (i32, i32) -> i32
    %4 = "scf.for"(%arg0, %3, %1, %0) ({
    ^bb0(%arg1: i32, %arg2: i32):
      "scf.yield"(%arg1) : (i32) -> ()
    }) : (i32, i32, i32, i32) -> i32
    "func.return"(%4) : (i32) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (i32, i32) -> i32, sym_name = "trip_count_arith_add_negative_nsw_loop_signed_step_dyn"}> ({
  ^bb0(%arg0: i32, %arg1: i32):
    %0 = "arith.constant"() <{value = 0 : i32}> : () -> i32
    %1 = "arith.constant"() <{value = -16 : i32}> : () -> i32
    %2 = "arith.addi"(%arg0, %1) <{overflowFlags = #arith.overflow<nsw>}> : (i32, i32) -> i32
    %3 = "scf.for"(%arg0, %2, %arg1, %0) ({
    ^bb0(%arg2: i32, %arg3: i32):
      "scf.yield"(%arg2) : (i32) -> ()
    }) : (i32, i32, i32, i32) -> i32
    "func.return"(%3) : (i32) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (i32) -> i32, sym_name = "trip_count_arith_add_nsw_loop_unsigned"}> ({
  ^bb0(%arg0: i32):
    %0 = "arith.constant"() <{value = 0 : i32}> : () -> i32
    %1 = "arith.constant"() <{value = 4 : i32}> : () -> i32
    %2 = "arith.constant"() <{value = 16 : i32}> : () -> i32
    %3 = "arith.addi"(%arg0, %2) <{overflowFlags = #arith.overflow<nsw>}> : (i32, i32) -> i32
    %4 = "scf.for"(%arg0, %3, %1, %0) <{unsignedCmp}> ({
    ^bb0(%arg1: i32, %arg2: i32):
      "scf.yield"(%arg1) : (i32) -> ()
    }) : (i32, i32, i32, i32) -> i32
    "func.return"(%4) : (i32) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (i32) -> i32, sym_name = "trip_count_arith_add_negative_nsw_loop_unsigned"}> ({
  ^bb0(%arg0: i32):
    %0 = "arith.constant"() <{value = 0 : i32}> : () -> i32
    %1 = "arith.constant"() <{value = 4 : i32}> : () -> i32
    %2 = "arith.constant"() <{value = -16 : i32}> : () -> i32
    %3 = "arith.addi"(%arg0, %2) <{overflowFlags = #arith.overflow<nsw>}> : (i32, i32) -> i32
    %4 = "scf.for"(%arg0, %3, %1, %0) <{unsignedCmp}> ({
    ^bb0(%arg1: i32, %arg2: i32):
      "scf.yield"(%arg1) : (i32) -> ()
    }) : (i32, i32, i32, i32) -> i32
    "func.return"(%4) : (i32) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (i32) -> i32, sym_name = "trip_count_arith_add_nuw_loop_signed"}> ({
  ^bb0(%arg0: i32):
    %0 = "arith.constant"() <{value = 0 : i32}> : () -> i32
    %1 = "arith.constant"() <{value = 4 : i32}> : () -> i32
    %2 = "arith.constant"() <{value = 16 : i32}> : () -> i32
    %3 = "arith.addi"(%arg0, %2) <{overflowFlags = #arith.overflow<nuw>}> : (i32, i32) -> i32
    %4 = "scf.for"(%arg0, %3, %1, %0) ({
    ^bb0(%arg1: i32, %arg2: i32):
      "scf.yield"(%arg1) : (i32) -> ()
    }) : (i32, i32, i32, i32) -> i32
    "func.return"(%4) : (i32) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (i32) -> i32, sym_name = "trip_count_arith_add_negative_nuw_loop_signed"}> ({
  ^bb0(%arg0: i32):
    %0 = "arith.constant"() <{value = 0 : i32}> : () -> i32
    %1 = "arith.constant"() <{value = 4 : i32}> : () -> i32
    %2 = "arith.constant"() <{value = -16 : i32}> : () -> i32
    %3 = "arith.addi"(%arg0, %2) <{overflowFlags = #arith.overflow<nuw>}> : (i32, i32) -> i32
    %4 = "scf.for"(%arg0, %3, %1, %0) ({
    ^bb0(%arg1: i32, %arg2: i32):
      "scf.yield"(%arg1) : (i32) -> ()
    }) : (i32, i32, i32, i32) -> i32
    "func.return"(%4) : (i32) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (i32) -> i32, sym_name = "trip_count_arith_add_nuw_loop_unsigned"}> ({
  ^bb0(%arg0: i32):
    %0 = "arith.constant"() <{value = 0 : i32}> : () -> i32
    %1 = "arith.constant"() <{value = 4 : i32}> : () -> i32
    %2 = "arith.constant"() <{value = 16 : i32}> : () -> i32
    %3 = "arith.addi"(%arg0, %2) <{overflowFlags = #arith.overflow<nuw>}> : (i32, i32) -> i32
    %4 = "scf.for"(%arg0, %3, %1, %0) <{unsignedCmp}> ({
    ^bb0(%arg1: i32, %arg2: i32):
      "scf.yield"(%arg1) : (i32) -> ()
    }) : (i32, i32, i32, i32) -> i32
    "func.return"(%4) : (i32) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (i32) -> i32, sym_name = "trip_count_arith_add_negative_nuw_loop_unsigned"}> ({
  ^bb0(%arg0: i32):
    %0 = "arith.constant"() <{value = 0 : i32}> : () -> i32
    %1 = "arith.constant"() <{value = 4 : i32}> : () -> i32
    %2 = "arith.constant"() <{value = -16 : i32}> : () -> i32
    %3 = "arith.addi"(%arg0, %2) <{overflowFlags = #arith.overflow<nuw>}> : (i32, i32) -> i32
    %4 = "scf.for"(%arg0, %3, %1, %0) <{unsignedCmp}> ({
    ^bb0(%arg1: i32, %arg2: i32):
      "scf.yield"(%arg1) : (i32) -> ()
    }) : (i32, i32, i32, i32) -> i32
    "func.return"(%4) : (i32) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (i32, i32) -> i32, sym_name = "trip_count_arith_add_negative_nuw_loop_unsigned_step_dyn"}> ({
  ^bb0(%arg0: i32, %arg1: i32):
    %0 = "arith.constant"() <{value = 0 : i32}> : () -> i32
    %1 = "arith.constant"() <{value = -16 : i32}> : () -> i32
    %2 = "arith.addi"(%arg0, %1) <{overflowFlags = #arith.overflow<nuw>}> : (i32, i32) -> i32
    %3 = "scf.for"(%arg0, %2, %arg1, %0) <{unsignedCmp}> ({
    ^bb0(%arg2: i32, %arg3: i32):
      "scf.yield"(%arg2) : (i32) -> ()
    }) : (i32, i32, i32, i32) -> i32
    "func.return"(%3) : (i32) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (i32, i32) -> i32, sym_name = "trip_count_arith_add_nuw_loop_unsigned_invalid"}> ({
  ^bb0(%arg0: i32, %arg1: i32):
    %0 = "arith.constant"() <{value = 0 : i32}> : () -> i32
    %1 = "arith.constant"() <{value = 4 : i32}> : () -> i32
    %2 = "arith.constant"() <{value = 16 : i32}> : () -> i32
    %3 = "arith.addi"(%arg1, %2) <{overflowFlags = #arith.overflow<nuw>}> : (i32, i32) -> i32
    %4 = "scf.for"(%arg0, %3, %1, %0) <{unsignedCmp}> ({
    ^bb0(%arg2: i32, %arg3: i32):
      "scf.yield"(%arg2) : (i32) -> ()
    }) : (i32, i32, i32, i32) -> i32
    "func.return"(%4) : (i32) -> ()
  }) : () -> ()
}) : () -> ()

