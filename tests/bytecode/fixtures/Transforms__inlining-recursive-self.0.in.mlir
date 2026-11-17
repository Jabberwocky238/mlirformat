"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "b0"}> ({
    "func.call"() <{callee = @b0}> : () -> () loc("<stdin>":3:5)
    "func.call"() <{callee = @b1}> : () -> () loc("<stdin>":4:5)
    "func.call"() <{callee = @b0}> : () -> () loc("<stdin>":5:5)
    "func.call"() <{callee = @b1}> : () -> () loc("<stdin>":6:5)
    "func.call"() <{callee = @b0}> : () -> () loc("<stdin>":7:5)
    "func.return"() : () -> () loc("<stdin>":8:5)
  }) : () -> () loc("<stdin>":2:3)
  "func.func"() <{function_type = () -> (), sym_name = "b1"}> ({
    "func.call"() <{callee = @b1}> : () -> () loc("<stdin>":11:5)
    "func.call"() <{callee = @b1}> : () -> () loc("<stdin>":12:5)
    "func.return"() : () -> () loc("<stdin>":13:5)
  }) : () -> () loc("<stdin>":10:3)
}) : () -> () loc("<stdin>":1:1)
