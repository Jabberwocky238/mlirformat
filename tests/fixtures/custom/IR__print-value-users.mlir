module {
  func.func @foo(%arg0: i32, %arg1: i32, %arg2: i32) -> i32 {
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
    return %6 : i32
  }
}

// -----
module {
  %c42_i32 = arith.constant 42 : i32
  %0 = "test.outerop"(%c42_i32) ({
    "test.innerop"(%c42_i32) : (i32) -> ()
  }) : (i32) -> i32
  %p, %p_0, %q = "test.custom_result_name"(%0) <{names = ["p", "p", "q"]}> : (i32) -> (i32, i32, i32)
  %r, %s = "test.custom_result_name"(%q, %q, %0) <{names = ["r", "s"]}> : (i32, i32, i32) -> (i32, i32)
  %u, %v = "test.custom_result_name"(%s, %q, %p) <{names = ["u", "v"]}> : (i32, i32, i32) -> (i32, i32)
}

