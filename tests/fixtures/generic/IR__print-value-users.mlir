"builtin.module"() ({
  "func.func"() <{function_type = (i32, i32, i32) -> i32, sym_name = "foo"}> ({
  ^bb0(%arg0: i32, %arg1: i32, %arg2: i32):
    "test.noop"() : () -> ()
    "test.no_result"(%arg0) : (i32) -> ()
    %0 = "test.unused_result"(%arg0, %arg1) : (i32, i32) -> i32
    %1 = "test.one_result"(%arg0, %arg1) : (i32, i32) -> i32
    %2:2 = "test.many_results"(%1) : (i32) -> (i32, i32)
    %3:2 = "test.many_results"() : () -> (i32, i32)
    %4 = "test.foo"(%2#0) : (i32) -> i32
    %5 = "test.foo"(%2#1, %4, %4) : (i32, i32, i32) -> i32
    %6 = "test.foo"(%2#0, %2#1) : (i32, i32) -> i32
    "test.no_result"(%6) : (i32) -> ()
    "test.no_result"(%3#0) : (i32) -> ()
    "func.return"(%6) : (i32) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  %0 = "arith.constant"() <{value = 42 : i32}> : () -> i32
  %1 = "test.outerop"(%0) ({
    "test.innerop"(%0) : (i32) -> ()
  }) : (i32) -> i32
  %2:3 = "test.custom_result_name"(%1) <{names = ["p", "p", "q"]}> : (i32) -> (i32, i32, i32)
  %3:2 = "test.custom_result_name"(%2#2, %2#2, %1) <{names = ["r", "s"]}> : (i32, i32, i32) -> (i32, i32)
  %4:2 = "test.custom_result_name"(%3#1, %2#2, %2#0) <{names = ["u", "v"]}> : (i32, i32, i32) -> (i32, i32)
}) : () -> ()

