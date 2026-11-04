"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "func_a"}> ({
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "func_b", sym_visibility = "private"}> ({
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "func_c"}> ({
    "func.call"() <{callee = @func_b}> : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "func_d"}> ({
    "func.call"() <{callee = @func_c}> : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "func_e"}> ({
    "func.call"() <{callee = @func_c}> : () -> ()
    "func.call"() <{callee = @func_d}> : () -> ()
    "func.call"() <{callee = @func_e}> : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "func_f"}> ({
    %0 = "test.functional_region_op"() ({
      "func.call"() <{callee = @func_f}> : () -> ()
      "test.return"() : () -> ()
    }) : () -> (() -> ())
    "func.call_indirect"(%0) : (() -> ()) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) {test.name = "simple"} : () -> ()

// -----
"builtin.module"() ({
  "builtin.module"() <{sym_name = "nested_module"}> ({
    "func.func"() <{function_type = () -> (), sym_name = "func_a"}> ({
      "func.return"() : () -> ()
    }) : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "func_b"}> ({
    "test.conversion_call_op"() <{callee = @nested_module::@func_a}> : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) {test.name = "nested"} : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (() -> ()) -> (), sym_name = "foo"}> ({
  ^bb0(%arg1: () -> ()):
    "func.call_indirect"(%arg1) : (() -> ()) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (() -> ()) -> (), sym_name = "bar"}> ({
  ^bb0(%arg0: () -> ()):
    "func.call_indirect"(%arg0) : (() -> ()) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) {test.name = "SCC"} : () -> ()

