#map = affine_map<(d0, d1) -> (d0, 0, d1)>
#map1 = affine_map<(d0, d1) -> (0, d1, d0)>
#map2 = affine_map<(d0, d1) -> (d0, d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<3x4xf32>, memref<4x3xf32>, memref<3x3xf32>) -> (), sym_name = "multi_reduction_to_fma"}> ({
  ^bb0(%arg1: memref<3x4xf32>, %arg2: memref<4x3xf32>, %arg3: memref<3x3xf32>):
    %1 = "arith.constant"() <{value = 0 : index}> : () -> index
    %2 = "ub.poison"() <{value = #ub.poison}> : () -> f32
    %3 = "vector.transfer_read"(%arg1, %1, %1, %2) <{in_bounds = [false, false, false], operandSegmentSizes = array<i32: 1, 2, 1, 0>, permutation_map = #map}> : (memref<3x4xf32>, index, index, f32) -> vector<3x3x4xf32>
    %4 = "vector.transfer_read"(%arg2, %1, %1, %2) <{in_bounds = [false, false, false], operandSegmentSizes = array<i32: 1, 2, 1, 0>, permutation_map = #map1}> : (memref<4x3xf32>, index, index, f32) -> vector<3x3x4xf32>
    %5 = "vector.transfer_read"(%arg3, %1, %1, %2) <{in_bounds = [false, false], operandSegmentSizes = array<i32: 1, 2, 1, 0>, permutation_map = #map2}> : (memref<3x3xf32>, index, index, f32) -> vector<3x3xf32>
    %6 = "arith.mulf"(%3, %4) <{fastmath = #arith.fastmath<none>}> : (vector<3x3x4xf32>, vector<3x3x4xf32>) -> vector<3x3x4xf32>
    %7 = "vector.multi_reduction"(%6, %5) <{kind = #vector.kind<add>, reduction_dims = array<i64: 2>}> : (vector<3x3x4xf32>, vector<3x3xf32>) -> vector<3x3xf32>
    "vector.transfer_write"(%7, %arg3, %1, %1) <{in_bounds = [false, false], operandSegmentSizes = array<i32: 1, 1, 2, 0>, permutation_map = #map2}> : (vector<3x3xf32>, memref<3x3xf32>, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["func.func"]}> : (!transform.any_op) -> !transform.any_op
      "transform.apply_patterns"(%0) <{max_iterations = -1 : i64, max_num_rewrites = -1 : i64}> ({
        "transform.apply_patterns.vector.reduction_to_contract"() : () -> ()
        "transform.apply_patterns.vector.transfer_permutation_patterns"() : () -> ()
      }) : (!transform.any_op) -> ()
      "transform.apply_patterns"(%0) <{max_iterations = -1 : i64, max_num_rewrites = -1 : i64}> ({
        "transform.apply_patterns.vector.lower_contraction"() <{lowering_strategy = 2 : i32}> : () -> ()
      }) : (!transform.any_op) -> ()
      "transform.apply_patterns"(%0) <{max_iterations = -1 : i64, max_num_rewrites = -1 : i64}> ({
        "transform.apply_patterns.vector.lower_outerproduct"() : () -> ()
      }) : (!transform.any_op) -> ()
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

