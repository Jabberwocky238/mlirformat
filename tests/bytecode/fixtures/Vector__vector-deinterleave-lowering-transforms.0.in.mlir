"builtin.module"() ({
  "func.func"() <{function_type = (vector<2x8xi32>) -> (vector<2x4xi32>, vector<2x4xi32>), sym_name = "vector_deinterleave_2d"}> ({
  ^bb0(%arg4: vector<2x8xi32> loc("<stdin>":3:8)):
    %4:2 = "vector.deinterleave"(%arg4) : (vector<2x8xi32>) -> (vector<2x4xi32>, vector<2x4xi32>) loc("<stdin>":4:12)
    "func.return"(%4#0, %4#1) : (vector<2x4xi32>, vector<2x4xi32>) -> () loc("<stdin>":5:5)
  }) : () -> () loc("<stdin>":2:3)
  "func.func"() <{function_type = (vector<2x[8]xi32>) -> (vector<2x[4]xi32>, vector<2x[4]xi32>), sym_name = "vector_deinterleave_2d_scalable"}> ({
  ^bb0(%arg3: vector<2x[8]xi32> loc("<stdin>":8:8)):
    %3:2 = "vector.deinterleave"(%arg3) : (vector<2x[8]xi32>) -> (vector<2x[4]xi32>, vector<2x[4]xi32>) loc("<stdin>":9:12)
    "func.return"(%3#0, %3#1) : (vector<2x[4]xi32>, vector<2x[4]xi32>) -> () loc("<stdin>":10:5)
  }) : () -> () loc("<stdin>":7:3)
  "func.func"() <{function_type = (vector<1x2x3x8xi64>) -> (vector<1x2x3x4xi64>, vector<1x2x3x4xi64>), sym_name = "vector_deinterleave_4d"}> ({
  ^bb0(%arg2: vector<1x2x3x8xi64> loc("<stdin>":13:8)):
    %2:2 = "vector.deinterleave"(%arg2) : (vector<1x2x3x8xi64>) -> (vector<1x2x3x4xi64>, vector<1x2x3x4xi64>) loc("<stdin>":14:12)
    "func.return"(%2#0, %2#1) : (vector<1x2x3x4xi64>, vector<1x2x3x4xi64>) -> () loc("<stdin>":15:5)
  }) : () -> () loc("<stdin>":12:3)
  "func.func"() <{function_type = (vector<1x3x[2]x2x3x8xf16>) -> (vector<1x3x[2]x2x3x4xf16>, vector<1x3x[2]x2x3x4xf16>), sym_name = "vector_deinterleave_nd_with_scalable_dim"}> ({
  ^bb0(%arg1: vector<1x3x[2]x2x3x8xf16> loc("<stdin>":18:8)):
    %1:2 = "vector.deinterleave"(%arg1) : (vector<1x3x[2]x2x3x8xf16>) -> (vector<1x3x[2]x2x3x4xf16>, vector<1x3x[2]x2x3x4xf16>) loc("<stdin>":19:12)
    "func.return"(%1#0, %1#1) : (vector<1x3x[2]x2x3x4xf16>, vector<1x3x[2]x2x3x4xf16>) -> () loc("<stdin>":20:5)
  }) : () -> () loc("<stdin>":17:3)
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op loc("<stdin>":24:10)):
      %0 = "transform.structured.match"(%arg0) <{ops = ["func.func"]}> : (!transform.any_op) -> !transform.any_op loc("<stdin>":25:12)
      "transform.apply_patterns"(%0) <{max_iterations = -1 : i64, max_num_rewrites = -1 : i64}> ({
        "transform.apply_patterns.vector.lower_interleave"() : () -> () loc("<stdin>":27:9)
      }) : (!transform.any_op) -> () loc("<stdin>":26:7)
      "transform.yield"() : () -> () loc("<stdin>":29:7)
    }) : () -> () loc("<stdin>":23:5)
  }) {transform.with_named_sequence} : () -> () loc("<stdin>":22:3)
}) : () -> () loc("<stdin>":1:1)
