"builtin.module"() ({
  "func.func"() <{function_type = (vector<2x1x[4]xi32>) -> vector<[8]xi32>, sym_name = "i32_3d_to_1d_last_dim_scalable"}> ({
  ^bb0(%arg0: vector<2x1x[4]xi32>):
    %0 = "vector.shape_cast"(%arg0) : (vector<2x1x[4]xi32>) -> vector<[8]xi32>
    "func.return"(%0) : (vector<[8]xi32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<[8]xi32>) -> vector<2x1x[4]xi32>, sym_name = "i32_1d_to_3d_last_dim_scalable"}> ({
  ^bb0(%arg0: vector<[8]xi32>):
    %0 = "vector.shape_cast"(%arg0) : (vector<[8]xi32>) -> vector<2x1x[4]xi32>
    "func.return"(%0) : (vector<2x1x[4]xi32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<4x[8]xi8>) -> vector<[32]xi8>, sym_name = "i8_2d_to_1d_last_dim_scalable"}> ({
  ^bb0(%arg0: vector<4x[8]xi8>):
    %0 = "vector.shape_cast"(%arg0) : (vector<4x[8]xi8>) -> vector<[32]xi8>
    "func.return"(%0) : (vector<[32]xi8>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<[32]xi8>) -> vector<4x[8]xi8>, sym_name = "i8_1d_to_2d_last_dim_scalable"}> ({
  ^bb0(%arg0: vector<[32]xi8>):
    %0 = "vector.shape_cast"(%arg0) : (vector<[32]xi8>) -> vector<4x[8]xi8>
    "func.return"(%0) : (vector<4x[8]xi8>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<2x3x[4]xf32>) -> vector<3x2x[4]xf32>, sym_name = "f32_permute_leading_non_scalable_dims"}> ({
  ^bb0(%arg0: vector<2x3x[4]xf32>):
    %0 = "vector.shape_cast"(%arg0) : (vector<2x3x[4]xf32>) -> vector<3x2x[4]xf32>
    "func.return"(%0) : (vector<3x2x[4]xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<2x2x[2]xf64>) -> vector<4x[2]xf64>, sym_name = "f64_flatten_leading_non_scalable_dims"}> ({
  ^bb0(%arg0: vector<2x2x[2]xf64>):
    %0 = "vector.shape_cast"(%arg0) : (vector<2x2x[2]xf64>) -> vector<4x[2]xf64>
    "func.return"(%0) : (vector<4x[2]xf64>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<3x[4]xf32>) -> vector<6x[2]xf32>, sym_name = "f32_reduce_trailing_scalable_dim"}> ({
  ^bb0(%arg0: vector<3x[4]xf32>):
    %0 = "vector.shape_cast"(%arg0) : (vector<3x[4]xf32>) -> vector<6x[2]xf32>
    "func.return"(%0) : (vector<6x[2]xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<4x[2]xf32>) -> vector<2x[4]xf32>, sym_name = "f32_increase_trailing_scalable_dim"}> ({
  ^bb0(%arg0: vector<4x[2]xf32>):
    %0 = "vector.shape_cast"(%arg0) : (vector<4x[2]xf32>) -> vector<2x[4]xf32>
    "func.return"(%0) : (vector<2x[4]xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
^bb0:
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<[4]xf32>) -> vector<[2]x2xf32>, sym_name = "cannot_cast_to_non_trailing_scalable_dim"}> ({
  ^bb0(%arg0: vector<[4]xf32>):
    %0 = "vector.shape_cast"(%arg0) : (vector<[4]xf32>) -> vector<[2]x2xf32>
    "func.return"(%0) : (vector<[2]x2xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<[2]x2xf32>) -> vector<[4]xf32>, sym_name = "cannot_shape_cast_from_non_trailing_scalable_dim"}> ({
  ^bb0(%arg0: vector<[2]x2xf32>):
    %0 = "vector.shape_cast"(%arg0) : (vector<[2]x2xf32>) -> vector<[4]xf32>
    "func.return"(%0) : (vector<[4]xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<[4]x[4]xf32>) -> vector<2x[2]x[4]xf32>, sym_name = "cannot_shape_cast_more_than_one_scalable_dim"}> ({
  ^bb0(%arg1: vector<[4]x[4]xf32>):
    %1 = "vector.shape_cast"(%arg1) : (vector<[4]x[4]xf32>) -> vector<2x[2]x[4]xf32>
    "func.return"(%1) : (vector<2x[2]x[4]xf32>) -> ()
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

