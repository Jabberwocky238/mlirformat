"builtin.module"() ({
  "func.func"() <{function_type = (!llvm.ptr) -> tensor<128xf64, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>>, sym_name = "sparse_new"}> ({
  ^bb0(%arg0: !llvm.ptr loc("<stdin>":4:8)):
    %0 = "sparse_tensor.new"(%arg0) : (!llvm.ptr) -> tensor<128xf64, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>> loc("<stdin>":5:10)
    "func.return"(%0) : (tensor<128xf64, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>>) -> () loc("<stdin>":6:5)
  }) : () -> () loc("<stdin>":3:3)
}) : () -> () loc("<stdin>":2:1)
