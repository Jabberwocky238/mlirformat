"builtin.module"() ({
  "func.func"() <{function_type = (vector<16xf32>) -> vector<16xf32>, sym_name = "nop_shape_cast"}> ({
  ^bb0(%arg18: vector<16xf32> loc("<stdin>":3:8)):
    %19 = "vector.shape_cast"(%arg18) : (vector<16xf32>) -> vector<16xf32> loc("<stdin>":4:11)
    "func.return"(%19) : (vector<16xf32>) -> () loc("<stdin>":5:5)
  }) : () -> () loc("<stdin>":2:3)
  "func.func"() <{function_type = (vector<16xf32>) -> vector<16xf32>, sym_name = "cancel_shape_cast"}> ({
  ^bb0(%arg17: vector<16xf32> loc("<stdin>":8:8)):
    %17 = "vector.shape_cast"(%arg17) : (vector<16xf32>) -> vector<4x4xf32> loc("<stdin>":9:11)
    %18 = "vector.shape_cast"(%17) : (vector<4x4xf32>) -> vector<16xf32> loc("<stdin>":10:11)
    "func.return"(%18) : (vector<16xf32>) -> () loc("<stdin>":11:5)
  }) : () -> () loc("<stdin>":7:3)
  "func.func"() <{function_type = (vector<2x2xf32>) -> vector<4xf32>, sym_name = "shape_cast_2d1d"}> ({
  ^bb0(%arg16: vector<2x2xf32> loc("<stdin>":14:8)):
    %16 = "vector.shape_cast"(%arg16) : (vector<2x2xf32>) -> vector<4xf32> loc("<stdin>":15:11)
    "func.return"(%16) : (vector<4xf32>) -> () loc("<stdin>":16:5)
  }) : () -> () loc("<stdin>":13:3)
  "func.func"() <{function_type = (vector<1x3x2xf32>) -> vector<6xf32>, sym_name = "shape_cast_3d1d"}> ({
  ^bb0(%arg15: vector<1x3x2xf32> loc("<stdin>":19:8)):
    %15 = "vector.shape_cast"(%arg15) : (vector<1x3x2xf32>) -> vector<6xf32> loc("<stdin>":20:11)
    "func.return"(%15) : (vector<6xf32>) -> () loc("<stdin>":21:5)
  }) : () -> () loc("<stdin>":18:3)
  "func.func"() <{function_type = (vector<4xf32>) -> vector<2x2xf32>, sym_name = "shape_cast_1d2d"}> ({
  ^bb0(%arg14: vector<4xf32> loc("<stdin>":24:8)):
    %14 = "vector.shape_cast"(%arg14) : (vector<4xf32>) -> vector<2x2xf32> loc("<stdin>":25:11)
    "func.return"(%14) : (vector<2x2xf32>) -> () loc("<stdin>":26:5)
  }) : () -> () loc("<stdin>":23:3)
  "func.func"() <{function_type = (vector<6xf32>) -> vector<2x1x3xf32>, sym_name = "shape_cast_1d3d"}> ({
  ^bb0(%arg13: vector<6xf32> loc("<stdin>":29:8)):
    %13 = "vector.shape_cast"(%arg13) : (vector<6xf32>) -> vector<2x1x3xf32> loc("<stdin>":30:11)
    "func.return"(%13) : (vector<2x1x3xf32>) -> () loc("<stdin>":31:5)
  }) : () -> () loc("<stdin>":28:3)
  "func.func"() <{function_type = (vector<3x2xf32>) -> vector<2x3xf32>, sym_name = "shape_cast_2d2d"}> ({
  ^bb0(%arg12: vector<3x2xf32> loc("<stdin>":34:8)):
    %12 = "vector.shape_cast"(%arg12) : (vector<3x2xf32>) -> vector<2x3xf32> loc("<stdin>":35:11)
    "func.return"(%12) : (vector<2x3xf32>) -> () loc("<stdin>":36:5)
  }) : () -> () loc("<stdin>":33:3)
  "func.func"() <{function_type = (vector<f32>) -> vector<1xf32>, sym_name = "shape_cast_0d1d"}> ({
  ^bb0(%arg11: vector<f32> loc("<stdin>":39:8)):
    %11 = "vector.shape_cast"(%arg11) : (vector<f32>) -> vector<1xf32> loc("<stdin>":40:11)
    "func.return"(%11) : (vector<1xf32>) -> () loc("<stdin>":41:5)
  }) : () -> () loc("<stdin>":38:3)
  "func.func"() <{function_type = (vector<1xf32>) -> vector<f32>, sym_name = "shape_cast_1d0d"}> ({
  ^bb0(%arg10: vector<1xf32> loc("<stdin>":44:8)):
    %10 = "vector.shape_cast"(%arg10) : (vector<1xf32>) -> vector<f32> loc("<stdin>":45:11)
    "func.return"(%10) : (vector<f32>) -> () loc("<stdin>":46:5)
  }) : () -> () loc("<stdin>":43:3)
  "func.func"() <{function_type = (vector<1x2x3xf32>) -> vector<2x3xf32>, sym_name = "squeeze_out_prefix_unit_dim"}> ({
  ^bb0(%arg9: vector<1x2x3xf32> loc("<stdin>":49:8)):
    %9 = "vector.shape_cast"(%arg9) : (vector<1x2x3xf32>) -> vector<2x3xf32> loc("<stdin>":50:10)
    "func.return"(%9) : (vector<2x3xf32>) -> () loc("<stdin>":51:5)
  }) : () -> () loc("<stdin>":48:3)
  "func.func"() <{function_type = (vector<2x1x3xf32>) -> vector<2x3xf32>, sym_name = "squeeze_out_middle_unit_dim"}> ({
  ^bb0(%arg8: vector<2x1x3xf32> loc("<stdin>":54:8)):
    %8 = "vector.shape_cast"(%arg8) : (vector<2x1x3xf32>) -> vector<2x3xf32> loc("<stdin>":55:10)
    "func.return"(%8) : (vector<2x3xf32>) -> () loc("<stdin>":56:5)
  }) : () -> () loc("<stdin>":53:3)
  "func.func"() <{function_type = (vector<2x3xf32>) -> vector<1x2x3xf32>, sym_name = "prepend_unit_dim"}> ({
  ^bb0(%arg7: vector<2x3xf32> loc("<stdin>":59:8)):
    %7 = "vector.shape_cast"(%arg7) : (vector<2x3xf32>) -> vector<1x2x3xf32> loc("<stdin>":60:10)
    "func.return"(%7) : (vector<1x2x3xf32>) -> () loc("<stdin>":61:5)
  }) : () -> () loc("<stdin>":58:3)
  "func.func"() <{function_type = (vector<2x3xf32>) -> vector<2x1x3xf32>, sym_name = "insert_middle_unit_dim"}> ({
  ^bb0(%arg6: vector<2x3xf32> loc("<stdin>":64:8)):
    %6 = "vector.shape_cast"(%arg6) : (vector<2x3xf32>) -> vector<2x1x3xf32> loc("<stdin>":65:10)
    "func.return"(%6) : (vector<2x1x3xf32>) -> () loc("<stdin>":66:5)
  }) : () -> () loc("<stdin>":63:3)
  "func.func"() <{function_type = (vector<4xf32>) -> vector<4x1x1xf32>, sym_name = "postpend_unit_dims"}> ({
  ^bb0(%arg5: vector<4xf32> loc("<stdin>":69:8)):
    %5 = "vector.shape_cast"(%arg5) : (vector<4xf32>) -> vector<4x1x1xf32> loc("<stdin>":70:10)
    "func.return"(%5) : (vector<4x1x1xf32>) -> () loc("<stdin>":71:5)
  }) : () -> () loc("<stdin>":68:3)
  "func.func"() <{function_type = (vector<2x10xf32>) -> vector<2x2x5xf32>, sym_name = "expand_inner_dims"}> ({
  ^bb0(%arg4: vector<2x10xf32> loc("<stdin>":74:8)):
    %4 = "vector.shape_cast"(%arg4) : (vector<2x10xf32>) -> vector<2x2x5xf32> loc("<stdin>":75:10)
    "func.return"(%4) : (vector<2x2x5xf32>) -> () loc("<stdin>":76:5)
  }) : () -> () loc("<stdin>":73:3)
  "func.func"() <{function_type = (vector<2x2x5xi8>) -> vector<1x2x1x10xi8>, sym_name = "collapse_inner_dims"}> ({
  ^bb0(%arg3: vector<2x2x5xi8> loc("<stdin>":79:8)):
    %3 = "vector.shape_cast"(%arg3) : (vector<2x2x5xi8>) -> vector<1x2x1x10xi8> loc("<stdin>":80:10)
    "func.return"(%3) : (vector<1x2x1x10xi8>) -> () loc("<stdin>":81:5)
  }) : () -> () loc("<stdin>":78:3)
  "func.func"() <{function_type = (vector<2x15xi8>) -> vector<3x10xi8>, sym_name = "non_dividing_gcd_decreasing"}> ({
  ^bb0(%arg2: vector<2x15xi8> loc("<stdin>":84:8)):
    %2 = "vector.shape_cast"(%arg2) : (vector<2x15xi8>) -> vector<3x10xi8> loc("<stdin>":85:10)
    "func.return"(%2) : (vector<3x10xi8>) -> () loc("<stdin>":86:5)
  }) : () -> () loc("<stdin>":83:3)
  "func.func"() <{function_type = (vector<3x10xi8>) -> vector<2x15xi8>, sym_name = "non_dividing_gcd_increasing"}> ({
  ^bb0(%arg1: vector<3x10xi8> loc("<stdin>":89:8)):
    %1 = "vector.shape_cast"(%arg1) : (vector<3x10xi8>) -> vector<2x15xi8> loc("<stdin>":90:10)
    "func.return"(%1) : (vector<2x15xi8>) -> () loc("<stdin>":91:5)
  }) : () -> () loc("<stdin>":88:3)
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op loc("<stdin>":95:10)):
      %0 = "transform.structured.match"(%arg0) <{ops = ["func.func"]}> : (!transform.any_op) -> !transform.any_op loc("<stdin>":96:12)
      "transform.apply_patterns"(%0) <{max_iterations = -1 : i64, max_num_rewrites = -1 : i64}> ({
        "transform.apply_patterns.vector.lower_shape_cast"() : () -> () loc("<stdin>":98:9)
      }) : (!transform.any_op) -> () loc("<stdin>":97:7)
      "transform.yield"() : () -> () loc("<stdin>":100:7)
    }) : () -> () loc("<stdin>":94:5)
  }) {transform.with_named_sequence} : () -> () loc("<stdin>":93:3)
}) : () -> () loc("<stdin>":1:1)
