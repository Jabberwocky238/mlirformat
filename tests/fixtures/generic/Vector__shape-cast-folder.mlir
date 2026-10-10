"builtin.module"() ({
  "func.func"() <{function_type = (vector<2x4xf32>) -> vector<2x4xf32>, sym_name = "fixed_width"}> ({
  ^bb0(%arg2: vector<2x4xf32>):
    %3 = "vector.shape_cast"(%arg2) : (vector<2x4xf32>) -> vector<8xf32>
    %4 = "vector.shape_cast"(%3) : (vector<8xf32>) -> vector<2x4xf32>
    "func.return"(%4) : (vector<2x4xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<2x[4]xf32>) -> vector<2x[4]xf32>, sym_name = "scalable"}> ({
  ^bb0(%arg1: vector<2x[4]xf32>):
    %1 = "vector.shape_cast"(%arg1) : (vector<2x[4]xf32>) -> vector<[8]xf32>
    %2 = "vector.shape_cast"(%1) : (vector<[8]xf32>) -> vector<2x[4]xf32>
    "func.return"(%2) : (vector<2x[4]xf32>) -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["func.func"]}> : (!transform.any_op) -> !transform.op<"func.func">
      "transform.apply_patterns"(%0) <{max_iterations = -1 : i64, max_num_rewrites = -1 : i64}> ({
        "transform.apply_patterns.vector.drop_unit_dims_with_shape_cast"() : () -> ()
      }) : (!transform.op<"func.func">) -> ()
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

