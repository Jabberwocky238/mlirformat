"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "A"}> ({
    "func.call"() <{callee = @B}> {inA} : () -> () loc("<stdin>":3:5)
    "func.return"() : () -> () loc("<stdin>":4:5)
  }) : () -> () loc("<stdin>":2:3)
  "func.func"() <{function_type = () -> (), sym_name = "B"}> ({
    "func.call"() <{callee = @E}> : () -> () loc("<stdin>":7:5)
    "func.return"() : () -> () loc("<stdin>":8:5)
  }) : () -> () loc("<stdin>":6:3)
  "func.func"() <{function_type = () -> (), sym_name = "C"}> ({
    "func.call"() <{callee = @D}> : () -> () loc("<stdin>":11:5)
    "func.return"() : () -> () loc("<stdin>":12:5)
  }) : () -> () loc("<stdin>":10:3)
  "func.func"() <{function_type = () -> (), sym_name = "D", sym_visibility = "private"}> ({
    "func.call"() <{callee = @B}> {inD} : () -> () loc("<stdin>":15:5)
    "func.return"() : () -> () loc("<stdin>":16:5)
  }) : () -> () loc("<stdin>":14:3)
  "func.func"() <{function_type = () -> (), sym_name = "E"}> ({
    "func.call"() <{callee = @fabsf}> : () -> () loc("<stdin>":19:5)
    "func.return"() : () -> () loc("<stdin>":20:5)
  }) : () -> () loc("<stdin>":18:3)
  "func.func"() <{function_type = () -> (), sym_name = "fabsf", sym_visibility = "private"}> ({
  }) : () -> () loc("<stdin>":22:3)
}) : () -> () loc("<stdin>":1:1)
