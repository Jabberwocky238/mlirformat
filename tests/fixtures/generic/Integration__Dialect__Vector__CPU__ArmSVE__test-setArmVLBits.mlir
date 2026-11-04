"builtin.module"() ({
  "func.func"() <{function_type = () -> (), no_inline, sym_name = "checkVScale"}> ({
    %5 = "vector.vscale"() : () -> index
    "vector.print"() <{punctuation = #vector.punctuation<newline>, stringLiteral = "vscale = "}> : () -> ()
    "vector.print"(%5) <{punctuation = #vector.punctuation<newline>}> : (index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i32) -> (), sym_name = "setAndCheckVL"}> ({
  ^bb0(%arg0: i32):
    "func.call"(%arg0) <{callee = @setArmVLBits}> : (i32) -> ()
    "func.call"() <{callee = @checkVScale}> : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "main"}> ({
    %0 = "arith.constant"() <{value = 128 : i32}> : () -> i32
    "func.call"(%0) <{callee = @setAndCheckVL}> : (i32) -> ()
    %1 = "arith.constant"() <{value = 256 : i32}> : () -> i32
    "func.call"(%1) <{callee = @setAndCheckVL}> : (i32) -> ()
    %2 = "arith.constant"() <{value = 512 : i32}> : () -> i32
    "func.call"(%2) <{callee = @setAndCheckVL}> : (i32) -> ()
    %3 = "arith.constant"() <{value = 1024 : i32}> : () -> i32
    "func.call"(%3) <{callee = @setAndCheckVL}> : (i32) -> ()
    %4 = "arith.constant"() <{value = 2048 : i32}> : () -> i32
    "func.call"(%4) <{callee = @setAndCheckVL}> : (i32) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i32) -> (), sym_name = "setArmVLBits", sym_visibility = "private"}> ({
  }) : () -> ()
}) : () -> ()

