"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "correct_number_of_regions"}> ({
    "test.two_region_op"() ({
      "work"() : () -> ()
    }, {
      "work"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
// -----
// -----
// -----
// -----
"builtin.module"() ({
  "test.unregistered_without_terminator"() ({
  ^bb0:
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "test.single_no_terminator_op"() ({
    %2 = "arith.constant"() <{value = 1 : i32}> : () -> i32
  }) : () -> ()
  "test.variadic_no_terminator_op"() ({
    %1 = "arith.constant"() <{value = 1 : i32}> : () -> i32
  }, {
    %0 = "arith.constant"() <{value = 1 : i32}> : () -> i32
  }) : () -> ()
  "test.single_no_terminator_custom_asm_op"() ({
    "important_dont_drop"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "test.dummy_op_with_region_ref"() ({
  ^bb0:
  }) : () -> ()
}) : () -> ()

