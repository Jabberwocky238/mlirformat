#sparse = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed(nonunique), d1 : singleton), crdWidth = 32 }>
#sparse1 = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 floordiv 2 : dense, d1 floordiv 2 : compressed, d0 mod 2 : dense, d1 mod 2 : dense) }>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<6xf64>, tensor<2xindex>, tensor<6x2xi32>) -> tensor<100x100xf64, #sparse>, sym_name = "sparse_pack"}> ({
  ^bb0(%arg7: tensor<6xf64>, %arg8: tensor<2xindex>, %arg9: tensor<6x2xi32>):
    %2 = "sparse_tensor.assemble"(%arg8, %arg9, %arg7) : (tensor<2xindex>, tensor<6x2xi32>, tensor<6xf64>) -> tensor<100x100xf64, #sparse>
    "func.return"(%2) : (tensor<100x100xf64, #sparse>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<100x100xf64, #sparse>, tensor<6xf64>, tensor<2xindex>, tensor<6x2xi32>) -> (tensor<6xf64>, tensor<2xindex>, tensor<6x2xi32>), sym_name = "sparse_unpack"}> ({
  ^bb0(%arg3: tensor<100x100xf64, #sparse>, %arg4: tensor<6xf64>, %arg5: tensor<2xindex>, %arg6: tensor<6x2xi32>):
    %1:6 = "sparse_tensor.disassemble"(%arg3, %arg5, %arg6, %arg4) : (tensor<100x100xf64, #sparse>, tensor<2xindex>, tensor<6x2xi32>, tensor<6xf64>) -> (tensor<2xindex>, tensor<6x2xi32>, tensor<6xf64>, index, index, index)
    "func.return"(%1#2, %1#0, %1#1) : (tensor<6xf64>, tensor<2xindex>, tensor<6x2xi32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<?xf64>, tensor<?xindex>, tensor<?xindex>) -> tensor<2x4xf64, #sparse1>, sym_name = "sparse_pack_blocked"}> ({
  ^bb0(%arg0: tensor<?xf64>, %arg1: tensor<?xindex>, %arg2: tensor<?xindex>):
    %0 = "sparse_tensor.assemble"(%arg1, %arg2, %arg0) : (tensor<?xindex>, tensor<?xindex>, tensor<?xf64>) -> tensor<2x4xf64, #sparse1>
    "func.return"(%0) : (tensor<2x4xf64, #sparse1>) -> ()
  }) : () -> ()
}) : () -> ()

