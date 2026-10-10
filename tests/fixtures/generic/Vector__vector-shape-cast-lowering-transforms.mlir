"builtin.module"() ({
  "func.func"() <{function_type = (vector<16xf32>) -> vector<16xf32>, sym_name = "nop_shape_cast"}> ({
  ^bb0(%arg18: vector<16xf32>):
    %19 = "vector.shape_cast"(%arg18) : (vector<16xf32>) -> vector<16xf32>
    "func.return"(%19) : (vector<16xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<16xf32>) -> vector<16xf32>, sym_name = "cancel_shape_cast"}> ({
  ^bb0(%arg17: vector<16xf32>):
    %17 = "vector.shape_cast"(%arg17) : (vector<16xf32>) -> vector<4x4xf32>
    %18 = "vector.shape_cast"(%17) : (vector<4x4xf32>) -> vector<16xf32>
    "func.return"(%18) : (vector<16xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<2x2xf32>) -> vector<4xf32>, sym_name = "shape_cast_2d1d"}> ({
  ^bb0(%arg16: vector<2x2xf32>):
    %16 = "vector.shape_cast"(%arg16) : (vector<2x2xf32>) -> vector<4xf32>
    "func.return"(%16) : (vector<4xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<1x3x2xf32>) -> vector<6xf32>, sym_name = "shape_cast_3d1d"}> ({
  ^bb0(%arg15: vector<1x3x2xf32>):
    %15 = "vector.shape_cast"(%arg15) : (vector<1x3x2xf32>) -> vector<6xf32>
    "func.return"(%15) : (vector<6xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<4xf32>) -> vector<2x2xf32>, sym_name = "shape_cast_1d2d"}> ({
  ^bb0(%arg14: vector<4xf32>):
    %14 = "vector.shape_cast"(%arg14) : (vector<4xf32>) -> vector<2x2xf32>
    "func.return"(%14) : (vector<2x2xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<6xf32>) -> vector<2x1x3xf32>, sym_name = "shape_cast_1d3d"}> ({
  ^bb0(%arg13: vector<6xf32>):
    %13 = "vector.shape_cast"(%arg13) : (vector<6xf32>) -> vector<2x1x3xf32>
    "func.return"(%13) : (vector<2x1x3xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<3x2xf32>) -> vector<2x3xf32>, sym_name = "shape_cast_2d2d"}> ({
  ^bb0(%arg12: vector<3x2xf32>):
    %12 = "vector.shape_cast"(%arg12) : (vector<3x2xf32>) -> vector<2x3xf32>
    "func.return"(%12) : (vector<2x3xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<f32>) -> vector<1xf32>, sym_name = "shape_cast_0d1d"}> ({
  ^bb0(%arg11: vector<f32>):
    %11 = "vector.shape_cast"(%arg11) : (vector<f32>) -> vector<1xf32>
    "func.return"(%11) : (vector<1xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<1xf32>) -> vector<f32>, sym_name = "shape_cast_1d0d"}> ({
  ^bb0(%arg10: vector<1xf32>):
    %10 = "vector.shape_cast"(%arg10) : (vector<1xf32>) -> vector<f32>
    "func.return"(%10) : (vector<f32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<1x2x3xf32>) -> vector<2x3xf32>, sym_name = "squeeze_out_prefix_unit_dim"}> ({
  ^bb0(%arg9: vector<1x2x3xf32>):
    %9 = "vector.shape_cast"(%arg9) : (vector<1x2x3xf32>) -> vector<2x3xf32>
    "func.return"(%9) : (vector<2x3xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<2x1x3xf32>) -> vector<2x3xf32>, sym_name = "squeeze_out_middle_unit_dim"}> ({
  ^bb0(%arg8: vector<2x1x3xf32>):
    %8 = "vector.shape_cast"(%arg8) : (vector<2x1x3xf32>) -> vector<2x3xf32>
    "func.return"(%8) : (vector<2x3xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<2x3xf32>) -> vector<1x2x3xf32>, sym_name = "prepend_unit_dim"}> ({
  ^bb0(%arg7: vector<2x3xf32>):
    %7 = "vector.shape_cast"(%arg7) : (vector<2x3xf32>) -> vector<1x2x3xf32>
    "func.return"(%7) : (vector<1x2x3xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<2x3xf32>) -> vector<2x1x3xf32>, sym_name = "insert_middle_unit_dim"}> ({
  ^bb0(%arg6: vector<2x3xf32>):
    %6 = "vector.shape_cast"(%arg6) : (vector<2x3xf32>) -> vector<2x1x3xf32>
    "func.return"(%6) : (vector<2x1x3xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<4xf32>) -> vector<4x1x1xf32>, sym_name = "postpend_unit_dims"}> ({
  ^bb0(%arg5: vector<4xf32>):
    %5 = "vector.shape_cast"(%arg5) : (vector<4xf32>) -> vector<4x1x1xf32>
    "func.return"(%5) : (vector<4x1x1xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<2x10xf32>) -> vector<2x2x5xf32>, sym_name = "expand_inner_dims"}> ({
  ^bb0(%arg4: vector<2x10xf32>):
    %4 = "vector.shape_cast"(%arg4) : (vector<2x10xf32>) -> vector<2x2x5xf32>
    "func.return"(%4) : (vector<2x2x5xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<2x2x5xi8>) -> vector<1x2x1x10xi8>, sym_name = "collapse_inner_dims"}> ({
  ^bb0(%arg3: vector<2x2x5xi8>):
    %3 = "vector.shape_cast"(%arg3) : (vector<2x2x5xi8>) -> vector<1x2x1x10xi8>
    "func.return"(%3) : (vector<1x2x1x10xi8>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<2x15xi8>) -> vector<3x10xi8>, sym_name = "non_dividing_gcd_decreasing"}> ({
  ^bb0(%arg2: vector<2x15xi8>):
    %2 = "vector.shape_cast"(%arg2) : (vector<2x15xi8>) -> vector<3x10xi8>
    "func.return"(%2) : (vector<3x10xi8>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<3x10xi8>) -> vector<2x15xi8>, sym_name = "non_dividing_gcd_increasing"}> ({
  ^bb0(%arg1: vector<3x10xi8>):
    %1 = "vector.shape_cast"(%arg1) : (vector<3x10xi8>) -> vector<2x15xi8>
    "func.return"(%1) : (vector<2x15xi8>) -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["func.func"]}> : (!transform.any_op) -> !transform.any_op
      "transform.apply_patterns"(%0) <{max_iterations = -1 : i64, max_num_rewrites = -1 : i64}> ({
        "transform.apply_patterns.vector.lower_shape_cast"() : () -> ()
      }) : (!transform.any_op) -> ()
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

