#map = affine_map<(d0) -> (d0)>
#map1 = affine_map<(d0) -> ()>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<1584xf32>, memref<1584xf32>, memref<f32>) -> (), sym_name = "contraction_dot"}> ({
  ^bb0(%arg1: memref<1584xf32>, %arg2: memref<1584xf32>, %arg3: memref<f32>):
    "linalg.dot"(%arg1, %arg2, %arg3) <{operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg4: f32, %arg5: f32, %arg6: f32):
      %1 = "arith.mulf"(%arg4, %arg5) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %2 = "arith.addf"(%arg6, %1) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%2) : (f32) -> ()
    }) {linalg.memoized_indexing_maps = [#map, #map, #map1]} : (memref<1584xf32>, memref<1584xf32>, memref<f32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["linalg.dot"]}> : (!transform.any_op) -> !transform.any_op
      "transform.structured.vectorize"(%0) : (!transform.any_op) -> ()
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1) -> (d0, d1)>
#map1 = affine_map<(d0, d1) -> (d1)>
#map2 = affine_map<(d0, d1) -> (d0)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<1584x1584xf32>, memref<1584xf32>, memref<1584xf32>) -> (), sym_name = "contraction_matvec"}> ({
  ^bb0(%arg1: memref<1584x1584xf32>, %arg2: memref<1584xf32>, %arg3: memref<1584xf32>):
    "linalg.matvec"(%arg1, %arg2, %arg3) <{operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg4: f32, %arg5: f32, %arg6: f32):
      %3 = "arith.mulf"(%arg4, %arg5) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %4 = "arith.addf"(%arg6, %3) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%4) : (f32) -> ()
    }) {linalg.memoized_indexing_maps = [#map, #map1, #map2]} : (memref<1584x1584xf32>, memref<1584xf32>, memref<1584xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["linalg.matvec"]}> : (!transform.any_op) -> !transform.any_op
      %1 = "transform.get_parent_op"(%0) <{isolated_from_above, nth_parent = 1 : i64}> : (!transform.any_op) -> !transform.any_op
      %2 = "transform.structured.vectorize_children_and_apply_patterns"(%1) <{disable_multi_reduction_to_contract_patterns}> : (!transform.any_op) -> !transform.any_op
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2) -> (d0, d2)>
#map1 = affine_map<(d0, d1, d2) -> (d2, d1)>
#map2 = affine_map<(d0, d1, d2) -> (d0, d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<1584x1584xf32>, memref<1584x1584xf32>, memref<1584x1584xf32>) -> (), sym_name = "contraction_matmul"}> ({
  ^bb0(%arg1: memref<1584x1584xf32>, %arg2: memref<1584x1584xf32>, %arg3: memref<1584x1584xf32>):
    "linalg.matmul"(%arg1, %arg2, %arg3) <{indexing_maps = [#map, #map1, #map2], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg4: f32, %arg5: f32, %arg6: f32):
      %3 = "arith.mulf"(%arg4, %arg5) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %4 = "arith.addf"(%arg6, %3) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%4) : (f32) -> ()
    }) : (memref<1584x1584xf32>, memref<1584x1584xf32>, memref<1584x1584xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["linalg.matmul"]}> : (!transform.any_op) -> !transform.any_op
      %1 = "transform.get_parent_op"(%0) <{isolated_from_above, nth_parent = 1 : i64}> : (!transform.any_op) -> !transform.any_op
      %2 = "transform.structured.vectorize_children_and_apply_patterns"(%1) <{disable_multi_reduction_to_contract_patterns}> : (!transform.any_op) -> !transform.any_op
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2) -> (d0, d2)>
#map1 = affine_map<(d0, d1, d2) -> (d2, d1)>
#map2 = affine_map<(d0, d1, d2) -> (d0, d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<1584x1584xbf16>, memref<1584x1584xbf16>, memref<1584x1584xf32>) -> (), sym_name = "float_mixed_precision_matmul"}> ({
  ^bb0(%arg1: memref<1584x1584xbf16>, %arg2: memref<1584x1584xbf16>, %arg3: memref<1584x1584xf32>):
    "linalg.matmul"(%arg1, %arg2, %arg3) <{indexing_maps = [#map, #map1, #map2], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg4: bf16, %arg5: bf16, %arg6: f32):
      %3 = "arith.extf"(%arg4) : (bf16) -> f32
      %4 = "arith.extf"(%arg5) : (bf16) -> f32
      %5 = "arith.mulf"(%3, %4) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %6 = "arith.addf"(%arg6, %5) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%6) : (f32) -> ()
    }) : (memref<1584x1584xbf16>, memref<1584x1584xbf16>, memref<1584x1584xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["linalg.matmul"]}> : (!transform.any_op) -> !transform.any_op
      %1 = "transform.get_parent_op"(%0) <{isolated_from_above, nth_parent = 1 : i64}> : (!transform.any_op) -> !transform.any_op
      %2 = "transform.structured.vectorize_children_and_apply_patterns"(%1) <{fold_type_extensions_into_contract}> : (!transform.any_op) -> !transform.any_op
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2) -> (d0, d2)>
#map1 = affine_map<(d0, d1, d2) -> (d2, d1)>
#map2 = affine_map<(d0, d1, d2) -> (d0, d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<8x16xf32>, memref<16x32xf32>, memref<8x32xf32>) -> (), sym_name = "vectorization_test_2"}> ({
  ^bb0(%arg1: memref<8x16xf32>, %arg2: memref<16x32xf32>, %arg3: memref<8x32xf32>):
    "linalg.matmul"(%arg1, %arg2, %arg3) <{indexing_maps = [#map, #map1, #map2], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg4: f32, %arg5: f32, %arg6: f32):
      %3 = "arith.mulf"(%arg4, %arg5) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %4 = "arith.addf"(%arg6, %3) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%4) : (f32) -> ()
    }) : (memref<8x16xf32>, memref<16x32xf32>, memref<8x32xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["linalg.matmul"]}> : (!transform.any_op) -> !transform.any_op
      %1 = "transform.get_parent_op"(%0) <{isolated_from_above, nth_parent = 1 : i64}> : (!transform.any_op) -> !transform.any_op
      %2 = "transform.structured.vectorize_children_and_apply_patterns"(%1) <{disable_multi_reduction_to_contract_patterns}> : (!transform.any_op) -> !transform.any_op
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2) -> (d0, d2)>
#map1 = affine_map<(d0, d1, d2) -> (d2, d1)>
#map2 = affine_map<(d0, d1, d2) -> (d0, d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<8x4xf32>, tensor<4x12xf32>, tensor<8x12xf32>) -> tensor<8x12xf32>, sym_name = "matmul_tensors"}> ({
  ^bb0(%arg1: tensor<8x4xf32>, %arg2: tensor<4x12xf32>, %arg3: tensor<8x12xf32>):
    %3 = "linalg.matmul"(%arg1, %arg2, %arg3) <{indexing_maps = [#map, #map1, #map2], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg4: f32, %arg5: f32, %arg6: f32):
      %4 = "arith.mulf"(%arg4, %arg5) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %5 = "arith.addf"(%arg6, %4) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%5) : (f32) -> ()
    }) : (tensor<8x4xf32>, tensor<4x12xf32>, tensor<8x12xf32>) -> tensor<8x12xf32>
    "func.return"(%3) : (tensor<8x12xf32>) -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["linalg.matmul"]}> : (!transform.any_op) -> !transform.any_op
      %1 = "transform.get_parent_op"(%0) <{isolated_from_above, nth_parent = 1 : i64}> : (!transform.any_op) -> !transform.any_op
      %2 = "transform.structured.vectorize_children_and_apply_patterns"(%1) <{disable_multi_reduction_to_contract_patterns, disable_transfer_permutation_map_lowering_patterns}> : (!transform.any_op) -> !transform.any_op
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2, d3) -> (d0, d1, d3)>
#map1 = affine_map<(d0, d1, d2, d3) -> (d0, d3, d2)>
#map2 = affine_map<(d0, d1, d2, d3) -> (d0, d1, d2)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<1584x1584x1584xf32>, memref<1584x1584x1584xf32>, memref<1584x1584x1584xf32>) -> (), sym_name = "contraction_batch_matmul"}> ({
  ^bb0(%arg1: memref<1584x1584x1584xf32>, %arg2: memref<1584x1584x1584xf32>, %arg3: memref<1584x1584x1584xf32>):
    "linalg.batch_matmul"(%arg1, %arg2, %arg3) <{indexing_maps = [#map, #map1, #map2], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg4: f32, %arg5: f32, %arg6: f32):
      %3 = "arith.mulf"(%arg4, %arg5) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %4 = "arith.addf"(%arg6, %3) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%4) : (f32) -> ()
    }) : (memref<1584x1584x1584xf32>, memref<1584x1584x1584xf32>, memref<1584x1584x1584xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["linalg.batch_matmul"]}> : (!transform.any_op) -> !transform.any_op
      %1 = "transform.get_parent_op"(%0) <{isolated_from_above, nth_parent = 1 : i64}> : (!transform.any_op) -> !transform.any_op
      %2 = "transform.structured.vectorize_children_and_apply_patterns"(%1) <{disable_multi_reduction_to_contract_patterns}> : (!transform.any_op) -> !transform.any_op
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2) -> (d0, d2)>
#map1 = affine_map<(d0, d1, d2) -> (d2, d1)>
#map2 = affine_map<(d0, d1, d2) -> (d0, d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<24x12xf32>, tensor<12x25xf32>, tensor<24x25xf32>) -> tensor<24x25xf32>, sym_name = "matmul_as_contract"}> ({
  ^bb0(%arg1: tensor<24x12xf32>, %arg2: tensor<12x25xf32>, %arg3: tensor<24x25xf32>):
    %3 = "linalg.contract"(%arg1, %arg2, %arg3) <{indexing_maps = [#map, #map1, #map2], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg4: f32, %arg5: f32, %arg6: f32):
      %4 = "arith.mulf"(%arg4, %arg5) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %5 = "arith.addf"(%arg6, %4) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%5) : (f32) -> ()
    }) : (tensor<24x12xf32>, tensor<12x25xf32>, tensor<24x25xf32>) -> tensor<24x25xf32>
    "func.return"(%3) : (tensor<24x25xf32>) -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["linalg.contract"]}> : (!transform.any_op) -> !transform.any_op
      %1 = "transform.get_parent_op"(%0) <{isolated_from_above, nth_parent = 1 : i64}> : (!transform.any_op) -> !transform.any_op
      %2 = "transform.structured.vectorize_children_and_apply_patterns"(%1) : (!transform.any_op) -> !transform.any_op
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2) -> (d0, d2)>
#map1 = affine_map<(d0, d1, d2) -> (d2, d1)>
#map2 = affine_map<(d0, d1, d2) -> (d0, d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<24x12xbf16>, tensor<12x25xbf16>, tensor<24x25xf32>) -> tensor<24x25xf32>, sym_name = "float_mixed_precision_matmul_as_contract"}> ({
  ^bb0(%arg1: tensor<24x12xbf16>, %arg2: tensor<12x25xbf16>, %arg3: tensor<24x25xf32>):
    %3 = "linalg.contract"(%arg1, %arg2, %arg3) <{indexing_maps = [#map, #map1, #map2], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg4: bf16, %arg5: bf16, %arg6: f32):
      %4 = "arith.extf"(%arg4) : (bf16) -> f32
      %5 = "arith.extf"(%arg5) : (bf16) -> f32
      %6 = "arith.mulf"(%4, %5) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %7 = "arith.addf"(%arg6, %6) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%7) : (f32) -> ()
    }) : (tensor<24x12xbf16>, tensor<12x25xbf16>, tensor<24x25xf32>) -> tensor<24x25xf32>
    "func.return"(%3) : (tensor<24x25xf32>) -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["linalg.contract"]}> : (!transform.any_op) -> !transform.any_op
      %1 = "transform.get_parent_op"(%0) <{isolated_from_above, nth_parent = 1 : i64}> : (!transform.any_op) -> !transform.any_op
      %2 = "transform.structured.vectorize_children_and_apply_patterns"(%1) <{fold_type_extensions_into_contract}> : (!transform.any_op) -> !transform.any_op
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<8x16xf32>, f32) -> (), sym_name = "test_vectorize_fill"}> ({
  ^bb0(%arg1: memref<8x16xf32>, %arg2: f32):
    "linalg.fill"(%arg2, %arg1) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg3: f32, %arg4: f32):
      "linalg.yield"(%arg3) : (f32) -> ()
    }) : (f32, memref<8x16xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["linalg.fill"]}> : (!transform.any_op) -> !transform.any_op
      %1 = "transform.get_parent_op"(%0) <{isolated_from_above, nth_parent = 1 : i64}> : (!transform.any_op) -> !transform.any_op
      %2 = "transform.structured.vectorize_children_and_apply_patterns"(%1) : (!transform.any_op) -> !transform.any_op
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<f32>, f32) -> (), sym_name = "test_vectorize_fill_0d"}> ({
  ^bb0(%arg1: memref<f32>, %arg2: f32):
    "linalg.fill"(%arg2, %arg1) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg3: f32, %arg4: f32):
      "linalg.yield"(%arg3) : (f32) -> ()
    }) : (f32, memref<f32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["linalg.fill"]}> : (!transform.any_op) -> !transform.any_op
      %1 = "transform.get_parent_op"(%0) <{isolated_from_above, nth_parent = 1 : i64}> : (!transform.any_op) -> !transform.any_op
      %2 = "transform.structured.vectorize_children_and_apply_patterns"(%1) : (!transform.any_op) -> !transform.any_op
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<32x8x16xf32>, tensor<4x1x32x16x2xf32>) -> tensor<4x1x32x16x2xf32>, sym_name = "pack_no_padding"}> ({
  ^bb0(%arg1: tensor<32x8x16xf32>, %arg2: tensor<4x1x32x16x2xf32>):
    %3 = "linalg.pack"(%arg1, %arg2) <{inner_dims_pos = array<i64: 2, 1>, operandSegmentSizes = array<i32: 1, 1, 0, 0>, outer_dims_perm = array<i64: 1, 2, 0>, static_inner_tiles = array<i64: 16, 2>}> : (tensor<32x8x16xf32>, tensor<4x1x32x16x2xf32>) -> tensor<4x1x32x16x2xf32>
    "func.return"(%3) : (tensor<4x1x32x16x2xf32>) -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["linalg.pack"]}> : (!transform.any_op) -> !transform.any_op
      %1 = "transform.get_parent_op"(%0) <{isolated_from_above, nth_parent = 1 : i64}> : (!transform.any_op) -> !transform.any_op
      %2 = "transform.structured.vectorize_children_and_apply_patterns"(%1) : (!transform.any_op) -> !transform.any_op
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<32x7x15xf32>, tensor<32x4x1x16x2xf32>) -> tensor<32x4x1x16x2xf32>, sym_name = "pack_with_padding"}> ({
  ^bb0(%arg1: tensor<32x7x15xf32>, %arg2: tensor<32x4x1x16x2xf32>):
    %3 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %4 = "linalg.pack"(%arg1, %arg2, %3) <{inner_dims_pos = array<i64: 2, 1>, operandSegmentSizes = array<i32: 1, 1, 1, 0>, static_inner_tiles = array<i64: 16, 2>}> : (tensor<32x7x15xf32>, tensor<32x4x1x16x2xf32>, f32) -> tensor<32x4x1x16x2xf32>
    "func.return"(%4) : (tensor<32x4x1x16x2xf32>) -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["linalg.pack"]}> : (!transform.any_op) -> !transform.any_op
      %1 = "transform.get_parent_op"(%0) <{isolated_from_above, nth_parent = 1 : i64}> : (!transform.any_op) -> !transform.any_op
      %2 = "transform.structured.vectorize_children_and_apply_patterns"(%1) : (!transform.any_op) -> !transform.any_op
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<64xf32>, memref<64xf32>, memref<64xf32>) -> (), sym_name = "vectorize_map"}> ({
  ^bb0(%arg1: memref<64xf32>, %arg2: memref<64xf32>, %arg3: memref<64xf32>):
    "linalg.map"(%arg1, %arg2, %arg3) ({
    ^bb0(%arg4: f32, %arg5: f32, %arg6: f32):
      %3 = "arith.addf"(%arg4, %arg5) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%3) : (f32) -> ()
    }) : (memref<64xf32>, memref<64xf32>, memref<64xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["linalg.map"]}> : (!transform.any_op) -> !transform.any_op
      %1 = "transform.get_parent_op"(%0) <{isolated_from_above, nth_parent = 1 : i64}> : (!transform.any_op) -> !transform.any_op
      %2 = "transform.structured.vectorize_children_and_apply_patterns"(%1) : (!transform.any_op) -> !transform.any_op
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<16x32x64xf32>, memref<32x64x16xf32>) -> (), sym_name = "vectorize_transpose"}> ({
  ^bb0(%arg1: memref<16x32x64xf32>, %arg2: memref<32x64x16xf32>):
    "linalg.transpose"(%arg1, %arg2) <{permutation = array<i64: 1, 2, 0>}> ({
    ^bb0(%arg3: f32, %arg4: f32):
      "linalg.yield"(%arg3) : (f32) -> ()
    }) : (memref<16x32x64xf32>, memref<32x64x16xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["linalg.transpose"]}> : (!transform.any_op) -> !transform.any_op
      %1 = "transform.get_parent_op"(%0) <{isolated_from_above, nth_parent = 1 : i64}> : (!transform.any_op) -> !transform.any_op
      %2 = "transform.structured.vectorize_children_and_apply_patterns"(%1) : (!transform.any_op) -> !transform.any_op
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<16x32x64xf32>, memref<16x64xf32>) -> (), sym_name = "vectorize_reduce"}> ({
  ^bb0(%arg1: memref<16x32x64xf32>, %arg2: memref<16x64xf32>):
    "linalg.reduce"(%arg1, %arg2) <{dimensions = array<i64: 1>}> ({
    ^bb0(%arg3: f32, %arg4: f32):
      %3 = "arith.addf"(%arg3, %arg4) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%3) : (f32) -> ()
    }) : (memref<16x32x64xf32>, memref<16x64xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["linalg.reduce"]}> : (!transform.any_op) -> !transform.any_op
      %1 = "transform.get_parent_op"(%0) <{isolated_from_above, nth_parent = 1 : i64}> : (!transform.any_op) -> !transform.any_op
      %2 = "transform.structured.vectorize_children_and_apply_patterns"(%1) : (!transform.any_op) -> !transform.any_op
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2) -> (d0, d2)>
#map1 = affine_map<(d0, d1, d2) -> (d2, d1)>
#map2 = affine_map<(d0, d1, d2) -> (d0, d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<8x16xf32>, memref<16x32xf32>, memref<8x32xf32>) -> (), sym_name = "vectorization_test"}> ({
  ^bb0(%arg1: memref<8x16xf32>, %arg2: memref<16x32xf32>, %arg3: memref<8x32xf32>):
    "linalg.generic"(%arg1, %arg2, %arg3) <{indexing_maps = [#map, #map1, #map2], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<reduction>], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg4: f32, %arg5: f32, %arg6: f32):
      %3 = "arith.mulf"(%arg4, %arg5) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %4 = "arith.addf"(%arg6, %3) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%4) : (f32) -> ()
    }) : (memref<8x16xf32>, memref<16x32xf32>, memref<8x32xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["linalg.generic"]}> : (!transform.any_op) -> !transform.any_op
      %1 = "transform.get_parent_op"(%0) <{isolated_from_above, nth_parent = 1 : i64}> : (!transform.any_op) -> !transform.any_op
      %2 = "transform.structured.vectorize_children_and_apply_patterns"(%1) <{disable_multi_reduction_to_contract_patterns, disable_transfer_permutation_map_lowering_patterns}> : (!transform.any_op) -> !transform.any_op
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
#map = affine_map<() -> ()>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<f32>, tensor<f32>, tensor<f32>) -> tensor<f32>, sym_name = "generic_0d"}> ({
  ^bb0(%arg1: tensor<f32>, %arg2: tensor<f32>, %arg3: tensor<f32>):
    %3 = "linalg.generic"(%arg1, %arg2, %arg3) <{indexing_maps = [#map, #map, #map], iterator_types = [], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg4: f32, %arg5: f32, %arg6: f32):
      %4 = "arith.mulf"(%arg4, %arg5) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %5 = "arith.addf"(%arg6, %4) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%5) : (f32) -> ()
    }) : (tensor<f32>, tensor<f32>, tensor<f32>) -> tensor<f32>
    "func.return"(%3) : (tensor<f32>) -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["linalg.generic"]}> : (!transform.any_op) -> !transform.any_op
      %1 = "transform.get_parent_op"(%0) <{isolated_from_above, nth_parent = 1 : i64}> : (!transform.any_op) -> !transform.any_op
      %2 = "transform.structured.vectorize_children_and_apply_patterns"(%1) <{disable_multi_reduction_to_contract_patterns, disable_transfer_permutation_map_lowering_patterns}> : (!transform.any_op) -> !transform.any_op
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2) -> (d0, d2)>
#map1 = affine_map<(d0, d1, d2) -> (d2, d1)>
#map2 = affine_map<(d0, d1, d2) -> (d1, d0)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<8x16xf32>, memref<16x32xf32>, memref<32x8xf32>) -> (), sym_name = "generic_output_transpose"}> ({
  ^bb0(%arg1: memref<8x16xf32>, %arg2: memref<16x32xf32>, %arg3: memref<32x8xf32>):
    "linalg.generic"(%arg1, %arg2, %arg3) <{indexing_maps = [#map, #map1, #map2], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<reduction>], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg4: f32, %arg5: f32, %arg6: f32):
      %3 = "arith.mulf"(%arg4, %arg5) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %4 = "arith.addf"(%arg6, %3) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%4) : (f32) -> ()
    }) : (memref<8x16xf32>, memref<16x32xf32>, memref<32x8xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["linalg.generic"]}> : (!transform.any_op) -> !transform.any_op
      %1 = "transform.get_parent_op"(%0) <{isolated_from_above, nth_parent = 1 : i64}> : (!transform.any_op) -> !transform.any_op
      %2 = "transform.structured.vectorize_children_and_apply_patterns"(%1) <{disable_multi_reduction_to_contract_patterns, disable_transfer_permutation_map_lowering_patterns}> : (!transform.any_op) -> !transform.any_op
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2) -> (d0, d1, d2)>
#map1 = affine_map<(d0, d1, d2) -> (d1, d0, d2)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<12x128x32xf32>) -> tensor<128x12x32xf32>, sym_name = "generic_interchanged_transpose"}> ({
  ^bb0(%arg1: tensor<12x128x32xf32>):
    %3 = "tensor.empty"() : () -> tensor<128x12x32xf32>
    %4 = "linalg.generic"(%arg1, %3) <{indexing_maps = [#map, #map1], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg2: f32, %arg3: f32):
      "linalg.yield"(%arg2) : (f32) -> ()
    }) : (tensor<12x128x32xf32>, tensor<128x12x32xf32>) -> tensor<128x12x32xf32>
    "func.return"(%4) : (tensor<128x12x32xf32>) -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["linalg.generic"]}> : (!transform.any_op) -> !transform.any_op
      %1 = "transform.get_parent_op"(%0) <{isolated_from_above, nth_parent = 1 : i64}> : (!transform.any_op) -> !transform.any_op
      %2 = "transform.structured.vectorize_children_and_apply_patterns"(%1) <{disable_multi_reduction_to_contract_patterns, disable_transfer_permutation_map_lowering_patterns}> : (!transform.any_op) -> !transform.any_op
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2) -> (d0, d2)>
#map1 = affine_map<(d0, d1, d2) -> (d2, d1)>
#map2 = affine_map<(d0, d1, d2) -> (d0, d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<8x16xi32>, memref<16x32xi32>, memref<8x32xi32>) -> (), sym_name = "vectorization_test_integer"}> ({
  ^bb0(%arg1: memref<8x16xi32>, %arg2: memref<16x32xi32>, %arg3: memref<8x32xi32>):
    "linalg.generic"(%arg1, %arg2, %arg3) <{indexing_maps = [#map, #map1, #map2], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<reduction>], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg4: i32, %arg5: i32, %arg6: i32):
      %3 = "arith.muli"(%arg4, %arg5) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
      %4 = "arith.addi"(%arg6, %3) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
      "linalg.yield"(%4) : (i32) -> ()
    }) : (memref<8x16xi32>, memref<16x32xi32>, memref<8x32xi32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["linalg.generic"]}> : (!transform.any_op) -> !transform.any_op
      %1 = "transform.get_parent_op"(%0) <{isolated_from_above, nth_parent = 1 : i64}> : (!transform.any_op) -> !transform.any_op
      %2 = "transform.structured.vectorize_children_and_apply_patterns"(%1) <{disable_multi_reduction_to_contract_patterns, disable_transfer_permutation_map_lowering_patterns}> : (!transform.any_op) -> !transform.any_op
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1) -> ()>
#map1 = affine_map<(d0, d1) -> (d0, d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<8x16xf32>, f32) -> (), sym_name = "test_vectorize_scalar_input"}> ({
  ^bb0(%arg1: memref<8x16xf32>, %arg2: f32):
    "linalg.generic"(%arg2, %arg1) <{indexing_maps = [#map, #map1], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg3: f32, %arg4: f32):
      "linalg.yield"(%arg3) : (f32) -> ()
    }) : (f32, memref<8x16xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["linalg.generic"]}> : (!transform.any_op) -> !transform.any_op
      %1 = "transform.get_parent_op"(%0) <{isolated_from_above, nth_parent = 1 : i64}> : (!transform.any_op) -> !transform.any_op
      %2 = "transform.structured.vectorize_children_and_apply_patterns"(%1) : (!transform.any_op) -> !transform.any_op
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1) -> ()>
#map1 = affine_map<(d0, d1) -> (d0, d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<8x16xcomplex<f32>>, complex<f32>) -> (), sym_name = "test_do_not_vectorize_unsupported_element_types"}> ({
  ^bb0(%arg1: memref<8x16xcomplex<f32>>, %arg2: complex<f32>):
    "linalg.generic"(%arg2, %arg1) <{indexing_maps = [#map, #map1], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg3: complex<f32>, %arg4: complex<f32>):
      "linalg.yield"(%arg3) : (complex<f32>) -> ()
    }) : (complex<f32>, memref<8x16xcomplex<f32>>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["linalg.generic"]}> : (!transform.any_op) -> !transform.any_op
      %1 = "transform.get_parent_op"(%0) <{isolated_from_above, nth_parent = 1 : i64}> : (!transform.any_op) -> !transform.any_op
      %2 = "transform.structured.vectorize_children_and_apply_patterns"(%1) : (!transform.any_op) -> !transform.any_op
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
#map = affine_map<() -> (123)>
#map1 = affine_map<(d0, d1) -> (d0 + d1)>
#map2 = affine_map<(d0)[s0] -> (d0 + s0)>
#map3 = affine_map<(d0) -> (d0 + 1)>
#map4 = affine_map<(d0, d1, d2) -> (d0 + d1 + d2)>
#map5 = affine_map<(d0) -> (d0)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<5xf32>, index) -> tensor<5xi32>, sym_name = "vectorize_affine_apply"}> ({
  ^bb0(%arg1: tensor<5xf32>, %arg2: index):
    %3 = "tensor.empty"() : () -> tensor<5xi32>
    %4 = "linalg.generic"(%arg1, %3) <{indexing_maps = [#map5, #map5], iterator_types = [#linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg3: f32, %arg4: i32):
      %5 = "linalg.index"() <{dim = 0 : i64}> : () -> index
      %6 = "affine.apply"() <{map = #map}> : () -> index
      %7 = "affine.apply"(%5, %6) <{map = #map1}> : (index, index) -> index
      %8 = "affine.apply"(%7, %arg2) <{map = #map2}> : (index, index) -> index
      %9 = "affine.apply"(%8) <{map = #map3}> : (index) -> index
      %10 = "affine.apply"(%8, %9, %7) <{map = #map4}> : (index, index, index) -> index
      %11 = "arith.index_cast"(%10) : (index) -> i32
      "linalg.yield"(%11) : (i32) -> ()
    }) : (tensor<5xf32>, tensor<5xi32>) -> tensor<5xi32>
    "func.return"(%4) : (tensor<5xi32>) -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["linalg.generic"]}> : (!transform.any_op) -> !transform.any_op
      %1 = "transform.get_parent_op"(%0) <{isolated_from_above, nth_parent = 1 : i64}> : (!transform.any_op) -> !transform.any_op
      %2 = "transform.structured.vectorize_children_and_apply_patterns"(%1) <{vectorize_nd_extract}> : (!transform.any_op) -> !transform.any_op
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2, d3) -> (d0, d1, d2, d3)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<1x2x4x8xindex>) -> (), sym_name = "test_vectorize_trailing_index"}> ({
  ^bb0(%arg1: memref<1x2x4x8xindex>):
    "linalg.generic"(%arg1) <{indexing_maps = [#map], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 0, 1>}> ({
    ^bb0(%arg2: index):
      %3 = "linalg.index"() <{dim = 3 : i64}> : () -> index
      "linalg.yield"(%3) : (index) -> ()
    }) : (memref<1x2x4x8xindex>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["linalg.generic"]}> : (!transform.any_op) -> !transform.any_op
      %1 = "transform.get_parent_op"(%0) <{isolated_from_above, nth_parent = 1 : i64}> : (!transform.any_op) -> !transform.any_op
      %2 = "transform.structured.vectorize_children_and_apply_patterns"(%1) : (!transform.any_op) -> !transform.any_op
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2, d3) -> (d0, d1, d2, d3)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<1x2x4x8xindex>) -> (), sym_name = "test_vectorize_inner_index"}> ({
  ^bb0(%arg1: memref<1x2x4x8xindex>):
    "linalg.generic"(%arg1) <{indexing_maps = [#map], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 0, 1>}> ({
    ^bb0(%arg2: index):
      %3 = "linalg.index"() <{dim = 1 : i64}> : () -> index
      "linalg.yield"(%3) : (index) -> ()
    }) : (memref<1x2x4x8xindex>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["linalg.generic"]}> : (!transform.any_op) -> !transform.any_op
      %1 = "transform.get_parent_op"(%0) <{isolated_from_above, nth_parent = 1 : i64}> : (!transform.any_op) -> !transform.any_op
      %2 = "transform.structured.vectorize_children_and_apply_patterns"(%1) : (!transform.any_op) -> !transform.any_op
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1) -> (d0, d1)>
#map1 = affine_map<(d0, d1) -> (d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<4x256xf32>, memref<4x256xf32>, memref<256xf32>, f32) -> (), sym_name = "generic_vectorize"}> ({
  ^bb0(%arg1: memref<4x256xf32>, %arg2: memref<4x256xf32>, %arg3: memref<256xf32>, %arg4: f32):
    %3 = "arith.constant"() <{value = 1.000000e+00 : f32}> : () -> f32
    "linalg.generic"(%arg2, %arg3, %arg1, %arg1, %arg1, %arg1, %arg1, %arg1, %arg1, %arg1, %arg1, %arg1) <{indexing_maps = [#map, #map1, #map, #map, #map, #map, #map, #map, #map, #map, #map, #map], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 2, 10>}> ({
    ^bb0(%arg5: f32, %arg6: f32, %arg7: f32, %arg8: f32, %arg9: f32, %arg10: f32, %arg11: f32, %arg12: f32, %arg13: f32, %arg14: f32, %arg15: f32, %arg16: f32):
      %4 = "arith.addf"(%arg6, %arg8) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %5 = "arith.cmpf"(%arg5, %arg8) <{fastmath = #arith.fastmath<none>, predicate = 2 : i64}> : (f32, f32) -> i1
      %6 = "arith.constant"() <{value = 2.000000e+00 : f32}> : () -> f32
      %7 = "arith.divf"(%arg7, %arg4) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %8 = "math.exp2"(%arg7) <{fastmath = #arith.fastmath<none>}> : (f32) -> f32
      %9 = "arith.mulf"(%arg7, %6) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %10 = "math.rsqrt"(%arg7) <{fastmath = #arith.fastmath<none>}> : (f32) -> f32
      %11 = "arith.select"(%5, %arg7, %arg8) : (i1, f32, f32) -> f32
      %12 = "arith.subf"(%arg7, %arg6) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %13 = "math.tanh"(%arg7) <{fastmath = #arith.fastmath<none>}> : (f32) -> f32
      "linalg.yield"(%4, %6, %3, %7, %8, %9, %10, %11, %12, %13) : (f32, f32, f32, f32, f32, f32, f32, f32, f32, f32) -> ()
    }) : (memref<4x256xf32>, memref<256xf32>, memref<4x256xf32>, memref<4x256xf32>, memref<4x256xf32>, memref<4x256xf32>, memref<4x256xf32>, memref<4x256xf32>, memref<4x256xf32>, memref<4x256xf32>, memref<4x256xf32>, memref<4x256xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["linalg.generic"]}> : (!transform.any_op) -> !transform.any_op
      %1 = "transform.get_parent_op"(%0) <{isolated_from_above, nth_parent = 1 : i64}> : (!transform.any_op) -> !transform.any_op
      %2 = "transform.structured.vectorize_children_and_apply_patterns"(%1) <{disable_transfer_permutation_map_lowering_patterns}> : (!transform.any_op) -> !transform.any_op
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1) -> (d0, d1)>
#map1 = affine_map<(d0, d1) -> (d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<4x256xf32>, tensor<4x256xf32>, tensor<256xf32>, f32) -> (tensor<4x256xf32>, tensor<4x256xf32>, tensor<4x256xf32>, tensor<4x256xf32>, tensor<4x256xf32>, tensor<4x256xf32>, tensor<4x256xf32>, tensor<4x256xf32>, tensor<4x256xf32>, tensor<4x256xf32>), sym_name = "generic_vectorize_tensor"}> ({
  ^bb0(%arg1: tensor<4x256xf32>, %arg2: tensor<4x256xf32>, %arg3: tensor<256xf32>, %arg4: f32):
    %3 = "arith.constant"() <{value = 1.000000e+00 : f32}> : () -> f32
    %4:10 = "linalg.generic"(%arg2, %arg3, %arg1, %arg1, %arg1, %arg1, %arg1, %arg1, %arg1, %arg1, %arg1, %arg1) <{indexing_maps = [#map, #map1, #map, #map, #map, #map, #map, #map, #map, #map, #map, #map], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 2, 10>}> ({
    ^bb0(%arg5: f32, %arg6: f32, %arg7: f32, %arg8: f32, %arg9: f32, %arg10: f32, %arg11: f32, %arg12: f32, %arg13: f32, %arg14: f32, %arg15: f32, %arg16: f32):
      %5 = "arith.addf"(%arg6, %arg8) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %6 = "arith.cmpf"(%arg5, %arg8) <{fastmath = #arith.fastmath<none>, predicate = 2 : i64}> : (f32, f32) -> i1
      %7 = "arith.constant"() <{value = 2.000000e+00 : f32}> : () -> f32
      %8 = "arith.divf"(%arg7, %arg4) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %9 = "math.exp2"(%arg7) <{fastmath = #arith.fastmath<none>}> : (f32) -> f32
      %10 = "arith.mulf"(%arg7, %7) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %11 = "math.rsqrt"(%arg7) <{fastmath = #arith.fastmath<none>}> : (f32) -> f32
      %12 = "arith.select"(%6, %arg7, %arg8) : (i1, f32, f32) -> f32
      %13 = "arith.subf"(%arg7, %arg6) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %14 = "math.tanh"(%arg7) <{fastmath = #arith.fastmath<none>}> : (f32) -> f32
      "linalg.yield"(%5, %7, %3, %8, %9, %10, %11, %12, %13, %14) : (f32, f32, f32, f32, f32, f32, f32, f32, f32, f32) -> ()
    }) : (tensor<4x256xf32>, tensor<256xf32>, tensor<4x256xf32>, tensor<4x256xf32>, tensor<4x256xf32>, tensor<4x256xf32>, tensor<4x256xf32>, tensor<4x256xf32>, tensor<4x256xf32>, tensor<4x256xf32>, tensor<4x256xf32>, tensor<4x256xf32>) -> (tensor<4x256xf32>, tensor<4x256xf32>, tensor<4x256xf32>, tensor<4x256xf32>, tensor<4x256xf32>, tensor<4x256xf32>, tensor<4x256xf32>, tensor<4x256xf32>, tensor<4x256xf32>, tensor<4x256xf32>)
    "func.return"(%4#0, %4#1, %4#2, %4#3, %4#4, %4#5, %4#6, %4#7, %4#8, %4#9) : (tensor<4x256xf32>, tensor<4x256xf32>, tensor<4x256xf32>, tensor<4x256xf32>, tensor<4x256xf32>, tensor<4x256xf32>, tensor<4x256xf32>, tensor<4x256xf32>, tensor<4x256xf32>, tensor<4x256xf32>) -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["linalg.generic"]}> : (!transform.any_op) -> !transform.any_op
      %1 = "transform.get_parent_op"(%0) <{isolated_from_above, nth_parent = 1 : i64}> : (!transform.any_op) -> !transform.any_op
      %2 = "transform.structured.vectorize_children_and_apply_patterns"(%1) <{disable_transfer_permutation_map_lowering_patterns}> : (!transform.any_op) -> !transform.any_op
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2, d3) -> (d0, d3)>
#map1 = affine_map<(d0, d1, d2, d3) -> (d0)>
#map2 = affine_map<(d0, d1, d2, d3) -> (d2)>
#map3 = affine_map<(d0, d1, d2, d3) -> (d2, d0)>
#map4 = affine_map<(d0, d1, d2, d3) -> (d0, d1, d2, d3)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<4xf32>, memref<4x4xf32>, memref<4x4x4x4xf32>) -> (), sym_name = "generic_vectorize_broadcast_transpose"}> ({
  ^bb0(%arg1: memref<4xf32>, %arg2: memref<4x4xf32>, %arg3: memref<4x4x4x4xf32>):
    "linalg.generic"(%arg2, %arg1, %arg1, %arg2, %arg3) <{indexing_maps = [#map, #map1, #map2, #map3, #map4], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 4, 1>}> ({
    ^bb0(%arg4: f32, %arg5: f32, %arg6: f32, %arg7: f32, %arg8: f32):
      %3 = "arith.subf"(%arg4, %arg5) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %4 = "arith.addf"(%arg6, %3) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %5 = "arith.addf"(%arg7, %4) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%5) : (f32) -> ()
    }) : (memref<4x4xf32>, memref<4xf32>, memref<4xf32>, memref<4x4xf32>, memref<4x4x4x4xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["linalg.generic"]}> : (!transform.any_op) -> !transform.any_op
      %1 = "transform.get_parent_op"(%0) <{isolated_from_above, nth_parent = 1 : i64}> : (!transform.any_op) -> !transform.any_op
      %2 = "transform.structured.vectorize_children_and_apply_patterns"(%1) <{disable_transfer_permutation_map_lowering_patterns}> : (!transform.any_op) -> !transform.any_op
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2, d3) -> (d1, d0)>
#map1 = affine_map<(d0, d1, d2, d3) -> (d3, d1)>
#map2 = affine_map<(d0, d1, d2, d3) -> (d3, d1, d0, d2)>
#map3 = affine_map<(d0, d1, d2, d3) -> (d0, d1, d2, d3)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<14x7xf32>, memref<16x14xf32>, memref<16x14x7x8xf32>, memref<7x14x8x16xf32>) -> (), sym_name = "vectorization_transpose"}> ({
  ^bb0(%arg1: memref<14x7xf32>, %arg2: memref<16x14xf32>, %arg3: memref<16x14x7x8xf32>, %arg4: memref<7x14x8x16xf32>):
    "linalg.generic"(%arg1, %arg2, %arg3, %arg4) <{indexing_maps = [#map, #map1, #map2, #map3], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 3, 1>}> ({
    ^bb0(%arg5: f32, %arg6: f32, %arg7: f32, %arg8: f32):
      %3 = "arith.addf"(%arg5, %arg6) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %4 = "arith.addf"(%3, %arg7) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%4) : (f32) -> ()
    }) : (memref<14x7xf32>, memref<16x14xf32>, memref<16x14x7x8xf32>, memref<7x14x8x16xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["linalg.generic"]}> : (!transform.any_op) -> !transform.any_op
      %1 = "transform.get_parent_op"(%0) <{isolated_from_above, nth_parent = 1 : i64}> : (!transform.any_op) -> !transform.any_op
      %2 = "transform.structured.vectorize_children_and_apply_patterns"(%1) <{disable_transfer_permutation_map_lowering_patterns}> : (!transform.any_op) -> !transform.any_op
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2) -> (d0, d1, d2)>
#map1 = affine_map<(d0, d1, d2) -> (d0, d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<4x16x8xf32>, tensor<4x16xf32>) -> tensor<4x16xf32>, sym_name = "sum_exp"}> ({
  ^bb0(%arg1: tensor<4x16x8xf32>, %arg2: tensor<4x16xf32>):
    %3 = "linalg.generic"(%arg1, %arg2) <{indexing_maps = [#map, #map1], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<reduction>], operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg3: f32, %arg4: f32):
      %4 = "math.exp"(%arg3) <{fastmath = #arith.fastmath<none>}> : (f32) -> f32
      %5 = "arith.addf"(%4, %arg4) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%5) : (f32) -> ()
    }) : (tensor<4x16x8xf32>, tensor<4x16xf32>) -> tensor<4x16xf32>
    "func.return"(%3) : (tensor<4x16xf32>) -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["linalg.generic"]}> : (!transform.any_op) -> !transform.any_op
      %1 = "transform.get_parent_op"(%0) <{isolated_from_above, nth_parent = 1 : i64}> : (!transform.any_op) -> !transform.any_op
      %2 = "transform.structured.vectorize_children_and_apply_patterns"(%1) : (!transform.any_op) -> !transform.any_op
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2, d3) -> (d1, d0)>
#map1 = affine_map<(d0, d1, d2, d3) -> (d3, d2)>
#map2 = affine_map<(d0, d1, d2, d3) -> (d3, d0)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<3x2xf32>, tensor<5x4xf32>, tensor<5x2xf32>) -> tensor<5x2xf32>, sym_name = "sum_exp_2"}> ({
  ^bb0(%arg1: tensor<3x2xf32>, %arg2: tensor<5x4xf32>, %arg3: tensor<5x2xf32>):
    %3 = "linalg.generic"(%arg1, %arg2, %arg3) <{indexing_maps = [#map, #map1, #map2], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<reduction>, #linalg.iterator_type<reduction>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg4: f32, %arg5: f32, %arg6: f32):
      %4 = "math.exp"(%arg4) <{fastmath = #arith.fastmath<none>}> : (f32) -> f32
      %5 = "math.exp"(%arg5) <{fastmath = #arith.fastmath<none>}> : (f32) -> f32
      %6 = "arith.addf"(%4, %5) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %7 = "arith.addf"(%6, %arg6) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%7) : (f32) -> ()
    }) : (tensor<3x2xf32>, tensor<5x4xf32>, tensor<5x2xf32>) -> tensor<5x2xf32>
    "func.return"(%3) : (tensor<5x2xf32>) -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["linalg.generic"]}> : (!transform.any_op) -> !transform.any_op
      %1 = "transform.get_parent_op"(%0) <{isolated_from_above, nth_parent = 1 : i64}> : (!transform.any_op) -> !transform.any_op
      %2 = "transform.structured.vectorize_children_and_apply_patterns"(%1) <{disable_multi_reduction_to_contract_patterns, disable_transfer_permutation_map_lowering_patterns}> : (!transform.any_op) -> !transform.any_op
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1) -> (d0, d1)>
#map1 = affine_map<(d0, d1) -> (d0)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<4x4xf32>) -> tensor<4xf32>, sym_name = "red_maximumf_2d"}> ({
  ^bb0(%arg1: tensor<4x4xf32>):
    %3 = "arith.constant"() <{value = -3.402820e+38 : f32}> : () -> f32
    %4 = "tensor.empty"() : () -> tensor<4xf32>
    %5 = "linalg.fill"(%3, %4) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg4: f32, %arg5: f32):
      "linalg.yield"(%arg4) : (f32) -> ()
    }) : (f32, tensor<4xf32>) -> tensor<4xf32>
    %6 = "linalg.generic"(%arg1, %5) <{indexing_maps = [#map, #map1], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<reduction>], operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg2: f32, %arg3: f32):
      %7 = "arith.maximumf"(%arg2, %arg3) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%7) : (f32) -> ()
    }) : (tensor<4x4xf32>, tensor<4xf32>) -> tensor<4xf32>
    "func.return"(%6) : (tensor<4xf32>) -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["linalg.generic"]}> : (!transform.any_op) -> !transform.any_op
      %1 = "transform.get_parent_op"(%0) <{isolated_from_above, nth_parent = 1 : i64}> : (!transform.any_op) -> !transform.any_op
      %2 = "transform.structured.vectorize_children_and_apply_patterns"(%1) <{vectorize_padding}> : (!transform.any_op) -> !transform.any_op
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1) -> (d0, d1)>
#map1 = affine_map<(d0, d1) -> (d0)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<4x4xf32>) -> tensor<4xf32>, sym_name = "red_maxnumf_2d"}> ({
  ^bb0(%arg1: tensor<4x4xf32>):
    %3 = "arith.constant"() <{value = -3.402820e+38 : f32}> : () -> f32
    %4 = "tensor.empty"() : () -> tensor<4xf32>
    %5 = "linalg.fill"(%3, %4) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg4: f32, %arg5: f32):
      "linalg.yield"(%arg4) : (f32) -> ()
    }) : (f32, tensor<4xf32>) -> tensor<4xf32>
    %6 = "linalg.generic"(%arg1, %5) <{indexing_maps = [#map, #map1], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<reduction>], operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg2: f32, %arg3: f32):
      %7 = "arith.maxnumf"(%arg2, %arg3) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%7) : (f32) -> ()
    }) : (tensor<4x4xf32>, tensor<4xf32>) -> tensor<4xf32>
    "func.return"(%6) : (tensor<4xf32>) -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["linalg.generic"]}> : (!transform.any_op) -> !transform.any_op
      %1 = "transform.get_parent_op"(%0) <{isolated_from_above, nth_parent = 1 : i64}> : (!transform.any_op) -> !transform.any_op
      %2 = "transform.structured.vectorize_children_and_apply_patterns"(%1) <{vectorize_padding}> : (!transform.any_op) -> !transform.any_op
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1) -> (d0, d1)>
#map1 = affine_map<(d0, d1) -> (d0)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<4x4xf32>) -> tensor<4xf32>, sym_name = "red_minimumf_2d"}> ({
  ^bb0(%arg1: tensor<4x4xf32>):
    %3 = "arith.constant"() <{value = 3.402820e+38 : f32}> : () -> f32
    %4 = "tensor.empty"() : () -> tensor<4xf32>
    %5 = "linalg.fill"(%3, %4) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg4: f32, %arg5: f32):
      "linalg.yield"(%arg4) : (f32) -> ()
    }) : (f32, tensor<4xf32>) -> tensor<4xf32>
    %6 = "linalg.generic"(%arg1, %5) <{indexing_maps = [#map, #map1], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<reduction>], operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg2: f32, %arg3: f32):
      %7 = "arith.minimumf"(%arg3, %arg2) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%7) : (f32) -> ()
    }) : (tensor<4x4xf32>, tensor<4xf32>) -> tensor<4xf32>
    "func.return"(%6) : (tensor<4xf32>) -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["linalg.generic"]}> : (!transform.any_op) -> !transform.any_op
      %1 = "transform.get_parent_op"(%0) <{isolated_from_above, nth_parent = 1 : i64}> : (!transform.any_op) -> !transform.any_op
      %2 = "transform.structured.vectorize_children_and_apply_patterns"(%1) : (!transform.any_op) -> !transform.any_op
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1) -> (d0, d1)>
#map1 = affine_map<(d0, d1) -> (d0)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<4x4xf32>) -> tensor<4xf32>, sym_name = "red_minnumf_2d"}> ({
  ^bb0(%arg1: tensor<4x4xf32>):
    %3 = "arith.constant"() <{value = 3.402820e+38 : f32}> : () -> f32
    %4 = "tensor.empty"() : () -> tensor<4xf32>
    %5 = "linalg.fill"(%3, %4) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg4: f32, %arg5: f32):
      "linalg.yield"(%arg4) : (f32) -> ()
    }) : (f32, tensor<4xf32>) -> tensor<4xf32>
    %6 = "linalg.generic"(%arg1, %5) <{indexing_maps = [#map, #map1], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<reduction>], operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg2: f32, %arg3: f32):
      %7 = "arith.minnumf"(%arg3, %arg2) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%7) : (f32) -> ()
    }) : (tensor<4x4xf32>, tensor<4xf32>) -> tensor<4xf32>
    "func.return"(%6) : (tensor<4xf32>) -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["linalg.generic"]}> : (!transform.any_op) -> !transform.any_op
      %1 = "transform.get_parent_op"(%0) <{isolated_from_above, nth_parent = 1 : i64}> : (!transform.any_op) -> !transform.any_op
      %2 = "transform.structured.vectorize_children_and_apply_patterns"(%1) : (!transform.any_op) -> !transform.any_op
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1) -> (d0, d1)>
#map1 = affine_map<(d0, d1) -> (d0)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<4x4xf32>) -> tensor<4xf32>, sym_name = "red_mul_2d"}> ({
  ^bb0(%arg1: tensor<4x4xf32>):
    %3 = "arith.constant"() <{value = 1.000000e+00 : f32}> : () -> f32
    %4 = "tensor.empty"() : () -> tensor<4xf32>
    %5 = "linalg.fill"(%3, %4) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg4: f32, %arg5: f32):
      "linalg.yield"(%arg4) : (f32) -> ()
    }) : (f32, tensor<4xf32>) -> tensor<4xf32>
    %6 = "linalg.generic"(%arg1, %5) <{indexing_maps = [#map, #map1], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<reduction>], operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg2: f32, %arg3: f32):
      %7 = "arith.mulf"(%arg2, %arg3) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%7) : (f32) -> ()
    }) : (tensor<4x4xf32>, tensor<4xf32>) -> tensor<4xf32>
    "func.return"(%6) : (tensor<4xf32>) -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["linalg.generic"]}> : (!transform.any_op) -> !transform.any_op
      %1 = "transform.get_parent_op"(%0) <{isolated_from_above, nth_parent = 1 : i64}> : (!transform.any_op) -> !transform.any_op
      %2 = "transform.structured.vectorize_children_and_apply_patterns"(%1) : (!transform.any_op) -> !transform.any_op
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1) -> (d0, d1)>
#map1 = affine_map<(d0, d1) -> (d0)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<4x4xi1>) -> tensor<4xi1>, sym_name = "red_or_2d"}> ({
  ^bb0(%arg1: tensor<4x4xi1>):
    %3 = "arith.constant"() <{value = false}> : () -> i1
    %4 = "tensor.empty"() : () -> tensor<4xi1>
    %5 = "linalg.fill"(%3, %4) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg4: i1, %arg5: i1):
      "linalg.yield"(%arg4) : (i1) -> ()
    }) : (i1, tensor<4xi1>) -> tensor<4xi1>
    %6 = "linalg.generic"(%arg1, %5) <{indexing_maps = [#map, #map1], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<reduction>], operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg2: i1, %arg3: i1):
      %7 = "arith.ori"(%arg2, %arg3) : (i1, i1) -> i1
      "linalg.yield"(%7) : (i1) -> ()
    }) : (tensor<4x4xi1>, tensor<4xi1>) -> tensor<4xi1>
    "func.return"(%6) : (tensor<4xi1>) -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["linalg.generic"]}> : (!transform.any_op) -> !transform.any_op
      %1 = "transform.get_parent_op"(%0) <{isolated_from_above, nth_parent = 1 : i64}> : (!transform.any_op) -> !transform.any_op
      %2 = "transform.structured.vectorize_children_and_apply_patterns"(%1) : (!transform.any_op) -> !transform.any_op
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1) -> (d0, d1)>
#map1 = affine_map<(d0, d1) -> (d0)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<4x4xi1>) -> tensor<4xi1>, sym_name = "red_and_2d"}> ({
  ^bb0(%arg1: tensor<4x4xi1>):
    %3 = "arith.constant"() <{value = true}> : () -> i1
    %4 = "tensor.empty"() : () -> tensor<4xi1>
    %5 = "linalg.fill"(%3, %4) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg4: i1, %arg5: i1):
      "linalg.yield"(%arg4) : (i1) -> ()
    }) : (i1, tensor<4xi1>) -> tensor<4xi1>
    %6 = "linalg.generic"(%arg1, %5) <{indexing_maps = [#map, #map1], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<reduction>], operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg2: i1, %arg3: i1):
      %7 = "arith.andi"(%arg2, %arg3) : (i1, i1) -> i1
      "linalg.yield"(%7) : (i1) -> ()
    }) : (tensor<4x4xi1>, tensor<4xi1>) -> tensor<4xi1>
    "func.return"(%6) : (tensor<4xi1>) -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["linalg.generic"]}> : (!transform.any_op) -> !transform.any_op
      %1 = "transform.get_parent_op"(%0) <{isolated_from_above, nth_parent = 1 : i64}> : (!transform.any_op) -> !transform.any_op
      %2 = "transform.structured.vectorize_children_and_apply_patterns"(%1) : (!transform.any_op) -> !transform.any_op
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1) -> (d0, d1)>
#map1 = affine_map<(d0, d1) -> (d0)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<4x4xi1>) -> tensor<4xi1>, sym_name = "red_xor_2d"}> ({
  ^bb0(%arg1: tensor<4x4xi1>):
    %3 = "arith.constant"() <{value = false}> : () -> i1
    %4 = "tensor.empty"() : () -> tensor<4xi1>
    %5 = "linalg.fill"(%3, %4) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg4: i1, %arg5: i1):
      "linalg.yield"(%arg4) : (i1) -> ()
    }) : (i1, tensor<4xi1>) -> tensor<4xi1>
    %6 = "linalg.generic"(%arg1, %5) <{indexing_maps = [#map, #map1], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<reduction>], operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg2: i1, %arg3: i1):
      %7 = "arith.xori"(%arg2, %arg3) : (i1, i1) -> i1
      "linalg.yield"(%7) : (i1) -> ()
    }) : (tensor<4x4xi1>, tensor<4xi1>) -> tensor<4xi1>
    "func.return"(%6) : (tensor<4xi1>) -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["linalg.generic"]}> : (!transform.any_op) -> !transform.any_op
      %1 = "transform.get_parent_op"(%0) <{isolated_from_above, nth_parent = 1 : i64}> : (!transform.any_op) -> !transform.any_op
      %2 = "transform.structured.vectorize_children_and_apply_patterns"(%1) : (!transform.any_op) -> !transform.any_op
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1) -> (d0, d1)>
#map1 = affine_map<(d0, d1) -> (d0, 0)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<4x4xf32>, tensor<4x1xf32>) -> tensor<4x4xf32>, sym_name = "explicit_broadcast"}> ({
  ^bb0(%arg1: tensor<4x4xf32>, %arg2: tensor<4x1xf32>):
    %3 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %4 = "tensor.empty"() : () -> tensor<4x4xf32>
    %5 = "linalg.fill"(%3, %4) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg6: f32, %arg7: f32):
      "linalg.yield"(%arg6) : (f32) -> ()
    }) : (f32, tensor<4x4xf32>) -> tensor<4x4xf32>
    %6 = "linalg.generic"(%arg1, %arg2, %5) <{indexing_maps = [#map, #map1, #map], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg3: f32, %arg4: f32, %arg5: f32):
      %7 = "arith.subf"(%arg3, %arg4) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%7) : (f32) -> ()
    }) : (tensor<4x4xf32>, tensor<4x1xf32>, tensor<4x4xf32>) -> tensor<4x4xf32>
    "func.return"(%6) : (tensor<4x4xf32>) -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["linalg.generic"]}> : (!transform.any_op) -> !transform.any_op
      %1 = "transform.get_parent_op"(%0) <{isolated_from_above, nth_parent = 1 : i64}> : (!transform.any_op) -> !transform.any_op
      %2 = "transform.structured.vectorize_children_and_apply_patterns"(%1) : (!transform.any_op) -> !transform.any_op
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1) -> (d0, d1)>
#map1 = affine_map<(d0, d1) -> (d0, 0)>
#map2 = affine_map<(d0, d1) -> (d0)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<4x4xf32>, tensor<4x1xf32>) -> tensor<4xf32>, sym_name = "fused_broadcast_red_2d"}> ({
  ^bb0(%arg1: tensor<4x4xf32>, %arg2: tensor<4x1xf32>):
    %6 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %7 = "tensor.empty"() : () -> tensor<4xf32>
    %8 = "linalg.fill"(%6, %7) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg6: f32, %arg7: f32):
      "linalg.yield"(%arg6) : (f32) -> ()
    }) : (f32, tensor<4xf32>) -> tensor<4xf32>
    %9 = "linalg.generic"(%arg1, %arg2, %8) <{indexing_maps = [#map, #map1, #map2], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<reduction>], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg3: f32, %arg4: f32, %arg5: f32):
      %10 = "arith.subf"(%arg3, %arg4) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %11 = "math.exp"(%10) <{fastmath = #arith.fastmath<none>}> : (f32) -> f32
      %12 = "arith.addf"(%11, %arg5) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%12) : (f32) -> ()
    }) : (tensor<4x4xf32>, tensor<4x1xf32>, tensor<4xf32>) -> tensor<4xf32>
    "func.return"(%9) : (tensor<4xf32>) -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["linalg.fill"]}> : (!transform.any_op) -> !transform.any_op
      %1 = "transform.get_parent_op"(%0) <{isolated_from_above, nth_parent = 1 : i64}> : (!transform.any_op) -> !transform.any_op
      %2 = "transform.structured.vectorize_children_and_apply_patterns"(%1) : (!transform.any_op) -> !transform.any_op
      %3 = "transform.structured.match"(%arg0) <{ops = ["linalg.generic"]}> : (!transform.any_op) -> !transform.any_op
      %4 = "transform.get_parent_op"(%3) <{isolated_from_above, nth_parent = 1 : i64}> : (!transform.any_op) -> !transform.any_op
      %5 = "transform.structured.vectorize_children_and_apply_patterns"(%4) : (!transform.any_op) -> !transform.any_op
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0) -> (d0)>
#map1 = affine_map<(d0) -> ()>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<32xf32>) -> tensor<f32>, sym_name = "reduce_to_rank_0"}> ({
  ^bb0(%arg1: tensor<32xf32>):
    %3 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %4 = "tensor.empty"() : () -> tensor<f32>
    %5 = "linalg.fill"(%3, %4) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg4: f32, %arg5: f32):
      "linalg.yield"(%arg4) : (f32) -> ()
    }) : (f32, tensor<f32>) -> tensor<f32>
    %6 = "linalg.generic"(%arg1, %5) <{indexing_maps = [#map, #map1], iterator_types = [#linalg.iterator_type<reduction>], operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg2: f32, %arg3: f32):
      %7 = "arith.addf"(%arg2, %arg3) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%7) : (f32) -> ()
    }) : (tensor<32xf32>, tensor<f32>) -> tensor<f32>
    "func.return"(%6) : (tensor<f32>) -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["linalg.generic"]}> : (!transform.any_op) -> !transform.any_op
      %1 = "transform.get_parent_op"(%0) <{isolated_from_above, nth_parent = 1 : i64}> : (!transform.any_op) -> !transform.any_op
      %2 = "transform.structured.vectorize_children_and_apply_patterns"(%1) : (!transform.any_op) -> !transform.any_op
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0) -> (d0)>
#map1 = affine_map<(d0) -> (0)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<32xf32>) -> tensor<1xf32>, sym_name = "reduce_to_rank_1"}> ({
  ^bb0(%arg1: tensor<32xf32>):
    %3 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %4 = "tensor.empty"() : () -> tensor<1xf32>
    %5 = "linalg.fill"(%3, %4) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg4: f32, %arg5: f32):
      "linalg.yield"(%arg4) : (f32) -> ()
    }) : (f32, tensor<1xf32>) -> tensor<1xf32>
    %6 = "linalg.generic"(%arg1, %5) <{indexing_maps = [#map, #map1], iterator_types = [#linalg.iterator_type<reduction>], operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg2: f32, %arg3: f32):
      %7 = "arith.addf"(%arg2, %arg3) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%7) : (f32) -> ()
    }) : (tensor<32xf32>, tensor<1xf32>) -> tensor<1xf32>
    "func.return"(%6) : (tensor<1xf32>) -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["linalg.generic"]}> : (!transform.any_op) -> !transform.any_op
      %1 = "transform.get_parent_op"(%0) <{isolated_from_above, nth_parent = 1 : i64}> : (!transform.any_op) -> !transform.any_op
      %2 = "transform.structured.vectorize_children_and_apply_patterns"(%1) : (!transform.any_op) -> !transform.any_op
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2, d3) -> (d0 + d2, d1 + d3)>
#map1 = affine_map<(d0, d1, d2, d3) -> (d0, d1, d2, d3)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<8x8xf32>) -> tensor<6x6x3x3xf32>, sym_name = "not_projected_permutation"}> ({
  ^bb0(%arg1: tensor<8x8xf32>):
    %3 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %4 = "tensor.empty"() : () -> tensor<6x6x3x3xf32>
    %5 = "linalg.fill"(%3, %4) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg4: f32, %arg5: f32):
      "linalg.yield"(%arg4) : (f32) -> ()
    }) : (f32, tensor<6x6x3x3xf32>) -> tensor<6x6x3x3xf32>
    %6 = "linalg.generic"(%arg1, %5) <{indexing_maps = [#map, #map1], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg2: f32, %arg3: f32):
      "linalg.yield"(%arg2) : (f32) -> ()
    }) : (tensor<8x8xf32>, tensor<6x6x3x3xf32>) -> tensor<6x6x3x3xf32>
    "func.return"(%6) : (tensor<6x6x3x3xf32>) -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["linalg.generic"]}> : (!transform.any_op) -> !transform.any_op
      %1 = "transform.get_parent_op"(%0) <{isolated_from_above, nth_parent = 1 : i64}> : (!transform.any_op) -> !transform.any_op
      %2 = "transform.structured.vectorize_children_and_apply_patterns"(%1) : (!transform.any_op) -> !transform.any_op
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2) -> (d0, d1, d2)>
#map1 = affine_map<(d0, d1, d2) -> (d0, d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<2x4x8xf32>, tensor<2x4xf32>, tensor<2x4x8xf32>, tensor<2x4xf32>) -> (tensor<2x4x8xf32>, tensor<2x4xf32>), sym_name = "mixed_parallel_reduced_results"}> ({
  ^bb0(%arg1: tensor<2x4x8xf32>, %arg2: tensor<2x4xf32>, %arg3: tensor<2x4x8xf32>, %arg4: tensor<2x4xf32>):
    %3:2 = "linalg.generic"(%arg1, %arg2, %arg3, %arg4) <{indexing_maps = [#map, #map1, #map, #map1], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<reduction>], operandSegmentSizes = array<i32: 2, 2>}> ({
    ^bb0(%arg5: f32, %arg6: f32, %arg7: f32, %arg8: f32):
      %4 = "arith.mulf"(%arg5, %arg6) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %5 = "arith.addf"(%4, %arg8) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%4, %5) : (f32, f32) -> ()
    }) : (tensor<2x4x8xf32>, tensor<2x4xf32>, tensor<2x4x8xf32>, tensor<2x4xf32>) -> (tensor<2x4x8xf32>, tensor<2x4xf32>)
    "func.return"(%3#0, %3#1) : (tensor<2x4x8xf32>, tensor<2x4xf32>) -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["linalg.generic"]}> : (!transform.any_op) -> !transform.any_op
      %1 = "transform.get_parent_op"(%0) <{isolated_from_above, nth_parent = 1 : i64}> : (!transform.any_op) -> !transform.any_op
      %2 = "transform.structured.vectorize_children_and_apply_patterns"(%1) <{disable_multi_reduction_to_contract_patterns, disable_transfer_permutation_map_lowering_patterns}> : (!transform.any_op) -> !transform.any_op
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0) -> (d0)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<1x?xf32>, index, index, index) -> tensor<1x128xf32>, sym_name = "not_vectorizable"}> ({
  ^bb0(%arg1: tensor<1x?xf32>, %arg2: index, %arg3: index, %arg4: index):
    %2 = "arith.constant"() <{value = 0 : index}> : () -> index
    %3 = "tensor.empty"() : () -> tensor<1x128xf32>
    %4 = "scf.for"(%arg3, %arg2, %arg4, %3) ({
    ^bb0(%arg5: index, %arg6: tensor<1x128xf32>):
      %5 = "tensor.extract_slice"(%arg6, %arg2) <{operandSegmentSizes = array<i32: 1, 0, 1, 0>, static_offsets = array<i64: 0, 0>, static_sizes = array<i64: 1, -9223372036854775808>, static_strides = array<i64: 1, 1>}> : (tensor<1x128xf32>, index) -> tensor<?xf32>
      %6 = "tensor.dim"(%5, %2) : (tensor<?xf32>, index) -> index
      %7 = "tensor.expand_shape"(%5, %6) <{reassociation = [[0, 1]], static_output_shape = array<i64: 1, -9223372036854775808>}> : (tensor<?xf32>, index) -> tensor<1x?xf32>
      %8 = "tensor.extract_slice"(%arg1, %arg4, %arg3) <{operandSegmentSizes = array<i32: 1, 1, 1, 0>, static_offsets = array<i64: 0, -9223372036854775808>, static_sizes = array<i64: 1, -9223372036854775808>, static_strides = array<i64: 1, 1>}> : (tensor<1x?xf32>, index, index) -> tensor<?xf32>
      %9 = "tensor.extract_slice"(%7, %arg4, %arg3) <{operandSegmentSizes = array<i32: 1, 1, 1, 0>, static_offsets = array<i64: 0, -9223372036854775808>, static_sizes = array<i64: 1, -9223372036854775808>, static_strides = array<i64: 1, 1>}> : (tensor<1x?xf32>, index, index) -> tensor<?xf32>
      %10 = "linalg.generic"(%8, %9) <{indexing_maps = [#map, #map], iterator_types = [#linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 1, 1>}> ({
      ^bb0(%arg7: f32, %arg8: f32):
        %14 = "arith.addf"(%arg7, %arg8) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
        "linalg.yield"(%14) : (f32) -> ()
      }) : (tensor<?xf32>, tensor<?xf32>) -> tensor<?xf32>
      %11 = "tensor.insert_slice"(%10, %7, %arg4, %arg3) <{operandSegmentSizes = array<i32: 1, 1, 1, 1, 0>, static_offsets = array<i64: 0, -9223372036854775808>, static_sizes = array<i64: 1, -9223372036854775808>, static_strides = array<i64: 1, 1>}> : (tensor<?xf32>, tensor<1x?xf32>, index, index) -> tensor<1x?xf32>
      %12 = "tensor.collapse_shape"(%11) <{reassociation = [[0, 1]]}> : (tensor<1x?xf32>) -> tensor<?xf32>
      %13 = "tensor.insert_slice"(%12, %arg6, %arg2) <{operandSegmentSizes = array<i32: 1, 1, 0, 1, 0>, static_offsets = array<i64: 0, 0>, static_sizes = array<i64: 1, -9223372036854775808>, static_strides = array<i64: 1, 1>}> : (tensor<?xf32>, tensor<1x128xf32>, index) -> tensor<1x128xf32>
      "scf.yield"(%13) : (tensor<1x128xf32>) -> ()
    }) : (index, index, index, tensor<1x128xf32>) -> tensor<1x128xf32>
    "func.return"(%4) : (tensor<1x128xf32>) -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["func.func"]}> : (!transform.any_op) -> !transform.any_op
      %1 = "transform.structured.vectorize_children_and_apply_patterns"(%0) : (!transform.any_op) -> !transform.any_op
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1) -> (d0, d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<120x64xf32>) -> tensor<120x64xf32>, sym_name = "wrong_reduction_detection"}> ({
  ^bb0(%arg1: tensor<120x64xf32>):
    %3 = "arith.constant"() <{value = 0 : index}> : () -> index
    %4 = "arith.constant"() <{value = 4 : index}> : () -> index
    %5 = "arith.constant"() <{value = 64 : index}> : () -> index
    %6 = "arith.constant"() <{value = 4.000000e+00 : f32}> : () -> f32
    %7 = "scf.for"(%3, %5, %4, %arg1) ({
    ^bb0(%arg2: index, %arg3: tensor<120x64xf32>):
      %8 = "tensor.extract_slice"(%arg3, %3, %arg2) <{operandSegmentSizes = array<i32: 1, 2, 0, 0>, static_offsets = array<i64: -9223372036854775808, -9223372036854775808>, static_sizes = array<i64: 1, 4>, static_strides = array<i64: 1, 1>}> : (tensor<120x64xf32>, index, index) -> tensor<1x4xf32>
      %9 = "linalg.fill"(%6, %8) <{operandSegmentSizes = array<i32: 1, 1>}> ({
      ^bb0(%arg5: f32, %arg6: f32):
        "linalg.yield"(%arg5) : (f32) -> ()
      }) {__internal_linalg_transform__ = "1"} : (f32, tensor<1x4xf32>) -> tensor<1x4xf32>
      %10 = "linalg.generic"(%9) <{indexing_maps = [#map], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 0, 1>}> ({
      ^bb0(%arg4: f32):
        %12 = "linalg.index"() <{dim = 0 : i64}> : () -> index
        %13 = "arith.addi"(%arg2, %12) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
        %14 = "arith.index_cast"(%13) : (index) -> i32
        %15 = "arith.uitofp"(%14) : (i32) -> f32
        %16 = "arith.mulf"(%arg4, %15) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
        "linalg.yield"(%16) : (f32) -> ()
      }) : (tensor<1x4xf32>) -> tensor<1x4xf32>
      %11 = "tensor.insert_slice"(%10, %arg3, %3, %arg2) <{operandSegmentSizes = array<i32: 1, 1, 2, 0, 0>, static_offsets = array<i64: -9223372036854775808, -9223372036854775808>, static_sizes = array<i64: 1, 4>, static_strides = array<i64: 1, 1>}> : (tensor<1x4xf32>, tensor<120x64xf32>, index, index) -> tensor<120x64xf32>
      "scf.yield"(%11) : (tensor<120x64xf32>) -> ()
    }) : (index, index, index, tensor<120x64xf32>) -> tensor<120x64xf32>
    "func.return"(%7) : (tensor<120x64xf32>) -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["linalg.generic"]}> : (!transform.any_op) -> !transform.any_op
      %1 = "transform.get_parent_op"(%0) <{isolated_from_above, nth_parent = 1 : i64}> : (!transform.any_op) -> !transform.any_op
      %2 = "transform.structured.vectorize_children_and_apply_patterns"(%1) : (!transform.any_op) -> !transform.any_op
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0) -> (d0)>
#map1 = affine_map<(d0) -> ()>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<0xf32>, tensor<f32>) -> tensor<f32>, sym_name = "tensor_size0"}> ({
  ^bb0(%arg1: tensor<0xf32>, %arg2: tensor<f32>):
    %3 = "linalg.generic"(%arg1, %arg2) <{indexing_maps = [#map, #map1], iterator_types = [#linalg.iterator_type<reduction>], operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg3: f32, %arg4: f32):
      %4 = "arith.addf"(%arg4, %arg3) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%4) : (f32) -> ()
    }) : (tensor<0xf32>, tensor<f32>) -> tensor<f32>
    "func.return"(%3) : (tensor<f32>) -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["linalg.generic"]}> : (!transform.any_op) -> !transform.any_op
      %1 = "transform.get_parent_op"(%0) <{isolated_from_above, nth_parent = 1 : i64}> : (!transform.any_op) -> !transform.any_op
      %2 = "transform.structured.vectorize_children_and_apply_patterns"(%1) : (!transform.any_op) -> !transform.any_op
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
#map = affine_map<() -> ()>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<f32>, tensor<f32>) -> tensor<f32>, sym_name = "zero_dim_tensor"}> ({
  ^bb0(%arg1: tensor<f32>, %arg2: tensor<f32>):
    %3 = "linalg.generic"(%arg1, %arg2) <{indexing_maps = [#map, #map], iterator_types = [], operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg3: f32, %arg4: f32):
      %4 = "arith.addf"(%arg3, %arg4) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%4) : (f32) -> ()
    }) : (tensor<f32>, tensor<f32>) -> tensor<f32>
    "func.return"(%3) : (tensor<f32>) -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["linalg.generic"]}> : (!transform.any_op) -> !transform.any_op
      %1 = "transform.get_parent_op"(%0) <{isolated_from_above, nth_parent = 1 : i64}> : (!transform.any_op) -> !transform.any_op
      %2 = "transform.structured.vectorize_children_and_apply_patterns"(%1) : (!transform.any_op) -> !transform.any_op
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1) -> (d1, d0)>
#map1 = affine_map<(d0, d1) -> (d0, d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<4x1xf32>, tensor<4x1xf32>, tensor<1x4xf32>) -> (tensor<4x1xf32>, tensor<1x4xf32>), sym_name = "multi_output_generic_different_perm_maps"}> ({
  ^bb0(%arg1: tensor<4x1xf32>, %arg2: tensor<4x1xf32>, %arg3: tensor<1x4xf32>):
    %3:2 = "linalg.generic"(%arg1, %arg2, %arg3) <{indexing_maps = [#map, #map, #map1], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 1, 2>}> ({
    ^bb0(%arg4: f32, %arg5: f32, %arg6: f32):
      %4 = "arith.addf"(%arg4, %arg4) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%4, %4) : (f32, f32) -> ()
    }) : (tensor<4x1xf32>, tensor<4x1xf32>, tensor<1x4xf32>) -> (tensor<4x1xf32>, tensor<1x4xf32>)
    "func.return"(%3#0, %3#1) : (tensor<4x1xf32>, tensor<1x4xf32>) -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["linalg.generic"]}> : (!transform.any_op) -> !transform.any_op
      %1 = "transform.get_parent_op"(%0) <{isolated_from_above, nth_parent = 1 : i64}> : (!transform.any_op) -> !transform.any_op
      %2 = "transform.structured.vectorize_children_and_apply_patterns"(%1) : (!transform.any_op) -> !transform.any_op
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2, d3) -> (d0, d1, d2, d3)>
#map1 = affine_map<(d0, d1, d2, d3) -> (d0, d1, d2, 0)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<1x12x197x197xf32>) -> tensor<1x12x197x1xf32>, sym_name = "generic_with_reduction_and_broadcast"}> ({
  ^bb0(%arg1: tensor<1x12x197x197xf32>):
    %3 = "tensor.empty"() : () -> tensor<1x12x197x1xf32>
    %4 = "linalg.generic"(%arg1, %3) <{indexing_maps = [#map, #map1], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<reduction>], operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg2: f32, %arg3: f32):
      %5 = "arith.addf"(%arg2, %arg3) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%5) : (f32) -> ()
    }) : (tensor<1x12x197x197xf32>, tensor<1x12x197x1xf32>) -> tensor<1x12x197x1xf32>
    "func.return"(%4) : (tensor<1x12x197x1xf32>) -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["linalg.generic"]}> : (!transform.any_op) -> !transform.any_op
      %1 = "transform.get_parent_op"(%0) <{isolated_from_above, nth_parent = 1 : i64}> : (!transform.any_op) -> !transform.any_op
      %2 = "transform.structured.vectorize_children_and_apply_patterns"(%1) : (!transform.any_op) -> !transform.any_op
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2) -> (d0, d2)>
#map1 = affine_map<(d0, d1, d2) -> (d2, d1)>
#map2 = affine_map<(d0, d1, d2) -> (d0, d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<8x16xbf16>, memref<16x32xbf16>, memref<8x32xf32>) -> (), sym_name = "float_mixed_precision_matmul_as_generic"}> ({
  ^bb0(%arg1: memref<8x16xbf16>, %arg2: memref<16x32xbf16>, %arg3: memref<8x32xf32>):
    "linalg.generic"(%arg1, %arg2, %arg3) <{indexing_maps = [#map, #map1, #map2], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<reduction>], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg4: bf16, %arg5: bf16, %arg6: f32):
      %3 = "arith.extf"(%arg4) : (bf16) -> f32
      %4 = "arith.extf"(%arg5) : (bf16) -> f32
      %5 = "arith.mulf"(%3, %4) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %6 = "arith.addf"(%arg6, %5) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%6) : (f32) -> ()
    }) : (memref<8x16xbf16>, memref<16x32xbf16>, memref<8x32xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["linalg.generic"]}> : (!transform.any_op) -> !transform.any_op
      %1 = "transform.get_parent_op"(%0) <{isolated_from_above, nth_parent = 1 : i64}> : (!transform.any_op) -> !transform.any_op
      %2 = "transform.structured.vectorize_children_and_apply_patterns"(%1) <{fold_type_extensions_into_contract}> : (!transform.any_op) -> !transform.any_op
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2) -> (d0, d2)>
#map1 = affine_map<(d0, d1, d2) -> (d2, d1)>
#map2 = affine_map<(d0, d1, d2) -> (d0, d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<8x16xi8>, memref<16x32xi8>, memref<8x32xi32>) -> (), sym_name = "integer_mixed_precision_matmul_as_generic"}> ({
  ^bb0(%arg1: memref<8x16xi8>, %arg2: memref<16x32xi8>, %arg3: memref<8x32xi32>):
    "linalg.generic"(%arg1, %arg2, %arg3) <{indexing_maps = [#map, #map1, #map2], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<reduction>], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg4: i8, %arg5: i8, %arg6: i32):
      %3 = "arith.extsi"(%arg4) : (i8) -> i32
      %4 = "arith.extsi"(%arg5) : (i8) -> i32
      %5 = "arith.muli"(%3, %4) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
      %6 = "arith.addi"(%arg6, %5) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
      "linalg.yield"(%6) : (i32) -> ()
    }) : (memref<8x16xi8>, memref<16x32xi8>, memref<8x32xi32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["linalg.generic"]}> : (!transform.any_op) -> !transform.any_op
      %1 = "transform.get_parent_op"(%0) <{isolated_from_above, nth_parent = 1 : i64}> : (!transform.any_op) -> !transform.any_op
      %2 = "transform.structured.vectorize_children_and_apply_patterns"(%1) <{fold_type_extensions_into_contract}> : (!transform.any_op) -> !transform.any_op
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<8x16xf32>, memref<8x16xf32>) -> (), sym_name = "test_vectorize_copy"}> ({
  ^bb0(%arg1: memref<8x16xf32>, %arg2: memref<8x16xf32>):
    "memref.copy"(%arg1, %arg2) : (memref<8x16xf32>, memref<8x16xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["memref.copy"]}> : (!transform.any_op) -> !transform.any_op
      %1 = "transform.get_parent_op"(%0) <{isolated_from_above, nth_parent = 1 : i64}> : (!transform.any_op) -> !transform.any_op
      %2 = "transform.structured.vectorize_children_and_apply_patterns"(%1) : (!transform.any_op) -> !transform.any_op
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<f32>, memref<f32>) -> (), sym_name = "test_vectorize_copy_0d"}> ({
  ^bb0(%arg1: memref<f32>, %arg2: memref<f32>):
    "memref.copy"(%arg1, %arg2) : (memref<f32>, memref<f32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["memref.copy"]}> : (!transform.any_op) -> !transform.any_op
      %1 = "transform.get_parent_op"(%0) <{isolated_from_above, nth_parent = 1 : i64}> : (!transform.any_op) -> !transform.any_op
      %2 = "transform.structured.vectorize_children_and_apply_patterns"(%1) : (!transform.any_op) -> !transform.any_op
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<8x16xcomplex<f32>>, memref<8x16xcomplex<f32>>) -> (), sym_name = "test_vectorize_copy_complex"}> ({
  ^bb0(%arg1: memref<8x16xcomplex<f32>>, %arg2: memref<8x16xcomplex<f32>>):
    "memref.copy"(%arg1, %arg2) : (memref<8x16xcomplex<f32>>, memref<8x16xcomplex<f32>>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["memref.copy"]}> : (!transform.any_op) -> !transform.any_op
      %1 = "transform.get_parent_op"(%0) <{isolated_from_above, nth_parent = 1 : i64}> : (!transform.any_op) -> !transform.any_op
      %2 = "transform.structured.vectorize_children_and_apply_patterns"(%1) : (!transform.any_op) -> !transform.any_op
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

