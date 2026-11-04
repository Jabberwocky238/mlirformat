"builtin.module"() ({
  "func.func"() <{function_type = (f32, f32) -> (f32, f32, f32, f32, f32, f32, f32), sym_name = "extract_scalar_from_from_elements"}> ({
  ^bb0(%arg0: f32, %arg1: f32):
    %0 = "vector.from_elements"(%arg0) : (f32) -> vector<f32>
    %1 = "vector.extract"(%0) <{static_position = array<i64>}> : (vector<f32>) -> f32
    %2 = "vector.from_elements"(%arg0) : (f32) -> vector<1xf32>
    %3 = "vector.extract"(%2) <{static_position = array<i64: 0>}> : (vector<1xf32>) -> f32
    %4 = "vector.from_elements"(%arg0, %arg1, %arg0, %arg0, %arg1) : (f32, f32, f32, f32, f32) -> vector<5xf32>
    %5 = "vector.extract"(%4) <{static_position = array<i64: 4>}> : (vector<5xf32>) -> f32
    %6 = "vector.from_elements"(%arg0, %arg0, %arg0, %arg1, %arg1, %arg1) : (f32, f32, f32, f32, f32, f32) -> vector<2x3xf32>
    %7 = "vector.extract"(%6) <{static_position = array<i64: 0, 0>}> : (vector<2x3xf32>) -> f32
    %8 = "vector.extract"(%6) <{static_position = array<i64: 0, 1>}> : (vector<2x3xf32>) -> f32
    %9 = "vector.extract"(%6) <{static_position = array<i64: 1, 1>}> : (vector<2x3xf32>) -> f32
    %10 = "vector.extract"(%6) <{static_position = array<i64: 1, 2>}> : (vector<2x3xf32>) -> f32
    "func.return"(%1, %3, %5, %7, %8, %9, %10) : (f32, f32, f32, f32, f32, f32, f32) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (f32, f32) -> (vector<3xf32>, vector<3xf32>), sym_name = "extract_1d_from_from_elements"}> ({
  ^bb0(%arg0: f32, %arg1: f32):
    %0 = "vector.from_elements"(%arg0, %arg0, %arg0, %arg1, %arg1, %arg1) : (f32, f32, f32, f32, f32, f32) -> vector<2x3xf32>
    %1 = "vector.extract"(%0) <{static_position = array<i64: 0>}> : (vector<2x3xf32>) -> vector<3xf32>
    %2 = "vector.extract"(%0) <{static_position = array<i64: 1>}> : (vector<2x3xf32>) -> vector<3xf32>
    "func.return"(%1, %2) : (vector<3xf32>, vector<3xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (f32, f32) -> (vector<2x2xf32>, vector<2x2xf32>), sym_name = "extract_2d_from_from_elements"}> ({
  ^bb0(%arg0: f32, %arg1: f32):
    %0 = "vector.from_elements"(%arg0, %arg0, %arg0, %arg1, %arg1, %arg1, %arg1, %arg0, %arg1, %arg0, %arg0, %arg1) : (f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32) -> vector<3x2x2xf32>
    %1 = "vector.extract"(%0) <{static_position = array<i64: 0>}> : (vector<3x2x2xf32>) -> vector<2x2xf32>
    %2 = "vector.extract"(%0) <{static_position = array<i64: 1>}> : (vector<3x2x2xf32>) -> vector<2x2xf32>
    "func.return"(%1, %2) : (vector<2x2xf32>, vector<2x2xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (f32, f32) -> (vector<2x3xf32>, vector<2x3xf32>, vector<f32>), sym_name = "from_elements_to_splat"}> ({
  ^bb0(%arg0: f32, %arg1: f32):
    %0 = "vector.from_elements"(%arg0, %arg0, %arg0, %arg0, %arg0, %arg0) : (f32, f32, f32, f32, f32, f32) -> vector<2x3xf32>
    %1 = "vector.from_elements"(%arg0, %arg0, %arg0, %arg0, %arg1, %arg0) : (f32, f32, f32, f32, f32, f32) -> vector<2x3xf32>
    %2 = "vector.from_elements"(%arg0) : (f32) -> vector<f32>
    "func.return"(%0, %1, %2) : (vector<2x3xf32>, vector<2x3xf32>, vector<f32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<1x2xi8>) -> vector<2xi8>, sym_name = "to_shape_cast_rank2_to_rank1"}> ({
  ^bb0(%arg0: vector<1x2xi8>):
    %0 = "vector.extract"(%arg0) <{static_position = array<i64: 0, 0>}> : (vector<1x2xi8>) -> i8
    %1 = "vector.extract"(%arg0) <{static_position = array<i64: 0, 1>}> : (vector<1x2xi8>) -> i8
    %2 = "vector.from_elements"(%0, %1) : (i8, i8) -> vector<2xi8>
    "func.return"(%2) : (vector<2xi8>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<8xi8>) -> vector<2x2x2xi8>, sym_name = "to_shape_cast_rank1_to_rank3"}> ({
  ^bb0(%arg0: vector<8xi8>):
    %0 = "vector.extract"(%arg0) <{static_position = array<i64: 0>}> : (vector<8xi8>) -> i8
    %1 = "vector.extract"(%arg0) <{static_position = array<i64: 1>}> : (vector<8xi8>) -> i8
    %2 = "vector.extract"(%arg0) <{static_position = array<i64: 2>}> : (vector<8xi8>) -> i8
    %3 = "vector.extract"(%arg0) <{static_position = array<i64: 3>}> : (vector<8xi8>) -> i8
    %4 = "vector.extract"(%arg0) <{static_position = array<i64: 4>}> : (vector<8xi8>) -> i8
    %5 = "vector.extract"(%arg0) <{static_position = array<i64: 5>}> : (vector<8xi8>) -> i8
    %6 = "vector.extract"(%arg0) <{static_position = array<i64: 6>}> : (vector<8xi8>) -> i8
    %7 = "vector.extract"(%arg0) <{static_position = array<i64: 7>}> : (vector<8xi8>) -> i8
    %8 = "vector.from_elements"(%0, %1, %2, %3, %4, %5, %6, %7) : (i8, i8, i8, i8, i8, i8, i8, i8) -> vector<2x2x2xi8>
    "func.return"(%8) : (vector<2x2x2xi8>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<2x3x4xi8>) -> vector<12xi8>, sym_name = "source_larger_than_out"}> ({
  ^bb0(%arg0: vector<2x3x4xi8>):
    %0 = "vector.extract"(%arg0) <{static_position = array<i64: 1, 0, 0>}> : (vector<2x3x4xi8>) -> i8
    %1 = "vector.extract"(%arg0) <{static_position = array<i64: 1, 0, 1>}> : (vector<2x3x4xi8>) -> i8
    %2 = "vector.extract"(%arg0) <{static_position = array<i64: 1, 0, 2>}> : (vector<2x3x4xi8>) -> i8
    %3 = "vector.extract"(%arg0) <{static_position = array<i64: 1, 0, 3>}> : (vector<2x3x4xi8>) -> i8
    %4 = "vector.extract"(%arg0) <{static_position = array<i64: 1, 1, 0>}> : (vector<2x3x4xi8>) -> i8
    %5 = "vector.extract"(%arg0) <{static_position = array<i64: 1, 1, 1>}> : (vector<2x3x4xi8>) -> i8
    %6 = "vector.extract"(%arg0) <{static_position = array<i64: 1, 1, 2>}> : (vector<2x3x4xi8>) -> i8
    %7 = "vector.extract"(%arg0) <{static_position = array<i64: 1, 1, 3>}> : (vector<2x3x4xi8>) -> i8
    %8 = "vector.extract"(%arg0) <{static_position = array<i64: 1, 2, 0>}> : (vector<2x3x4xi8>) -> i8
    %9 = "vector.extract"(%arg0) <{static_position = array<i64: 1, 2, 1>}> : (vector<2x3x4xi8>) -> i8
    %10 = "vector.extract"(%arg0) <{static_position = array<i64: 1, 2, 2>}> : (vector<2x3x4xi8>) -> i8
    %11 = "vector.extract"(%arg0) <{static_position = array<i64: 1, 2, 3>}> : (vector<2x3x4xi8>) -> i8
    %12 = "vector.from_elements"(%0, %1, %2, %3, %4, %5, %6, %7, %8, %9, %10, %11) : (i8, i8, i8, i8, i8, i8, i8, i8, i8, i8, i8, i8) -> vector<12xi8>
    "func.return"(%12) : (vector<12xi8>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<2x3xi8>) -> vector<3xi8>, sym_name = "suffix_with_excess_zeros"}> ({
  ^bb0(%arg0: vector<2x3xi8>):
    %0 = "vector.extract"(%arg0) <{static_position = array<i64: 0, 0>}> : (vector<2x3xi8>) -> i8
    %1 = "vector.extract"(%arg0) <{static_position = array<i64: 0, 1>}> : (vector<2x3xi8>) -> i8
    %2 = "vector.extract"(%arg0) <{static_position = array<i64: 0, 2>}> : (vector<2x3xi8>) -> i8
    %3 = "vector.from_elements"(%0, %1, %2) : (i8, i8, i8) -> vector<3xi8>
    "func.return"(%3) : (vector<3xi8>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<2x2x2x2xi8>) -> vector<1x4x1xi8>, sym_name = "large_source_with_shape_cast_required"}> ({
  ^bb0(%arg1: vector<2x2x2x2xi8>):
    %2 = "vector.extract"(%arg1) <{static_position = array<i64: 0, 1, 0, 0>}> : (vector<2x2x2x2xi8>) -> i8
    %3 = "vector.extract"(%arg1) <{static_position = array<i64: 0, 1, 0, 1>}> : (vector<2x2x2x2xi8>) -> i8
    %4 = "vector.extract"(%arg1) <{static_position = array<i64: 0, 1, 1, 0>}> : (vector<2x2x2x2xi8>) -> i8
    %5 = "vector.extract"(%arg1) <{static_position = array<i64: 0, 1, 1, 1>}> : (vector<2x2x2x2xi8>) -> i8
    %6 = "vector.from_elements"(%2, %3, %4, %5) : (i8, i8, i8, i8) -> vector<1x4x1xi8>
    "func.return"(%6) : (vector<1x4x1xi8>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<2x3xi8>) -> vector<1xi8>, sym_name = "extract_single_elm"}> ({
  ^bb0(%arg0: vector<2x3xi8>):
    %0 = "vector.extract"(%arg0) <{static_position = array<i64: 0, 0>}> : (vector<2x3xi8>) -> i8
    %1 = "vector.from_elements"(%0) : (i8) -> vector<1xi8>
    "func.return"(%1) : (vector<1xi8>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<2x3xi8>) -> vector<3xi8>, sym_name = "negative_source_contiguous_but_not_suffix"}> ({
  ^bb0(%arg0: vector<2x3xi8>):
    %0 = "vector.extract"(%arg0) <{static_position = array<i64: 0, 1>}> : (vector<2x3xi8>) -> i8
    %1 = "vector.extract"(%arg0) <{static_position = array<i64: 0, 2>}> : (vector<2x3xi8>) -> i8
    %2 = "vector.extract"(%arg0) <{static_position = array<i64: 1, 0>}> : (vector<2x3xi8>) -> i8
    %3 = "vector.from_elements"(%0, %1, %2) : (i8, i8, i8) -> vector<3xi8>
    "func.return"(%3) : (vector<3xi8>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<1x2xi8>) -> vector<2xi8>, sym_name = "negative_nonascending_order"}> ({
  ^bb0(%arg0: vector<1x2xi8>):
    %0 = "vector.extract"(%arg0) <{static_position = array<i64: 0, 1>}> : (vector<1x2xi8>) -> i8
    %1 = "vector.extract"(%arg0) <{static_position = array<i64: 0, 0>}> : (vector<1x2xi8>) -> i8
    %2 = "vector.from_elements"(%0, %1) : (i8, i8) -> vector<2xi8>
    "func.return"(%2) : (vector<2xi8>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<1x2xi8>, index, index) -> vector<2xi8>, sym_name = "negative_nonstatic_extract"}> ({
  ^bb0(%arg0: vector<1x2xi8>, %arg1: index, %arg2: index):
    %0 = "vector.extract"(%arg0, %arg1) <{static_position = array<i64: 0, -9223372036854775808>}> : (vector<1x2xi8>, index) -> i8
    %1 = "vector.extract"(%arg0, %arg2) <{static_position = array<i64: 0, -9223372036854775808>}> : (vector<1x2xi8>, index) -> i8
    %2 = "vector.from_elements"(%0, %1) : (i8, i8) -> vector<2xi8>
    "func.return"(%2) : (vector<2xi8>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<1x2xi8>, vector<1x2xi8>) -> vector<2xi8>, sym_name = "negative_different_sources"}> ({
  ^bb0(%arg0: vector<1x2xi8>, %arg1: vector<1x2xi8>):
    %0 = "vector.extract"(%arg0) <{static_position = array<i64: 0, 0>}> : (vector<1x2xi8>) -> i8
    %1 = "vector.extract"(%arg1) <{static_position = array<i64: 0, 1>}> : (vector<1x2xi8>) -> i8
    %2 = "vector.from_elements"(%0, %1) : (i8, i8) -> vector<2xi8>
    "func.return"(%2) : (vector<2xi8>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<1x3xi8>) -> vector<2xi8>, sym_name = "negative_source_not_suffix"}> ({
  ^bb0(%arg0: vector<1x3xi8>):
    %0 = "vector.extract"(%arg0) <{static_position = array<i64: 0, 0>}> : (vector<1x3xi8>) -> i8
    %1 = "vector.extract"(%arg0) <{static_position = array<i64: 0, 1>}> : (vector<1x3xi8>) -> i8
    %2 = "vector.from_elements"(%0, %1) : (i8, i8) -> vector<2xi8>
    "func.return"(%2) : (vector<2xi8>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<1x3xi8>) -> vector<3xi8>, sym_name = "negative_nobijection_order"}> ({
  ^bb0(%arg0: vector<1x3xi8>):
    %0 = "vector.extract"(%arg0) <{static_position = array<i64: 0, 1>}> : (vector<1x3xi8>) -> i8
    %1 = "vector.extract"(%arg0) <{static_position = array<i64: 0, 2>}> : (vector<1x3xi8>) -> i8
    %2 = "vector.from_elements"(%0, %0, %1) : (i8, i8, i8) -> vector<3xi8>
    "func.return"(%2) : (vector<3xi8>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<2xi8>) -> vector<4xi8>, sym_name = "negative_source_too_small"}> ({
  ^bb0(%arg0: vector<2xi8>):
    %0 = "vector.extract"(%arg0) <{static_position = array<i64: 0>}> : (vector<2xi8>) -> i8
    %1 = "vector.extract"(%arg0) <{static_position = array<i64: 1>}> : (vector<2xi8>) -> i8
    %2 = "vector.from_elements"(%0, %1, %1, %1) : (i8, i8, i8, i8) -> vector<4xi8>
    "func.return"(%2) : (vector<4xi8>) -> ()
  }) : () -> ()
}) : () -> ()

