"builtin.module"() ({
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg2: !transform.any_op loc("<stdin>":5:10)):
      %2 = "transform.structured.match"(%arg2) <{ops = ["func.func"]}> : (!transform.any_op) -> !transform.any_op loc("<stdin>":6:12)
      %3 = "transform.bufferization.one_shot_bufferize"(%2) <{allow_return_allocs_from_loops = false, allow_unknown_ops = false, bufferize_function_boundaries = false, check_parallel_regions = true, dump_alias_sets = false, memcpy_op = "memref.copy", print_conflicts = false, test_analysis_only = false}> : (!transform.any_op) -> !transform.any_op loc("<stdin>":7:12)
      "transform.yield"() : () -> () loc("<stdin>":8:7)
    }) : () -> () loc("<stdin>":4:5)
  }) {transform.with_named_sequence} : () -> () loc("<stdin>":3:3)
  "func.func"() <{function_type = (tensor<?xf32>, vector<4xf32>) -> tensor<?xf32>, sym_name = "test_function"}> ({
  ^bb0(%arg0: tensor<?xf32> loc("<stdin>":12:8), %arg1: vector<4xf32> loc("<stdin>":12:30)):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":13:10)
    %1 = "vector.transfer_write"(%arg1, %arg0, %0) <{in_bounds = [false], operandSegmentSizes = array<i32: 1, 1, 1, 0>, permutation_map = affine_map<(d0) -> (d0)>}> : (vector<4xf32>, tensor<?xf32>, index) -> tensor<?xf32> loc("<stdin>":14:10)
    "func.return"(%1) : (tensor<?xf32>) -> () loc("<stdin>":15:5)
  }) : () -> () loc("<stdin>":11:3)
}) : () -> () loc("<stdin>":2:1)
