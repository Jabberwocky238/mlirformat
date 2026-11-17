"builtin.module"() ({
  "func.func"() <{function_type = () -> vector<4xindex>, sym_name = "step_index"}> ({
    %7 = "vector.step"() : () -> vector<4xindex> loc("<stdin>":3:10)
    "func.return"(%7) : (vector<4xindex>) -> () loc("<stdin>":4:5)
  }) : () -> () loc("<stdin>":2:3)
  "func.func"() <{function_type = () -> vector<258xindex>, sym_name = "step_index_wrap"}> ({
    %6 = "vector.step"() : () -> vector<258xindex> loc("<stdin>":7:10)
    "func.return"(%6) : (vector<258xindex>) -> () loc("<stdin>":8:5)
  }) : () -> () loc("<stdin>":6:3)
  "func.func"() <{function_type = () -> vector<4xi8>, sym_name = "step_i8"}> ({
    %5 = "vector.step"() : () -> vector<4xi8> loc("<stdin>":11:10)
    "func.return"(%5) : (vector<4xi8>) -> () loc("<stdin>":12:5)
  }) : () -> () loc("<stdin>":10:3)
  "func.func"() <{function_type = () -> vector<[4]xindex>, sym_name = "step_scalable_index"}> ({
    %4 = "vector.step"() : () -> vector<[4]xindex> loc("<stdin>":15:10)
    "func.return"(%4) : (vector<[4]xindex>) -> () loc("<stdin>":16:5)
  }) : () -> () loc("<stdin>":14:3)
  "func.func"() <{function_type = () -> vector<[4]xi8>, sym_name = "step_scalable_i8"}> ({
    %3 = "vector.step"() : () -> vector<[4]xi8> loc("<stdin>":19:10)
    "func.return"(%3) : (vector<[4]xi8>) -> () loc("<stdin>":20:5)
  }) : () -> () loc("<stdin>":18:3)
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "width64"}> ({
    ^bb0(%arg2: !transform.any_op loc("<stdin>":24:10)):
      %2 = "transform.structured.match"(%arg2) <{ops = ["func.func"]}> : (!transform.any_op) -> !transform.op<"func.func"> loc("<stdin>":25:12)
      "transform.apply_patterns"(%2) <{max_iterations = -1 : i64, max_num_rewrites = -1 : i64}> ({
        "transform.apply_patterns.vector.lower_step"() <{index_bitwidth = 64 : i64}> : () -> () loc("<stdin>":27:9)
      }) : (!transform.op<"func.func">) -> () loc("<stdin>":26:7)
      "transform.yield"() : () -> () loc("<stdin>":29:7)
    }) : () -> () loc("<stdin>":23:5)
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "skip"}> ({
    ^bb0(%arg1: !transform.any_op loc("<stdin>":32:10)):
      %1 = "transform.structured.match"(%arg1) <{ops = ["func.func"]}> : (!transform.any_op) -> !transform.op<"func.func"> loc("<stdin>":33:12)
      "transform.apply_patterns"(%1) <{max_iterations = -1 : i64, max_num_rewrites = -1 : i64}> ({
        "transform.apply_patterns.vector.lower_step"() <{index_bitwidth = 0 : i64}> : () -> () loc("<stdin>":35:9)
      }) : (!transform.op<"func.func">) -> () loc("<stdin>":34:7)
      "transform.yield"() : () -> () loc("<stdin>":37:7)
    }) : () -> () loc("<stdin>":31:5)
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "width8"}> ({
    ^bb0(%arg0: !transform.any_op loc("<stdin>":40:10)):
      %0 = "transform.structured.match"(%arg0) <{ops = ["func.func"]}> : (!transform.any_op) -> !transform.op<"func.func"> loc("<stdin>":41:12)
      "transform.apply_patterns"(%0) <{max_iterations = -1 : i64, max_num_rewrites = -1 : i64}> ({
        "transform.apply_patterns.vector.lower_step"() <{index_bitwidth = 8 : i64}> : () -> () loc("<stdin>":43:9)
      }) : (!transform.op<"func.func">) -> () loc("<stdin>":42:7)
      "transform.yield"() : () -> () loc("<stdin>":45:7)
    }) : () -> () loc("<stdin>":39:5)
  }) {transform.with_named_sequence} : () -> () loc("<stdin>":22:3)
}) : () -> () loc("<stdin>":1:1)
