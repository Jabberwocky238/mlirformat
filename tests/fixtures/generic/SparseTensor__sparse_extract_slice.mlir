#sparse = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>
#sparse1 = #sparse_tensor.encoding<{ map = (d0 : #sparse_tensor<slice(0, 4, 1)>, d1 : #sparse_tensor<slice(0, 8, 1)>) -> (d0 : dense, d1 : compressed) }>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<8x8xf64, #sparse>) -> tensor<4x8xf64, #sparse1>, sym_name = "sparse_slice"}> ({
  ^bb0(%arg0: tensor<8x8xf64, #sparse>):
    %0 = "tensor.extract_slice"(%arg0) <{operandSegmentSizes = array<i32: 1, 0, 0, 0>, static_offsets = array<i64: 0, 0>, static_sizes = array<i64: 4, 8>, static_strides = array<i64: 1, 1>}> : (tensor<8x8xf64, #sparse>) -> tensor<4x8xf64, #sparse1>
    "func.return"(%0) : (tensor<4x8xf64, #sparse1>) -> ()
  }) : () -> ()
}) : () -> ()

