"builtin.module"() ({
  "func.func"() <{function_type = () -> i32, sym_name = "test_7i32_to_29"}> ({
    %4 = "arith.constant"() <{value = 7 : i32}> : () -> i32
    %5 = "math.ctlz"(%4) : (i32) -> i32
    "func.return"(%5) : (i32) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> i32, sym_name = "test_zero"}> ({
    %2 = "arith.constant"() <{value = 0 : i32}> : () -> i32
    %3 = "math.ctlz"(%2) : (i32) -> i32
    "func.return"(%3) : (i32) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> i64, sym_name = "test_7i64_to_61"}> ({
    %0 = "arith.constant"() <{value = 7 : i64}> : () -> i64
    %1 = "math.ctlz"(%0) : (i64) -> i64
    "func.return"(%1) : (i64) -> ()
  }) : () -> ()
}) : () -> ()

