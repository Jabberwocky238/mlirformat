"builtin.module"() ({
  "func.func"() <{function_type = (vector<6xi32>, vector<6xi32>) -> vector<6xi32>, sym_name = "vaddi"}> ({
  ^bb0(%arg4: vector<6xi32>, %arg5: vector<6xi32>):
    %2 = "arith.addi"(%arg4, %arg5) <{overflowFlags = #arith.overflow<none>}> : (vector<6xi32>, vector<6xi32>) -> vector<6xi32>
    "func.return"(%2) : (vector<6xi32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<2x2xi32>, vector<2x2xi32>) -> vector<2x2xi32>, sym_name = "vaddi_2d"}> ({
  ^bb0(%arg2: vector<2x2xi32>, %arg3: vector<2x2xi32>):
    %1 = "arith.addi"(%arg2, %arg3) <{overflowFlags = #arith.overflow<none>}> : (vector<2x2xi32>, vector<2x2xi32>) -> vector<2x2xi32>
    "func.return"(%1) : (vector<2x2xi32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<2x8xi32>, vector<2x8xi32>) -> vector<2x8xi32>, sym_name = "vaddi_2d_8"}> ({
  ^bb0(%arg0: vector<2x8xi32>, %arg1: vector<2x8xi32>):
    %0 = "arith.addi"(%arg0, %arg1) <{overflowFlags = #arith.overflow<none>}> : (vector<2x8xi32>, vector<2x8xi32>) -> vector<2x8xi32>
    "func.return"(%0) : (vector<2x8xi32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<5xi32>) -> i32, sym_name = "reduction_5"}> ({
  ^bb0(%arg1: vector<5xi32>):
    %1 = "vector.reduction"(%arg1) <{fastmath = #arith.fastmath<none>, kind = #vector.kind<add>}> : (vector<5xi32>) -> i32
    "func.return"(%1) : (i32) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<8xi32>) -> i32, sym_name = "reduction_8"}> ({
  ^bb0(%arg0: vector<8xi32>):
    %0 = "vector.reduction"(%arg0) <{fastmath = #arith.fastmath<none>, kind = #vector.kind<add>}> : (vector<8xi32>) -> i32
    "func.return"(%0) : (i32) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<8xi32>, vector<8xi32>) -> i32, sym_name = "vaddi_reduction"}> ({
  ^bb0(%arg0: vector<8xi32>, %arg1: vector<8xi32>):
    %0 = "arith.addi"(%arg0, %arg1) <{overflowFlags = #arith.overflow<none>}> : (vector<8xi32>, vector<8xi32>) -> vector<8xi32>
    %1 = "vector.reduction"(%0) <{fastmath = #arith.fastmath<none>, kind = #vector.kind<add>}> : (vector<8xi32>) -> i32
    "func.return"(%1) : (i32) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<2x3xi32>) -> vector<3x2xi32>, sym_name = "transpose"}> ({
  ^bb0(%arg0: vector<2x3xi32>):
    %0 = "vector.transpose"(%arg0) <{permutation = array<i64: 1, 0>}> : (vector<2x3xi32>) -> vector<3x2xi32>
    "func.return"(%0) : (vector<3x2xi32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> (f32, f32, f32, f32), sym_name = "unroll_to_elements_2d"}> ({
    %0 = "test.op"() : () -> vector<2x2xf32>
    %1:4 = "vector.to_elements"(%0) : (vector<2x2xf32>) -> (f32, f32, f32, f32)
    "func.return"(%1#0, %1#1, %1#2, %1#3) : (f32, f32, f32, f32) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (f32, f32, f32, f32) -> vector<2x2xf32>, sym_name = "unroll_from_elements_2d"}> ({
  ^bb0(%arg0: f32, %arg1: f32, %arg2: f32, %arg3: f32):
    %0 = "vector.from_elements"(%arg0, %arg1, %arg2, %arg3) : (f32, f32, f32, f32) -> vector<2x2xf32>
    %1 = "arith.addf"(%0, %0) <{fastmath = #arith.fastmath<none>}> : (vector<2x2xf32>, vector<2x2xf32>) -> vector<2x2xf32>
    "func.return"(%1) : (vector<2x2xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<f32>) -> vector<f32>, sym_name = "zero_d_vector_return"}> ({
  ^bb0(%arg0: vector<f32>):
    "func.return"(%arg0) : (vector<f32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<f32>, vector<f32>) -> vector<f32>, sym_name = "zero_d_vector_elementwise"}> ({
  ^bb0(%arg0: vector<f32>, %arg1: vector<f32>):
    %0 = "arith.addf"(%arg0, %arg1) <{fastmath = #arith.fastmath<none>}> : (vector<f32>, vector<f32>) -> vector<f32>
    "func.return"(%0) : (vector<f32>) -> ()
  }) : () -> ()
}) : () -> ()

