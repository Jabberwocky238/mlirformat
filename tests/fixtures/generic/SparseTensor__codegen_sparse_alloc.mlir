#sparse = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>
#sparse1 = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed(nonunique), d1 : singleton) }>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<2x2xf32, #sparse>) -> tensor<2x2xf32, #sparse>, sym_name = "sparse_alloc_copy_CSR"}> ({
  ^bb0(%arg1: tensor<2x2xf32, #sparse>):
    %1 = "bufferization.alloc_tensor"(%arg1) <{operandSegmentSizes = array<i32: 0, 1, 0>}> : (tensor<2x2xf32, #sparse>) -> tensor<2x2xf32, #sparse>
    "test.sink"(%1) : (tensor<2x2xf32, #sparse>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<2x2xf32, #sparse1>) -> tensor<2x2xf32, #sparse1>, sym_name = "sparse_alloc_copy_COO"}> ({
  ^bb0(%arg0: tensor<2x2xf32, #sparse1>):
    %0 = "bufferization.alloc_tensor"(%arg0) <{operandSegmentSizes = array<i32: 0, 1, 0>}> : (tensor<2x2xf32, #sparse1>) -> tensor<2x2xf32, #sparse1>
    "test.sink"(%0) : (tensor<2x2xf32, #sparse1>) -> ()
  }) : () -> ()
}) : () -> ()

