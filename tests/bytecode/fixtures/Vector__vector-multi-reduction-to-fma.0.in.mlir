"builtin.module"() ({
  "func.func"() <{function_type = (memref<3x4xf32>, memref<4x3xf32>, memref<3x3xf32>) -> (), sym_name = "multi_reduction_to_fma"}> ({
  ^bb0(%arg1: memref<3x4xf32> loc("<stdin>":6:8), %arg2: memref<4x3xf32> loc("<stdin>":6:32), %arg3: memref<3x3xf32> loc("<stdin>":6:56)):
    %1 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":7:10)
    %2 = "ub.poison"() <{value = #ub.poison}> : () -> f32 loc("<stdin>":8:10)
    %3 = "vector.transfer_read"(%arg1, %1, %1, %2) <{in_bounds = [false, false, false], operandSegmentSizes = array<i32: 1, 2, 1, 0>, permutation_map = affine_map<(d0, d1) -> (d0, 0, d1)>}> : (memref<3x4xf32>, index, index, f32) -> vector<3x3x4xf32> loc("<stdin>":9:10)
    %4 = "vector.transfer_read"(%arg2, %1, %1, %2) <{in_bounds = [false, false, false], operandSegmentSizes = array<i32: 1, 2, 1, 0>, permutation_map = affine_map<(d0, d1) -> (0, d1, d0)>}> : (memref<4x3xf32>, index, index, f32) -> vector<3x3x4xf32> loc("<stdin>":10:10)
    %5 = "vector.transfer_read"(%arg3, %1, %1, %2) <{in_bounds = [false, false], operandSegmentSizes = array<i32: 1, 2, 1, 0>, permutation_map = affine_map<(d0, d1) -> (d0, d1)>}> : (memref<3x3xf32>, index, index, f32) -> vector<3x3xf32> loc("<stdin>":11:10)
    %6 = "arith.mulf"(%3, %4) <{fastmath = #arith.fastmath<none>}> : (vector<3x3x4xf32>, vector<3x3x4xf32>) -> vector<3x3x4xf32> loc("<stdin>":12:10)
    %7 = "vector.multi_reduction"(%6, %5) <{kind = #vector.kind<add>, reduction_dims = array<i64: 2>}> : (vector<3x3x4xf32>, vector<3x3xf32>) -> vector<3x3xf32> loc("<stdin>":13:10)
    "vector.transfer_write"(%7, %arg3, %1, %1) <{in_bounds = [false, false], operandSegmentSizes = array<i32: 1, 1, 2, 0>, permutation_map = affine_map<(d0, d1) -> (d0, d1)>}> : (vector<3x3xf32>, memref<3x3xf32>, index, index) -> () loc("<stdin>":14:5)
    "func.return"() : () -> () loc("<stdin>":15:5)
  }) : () -> () loc("<stdin>":5:3)
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op loc("<stdin>":19:10)):
      %0 = "transform.structured.match"(%arg0) <{ops = ["func.func"]}> : (!transform.any_op) -> !transform.any_op loc("<stdin>":20:12)
      "transform.apply_patterns"(%0) <{max_iterations = -1 : i64, max_num_rewrites = -1 : i64}> ({
        "transform.apply_patterns.vector.reduction_to_contract"() : () -> () loc("<stdin>":22:9)
        "transform.apply_patterns.vector.transfer_permutation_patterns"() : () -> () loc("<stdin>":23:9)
      }) : (!transform.any_op) -> () loc("<stdin>":21:7)
      "transform.apply_patterns"(%0) <{max_iterations = -1 : i64, max_num_rewrites = -1 : i64}> ({
        "transform.apply_patterns.vector.lower_contraction"() <{lowering_strategy = 2 : i32}> : () -> () loc("<stdin>":26:9)
      }) : (!transform.any_op) -> () loc("<stdin>":25:7)
      "transform.apply_patterns"(%0) <{max_iterations = -1 : i64, max_num_rewrites = -1 : i64}> ({
        "transform.apply_patterns.vector.lower_outerproduct"() : () -> () loc("<stdin>":29:9)
      }) : (!transform.any_op) -> () loc("<stdin>":28:7)
      "transform.yield"() : () -> () loc("<stdin>":31:7)
    }) : () -> () loc("<stdin>":18:5)
  }) {transform.with_named_sequence} : () -> () loc("<stdin>":17:3)
}) : () -> () loc("<stdin>":4:1)
