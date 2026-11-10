"builtin.module"() <{sym_name = "index"}> ({
  "func.func"() <{function_type = () -> (), sym_name = "query"}> ({
    %0 = "test.data_layout_query"() : () -> index
    "func.return"() : () -> ()
  }) : () -> ()
}) {dlti.dl_spec = #dlti.dl_spec<index = 32 : i64>} : () -> ()

// -----
"builtin.module"() <{sym_name = "index_default"}> ({
  "func.func"() <{function_type = () -> (), sym_name = "query"}> ({
    %0 = "test.data_layout_query"() : () -> index
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

