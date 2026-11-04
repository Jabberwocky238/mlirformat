#map = affine_map<(d0, d1, d2) -> (d0, d2)>
#map1 = affine_map<(d0, d1, d2) -> (d2, d1)>
#map2 = affine_map<(d0, d1, d2) -> (d0, d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x42xf32>, tensor<42x?xf32>, tensor<?x?xf32>) -> tensor<?x?xf32>, sym_name = "promote_in0"}> ({
  ^bb0(%arg1: tensor<?x42xf32>, %arg2: tensor<42x?xf32>, %arg3: tensor<?x?xf32>):
    %3 = "linalg.matmul"(%arg1, %arg2, %arg3) <{indexing_maps = [#map, #map1, #map2], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg4: f32, %arg5: f32, %arg6: f32):
      %4 = "arith.mulf"(%arg4, %arg5) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %5 = "arith.addf"(%arg6, %4) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%5) : (f32) -> ()
    }) : (tensor<?x42xf32>, tensor<42x?xf32>, tensor<?x?xf32>) -> tensor<?x?xf32>
    "func.return"(%3) : (tensor<?x?xf32>) -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["linalg.matmul"]}> : (!transform.any_op) -> !transform.any_op
      %1 = "transform.get_operand"(%0) <{raw_position_list = array<i64: 0>}> : (!transform.any_op) -> !transform.any_value
      %2 = "transform.structured.promote_tensor"(%1) <{memory_space = 1 : i64}> : (!transform.any_value) -> !transform.any_value
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x42xf32>, tensor<?x42xf32>, tensor<?x?xf32>) -> tensor<?x?xf32>, sym_name = "promote_out"}> ({
  ^bb0(%arg1: tensor<?x42xf32>, %arg2: tensor<?x42xf32>, %arg3: tensor<?x?xf32>):
    %3 = "linalg.add"(%arg1, %arg2, %arg3) <{operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg4: f32, %arg5: f32, %arg6: f32):
      %4 = "arith.addf"(%arg4, %arg5) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%4) : (f32) -> ()
    }) : (tensor<?x42xf32>, tensor<?x42xf32>, tensor<?x?xf32>) -> tensor<?x?xf32>
    "func.return"(%3) : (tensor<?x?xf32>) -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["linalg.add"]}> : (!transform.any_op) -> !transform.any_op
      %1 = "transform.get_operand"(%0) <{raw_position_list = array<i64: 2>}> : (!transform.any_op) -> !transform.any_value
      %2 = "transform.structured.promote_tensor"(%1) <{memory_space = 1 : i64}> : (!transform.any_value) -> !transform.any_value
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x42xf32>, tensor<42x?xf32>, tensor<?x?xf32>) -> tensor<?x?xf32>, sym_name = "promote_in0_out_bufferize"}> ({
  ^bb0(%arg1: tensor<?x42xf32>, %arg2: tensor<42x?xf32>, %arg3: tensor<?x?xf32>):
    %7 = "linalg.add"(%arg1, %arg2, %arg3) <{operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg4: f32, %arg5: f32, %arg6: f32):
      %8 = "arith.addf"(%arg4, %arg5) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%8) : (f32) -> ()
    }) : (tensor<?x42xf32>, tensor<42x?xf32>, tensor<?x?xf32>) -> tensor<?x?xf32>
    "func.return"(%7) : (tensor<?x?xf32>) -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["linalg.add"]}> : (!transform.any_op) -> !transform.any_op
      %1 = "transform.get_operand"(%0) <{raw_position_list = array<i64: 0>}> : (!transform.any_op) -> !transform.any_value
      %2 = "transform.structured.promote_tensor"(%1) <{memory_space = 1 : i64}> : (!transform.any_value) -> !transform.any_value
      %3 = "transform.get_operand"(%0) <{raw_position_list = array<i64: 2>}> : (!transform.any_op) -> !transform.any_value
      %4 = "transform.structured.promote_tensor"(%3) <{memory_space = 1 : i64}> : (!transform.any_value) -> !transform.any_value
      %5 = "transform.structured.match"(%arg0) <{ops = ["func.func"]}> : (!transform.any_op) -> !transform.any_op
      %6 = "transform.bufferization.one_shot_bufferize"(%5) <{allow_return_allocs_from_loops = false, allow_unknown_ops = false, bufferize_function_boundaries = false, check_parallel_regions = true, dump_alias_sets = false, memcpy_op = "memref.copy", print_conflicts = false, test_analysis_only = false}> : (!transform.any_op) -> !transform.any_op
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

