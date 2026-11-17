"builtin.module"() ({
  "func.func"() <{function_type = (!llvm.ptr) -> tensor<?x?xf32, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>>, sym_name = "sparse_new"}> ({
  ^bb0(%arg4: !llvm.ptr loc("<stdin>":6:8)):
    %2 = "sparse_tensor.new"(%arg4) : (!llvm.ptr) -> tensor<?x?xf32, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>> loc("<stdin>":7:10)
    "func.return"(%2) : (tensor<?x?xf32, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>>) -> () loc("<stdin>":8:5)
  }) : () -> () loc("<stdin>":5:3)
  "func.func"() <{function_type = (!llvm.ptr) -> tensor<?x?xf32, #sparse_tensor.encoding<{ map = (d0, d1) -> (d1 : dense, d0 : compressed) }>>, sym_name = "sparse_new_csc"}> ({
  ^bb0(%arg3: !llvm.ptr loc("<stdin>":11:8)):
    %1 = "sparse_tensor.new"(%arg3) : (!llvm.ptr) -> tensor<?x?xf32, #sparse_tensor.encoding<{ map = (d0, d1) -> (d1 : dense, d0 : compressed) }>> loc("<stdin>":12:10)
    "func.return"(%1) : (tensor<?x?xf32, #sparse_tensor.encoding<{ map = (d0, d1) -> (d1 : dense, d0 : compressed) }>>) -> () loc("<stdin>":13:5)
  }) : () -> () loc("<stdin>":10:3)
  "func.func"() <{function_type = (!llvm.ptr) -> tensor<?x?xf32, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed(nonunique), d1 : singleton) }>>, sym_name = "sparse_new_coo"}> ({
  ^bb0(%arg2: !llvm.ptr loc("<stdin>":16:8)):
    %0 = "sparse_tensor.new"(%arg2) : (!llvm.ptr) -> tensor<?x?xf32, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed(nonunique), d1 : singleton) }>> loc("<stdin>":17:10)
    "func.return"(%0) : (tensor<?x?xf32, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed(nonunique), d1 : singleton) }>>) -> () loc("<stdin>":18:5)
  }) : () -> () loc("<stdin>":15:3)
  "func.func"() <{function_type = (tensor<10x20xf32, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>>, !llvm.ptr) -> (), sym_name = "sparse_out"}> ({
  ^bb0(%arg0: tensor<10x20xf32, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>> loc("<stdin>":21:8), %arg1: !llvm.ptr loc("<stdin>":21:43)):
    "sparse_tensor.out"(%arg0, %arg1) : (tensor<10x20xf32, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>>, !llvm.ptr) -> () loc("<stdin>":22:5)
    "func.return"() : () -> () loc("<stdin>":23:5)
  }) : () -> () loc("<stdin>":20:3)
}) : () -> () loc("<stdin>":4:1)
