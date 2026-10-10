#map = affine_map<(d0, d1) -> (d0, d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<?x8xf32>, index, index) -> vector<4x8xf32>, sym_name = "split_vector_transfer_read_2d"}> ({
  ^bb0(%arg4: memref<?x8xf32>, %arg5: index, %arg6: index):
    %4 = "arith.constant"() <{value = 0 : index}> : () -> index
    %5 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %6 = "vector.transfer_read"(%arg4, %arg5, %arg6, %5) <{in_bounds = [false, false], operandSegmentSizes = array<i32: 1, 2, 1, 0>, permutation_map = #map}> : (memref<?x8xf32>, index, index, f32) -> vector<4x8xf32>
    "func.return"(%6) : (vector<4x8xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<7x8xf32, strided<[?, 1], offset: ?>>, index, index) -> vector<4x8xf32>, sym_name = "split_vector_transfer_read_strided_2d"}> ({
  ^bb0(%arg1: memref<7x8xf32, strided<[?, 1], offset: ?>>, %arg2: index, %arg3: index):
    %1 = "arith.constant"() <{value = 0 : index}> : () -> index
    %2 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %3 = "vector.transfer_read"(%arg1, %arg2, %arg3, %2) <{in_bounds = [false, false], operandSegmentSizes = array<i32: 1, 2, 1, 0>, permutation_map = #map}> : (memref<7x8xf32, strided<[?, 1], offset: ?>>, index, index, f32) -> vector<4x8xf32>
    "func.return"(%3) : (vector<4x8xf32>) -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["func.func"]}> : (!transform.any_op) -> !transform.op<"func.func">
      "transform.apply_patterns"(%0) <{max_iterations = -1 : i64, max_num_rewrites = -1 : i64}> ({
        "transform.apply_patterns.vector.split_transfer_full_partial"() <{split_transfer_strategy = 2 : i32}> : () -> ()
      }) : (!transform.op<"func.func">) -> ()
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1) -> (d0, d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (vector<4x8xf32>, memref<?x8xf32>, index, index) -> (), sym_name = "split_vector_transfer_write_2d"}> ({
  ^bb0(%arg1: vector<4x8xf32>, %arg2: memref<?x8xf32>, %arg3: index, %arg4: index):
    "vector.transfer_write"(%arg1, %arg2, %arg3, %arg4) <{in_bounds = [false, false], operandSegmentSizes = array<i32: 1, 1, 2, 0>, permutation_map = #map}> : (vector<4x8xf32>, memref<?x8xf32>, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["func.func"]}> : (!transform.any_op) -> !transform.op<"func.func">
      "transform.apply_patterns"(%0) <{max_iterations = -1 : i64, max_num_rewrites = -1 : i64}> ({
        "transform.apply_patterns.vector.split_transfer_full_partial"() <{split_transfer_strategy = 2 : i32}> : () -> ()
      }) : (!transform.op<"func.func">) -> ()
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1) -> (d0, d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (vector<4x8xf32>, memref<7x8xf32, strided<[?, 1], offset: ?>>, index, index) -> (), sym_name = "split_vector_transfer_write_strided_2d"}> ({
  ^bb0(%arg1: vector<4x8xf32>, %arg2: memref<7x8xf32, strided<[?, 1], offset: ?>>, %arg3: index, %arg4: index):
    "vector.transfer_write"(%arg1, %arg2, %arg3, %arg4) <{in_bounds = [false, false], operandSegmentSizes = array<i32: 1, 1, 2, 0>, permutation_map = #map}> : (vector<4x8xf32>, memref<7x8xf32, strided<[?, 1], offset: ?>>, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["func.func"]}> : (!transform.any_op) -> !transform.op<"func.func">
      "transform.apply_patterns"(%0) <{max_iterations = -1 : i64, max_num_rewrites = -1 : i64}> ({
        "transform.apply_patterns.vector.split_transfer_full_partial"() <{split_transfer_strategy = 2 : i32}> : () -> ()
      }) : (!transform.op<"func.func">) -> ()
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

