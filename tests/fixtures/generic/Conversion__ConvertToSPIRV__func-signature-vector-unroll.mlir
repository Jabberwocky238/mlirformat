"builtin.module"() ({
  "func.func"() <{function_type = (i32) -> i32, sym_name = "simple_scalar"}> ({
  ^bb0(%arg0: i32):
    "func.return"(%arg0) : (i32) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<4xi32>) -> vector<4xi32>, sym_name = "simple_vector_4"}> ({
  ^bb0(%arg0: vector<4xi32>):
    "func.return"(%arg0) : (vector<4xi32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<5xi32>) -> vector<5xi32>, sym_name = "simple_vector_5"}> ({
  ^bb0(%arg0: vector<5xi32>):
    "func.return"(%arg0) : (vector<5xi32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<6xi32>) -> vector<6xi32>, sym_name = "simple_vector_6"}> ({
  ^bb0(%arg0: vector<6xi32>):
    "func.return"(%arg0) : (vector<6xi32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<8xi32>) -> vector<8xi32>, sym_name = "simple_vector_8"}> ({
  ^bb0(%arg0: vector<8xi32>):
    "func.return"(%arg0) : (vector<8xi32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<4x4xi32>) -> vector<4x4xi32>, sym_name = "simple_vector_2d"}> ({
  ^bb0(%arg0: vector<4x4xi32>):
    "func.return"(%arg0) : (vector<4x4xi32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<6xi32>, vector<8xi32>) -> (vector<6xi32>, vector<8xi32>), sym_name = "vector_6and8"}> ({
  ^bb0(%arg0: vector<6xi32>, %arg1: vector<8xi32>):
    "func.return"(%arg0, %arg1) : (vector<6xi32>, vector<8xi32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<3xi32>, vector<8xi32>) -> (vector<3xi32>, vector<8xi32>), sym_name = "vector_3and8"}> ({
  ^bb0(%arg0: vector<3xi32>, %arg1: vector<8xi32>):
    "func.return"(%arg0, %arg1) : (vector<3xi32>, vector<8xi32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<8xi32>, vector<3xi32>, i32) -> (vector<8xi32>, vector<3xi32>, i32), sym_name = "scalar_vector"}> ({
  ^bb0(%arg0: vector<8xi32>, %arg1: vector<3xi32>, %arg2: i32):
    "func.return"(%arg0, %arg1, %arg2) : (vector<8xi32>, vector<3xi32>, i32) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<2x6xi32>, vector<4xi32>) -> (vector<2x6xi32>, vector<4xi32>), sym_name = "vector_2dand1d"}> ({
  ^bb0(%arg0: vector<2x6xi32>, %arg1: vector<4xi32>):
    "func.return"(%arg0, %arg1) : (vector<2x6xi32>, vector<4xi32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<8xi32>, vector<8xi32>, i32) -> i32, sym_name = "reduction"}> ({
  ^bb0(%arg0: vector<8xi32>, %arg1: vector<8xi32>, %arg2: i32):
    %0 = "arith.addi"(%arg0, %arg1) <{overflowFlags = #arith.overflow<none>}> : (vector<8xi32>, vector<8xi32>) -> vector<8xi32>
    %1 = "vector.reduction"(%0) <{fastmath = #arith.fastmath<none>, kind = #vector.kind<add>}> : (vector<8xi32>) -> i32
    %2 = "arith.addi"(%1, %arg2) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
    "func.return"(%2) : (i32) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<8xi32>) -> (), sym_name = "unsupported_decl", sym_visibility = "private"}> ({
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<[8]xi32>) -> vector<[8]xi32>, sym_name = "unsupported_scalable"}> ({
  ^bb0(%arg0: vector<[8]xi32>):
    "func.return"(%arg0) : (vector<[8]xi32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (i32, i32) -> i32, sym_name = "legal_params_multiple_blocks_simple"}> ({
  ^bb0(%arg0: i32, %arg1: i32):
    "cf.br"(%arg0)[^bb1] : (i32) -> ()
  ^bb1(%0: i32):  // pred: ^bb0
    %1 = "arith.addi"(%0, %arg1) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
    "cf.br"(%1)[^bb2] : (i32) -> ()
  ^bb2(%2: i32):  // pred: ^bb1
    %3 = "arith.addi"(%2, %arg1) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
    "cf.br"(%3)[^bb3] : (i32) -> ()
  ^bb3(%4: i32):  // pred: ^bb2
    "func.return"(%4) : (i32) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (i32, i32, vector<4xi32>) -> vector<4xi32>, sym_name = "legal_params_with_vec_insert_multiple_blocks"}> ({
  ^bb0(%arg0: i32, %arg1: i32, %arg2: vector<4xi32>):
    "cf.br"(%arg0)[^bb1] : (i32) -> ()
  ^bb1(%0: i32):  // pred: ^bb0
    %1 = "arith.addi"(%0, %arg1) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
    "cf.br"(%1)[^bb2] : (i32) -> ()
  ^bb2(%2: i32):  // pred: ^bb1
    %3 = "arith.addi"(%2, %arg1) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
    "cf.br"(%3)[^bb3] : (i32) -> ()
  ^bb3(%4: i32):  // pred: ^bb2
    %5 = "vector.broadcast"(%4) : (i32) -> vector<1xi32>
    %6 = "vector.insert_strided_slice"(%5, %arg2) <{offsets = [1], strides = [1]}> : (vector<1xi32>, vector<4xi32>) -> vector<4xi32>
    %7 = "vector.insert_strided_slice"(%5, %6) <{offsets = [2], strides = [1]}> : (vector<1xi32>, vector<4xi32>) -> vector<4xi32>
    %8 = "vector.insert_strided_slice"(%5, %7) <{offsets = [3], strides = [1]}> : (vector<1xi32>, vector<4xi32>) -> vector<4xi32>
    "func.return"(%8) : (vector<4xi32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (i32, i32, i32) -> i32, sym_name = "legal_params_for_loop"}> ({
  ^bb0(%arg0: i32, %arg1: i32, %arg2: i32):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = 1 : index}> : () -> index
    %2 = "arith.index_cast"(%arg2) : (i32) -> index
    %3 = "scf.for"(%0, %2, %1, %arg0) ({
    ^bb0(%arg3: index, %arg4: i32):
      %4 = "arith.addi"(%arg4, %arg1) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
      "scf.yield"(%4) : (i32) -> ()
    }) : (index, index, index, i32) -> i32
    "func.return"(%3) : (i32) -> ()
  }) : () -> ()
}) : () -> ()

