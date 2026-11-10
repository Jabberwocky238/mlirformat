#sparse = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<8x8xf64, #sparse>) -> index, sym_name = "sparse_expansion"}> ({
  ^bb0(%arg0: tensor<8x8xf64, #sparse>):
    %0:4 = "sparse_tensor.expand"(%arg0) : (tensor<8x8xf64, #sparse>) -> (memref<?xf64>, memref<?xi1>, memref<?xindex>, index)
    "func.return"(%0#3) : (index) -> ()
  }) : () -> ()
}) : () -> ()

