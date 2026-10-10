#map = affine_map<(d0) -> (-d0 + 256)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<4x7x3xf32>, tensor<4x4x3xf32>, tensor<?x?x?xf32>) -> (tensor<4x11x3xf32>, tensor<?x?x?xf32>), sym_name = "concat_reification"}> ({
  ^bb0(%arg6: tensor<4x7x3xf32>, %arg7: tensor<4x4x3xf32>, %arg8: tensor<?x?x?xf32>):
    %3 = "tensor.concat"(%arg6, %arg7) <{dim = 1 : i64}> : (tensor<4x7x3xf32>, tensor<4x4x3xf32>) -> tensor<4x11x3xf32>
    %4 = "tensor.concat"(%arg6, %arg8) <{dim = 2 : i64}> : (tensor<4x7x3xf32>, tensor<?x?x?xf32>) -> tensor<?x?x?xf32>
    "func.return"(%3, %4) : (tensor<4x11x3xf32>, tensor<?x?x?xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (f32, index, tensor<64x?x64xf32>) -> tensor<1x?x64xf32>, sym_name = "pad_reification"}> ({
  ^bb0(%arg0: f32, %arg1: index, %arg2: tensor<64x?x64xf32>):
    %0 = "affine.apply"(%arg1) <{map = #map}> : (index) -> index
    %1 = "tensor.extract_slice"(%arg2, %arg1) <{operandSegmentSizes = array<i32: 1, 0, 1, 0>, static_offsets = array<i64: 0, 0, 0>, static_sizes = array<i64: 1, -9223372036854775808, 64>, static_strides = array<i64: 1, 1, 1>}> : (tensor<64x?x64xf32>, index) -> tensor<1x?x64xf32>
    %2 = "tensor.pad"(%1, %0) <{operandSegmentSizes = array<i32: 1, 0, 1>, static_high = array<i64: 0, -9223372036854775808, 0>, static_low = array<i64: 0, 0, 0>}> ({
    ^bb0(%arg3: index, %arg4: index, %arg5: index):
      "tensor.yield"(%arg0) : (f32) -> ()
    }) : (tensor<1x?x64xf32>, index) -> tensor<1x?x64xf32>
    "func.return"(%2) : (tensor<1x?x64xf32>) -> ()
  }) : () -> ()
}) : () -> ()

