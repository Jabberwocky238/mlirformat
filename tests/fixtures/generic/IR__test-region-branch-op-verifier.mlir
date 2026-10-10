"builtin.module"() ({
  "func.func"() <{function_type = (i32) -> f32, sym_name = "test_ops_verify"}> ({
  ^bb0(%arg0: i32):
    %0 = "test.constant"() <{value = 5.300000e+00 : f32}> : () -> f32
    %1 = "test.loop_block"(%arg0) ({
    ^bb0(%arg1: i32):
      "test.loop_block_term"(%arg0, %0) : (i32, f32) -> ()
    }) : (i32) -> f32
    "func.return"(%1) : (f32) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (index) -> (), sym_name = "test_no_terminator"}> ({
  ^bb0(%arg0: index):
    "test.switch_with_no_break"(%arg0) <{cases = array<i64: 0, 1>}> ({
    ^bb0:
    }, {
    ^bb0:
    }) : (index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

