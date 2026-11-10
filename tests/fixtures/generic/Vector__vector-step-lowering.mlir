"builtin.module"() ({
  "func.func"() <{function_type = () -> vector<4xindex>, sym_name = "step_index"}> ({
    %7 = "vector.step"() : () -> vector<4xindex>
    "func.return"(%7) : (vector<4xindex>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> vector<258xindex>, sym_name = "step_index_wrap"}> ({
    %6 = "vector.step"() : () -> vector<258xindex>
    "func.return"(%6) : (vector<258xindex>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> vector<4xi8>, sym_name = "step_i8"}> ({
    %5 = "vector.step"() : () -> vector<4xi8>
    "func.return"(%5) : (vector<4xi8>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> vector<[4]xindex>, sym_name = "step_scalable_index"}> ({
    %4 = "vector.step"() : () -> vector<[4]xindex>
    "func.return"(%4) : (vector<[4]xindex>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> vector<[4]xi8>, sym_name = "step_scalable_i8"}> ({
    %3 = "vector.step"() : () -> vector<[4]xi8>
    "func.return"(%3) : (vector<[4]xi8>) -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "width64"}> ({
    ^bb0(%arg2: !transform.any_op):
      %2 = "transform.structured.match"(%arg2) <{ops = ["func.func"]}> : (!transform.any_op) -> !transform.op<"func.func">
      "transform.apply_patterns"(%2) <{max_iterations = -1 : i64, max_num_rewrites = -1 : i64}> ({
        "transform.apply_patterns.vector.lower_step"() <{index_bitwidth = 64 : i64}> : () -> ()
      }) : (!transform.op<"func.func">) -> ()
      "transform.yield"() : () -> ()
    }) : () -> ()
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "skip"}> ({
    ^bb0(%arg1: !transform.any_op):
      %1 = "transform.structured.match"(%arg1) <{ops = ["func.func"]}> : (!transform.any_op) -> !transform.op<"func.func">
      "transform.apply_patterns"(%1) <{max_iterations = -1 : i64, max_num_rewrites = -1 : i64}> ({
        "transform.apply_patterns.vector.lower_step"() <{index_bitwidth = 0 : i64}> : () -> ()
      }) : (!transform.op<"func.func">) -> ()
      "transform.yield"() : () -> ()
    }) : () -> ()
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "width8"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["func.func"]}> : (!transform.any_op) -> !transform.op<"func.func">
      "transform.apply_patterns"(%0) <{max_iterations = -1 : i64, max_num_rewrites = -1 : i64}> ({
        "transform.apply_patterns.vector.lower_step"() <{index_bitwidth = 8 : i64}> : () -> ()
      }) : (!transform.op<"func.func">) -> ()
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

