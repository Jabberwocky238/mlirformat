"builtin.module"() ({
  "func.func"() <{function_type = (vector<4xi8>) -> vector<1x1x4xi8>, sym_name = "broadcast_to_shape_cast"}> ({
  ^bb0(%arg0: vector<4xi8>):
    %0 = "vector.broadcast"(%arg0) : (vector<4xi8>) -> vector<1x1x4xi8>
    "func.return"(%0) : (vector<1x1x4xi8>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<1x4xi8>) -> vector<2x3x4xi8>, sym_name = "negative_broadcast_increased_elements_to_shape_cast"}> ({
  ^bb0(%arg0: vector<1x4xi8>):
    %0 = "vector.broadcast"(%arg0) : (vector<1x4xi8>) -> vector<2x3x4xi8>
    "func.return"(%0) : (vector<2x3x4xi8>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (i8) -> vector<1xi8>, sym_name = "negative_broadcast_scalar_to_shape_cast"}> ({
  ^bb0(%arg0: i8):
    %0 = "vector.broadcast"(%arg0) : (i8) -> vector<1xi8>
    "func.return"(%0) : (vector<1xi8>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<2xf32>) -> vector<1x2x1xf32>, sym_name = "canonicalize_broadcast_shapecast_to_shapecast"}> ({
  ^bb0(%arg0: vector<2xf32>):
    %0 = "vector.broadcast"(%arg0) : (vector<2xf32>) -> vector<1x2xf32>
    %1 = "vector.shape_cast"(%0) : (vector<1x2xf32>) -> vector<1x2x1xf32>
    "func.return"(%1) : (vector<1x2x1xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<1xf32>) -> vector<1x1xf32>, sym_name = "canonicalize_broadcast_shapecast_both_possible"}> ({
  ^bb0(%arg0: vector<1xf32>):
    %0 = "vector.broadcast"(%arg0) : (vector<1xf32>) -> vector<1x1x1xf32>
    %1 = "vector.shape_cast"(%0) : (vector<1x1x1xf32>) -> vector<1x1xf32>
    "func.return"(%1) : (vector<1x1xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<1x4xf32>) -> vector<4xf32>, sym_name = "extract_to_shape_cast"}> ({
  ^bb0(%arg0: vector<1x4xf32>):
    %0 = "vector.extract"(%arg0) <{static_position = array<i64: 0>}> : (vector<1x4xf32>) -> vector<4xf32>
    "func.return"(%0) : (vector<4xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<1x4xf32>, index) -> vector<4xf32>, sym_name = "negative_extract_to_shape_cast"}> ({
  ^bb0(%arg0: vector<1x4xf32>, %arg1: index):
    %0 = "vector.extract"(%arg0, %arg1) <{static_position = array<i64: -9223372036854775808>}> : (vector<1x4xf32>, index) -> vector<4xf32>
    "func.return"(%0) : (vector<4xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<3x4xf32>) -> vector<12xf32>, sym_name = "fold_extract_shapecast_to_shapecast"}> ({
  ^bb0(%arg0: vector<3x4xf32>):
    %0 = "vector.shape_cast"(%arg0) : (vector<3x4xf32>) -> vector<1x12xf32>
    %1 = "vector.extract"(%0) <{static_position = array<i64: 0>}> : (vector<1x12xf32>) -> vector<12xf32>
    "func.return"(%1) : (vector<12xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<1x1x4xf32>, vector<4xf32>) -> (vector<4xf32>, vector<1x1x4xf32>), sym_name = "insert_extract_to_shape_cast"}> ({
  ^bb0(%arg0: vector<1x1x4xf32>, %arg1: vector<4xf32>):
    %0 = "vector.extract"(%arg0) <{static_position = array<i64: 0, 0>}> : (vector<1x1x4xf32>) -> vector<4xf32>
    %1 = "vector.insert"(%arg1, %arg0) <{static_position = array<i64: 0, 0>}> : (vector<4xf32>, vector<1x1x4xf32>) -> vector<1x1x4xf32>
    "func.return"(%0, %1) : (vector<4xf32>, vector<1x1x4xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<1x1x1xf32>) -> vector<1xf32>, sym_name = "extract_from_broadcast"}> ({
  ^bb0(%arg0: vector<1x1x1xf32>):
    %0 = "vector.broadcast"(%arg0) : (vector<1x1x1xf32>) -> vector<1x1x32x1xf32>
    %1 = "vector.extract"(%0) <{static_position = array<i64: 0, 0, 31>}> : (vector<1x1x32x1xf32>) -> vector<1xf32>
    "func.return"(%1) : (vector<1xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<2x1xf32>) -> vector<2x2xf32>, sym_name = "no_fold_bcast_mode_switch"}> ({
  ^bb0(%arg0: vector<2x1xf32>):
    %0 = "vector.broadcast"(%arg0) : (vector<2x1xf32>) -> vector<2x2x1xf32>
    %1 = "vector.shape_cast"(%0) : (vector<2x2x1xf32>) -> vector<2x2xf32>
    "func.return"(%1) : (vector<2x2xf32>) -> ()
  }) : () -> ()
}) : () -> ()

