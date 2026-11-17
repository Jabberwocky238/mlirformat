"builtin.module"() ({
  "func.func"() <{function_type = (vector<7xi16>, vector<7xi16>) -> vector<14xi16>, sym_name = "vector_interleave_to_shuffle_1d"}> ({
  ^bb0(%arg11: vector<7xi16> loc("<stdin>":3:8), %arg12: vector<7xi16> loc("<stdin>":3:31)):
    %8 = "vector.interleave"(%arg11, %arg12) : (vector<7xi16>, vector<7xi16>) -> vector<14xi16> loc("<stdin>":4:10)
    "func.return"(%8) : (vector<14xi16>) -> () loc("<stdin>":5:5)
  }) : () -> () loc("<stdin>":2:3)
  "func.func"() <{function_type = (vector<f32>, vector<f32>) -> vector<2xf32>, sym_name = "vector_interleave_to_shuffle_0d"}> ({
  ^bb0(%arg9: vector<f32> loc("<stdin>":8:8), %arg10: vector<f32> loc("<stdin>":8:28)):
    %7 = "vector.interleave"(%arg9, %arg10) : (vector<f32>, vector<f32>) -> vector<2xf32> loc("<stdin>":9:10)
    "func.return"(%7) : (vector<2xf32>) -> () loc("<stdin>":10:5)
  }) : () -> () loc("<stdin>":7:3)
  "func.func"() <{function_type = (vector<14xi16>) -> (vector<7xi16>, vector<7xi16>), sym_name = "vector_deinterleave_to_shuffle_1d"}> ({
  ^bb0(%arg8: vector<14xi16> loc("<stdin>":13:8)):
    %6:2 = "vector.deinterleave"(%arg8) : (vector<14xi16>) -> (vector<7xi16>, vector<7xi16>) loc("<stdin>":14:12)
    "func.return"(%6#0, %6#1) : (vector<7xi16>, vector<7xi16>) -> () loc("<stdin>":15:5)
  }) : () -> () loc("<stdin>":12:3)
  "func.func"() <{function_type = (vector<2xi32>) -> (vector<1xi32>, vector<1xi32>), sym_name = "vector_deinterleave_size2"}> ({
  ^bb0(%arg7: vector<2xi32> loc("<stdin>":18:8)):
    %5:2 = "vector.deinterleave"(%arg7) : (vector<2xi32>) -> (vector<1xi32>, vector<1xi32>) loc("<stdin>":19:12)
    "func.return"(%5#0, %5#1) : (vector<1xi32>, vector<1xi32>) -> () loc("<stdin>":20:5)
  }) : () -> () loc("<stdin>":17:3)
  "func.func"() <{function_type = (vector<[4]xi32>, vector<[4]xi32>, vector<2x4xi32>, vector<2x4xi32>, vector<[8]xi32>, vector<2x8xi32>) -> (vector<[8]xi32>, vector<2x8xi32>, vector<[4]xi32>, vector<[4]xi32>, vector<2x4xi32>, vector<2x4xi32>), sym_name = "negative_cases"}> ({
  ^bb0(%arg1: vector<[4]xi32> loc("<stdin>":23:8), %arg2: vector<[4]xi32> loc("<stdin>":23:32), %arg3: vector<2x4xi32> loc("<stdin>":23:56), %arg4: vector<2x4xi32> loc("<stdin>":23:80), %arg5: vector<[8]xi32> loc("<stdin>":23:104), %arg6: vector<2x8xi32> loc("<stdin>":23:128)):
    %1 = "vector.interleave"(%arg1, %arg2) : (vector<[4]xi32>, vector<[4]xi32>) -> vector<[8]xi32> loc("<stdin>":24:10)
    %2 = "vector.interleave"(%arg3, %arg4) : (vector<2x4xi32>, vector<2x4xi32>) -> vector<2x8xi32> loc("<stdin>":25:10)
    %3:2 = "vector.deinterleave"(%arg5) : (vector<[8]xi32>) -> (vector<[4]xi32>, vector<[4]xi32>) loc("<stdin>":26:12)
    %4:2 = "vector.deinterleave"(%arg6) : (vector<2x8xi32>) -> (vector<2x4xi32>, vector<2x4xi32>) loc("<stdin>":27:12)
    "func.return"(%1, %2, %3#0, %3#1, %4#0, %4#1) : (vector<[8]xi32>, vector<2x8xi32>, vector<[4]xi32>, vector<[4]xi32>, vector<2x4xi32>, vector<2x4xi32>) -> () loc("<stdin>":28:5)
  }) : () -> () loc("<stdin>":22:3)
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op loc("<stdin>":32:10)):
      %0 = "transform.structured.match"(%arg0) <{ops = ["func.func"]}> : (!transform.any_op) -> !transform.any_op loc("<stdin>":33:12)
      "transform.apply_patterns"(%0) <{max_iterations = -1 : i64, max_num_rewrites = -1 : i64}> ({
        "transform.apply_patterns.vector.interleave_and_deinterleave_to_shuffle"() : () -> () loc("<stdin>":35:9)
      }) : (!transform.any_op) -> () loc("<stdin>":34:7)
      "transform.yield"() : () -> () loc("<stdin>":37:7)
    }) : () -> () loc("<stdin>":31:5)
  }) {transform.with_named_sequence} : () -> () loc("<stdin>":30:3)
}) : () -> () loc("<stdin>":1:1)
