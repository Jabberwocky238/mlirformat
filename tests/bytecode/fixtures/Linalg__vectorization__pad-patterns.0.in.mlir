"builtin.module"() ({
  "func.func"() <{function_type = (tensor<5x6xf32>) -> vector<7x9xf32>, sym_name = "pad_and_transfer_read"}> ({
  ^bb0(%arg1: tensor<5x6xf32> loc("<stdin>":4:8)):
    %1 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":5:10)
    %2 = "arith.constant"() <{value = 5.000000e+00 : f32}> : () -> f32 loc("<stdin>":6:10)
    %3 = "arith.constant"() <{value = 6.000000e+00 : f32}> : () -> f32 loc("<stdin>":7:10)
    %4 = "tensor.pad"(%arg1) <{operandSegmentSizes = array<i32: 1, 0, 0>, static_high = array<i64: 5, 7>, static_low = array<i64: 0, 0>}> ({
    ^bb0(%arg2: index loc("<stdin>":9:10), %arg3: index loc("<stdin>":9:24)):
      "tensor.yield"(%2) : (f32) -> () loc("<stdin>":10:7)
    }) : (tensor<5x6xf32>) -> tensor<10x13xf32> loc("<stdin>":8:10)
    %5 = "vector.transfer_read"(%4, %1, %1, %3) <{in_bounds = [false, false], operandSegmentSizes = array<i32: 1, 2, 1, 0>, permutation_map = affine_map<(d0, d1) -> (d0, d1)>}> : (tensor<10x13xf32>, index, index, f32) -> vector<7x9xf32> loc("<stdin>":12:10)
    "func.return"(%5) : (vector<7x9xf32>) -> () loc("<stdin>":13:5)
  }) : () -> () loc("<stdin>":3:3)
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op loc("<stdin>":17:10)):
      %0 = "transform.structured.match"(%arg0) <{ops = ["func.func"]}> : (!transform.any_op) -> !transform.op<"func.func"> loc("<stdin>":18:12)
      "transform.apply_patterns"(%0) <{max_iterations = -1 : i64, max_num_rewrites = -1 : i64}> ({
        "transform.apply_patterns.linalg.pad_vectorization"() : () -> () loc("<stdin>":20:9)
      }) : (!transform.op<"func.func">) -> () loc("<stdin>":19:7)
      "transform.yield"() : () -> () loc("<stdin>":22:7)
    }) : () -> () loc("<stdin>":16:5)
  }) {transform.with_named_sequence} : () -> () loc("<stdin>":15:3)
}) : () -> () loc("<stdin>":2:1)
