"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "checkSVL"}> ({
    %3 = "arm_sme.streaming_vl"() <{type_size = #arm_sme.type_size<byte>}> : () -> index loc("<stdin>":3:10)
    %4 = "arm_sme.streaming_vl"() <{type_size = #arm_sme.type_size<half>}> : () -> index loc("<stdin>":4:10)
    %5 = "arm_sme.streaming_vl"() <{type_size = #arm_sme.type_size<word>}> : () -> index loc("<stdin>":5:10)
    %6 = "arm_sme.streaming_vl"() <{type_size = #arm_sme.type_size<double>}> : () -> index loc("<stdin>":6:10)
    "vector.print"() <{punctuation = #vector.punctuation<newline>, stringLiteral = "SVL.b\0A"}> : () -> () loc("<stdin>":7:5)
    "vector.print"(%3) <{punctuation = #vector.punctuation<newline>}> : (index) -> () loc("<stdin>":8:5)
    "vector.print"() <{punctuation = #vector.punctuation<newline>, stringLiteral = "SVL.h\0A"}> : () -> () loc("<stdin>":9:5)
    "vector.print"(%4) <{punctuation = #vector.punctuation<newline>}> : (index) -> () loc("<stdin>":10:5)
    "vector.print"() <{punctuation = #vector.punctuation<newline>, stringLiteral = "SVL.w\0A"}> : () -> () loc("<stdin>":11:5)
    "vector.print"(%5) <{punctuation = #vector.punctuation<newline>}> : (index) -> () loc("<stdin>":12:5)
    "vector.print"() <{punctuation = #vector.punctuation<newline>, stringLiteral = "SVL.d\0A"}> : () -> () loc("<stdin>":13:5)
    "vector.print"(%6) <{punctuation = #vector.punctuation<newline>}> : (index) -> () loc("<stdin>":14:5)
    "func.return"() : () -> () loc("<stdin>":15:5)
  }) : () -> () loc("<stdin>":2:3)
  "func.func"() <{function_type = (i32) -> (), sym_name = "setAndCheckSVL"}> ({
  ^bb0(%arg0: i32 loc("<stdin>":18:8)):
    "func.call"(%arg0) <{callee = @setArmSVLBits}> : (i32) -> () loc("<stdin>":19:5)
    "func.call"() <{callee = @checkSVL}> : () -> () loc("<stdin>":20:5)
    "func.return"() : () -> () loc("<stdin>":21:5)
  }) : () -> () loc("<stdin>":17:3)
  "func.func"() <{function_type = () -> (), sym_name = "main"}> ({
    %0 = "arith.constant"() <{value = 128 : i32}> : () -> i32 loc("<stdin>":24:10)
    "func.call"(%0) <{callee = @setAndCheckSVL}> : (i32) -> () loc("<stdin>":25:5)
    %1 = "arith.constant"() <{value = 256 : i32}> : () -> i32 loc("<stdin>":26:10)
    "func.call"(%1) <{callee = @setAndCheckSVL}> : (i32) -> () loc("<stdin>":27:5)
    %2 = "arith.constant"() <{value = 512 : i32}> : () -> i32 loc("<stdin>":28:10)
    "func.call"(%2) <{callee = @setAndCheckSVL}> : (i32) -> () loc("<stdin>":29:5)
    "func.return"() : () -> () loc("<stdin>":30:5)
  }) : () -> () loc("<stdin>":23:3)
  "func.func"() <{function_type = (i32) -> (), sym_name = "setArmSVLBits", sym_visibility = "private"}> ({
  }) : () -> () loc("<stdin>":32:3)
}) : () -> () loc("<stdin>":1:1)
