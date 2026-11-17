"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "entry"}> ({
    %2 = "arith.constant"() <{value = 256 : i32}> : () -> i32 loc("<stdin>":3:10)
    "func.call"(%2) <{callee = @setArmVLBits}> : (i32) -> () loc("<stdin>":4:5)
    "func.call"() <{callee = @test_deinterleave}> : () -> () loc("<stdin>":5:5)
    "func.return"() : () -> () loc("<stdin>":6:5)
  }) : () -> () loc("<stdin>":2:3)
  "func.func"() <{function_type = () -> (), no_inline, sym_name = "test_deinterleave"}> ({
    %0 = "llvm.intr.stepvector"() : () -> vector<[4]xi8> loc("<stdin>":9:10)
    "vector.print"(%0) <{punctuation = #vector.punctuation<newline>}> : (vector<[4]xi8>) -> () loc("<stdin>":10:5)
    %1:2 = "vector.deinterleave"(%0) : (vector<[4]xi8>) -> (vector<[2]xi8>, vector<[2]xi8>) loc("<stdin>":11:12)
    "vector.print"(%1#0) <{punctuation = #vector.punctuation<newline>}> : (vector<[2]xi8>) -> () loc("<stdin>":12:5)
    "vector.print"(%1#1) <{punctuation = #vector.punctuation<newline>}> : (vector<[2]xi8>) -> () loc("<stdin>":13:5)
    "func.return"() : () -> () loc("<stdin>":14:5)
  }) : () -> () loc("<stdin>":8:3)
  "func.func"() <{function_type = (i32) -> (), sym_name = "setArmVLBits", sym_visibility = "private"}> ({
  }) : () -> () loc("<stdin>":16:3)
}) : () -> () loc("<stdin>":1:1)
