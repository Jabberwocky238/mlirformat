"builtin.module"() ({
  "func.func"() <{function_type = (memref<?x?xf32>, index, index, index) -> (), sym_name = "hoist_basic_vector_xfer_pair"}> ({
  ^bb0(%arg1: memref<?x?xf32> loc("<stdin>":4:8), %arg2: index loc("<stdin>":4:32), %arg3: index loc("<stdin>":4:46), %arg4: index loc("<stdin>":4:60)):
    %2 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":5:10)
    %3 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32 loc("<stdin>":6:10)
    "scf.for"(%arg2, %arg3, %arg4) ({
    ^bb0(%arg5: index loc("<stdin>":8:10)):
      %4 = "vector.transfer_read"(%arg1, %2, %2, %3) <{in_bounds = [false], operandSegmentSizes = array<i32: 1, 2, 1, 0>, permutation_map = affine_map<(d0, d1) -> (d1)>}> : (memref<?x?xf32>, index, index, f32) -> vector<1xf32> loc("<stdin>":9:12)
      %5 = "val_use"(%4) : (vector<1xf32>) -> vector<1xf32> loc("<stdin>":10:12)
      "vector.transfer_write"(%5, %arg1, %2, %2) <{in_bounds = [false], operandSegmentSizes = array<i32: 1, 1, 2, 0>, permutation_map = affine_map<(d0, d1) -> (d1)>}> : (vector<1xf32>, memref<?x?xf32>, index, index) -> () loc("<stdin>":11:7)
      "scf.yield"() : () -> () loc("<stdin>":12:7)
    }) : (index, index, index) -> () loc("<stdin>":7:5)
    "func.return"() : () -> () loc("<stdin>":14:5)
  }) : () -> () loc("<stdin>":3:3)
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op loc("<stdin>":18:10)):
      %0 = "transform.structured.match"(%arg0) <{ops = ["func.func"]}> : (!transform.any_op) -> !transform.any_op loc("<stdin>":19:12)
      %1 = "transform.structured.hoist_redundant_vector_transfers"(%0) : (!transform.any_op) -> !transform.any_op loc("<stdin>":20:12)
      "transform.yield"() : () -> () loc("<stdin>":21:7)
    }) : () -> () loc("<stdin>":17:5)
  }) {transform.with_named_sequence} : () -> () loc("<stdin>":16:3)
}) : () -> () loc("<stdin>":2:1)
