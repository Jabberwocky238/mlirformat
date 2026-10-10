"builtin.module"() ({
  "func.func"() <{function_type = (vector<2x8xi32>) -> (vector<2x4xi32>, vector<2x4xi32>), sym_name = "vector_deinterleave_2d"}> ({
  ^bb0(%arg4: vector<2x8xi32>):
    %4:2 = "vector.deinterleave"(%arg4) : (vector<2x8xi32>) -> (vector<2x4xi32>, vector<2x4xi32>)
    "func.return"(%4#0, %4#1) : (vector<2x4xi32>, vector<2x4xi32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<2x[8]xi32>) -> (vector<2x[4]xi32>, vector<2x[4]xi32>), sym_name = "vector_deinterleave_2d_scalable"}> ({
  ^bb0(%arg3: vector<2x[8]xi32>):
    %3:2 = "vector.deinterleave"(%arg3) : (vector<2x[8]xi32>) -> (vector<2x[4]xi32>, vector<2x[4]xi32>)
    "func.return"(%3#0, %3#1) : (vector<2x[4]xi32>, vector<2x[4]xi32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<1x2x3x8xi64>) -> (vector<1x2x3x4xi64>, vector<1x2x3x4xi64>), sym_name = "vector_deinterleave_4d"}> ({
  ^bb0(%arg2: vector<1x2x3x8xi64>):
    %2:2 = "vector.deinterleave"(%arg2) : (vector<1x2x3x8xi64>) -> (vector<1x2x3x4xi64>, vector<1x2x3x4xi64>)
    "func.return"(%2#0, %2#1) : (vector<1x2x3x4xi64>, vector<1x2x3x4xi64>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<1x3x[2]x2x3x8xf16>) -> (vector<1x3x[2]x2x3x4xf16>, vector<1x3x[2]x2x3x4xf16>), sym_name = "vector_deinterleave_nd_with_scalable_dim"}> ({
  ^bb0(%arg1: vector<1x3x[2]x2x3x8xf16>):
    %1:2 = "vector.deinterleave"(%arg1) : (vector<1x3x[2]x2x3x8xf16>) -> (vector<1x3x[2]x2x3x4xf16>, vector<1x3x[2]x2x3x4xf16>)
    "func.return"(%1#0, %1#1) : (vector<1x3x[2]x2x3x4xf16>, vector<1x3x[2]x2x3x4xf16>) -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["func.func"]}> : (!transform.any_op) -> !transform.any_op
      "transform.apply_patterns"(%0) <{max_iterations = -1 : i64, max_num_rewrites = -1 : i64}> ({
        "transform.apply_patterns.vector.lower_interleave"() : () -> ()
      }) : (!transform.any_op) -> ()
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

