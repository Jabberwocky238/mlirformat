"builtin.module"() ({
  "func.func"() <{function_type = (tensor<128xf32>, tensor<128xf32>) -> (tensor<128xf32>, tensor<128xf32>), sym_name = "fuse_1st_for_into_2nd"}> ({
  ^bb0(%arg1: tensor<128xf32> loc("<stdin>":4:8), %arg2: tensor<128xf32> loc("<stdin>":4:32)):
    %3 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":5:10)
    %4 = "arith.constant"() <{value = 16 : index}> : () -> index loc("<stdin>":6:10)
    %5 = "arith.constant"() <{value = 128 : index}> : () -> index loc("<stdin>":7:10)
    %6 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32 loc("<stdin>":8:10)
    %7 = "scf.for"(%3, %5, %4, %arg1) ({
    ^bb0(%arg5: index loc("<stdin>":10:10), %arg6: tensor<128xf32> loc("<stdin>":10:24)):
      %13 = "vector.transfer_read"(%arg1, %arg5, %6) <{in_bounds = [true], operandSegmentSizes = array<i32: 1, 1, 1, 0>, permutation_map = affine_map<(d0) -> (d0)>}> : (tensor<128xf32>, index, f32) -> vector<16xf32> loc("<stdin>":11:13)
      %14 = "vector.transfer_read"(%arg6, %arg5, %6) <{in_bounds = [true], operandSegmentSizes = array<i32: 1, 1, 1, 0>, permutation_map = affine_map<(d0) -> (d0)>}> : (tensor<128xf32>, index, f32) -> vector<16xf32> loc("<stdin>":12:13)
      %15 = "arith.addf"(%14, %13) <{fastmath = #arith.fastmath<none>}> : (vector<16xf32>, vector<16xf32>) -> vector<16xf32> loc("<stdin>":13:13)
      %16 = "vector.transfer_write"(%15, %arg6, %arg5) <{in_bounds = [true], operandSegmentSizes = array<i32: 1, 1, 1, 0>, permutation_map = affine_map<(d0) -> (d0)>}> : (vector<16xf32>, tensor<128xf32>, index) -> tensor<128xf32> loc("<stdin>":14:13)
      "scf.yield"(%16) : (tensor<128xf32>) -> () loc("<stdin>":15:7)
    }) : (index, index, index, tensor<128xf32>) -> tensor<128xf32> loc("<stdin>":9:10)
    %8 = "scf.for"(%3, %5, %4, %arg2) ({
    ^bb0(%arg3: index loc("<stdin>":18:10), %arg4: tensor<128xf32> loc("<stdin>":18:24)):
      %9 = "vector.transfer_read"(%arg1, %arg3, %6) <{in_bounds = [true], operandSegmentSizes = array<i32: 1, 1, 1, 0>, permutation_map = affine_map<(d0) -> (d0)>}> : (tensor<128xf32>, index, f32) -> vector<16xf32> loc("<stdin>":19:12)
      %10 = "vector.transfer_read"(%arg4, %arg3, %6) <{in_bounds = [true], operandSegmentSizes = array<i32: 1, 1, 1, 0>, permutation_map = affine_map<(d0) -> (d0)>}> : (tensor<128xf32>, index, f32) -> vector<16xf32> loc("<stdin>":20:13)
      %11 = "arith.addf"(%10, %9) <{fastmath = #arith.fastmath<none>}> : (vector<16xf32>, vector<16xf32>) -> vector<16xf32> loc("<stdin>":21:13)
      %12 = "vector.transfer_write"(%11, %arg4, %arg3) <{in_bounds = [true], operandSegmentSizes = array<i32: 1, 1, 1, 0>, permutation_map = affine_map<(d0) -> (d0)>}> : (vector<16xf32>, tensor<128xf32>, index) -> tensor<128xf32> loc("<stdin>":22:13)
      "scf.yield"(%12) : (tensor<128xf32>) -> () loc("<stdin>":23:7)
    }) : (index, index, index, tensor<128xf32>) -> tensor<128xf32> loc("<stdin>":17:10)
    "func.return"(%7, %8) : (tensor<128xf32>, tensor<128xf32>) -> () loc("<stdin>":25:5)
  }) : () -> () loc("<stdin>":3:3)
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op loc("<stdin>":29:10)):
      %0 = "transform.structured.match"(%arg0) <{ops = ["scf.for"]}> : (!transform.any_op) -> !transform.any_op loc("<stdin>":30:12)
      %1:2 = "transform.split_handle"(%0) <{fail_on_payload_too_small = true, pass_through_empty_handle = true}> : (!transform.any_op) -> (!transform.any_op, !transform.any_op) loc("<stdin>":31:14)
      %2 = "transform.loop.fuse_sibling"(%1#0, %1#1) : (!transform.any_op, !transform.any_op) -> !transform.any_op loc("<stdin>":32:12)
      "transform.yield"() : () -> () loc("<stdin>":33:7)
    }) : () -> () loc("<stdin>":28:5)
  }) {transform.with_named_sequence} : () -> () loc("<stdin>":27:3)
}) : () -> () loc("<stdin>":2:1)
