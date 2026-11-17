"builtin.module"() ({
  "func.func"() <{function_type = () -> f8E4M3FN, sym_name = "foo"}> ({
    %7 = "arith.constant"() <{value = 2.250000e+00 : f8E4M3FN}> : () -> f8E4M3FN loc("<stdin>":3:10)
    "func.return"(%7) : (f8E4M3FN) -> () loc("<stdin>":4:5)
  }) : () -> () loc("<stdin>":2:3)
  "func.func"() <{function_type = () -> f6E3M2FN, sym_name = "bar"}> ({
    %6 = "arith.constant"() <{value = 3.000000e+00 : f6E3M2FN}> : () -> f6E3M2FN loc("<stdin>":7:10)
    "func.return"(%6) : (f6E3M2FN) -> () loc("<stdin>":8:5)
  }) : () -> () loc("<stdin>":6:3)
  "func.func"() <{function_type = () -> (), sym_name = "full_example"}> ({
    %0 = "arith.constant"() <{value = 1.375000e+00 : f8E4M3FN}> : () -> f8E4M3FN loc("<stdin>":11:10)
    %1 = "func.call"() <{callee = @foo}> : () -> f8E4M3FN loc("<stdin>":12:10)
    %2 = "arith.addf"(%0, %1) <{fastmath = #arith.fastmath<none>}> : (f8E4M3FN, f8E4M3FN) -> f8E4M3FN loc("<stdin>":13:10)
    "vector.print"(%2) <{punctuation = #vector.punctuation<newline>}> : (f8E4M3FN) -> () loc("<stdin>":14:5)
    %3 = "arith.constant"() <{value = 2.500000e+00 : f6E3M2FN}> : () -> f6E3M2FN loc("<stdin>":15:10)
    %4 = "func.call"() <{callee = @bar}> : () -> f6E3M2FN loc("<stdin>":16:10)
    %5 = "arith.addf"(%3, %4) <{fastmath = #arith.fastmath<none>}> : (f6E3M2FN, f6E3M2FN) -> f6E3M2FN loc("<stdin>":17:10)
    "vector.print"(%5) <{punctuation = #vector.punctuation<newline>}> : (f6E3M2FN) -> () loc("<stdin>":18:5)
    "func.return"() : () -> () loc("<stdin>":19:5)
  }) : () -> () loc("<stdin>":10:3)
}) : () -> () loc("<stdin>":1:1)
