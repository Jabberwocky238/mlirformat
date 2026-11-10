"builtin.module"() ({
^bb0:
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<8x9x7x14xi32>) -> tensor<8x9x7x14xi8>, sym_name = "rescale_doubleround"}> ({
  ^bb0(%arg0: tensor<8x9x7x14xi32>):
    %0 = "tosa.const"() <{values = dense<0> : tensor<14xi32>}> : () -> tensor<14xi32>
    %1 = "tosa.const"() <{values = dense<0> : tensor<14xi8>}> : () -> tensor<14xi8>
    %2 = "tosa.const"() <{values = dense<0> : tensor<1xi32>}> : () -> tensor<1xi32>
    %3 = "tosa.const"() <{values = dense<-5> : tensor<1xi8>}> : () -> tensor<1xi8>
    %4 = "tosa.rescale"(%arg0, %0, %1, %2, %3) <{input_unsigned = false, output_unsigned = false, per_channel = true, rounding_mode = #tosa.rounding_mode<DOUBLE_ROUND>, scale32 = true}> : (tensor<8x9x7x14xi32>, tensor<14xi32>, tensor<14xi8>, tensor<1xi32>, tensor<1xi8>) -> tensor<8x9x7x14xi8>
    "func.return"(%4) : (tensor<8x9x7x14xi8>) -> ()
  }) : () -> ()
}) : () -> ()

