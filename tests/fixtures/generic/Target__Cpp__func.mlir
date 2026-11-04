"builtin.module"() ({
  "emitc.func"() <{function_type = (i32) -> (), sym_name = "emitc_func"}> ({
  ^bb0(%arg0: i32):
    "emitc.call_opaque"(%arg0) <{callee = "foo"}> : (i32) -> ()
    "emitc.return"() : () -> ()
  }) : () -> ()
  "emitc.func"() <{function_type = () -> i32, specifiers = ["static", "inline"], sym_name = "return_i32"}> ({
    %1 = "emitc.call_opaque"() <{callee = "foo"}> : () -> i32
    "emitc.return"(%1) : (i32) -> ()
  }) : () -> ()
  "emitc.func"() <{function_type = () -> i32, sym_name = "emitc_call"}> ({
    %0 = "emitc.call"() <{callee = @return_i32}> : () -> i32
    "emitc.return"(%0) : (i32) -> ()
  }) : () -> ()
  "emitc.func"() <{function_type = (i32) -> (), specifiers = ["extern"], sym_name = "extern_func"}> ({
  }) {sym_visibility = "private"} : () -> ()
  "emitc.func"() <{function_type = (!emitc.array<3xi32>) -> (), specifiers = ["extern"], sym_name = "array_arg"}> ({
  }) {sym_visibility = "private"} : () -> ()
}) : () -> ()

