"builtin.module"() ({
  "func.func"() <{function_type = () -> tensor<4xi64>, sym_name = "parse_i64_tensor"}> ({
    %5 = "arith.constant"() <{value = dense<255> : tensor<4xi64>}> : () -> tensor<4xi64>
    "func.return"(%5) : (tensor<4xi64>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> tensor<8xi32>, sym_name = "parse_i32_tensor"}> ({
    %4 = "arith.constant"() <{value = dense<255> : tensor<8xi32>}> : () -> tensor<8xi32>
    "func.return"(%4) : (tensor<8xi32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> tensor<16xi16>, sym_name = "parse_i16_tensor"}> ({
    %3 = "arith.constant"() <{value = dense<255> : tensor<16xi16>}> : () -> tensor<16xi16>
    "func.return"(%3) : (tensor<16xi16>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> tensor<32xi8>, sym_name = "parse_i8_tensor"}> ({
    %2 = "arith.constant"() <{value = dense<15> : tensor<32xi8>}> : () -> tensor<32xi8>
    "func.return"(%2) : (tensor<32xi8>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> tensor<32xi4>, sym_name = "parse_i4_tensor"}> ({
    %1 = "arith.constant"() <{value = dense<-1> : tensor<32xi4>}> : () -> tensor<32xi4>
    "func.return"(%1) : (tensor<32xi4>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> tensor<256xi1>, sym_name = "parse_i1_tensor"}> ({
    %0 = "arith.constant"() <{value = dense<"0x0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F"> : tensor<256xi1>}> : () -> tensor<256xi1>
    "func.return"(%0) : (tensor<256xi1>) -> ()
  }) : () -> ()
}) : () -> ()

