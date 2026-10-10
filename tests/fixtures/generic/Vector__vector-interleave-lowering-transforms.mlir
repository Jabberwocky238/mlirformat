"builtin.module"() ({
  "func.func"() <{function_type = (vector<2x3xi8>, vector<2x3xi8>) -> vector<2x6xi8>, sym_name = "vector_interleave_2d"}> ({
  ^bb0(%arg7: vector<2x3xi8>, %arg8: vector<2x3xi8>):
    %4 = "vector.interleave"(%arg7, %arg8) : (vector<2x3xi8>, vector<2x3xi8>) -> vector<2x6xi8>
    "func.return"(%4) : (vector<2x6xi8>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<2x[8]xi16>, vector<2x[8]xi16>) -> vector<2x[16]xi16>, sym_name = "vector_interleave_2d_scalable"}> ({
  ^bb0(%arg5: vector<2x[8]xi16>, %arg6: vector<2x[8]xi16>):
    %3 = "vector.interleave"(%arg5, %arg6) : (vector<2x[8]xi16>, vector<2x[8]xi16>) -> vector<2x[16]xi16>
    "func.return"(%3) : (vector<2x[16]xi16>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<1x2x3x4xi64>, vector<1x2x3x4xi64>) -> vector<1x2x3x8xi64>, sym_name = "vector_interleave_4d"}> ({
  ^bb0(%arg3: vector<1x2x3x4xi64>, %arg4: vector<1x2x3x4xi64>):
    %2 = "vector.interleave"(%arg3, %arg4) : (vector<1x2x3x4xi64>, vector<1x2x3x4xi64>) -> vector<1x2x3x8xi64>
    "func.return"(%2) : (vector<1x2x3x8xi64>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<1x3x[2]x2x3x4xf16>, vector<1x3x[2]x2x3x4xf16>) -> vector<1x3x[2]x2x3x8xf16>, sym_name = "vector_interleave_nd_with_scalable_dim"}> ({
  ^bb0(%arg1: vector<1x3x[2]x2x3x4xf16>, %arg2: vector<1x3x[2]x2x3x4xf16>):
    %1 = "vector.interleave"(%arg1, %arg2) : (vector<1x3x[2]x2x3x4xf16>, vector<1x3x[2]x2x3x4xf16>) -> vector<1x3x[2]x2x3x8xf16>
    "func.return"(%1) : (vector<1x3x[2]x2x3x8xf16>) -> ()
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

