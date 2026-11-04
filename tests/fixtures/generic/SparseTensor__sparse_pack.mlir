#sparse = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed(nonunique), d1 : singleton), crdWidth = 32 }>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<6xf64>, tensor<2xindex>, tensor<6x2xi32>) -> tensor<100x100xf64, #sparse>, sym_name = "sparse_pack"}> ({
  ^bb0(%arg4: tensor<6xf64>, %arg5: tensor<2xindex>, %arg6: tensor<6x2xi32>):
    %1 = "sparse_tensor.assemble"(%arg5, %arg6, %arg4) : (tensor<2xindex>, tensor<6x2xi32>, tensor<6xf64>) -> tensor<100x100xf64, #sparse>
    "func.return"(%1) : (tensor<100x100xf64, #sparse>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<100x100xf64, #sparse>, tensor<6xf64>, tensor<2xindex>, tensor<6x2xi32>) -> (tensor<6xf64>, tensor<2xindex>, tensor<6x2xi32>), sym_name = "sparse_unpack"}> ({
  ^bb0(%arg0: tensor<100x100xf64, #sparse>, %arg1: tensor<6xf64>, %arg2: tensor<2xindex>, %arg3: tensor<6x2xi32>):
    %0:6 = "sparse_tensor.disassemble"(%arg0, %arg2, %arg3, %arg1) : (tensor<100x100xf64, #sparse>, tensor<2xindex>, tensor<6x2xi32>, tensor<6xf64>) -> (tensor<2xindex>, tensor<6x2xi32>, tensor<6xf64>, index, index, index)
    "func.return"(%0#2, %0#0, %0#1) : (tensor<6xf64>, tensor<2xindex>, tensor<6x2xi32>) -> ()
  }) : () -> ()
}) : () -> ()

