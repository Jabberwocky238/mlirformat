"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "existing_symbol"}> ({
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "test"}> ({
    "func.return"() : () -> ()
  }) {symbol_ref = #test.symbol_ref_attr<@existing_symbol>} : () -> ()
}) : () -> ()

// -----
