"builtin.module"() ({
  "func.func"() <{function_type = (f32, f32) -> (vector<1xf32>, vector<1xf32>), sym_name = "extract_from_insert_trailing_unit_dim"}> ({
  ^bb0(%arg0: f32, %arg1: f32):
    %0 = "ub.poison"() <{value = #ub.poison}> : () -> vector<4x1xf32>
    %1 = "vector.insert"(%arg0, %0) <{static_position = array<i64: 0, 0>}> : (f32, vector<4x1xf32>) -> vector<4x1xf32>
    %2 = "vector.insert"(%arg1, %1) <{static_position = array<i64: 1, 0>}> : (f32, vector<4x1xf32>) -> vector<4x1xf32>
    %3 = "vector.extract"(%1) <{static_position = array<i64: 0>}> : (vector<4x1xf32>) -> vector<1xf32>
    %4 = "vector.extract"(%2) <{static_position = array<i64: 1>}> : (vector<4x1xf32>) -> vector<1xf32>
    "func.return"(%3, %4) : (vector<1xf32>, vector<1xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (f32) -> vector<1x1xf32>, sym_name = "extract_from_insert_multiple_trailing_unit_dims"}> ({
  ^bb0(%arg0: f32):
    %0 = "ub.poison"() <{value = #ub.poison}> : () -> vector<4x1x1xf32>
    %1 = "vector.insert"(%arg0, %0) <{static_position = array<i64: 2, 0, 0>}> : (f32, vector<4x1x1xf32>) -> vector<4x1x1xf32>
    %2 = "vector.extract"(%1) <{static_position = array<i64: 2>}> : (vector<4x1x1xf32>) -> vector<1x1xf32>
    "func.return"(%2) : (vector<1x1xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (f32) -> vector<1xf32>, sym_name = "negative_extract_from_insert_position_mismatch"}> ({
  ^bb0(%arg0: f32):
    %0 = "ub.poison"() <{value = #ub.poison}> : () -> vector<4x1xf32>
    %1 = "vector.insert"(%arg0, %0) <{static_position = array<i64: 1, 0>}> : (f32, vector<4x1xf32>) -> vector<4x1xf32>
    %2 = "vector.extract"(%1) <{static_position = array<i64: 0>}> : (vector<4x1xf32>) -> vector<1xf32>
    "func.return"(%2) : (vector<1xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (f32) -> vector<4xf32>, sym_name = "negative_extract_from_insert_non_unit_trailing_dim"}> ({
  ^bb0(%arg0: f32):
    %0 = "ub.poison"() <{value = #ub.poison}> : () -> vector<3x4xf32>
    %1 = "vector.insert"(%arg0, %0) <{static_position = array<i64: 1, 2>}> : (f32, vector<3x4xf32>) -> vector<3x4xf32>
    %2 = "vector.extract"(%1) <{static_position = array<i64: 1>}> : (vector<3x4xf32>) -> vector<4xf32>
    "func.return"(%2) : (vector<4xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (f32, index) -> vector<1xf32>, sym_name = "negative_extract_from_insert_dynamic_position"}> ({
  ^bb0(%arg0: f32, %arg1: index):
    %0 = "ub.poison"() <{value = #ub.poison}> : () -> vector<4x1xf32>
    %1 = "vector.insert"(%arg0, %0) <{static_position = array<i64: 2, 0>}> : (f32, vector<4x1xf32>) -> vector<4x1xf32>
    %2 = "vector.extract"(%1, %arg1) <{static_position = array<i64: -9223372036854775808>}> : (vector<4x1xf32>, index) -> vector<1xf32>
    "func.return"(%2) : (vector<1xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (f32, index) -> vector<1xf32>, sym_name = "negative_insert_dynamic_position_not_folded"}> ({
  ^bb0(%arg0: f32, %arg1: index):
    %0 = "ub.poison"() <{value = #ub.poison}> : () -> vector<4x1xf32>
    %1 = "vector.insert"(%arg0, %0, %arg1) <{static_position = array<i64: -9223372036854775808, 0>}> : (f32, vector<4x1xf32>, index) -> vector<4x1xf32>
    %2 = "vector.extract"(%1) <{static_position = array<i64: 2>}> : (vector<4x1xf32>) -> vector<1xf32>
    "func.return"(%2) : (vector<1xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (f32) -> f32, sym_name = "extract_from_insert_exact_match"}> ({
  ^bb0(%arg0: f32):
    %0 = "ub.poison"() <{value = #ub.poison}> : () -> vector<4x1xf32>
    %1 = "vector.insert"(%arg0, %0) <{static_position = array<i64: 2, 0>}> : (f32, vector<4x1xf32>) -> vector<4x1xf32>
    %2 = "vector.extract"(%1) <{static_position = array<i64: 2, 0>}> : (vector<4x1xf32>) -> f32
    "func.return"(%2) : (f32) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<1xf32>) -> vector<1x1xf32>, sym_name = "extract_from_insert_vector_to_vector_broadcast"}> ({
  ^bb0(%arg0: vector<1xf32>):
    %0 = "ub.poison"() <{value = #ub.poison}> : () -> vector<16x1x1xf32>
    %1 = "vector.insert"(%arg0, %0) <{static_position = array<i64: 0, 0>}> : (vector<1xf32>, vector<16x1x1xf32>) -> vector<16x1x1xf32>
    %2 = "vector.extract"(%1) <{static_position = array<i64: 0>}> : (vector<16x1x1xf32>) -> vector<1x1xf32>
    "func.return"(%2) : (vector<1x1xf32>) -> ()
  }) : () -> ()
}) : () -> ()

