#sparse = #sparse_tensor.encoding<{ map = (d0, d1, d2, d3) -> (d0 : compressed, d1 : compressed, d2 : compressed, d3 : dense) }>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<128x32x32x1xf32, #sparse>, tensor<128x32x32x1xf32, #sparse>, tensor<128x32x32x1xf32, #sparse>) -> (tensor<128x32x32x1xf32, #sparse>, tensor<128x32x32x1xf32, #sparse>, tensor<128x32x32x1xf32, #sparse>), sym_name = "fuse_concat_with_extract"}> ({
  ^bb0(%arg0: tensor<128x32x32x1xf32, #sparse>, %arg1: tensor<128x32x32x1xf32, #sparse>, %arg2: tensor<128x32x32x1xf32, #sparse>):
    %0 = "tensor.concat"(%arg0, %arg1, %arg2) <{dim = 3 : i64}> : (tensor<128x32x32x1xf32, #sparse>, tensor<128x32x32x1xf32, #sparse>, tensor<128x32x32x1xf32, #sparse>) -> tensor<128x32x32x3xf32, #sparse>
    %1 = "tensor.extract_slice"(%0) <{operandSegmentSizes = array<i32: 1, 0, 0, 0>, static_offsets = array<i64: 0, 0, 0, 0>, static_sizes = array<i64: 128, 32, 32, 1>, static_strides = array<i64: 1, 1, 1, 1>}> : (tensor<128x32x32x3xf32, #sparse>) -> tensor<128x32x32x1xf32, #sparse>
    %2 = "tensor.extract_slice"(%0) <{operandSegmentSizes = array<i32: 1, 0, 0, 0>, static_offsets = array<i64: 0, 0, 0, 1>, static_sizes = array<i64: 128, 32, 32, 1>, static_strides = array<i64: 1, 1, 1, 1>}> : (tensor<128x32x32x3xf32, #sparse>) -> tensor<128x32x32x1xf32, #sparse>
    %3 = "tensor.extract_slice"(%0) <{operandSegmentSizes = array<i32: 1, 0, 0, 0>, static_offsets = array<i64: 0, 0, 0, 2>, static_sizes = array<i64: 128, 32, 32, 1>, static_strides = array<i64: 1, 1, 1, 1>}> : (tensor<128x32x32x3xf32, #sparse>) -> tensor<128x32x32x1xf32, #sparse>
    "func.return"(%1, %2, %3) : (tensor<128x32x32x1xf32, #sparse>, tensor<128x32x32x1xf32, #sparse>, tensor<128x32x32x1xf32, #sparse>) -> ()
  }) : () -> ()
}) : () -> ()

