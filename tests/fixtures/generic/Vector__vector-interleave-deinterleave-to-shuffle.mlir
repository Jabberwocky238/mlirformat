"builtin.module"() ({
  "func.func"() <{function_type = (vector<7xi16>, vector<7xi16>) -> vector<14xi16>, sym_name = "vector_interleave_to_shuffle_1d"}> ({
  ^bb0(%arg11: vector<7xi16>, %arg12: vector<7xi16>):
    %8 = "vector.interleave"(%arg11, %arg12) : (vector<7xi16>, vector<7xi16>) -> vector<14xi16>
    "func.return"(%8) : (vector<14xi16>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<f32>, vector<f32>) -> vector<2xf32>, sym_name = "vector_interleave_to_shuffle_0d"}> ({
  ^bb0(%arg9: vector<f32>, %arg10: vector<f32>):
    %7 = "vector.interleave"(%arg9, %arg10) : (vector<f32>, vector<f32>) -> vector<2xf32>
    "func.return"(%7) : (vector<2xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<14xi16>) -> (vector<7xi16>, vector<7xi16>), sym_name = "vector_deinterleave_to_shuffle_1d"}> ({
  ^bb0(%arg8: vector<14xi16>):
    %6:2 = "vector.deinterleave"(%arg8) : (vector<14xi16>) -> (vector<7xi16>, vector<7xi16>)
    "func.return"(%6#0, %6#1) : (vector<7xi16>, vector<7xi16>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<2xi32>) -> (vector<1xi32>, vector<1xi32>), sym_name = "vector_deinterleave_size2"}> ({
  ^bb0(%arg7: vector<2xi32>):
    %5:2 = "vector.deinterleave"(%arg7) : (vector<2xi32>) -> (vector<1xi32>, vector<1xi32>)
    "func.return"(%5#0, %5#1) : (vector<1xi32>, vector<1xi32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<[4]xi32>, vector<[4]xi32>, vector<2x4xi32>, vector<2x4xi32>, vector<[8]xi32>, vector<2x8xi32>) -> (vector<[8]xi32>, vector<2x8xi32>, vector<[4]xi32>, vector<[4]xi32>, vector<2x4xi32>, vector<2x4xi32>), sym_name = "negative_cases"}> ({
  ^bb0(%arg1: vector<[4]xi32>, %arg2: vector<[4]xi32>, %arg3: vector<2x4xi32>, %arg4: vector<2x4xi32>, %arg5: vector<[8]xi32>, %arg6: vector<2x8xi32>):
    %1 = "vector.interleave"(%arg1, %arg2) : (vector<[4]xi32>, vector<[4]xi32>) -> vector<[8]xi32>
    %2 = "vector.interleave"(%arg3, %arg4) : (vector<2x4xi32>, vector<2x4xi32>) -> vector<2x8xi32>
    %3:2 = "vector.deinterleave"(%arg5) : (vector<[8]xi32>) -> (vector<[4]xi32>, vector<[4]xi32>)
    %4:2 = "vector.deinterleave"(%arg6) : (vector<2x8xi32>) -> (vector<2x4xi32>, vector<2x4xi32>)
    "func.return"(%1, %2, %3#0, %3#1, %4#0, %4#1) : (vector<[8]xi32>, vector<2x8xi32>, vector<[4]xi32>, vector<[4]xi32>, vector<2x4xi32>, vector<2x4xi32>) -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["func.func"]}> : (!transform.any_op) -> !transform.any_op
      "transform.apply_patterns"(%0) <{max_iterations = -1 : i64, max_num_rewrites = -1 : i64}> ({
        "transform.apply_patterns.vector.interleave_and_deinterleave_to_shuffle"() : () -> ()
      }) : (!transform.any_op) -> ()
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

