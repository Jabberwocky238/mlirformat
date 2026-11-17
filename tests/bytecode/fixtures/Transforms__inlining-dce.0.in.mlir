"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "dead_function", sym_visibility = "private"}> ({
    "func.return"() : () -> () loc("<stdin>":3:5)
  }) : () -> () loc("<stdin>":2:3)
  "func.func"() <{function_type = () -> (), sym_name = "dead_function_b"}> ({
    "func.return"() : () -> () loc("<stdin>":6:5)
  }) : () -> () loc("<stdin>":5:3)
  "func.func"() <{function_type = () -> (), sym_name = "live_function"}> ({
    "func.call"() <{callee = @dead_function_b}> : () -> () loc("<stdin>":9:5)
    "func.return"() : () -> () loc("<stdin>":10:5)
  }) : () -> () loc("<stdin>":8:3)
  "func.func"() <{function_type = () -> (), sym_name = "live_function_b"}> ({
    "func.return"() : () -> () loc("<stdin>":13:5)
  }) : () -> () loc("<stdin>":12:3)
  "func.func"() <{function_type = () -> (), sym_name = "dead_function_c", sym_visibility = "private"}> ({
    "func.call"() <{callee = @live_function_b}> : () -> () loc("<stdin>":16:5)
    "func.return"() : () -> () loc("<stdin>":17:5)
  }) : () -> () loc("<stdin>":15:3)
  "func.func"() <{function_type = () -> (), sym_name = "dead_function_d", sym_visibility = "private"}> ({
    "func.call"() <{callee = @dead_function_c}> : () -> () loc("<stdin>":20:5)
    "func.call"() <{callee = @dead_function_c}> : () -> () loc("<stdin>":21:5)
    "func.return"() : () -> () loc("<stdin>":22:5)
  }) : () -> () loc("<stdin>":19:3)
  "func.func"() <{function_type = () -> (), sym_name = "live_function_c"}> ({
    "func.call"() <{callee = @dead_function_c}> : () -> () loc("<stdin>":25:5)
    "func.call"() <{callee = @dead_function_d}> : () -> () loc("<stdin>":26:5)
    "func.return"() : () -> () loc("<stdin>":27:5)
  }) : () -> () loc("<stdin>":24:3)
  "func.func"() <{function_type = () -> (), sym_name = "live_function_d", sym_visibility = "private"}> ({
    "func.return"() : () -> () loc("<stdin>":30:5)
  }) : () -> () loc("<stdin>":29:3)
  "live.user"() {use = @live_function_d} : () -> () loc("<stdin>":32:3)
}) : () -> () loc("<stdin>":1:1)
