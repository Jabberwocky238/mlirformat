"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?xf32, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed), posWidth = 64, crdWidth = 64 }>>) -> tensor<?xf32, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed), posWidth = 32, crdWidth = 32 }>>, sym_name = "sparse_convert"}> ({
  ^bb0(%arg1: tensor<?xf32, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed), posWidth = 64, crdWidth = 64 }>> loc("<stdin>":5:8)):
    %1 = "sparse_tensor.convert"(%arg1) : (tensor<?xf32, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed), posWidth = 64, crdWidth = 64 }>>) -> tensor<?xf32, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed), posWidth = 32, crdWidth = 32 }>> loc("<stdin>":6:10)
    "func.return"(%1) : (tensor<?xf32, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed), posWidth = 32, crdWidth = 32 }>>) -> () loc("<stdin>":7:5)
  }) : () -> () loc("<stdin>":4:3)
  "func.func"() <{function_type = (tensor<?xf32, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed), posWidth = 32, crdWidth = 32 }>>) -> tensor<?xf64, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed), posWidth = 32, crdWidth = 32 }>>, sym_name = "sparse_convert_value"}> ({
  ^bb0(%arg0: tensor<?xf32, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed), posWidth = 32, crdWidth = 32 }>> loc("<stdin>":10:8)):
    %0 = "sparse_tensor.convert"(%arg0) : (tensor<?xf32, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed), posWidth = 32, crdWidth = 32 }>>) -> tensor<?xf64, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed), posWidth = 32, crdWidth = 32 }>> loc("<stdin>":11:10)
    "func.return"(%0) : (tensor<?xf64, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed), posWidth = 32, crdWidth = 32 }>>) -> () loc("<stdin>":12:5)
  }) : () -> () loc("<stdin>":9:3)
}) : () -> () loc("<stdin>":3:1)
