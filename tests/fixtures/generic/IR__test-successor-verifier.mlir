"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "fallthrough_ok"}> ({
    "test.fallthrough_br"()[^bb1] : () -> ()
  ^bb1:  // pred: ^bb0
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "forward_successors_ok"}> ({
    "test.fallthrough_br"()[^bb1, ^bb2, ^bb3] : () -> ()
  ^bb1:  // pred: ^bb0
    "func.return"() : () -> ()
  ^bb2:  // pred: ^bb0
    "func.return"() : () -> ()
  ^bb3:  // pred: ^bb0
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
// -----
