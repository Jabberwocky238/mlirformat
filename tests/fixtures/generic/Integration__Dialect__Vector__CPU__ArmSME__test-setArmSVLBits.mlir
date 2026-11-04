"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "checkSVL"}> ({
    %3 = "arm_sme.streaming_vl"() <{type_size = #arm_sme.type_size<byte>}> : () -> index
    %4 = "arm_sme.streaming_vl"() <{type_size = #arm_sme.type_size<half>}> : () -> index
    %5 = "arm_sme.streaming_vl"() <{type_size = #arm_sme.type_size<word>}> : () -> index
    %6 = "arm_sme.streaming_vl"() <{type_size = #arm_sme.type_size<double>}> : () -> index
    "vector.print"() <{punctuation = #vector.punctuation<newline>, stringLiteral = "SVL.b\0A"}> : () -> ()
    "vector.print"(%3) <{punctuation = #vector.punctuation<newline>}> : (index) -> ()
    "vector.print"() <{punctuation = #vector.punctuation<newline>, stringLiteral = "SVL.h\0A"}> : () -> ()
    "vector.print"(%4) <{punctuation = #vector.punctuation<newline>}> : (index) -> ()
    "vector.print"() <{punctuation = #vector.punctuation<newline>, stringLiteral = "SVL.w\0A"}> : () -> ()
    "vector.print"(%5) <{punctuation = #vector.punctuation<newline>}> : (index) -> ()
    "vector.print"() <{punctuation = #vector.punctuation<newline>, stringLiteral = "SVL.d\0A"}> : () -> ()
    "vector.print"(%6) <{punctuation = #vector.punctuation<newline>}> : (index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i32) -> (), sym_name = "setAndCheckSVL"}> ({
  ^bb0(%arg0: i32):
    "func.call"(%arg0) <{callee = @setArmSVLBits}> : (i32) -> ()
    "func.call"() <{callee = @checkSVL}> : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "main"}> ({
    %0 = "arith.constant"() <{value = 128 : i32}> : () -> i32
    "func.call"(%0) <{callee = @setAndCheckSVL}> : (i32) -> ()
    %1 = "arith.constant"() <{value = 256 : i32}> : () -> i32
    "func.call"(%1) <{callee = @setAndCheckSVL}> : (i32) -> ()
    %2 = "arith.constant"() <{value = 512 : i32}> : () -> i32
    "func.call"(%2) <{callee = @setAndCheckSVL}> : (i32) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i32) -> (), sym_name = "setArmSVLBits", sym_visibility = "private"}> ({
  }) : () -> ()
}) : () -> ()

