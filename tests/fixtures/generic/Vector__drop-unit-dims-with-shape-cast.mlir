"builtin.module"() ({
  "func.func"() <{function_type = (vector<1x8xi32>) -> vector<1x8xi32>, sym_name = "fold_unit_dim_add_basic"}> ({
  ^bb0(%arg0: vector<1x8xi32>):
    %0 = "arith.addi"(%arg0, %arg0) <{overflowFlags = #arith.overflow<none>}> : (vector<1x8xi32>, vector<1x8xi32>) -> vector<1x8xi32>
    "func.return"(%0) : (vector<1x8xi32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<1x8x1xi32>) -> vector<1x8x1xi32>, sym_name = "fold_unit_dim_add_leading_and_trailing"}> ({
  ^bb0(%arg0: vector<1x8x1xi32>):
    %0 = "arith.addi"(%arg0, %arg0) <{overflowFlags = #arith.overflow<none>}> : (vector<1x8x1xi32>, vector<1x8x1xi32>) -> vector<1x8x1xi32>
    "func.return"(%0) : (vector<1x8x1xi32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<8x1xi32>, vector<1x8xi32>) -> vector<8xi32>, sym_name = "fold_unit_dim_add"}> ({
  ^bb0(%arg0: vector<8x1xi32>, %arg1: vector<1x8xi32>):
    %0 = "vector.shape_cast"(%arg0) : (vector<8x1xi32>) -> vector<1x8xi32>
    %1 = "arith.addi"(%0, %arg1) <{overflowFlags = #arith.overflow<none>}> : (vector<1x8xi32>, vector<1x8xi32>) -> vector<1x8xi32>
    %2 = "vector.shape_cast"(%1) : (vector<1x8xi32>) -> vector<8xi32>
    "func.return"(%2) : (vector<8xi32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<8x[2]x1xf32>, vector<1x8x[2]xf32>) -> vector<8x[2]xf32>, sym_name = "fold_unit_dim_mulf"}> ({
  ^bb0(%arg0: vector<8x[2]x1xf32>, %arg1: vector<1x8x[2]xf32>):
    %0 = "vector.shape_cast"(%arg0) : (vector<8x[2]x1xf32>) -> vector<1x8x[2]xf32>
    %1 = "arith.mulf"(%0, %arg1) <{fastmath = #arith.fastmath<none>}> : (vector<1x8x[2]xf32>, vector<1x8x[2]xf32>) -> vector<1x8x[2]xf32>
    %2 = "vector.shape_cast"(%1) : (vector<1x8x[2]xf32>) -> vector<8x[2]xf32>
    "func.return"(%2) : (vector<8x[2]xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<8x[2]x1xi8>) -> vector<8x[2]xf32>, sym_name = "fold_unit_dim_sitofp"}> ({
  ^bb0(%arg0: vector<8x[2]x1xi8>):
    %0 = "vector.shape_cast"(%arg0) : (vector<8x[2]x1xi8>) -> vector<1x8x[2]xi8>
    %1 = "arith.sitofp"(%0) : (vector<1x8x[2]xi8>) -> vector<1x8x[2]xf32>
    %2 = "vector.shape_cast"(%1) : (vector<1x8x[2]xf32>) -> vector<8x[2]xf32>
    "func.return"(%2) : (vector<8x[2]xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<8xi32>, vector<8xi32>, vector<8xi32>) -> vector<8xi32>, sym_name = "fold_unit_dims_entirely"}> ({
  ^bb0(%arg0: vector<8xi32>, %arg1: vector<8xi32>, %arg2: vector<8xi32>):
    %0 = "vector.shape_cast"(%arg0) : (vector<8xi32>) -> vector<1x8xi32>
    %1 = "vector.shape_cast"(%arg1) : (vector<8xi32>) -> vector<1x8xi32>
    %2 = "vector.shape_cast"(%arg2) : (vector<8xi32>) -> vector<1x8xi32>
    %3 = "arith.muli"(%0, %1) <{overflowFlags = #arith.overflow<none>}> : (vector<1x8xi32>, vector<1x8xi32>) -> vector<1x8xi32>
    %4 = "arith.addi"(%3, %2) <{overflowFlags = #arith.overflow<none>}> : (vector<1x8xi32>, vector<1x8xi32>) -> vector<1x8xi32>
    %5 = "vector.shape_cast"(%4) : (vector<1x8xi32>) -> vector<8xi32>
    "func.return"(%5) : (vector<8xi32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<8x1x3xf128>, vector<1x8x3xf128>) -> vector<8x3xf128>, sym_name = "fold_inner_unit_dim"}> ({
  ^bb0(%arg0: vector<8x1x3xf128>, %arg1: vector<1x8x3xf128>):
    %0 = "vector.shape_cast"(%arg1) : (vector<1x8x3xf128>) -> vector<8x1x3xf128>
    %1 = "arith.mulf"(%arg0, %0) <{fastmath = #arith.fastmath<none>}> : (vector<8x1x3xf128>, vector<8x1x3xf128>) -> vector<8x1x3xf128>
    %2 = "vector.shape_cast"(%1) : (vector<8x1x3xf128>) -> vector<8x3xf128>
    "func.return"(%2) : (vector<8x3xf128>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<8x1x[1]x3xf128>, vector<1x8x[1]x3xf128>) -> vector<8x[1]x3xf128>, sym_name = "fold_inner_unit_dim_scalable"}> ({
  ^bb0(%arg0: vector<8x1x[1]x3xf128>, %arg1: vector<1x8x[1]x3xf128>):
    %0 = "vector.shape_cast"(%arg1) : (vector<1x8x[1]x3xf128>) -> vector<8x1x[1]x3xf128>
    %1 = "arith.mulf"(%arg0, %0) <{fastmath = #arith.fastmath<none>}> : (vector<8x1x[1]x3xf128>, vector<8x1x[1]x3xf128>) -> vector<8x1x[1]x3xf128>
    %2 = "vector.shape_cast"(%1) : (vector<8x1x[1]x3xf128>) -> vector<8x[1]x3xf128>
    "func.return"(%2) : (vector<8x[1]x3xf128>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<1x1xf32>) -> vector<1xf32>, sym_name = "fold_all_unit_dims"}> ({
  ^bb0(%arg1: vector<1x1xf32>):
    %1 = "arith.mulf"(%arg1, %arg1) <{fastmath = #arith.fastmath<none>}> : (vector<1x1xf32>, vector<1x1xf32>) -> vector<1x1xf32>
    %2 = "vector.shape_cast"(%1) : (vector<1x1xf32>) -> vector<1xf32>
    "func.return"(%2) : (vector<1xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<1x1x4x[4]xf32>) -> vector<[4]x1x1x4xf32>, sym_name = "transpose_with_internal_unit_dims"}> ({
  ^bb0(%arg0: vector<1x1x4x[4]xf32>):
    %0 = "vector.transpose"(%arg0) <{permutation = array<i64: 3, 0, 1, 2>}> : (vector<1x1x4x[4]xf32>) -> vector<[4]x1x1x4xf32>
    "func.return"(%0) : (vector<[4]x1x1x4xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<[1]x1x2x4x1xf32>) -> vector<1x1x4x2x[1]xf32>, sym_name = "transpose_with_scalable_unit_dims"}> ({
  ^bb0(%arg0: vector<[1]x1x2x4x1xf32>):
    %0 = "vector.transpose"(%arg0) <{permutation = array<i64: 4, 1, 3, 2, 0>}> : (vector<[1]x1x2x4x1xf32>) -> vector<1x1x4x2x[1]xf32>
    "func.return"(%0) : (vector<1x1x4x2x[1]xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<1x1x1xf32>) -> vector<1x1x1xf32>, sym_name = "transpose_with_all_unit_dims"}> ({
  ^bb0(%arg0: vector<1x1x1xf32>):
    %0 = "vector.transpose"(%arg0) <{permutation = array<i64: 0, 2, 1>}> : (vector<1x1x1xf32>) -> vector<1x1x1xf32>
    "func.return"(%0) : (vector<1x1x1xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<4x2x3xf32>) -> vector<4x3x2xf32>, sym_name = "negative_transpose_with_no_unit_dims"}> ({
  ^bb0(%arg0: vector<4x2x3xf32>):
    %0 = "vector.transpose"(%arg0) <{permutation = array<i64: 0, 2, 1>}> : (vector<4x2x3xf32>) -> vector<4x3x2xf32>
    "func.return"(%0) : (vector<4x3x2xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<4x1x1x[4]xf32>) -> vector<4x1x1x[4]xf32>, sym_name = "scf_for_with_internal_unit_dims"}> ({
  ^bb0(%arg0: vector<4x1x1x[4]xf32>):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = 1 : index}> : () -> index
    %2 = "arith.constant"() <{value = 4 : index}> : () -> index
    %3 = "scf.for"(%0, %2, %1, %arg0) ({
    ^bb0(%arg1: index, %arg2: vector<4x1x1x[4]xf32>):
      %4 = "math.sqrt"(%arg2) <{fastmath = #arith.fastmath<none>}> : (vector<4x1x1x[4]xf32>) -> vector<4x1x1x[4]xf32>
      "scf.yield"(%4) : (vector<4x1x1x[4]xf32>) -> ()
    }) : (index, index, index, vector<4x1x1x[4]xf32>) -> vector<4x1x1x[4]xf32>
    "func.return"(%3) : (vector<4x1x1x[4]xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<1x1xf32>) -> vector<1x1xf32>, sym_name = "scf_for_with_all_unit_dims"}> ({
  ^bb0(%arg0: vector<1x1xf32>):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = 1 : index}> : () -> index
    %2 = "arith.constant"() <{value = 4 : index}> : () -> index
    %3 = "scf.for"(%0, %2, %1, %arg0) ({
    ^bb0(%arg1: index, %arg2: vector<1x1xf32>):
      %4 = "math.sqrt"(%arg2) <{fastmath = #arith.fastmath<none>}> : (vector<1x1xf32>) -> vector<1x1xf32>
      "scf.yield"(%4) : (vector<1x1xf32>) -> ()
    }) : (index, index, index, vector<1x1xf32>) -> vector<1x1xf32>
    "func.return"(%3) : (vector<1x1xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (index, vector<1x4xf32>, vector<1x4xf32>) -> vector<1x4xf32>, sym_name = "scf_for_with_multiple_operands"}> ({
  ^bb0(%arg0: index, %arg1: vector<1x4xf32>, %arg2: vector<1x4xf32>):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = 1 : index}> : () -> index
    %2 = "arith.constant"() <{value = 4 : index}> : () -> index
    %3:3 = "scf.for"(%0, %2, %1, %arg0, %arg1, %arg2) ({
    ^bb0(%arg3: index, %arg4: index, %arg5: vector<1x4xf32>, %arg6: vector<1x4xf32>):
      %4 = "arith.addf"(%arg5, %arg6) <{fastmath = #arith.fastmath<none>}> : (vector<1x4xf32>, vector<1x4xf32>) -> vector<1x4xf32>
      "scf.yield"(%arg4, %4, %4) : (index, vector<1x4xf32>, vector<1x4xf32>) -> ()
    }) : (index, index, index, index, vector<1x4xf32>, vector<1x4xf32>) -> (index, vector<1x4xf32>, vector<1x4xf32>)
    "func.return"(%3#1) : (vector<1x4xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<1x[1]xf32>) -> vector<1x[1]xf32>, sym_name = "scf_for_with_scalable_unit_dims"}> ({
  ^bb0(%arg0: vector<1x[1]xf32>):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = 1 : index}> : () -> index
    %2 = "arith.constant"() <{value = 4 : index}> : () -> index
    %3 = "scf.for"(%0, %2, %1, %arg0) ({
    ^bb0(%arg1: index, %arg2: vector<1x[1]xf32>):
      %4 = "math.sqrt"(%arg2) <{fastmath = #arith.fastmath<none>}> : (vector<1x[1]xf32>) -> vector<1x[1]xf32>
      "scf.yield"(%4) : (vector<1x[1]xf32>) -> ()
    }) : (index, index, index, vector<1x[1]xf32>) -> vector<1x[1]xf32>
    "func.return"(%3) : (vector<1x[1]xf32>) -> ()
  }) : () -> ()
}) : () -> ()

