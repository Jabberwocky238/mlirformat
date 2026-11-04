#map = affine_map<(d0, d1) -> (d0 + d1)>
#map1 = affine_map<(d0, d1) -> (d0, d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<80x16xf32>, tensor<1x3xf32>, index) -> tensor<1x3xf32>, sym_name = "masked_static_vectorize_nd_tensor_extract_with_affine_apply_contiguous"}> ({
  ^bb0(%arg1: tensor<80x16xf32>, %arg2: tensor<1x3xf32>, %arg3: index):
    %1 = "arith.constant"() <{value = 79 : index}> : () -> index
    %2 = "linalg.generic"(%arg2) <{indexing_maps = [#map1], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 0, 1>}> ({
    ^bb0(%arg4: f32):
      %3 = "linalg.index"() <{dim = 1 : i64}> : () -> index
      %4 = "affine.apply"(%3, %arg3) <{map = #map}> : (index, index) -> index
      %5 = "tensor.extract"(%arg1, %1, %4) : (tensor<80x16xf32>, index, index) -> f32
      "linalg.yield"(%5) : (f32) -> ()
    }) : (tensor<1x3xf32>) -> tensor<1x3xf32>
    "func.return"(%2) : (tensor<1x3xf32>) -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["linalg.generic"]}> : (!transform.any_op) -> !transform.any_op
      "transform.structured.vectorize"(%0) <{scalable_sizes = array<i1: false, false>, static_vector_sizes = array<i64: 1, 4>, vectorize_nd_extract}> : (!transform.any_op) -> ()
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1) -> (d0 + d1)>
#map1 = affine_map<(d0, d1) -> (d0, d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<80x16xf32>, tensor<1x3xf32>, index) -> tensor<1x3xf32>, sym_name = "masked_static_vectorize_nd_tensor_extract_with_affine_apply_contiguous_scalable"}> ({
  ^bb0(%arg1: tensor<80x16xf32>, %arg2: tensor<1x3xf32>, %arg3: index):
    %1 = "arith.constant"() <{value = 79 : index}> : () -> index
    %2 = "linalg.generic"(%arg2) <{indexing_maps = [#map1], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 0, 1>}> ({
    ^bb0(%arg4: f32):
      %3 = "linalg.index"() <{dim = 1 : i64}> : () -> index
      %4 = "affine.apply"(%3, %arg3) <{map = #map}> : (index, index) -> index
      %5 = "tensor.extract"(%arg1, %1, %4) : (tensor<80x16xf32>, index, index) -> f32
      "linalg.yield"(%5) : (f32) -> ()
    }) : (tensor<1x3xf32>) -> tensor<1x3xf32>
    "func.return"(%2) : (tensor<1x3xf32>) -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["linalg.generic"]}> : (!transform.any_op) -> !transform.any_op
      "transform.structured.vectorize"(%0) <{scalable_sizes = array<i1: false, true>, static_vector_sizes = array<i64: 1, 4>, vectorize_nd_extract}> : (!transform.any_op) -> ()
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1) -> (d0 + d1)>
#map1 = affine_map<(d0, d1) -> (d0, d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x?xf32>, tensor<?x?xf32>, index) -> tensor<?x?xf32>, sym_name = "masked_dynamic_vectorize_nd_tensor_extract_with_affine_apply_contiguous"}> ({
  ^bb0(%arg1: tensor<?x?xf32>, %arg2: tensor<?x?xf32>, %arg3: index):
    %1 = "arith.constant"() <{value = 79 : index}> : () -> index
    %2 = "linalg.generic"(%arg2) <{indexing_maps = [#map1], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 0, 1>}> ({
    ^bb0(%arg4: f32):
      %3 = "linalg.index"() <{dim = 1 : i64}> : () -> index
      %4 = "affine.apply"(%3, %arg3) <{map = #map}> : (index, index) -> index
      %5 = "tensor.extract"(%arg1, %1, %4) : (tensor<?x?xf32>, index, index) -> f32
      "linalg.yield"(%5) : (f32) -> ()
    }) : (tensor<?x?xf32>) -> tensor<?x?xf32>
    "func.return"(%2) : (tensor<?x?xf32>) -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["linalg.generic"]}> : (!transform.any_op) -> !transform.any_op
      "transform.structured.vectorize"(%0) <{scalable_sizes = array<i1: false, false>, static_vector_sizes = array<i64: 1, 4>, vectorize_nd_extract}> : (!transform.any_op) -> ()
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1) -> (d0 + d1)>
#map1 = affine_map<(d0, d1) -> (d0, d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x?xf32>, tensor<?x?xf32>, index) -> tensor<?x?xf32>, sym_name = "masked_dynamic_vectorize_nd_tensor_extract_with_affine_apply_contiguous_scalable"}> ({
  ^bb0(%arg1: tensor<?x?xf32>, %arg2: tensor<?x?xf32>, %arg3: index):
    %1 = "arith.constant"() <{value = 79 : index}> : () -> index
    %2 = "linalg.generic"(%arg2) <{indexing_maps = [#map1], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 0, 1>}> ({
    ^bb0(%arg4: f32):
      %3 = "linalg.index"() <{dim = 1 : i64}> : () -> index
      %4 = "affine.apply"(%3, %arg3) <{map = #map}> : (index, index) -> index
      %5 = "tensor.extract"(%arg1, %1, %4) : (tensor<?x?xf32>, index, index) -> f32
      "linalg.yield"(%5) : (f32) -> ()
    }) : (tensor<?x?xf32>) -> tensor<?x?xf32>
    "func.return"(%2) : (tensor<?x?xf32>) -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["linalg.generic"]}> : (!transform.any_op) -> !transform.any_op
      "transform.structured.vectorize"(%0) <{scalable_sizes = array<i1: false, true>, static_vector_sizes = array<i64: 1, 4>, vectorize_nd_extract}> : (!transform.any_op) -> ()
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1) -> (d0 + d1)>
#map1 = affine_map<(d0, d1) -> (d0, d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<80x16xf32>, index, tensor<1x3xf32>) -> tensor<1x3xf32>, sym_name = "masked_vectorize_nd_tensor_extract_with_affine_apply_gather"}> ({
  ^bb0(%arg1: tensor<80x16xf32>, %arg2: index, %arg3: tensor<1x3xf32>):
    %1 = "arith.constant"() <{value = 16 : index}> : () -> index
    %2 = "linalg.generic"(%arg3) <{indexing_maps = [#map1], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 0, 1>}> ({
    ^bb0(%arg4: f32):
      %3 = "linalg.index"() <{dim = 1 : i64}> : () -> index
      %4 = "affine.apply"(%3, %arg2) <{map = #map}> : (index, index) -> index
      %5 = "tensor.extract"(%arg1, %4, %1) : (tensor<80x16xf32>, index, index) -> f32
      "linalg.yield"(%5) : (f32) -> ()
    }) : (tensor<1x3xf32>) -> tensor<1x3xf32>
    "func.return"(%2) : (tensor<1x3xf32>) -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["linalg.generic"]}> : (!transform.any_op) -> !transform.any_op
      "transform.structured.vectorize"(%0) <{scalable_sizes = array<i1: false, false>, static_vector_sizes = array<i64: 1, 4>, vectorize_nd_extract}> : (!transform.any_op) -> ()
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1) -> (d0 + d1)>
#map1 = affine_map<(d0, d1) -> (d0, d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x?xf32>, index, tensor<?x?xf32>) -> tensor<?x?xf32>, sym_name = "masked_dynamic_vectorize_nd_tensor_extract_with_affine_apply_gather"}> ({
  ^bb0(%arg1: tensor<?x?xf32>, %arg2: index, %arg3: tensor<?x?xf32>):
    %1 = "arith.constant"() <{value = 16 : index}> : () -> index
    %2 = "linalg.generic"(%arg3) <{indexing_maps = [#map1], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 0, 1>}> ({
    ^bb0(%arg4: f32):
      %3 = "linalg.index"() <{dim = 1 : i64}> : () -> index
      %4 = "affine.apply"(%3, %arg2) <{map = #map}> : (index, index) -> index
      %5 = "tensor.extract"(%arg1, %4, %1) : (tensor<?x?xf32>, index, index) -> f32
      "linalg.yield"(%5) : (f32) -> ()
    }) : (tensor<?x?xf32>) -> tensor<?x?xf32>
    "func.return"(%2) : (tensor<?x?xf32>) -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["linalg.generic"]}> : (!transform.any_op) -> !transform.any_op
      "transform.structured.vectorize"(%0) <{scalable_sizes = array<i1: false, false>, static_vector_sizes = array<i64: 1, 4>, vectorize_nd_extract}> : (!transform.any_op) -> ()
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1) -> (d0, d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x?xf32>, tensor<?x?xf32>) -> tensor<?x?xf32>, sym_name = "extract_masked_vectorize"}> ({
  ^bb0(%arg1: tensor<?x?xf32>, %arg2: tensor<?x?xf32>):
    %1 = "arith.constant"() <{value = 1 : index}> : () -> index
    %2 = "arith.constant"() <{value = 2 : index}> : () -> index
    %3 = "linalg.generic"(%arg2) <{indexing_maps = [#map], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 0, 1>}> ({
    ^bb0(%arg3: f32):
      %4 = "tensor.extract"(%arg1, %1, %2) : (tensor<?x?xf32>, index, index) -> f32
      "linalg.yield"(%4) : (f32) -> ()
    }) : (tensor<?x?xf32>) -> tensor<?x?xf32>
    "func.return"(%3) : (tensor<?x?xf32>) -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["linalg.generic"]}> : (!transform.any_op) -> !transform.any_op
      "transform.structured.vectorize"(%0) <{scalable_sizes = array<i1: false, false>, static_vector_sizes = array<i64: 3, 3>, vectorize_nd_extract}> : (!transform.any_op) -> ()
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2) -> (d0, d1, d2)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<123x321xf32>, tensor<1x?x8xf32>) -> tensor<1x?x8xf32>, sym_name = "tensor_extract_dynamic_shape"}> ({
  ^bb0(%arg1: tensor<123x321xf32>, %arg2: tensor<1x?x8xf32>):
    %1 = "arith.constant"() <{value = 1 : index}> : () -> index
    %2 = "arith.constant"() <{value = 2 : index}> : () -> index
    %3 = "linalg.generic"(%arg2) <{indexing_maps = [#map], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 0, 1>}> ({
    ^bb0(%arg3: f32):
      %4 = "linalg.index"() <{dim = 0 : i64}> : () -> index
      %5 = "linalg.index"() <{dim = 1 : i64}> : () -> index
      %6 = "arith.addi"(%4, %5) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
      %7 = "tensor.extract"(%arg1, %1, %6) : (tensor<123x321xf32>, index, index) -> f32
      "linalg.yield"(%7) : (f32) -> ()
    }) : (tensor<1x?x8xf32>) -> tensor<1x?x8xf32>
    "func.return"(%3) : (tensor<1x?x8xf32>) -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["linalg.generic"]}> : (!transform.any_op) -> !transform.any_op
      "transform.structured.vectorize"(%0) <{scalable_sizes = array<i1: false, false, false>, static_vector_sizes = array<i64: 1, 3, 8>, vectorize_nd_extract}> : (!transform.any_op) -> ()
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2) -> (d0, d1, d2)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<1x1x3xi32>, tensor<1x3x2x4xi32>, index) -> tensor<1x1x3xi32>, sym_name = "scalar_broadcast"}> ({
  ^bb0(%arg1: tensor<1x1x3xi32>, %arg2: tensor<1x3x2x4xi32>, %arg3: index):
    %1 = "arith.constant"() <{value = 0 : index}> : () -> index
    %2 = "linalg.generic"(%arg1) <{indexing_maps = [#map], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 0, 1>}> ({
    ^bb0(%arg4: i32):
      %3 = "tensor.extract"(%arg2, %arg3, %arg3, %arg3, %arg3) : (tensor<1x3x2x4xi32>, index, index, index, index) -> i32
      "linalg.yield"(%3) : (i32) -> ()
    }) : (tensor<1x1x3xi32>) -> tensor<1x1x3xi32>
    "func.return"(%2) : (tensor<1x1x3xi32>) -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["linalg.generic"]}> : (!transform.any_op) -> !transform.any_op
      "transform.structured.vectorize"(%0) <{scalable_sizes = array<i1: false, false, false>, static_vector_sizes = array<i64: 1, 1, 4>, vectorize_nd_extract}> : (!transform.any_op) -> ()
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

