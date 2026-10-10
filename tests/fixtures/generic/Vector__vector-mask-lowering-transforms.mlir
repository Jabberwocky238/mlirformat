"builtin.module"() ({
  "func.func"() <{function_type = () -> vector<8xi1>, sym_name = "genbool_1d"}> ({
    %6 = "vector.constant_mask"() <{mask_dim_sizes = array<i64: 4>}> : () -> vector<8xi1>
    "func.return"(%6) : (vector<8xi1>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> vector<4x4xi1>, sym_name = "genbool_2d"}> ({
    %5 = "vector.constant_mask"() <{mask_dim_sizes = array<i64: 2, 2>}> : () -> vector<4x4xi1>
    "func.return"(%5) : (vector<4x4xi1>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> vector<2x3x4xi1>, sym_name = "genbool_3d"}> ({
    %4 = "vector.constant_mask"() <{mask_dim_sizes = array<i64: 1, 1, 3>}> : () -> vector<2x3x4xi1>
    "func.return"(%4) : (vector<2x3x4xi1>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (index) -> vector<3xi1>, sym_name = "genbool_var_1d"}> ({
  ^bb0(%arg6: index):
    %3 = "vector.create_mask"(%arg6) : (index) -> vector<3xi1>
    "func.return"(%3) : (vector<3xi1>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (index, index) -> vector<2x3xi1>, sym_name = "genbool_var_2d"}> ({
  ^bb0(%arg4: index, %arg5: index):
    %2 = "vector.create_mask"(%arg4, %arg5) : (index, index) -> vector<2x3xi1>
    "func.return"(%2) : (vector<2x3xi1>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (index, index, index) -> vector<2x1x7xi1>, sym_name = "genbool_var_3d"}> ({
  ^bb0(%arg1: index, %arg2: index, %arg3: index):
    %1 = "vector.create_mask"(%arg1, %arg2, %arg3) : (index, index, index) -> vector<2x1x7xi1>
    "func.return"(%1) : (vector<2x1x7xi1>) -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["func.func"]}> : (!transform.any_op) -> !transform.any_op
      "transform.apply_patterns"(%0) <{max_iterations = -1 : i64, max_num_rewrites = -1 : i64}> ({
        "transform.apply_patterns.vector.lower_masks"() : () -> ()
      }) : (!transform.any_op) -> ()
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2) -> (d0, d1, d2)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x?x?xf32>, index, index, index) -> vector<2x1x7xf32>, sym_name = "transfer_read_3d"}> ({
  ^bb0(%arg1: tensor<?x?x?xf32>, %arg2: index, %arg3: index, %arg4: index):
    %1 = "arith.constant"() <{value = 0 : index}> : () -> index
    %2 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %3 = "vector.create_mask"(%arg2, %arg3, %arg4) : (index, index, index) -> vector<2x1x7xi1>
    %4 = "vector.mask"(%3) ({
      %5 = "vector.transfer_read"(%arg1, %1, %1, %1, %2) <{in_bounds = [true, true, true], operandSegmentSizes = array<i32: 1, 3, 1, 0>, permutation_map = #map}> : (tensor<?x?x?xf32>, index, index, index, f32) -> vector<2x1x7xf32>
      "vector.yield"(%5) : (vector<2x1x7xf32>) -> ()
    }) : (vector<2x1x7xi1>) -> vector<2x1x7xf32>
    "func.return"(%4) : (vector<2x1x7xf32>) -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["func.func"]}> : (!transform.any_op) -> !transform.any_op
      "transform.apply_patterns"(%0) <{max_iterations = -1 : i64, max_num_rewrites = -1 : i64}> ({
        "transform.apply_patterns.vector.lower_masked_transfers"() : () -> ()
      }) : (!transform.any_op) -> ()
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

