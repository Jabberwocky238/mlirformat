"builtin.module"() ({
  "func.func"() <{function_type = (tensor<6xf64>, tensor<2xindex>, tensor<6x2xi32>) -> tensor<100x100xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed(nonunique), d1 : singleton), crdWidth = 32 }>>, sym_name = "sparse_pack"}> ({
  ^bb0(%arg7: tensor<6xf64> loc("<stdin>":5:8), %arg8: tensor<2xindex> loc("<stdin>":5:30), %arg9: tensor<6x2xi32> loc("<stdin>":5:54)):
    %2 = "sparse_tensor.assemble"(%arg8, %arg9, %arg7) : (tensor<2xindex>, tensor<6x2xi32>, tensor<6xf64>) -> tensor<100x100xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed(nonunique), d1 : singleton), crdWidth = 32 }>> loc("<stdin>":6:10)
    "func.return"(%2) : (tensor<100x100xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed(nonunique), d1 : singleton), crdWidth = 32 }>>) -> () loc("<stdin>":7:5)
  }) : () -> () loc("<stdin>":4:3)
  "func.func"() <{function_type = (tensor<100x100xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed(nonunique), d1 : singleton), crdWidth = 32 }>>, tensor<6xf64>, tensor<2xindex>, tensor<6x2xi32>) -> (tensor<6xf64>, tensor<2xindex>, tensor<6x2xi32>), sym_name = "sparse_unpack"}> ({
  ^bb0(%arg3: tensor<100x100xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed(nonunique), d1 : singleton), crdWidth = 32 }>> loc("<stdin>":10:8), %arg4: tensor<6xf64> loc("<stdin>":10:45), %arg5: tensor<2xindex> loc("<stdin>":10:67), %arg6: tensor<6x2xi32> loc("<stdin>":10:91)):
    %1:6 = "sparse_tensor.disassemble"(%arg3, %arg5, %arg6, %arg4) : (tensor<100x100xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed(nonunique), d1 : singleton), crdWidth = 32 }>>, tensor<2xindex>, tensor<6x2xi32>, tensor<6xf64>) -> (tensor<2xindex>, tensor<6x2xi32>, tensor<6xf64>, index, index, index) loc("<stdin>":11:12)
    "func.return"(%1#2, %1#0, %1#1) : (tensor<6xf64>, tensor<2xindex>, tensor<6x2xi32>) -> () loc("<stdin>":12:5)
  }) : () -> () loc("<stdin>":9:3)
  "func.func"() <{function_type = (tensor<?xf64>, tensor<?xindex>, tensor<?xindex>) -> tensor<2x4xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 floordiv 2 : dense, d1 floordiv 2 : compressed, d0 mod 2 : dense, d1 mod 2 : dense) }>>, sym_name = "sparse_pack_blocked"}> ({
  ^bb0(%arg0: tensor<?xf64> loc("<stdin>":15:8), %arg1: tensor<?xindex> loc("<stdin>":15:30), %arg2: tensor<?xindex> loc("<stdin>":15:54)):
    %0 = "sparse_tensor.assemble"(%arg1, %arg2, %arg0) : (tensor<?xindex>, tensor<?xindex>, tensor<?xf64>) -> tensor<2x4xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 floordiv 2 : dense, d1 floordiv 2 : compressed, d0 mod 2 : dense, d1 mod 2 : dense) }>> loc("<stdin>":16:10)
    "func.return"(%0) : (tensor<2x4xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 floordiv 2 : dense, d1 floordiv 2 : compressed, d0 mod 2 : dense, d1 mod 2 : dense) }>>) -> () loc("<stdin>":17:5)
  }) : () -> () loc("<stdin>":14:3)
}) : () -> () loc("<stdin>":3:1)
