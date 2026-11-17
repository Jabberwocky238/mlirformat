"builtin.module"() ({
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg2: !transform.any_op loc("<stdin>":5:10)):
      %3 = "transform.structured.match"(%arg2) <{ops = ["func.func"]}> : (!transform.any_op) -> !transform.op<"func.func"> loc("<stdin>":6:12)
      "transform.apply_patterns"(%3) <{max_iterations = -1 : i64, max_num_rewrites = -1 : i64}> ({
        "transform.apply_patterns.tensor.fold_tensor_empty"() <{fold_single_use_only = true}> : () -> () loc("<stdin>":8:9)
      }) : (!transform.op<"func.func">) -> () loc("<stdin>":7:7)
      "transform.yield"() : () -> () loc("<stdin>":10:7)
    }) : () -> () loc("<stdin>":4:5)
  }) {transform.with_named_sequence} : () -> () loc("<stdin>":3:3)
  "func.func"() <{function_type = (index, index) -> (tensor<5x?x20xf32>, tensor<5x?x20xf32>), sym_name = "double_use_of_tensor_empty"}> ({
  ^bb0(%arg0: index loc("<stdin>":14:8), %arg1: index loc("<stdin>":14:22)):
    %0 = "tensor.empty"(%arg0) : (index) -> tensor<?x10x40xf32> loc("<stdin>":15:10)
    %1 = "tensor.extract_slice"(%0, %arg1) <{operandSegmentSizes = array<i32: 1, 0, 1, 0>, static_offsets = array<i64: 0, 0, 0>, static_sizes = array<i64: 5, -9223372036854775808, 20>, static_strides = array<i64: 1, 1, 1>}> : (tensor<?x10x40xf32>, index) -> tensor<5x?x20xf32> loc("<stdin>":16:10)
    %2 = "tensor.extract_slice"(%0, %arg1) <{operandSegmentSizes = array<i32: 1, 0, 1, 0>, static_offsets = array<i64: 1, 1, 1>, static_sizes = array<i64: 5, -9223372036854775808, 20>, static_strides = array<i64: 1, 1, 1>}> : (tensor<?x10x40xf32>, index) -> tensor<5x?x20xf32> loc("<stdin>":17:10)
    "func.return"(%1, %2) : (tensor<5x?x20xf32>, tensor<5x?x20xf32>) -> () loc("<stdin>":18:5)
  }) : () -> () loc("<stdin>":13:3)
}) : () -> () loc("<stdin>":2:1)
