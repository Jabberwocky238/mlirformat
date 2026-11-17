"builtin.module"() ({
  "emitc.declare_func"() <{sym_name = @bar}> : () -> () loc("<stdin>":2:3)
  "emitc.func"() <{function_type = (i32) -> i32, sym_name = "bar"}> ({
  ^bb0(%arg4: i32 loc("<stdin>":4:8)):
    "emitc.return"(%arg4) : (i32) -> () loc("<stdin>":5:5)
  }) : () -> () loc("<stdin>":3:3)
  "emitc.declare_func"() <{sym_name = @foo}> : () -> () loc("<stdin>":7:3)
  "emitc.func"() <{function_type = (i32) -> i32, specifiers = ["static", "inline"], sym_name = "foo"}> ({
  ^bb0(%arg3: i32 loc("<stdin>":9:8)):
    "emitc.return"(%arg3) : (i32) -> () loc("<stdin>":10:5)
  }) : () -> () loc("<stdin>":8:3)
  "emitc.declare_func"() <{sym_name = @array_arg}> : () -> () loc("<stdin>":12:3)
  "emitc.func"() <{function_type = (!emitc.array<3xi32>) -> (), sym_name = "array_arg"}> ({
  ^bb0(%arg2: !emitc.array<3xi32> loc("<stdin>":14:8)):
    "emitc.return"() : () -> () loc("<stdin>":15:5)
  }) : () -> () loc("<stdin>":13:3)
  "emitc.declare_func"() <{sym_name = @foo1}> : () -> () loc("<stdin>":17:3)
  "emitc.declare_func"() <{sym_name = @foo2}> : () -> () loc("<stdin>":18:3)
  "emitc.func"() <{function_type = (i32) -> i32, sym_name = "foo1"}> ({
  ^bb0(%arg1: i32 loc("<stdin>":20:8)):
    %0 = "emitc.constant"() <{value = 0 : i32}> : () -> i32 loc("<stdin>":21:10)
    "emitc.return"(%arg1) : (i32) -> () loc("<stdin>":22:5)
  }) : () -> () loc("<stdin>":19:3)
  "emitc.func"() <{function_type = (i32) -> i32, sym_name = "foo2"}> ({
  ^bb0(%arg0: i32 loc("<stdin>":25:8)):
    "emitc.return"(%arg0) : (i32) -> () loc("<stdin>":26:5)
  }) : () -> () loc("<stdin>":24:3)
}) : () -> () loc("<stdin>":1:1)
