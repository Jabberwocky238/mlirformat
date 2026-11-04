"builtin.module"() ({
  "func.func"() <{function_type = () -> i32, sym_name = "poison"}> ({
    %4 = "ub.poison"() <{value = #ub.poison}> : () -> i32
    "func.return"(%4) : (i32) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> i32, sym_name = "poison_full_form"}> ({
    %3 = "ub.poison"() <{value = #ub.poison}> : () -> i32
    "func.return"(%3) : (i32) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> complex<f32>, sym_name = "poison_complex"}> ({
    %2 = "ub.poison"() <{value = #ub.poison}> : () -> complex<f32>
    "func.return"(%2) : (complex<f32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> vector<4xi64>, sym_name = "poison_vec"}> ({
    %1 = "ub.poison"() <{value = #ub.poison}> : () -> vector<4xi64>
    "func.return"(%1) : (vector<4xi64>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> tensor<8x?xf64>, sym_name = "poison_tensor"}> ({
    %0 = "ub.poison"() <{value = #ub.poison}> : () -> tensor<8x?xf64>
    "func.return"(%0) : (tensor<8x?xf64>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "unreachable"}> ({
    "ub.unreachable"() : () -> ()
  }) : () -> ()
}) : () -> ()

