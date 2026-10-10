"builtin.module"() ({
  "func.func"() <{function_type = (index) -> vector<3x[4]xi1>, sym_name = "create_mask_2d_trailing_scalable"}> ({
  ^bb0(%arg0: index):
    %0 = "arith.constant"() <{value = 2 : index}> : () -> index
    %1 = "vector.create_mask"(%0, %arg0) : (index, index) -> vector<3x[4]xi1>
    "func.return"(%1) : (vector<3x[4]xi1>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (index) -> vector<[4]x4xi1>, sym_name = "cannot_create_mask_2d_leading_scalable"}> ({
  ^bb0(%arg1: index):
    %1 = "arith.constant"() <{value = 1 : index}> : () -> index
    %2 = "vector.create_mask"(%arg1, %1) : (index, index) -> vector<[4]x4xi1>
    "func.return"(%2) : (vector<[4]x4xi1>) -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["func.func"]}> : (!transform.any_op) -> !transform.any_op
      "transform.apply_patterns"(%0) <{max_iterations = -1 : i64, max_num_rewrites = -1 : i64}> ({
        "transform.apply_patterns.vector.lower_create_mask"() : () -> ()
      }) : (!transform.any_op) -> ()
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

