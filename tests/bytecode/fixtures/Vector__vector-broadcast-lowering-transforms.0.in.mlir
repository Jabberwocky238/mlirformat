"builtin.module"() ({
  "func.func"() <{function_type = (f32) -> vector<2xf32>, sym_name = "broadcast_vec1d_from_scalar"}> ({
  ^bb0(%arg15: f32 loc("<stdin>":3:8)):
    %15 = "vector.broadcast"(%arg15) : (f32) -> vector<2xf32> loc("<stdin>":4:11)
    "func.return"(%15) : (vector<2xf32>) -> () loc("<stdin>":5:5)
  }) : () -> () loc("<stdin>":2:3)
  "func.func"() <{function_type = (f32) -> vector<2x3xf32>, sym_name = "broadcast_vec2d_from_scalar"}> ({
  ^bb0(%arg14: f32 loc("<stdin>":8:8)):
    %14 = "vector.broadcast"(%arg14) : (f32) -> vector<2x3xf32> loc("<stdin>":9:11)
    "func.return"(%14) : (vector<2x3xf32>) -> () loc("<stdin>":10:5)
  }) : () -> () loc("<stdin>":7:3)
  "func.func"() <{function_type = (f32) -> vector<2x3x4xf32>, sym_name = "broadcast_vec3d_from_scalar"}> ({
  ^bb0(%arg13: f32 loc("<stdin>":13:8)):
    %13 = "vector.broadcast"(%arg13) : (f32) -> vector<2x3x4xf32> loc("<stdin>":14:11)
    "func.return"(%13) : (vector<2x3x4xf32>) -> () loc("<stdin>":15:5)
  }) : () -> () loc("<stdin>":12:3)
  "func.func"() <{function_type = (vector<2xf32>) -> vector<2xf32>, sym_name = "broadcast_vec1d_from_vec1d"}> ({
  ^bb0(%arg12: vector<2xf32> loc("<stdin>":18:8)):
    %12 = "vector.broadcast"(%arg12) : (vector<2xf32>) -> vector<2xf32> loc("<stdin>":19:11)
    "func.return"(%12) : (vector<2xf32>) -> () loc("<stdin>":20:5)
  }) : () -> () loc("<stdin>":17:3)
  "func.func"() <{function_type = (vector<2xf32>) -> vector<3x2xf32>, sym_name = "broadcast_vec2d_from_vec1d"}> ({
  ^bb0(%arg11: vector<2xf32> loc("<stdin>":23:8)):
    %11 = "vector.broadcast"(%arg11) : (vector<2xf32>) -> vector<3x2xf32> loc("<stdin>":24:11)
    "func.return"(%11) : (vector<3x2xf32>) -> () loc("<stdin>":25:5)
  }) : () -> () loc("<stdin>":22:3)
  "func.func"() <{function_type = (vector<2xf32>) -> vector<4x3x2xf32>, sym_name = "broadcast_vec3d_from_vec1d"}> ({
  ^bb0(%arg10: vector<2xf32> loc("<stdin>":28:8)):
    %10 = "vector.broadcast"(%arg10) : (vector<2xf32>) -> vector<4x3x2xf32> loc("<stdin>":29:11)
    "func.return"(%10) : (vector<4x3x2xf32>) -> () loc("<stdin>":30:5)
  }) : () -> () loc("<stdin>":27:3)
  "func.func"() <{function_type = (vector<3x2xf32>) -> vector<4x3x2xf32>, sym_name = "broadcast_vec3d_from_vec2d"}> ({
  ^bb0(%arg9: vector<3x2xf32> loc("<stdin>":33:8)):
    %9 = "vector.broadcast"(%arg9) : (vector<3x2xf32>) -> vector<4x3x2xf32> loc("<stdin>":34:10)
    "func.return"(%9) : (vector<4x3x2xf32>) -> () loc("<stdin>":35:5)
  }) : () -> () loc("<stdin>":32:3)
  "func.func"() <{function_type = (vector<1xf32>) -> vector<4xf32>, sym_name = "broadcast_stretch"}> ({
  ^bb0(%arg8: vector<1xf32> loc("<stdin>":38:8)):
    %8 = "vector.broadcast"(%arg8) : (vector<1xf32>) -> vector<4xf32> loc("<stdin>":39:10)
    "func.return"(%8) : (vector<4xf32>) -> () loc("<stdin>":40:5)
  }) : () -> () loc("<stdin>":37:3)
  "func.func"() <{function_type = (vector<1xf32>) -> vector<16x1xf32>, sym_name = "broadcast_vec2d_from_vec1d_single_element"}> ({
  ^bb0(%arg7: vector<1xf32> loc("<stdin>":43:8)):
    %7 = "vector.broadcast"(%arg7) : (vector<1xf32>) -> vector<16x1xf32> loc("<stdin>":44:10)
    "func.return"(%7) : (vector<16x1xf32>) -> () loc("<stdin>":45:5)
  }) : () -> () loc("<stdin>":42:3)
  "func.func"() <{function_type = (vector<1x1xf32>) -> vector<4x3xf32>, sym_name = "broadcast_vec2d_from_vec2d_single_element"}> ({
  ^bb0(%arg6: vector<1x1xf32> loc("<stdin>":48:8)):
    %6 = "vector.broadcast"(%arg6) : (vector<1x1xf32>) -> vector<4x3xf32> loc("<stdin>":49:10)
    "func.return"(%6) : (vector<4x3xf32>) -> () loc("<stdin>":50:5)
  }) : () -> () loc("<stdin>":47:3)
  "func.func"() <{function_type = (vector<[1]xf32>) -> vector<4x[1]xf32>, sym_name = "broadcast_vec2d_from_vec1d_unit_scalable_dim"}> ({
  ^bb0(%arg5: vector<[1]xf32> loc("<stdin>":53:8)):
    %5 = "vector.broadcast"(%arg5) : (vector<[1]xf32>) -> vector<4x[1]xf32> loc("<stdin>":54:10)
    "func.return"(%5) : (vector<4x[1]xf32>) -> () loc("<stdin>":55:5)
  }) : () -> () loc("<stdin>":52:3)
  "func.func"() <{function_type = (vector<1x4xf32>) -> vector<3x4xf32>, sym_name = "broadcast_stretch_at_start"}> ({
  ^bb0(%arg4: vector<1x4xf32> loc("<stdin>":58:8)):
    %4 = "vector.broadcast"(%arg4) : (vector<1x4xf32>) -> vector<3x4xf32> loc("<stdin>":59:10)
    "func.return"(%4) : (vector<3x4xf32>) -> () loc("<stdin>":60:5)
  }) : () -> () loc("<stdin>":57:3)
  "func.func"() <{function_type = (vector<4x1xf32>) -> vector<4x3xf32>, sym_name = "broadcast_stretch_at_end"}> ({
  ^bb0(%arg3: vector<4x1xf32> loc("<stdin>":63:8)):
    %3 = "vector.broadcast"(%arg3) : (vector<4x1xf32>) -> vector<4x3xf32> loc("<stdin>":64:10)
    "func.return"(%3) : (vector<4x3xf32>) -> () loc("<stdin>":65:5)
  }) : () -> () loc("<stdin>":62:3)
  "func.func"() <{function_type = (vector<4x1x2xf32>) -> vector<4x3x2xf32>, sym_name = "broadcast_stretch_in_middle"}> ({
  ^bb0(%arg2: vector<4x1x2xf32> loc("<stdin>":68:8)):
    %2 = "vector.broadcast"(%arg2) : (vector<4x1x2xf32>) -> vector<4x3x2xf32> loc("<stdin>":69:10)
    "func.return"(%2) : (vector<4x3x2xf32>) -> () loc("<stdin>":70:5)
  }) : () -> () loc("<stdin>":67:3)
  "func.func"() <{function_type = (vector<[32]xf32>) -> vector<1x[32]xf32>, sym_name = "broadcast_scalable_duplication"}> ({
  ^bb0(%arg1: vector<[32]xf32> loc("<stdin>":73:8)):
    %1 = "vector.broadcast"(%arg1) : (vector<[32]xf32>) -> vector<1x[32]xf32> loc("<stdin>":74:10)
    "func.return"(%1) : (vector<1x[32]xf32>) -> () loc("<stdin>":75:5)
  }) : () -> () loc("<stdin>":72:3)
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op loc("<stdin>":79:10)):
      %0 = "transform.structured.match"(%arg0) <{ops = ["func.func"]}> : (!transform.any_op) -> !transform.any_op loc("<stdin>":80:12)
      "transform.apply_patterns"(%0) <{max_iterations = -1 : i64, max_num_rewrites = -1 : i64}> ({
        "transform.apply_patterns.vector.lower_broadcast"() : () -> () loc("<stdin>":82:9)
      }) : (!transform.any_op) -> () loc("<stdin>":81:7)
      "transform.yield"() : () -> () loc("<stdin>":84:7)
    }) : () -> () loc("<stdin>":78:5)
  }) {transform.with_named_sequence} : () -> () loc("<stdin>":77:3)
}) : () -> () loc("<stdin>":1:1)
