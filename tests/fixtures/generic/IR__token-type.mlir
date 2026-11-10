"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "token_produce_consume"}> ({
    %0 = "test.token.produce"() : () -> token
    "test.token.consume"(%0) : (token) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "token_region_entry_block_arg"}> ({
    "test.token.region"() ({
    ^bb0(%arg0: token):
      "test.token.consume"(%arg0) : (token) -> ()
      "test.finish"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (i32) -> (), sym_name = "any_type_with_non_token"}> ({
  ^bb0(%arg0: i32):
    "test.token.any_type"(%arg0) : (i32) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
// -----
// -----
// -----
// -----
// -----
// -----
// -----
// -----
