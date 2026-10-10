"builtin.module"() ({
  "func.func"() <{function_type = () -> vector<8xindex>, sym_name = "constant_vec"}> ({
    %35 = "arith.constant"() <{value = dense<[0, 1, 2, 3, 4, 5, 6, 7]> : vector<8xindex>}> : () -> vector<8xindex>
    %36 = "test.reflect_bounds"(%35) : (vector<8xindex>) -> vector<8xindex>
    "func.return"(%36) : (vector<8xindex>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> vector<8xi32>, sym_name = "constant_splat"}> ({
    %33 = "arith.constant"() <{value = dense<3> : vector<8xi32>}> : () -> vector<8xi32>
    %34 = "test.reflect_bounds"(%33) : (vector<8xi32>) -> vector<8xi32>
    "func.return"(%34) : (vector<8xi32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> vector<8xf32>, sym_name = "float_constant_splat"}> ({
    %32 = "arith.constant"() <{value = dense<3.000000e+00> : vector<8xf32>}> : () -> vector<8xf32>
    "func.return"(%32) : (vector<8xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> vector<4xindex>, sym_name = "vector_splat"}> ({
    %29 = "test.with_bounds"() <{smax = 5 : index, smin = 4 : index, umax = 5 : index, umin = 4 : index}> : () -> index
    %30 = "vector.broadcast"(%29) : (index) -> vector<4xindex>
    %31 = "test.reflect_bounds"(%30) : (vector<4xindex>) -> vector<4xindex>
    "func.return"(%31) : (vector<4xindex>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> vector<4x16xindex>, sym_name = "vector_broadcast"}> ({
    %26 = "test.with_bounds"() <{smax = 5 : index, smin = 4 : index, umax = 5 : index, umin = 4 : index}> : () -> vector<16xindex>
    %27 = "vector.broadcast"(%26) : (vector<16xindex>) -> vector<4x16xindex>
    %28 = "test.reflect_bounds"(%27) : (vector<4x16xindex>) -> vector<4x16xindex>
    "func.return"(%28) : (vector<4x16xindex>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> vector<4x4xindex>, sym_name = "vector_shape_cast"}> ({
    %23 = "test.with_bounds"() <{smax = 5 : index, smin = 4 : index, umax = 5 : index, umin = 4 : index}> : () -> vector<16xindex>
    %24 = "vector.shape_cast"(%23) : (vector<16xindex>) -> vector<4x4xindex>
    %25 = "test.reflect_bounds"(%24) : (vector<4x4xindex>) -> vector<4x4xindex>
    "func.return"(%25) : (vector<4x4xindex>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> vector<2x4xindex>, sym_name = "vector_transpose"}> ({
    %20 = "test.with_bounds"() <{smax = 8 : index, smin = 7 : index, umax = 8 : index, umin = 7 : index}> : () -> vector<4x2xindex>
    %21 = "vector.transpose"(%20) <{permutation = array<i64: 1, 0>}> : (vector<4x2xindex>) -> vector<2x4xindex>
    %22 = "test.reflect_bounds"(%21) : (vector<2x4xindex>) -> vector<2x4xindex>
    "func.return"(%22) : (vector<2x4xindex>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> index, sym_name = "vector_extract"}> ({
    %17 = "test.with_bounds"() <{smax = 6 : index, smin = 5 : index, umax = 6 : index, umin = 5 : index}> : () -> vector<4xindex>
    %18 = "vector.extract"(%17) <{static_position = array<i64: 0>}> : (vector<4xindex>) -> index
    %19 = "test.reflect_bounds"(%18) : (index) -> index
    "func.return"(%19) : (index) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> vector<4xindex>, sym_name = "vector_add"}> ({
    %13 = "test.with_bounds"() <{smax = 5 : index, smin = 4 : index, umax = 5 : index, umin = 4 : index}> : () -> vector<4xindex>
    %14 = "test.with_bounds"() <{smax = 7 : index, smin = 6 : index, umax = 7 : index, umin = 6 : index}> : () -> vector<4xindex>
    %15 = "arith.addi"(%13, %14) <{overflowFlags = #arith.overflow<none>}> : (vector<4xindex>, vector<4xindex>) -> vector<4xindex>
    %16 = "test.reflect_bounds"(%15) : (vector<4xindex>) -> vector<4xindex>
    "func.return"(%16) : (vector<4xindex>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> vector<4xindex>, sym_name = "vector_insert"}> ({
    %9 = "test.with_bounds"() <{smax = 7 : index, smin = 5 : index, umax = 7 : index, umin = 5 : index}> : () -> vector<4xindex>
    %10 = "test.with_bounds"() <{smax = 8 : index, smin = 6 : index, umax = 8 : index, umin = 6 : index}> : () -> index
    %11 = "vector.insert"(%10, %9) <{static_position = array<i64: 0>}> : (index, vector<4xindex>) -> vector<4xindex>
    %12 = "test.reflect_bounds"(%11) : (vector<4xindex>) -> vector<4xindex>
    "func.return"(%12) : (vector<4xindex>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<16xi32>) -> i32, sym_name = "test_loaded_vector_extract"}> ({
  ^bb0(%arg0: memref<16xi32>):
    %5 = "arith.constant"() <{value = 0 : index}> : () -> index
    %6 = "vector.load"(%arg0, %5) : (memref<16xi32>, index) -> vector<4xi32>
    %7 = "vector.extract"(%6) <{static_position = array<i64: 0>}> : (vector<4xi32>) -> i32
    %8 = "test.reflect_bounds"(%7) : (i32) -> i32
    "func.return"(%8) : (i32) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> vector<2xi32>, sym_name = "test_vector_extsi"}> ({
    %2 = "test.with_bounds"() <{smax = 5 : si8, smin = 1 : si8, umax = 5 : ui8, umin = 1 : ui8}> : () -> vector<2xi8>
    %3 = "arith.extsi"(%2) : (vector<2xi8>) -> vector<2xi32>
    %4 = "test.reflect_bounds"(%3) : (vector<2xi32>) -> vector<2xi32>
    "func.return"(%4) : (vector<2xi32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> vector<8xindex>, sym_name = "vector_step"}> ({
    %0 = "vector.step"() : () -> vector<8xindex>
    %1 = "test.reflect_bounds"(%0) : (vector<8xindex>) -> vector<8xindex>
    "func.return"(%1) : (vector<8xindex>) -> ()
  }) : () -> ()
}) : () -> ()

