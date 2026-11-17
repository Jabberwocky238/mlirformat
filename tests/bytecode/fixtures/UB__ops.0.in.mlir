"builtin.module"() ({
  "func.func"() <{function_type = () -> i32, sym_name = "poison"}> ({
    %4 = "ub.poison"() <{value = #ub.poison}> : () -> i32 loc("<stdin>":3:10)
    "func.return"(%4) : (i32) -> () loc("<stdin>":4:5)
  }) : () -> () loc("<stdin>":2:3)
  "func.func"() <{function_type = () -> i32, sym_name = "poison_full_form"}> ({
    %3 = "ub.poison"() <{value = #ub.poison}> : () -> i32 loc("<stdin>":7:10)
    "func.return"(%3) : (i32) -> () loc("<stdin>":8:5)
  }) : () -> () loc("<stdin>":6:3)
  "func.func"() <{function_type = () -> complex<f32>, sym_name = "poison_complex"}> ({
    %2 = "ub.poison"() <{value = #ub.poison}> : () -> complex<f32> loc("<stdin>":11:10)
    "func.return"(%2) : (complex<f32>) -> () loc("<stdin>":12:5)
  }) : () -> () loc("<stdin>":10:3)
  "func.func"() <{function_type = () -> vector<4xi64>, sym_name = "poison_vec"}> ({
    %1 = "ub.poison"() <{value = #ub.poison}> : () -> vector<4xi64> loc("<stdin>":15:10)
    "func.return"(%1) : (vector<4xi64>) -> () loc("<stdin>":16:5)
  }) : () -> () loc("<stdin>":14:3)
  "func.func"() <{function_type = () -> tensor<8x?xf64>, sym_name = "poison_tensor"}> ({
    %0 = "ub.poison"() <{value = #ub.poison}> : () -> tensor<8x?xf64> loc("<stdin>":19:10)
    "func.return"(%0) : (tensor<8x?xf64>) -> () loc("<stdin>":20:5)
  }) : () -> () loc("<stdin>":18:3)
  "func.func"() <{function_type = () -> (), sym_name = "unreachable"}> ({
    "ub.unreachable"() : () -> () loc("<stdin>":23:5)
  }) : () -> () loc("<stdin>":22:3)
}) : () -> () loc("<stdin>":1:1)
