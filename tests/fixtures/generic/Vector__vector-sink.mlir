"builtin.module"() ({
  "func.func"() <{function_type = (index, index) -> vector<1x4xindex>, sym_name = "broadcast_scalar_with_bcast"}> ({
  ^bb0(%arg2: index, %arg3: index):
    %3 = "vector.broadcast"(%arg2) : (index) -> vector<1x4xindex>
    %4 = "vector.broadcast"(%arg3) : (index) -> vector<1x4xindex>
    %5 = "arith.addi"(%3, %4) <{overflowFlags = #arith.overflow<none>}> : (vector<1x4xindex>, vector<1x4xindex>) -> vector<1x4xindex>
    "func.return"(%5) : (vector<1x4xindex>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (index, index) -> vector<1x[4]xindex>, sym_name = "broadcast_scalar_with_bcast_scalable"}> ({
  ^bb0(%arg0: index, %arg1: index):
    %0 = "vector.broadcast"(%arg0) : (index) -> vector<1x[4]xindex>
    %1 = "vector.broadcast"(%arg1) : (index) -> vector<1x[4]xindex>
    %2 = "arith.addi"(%0, %1) <{overflowFlags = #arith.overflow<none>}> : (vector<1x[4]xindex>, vector<1x[4]xindex>) -> vector<1x[4]xindex>
    "func.return"(%2) : (vector<1x[4]xindex>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (index, index) -> vector<1x4xindex>, sym_name = "broadcast_scalar_with_bcast_and_splat"}> ({
  ^bb0(%arg2: index, %arg3: index):
    %3 = "vector.broadcast"(%arg2) : (index) -> vector<1x4xindex>
    %4 = "vector.broadcast"(%arg3) : (index) -> vector<1x4xindex>
    %5 = "arith.addi"(%3, %4) <{overflowFlags = #arith.overflow<none>}> : (vector<1x4xindex>, vector<1x4xindex>) -> vector<1x4xindex>
    "func.return"(%5) : (vector<1x4xindex>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (index, index) -> vector<1x[4]xindex>, sym_name = "broadcast_scalar_with_bcast_and_splat_scalable"}> ({
  ^bb0(%arg0: index, %arg1: index):
    %0 = "vector.broadcast"(%arg0) : (index) -> vector<1x[4]xindex>
    %1 = "vector.broadcast"(%arg1) : (index) -> vector<1x[4]xindex>
    %2 = "arith.addi"(%0, %1) <{overflowFlags = #arith.overflow<none>}> : (vector<1x[4]xindex>, vector<1x[4]xindex>) -> vector<1x[4]xindex>
    "func.return"(%2) : (vector<1x[4]xindex>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<4xf32>, vector<4xf32>) -> vector<3x4xf32>, sym_name = "broadcast_vector"}> ({
  ^bb0(%arg2: vector<4xf32>, %arg3: vector<4xf32>):
    %3 = "vector.broadcast"(%arg2) : (vector<4xf32>) -> vector<3x4xf32>
    %4 = "vector.broadcast"(%arg3) : (vector<4xf32>) -> vector<3x4xf32>
    %5 = "arith.addf"(%3, %4) <{fastmath = #arith.fastmath<none>}> : (vector<3x4xf32>, vector<3x4xf32>) -> vector<3x4xf32>
    "func.return"(%5) : (vector<3x4xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<[4]xf32>, vector<[4]xf32>) -> vector<3x[4]xf32>, sym_name = "broadcast_vector_scalable"}> ({
  ^bb0(%arg0: vector<[4]xf32>, %arg1: vector<[4]xf32>):
    %0 = "vector.broadcast"(%arg0) : (vector<[4]xf32>) -> vector<3x[4]xf32>
    %1 = "vector.broadcast"(%arg1) : (vector<[4]xf32>) -> vector<3x[4]xf32>
    %2 = "arith.addf"(%0, %1) <{fastmath = #arith.fastmath<none>}> : (vector<3x[4]xf32>, vector<3x[4]xf32>) -> vector<3x[4]xf32>
    "func.return"(%2) : (vector<3x[4]xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (index, vector<4xindex>) -> vector<1x4xindex>, sym_name = "broadcast_scalar_and_vec"}> ({
  ^bb0(%arg2: index, %arg3: vector<4xindex>):
    %3 = "vector.broadcast"(%arg2) : (index) -> vector<1x4xindex>
    %4 = "vector.broadcast"(%arg3) : (vector<4xindex>) -> vector<1x4xindex>
    %5 = "arith.addi"(%3, %4) <{overflowFlags = #arith.overflow<none>}> : (vector<1x4xindex>, vector<1x4xindex>) -> vector<1x4xindex>
    "func.return"(%5) : (vector<1x4xindex>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (index, vector<[4]xindex>) -> vector<1x[4]xindex>, sym_name = "broadcast_scalar_and_vec_scalable"}> ({
  ^bb0(%arg0: index, %arg1: vector<[4]xindex>):
    %0 = "vector.broadcast"(%arg0) : (index) -> vector<1x[4]xindex>
    %1 = "vector.broadcast"(%arg1) : (vector<[4]xindex>) -> vector<1x[4]xindex>
    %2 = "arith.addi"(%0, %1) <{overflowFlags = #arith.overflow<none>}> : (vector<1x[4]xindex>, vector<1x[4]xindex>) -> vector<1x[4]xindex>
    "func.return"(%2) : (vector<1x[4]xindex>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (i32, vector<4xi32>) -> vector<4xi32>, sym_name = "broadcast_vector_and_scalar"}> ({
  ^bb0(%arg2: i32, %arg3: vector<4xi32>):
    %2 = "vector.broadcast"(%arg2) : (i32) -> vector<4xi32>
    %3 = "arith.addi"(%2, %arg3) <{overflowFlags = #arith.overflow<none>}> : (vector<4xi32>, vector<4xi32>) -> vector<4xi32>
    "func.return"(%3) : (vector<4xi32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i32, vector<[4]xi32>) -> vector<[4]xi32>, sym_name = "broadcast_vector_and_scalar_scalable"}> ({
  ^bb0(%arg0: i32, %arg1: vector<[4]xi32>):
    %0 = "vector.broadcast"(%arg0) : (i32) -> vector<[4]xi32>
    %1 = "arith.addi"(%0, %arg1) <{overflowFlags = #arith.overflow<none>}> : (vector<[4]xi32>, vector<[4]xi32>) -> vector<[4]xi32>
    "func.return"(%1) : (vector<[4]xi32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2) -> (d0, d2)>
#map1 = affine_map<(d0, d1, d2) -> (d2, d1)>
#map2 = affine_map<(d0, d1, d2) -> (d0, d1)>
"builtin.module"() ({
  "func.func"() <{function_type = () -> vector<2x2xf32>, sym_name = "negative_not_elementwise"}> ({
    %0 = "arith.constant"() <{value = 1.000000e+00 : f32}> : () -> f32
    %1 = "arith.constant"() <{value = 2.000000e+00 : f32}> : () -> f32
    %2 = "arith.constant"() <{value = 3.000000e+00 : f32}> : () -> f32
    %3 = "vector.broadcast"(%0) : (f32) -> vector<2x2xf32>
    %4 = "vector.broadcast"(%1) : (f32) -> vector<2x2xf32>
    %5 = "vector.broadcast"(%2) : (f32) -> vector<2x2xf32>
    %6 = "vector.contract"(%3, %4, %5) <{indexing_maps = [#map, #map1, #map2], iterator_types = [#vector.iterator_type<parallel>, #vector.iterator_type<parallel>, #vector.iterator_type<reduction>], kind = #vector.kind<add>}> : (vector<2x2xf32>, vector<2x2xf32>, vector<2x2xf32>) -> vector<2x2xf32>
    "func.return"(%6) : (vector<2x2xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (f32) -> vector<1xi1>, sym_name = "source_and_result_mismatch"}> ({
  ^bb0(%arg0: f32):
    %0 = "vector.broadcast"(%arg0) : (f32) -> vector<1xf32>
    %1 = "arith.cmpf"(%0, %0) <{fastmath = #arith.fastmath<none>, predicate = 14 : i64}> : (vector<1xf32>, vector<1xf32>) -> vector<1xi1>
    "func.return"(%1) : (vector<1xi1>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (f32) -> vector<1xf32>, sym_name = "negative_op_only_supports_vectors"}> ({
  ^bb0(%arg0: f32):
    %0 = "vector.broadcast"(%arg0) : (f32) -> vector<1xf32>
    %1 = "vector.fma"(%0, %0, %0) : (vector<1xf32>, vector<1xf32>, vector<1xf32>) -> vector<1xf32>
    "func.return"(%1) : (vector<1xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (index) -> vector<1x4xindex>, sym_name = "broadcast_scalar_and_splat_const"}> ({
  ^bb0(%arg0: index):
    %0 = "vector.broadcast"(%arg0) : (index) -> vector<1x4xindex>
    %1 = "arith.constant"() <{value = dense<2> : vector<1x4xindex>}> : () -> vector<1x4xindex>
    %2 = "arith.addi"(%0, %1) <{overflowFlags = #arith.overflow<none>}> : (vector<1x4xindex>, vector<1x4xindex>) -> vector<1x4xindex>
    "func.return"(%2) : (vector<1x4xindex>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (index) -> vector<1x4xindex>, sym_name = "broadcast_scalar_and_splat_const_const_first"}> ({
  ^bb0(%arg0: index):
    %0 = "vector.broadcast"(%arg0) : (index) -> vector<1x4xindex>
    %1 = "arith.constant"() <{value = dense<2> : vector<1x4xindex>}> : () -> vector<1x4xindex>
    %2 = "arith.subi"(%1, %0) <{overflowFlags = #arith.overflow<none>}> : (vector<1x4xindex>, vector<1x4xindex>) -> vector<1x4xindex>
    "func.return"(%2) : (vector<1x4xindex>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<4xf32>) -> vector<3x4xf32>, sym_name = "broadcast_vector_and_splat_const"}> ({
  ^bb0(%arg0: vector<4xf32>):
    %0 = "vector.broadcast"(%arg0) : (vector<4xf32>) -> vector<3x4xf32>
    %1 = "arith.constant"() <{value = dense<2.000000e+00> : vector<3x4xf32>}> : () -> vector<3x4xf32>
    %2 = "arith.mulf"(%0, %1) <{fastmath = #arith.fastmath<none>}> : (vector<3x4xf32>, vector<3x4xf32>) -> vector<3x4xf32>
    "func.return"(%2) : (vector<3x4xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (index) -> vector<1x4xindex>, sym_name = "negative_broadcast_with_non_splat_const"}> ({
  ^bb0(%arg0: index):
    %0 = "vector.broadcast"(%arg0) : (index) -> vector<1x4xindex>
    %1 = "arith.constant"() <{value = dense<[[0, 1, 2, 3]]> : vector<1x4xindex>}> : () -> vector<1x4xindex>
    %2 = "arith.addi"(%0, %1) <{overflowFlags = #arith.overflow<none>}> : (vector<1x4xindex>, vector<1x4xindex>) -> vector<1x4xindex>
    "func.return"(%2) : (vector<1x4xindex>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (f16) -> vector<1x4xf32>, sym_name = "broadcast_scalar_mixed_type"}> ({
  ^bb0(%arg0: f16):
    %0 = "vector.broadcast"(%arg0) : (f16) -> vector<1x4xf16>
    %1 = "arith.extf"(%0) : (vector<1x4xf16>) -> vector<1x4xf32>
    "func.return"(%1) : (vector<1x4xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<4xf16>) -> vector<3x4xf32>, sym_name = "broadcast_vector_mixed_type"}> ({
  ^bb0(%arg0: vector<4xf16>):
    %0 = "vector.broadcast"(%arg0) : (vector<4xf16>) -> vector<3x4xf16>
    %1 = "arith.extf"(%0) : (vector<3x4xf16>) -> vector<3x4xf32>
    "func.return"(%1) : (vector<3x4xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (f32) -> vector<1x4xf32>, sym_name = "broadcast_scalar_and_splat_const_mixed_type"}> ({
  ^bb0(%arg0: f32):
    %0 = "vector.broadcast"(%arg0) : (f32) -> vector<1x4xf32>
    %1 = "arith.constant"() <{value = dense<3> : vector<1x4xi32>}> : () -> vector<1x4xi32>
    %2 = "math.fpowi"(%0, %1) <{fastmath = #arith.fastmath<none>}> : (vector<1x4xf32>, vector<1x4xi32>) -> vector<1x4xf32>
    "func.return"(%2) : (vector<1x4xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<4xf32>) -> vector<3x4xf32>, sym_name = "broadcast_vector_and_splat_const_mixed_type"}> ({
  ^bb0(%arg0: vector<4xf32>):
    %0 = "vector.broadcast"(%arg0) : (vector<4xf32>) -> vector<3x4xf32>
    %1 = "arith.constant"() <{value = dense<3> : vector<3x4xi32>}> : () -> vector<3x4xi32>
    %2 = "math.fpowi"(%0, %1) <{fastmath = #arith.fastmath<none>}> : (vector<3x4xf32>, vector<3x4xi32>) -> vector<3x4xf32>
    "func.return"(%2) : (vector<3x4xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<4xi8>) -> vector<2x4xi32>, sym_name = "broadcast_vector_extsi"}> ({
  ^bb0(%arg0: vector<4xi8>):
    %0 = "vector.broadcast"(%arg0) : (vector<4xi8>) -> vector<2x4xi8>
    %1 = "arith.extsi"(%0) : (vector<2x4xi8>) -> vector<2x4xi32>
    "func.return"(%1) : (vector<2x4xi32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<[4]xi8>) -> vector<2x[4]xi32>, sym_name = "broadcast_vector_extsi_scalable"}> ({
  ^bb0(%arg0: vector<[4]xi8>):
    %0 = "vector.broadcast"(%arg0) : (vector<[4]xi8>) -> vector<2x[4]xi8>
    %1 = "arith.extsi"(%0) : (vector<2x[4]xi8>) -> vector<2x[4]xi32>
    "func.return"(%1) : (vector<2x[4]xi32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (i8) -> vector<2x4xi32>, sym_name = "broadcast_scalar_extsi"}> ({
  ^bb0(%arg0: i8):
    %0 = "vector.broadcast"(%arg0) : (i8) -> vector<2x4xi8>
    %1 = "arith.extsi"(%0) : (vector<2x4xi8>) -> vector<2x4xi32>
    "func.return"(%1) : (vector<2x4xi32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (i8) -> vector<2x[4]xi32>, sym_name = "broadcast_scalar_extsi_scalable"}> ({
  ^bb0(%arg0: i8):
    %0 = "vector.broadcast"(%arg0) : (i8) -> vector<2x[4]xi8>
    %1 = "arith.extsi"(%0) : (vector<2x[4]xi8>) -> vector<2x[4]xi32>
    "func.return"(%1) : (vector<2x[4]xi32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (i64) -> !llvm.array<26 x vector<7xi64>>, sym_name = "negative_broadcast_cast_non_vector_result"}> ({
  ^bb0(%arg1: i64):
    %2 = "vector.broadcast"(%arg1) : (i64) -> vector<26x7xi64>
    %3 = "builtin.unrealized_conversion_cast"(%2) : (vector<26x7xi64>) -> !llvm.array<26 x vector<7xi64>>
    "func.return"(%3) : (!llvm.array<26 x vector<7xi64>>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<4x2xi8>) -> vector<2x4xi32>, sym_name = "transpose_extsi"}> ({
  ^bb0(%arg0: vector<4x2xi8>):
    %0 = "vector.transpose"(%arg0) <{permutation = array<i64: 1, 0>}> : (vector<4x2xi8>) -> vector<2x4xi8>
    %1 = "arith.extsi"(%0) : (vector<2x4xi8>) -> vector<2x4xi32>
    "func.return"(%1) : (vector<2x4xi32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<[4]x2xi8>) -> vector<2x[4]xi32>, sym_name = "transpose_extsi_scalable"}> ({
  ^bb0(%arg0: vector<[4]x2xi8>):
    %0 = "vector.transpose"(%arg0) <{permutation = array<i64: 1, 0>}> : (vector<[4]x2xi8>) -> vector<2x[4]xi8>
    %1 = "arith.extsi"(%0) : (vector<2x[4]xi8>) -> vector<2x[4]xi32>
    "func.return"(%1) : (vector<2x[4]xi32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<4x2xf32>, vector<4x2xf32>) -> vector<2x4xf32>, sym_name = "transpose_elementwise_same_type"}> ({
  ^bb0(%arg0: vector<4x2xf32>, %arg1: vector<4x2xf32>):
    %0 = "vector.transpose"(%arg0) <{permutation = array<i64: 1, 0>}> : (vector<4x2xf32>) -> vector<2x4xf32>
    %1 = "vector.transpose"(%arg1) <{permutation = array<i64: 1, 0>}> : (vector<4x2xf32>) -> vector<2x4xf32>
    %2 = "arith.addf"(%0, %1) <{fastmath = #arith.fastmath<none>}> : (vector<2x4xf32>, vector<2x4xf32>) -> vector<2x4xf32>
    "func.return"(%2) : (vector<2x4xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<[4]x2xf32>, vector<[4]x2xf32>) -> vector<2x[4]xf32>, sym_name = "transpose_elementwise_same_type_scalable"}> ({
  ^bb0(%arg0: vector<[4]x2xf32>, %arg1: vector<[4]x2xf32>):
    %0 = "vector.transpose"(%arg0) <{permutation = array<i64: 1, 0>}> : (vector<[4]x2xf32>) -> vector<2x[4]xf32>
    %1 = "vector.transpose"(%arg1) <{permutation = array<i64: 1, 0>}> : (vector<[4]x2xf32>) -> vector<2x[4]xf32>
    %2 = "arith.addf"(%0, %1) <{fastmath = #arith.fastmath<none>}> : (vector<2x[4]xf32>, vector<2x[4]xf32>) -> vector<2x[4]xf32>
    "func.return"(%2) : (vector<2x[4]xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<4x2xi1>, vector<4x2xf32>, vector<4x2xf32>) -> vector<2x4xf32>, sym_name = "transpose_elementwise_diff_operand_types"}> ({
  ^bb0(%arg0: vector<4x2xi1>, %arg1: vector<4x2xf32>, %arg2: vector<4x2xf32>):
    %0 = "vector.transpose"(%arg0) <{permutation = array<i64: 1, 0>}> : (vector<4x2xi1>) -> vector<2x4xi1>
    %1 = "vector.transpose"(%arg1) <{permutation = array<i64: 1, 0>}> : (vector<4x2xf32>) -> vector<2x4xf32>
    %2 = "vector.transpose"(%arg2) <{permutation = array<i64: 1, 0>}> : (vector<4x2xf32>) -> vector<2x4xf32>
    %3 = "arith.select"(%0, %1, %2) : (vector<2x4xi1>, vector<2x4xf32>, vector<2x4xf32>) -> vector<2x4xf32>
    "func.return"(%3) : (vector<2x4xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<[4]x2xi1>, vector<[4]x2xf32>, vector<[4]x2xf32>) -> vector<2x[4]xf32>, sym_name = "transpose_elementwise_diff_operand_types_scalable"}> ({
  ^bb0(%arg0: vector<[4]x2xi1>, %arg1: vector<[4]x2xf32>, %arg2: vector<[4]x2xf32>):
    %0 = "vector.transpose"(%arg0) <{permutation = array<i64: 1, 0>}> : (vector<[4]x2xi1>) -> vector<2x[4]xi1>
    %1 = "vector.transpose"(%arg1) <{permutation = array<i64: 1, 0>}> : (vector<[4]x2xf32>) -> vector<2x[4]xf32>
    %2 = "vector.transpose"(%arg2) <{permutation = array<i64: 1, 0>}> : (vector<[4]x2xf32>) -> vector<2x[4]xf32>
    %3 = "arith.select"(%0, %1, %2) : (vector<2x[4]xi1>, vector<2x[4]xf32>, vector<2x[4]xf32>) -> vector<2x[4]xf32>
    "func.return"(%3) : (vector<2x[4]xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<4x2xf32>, vector<4x2xf32>) -> vector<2x4xi1>, sym_name = "transpose_elementwise_diff_operand_result_type"}> ({
  ^bb0(%arg0: vector<4x2xf32>, %arg1: vector<4x2xf32>):
    %0 = "vector.transpose"(%arg0) <{permutation = array<i64: 1, 0>}> : (vector<4x2xf32>) -> vector<2x4xf32>
    %1 = "vector.transpose"(%arg1) <{permutation = array<i64: 1, 0>}> : (vector<4x2xf32>) -> vector<2x4xf32>
    %2 = "arith.cmpf"(%0, %1) <{fastmath = #arith.fastmath<none>, predicate = 4 : i64}> : (vector<2x4xf32>, vector<2x4xf32>) -> vector<2x4xi1>
    "func.return"(%2) : (vector<2x4xi1>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<[4]x2xf32>, vector<[4]x2xf32>) -> vector<2x[4]xi1>, sym_name = "transpose_elementwise_diff_operand_result_type_scalable"}> ({
  ^bb0(%arg0: vector<[4]x2xf32>, %arg1: vector<[4]x2xf32>):
    %0 = "vector.transpose"(%arg0) <{permutation = array<i64: 1, 0>}> : (vector<[4]x2xf32>) -> vector<2x[4]xf32>
    %1 = "vector.transpose"(%arg1) <{permutation = array<i64: 1, 0>}> : (vector<[4]x2xf32>) -> vector<2x[4]xf32>
    %2 = "arith.cmpf"(%0, %1) <{fastmath = #arith.fastmath<none>, predicate = 4 : i64}> : (vector<2x[4]xf32>, vector<2x[4]xf32>) -> vector<2x[4]xi1>
    "func.return"(%2) : (vector<2x[4]xi1>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<4x6x3x2xf32>) -> vector<6x4x2x3xf32>, sym_name = "transpose_elementwise_splat_constant"}> ({
  ^bb0(%arg0: vector<4x6x3x2xf32>):
    %0 = "arith.constant"() <{value = dense<5.000000e+00> : vector<6x4x2x3xf32>}> : () -> vector<6x4x2x3xf32>
    %1 = "vector.transpose"(%arg0) <{permutation = array<i64: 1, 0, 3, 2>}> : (vector<4x6x3x2xf32>) -> vector<6x4x2x3xf32>
    %2 = "arith.addf"(%1, %0) <{fastmath = #arith.fastmath<none>}> : (vector<6x4x2x3xf32>, vector<6x4x2x3xf32>) -> vector<6x4x2x3xf32>
    "func.return"(%2) : (vector<6x4x2x3xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<[4]x6x3x2xf32>) -> vector<6x[4]x2x3xf32>, sym_name = "transpose_elementwise_splat_constant_scalable"}> ({
  ^bb0(%arg0: vector<[4]x6x3x2xf32>):
    %0 = "arith.constant"() <{value = dense<5.000000e+00> : vector<6x[4]x2x3xf32>}> : () -> vector<6x[4]x2x3xf32>
    %1 = "vector.transpose"(%arg0) <{permutation = array<i64: 1, 0, 3, 2>}> : (vector<[4]x6x3x2xf32>) -> vector<6x[4]x2x3xf32>
    %2 = "arith.addf"(%1, %0) <{fastmath = #arith.fastmath<none>}> : (vector<6x[4]x2x3xf32>, vector<6x[4]x2x3xf32>) -> vector<6x[4]x2x3xf32>
    "func.return"(%2) : (vector<6x[4]x2x3xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<4x6x3x2xf32>, vector<6x2x4x3xf32>) -> vector<6x4x2x3xf32>, sym_name = "transpose_elementwise_diff_map"}> ({
  ^bb0(%arg0: vector<4x6x3x2xf32>, %arg1: vector<6x2x4x3xf32>):
    %0 = "vector.transpose"(%arg0) <{permutation = array<i64: 1, 0, 3, 2>}> : (vector<4x6x3x2xf32>) -> vector<6x4x2x3xf32>
    %1 = "vector.transpose"(%arg1) <{permutation = array<i64: 0, 2, 1, 3>}> : (vector<6x2x4x3xf32>) -> vector<6x4x2x3xf32>
    %2 = "arith.addf"(%0, %1) <{fastmath = #arith.fastmath<none>}> : (vector<6x4x2x3xf32>, vector<6x4x2x3xf32>) -> vector<6x4x2x3xf32>
    "func.return"(%2) : (vector<6x4x2x3xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<[4]x6x3x2xf32>, vector<6x2x[4]x3xf32>) -> vector<6x[4]x2x3xf32>, sym_name = "transpose_elementwise_diff_map_scalable"}> ({
  ^bb0(%arg0: vector<[4]x6x3x2xf32>, %arg1: vector<6x2x[4]x3xf32>):
    %0 = "vector.transpose"(%arg0) <{permutation = array<i64: 1, 0, 3, 2>}> : (vector<[4]x6x3x2xf32>) -> vector<6x[4]x2x3xf32>
    %1 = "vector.transpose"(%arg1) <{permutation = array<i64: 0, 2, 1, 3>}> : (vector<6x2x[4]x3xf32>) -> vector<6x[4]x2x3xf32>
    %2 = "arith.addf"(%0, %1) <{fastmath = #arith.fastmath<none>}> : (vector<6x[4]x2x3xf32>, vector<6x[4]x2x3xf32>) -> vector<6x[4]x2x3xf32>
    "func.return"(%2) : (vector<6x[4]x2x3xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<4xf32>, vector<4xf32>) -> f32, sym_name = "extract_elementwise_scalar"}> ({
  ^bb0(%arg63: vector<4xf32>, %arg64: vector<4xf32>):
    %44 = "arith.addf"(%arg63, %arg64) <{fastmath = #arith.fastmath<none>}> : (vector<4xf32>, vector<4xf32>) -> vector<4xf32>
    %45 = "vector.extract"(%44) <{static_position = array<i64: 1>}> : (vector<4xf32>) -> f32
    "func.return"(%45) : (f32) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<4xindex>) -> i64, sym_name = "extract_elementwise_arg_res_different_types"}> ({
  ^bb0(%arg62: vector<4xindex>):
    %42 = "arith.index_cast"(%arg62) : (vector<4xindex>) -> vector<4xi64>
    %43 = "vector.extract"(%42) <{static_position = array<i64: 1>}> : (vector<4xi64>) -> i64
    "func.return"(%43) : (i64) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<2x4xf32>, vector<2x4xf32>) -> vector<4xf32>, sym_name = "extract_elementwise_vec"}> ({
  ^bb0(%arg60: vector<2x4xf32>, %arg61: vector<2x4xf32>):
    %40 = "arith.addf"(%arg60, %arg61) <{fastmath = #arith.fastmath<none>}> : (vector<2x4xf32>, vector<2x4xf32>) -> vector<2x4xf32>
    %41 = "vector.extract"(%40) <{static_position = array<i64: 1>}> : (vector<2x4xf32>) -> vector<4xf32>
    "func.return"(%41) : (vector<4xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<4xf32>, vector<4xf32>) -> (f32, vector<4xf32>), sym_name = "negative_extract_elementwise_no_single_use"}> ({
  ^bb0(%arg58: vector<4xf32>, %arg59: vector<4xf32>):
    %38 = "arith.addf"(%arg58, %arg59) <{fastmath = #arith.fastmath<none>}> : (vector<4xf32>, vector<4xf32>) -> vector<4xf32>
    %39 = "vector.extract"(%38) <{static_position = array<i64: 1>}> : (vector<4xf32>) -> f32
    "func.return"(%39, %38) : (f32, vector<4xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<4xi32>, vector<4xi32>) -> i32, sym_name = "negative_extract_elementwise_not_one_res"}> ({
  ^bb0(%arg56: vector<4xi32>, %arg57: vector<4xi32>):
    %36:2 = "arith.mulsi_extended"(%arg56, %arg57) : (vector<4xi32>, vector<4xi32>) -> (vector<4xi32>, vector<4xi32>)
    %37 = "vector.extract"(%36#0) <{static_position = array<i64: 1>}> : (vector<4xi32>) -> i32
    "func.return"(%37) : (i32) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<4xi64>) -> i64, sym_name = "negative_extract_not_elementwise"}> ({
  ^bb0(%arg55: vector<4xi64>):
    %34 = "test.increment"(%arg55) : (vector<4xi64>) -> vector<4xi64>
    %35 = "vector.extract"(%34) <{static_position = array<i64: 1>}> : (vector<4xi64>) -> i64
    "func.return"(%35) : (i64) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<4xf32>, vector<4xf32>, vector<4xf32>) -> f32, sym_name = "negative_extract_vec_fma"}> ({
  ^bb0(%arg52: vector<4xf32>, %arg53: vector<4xf32>, %arg54: vector<4xf32>):
    %32 = "vector.fma"(%arg52, %arg53, %arg54) : (vector<4xf32>, vector<4xf32>, vector<4xf32>) -> vector<4xf32>
    %33 = "vector.extract"(%32) <{static_position = array<i64: 1>}> : (vector<4xf32>) -> f32
    "func.return"(%33) : (f32) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<4xf32>, vector<4xf32>, vector<4xindex>) -> f32, sym_name = "negative_extract_dynamic_pos"}> ({
  ^bb0(%arg49: vector<4xf32>, %arg50: vector<4xf32>, %arg51: vector<4xindex>):
    %29 = "arith.addf"(%arg49, %arg50) <{fastmath = #arith.fastmath<none>}> : (vector<4xf32>, vector<4xf32>) -> vector<4xf32>
    %30 = "vector.extract"(%arg51) <{static_position = array<i64: 0>}> : (vector<4xindex>) -> index
    %31 = "vector.extract"(%29, %30) <{static_position = array<i64: -9223372036854775808>}> : (vector<4xf32>, index) -> f32
    "func.return"(%31) : (f32) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<?xf32>, index) -> f32, sym_name = "extract_load_scalar"}> ({
  ^bb0(%arg47: memref<?xf32>, %arg48: index):
    %27 = "vector.load"(%arg47, %arg48) : (memref<?xf32>, index) -> vector<4xf32>
    %28 = "vector.extract"(%27) <{static_position = array<i64: 0>}> : (vector<4xf32>) -> f32
    "func.return"(%28) : (f32) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<?xindex>, index) -> index, sym_name = "extract_load_index"}> ({
  ^bb0(%arg45: memref<?xindex>, %arg46: index):
    %25 = "vector.load"(%arg45, %arg46) : (memref<?xindex>, index) -> vector<4xindex>
    %26 = "vector.extract"(%25) <{static_position = array<i64: 0>}> : (vector<4xindex>) -> index
    "func.return"(%26) : (index) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<?xf32>, index) -> f32, sym_name = "extract_load_scalar_non_zero_off"}> ({
  ^bb0(%arg43: memref<?xf32>, %arg44: index):
    %23 = "vector.load"(%arg43, %arg44) : (memref<?xf32>, index) -> vector<4xf32>
    %24 = "vector.extract"(%23) <{static_position = array<i64: 1>}> : (vector<4xf32>) -> f32
    "func.return"(%24) : (f32) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<?xf32>, index, index) -> f32, sym_name = "extract_load_scalar_dyn_off"}> ({
  ^bb0(%arg40: memref<?xf32>, %arg41: index, %arg42: index):
    %21 = "vector.load"(%arg40, %arg41) : (memref<?xf32>, index) -> vector<4xf32>
    %22 = "vector.extract"(%21, %arg42) <{static_position = array<i64: -9223372036854775808>}> : (vector<4xf32>, index) -> f32
    "func.return"(%22) : (f32) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<?x?xf32>, index, index) -> vector<4xf32>, sym_name = "extract_load_vec_non_zero_off"}> ({
  ^bb0(%arg37: memref<?x?xf32>, %arg38: index, %arg39: index):
    %19 = "vector.load"(%arg37, %arg38, %arg39) : (memref<?x?xf32>, index, index) -> vector<2x4xf32>
    %20 = "vector.extract"(%19) <{static_position = array<i64: 1>}> : (vector<2x4xf32>) -> vector<4xf32>
    "func.return"(%20) : (vector<4xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<?x?xf32>, index, index) -> f32, sym_name = "extract_load_scalar_non_zero_off_2d_src_memref"}> ({
  ^bb0(%arg34: memref<?x?xf32>, %arg35: index, %arg36: index):
    %17 = "vector.load"(%arg34, %arg35, %arg36) : (memref<?x?xf32>, index, index) -> vector<4xf32>
    %18 = "vector.extract"(%17) <{static_position = array<i64: 1>}> : (vector<4xf32>) -> f32
    "func.return"(%18) : (f32) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<?x?x?xf32>, index, index, index) -> vector<4xf32>, sym_name = "extract_load_vec_high_rank"}> ({
  ^bb0(%arg30: memref<?x?x?xf32>, %arg31: index, %arg32: index, %arg33: index):
    %15 = "vector.load"(%arg30, %arg31, %arg32, %arg33) : (memref<?x?x?xf32>, index, index, index) -> vector<2x4xf32>
    %16 = "vector.extract"(%15) <{static_position = array<i64: 1>}> : (vector<2x4xf32>) -> vector<4xf32>
    "func.return"(%16) : (vector<4xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<?xvector<4xf32>>, index) -> f32, sym_name = "negative_extract_load_scalar_from_memref_of_vec"}> ({
  ^bb0(%arg28: memref<?xvector<4xf32>>, %arg29: index):
    %13 = "vector.load"(%arg28, %arg29) : (memref<?xvector<4xf32>>, index) -> vector<4xf32>
    %14 = "vector.extract"(%13) <{static_position = array<i64: 0>}> : (vector<4xf32>) -> f32
    "func.return"(%14) : (f32) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<?xi1>, index) -> i1, sym_name = "negative_extract_load_scalar_from_memref_of_i1"}> ({
  ^bb0(%arg26: memref<?xi1>, %arg27: index):
    %11 = "vector.load"(%arg26, %arg27) : (memref<?xi1>, index) -> vector<8xi1>
    %12 = "vector.extract"(%11) <{static_position = array<i64: 0>}> : (vector<8xi1>) -> i1
    "func.return"(%12) : (i1) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<?xf32>, index) -> (f32, vector<4xf32>), sym_name = "negative_extract_load_no_single_use"}> ({
  ^bb0(%arg24: memref<?xf32>, %arg25: index):
    %9 = "vector.load"(%arg24, %arg25) : (memref<?xf32>, index) -> vector<4xf32>
    %10 = "vector.extract"(%9) <{static_position = array<i64: 0>}> : (vector<4xf32>) -> f32
    "func.return"(%10, %9) : (f32, vector<4xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<?xf32>, index) -> f32, sym_name = "negative_extract_load_scalable"}> ({
  ^bb0(%arg22: memref<?xf32>, %arg23: index):
    %7 = "vector.load"(%arg22, %arg23) : (memref<?xf32>, index) -> vector<[1]xf32>
    %8 = "vector.extract"(%7) <{static_position = array<i64: 0>}> : (vector<[1]xf32>) -> f32
    "func.return"(%8) : (f32) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<?xf32>, index, f32) -> (), sym_name = "store_splat"}> ({
  ^bb0(%arg19: memref<?xf32>, %arg20: index, %arg21: f32):
    %6 = "vector.broadcast"(%arg21) : (f32) -> vector<1xf32>
    "vector.store"(%6, %arg19, %arg20) : (vector<1xf32>, memref<?xf32>, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<?xf32>, index, f32) -> (), sym_name = "store_broadcast"}> ({
  ^bb0(%arg16: memref<?xf32>, %arg17: index, %arg18: f32):
    %5 = "vector.broadcast"(%arg18) : (f32) -> vector<1xf32>
    "vector.store"(%5, %arg16, %arg17) : (vector<1xf32>, memref<?xf32>, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<?x?xf32>, index, index, vector<1xf32>) -> (), sym_name = "store_broadcast_1d_to_2d"}> ({
  ^bb0(%arg12: memref<?x?xf32>, %arg13: index, %arg14: index, %arg15: vector<1xf32>):
    %4 = "vector.broadcast"(%arg15) : (vector<1xf32>) -> vector<1x1xf32>
    "vector.store"(%4, %arg12, %arg13, %arg14) : (vector<1x1xf32>, memref<?x?xf32>, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<?xf32>, index, f32) -> (), sym_name = "negative_store_scalable"}> ({
  ^bb0(%arg9: memref<?xf32>, %arg10: index, %arg11: f32):
    %3 = "vector.broadcast"(%arg11) : (f32) -> vector<[1]xf32>
    "vector.store"(%3, %arg9, %arg10) : (vector<[1]xf32>, memref<?xf32>, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<?xvector<1xf32>>, index, f32) -> (), sym_name = "negative_store_memref_of_vec"}> ({
  ^bb0(%arg6: memref<?xvector<1xf32>>, %arg7: index, %arg8: f32):
    %2 = "vector.broadcast"(%arg8) : (f32) -> vector<1xf32>
    "vector.store"(%2, %arg6, %arg7) : (vector<1xf32>, memref<?xvector<1xf32>>, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<?xf32>, index, f32) -> (), sym_name = "negative_store_more_than_one_element"}> ({
  ^bb0(%arg3: memref<?xf32>, %arg4: index, %arg5: f32):
    %1 = "vector.broadcast"(%arg5) : (f32) -> vector<4xf32>
    "vector.store"(%1, %arg3, %arg4) : (vector<4xf32>, memref<?xf32>, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<?xf32>, index, f32) -> vector<1xf32>, sym_name = "negative_store_no_single_use"}> ({
  ^bb0(%arg0: memref<?xf32>, %arg1: index, %arg2: f32):
    %0 = "vector.broadcast"(%arg2) : (f32) -> vector<1xf32>
    "vector.store"(%0, %arg0, %arg1) : (vector<1xf32>, memref<?xf32>, index) -> ()
    "func.return"(%0) : (vector<1xf32>) -> ()
  }) : () -> ()
}) : () -> ()

