"builtin.module"() ({
  "func.func"() <{function_type = (vector<1xf32>) -> vector<1x8xf32>, sym_name = "transpose_scalar_broadcast1"}> ({
  ^bb0(%arg0: vector<1xf32>):
    %0 = "vector.broadcast"(%arg0) : (vector<1xf32>) -> vector<8x1xf32>
    %1 = "vector.transpose"(%0) <{permutation = array<i64: 1, 0>}> : (vector<8x1xf32>) -> vector<1x8xf32>
    "func.return"(%1) : (vector<1x8xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (f32) -> vector<1x8xf32>, sym_name = "transpose_scalar_broadcast2"}> ({
  ^bb0(%arg0: f32):
    %0 = "vector.broadcast"(%arg0) : (f32) -> vector<8x1xf32>
    %1 = "vector.transpose"(%0) <{permutation = array<i64: 1, 0>}> : (vector<8x1xf32>) -> vector<1x8xf32>
    "func.return"(%1) : (vector<1x8xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (i8) -> vector<2x3x4xi8>, sym_name = "broadcast_transpose_scalar_to_broadcast"}> ({
  ^bb0(%arg0: i8):
    %0 = "vector.broadcast"(%arg0) : (i8) -> vector<3x4x2xi8>
    %1 = "vector.transpose"(%0) <{permutation = array<i64: 2, 0, 1>}> : (vector<3x4x2xi8>) -> vector<2x3x4xi8>
    "func.return"(%1) : (vector<2x3x4xi8>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<1x1x1xi8>) -> vector<2x3x4xi8>, sym_name = "broadcast_transpose_ones_to_broadcast"}> ({
  ^bb0(%arg0: vector<1x1x1xi8>):
    %0 = "vector.broadcast"(%arg0) : (vector<1x1x1xi8>) -> vector<3x4x2xi8>
    %1 = "vector.transpose"(%0) <{permutation = array<i64: 2, 0, 1>}> : (vector<3x4x2xi8>) -> vector<2x3x4xi8>
    "func.return"(%1) : (vector<2x3x4xi8>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<1xi8>) -> vector<8x1xi8>, sym_name = "broadcast_transpose_partial_ones_to_broadcast"}> ({
  ^bb0(%arg0: vector<1xi8>):
    %0 = "vector.broadcast"(%arg0) : (vector<1xi8>) -> vector<1x8xi8>
    %1 = "vector.transpose"(%0) <{permutation = array<i64: 1, 0>}> : (vector<1x8xi8>) -> vector<8x1xi8>
    "func.return"(%1) : (vector<8x1xi8>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<4x1x1x7xi8>) -> vector<3x2x4x5x6x7xi8>, sym_name = "broadcast_transpose_mixed_example"}> ({
  ^bb0(%arg0: vector<4x1x1x7xi8>):
    %0 = "vector.broadcast"(%arg0) : (vector<4x1x1x7xi8>) -> vector<2x3x4x5x6x7xi8>
    %1 = "vector.transpose"(%0) <{permutation = array<i64: 1, 0, 2, 3, 4, 5>}> : (vector<2x3x4x5x6x7xi8>) -> vector<3x2x4x5x6x7xi8>
    "func.return"(%1) : (vector<3x2x4x5x6x7xi8>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<4x7x1x1xi8>) -> vector<4x7x2x3xi8>, sym_name = "broadcast_transpose_final_group"}> ({
  ^bb0(%arg0: vector<4x7x1x1xi8>):
    %0 = "vector.broadcast"(%arg0) : (vector<4x7x1x1xi8>) -> vector<4x7x3x2xi8>
    %1 = "vector.transpose"(%0) <{permutation = array<i64: 0, 1, 3, 2>}> : (vector<4x7x3x2xi8>) -> vector<4x7x2x3xi8>
    "func.return"(%1) : (vector<4x7x2x3xi8>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<4x1xi8>) -> vector<4x4xi8>, sym_name = "negative_broadcast_transpose_square"}> ({
  ^bb0(%arg0: vector<4x1xi8>):
    %0 = "vector.broadcast"(%arg0) : (vector<4x1xi8>) -> vector<4x4xi8>
    %1 = "vector.transpose"(%0) <{permutation = array<i64: 1, 0>}> : (vector<4x4xi8>) -> vector<4x4xi8>
    "func.return"(%1) : (vector<4x4xi8>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<1x1x4xi8>) -> vector<4x4x4x4xi8>, sym_name = "negative_broadcast_transpose_hypercube"}> ({
  ^bb0(%arg0: vector<1x1x4xi8>):
    %0 = "vector.broadcast"(%arg0) : (vector<1x1x4xi8>) -> vector<4x4x4x4xi8>
    %1 = "vector.transpose"(%0) <{permutation = array<i64: 1, 0, 3, 2>}> : (vector<4x4x4x4xi8>) -> vector<4x4x4x4xi8>
    "func.return"(%1) : (vector<4x4x4x4xi8>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<3x1x3xi8>) -> vector<3x3x3xi8>, sym_name = "negative_broadcast_transpose_102"}> ({
  ^bb0(%arg0: vector<3x1x3xi8>):
    %0 = "vector.broadcast"(%arg0) : (vector<3x1x3xi8>) -> vector<3x3x3xi8>
    %1 = "vector.transpose"(%0) <{permutation = array<i64: 1, 0, 2>}> : (vector<3x3x3xi8>) -> vector<3x3x3xi8>
    "func.return"(%1) : (vector<3x3x3xi8>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<3x1x3xi8>) -> vector<3x3x3xi8>, sym_name = "negative_broadcast_transpose_021"}> ({
  ^bb0(%arg0: vector<3x1x3xi8>):
    %0 = "vector.broadcast"(%arg0) : (vector<3x1x3xi8>) -> vector<3x3x3xi8>
    %1 = "vector.transpose"(%0) <{permutation = array<i64: 0, 2, 1>}> : (vector<3x3x3xi8>) -> vector<3x3x3xi8>
    "func.return"(%1) : (vector<3x3x3xi8>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<1x4x4x1x1xi8>) -> vector<4x4xi8>, sym_name = "shape_cast_of_transpose"}> ({
  ^bb0(%arg0: vector<1x4x4x1x1xi8>):
    %0 = "vector.transpose"(%arg0) <{permutation = array<i64: 1, 0, 3, 4, 2>}> : (vector<1x4x4x1x1xi8>) -> vector<4x1x1x1x4xi8>
    %1 = "vector.shape_cast"(%0) : (vector<4x1x1x1x4xi8>) -> vector<4x4xi8>
    "func.return"(%1) : (vector<4x4xi8>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<1x[4]x4x1x1xi8>) -> vector<[4]x4xi8>, sym_name = "shape_cast_of_transpose_scalable"}> ({
  ^bb0(%arg0: vector<1x[4]x4x1x1xi8>):
    %0 = "vector.transpose"(%arg0) <{permutation = array<i64: 1, 0, 3, 4, 2>}> : (vector<1x[4]x4x1x1xi8>) -> vector<[4]x1x1x1x4xi8>
    %1 = "vector.shape_cast"(%0) : (vector<[4]x1x1x1x4xi8>) -> vector<[4]x4xi8>
    "func.return"(%1) : (vector<[4]x4xi8>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<1x4x4x1xi8>) -> vector<4x4xi8>, sym_name = "negative_shape_cast_of_transpose"}> ({
  ^bb0(%arg0: vector<1x4x4x1xi8>):
    %0 = "vector.transpose"(%arg0) <{permutation = array<i64: 0, 2, 1, 3>}> : (vector<1x4x4x1xi8>) -> vector<1x4x4x1xi8>
    %1 = "vector.shape_cast"(%0) : (vector<1x4x4x1xi8>) -> vector<4x4xi8>
    "func.return"(%1) : (vector<4x4xi8>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<2x3x1x1xi8>) -> vector<6x1x1xi8>, sym_name = "transpose_of_shape_cast"}> ({
  ^bb0(%arg0: vector<2x3x1x1xi8>):
    %0 = "vector.shape_cast"(%arg0) : (vector<2x3x1x1xi8>) -> vector<6x1x1xi8>
    %1 = "vector.transpose"(%0) <{permutation = array<i64: 0, 2, 1>}> : (vector<6x1x1xi8>) -> vector<6x1x1xi8>
    "func.return"(%1) : (vector<6x1x1xi8>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<[2]x3x1x1xi8>) -> vector<[6]x1x1xi8>, sym_name = "transpose_of_shape_cast_scalable"}> ({
  ^bb0(%arg0: vector<[2]x3x1x1xi8>):
    %0 = "vector.shape_cast"(%arg0) : (vector<[2]x3x1x1xi8>) -> vector<[6]x1x1xi8>
    %1 = "vector.transpose"(%0) <{permutation = array<i64: 0, 2, 1>}> : (vector<[6]x1x1xi8>) -> vector<[6]x1x1xi8>
    "func.return"(%1) : (vector<[6]x1x1xi8>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<[1]x4x1xi8>) -> vector<4x[1]xi8>, sym_name = "negative_transpose_of_shape_cast_scalable_unit"}> ({
  ^bb0(%arg0: vector<[1]x4x1xi8>):
    %0 = "vector.shape_cast"(%arg0) : (vector<[1]x4x1xi8>) -> vector<[1]x4xi8>
    %1 = "vector.transpose"(%0) <{permutation = array<i64: 1, 0>}> : (vector<[1]x4xi8>) -> vector<4x[1]xi8>
    "func.return"(%1) : (vector<4x[1]xi8>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<6xi8>) -> vector<2x3xi8>, sym_name = "negative_transpose_of_shape_cast"}> ({
  ^bb0(%arg0: vector<6xi8>):
    %0 = "vector.shape_cast"(%arg0) : (vector<6xi8>) -> vector<3x2xi8>
    %1 = "vector.transpose"(%0) <{permutation = array<i64: 1, 0>}> : (vector<3x2xi8>) -> vector<2x3xi8>
    "func.return"(%1) : (vector<2x3xi8>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<4xf32>) -> vector<4xf32>, sym_name = "transpose_1D_identity"}> ({
  ^bb0(%arg0: vector<4xf32>):
    %0 = "vector.transpose"(%arg0) <{permutation = array<i64: 0>}> : (vector<4xf32>) -> vector<4xf32>
    "func.return"(%0) : (vector<4xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<4x3xf32>) -> vector<4x3xf32>, sym_name = "transpose_2D_identity"}> ({
  ^bb0(%arg0: vector<4x3xf32>):
    %0 = "vector.transpose"(%arg0) <{permutation = array<i64: 0, 1>}> : (vector<4x3xf32>) -> vector<4x3xf32>
    "func.return"(%0) : (vector<4x3xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<6x1x1x4xi8>) -> vector<6x1x1x4xi8>, sym_name = "transpose_shape_and_order_preserving"}> ({
  ^bb0(%arg0: vector<6x1x1x4xi8>):
    %0 = "vector.transpose"(%arg0) <{permutation = array<i64: 0, 2, 1, 3>}> : (vector<6x1x1x4xi8>) -> vector<6x1x1x4xi8>
    "func.return"(%0) : (vector<6x1x1x4xi8>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<2x2xi8>) -> vector<2x2xi8>, sym_name = "negative_transpose_fold"}> ({
  ^bb0(%arg0: vector<2x2xi8>):
    %0 = "vector.transpose"(%arg0) <{permutation = array<i64: 1, 0>}> : (vector<2x2xi8>) -> vector<2x2xi8>
    "func.return"(%0) : (vector<2x2xi8>) -> ()
  }) : () -> ()
}) : () -> ()

