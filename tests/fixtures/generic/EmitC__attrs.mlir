"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "opaque_attrs"}> ({
    "emitc.call_opaque"() <{args = [#emitc.opaque<"attr">], callee = "f"}> : () -> ()
    "emitc.call_opaque"() <{args = [#emitc.opaque<"\22quoted_attr\22">], callee = "f"}> : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

