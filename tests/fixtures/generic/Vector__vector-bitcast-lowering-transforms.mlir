"builtin.module"() ({
  "func.func"() <{function_type = (vector<i32>) -> vector<f32>, sym_name = "vector_bitcast_0d"}> ({
  ^bb0(%arg6: vector<i32>):
    %6 = "vector.bitcast"(%arg6) : (vector<i32>) -> vector<f32>
    "func.return"(%6) : (vector<f32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<10xi64>) -> vector<20xi32>, sym_name = "vector_bitcast_1d"}> ({
  ^bb0(%arg5: vector<10xi64>):
    %5 = "vector.bitcast"(%arg5) : (vector<10xi64>) -> vector<20xi32>
    "func.return"(%5) : (vector<20xi32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<2x4xi32>) -> vector<2x2xi64>, sym_name = "vector_bitcast_2d"}> ({
  ^bb0(%arg4: vector<2x4xi32>):
    %4 = "vector.bitcast"(%arg4) : (vector<2x4xi32>) -> vector<2x2xi64>
    "func.return"(%4) : (vector<2x2xi64>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<1x2x[3]x4xi64>) -> vector<1x2x[3]x8xi32>, sym_name = "vector_bitcast_4d_with_scalable_dim"}> ({
  ^bb0(%arg3: vector<1x2x[3]x4xi64>):
    %3 = "vector.bitcast"(%arg3) : (vector<1x2x[3]x4xi64>) -> vector<1x2x[3]x8xi32>
    "func.return"(%3) : (vector<1x2x[3]x8xi32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<2x[2]xi64>) -> vector<2x[4]xi32>, sym_name = "vector_bitcast_2d_trailing_scalable_dim"}> ({
  ^bb0(%arg2: vector<2x[2]xi64>):
    %2 = "vector.bitcast"(%arg2) : (vector<2x[2]xi64>) -> vector<2x[4]xi32>
    "func.return"(%2) : (vector<2x[4]xi32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<[2]x2xi64>) -> vector<[2]x4xi32>, sym_name = "negative_vector_bitcast_2d_leading_scalable_dim"}> ({
  ^bb0(%arg1: vector<[2]x2xi64>):
    %1 = "vector.bitcast"(%arg1) : (vector<[2]x2xi64>) -> vector<[2]x4xi32>
    "func.return"(%1) : (vector<[2]x4xi32>) -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["func.func"]}> : (!transform.any_op) -> !transform.any_op
      "transform.apply_patterns"(%0) <{max_iterations = -1 : i64, max_num_rewrites = -1 : i64}> ({
        "transform.apply_patterns.vector.lower_bitcast"() : () -> ()
      }) : (!transform.any_op) -> ()
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

