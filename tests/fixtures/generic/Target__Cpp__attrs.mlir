"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "opaque_attrs"}> ({
    "emitc.call_opaque"() <{args = [#emitc.opaque<"OPAQUE_ENUM_VALUE">], callee = "f"}> : () -> ()
    "emitc.call_opaque"() <{args = [#emitc.opaque<"\22some string\22">], callee = "f"}> : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

