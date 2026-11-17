"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "opaque_attrs"}> ({
    "emitc.call_opaque"() <{args = [#emitc.opaque<"OPAQUE_ENUM_VALUE">], callee = "f"}> : () -> () loc("<stdin>":3:5)
    "emitc.call_opaque"() <{args = [#emitc.opaque<"\22some string\22">], callee = "f"}> : () -> () loc("<stdin>":4:5)
    "func.return"() : () -> () loc("<stdin>":5:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
