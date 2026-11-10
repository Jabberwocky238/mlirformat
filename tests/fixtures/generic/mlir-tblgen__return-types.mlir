"builtin.module"() ({
  "func.func"() <{function_type = (tensor<10xf32, !test.smpla>, tensor<20xi32>) -> (), sym_name = "testCreateFunctions"}> ({
  ^bb0(%arg0: tensor<10xf32, !test.smpla>, %arg1: tensor<20xi32>):
    %0 = "test.no_attributes"(%arg0, %arg0) : (tensor<10xf32, !test.smpla>, tensor<10xf32, !test.smpla>) -> tensor<10xf32, !test.smpla>
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

