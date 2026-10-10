#map = affine_map<(d0, d1, d2) -> (d0, d1, d2)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<1x1x42xf32>) -> tensor<1x1x42xf32>, sym_name = "drop_outermost_unit_dims"}> ({
  ^bb0(%arg0: tensor<1x1x42xf32>):
    %0 = "tensor.empty"() : () -> tensor<1x1x42xf32>
    %1 = "linalg.generic"(%arg0, %0) <{indexing_maps = [#map, #map], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg1: f32, %arg2: f32):
      %2 = "arith.addf"(%arg1, %arg2) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%2) : (f32) -> ()
    }) : (tensor<1x1x42xf32>, tensor<1x1x42xf32>) -> tensor<1x1x42xf32>
    "func.return"(%1) : (tensor<1x1x42xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2) -> (d0, d1, d2)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<1x1x42xf32>, tensor<1x1x42xf32, #test.tensor_encoding<"encoding">>) -> tensor<1x1x42xf32>, sym_name = "drop_unit_dims_encoded_operand"}> ({
  ^bb0(%arg0: tensor<1x1x42xf32>, %arg1: tensor<1x1x42xf32, #test.tensor_encoding<"encoding">>):
    %0 = "tensor.empty"() : () -> tensor<1x1x42xf32>
    %1 = "linalg.generic"(%arg0, %arg1, %0) <{indexing_maps = [#map, #map, #map], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg2: f32, %arg3: f32, %arg4: f32):
      %2 = "arith.addf"(%arg2, %arg3) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%2) : (f32) -> ()
    }) : (tensor<1x1x42xf32>, tensor<1x1x42xf32, #test.tensor_encoding<"encoding">>, tensor<1x1x42xf32>) -> tensor<1x1x42xf32>
    "func.return"(%1) : (tensor<1x1x42xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2) -> (d0, d1, d2)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<1x1x42xf32>, tensor<1x1x42xf32>) -> tensor<1x1x42xf32, #test.tensor_encoding<"encoding">>, sym_name = "drop_unit_dims_encoded_result"}> ({
  ^bb0(%arg0: tensor<1x1x42xf32>, %arg1: tensor<1x1x42xf32>):
    %0 = "tensor.empty"() : () -> tensor<1x1x42xf32, #test.tensor_encoding<"encoding">>
    %1 = "linalg.generic"(%arg0, %arg1, %0) <{indexing_maps = [#map, #map, #map], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg2: f32, %arg3: f32, %arg4: f32):
      %2 = "arith.addf"(%arg2, %arg3) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%2) : (f32) -> ()
    }) : (tensor<1x1x42xf32>, tensor<1x1x42xf32>, tensor<1x1x42xf32, #test.tensor_encoding<"encoding">>) -> tensor<1x1x42xf32, #test.tensor_encoding<"encoding">>
    "func.return"(%1) : (tensor<1x1x42xf32, #test.tensor_encoding<"encoding">>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2) -> (d0, d1, d2)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<1x1x42xf32>, tensor<1x1x42xf32, #test.tensor_encoding<"encoding1">>) -> tensor<1x1x42xf32, #test.tensor_encoding<"encoding2">>, sym_name = "drop_unit_dims_encoded_operand_and_result"}> ({
  ^bb0(%arg0: tensor<1x1x42xf32>, %arg1: tensor<1x1x42xf32, #test.tensor_encoding<"encoding1">>):
    %0 = "tensor.empty"() : () -> tensor<1x1x42xf32, #test.tensor_encoding<"encoding2">>
    %1 = "linalg.generic"(%arg0, %arg1, %0) <{indexing_maps = [#map, #map, #map], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg2: f32, %arg3: f32, %arg4: f32):
      %2 = "arith.addf"(%arg2, %arg3) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%2) : (f32) -> ()
    }) : (tensor<1x1x42xf32>, tensor<1x1x42xf32, #test.tensor_encoding<"encoding1">>, tensor<1x1x42xf32, #test.tensor_encoding<"encoding2">>) -> tensor<1x1x42xf32, #test.tensor_encoding<"encoding2">>
    "func.return"(%1) : (tensor<1x1x42xf32, #test.tensor_encoding<"encoding2">>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2) -> (d0, d1, d2)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<1x1x42xf32, #test.tensor_encoding<"encoding1">>, tensor<1x1x42xf32, #test.tensor_encoding<"encoding2">>) -> tensor<1x1x42xf32>, sym_name = "drop_unit_dims_two_encoded_operands"}> ({
  ^bb0(%arg0: tensor<1x1x42xf32, #test.tensor_encoding<"encoding1">>, %arg1: tensor<1x1x42xf32, #test.tensor_encoding<"encoding2">>):
    %0 = "tensor.empty"() : () -> tensor<1x1x42xf32>
    %1 = "linalg.generic"(%arg0, %arg1, %0) <{indexing_maps = [#map, #map, #map], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg2: f32, %arg3: f32, %arg4: f32):
      %2 = "arith.addf"(%arg2, %arg3) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%2) : (f32) -> ()
    }) : (tensor<1x1x42xf32, #test.tensor_encoding<"encoding1">>, tensor<1x1x42xf32, #test.tensor_encoding<"encoding2">>, tensor<1x1x42xf32>) -> tensor<1x1x42xf32>
    "func.return"(%1) : (tensor<1x1x42xf32>) -> ()
  }) : () -> ()
}) : () -> ()

