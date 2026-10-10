"builtin.module"() ({
  "func.func"() <{function_type = (i1) -> vector<1xi1>, sym_name = "select_single_i1_vector"}> ({
  ^bb0(%arg1: i1):
    %1 = "arith.constant"() <{value = dense<true> : vector<1xi1>}> : () -> vector<1xi1>
    %2 = "arith.constant"() <{value = dense<false> : vector<1xi1>}> : () -> vector<1xi1>
    %3 = "arith.select"(%arg1, %1, %2) : (i1, vector<1xi1>, vector<1xi1>) -> vector<1xi1>
    "func.return"(%3) : (vector<1xi1>) -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["func.func"]}> : (!transform.any_op) -> !transform.op<"func.func">
      "transform.apply_patterns"(%0) <{max_iterations = -1 : i64, max_num_rewrites = -1 : i64}> ({
        "transform.apply_patterns.vector.materialize_masks"() : () -> ()
      }) : (!transform.op<"func.func">) -> ()
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

