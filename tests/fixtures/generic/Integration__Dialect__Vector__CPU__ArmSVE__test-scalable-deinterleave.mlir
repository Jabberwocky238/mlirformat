"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "entry"}> ({
    %2 = "arith.constant"() <{value = 256 : i32}> : () -> i32
    "func.call"(%2) <{callee = @setArmVLBits}> : (i32) -> ()
    "func.call"() <{callee = @test_deinterleave}> : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), no_inline, sym_name = "test_deinterleave"}> ({
    %0 = "llvm.intr.stepvector"() : () -> vector<[4]xi8>
    "vector.print"(%0) <{punctuation = #vector.punctuation<newline>}> : (vector<[4]xi8>) -> ()
    %1:2 = "vector.deinterleave"(%0) : (vector<[4]xi8>) -> (vector<[2]xi8>, vector<[2]xi8>)
    "vector.print"(%1#0) <{punctuation = #vector.punctuation<newline>}> : (vector<[2]xi8>) -> ()
    "vector.print"(%1#1) <{punctuation = #vector.punctuation<newline>}> : (vector<[2]xi8>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i32) -> (), sym_name = "setArmVLBits", sym_visibility = "private"}> ({
  }) : () -> ()
}) : () -> ()

