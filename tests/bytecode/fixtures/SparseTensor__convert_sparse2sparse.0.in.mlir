"builtin.module"() ({
  "func.func"() <{function_type = (tensor<64xf32, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>>) -> tensor<64xf32, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>>, sym_name = "sparse_nop_convert"}> ({
  ^bb0(%arg5: tensor<64xf32, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>> loc("<stdin>":10:8)):
    %5 = "sparse_tensor.convert"(%arg5) : (tensor<64xf32, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>>) -> tensor<64xf32, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>> loc("<stdin>":11:10)
    "func.return"(%5) : (tensor<64xf32, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>>) -> () loc("<stdin>":12:5)
  }) : () -> () loc("<stdin>":9:3)
  "func.func"() <{function_type = (tensor<32xf32, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>>) -> tensor<?xf32, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>>, sym_name = "sparse_hidden_nop_cast"}> ({
  ^bb0(%arg4: tensor<32xf32, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>> loc("<stdin>":15:8)):
    %4 = "sparse_tensor.convert"(%arg4) : (tensor<32xf32, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>>) -> tensor<?xf32, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>> loc("<stdin>":16:10)
    "func.return"(%4) : (tensor<?xf32, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>>) -> () loc("<stdin>":17:5)
  }) : () -> () loc("<stdin>":14:3)
  "func.func"() <{function_type = (tensor<?xf32, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed), posWidth = 64, crdWidth = 64 }>>) -> tensor<?xf32, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed), posWidth = 32, crdWidth = 32 }>>, sym_name = "sparse_convert_1d_ss"}> ({
  ^bb0(%arg3: tensor<?xf32, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed), posWidth = 64, crdWidth = 64 }>> loc("<stdin>":20:8)):
    %3 = "sparse_tensor.convert"(%arg3) : (tensor<?xf32, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed), posWidth = 64, crdWidth = 64 }>>) -> tensor<?xf32, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed), posWidth = 32, crdWidth = 32 }>> loc("<stdin>":21:10)
    "func.return"(%3) : (tensor<?xf32, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed), posWidth = 32, crdWidth = 32 }>>) -> () loc("<stdin>":22:5)
  }) : () -> () loc("<stdin>":19:3)
  "func.func"() <{function_type = (tensor<?xf32, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed), posWidth = 64, crdWidth = 64 }>>) -> tensor<?xf32, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed), posWidth = 32, crdWidth = 32 }>>, sym_name = "sparse_convert"}> ({
  ^bb0(%arg2: tensor<?xf32, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed), posWidth = 64, crdWidth = 64 }>> loc("<stdin>":25:8)):
    %2 = "sparse_tensor.convert"(%arg2) : (tensor<?xf32, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed), posWidth = 64, crdWidth = 64 }>>) -> tensor<?xf32, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed), posWidth = 32, crdWidth = 32 }>> loc("<stdin>":26:10)
    "func.return"(%2) : (tensor<?xf32, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed), posWidth = 32, crdWidth = 32 }>>) -> () loc("<stdin>":27:5)
  }) : () -> () loc("<stdin>":24:3)
  "func.func"() <{function_type = (tensor<?x?x?xf32, #sparse_tensor.encoding<{ map = (d0, d1, d2) -> (d0 : compressed(nonunique), d1 : singleton(nonunique), d2 : singleton) }>>) -> tensor<?x?x?xf32, #sparse_tensor.encoding<{ map = (d0, d1, d2) -> (d2 : compressed, d0 : compressed, d1 : compressed) }>>, sym_name = "sparse_convert_permuted"}> ({
  ^bb0(%arg1: tensor<?x?x?xf32, #sparse_tensor.encoding<{ map = (d0, d1, d2) -> (d0 : compressed(nonunique), d1 : singleton(nonunique), d2 : singleton) }>> loc("<stdin>":30:8)):
    %1 = "sparse_tensor.convert"(%arg1) : (tensor<?x?x?xf32, #sparse_tensor.encoding<{ map = (d0, d1, d2) -> (d0 : compressed(nonunique), d1 : singleton(nonunique), d2 : singleton) }>>) -> tensor<?x?x?xf32, #sparse_tensor.encoding<{ map = (d0, d1, d2) -> (d2 : compressed, d0 : compressed, d1 : compressed) }>> loc("<stdin>":31:10)
    "func.return"(%1) : (tensor<?x?x?xf32, #sparse_tensor.encoding<{ map = (d0, d1, d2) -> (d2 : compressed, d0 : compressed, d1 : compressed) }>>) -> () loc("<stdin>":32:5)
  }) : () -> () loc("<stdin>":29:3)
  "func.func"() <{function_type = (tensor<2x13xi32, #sparse_tensor.encoding<{ map = (d0 : #sparse_tensor<slice(2, 2, 1)>, d1 : #sparse_tensor<slice(12, 13, 1)>) -> (d0 : compressed(nonunique), d1 : singleton) }>>) -> tensor<2x13xi32, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed(nonunique), d1 : singleton) }>>, sym_name = "sparse_convert_slice"}> ({
  ^bb0(%arg0: tensor<2x13xi32, #sparse_tensor.encoding<{ map = (d0 : #sparse_tensor<slice(2, 2, 1)>, d1 : #sparse_tensor<slice(12, 13, 1)>) -> (d0 : compressed(nonunique), d1 : singleton) }>> loc("<stdin>":35:8)):
    %0 = "sparse_tensor.convert"(%arg0) : (tensor<2x13xi32, #sparse_tensor.encoding<{ map = (d0 : #sparse_tensor<slice(2, 2, 1)>, d1 : #sparse_tensor<slice(12, 13, 1)>) -> (d0 : compressed(nonunique), d1 : singleton) }>>) -> tensor<2x13xi32, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed(nonunique), d1 : singleton) }>> loc("<stdin>":36:10)
    "func.return"(%0) : (tensor<2x13xi32, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed(nonunique), d1 : singleton) }>>) -> () loc("<stdin>":37:5)
  }) : () -> () loc("<stdin>":34:3)
}) : () -> () loc("<stdin>":8:1)
