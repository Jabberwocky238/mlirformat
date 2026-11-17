"builtin.module"() ({
  "func.func"() <{function_type = (vector<2x4xf32>) -> vector<2x4xf32>, sym_name = "fixed_width"}> ({
  ^bb0(%arg2: vector<2x4xf32> loc("<stdin>":3:8)):
    %3 = "vector.shape_cast"(%arg2) : (vector<2x4xf32>) -> vector<8xf32> loc("<stdin>":4:10)
    %4 = "vector.shape_cast"(%3) : (vector<8xf32>) -> vector<2x4xf32> loc("<stdin>":5:10)
    "func.return"(%4) : (vector<2x4xf32>) -> () loc("<stdin>":6:5)
  }) : () -> () loc("<stdin>":2:3)
  "func.func"() <{function_type = (vector<2x[4]xf32>) -> vector<2x[4]xf32>, sym_name = "scalable"}> ({
  ^bb0(%arg1: vector<2x[4]xf32> loc("<stdin>":9:8)):
    %1 = "vector.shape_cast"(%arg1) : (vector<2x[4]xf32>) -> vector<[8]xf32> loc("<stdin>":10:10)
    %2 = "vector.shape_cast"(%1) : (vector<[8]xf32>) -> vector<2x[4]xf32> loc("<stdin>":11:10)
    "func.return"(%2) : (vector<2x[4]xf32>) -> () loc("<stdin>":12:5)
  }) : () -> () loc("<stdin>":8:3)
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op loc("<stdin>":16:10)):
      %0 = "transform.structured.match"(%arg0) <{ops = ["func.func"]}> : (!transform.any_op) -> !transform.op<"func.func"> loc("<stdin>":17:12)
      "transform.apply_patterns"(%0) <{max_iterations = -1 : i64, max_num_rewrites = -1 : i64}> ({
        "transform.apply_patterns.vector.drop_unit_dims_with_shape_cast"() : () -> () loc("<stdin>":19:9)
      }) : (!transform.op<"func.func">) -> () loc("<stdin>":18:7)
      "transform.yield"() : () -> () loc("<stdin>":21:7)
    }) : () -> () loc("<stdin>":15:5)
  }) {transform.with_named_sequence} : () -> () loc("<stdin>":14:3)
}) : () -> () loc("<stdin>":1:1)
