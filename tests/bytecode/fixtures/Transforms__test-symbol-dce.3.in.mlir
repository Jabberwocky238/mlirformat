"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "dead_private_function", sym_visibility = "private"}> ({
  }) : () -> () loc("<stdin>":3:3)
  "func.func"() <{function_type = () -> (), sym_name = "live_private_function", sym_visibility = "private"}> ({
  }) : () -> () loc("<stdin>":5:3)
  "live.user"() {uses = [@live_private_function]} : () -> () loc("<stdin>":7:3)
  "live.user"() {uses = [@unknown_symbol]} : () -> () loc("<stdin>":8:3)
}) : () -> () loc("<stdin>":2:1)
