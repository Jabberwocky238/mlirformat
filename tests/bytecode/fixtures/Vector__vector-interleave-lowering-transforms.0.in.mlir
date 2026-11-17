"builtin.module"() ({
  "func.func"() <{function_type = (vector<2x3xi8>, vector<2x3xi8>) -> vector<2x6xi8>, sym_name = "vector_interleave_2d"}> ({
  ^bb0(%arg7: vector<2x3xi8> loc("<stdin>":3:8), %arg8: vector<2x3xi8> loc("<stdin>":3:31)):
    %4 = "vector.interleave"(%arg7, %arg8) : (vector<2x3xi8>, vector<2x3xi8>) -> vector<2x6xi8> loc("<stdin>":4:10)
    "func.return"(%4) : (vector<2x6xi8>) -> () loc("<stdin>":5:5)
  }) : () -> () loc("<stdin>":2:3)
  "func.func"() <{function_type = (vector<2x[8]xi16>, vector<2x[8]xi16>) -> vector<2x[16]xi16>, sym_name = "vector_interleave_2d_scalable"}> ({
  ^bb0(%arg5: vector<2x[8]xi16> loc("<stdin>":8:8), %arg6: vector<2x[8]xi16> loc("<stdin>":8:34)):
    %3 = "vector.interleave"(%arg5, %arg6) : (vector<2x[8]xi16>, vector<2x[8]xi16>) -> vector<2x[16]xi16> loc("<stdin>":9:10)
    "func.return"(%3) : (vector<2x[16]xi16>) -> () loc("<stdin>":10:5)
  }) : () -> () loc("<stdin>":7:3)
  "func.func"() <{function_type = (vector<1x2x3x4xi64>, vector<1x2x3x4xi64>) -> vector<1x2x3x8xi64>, sym_name = "vector_interleave_4d"}> ({
  ^bb0(%arg3: vector<1x2x3x4xi64> loc("<stdin>":13:8), %arg4: vector<1x2x3x4xi64> loc("<stdin>":13:36)):
    %2 = "vector.interleave"(%arg3, %arg4) : (vector<1x2x3x4xi64>, vector<1x2x3x4xi64>) -> vector<1x2x3x8xi64> loc("<stdin>":14:10)
    "func.return"(%2) : (vector<1x2x3x8xi64>) -> () loc("<stdin>":15:5)
  }) : () -> () loc("<stdin>":12:3)
  "func.func"() <{function_type = (vector<1x3x[2]x2x3x4xf16>, vector<1x3x[2]x2x3x4xf16>) -> vector<1x3x[2]x2x3x8xf16>, sym_name = "vector_interleave_nd_with_scalable_dim"}> ({
  ^bb0(%arg1: vector<1x3x[2]x2x3x4xf16> loc("<stdin>":18:8), %arg2: vector<1x3x[2]x2x3x4xf16> loc("<stdin>":18:42)):
    %1 = "vector.interleave"(%arg1, %arg2) : (vector<1x3x[2]x2x3x4xf16>, vector<1x3x[2]x2x3x4xf16>) -> vector<1x3x[2]x2x3x8xf16> loc("<stdin>":19:10)
    "func.return"(%1) : (vector<1x3x[2]x2x3x8xf16>) -> () loc("<stdin>":20:5)
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
