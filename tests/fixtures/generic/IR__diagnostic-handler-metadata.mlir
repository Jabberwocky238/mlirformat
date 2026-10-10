"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "test"}> ({
    "test.emit_error"() {attr = "emit_error"} : () -> ()
    "test.do_not_emit_error"() {attr = "do_not_emit_error"} : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

