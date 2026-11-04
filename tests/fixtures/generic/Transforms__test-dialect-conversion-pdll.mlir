"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "TestSingleConversion"}> ({
    %1 = "test.cast"() : () -> i64
    "test.return"(%1) : (i64) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> i64, sym_name = "TestLingeringConversion"}> ({
    %0 = "test.cast"() : () -> i64
    "func.return"(%0) : (i64) -> ()
  }) : () -> ()
}) : () -> ()

