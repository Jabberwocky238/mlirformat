"builtin.module"() ({
  "emitc.declare_func"() <{sym_name = @bar}> : () -> ()
  "emitc.func"() <{function_type = (i32) -> i32, sym_name = "bar"}> ({
  ^bb0(%arg4: i32):
    "emitc.return"(%arg4) : (i32) -> ()
  }) : () -> ()
  "emitc.declare_func"() <{sym_name = @foo}> : () -> ()
  "emitc.func"() <{function_type = (i32) -> i32, specifiers = ["static", "inline"], sym_name = "foo"}> ({
  ^bb0(%arg3: i32):
    "emitc.return"(%arg3) : (i32) -> ()
  }) : () -> ()
  "emitc.declare_func"() <{sym_name = @array_arg}> : () -> ()
  "emitc.func"() <{function_type = (!emitc.array<3xi32>) -> (), sym_name = "array_arg"}> ({
  ^bb0(%arg2: !emitc.array<3xi32>):
    "emitc.return"() : () -> ()
  }) : () -> ()
  "emitc.declare_func"() <{sym_name = @foo1}> : () -> ()
  "emitc.declare_func"() <{sym_name = @foo2}> : () -> ()
  "emitc.func"() <{function_type = (i32) -> i32, sym_name = "foo1"}> ({
  ^bb0(%arg1: i32):
    %0 = "emitc.constant"() <{value = 0 : i32}> : () -> i32
    "emitc.return"(%arg1) : (i32) -> ()
  }) : () -> ()
  "emitc.func"() <{function_type = (i32) -> i32, sym_name = "foo2"}> ({
  ^bb0(%arg0: i32):
    "emitc.return"(%arg0) : (i32) -> ()
  }) : () -> ()
}) : () -> ()

