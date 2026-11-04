"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "simple_context_aware_conversion_1"}> ({
    %1 = "test.context_op"() : () -> i37
    "test.replace_with_legal_op"(%1) : (i37) -> ()
    "func.return"() : () -> ()
  }) {increment = 1 : i64} : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "simple_context_aware_conversion_2"}> ({
    %0 = "test.context_op"() : () -> i37
    "test.replace_with_legal_op"(%0) : (i37) -> ()
    "func.return"() : () -> ()
  }) {increment = 2 : i64} : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (index, index, index) -> (), sym_name = "convert_block_arguments"}> ({
  ^bb0(%arg0: index, %arg1: index, %arg2: index):
    %0 = "test.context_op"() : () -> i37
    %1 = "scf.for"(%arg0, %arg1, %arg2, %0) ({
    ^bb0(%arg3: index, %arg4: i37):
      "scf.yield"(%arg4) : (i37) -> ()
    }) : (index, index, index, i37) -> i37
    "func.return"() : () -> ()
  }) {increment = 1 : i64} : () -> ()
}) : () -> ()

