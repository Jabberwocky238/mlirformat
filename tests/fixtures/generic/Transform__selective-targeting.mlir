#map = affine_map<(d0, d1, d2) -> (d0, d2)>
#map1 = affine_map<(d0, d1, d2) -> (d2, d1)>
#map2 = affine_map<(d0, d1, d2) -> (d0, d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<128x128xf32>, tensor<128x128xf32>, tensor<128x128xf32>) -> tensor<128x128xf32>, sym_name = "matmul_tensors_1"}> ({
  ^bb0(%arg15: tensor<128x128xf32>, %arg16: tensor<128x128xf32>, %arg17: tensor<128x128xf32>):
    %19 = "linalg.matmul"(%arg15, %arg16, %arg17) <{indexing_maps = [#map, #map1, #map2], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg18: f32, %arg19: f32, %arg20: f32):
      %20 = "arith.mulf"(%arg18, %arg19) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %21 = "arith.addf"(%arg20, %20) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%21) : (f32) -> ()
    }) {test.attrA} : (tensor<128x128xf32>, tensor<128x128xf32>, tensor<128x128xf32>) -> tensor<128x128xf32>
    "func.return"(%19) : (tensor<128x128xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<128x128xf32>, tensor<128x128xf32>, tensor<128x128xf32>) -> tensor<128x128xf32>, sym_name = "matmul_tensors_2"}> ({
  ^bb0(%arg9: tensor<128x128xf32>, %arg10: tensor<128x128xf32>, %arg11: tensor<128x128xf32>):
    %16 = "linalg.matmul"(%arg9, %arg10, %arg11) <{indexing_maps = [#map, #map1, #map2], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg12: f32, %arg13: f32, %arg14: f32):
      %17 = "arith.mulf"(%arg12, %arg13) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %18 = "arith.addf"(%arg14, %17) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%18) : (f32) -> ()
    }) {test.attrA, test.attrC} : (tensor<128x128xf32>, tensor<128x128xf32>, tensor<128x128xf32>) -> tensor<128x128xf32>
    "func.return"(%16) : (tensor<128x128xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<128x128xf32>, tensor<128x128xf32>, tensor<128x128xf32>) -> tensor<128x128xf32>, sym_name = "matmul_tensors_3"}> ({
  ^bb0(%arg3: tensor<128x128xf32>, %arg4: tensor<128x128xf32>, %arg5: tensor<128x128xf32>):
    %13 = "linalg.matmul"(%arg3, %arg4, %arg5) <{indexing_maps = [#map, #map1, #map2], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg6: f32, %arg7: f32, %arg8: f32):
      %14 = "arith.mulf"(%arg6, %arg7) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %15 = "arith.addf"(%arg8, %14) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%15) : (f32) -> ()
    }) {test.attrC} : (tensor<128x128xf32>, tensor<128x128xf32>, tensor<128x128xf32>) -> tensor<128x128xf32>
    "func.return"(%13) : (tensor<128x128xf32>) -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      "transform.with_pdl_patterns"(%arg0) ({
      ^bb0(%arg1: !transform.any_op):
        "pdl.pattern"() <{benefit = 1 : i16, sym_name = "pdl_target_attrA"}> ({
          %9 = "pdl.operands"() : () -> !pdl.range<value>
          %10 = "pdl.types"() : () -> !pdl.range<type>
          %11 = "pdl.attribute"() : () -> !pdl.attribute
          %12 = "pdl.operation"(%9, %11, %10) <{attributeValueNames = ["test.attrA"], opName = "linalg.matmul", operandSegmentSizes = array<i32: 1, 1, 1>}> : (!pdl.range<value>, !pdl.attribute, !pdl.range<type>) -> !pdl.operation
          "pdl.rewrite"(%12) <{name = "transform.dialect", operandSegmentSizes = array<i32: 1, 0>}> ({
          }) : (!pdl.operation) -> ()
        }) : () -> ()
        "pdl.pattern"() <{benefit = 1 : i16, sym_name = "pdl_target_attrC"}> ({
          %5 = "pdl.operands"() : () -> !pdl.range<value>
          %6 = "pdl.types"() : () -> !pdl.range<type>
          %7 = "pdl.attribute"() : () -> !pdl.attribute
          %8 = "pdl.operation"(%5, %7, %6) <{attributeValueNames = ["test.attrC"], opName = "linalg.matmul", operandSegmentSizes = array<i32: 1, 1, 1>}> : (!pdl.range<value>, !pdl.attribute, !pdl.range<type>) -> !pdl.operation
          "pdl.rewrite"(%8) <{name = "transform.dialect", operandSegmentSizes = array<i32: 1, 0>}> ({
          }) : (!pdl.operation) -> ()
        }) : () -> ()
        "transform.sequence"(%arg1) <{failure_propagation_mode = 1 : i32, operandSegmentSizes = array<i32: 1, 0>}> ({
        ^bb0(%arg2: !transform.any_op):
          %0 = "transform.pdl_match"(%arg2) <{pattern_name = @pdl_target_attrA}> : (!transform.any_op) -> !transform.any_op
          %1:4 = "transform.structured.tile_using_for"(%0) <{scalable_sizes = array<i1: false, false, false>, static_sizes = array<i64: 4, 4, 4>}> : (!transform.any_op) -> (!transform.any_op, !transform.any_op, !transform.any_op, !transform.any_op)
          %2 = "transform.pdl_match"(%arg2) <{pattern_name = @pdl_target_attrC}> : (!transform.any_op) -> !transform.any_op
          %3 = "transform.get_parent_op"(%2) <{isolated_from_above, nth_parent = 1 : i64}> : (!transform.any_op) -> !transform.any_op
          %4 = "transform.structured.vectorize_children_and_apply_patterns"(%3) : (!transform.any_op) -> !transform.any_op
          "transform.yield"() : () -> ()
        }) : (!transform.any_op) -> ()
      }) : (!transform.any_op) -> ()
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2) -> (d0, d2)>
#map1 = affine_map<(d0, d1, d2) -> (d2, d1)>
#map2 = affine_map<(d0, d1, d2) -> (d0, d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<128x128xf32>, tensor<128x128xf32>, tensor<128x128xf32>) -> tensor<128x128xf32>, sym_name = "vectorize_one"}> ({
  ^bb0(%arg9: tensor<128x128xf32>, %arg10: tensor<128x128xf32>, %arg11: tensor<128x128xf32>):
    %10 = "linalg.matmul"(%arg9, %arg10, %arg11) <{indexing_maps = [#map, #map1, #map2], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg12: f32, %arg13: f32, %arg14: f32):
      %11 = "arith.mulf"(%arg12, %arg13) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %12 = "arith.addf"(%arg14, %11) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%12) : (f32) -> ()
    }) {test.attrA} : (tensor<128x128xf32>, tensor<128x128xf32>, tensor<128x128xf32>) -> tensor<128x128xf32>
    "func.return"(%10) : (tensor<128x128xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<128x128xf32>, tensor<128x128xf32>, tensor<128x128xf32>) -> tensor<128x128xf32>, sym_name = "vectorize_none"}> ({
  ^bb0(%arg3: tensor<128x128xf32>, %arg4: tensor<128x128xf32>, %arg5: tensor<128x128xf32>):
    %7 = "linalg.matmul"(%arg3, %arg4, %arg5) <{indexing_maps = [#map, #map1, #map2], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg6: f32, %arg7: f32, %arg8: f32):
      %8 = "arith.mulf"(%arg6, %arg7) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %9 = "arith.addf"(%arg8, %8) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%9) : (f32) -> ()
    }) : (tensor<128x128xf32>, tensor<128x128xf32>, tensor<128x128xf32>) -> tensor<128x128xf32>
    "func.return"(%7) : (tensor<128x128xf32>) -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      "transform.with_pdl_patterns"(%arg0) ({
      ^bb0(%arg1: !transform.any_op):
        "pdl.pattern"() <{benefit = 1 : i16, sym_name = "pdl_target"}> ({
          %3 = "pdl.operands"() : () -> !pdl.range<value>
          %4 = "pdl.types"() : () -> !pdl.range<type>
          %5 = "pdl.attribute"() : () -> !pdl.attribute
          %6 = "pdl.operation"(%3, %5, %4) <{attributeValueNames = ["test.attrA"], opName = "linalg.matmul", operandSegmentSizes = array<i32: 1, 1, 1>}> : (!pdl.range<value>, !pdl.attribute, !pdl.range<type>) -> !pdl.operation
          "pdl.rewrite"(%6) <{name = "transform.dialect", operandSegmentSizes = array<i32: 1, 0>}> ({
          }) : (!pdl.operation) -> ()
        }) : () -> ()
        "transform.sequence"(%arg1) <{failure_propagation_mode = 1 : i32, operandSegmentSizes = array<i32: 1, 0>}> ({
        ^bb0(%arg2: !transform.any_op):
          %0 = "transform.pdl_match"(%arg2) <{pattern_name = @pdl_target}> : (!transform.any_op) -> !transform.any_op
          %1 = "transform.get_parent_op"(%0) <{isolated_from_above, nth_parent = 1 : i64}> : (!transform.any_op) -> !transform.any_op
          %2 = "transform.structured.vectorize_children_and_apply_patterns"(%1) : (!transform.any_op) -> !transform.any_op
          "transform.yield"() : () -> ()
        }) : (!transform.any_op) -> ()
      }) : (!transform.any_op) -> ()
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2) -> (d0, d2)>
#map1 = affine_map<(d0, d1, d2) -> (d2, d1)>
#map2 = affine_map<(d0, d1, d2) -> (d0, d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<128x128xf32>, tensor<128x128xf32>, tensor<128x128xf32>, tensor<128x128xf32>) -> tensor<128x128xf32>, sym_name = "vectorize_all"}> ({
  ^bb0(%arg1: tensor<128x128xf32>, %arg2: tensor<128x128xf32>, %arg3: tensor<128x128xf32>, %arg4: tensor<128x128xf32>):
    %1 = "linalg.matmul"(%arg1, %arg2, %arg3) <{indexing_maps = [#map, #map1, #map2], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg8: f32, %arg9: f32, %arg10: f32):
      %5 = "arith.mulf"(%arg8, %arg9) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %6 = "arith.addf"(%arg10, %5) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%6) : (f32) -> ()
    }) {test.attrA} : (tensor<128x128xf32>, tensor<128x128xf32>, tensor<128x128xf32>) -> tensor<128x128xf32>
    %2 = "linalg.matmul"(%arg1, %1, %arg4) <{indexing_maps = [#map, #map1, #map2], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg5: f32, %arg6: f32, %arg7: f32):
      %3 = "arith.mulf"(%arg5, %arg6) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %4 = "arith.addf"(%arg7, %3) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%4) : (f32) -> ()
    }) : (tensor<128x128xf32>, tensor<128x128xf32>, tensor<128x128xf32>) -> tensor<128x128xf32>
    "func.return"(%2) : (tensor<128x128xf32>) -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.vectorize_children_and_apply_patterns"(%arg0) : (!transform.any_op) -> !transform.any_op
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

