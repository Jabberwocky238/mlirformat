"builtin.module"() ({
  "func.func"() <{function_type = (vector<2x2xf32>) -> vector<2x2xf32>, sym_name = "test_result_bitwidth_64"}> ({
  ^bb0(%arg0: vector<2x2xf32> loc("<stdin>":3:8)):
    %0 = "arith.constant"() <{value = dense<[[1.000000e+00, 2.000000e+00], [3.000000e+00, 4.000000e+00]]> : vector<2x2xf32>}> : () -> vector<2x2xf32> loc("<stdin>":4:10)
    %1 = "math.sin"(%arg0) <{fastmath = #arith.fastmath<none>}> : (vector<2x2xf32>) -> vector<2x2xf32> loc("<stdin>":5:10)
    "func.return"(%0) : (vector<2x2xf32>) -> () loc("<stdin>":6:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
