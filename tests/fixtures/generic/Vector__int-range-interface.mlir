"builtin.module"() ({
  "func.func"() <{function_type = () -> vector<8xindex>, sym_name = "constant_vec"}> ({
    %43 = "arith.constant"() <{value = dense<[0, 1, 2, 3, 4, 5, 6, 7]> : vector<8xindex>}> : () -> vector<8xindex>
    %44 = "test.reflect_bounds"(%43) : (vector<8xindex>) -> vector<8xindex>
    "func.return"(%44) : (vector<8xindex>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> vector<8xi32>, sym_name = "constant_splat"}> ({
    %41 = "arith.constant"() <{value = dense<3> : vector<8xi32>}> : () -> vector<8xi32>
    %42 = "test.reflect_bounds"(%41) : (vector<8xi32>) -> vector<8xi32>
    "func.return"(%42) : (vector<8xi32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> vector<8xf32>, sym_name = "float_constant_splat"}> ({
    %40 = "arith.constant"() <{value = dense<3.000000e+00> : vector<8xf32>}> : () -> vector<8xf32>
    "func.return"(%40) : (vector<8xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> vector<4xindex>, sym_name = "vector_splat"}> ({
    %37 = "test.with_bounds"() <{smax = 5 : index, smin = 4 : index, umax = 5 : index, umin = 4 : index}> : () -> index
    %38 = "vector.broadcast"(%37) : (index) -> vector<4xindex>
    %39 = "test.reflect_bounds"(%38) : (vector<4xindex>) -> vector<4xindex>
    "func.return"(%39) : (vector<4xindex>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> vector<4x16xindex>, sym_name = "vector_broadcast"}> ({
    %34 = "test.with_bounds"() <{smax = 5 : index, smin = 4 : index, umax = 5 : index, umin = 4 : index}> : () -> vector<16xindex>
    %35 = "vector.broadcast"(%34) : (vector<16xindex>) -> vector<4x16xindex>
    %36 = "test.reflect_bounds"(%35) : (vector<4x16xindex>) -> vector<4x16xindex>
    "func.return"(%36) : (vector<4x16xindex>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> vector<4x4xindex>, sym_name = "vector_shape_cast"}> ({
    %31 = "test.with_bounds"() <{smax = 5 : index, smin = 4 : index, umax = 5 : index, umin = 4 : index}> : () -> vector<16xindex>
    %32 = "vector.shape_cast"(%31) : (vector<16xindex>) -> vector<4x4xindex>
    %33 = "test.reflect_bounds"(%32) : (vector<4x4xindex>) -> vector<4x4xindex>
    "func.return"(%33) : (vector<4x4xindex>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> vector<2x4xindex>, sym_name = "vector_transpose"}> ({
    %28 = "test.with_bounds"() <{smax = 8 : index, smin = 7 : index, umax = 8 : index, umin = 7 : index}> : () -> vector<4x2xindex>
    %29 = "vector.transpose"(%28) <{permutation = array<i64: 1, 0>}> : (vector<4x2xindex>) -> vector<2x4xindex>
    %30 = "test.reflect_bounds"(%29) : (vector<2x4xindex>) -> vector<2x4xindex>
    "func.return"(%30) : (vector<2x4xindex>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> index, sym_name = "vector_extract"}> ({
    %25 = "test.with_bounds"() <{smax = 6 : index, smin = 5 : index, umax = 6 : index, umin = 5 : index}> : () -> vector<4xindex>
    %26 = "vector.extract"(%25) <{static_position = array<i64: 0>}> : (vector<4xindex>) -> index
    %27 = "test.reflect_bounds"(%26) : (index) -> index
    "func.return"(%27) : (index) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> vector<4xindex>, sym_name = "vector_add"}> ({
    %21 = "test.with_bounds"() <{smax = 5 : index, smin = 4 : index, umax = 5 : index, umin = 4 : index}> : () -> vector<4xindex>
    %22 = "test.with_bounds"() <{smax = 7 : index, smin = 6 : index, umax = 7 : index, umin = 6 : index}> : () -> vector<4xindex>
    %23 = "arith.addi"(%21, %22) <{overflowFlags = #arith.overflow<none>}> : (vector<4xindex>, vector<4xindex>) -> vector<4xindex>
    %24 = "test.reflect_bounds"(%23) : (vector<4xindex>) -> vector<4xindex>
    "func.return"(%24) : (vector<4xindex>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> vector<4xindex>, sym_name = "vector_insert"}> ({
    %17 = "test.with_bounds"() <{smax = 7 : index, smin = 5 : index, umax = 7 : index, umin = 5 : index}> : () -> vector<4xindex>
    %18 = "test.with_bounds"() <{smax = 8 : index, smin = 6 : index, umax = 8 : index, umin = 6 : index}> : () -> index
    %19 = "vector.insert"(%18, %17) <{static_position = array<i64: 0>}> : (index, vector<4xindex>) -> vector<4xindex>
    %20 = "test.reflect_bounds"(%19) : (vector<4xindex>) -> vector<4xindex>
    "func.return"(%20) : (vector<4xindex>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<16xi32>) -> i32, sym_name = "test_loaded_vector_extract"}> ({
  ^bb0(%arg0: memref<16xi32>):
    %13 = "arith.constant"() <{value = 0 : index}> : () -> index
    %14 = "vector.load"(%arg0, %13) : (memref<16xi32>, index) -> vector<4xi32>
    %15 = "vector.extract"(%14) <{static_position = array<i64: 0>}> : (vector<4xi32>) -> i32
    %16 = "test.reflect_bounds"(%15) : (i32) -> i32
    "func.return"(%16) : (i32) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> vector<2xi32>, sym_name = "test_vector_extsi"}> ({
    %10 = "test.with_bounds"() <{smax = 5 : si8, smin = 1 : si8, umax = 5 : ui8, umin = 1 : ui8}> : () -> vector<2xi8>
    %11 = "arith.extsi"(%10) : (vector<2xi8>) -> vector<2xi32>
    %12 = "test.reflect_bounds"(%11) : (vector<2xi32>) -> vector<2xi32>
    "func.return"(%12) : (vector<2xi32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> vector<8xindex>, sym_name = "vector_step"}> ({
    %8 = "vector.step"() : () -> vector<8xindex>
    %9 = "test.reflect_bounds"(%8) : (vector<8xindex>) -> vector<8xindex>
    "func.return"(%9) : (vector<8xindex>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> vector<8xi32>, sym_name = "vector_step_i32"}> ({
    %6 = "vector.step"() : () -> vector<8xi32>
    %7 = "test.reflect_bounds"(%6) : (vector<8xi32>) -> vector<8xi32>
    "func.return"(%7) : (vector<8xi32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> vector<255xi8>, sym_name = "vector_step_i8_no_wrap_boundary"}> ({
    %4 = "vector.step"() : () -> vector<255xi8>
    %5 = "test.reflect_bounds"(%4) : (vector<255xi8>) -> vector<255xi8>
    "func.return"(%5) : (vector<255xi8>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> vector<256xi8>, sym_name = "vector_step_i8_exact_fit"}> ({
    %2 = "vector.step"() : () -> vector<256xi8>
    %3 = "test.reflect_bounds"(%2) : (vector<256xi8>) -> vector<256xi8>
    "func.return"(%3) : (vector<256xi8>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> vector<300xi8>, sym_name = "vector_step_i8_wrap"}> ({
    %0 = "vector.step"() : () -> vector<300xi8>
    %1 = "test.reflect_bounds"(%0) : (vector<300xi8>) -> vector<300xi8>
    "func.return"(%1) : (vector<300xi8>) -> ()
  }) : () -> ()
}) : () -> ()

