"builtin.module"() ({
  "func.func"() <{function_type = (i1) -> vector<1xi1>, sym_name = "select_single_i1_vector"}> ({
  ^bb0(%arg1: i1 loc("<stdin>":3:8)):
    %1 = "arith.constant"() <{value = dense<true> : vector<1xi1>}> : () -> vector<1xi1> loc("<stdin>":4:10)
    %2 = "arith.constant"() <{value = dense<false> : vector<1xi1>}> : () -> vector<1xi1> loc("<stdin>":5:10)
    %3 = "arith.select"(%arg1, %1, %2) : (i1, vector<1xi1>, vector<1xi1>) -> vector<1xi1> loc("<stdin>":6:10)
    "func.return"(%3) : (vector<1xi1>) -> () loc("<stdin>":7:5)
  }) : () -> () loc("<stdin>":2:3)
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op loc("<stdin>":11:10)):
      %0 = "transform.structured.match"(%arg0) <{ops = ["func.func"]}> : (!transform.any_op) -> !transform.op<"func.func"> loc("<stdin>":12:12)
      "transform.apply_patterns"(%0) <{max_iterations = -1 : i64, max_num_rewrites = -1 : i64}> ({
        "transform.apply_patterns.vector.materialize_masks"() : () -> () loc("<stdin>":14:9)
      }) : (!transform.op<"func.func">) -> () loc("<stdin>":13:7)
      "transform.yield"() : () -> () loc("<stdin>":16:7)
    }) : () -> () loc("<stdin>":10:5)
  }) {transform.with_named_sequence} : () -> () loc("<stdin>":9:3)
}) : () -> () loc("<stdin>":1:1)
