"builtin.module"() ({
  "func.func"() <{function_type = () -> tensor<4xi64>, sym_name = "parse_i64_tensor"}> ({
    %5 = "arith.constant"() <{value = dense<255> : tensor<4xi64>}> : () -> tensor<4xi64> loc("<stdin>":3:10)
    "func.return"(%5) : (tensor<4xi64>) -> () loc("<stdin>":4:5)
  }) : () -> () loc("<stdin>":2:3)
  "func.func"() <{function_type = () -> tensor<8xi32>, sym_name = "parse_i32_tensor"}> ({
    %4 = "arith.constant"() <{value = dense<255> : tensor<8xi32>}> : () -> tensor<8xi32> loc("<stdin>":7:10)
    "func.return"(%4) : (tensor<8xi32>) -> () loc("<stdin>":8:5)
  }) : () -> () loc("<stdin>":6:3)
  "func.func"() <{function_type = () -> tensor<16xi16>, sym_name = "parse_i16_tensor"}> ({
    %3 = "arith.constant"() <{value = dense<255> : tensor<16xi16>}> : () -> tensor<16xi16> loc("<stdin>":11:10)
    "func.return"(%3) : (tensor<16xi16>) -> () loc("<stdin>":12:5)
  }) : () -> () loc("<stdin>":10:3)
  "func.func"() <{function_type = () -> tensor<32xi8>, sym_name = "parse_i8_tensor"}> ({
    %2 = "arith.constant"() <{value = dense<15> : tensor<32xi8>}> : () -> tensor<32xi8> loc("<stdin>":15:10)
    "func.return"(%2) : (tensor<32xi8>) -> () loc("<stdin>":16:5)
  }) : () -> () loc("<stdin>":14:3)
  "func.func"() <{function_type = () -> tensor<32xi4>, sym_name = "parse_i4_tensor"}> ({
    %1 = "arith.constant"() <{value = dense<-1> : tensor<32xi4>}> : () -> tensor<32xi4> loc("<stdin>":19:10)
    "func.return"(%1) : (tensor<32xi4>) -> () loc("<stdin>":20:5)
  }) : () -> () loc("<stdin>":18:3)
  "func.func"() <{function_type = () -> tensor<32xi1>, sym_name = "parse_i1_tensor"}> ({
    %0 = "arith.constant"() <{value = dense<[true, false, true, false, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, false, false, false, false, false, false, true]> : tensor<32xi1>}> : () -> tensor<32xi1> loc("<stdin>":23:10)
    "func.return"(%0) : (tensor<32xi1>) -> () loc("<stdin>":24:5)
  }) : () -> () loc("<stdin>":22:3)
}) : () -> () loc("<stdin>":1:1)
