"builtin.module"() ({
  "func.func"() <{function_type = () -> tensor<100xi1>, sym_name = "test_i1_splat_true"}> ({
    %7 = "arith.constant"() <{value = dense<true> : tensor<100xi1>}> : () -> tensor<100xi1>
    "func.return"(%7) : (tensor<100xi1>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> tensor<100xi1>, sym_name = "test_i1_splat_false"}> ({
    %6 = "arith.constant"() <{value = dense<false> : tensor<100xi1>}> : () -> tensor<100xi1>
    "func.return"(%6) : (tensor<100xi1>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> tensor<8xi1>, sym_name = "test_8xi1_splat_true"}> ({
    %5 = "arith.constant"() <{value = dense<true> : tensor<8xi1>}> : () -> tensor<8xi1>
    "func.return"(%5) : (tensor<8xi1>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> tensor<8xi1>, sym_name = "test_8xi1_splat_false"}> ({
    %4 = "arith.constant"() <{value = dense<false> : tensor<8xi1>}> : () -> tensor<8xi1>
    "func.return"(%4) : (tensor<8xi1>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "test_i8_mixed"}> ({
    %3 = "arith.constant"() <{value = dense<[true, false, true, false, true, false, true, false]> : tensor<8xi1>}> : () -> tensor<8xi1>
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "test_i9_mixed"}> ({
    %2 = "arith.constant"() <{value = dense<[true, false, true, false, true, false, true, false, true]> : tensor<9xi1>}> : () -> tensor<9xi1>
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> tensor<32xi32>, res_attrs = [{jax.result_info = "result"}], sym_name = "test_in_memory_repr", sym_visibility = "public"}> ({
    %0 = "arith.constant"() <{value = dense<true> : tensor<32xi1>}> : () -> tensor<32xi1>
    %1 = "arith.extui"(%0) : (tensor<32xi1>) -> tensor<32xi32>
    "func.return"(%1) : (tensor<32xi32>) -> ()
  }) : () -> ()
}) : () -> ()

