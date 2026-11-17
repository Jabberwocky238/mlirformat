"builtin.module"() ({
  "func.func"() <{function_type = () -> (), no_inline, sym_name = "checkVScale"}> ({
    %5 = "vector.vscale"() : () -> index loc("<stdin>":3:10)
    "vector.print"() <{punctuation = #vector.punctuation<newline>, stringLiteral = "vscale = "}> : () -> () loc("<stdin>":4:5)
    "vector.print"(%5) <{punctuation = #vector.punctuation<newline>}> : (index) -> () loc("<stdin>":5:5)
    "func.return"() : () -> () loc("<stdin>":6:5)
  }) : () -> () loc("<stdin>":2:3)
  "func.func"() <{function_type = (i32) -> (), sym_name = "setAndCheckVL"}> ({
  ^bb0(%arg0: i32 loc("<stdin>":9:8)):
    "func.call"(%arg0) <{callee = @setArmVLBits}> : (i32) -> () loc("<stdin>":10:5)
    "func.call"() <{callee = @checkVScale}> : () -> () loc("<stdin>":11:5)
    "func.return"() : () -> () loc("<stdin>":12:5)
  }) : () -> () loc("<stdin>":8:3)
  "func.func"() <{function_type = () -> (), sym_name = "main"}> ({
    %0 = "arith.constant"() <{value = 128 : i32}> : () -> i32 loc("<stdin>":15:10)
    "func.call"(%0) <{callee = @setAndCheckVL}> : (i32) -> () loc("<stdin>":16:5)
    %1 = "arith.constant"() <{value = 256 : i32}> : () -> i32 loc("<stdin>":17:10)
    "func.call"(%1) <{callee = @setAndCheckVL}> : (i32) -> () loc("<stdin>":18:5)
    %2 = "arith.constant"() <{value = 512 : i32}> : () -> i32 loc("<stdin>":19:10)
    "func.call"(%2) <{callee = @setAndCheckVL}> : (i32) -> () loc("<stdin>":20:5)
    %3 = "arith.constant"() <{value = 1024 : i32}> : () -> i32 loc("<stdin>":21:10)
    "func.call"(%3) <{callee = @setAndCheckVL}> : (i32) -> () loc("<stdin>":22:5)
    %4 = "arith.constant"() <{value = 2048 : i32}> : () -> i32 loc("<stdin>":23:10)
    "func.call"(%4) <{callee = @setAndCheckVL}> : (i32) -> () loc("<stdin>":24:5)
    "func.return"() : () -> () loc("<stdin>":25:5)
  }) : () -> () loc("<stdin>":14:3)
  "func.func"() <{function_type = (i32) -> (), sym_name = "setArmVLBits", sym_visibility = "private"}> ({
  }) : () -> () loc("<stdin>":27:3)
}) : () -> () loc("<stdin>":1:1)
