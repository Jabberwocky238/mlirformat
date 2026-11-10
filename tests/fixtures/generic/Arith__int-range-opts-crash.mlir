"builtin.module"() ({
  "func.func"() <{function_type = () -> i32, sym_name = "repro_bitwidth_mismatch"}> ({
    %0 = "arith.constant"() <{value = 0 : i32}> : () -> i32
    %1 = "test.region_types_compat"(%0) ({
    ^bb0(%arg0: i64):
      %2 = "arith.constant"() <{value = 1 : i64}> : () -> i64
      "test.types_compat_yield"(%2) : (i64) -> ()
    }) : (i32) -> i32
    "func.return"(%1) : (i32) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> !test.i32, sym_name = "repro_crash"}> ({
    %0 = "arith.constant"() <{value = 1 : i32}> : () -> i32
    %1 = "test.region_type_changer"(%0) ({
    ^bb0(%arg0: i32):
      "test.types_compat_yield"(%arg0) : (i32) -> ()
    }) : (i32) -> !test.i32
    "func.return"(%1) : (!test.i32) -> ()
  }) : () -> ()
}) : () -> ()

