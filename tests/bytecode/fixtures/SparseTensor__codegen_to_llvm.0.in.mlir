"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?xf64, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>>) -> tensor<?xf64, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>>, sym_name = "sparse_nop"}> ({
  ^bb0(%arg0: tensor<?xf64, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>> loc("<stdin>":4:8)):
    "func.return"(%arg0) : (tensor<?xf64, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>>) -> () loc("<stdin>":5:5)
  }) : () -> () loc("<stdin>":3:3)
}) : () -> () loc("<stdin>":2:1)
