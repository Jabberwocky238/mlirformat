"builtin.module"() ({
  "func.func"() <{function_type = (f32) -> vector<2xf32>, sym_name = "broadcast_vec1d_from_scalar"}> ({
  ^bb0(%arg12: f32):
    %12 = "vector.broadcast"(%arg12) : (f32) -> vector<2xf32>
    "func.return"(%12) : (vector<2xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (f32) -> vector<2x3xf32>, sym_name = "broadcast_vec2d_from_scalar"}> ({
  ^bb0(%arg11: f32):
    %11 = "vector.broadcast"(%arg11) : (f32) -> vector<2x3xf32>
    "func.return"(%11) : (vector<2x3xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (f32) -> vector<2x3x4xf32>, sym_name = "broadcast_vec3d_from_scalar"}> ({
  ^bb0(%arg10: f32):
    %10 = "vector.broadcast"(%arg10) : (f32) -> vector<2x3x4xf32>
    "func.return"(%10) : (vector<2x3x4xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<2xf32>) -> vector<2xf32>, sym_name = "broadcast_vec1d_from_vec1d"}> ({
  ^bb0(%arg9: vector<2xf32>):
    %9 = "vector.broadcast"(%arg9) : (vector<2xf32>) -> vector<2xf32>
    "func.return"(%9) : (vector<2xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<2xf32>) -> vector<3x2xf32>, sym_name = "broadcast_vec2d_from_vec1d"}> ({
  ^bb0(%arg8: vector<2xf32>):
    %8 = "vector.broadcast"(%arg8) : (vector<2xf32>) -> vector<3x2xf32>
    "func.return"(%8) : (vector<3x2xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<2xf32>) -> vector<4x3x2xf32>, sym_name = "broadcast_vec3d_from_vec1d"}> ({
  ^bb0(%arg7: vector<2xf32>):
    %7 = "vector.broadcast"(%arg7) : (vector<2xf32>) -> vector<4x3x2xf32>
    "func.return"(%7) : (vector<4x3x2xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<3x2xf32>) -> vector<4x3x2xf32>, sym_name = "broadcast_vec3d_from_vec2d"}> ({
  ^bb0(%arg6: vector<3x2xf32>):
    %6 = "vector.broadcast"(%arg6) : (vector<3x2xf32>) -> vector<4x3x2xf32>
    "func.return"(%6) : (vector<4x3x2xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<1xf32>) -> vector<4xf32>, sym_name = "broadcast_stretch"}> ({
  ^bb0(%arg5: vector<1xf32>):
    %5 = "vector.broadcast"(%arg5) : (vector<1xf32>) -> vector<4xf32>
    "func.return"(%5) : (vector<4xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<1x4xf32>) -> vector<3x4xf32>, sym_name = "broadcast_stretch_at_start"}> ({
  ^bb0(%arg4: vector<1x4xf32>):
    %4 = "vector.broadcast"(%arg4) : (vector<1x4xf32>) -> vector<3x4xf32>
    "func.return"(%4) : (vector<3x4xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<4x1xf32>) -> vector<4x3xf32>, sym_name = "broadcast_stretch_at_end"}> ({
  ^bb0(%arg3: vector<4x1xf32>):
    %3 = "vector.broadcast"(%arg3) : (vector<4x1xf32>) -> vector<4x3xf32>
    "func.return"(%3) : (vector<4x3xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<4x1x2xf32>) -> vector<4x3x2xf32>, sym_name = "broadcast_stretch_in_middle"}> ({
  ^bb0(%arg2: vector<4x1x2xf32>):
    %2 = "vector.broadcast"(%arg2) : (vector<4x1x2xf32>) -> vector<4x3x2xf32>
    "func.return"(%2) : (vector<4x3x2xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<[32]xf32>) -> vector<1x[32]xf32>, sym_name = "broadcast_scalable_duplication"}> ({
  ^bb0(%arg1: vector<[32]xf32>):
    %1 = "vector.broadcast"(%arg1) : (vector<[32]xf32>) -> vector<1x[32]xf32>
    "func.return"(%1) : (vector<1x[32]xf32>) -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["func.func"]}> : (!transform.any_op) -> !transform.any_op
      "transform.apply_patterns"(%0) <{max_iterations = -1 : i64, max_num_rewrites = -1 : i64}> ({
        "transform.apply_patterns.vector.lower_broadcast"() : () -> ()
      }) : (!transform.any_op) -> ()
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

