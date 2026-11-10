"builtin.module"() ({
  "func.func"() <{function_type = () -> i32, sym_name = "region_branch_compat"}> ({
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
// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> i32, sym_name = "loop_compat"}> ({
    %0 = "arith.constant"() <{value = 0 : i32}> : () -> i32
    %1 = "test.loop_types_compat"(%0) ({
    ^bb0(%arg0: i64):
      %2 = "arith.constant"() <{value = 1 : i64}> : () -> i64
      "test.types_compat_yield"(%2) : (i64) -> ()
    }) : (i32) -> i32
    "func.return"(%1) : (i32) -> ()
  }) : () -> ()
}) : () -> ()

// -----
// -----
