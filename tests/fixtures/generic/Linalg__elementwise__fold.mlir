#map = affine_map<(d0, d1, d2) -> (d0, d1, d2)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<16x8x32xf32>, tensor<8x16x32xf32>) -> tensor<8x16x32xf32>, sym_name = "unary_transpose"}> ({
  ^bb0(%arg0: tensor<16x8x32xf32>, %arg1: tensor<8x16x32xf32>):
    %0 = "tensor.empty"() : () -> tensor<8x16x32xf32>
    %1 = "linalg.transpose"(%arg0, %0) <{permutation = array<i64: 1, 0, 2>}> ({
    ^bb0(%arg4: f32, %arg5: f32):
      "linalg.yield"(%arg4) : (f32) -> ()
    }) : (tensor<16x8x32xf32>, tensor<8x16x32xf32>) -> tensor<8x16x32xf32>
    %2 = "linalg.elementwise"(%1, %arg1) <{indexing_maps = [#map, #map], kind = #linalg.elementwise_kind<exp>, operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg2: f32, %arg3: f32):
      %3 = "math.exp"(%arg2) <{fastmath = #arith.fastmath<none>}> : (f32) -> f32
      "linalg.yield"(%3) : (f32) -> ()
    }) : (tensor<8x16x32xf32>, tensor<8x16x32xf32>) -> tensor<8x16x32xf32>
    "func.return"(%2) : (tensor<8x16x32xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1) -> (d0, d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x?xf32>, tensor<?x?xf32>, tensor<?x?xf32>) -> tensor<?x?xf32>, sym_name = "binary_transposed"}> ({
  ^bb0(%arg0: tensor<?x?xf32>, %arg1: tensor<?x?xf32>, %arg2: tensor<?x?xf32>):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = 1 : index}> : () -> index
    %2 = "tensor.dim"(%arg0, %0) : (tensor<?x?xf32>, index) -> index
    %3 = "tensor.dim"(%arg0, %1) : (tensor<?x?xf32>, index) -> index
    %4 = "tensor.empty"(%3, %2) : (index, index) -> tensor<?x?xf32>
    %5 = "linalg.transpose"(%arg1, %4) <{permutation = array<i64: 1, 0>}> ({
    ^bb0(%arg6: f32, %arg7: f32):
      "linalg.yield"(%arg6) : (f32) -> ()
    }) : (tensor<?x?xf32>, tensor<?x?xf32>) -> tensor<?x?xf32>
    %6 = "linalg.elementwise"(%arg0, %5, %arg2) <{indexing_maps = [#map, #map, #map], kind = #linalg.elementwise_kind<add>, operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg3: f32, %arg4: f32, %arg5: f32):
      %7 = "arith.addf"(%arg3, %arg4) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%7) : (f32) -> ()
    }) : (tensor<?x?xf32>, tensor<?x?xf32>, tensor<?x?xf32>) -> tensor<?x?xf32>
    "func.return"(%6) : (tensor<?x?xf32>) -> ()
  }) : () -> ()
}) : () -> ()

