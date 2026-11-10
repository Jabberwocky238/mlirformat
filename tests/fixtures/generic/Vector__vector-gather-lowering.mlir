#map = affine_map<()[s0] -> (s0 * 4096)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<?xf32>, vector<2xindex>, vector<2xi1>, vector<2xf32>) -> vector<2xf32>, sym_name = "gather_memref_1d"}> ({
  ^bb0(%arg54: memref<?xf32>, %arg55: vector<2xindex>, %arg56: vector<2xi1>, %arg57: vector<2xf32>):
    %39 = "arith.constant"() <{value = 0 : index}> : () -> index
    %40 = "vector.gather"(%arg54, %39, %arg55, %arg56, %arg57) : (memref<?xf32>, index, vector<2xindex>, vector<2xi1>, vector<2xf32>) -> vector<2xf32>
    "func.return"(%40) : (vector<2xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<?xf32>, vector<2xi32>, vector<2xi1>, vector<2xf32>) -> vector<2xf32>, sym_name = "gather_memref_1d_i32_index"}> ({
  ^bb0(%arg50: memref<?xf32>, %arg51: vector<2xi32>, %arg52: vector<2xi1>, %arg53: vector<2xf32>):
    %37 = "arith.constant"() <{value = 42 : index}> : () -> index
    %38 = "vector.gather"(%arg50, %37, %arg51, %arg52, %arg53) : (memref<?xf32>, index, vector<2xi32>, vector<2xi1>, vector<2xf32>) -> vector<2xf32>
    "func.return"(%38) : (vector<2xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<?x?xf32>, vector<2x3xindex>, vector<2x3xi1>, vector<2x3xf32>) -> vector<2x3xf32>, sym_name = "gather_memref_2d"}> ({
  ^bb0(%arg46: memref<?x?xf32>, %arg47: vector<2x3xindex>, %arg48: vector<2x3xi1>, %arg49: vector<2x3xf32>):
    %34 = "arith.constant"() <{value = 0 : index}> : () -> index
    %35 = "arith.constant"() <{value = 1 : index}> : () -> index
    %36 = "vector.gather"(%arg46, %34, %35, %arg47, %arg48, %arg49) : (memref<?x?xf32>, index, index, vector<2x3xindex>, vector<2x3xi1>, vector<2x3xf32>) -> vector<2x3xf32>
    "func.return"(%36) : (vector<2x3xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<?x?xf32>, vector<2x[3]xindex>, vector<2x[3]xi1>, vector<2x[3]xf32>) -> vector<2x[3]xf32>, sym_name = "scalable_gather_memref_2d"}> ({
  ^bb0(%arg42: memref<?x?xf32>, %arg43: vector<2x[3]xindex>, %arg44: vector<2x[3]xi1>, %arg45: vector<2x[3]xf32>):
    %31 = "arith.constant"() <{value = 0 : index}> : () -> index
    %32 = "arith.constant"() <{value = 1 : index}> : () -> index
    %33 = "vector.gather"(%arg42, %31, %32, %arg43, %arg44, %arg45) : (memref<?x?xf32>, index, index, vector<2x[3]xindex>, vector<2x[3]xi1>, vector<2x[3]xf32>) -> vector<2x[3]xf32>
    "func.return"(%33) : (vector<2x[3]xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<?x?xf32>, vector<2x[3]xindex>, vector<2x[3]xi1>, vector<2x[3]xf32>) -> vector<2x[3]xf32>, sym_name = "scalable_gather_memref_2d_with_alignment"}> ({
  ^bb0(%arg38: memref<?x?xf32>, %arg39: vector<2x[3]xindex>, %arg40: vector<2x[3]xi1>, %arg41: vector<2x[3]xf32>):
    %28 = "arith.constant"() <{value = 0 : index}> : () -> index
    %29 = "arith.constant"() <{value = 1 : index}> : () -> index
    %30 = "vector.gather"(%arg38, %28, %29, %arg39, %arg40, %arg41) <{alignment = 8 : i64}> : (memref<?x?xf32>, index, index, vector<2x[3]xindex>, vector<2x[3]xi1>, vector<2x[3]xf32>) -> vector<2x[3]xf32>
    "func.return"(%30) : (vector<2x[3]xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<?x?xf32>, vector<[4]x8xindex>, vector<[4]x8xi1>, vector<[4]x8xf32>) -> vector<[4]x8xf32>, sym_name = "scalable_gather_cant_unroll"}> ({
  ^bb0(%arg34: memref<?x?xf32>, %arg35: vector<[4]x8xindex>, %arg36: vector<[4]x8xi1>, %arg37: vector<[4]x8xf32>):
    %25 = "arith.constant"() <{value = 0 : index}> : () -> index
    %26 = "arith.constant"() <{value = 1 : index}> : () -> index
    %27 = "vector.gather"(%arg34, %25, %26, %arg35, %arg36, %arg37) : (memref<?x?xf32>, index, index, vector<[4]x8xindex>, vector<[4]x8xi1>, vector<[4]x8xf32>) -> vector<[4]x8xf32>
    "func.return"(%27) : (vector<[4]x8xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<?xf32>, vector<2xindex>, vector<2xi1>, vector<2xf32>) -> vector<2xf32>, sym_name = "gather_tensor_1d"}> ({
  ^bb0(%arg30: tensor<?xf32>, %arg31: vector<2xindex>, %arg32: vector<2xi1>, %arg33: vector<2xf32>):
    %23 = "arith.constant"() <{value = 0 : index}> : () -> index
    %24 = "vector.gather"(%arg30, %23, %arg31, %arg32, %arg33) : (tensor<?xf32>, index, vector<2xindex>, vector<2xi1>, vector<2xf32>) -> vector<2xf32>
    "func.return"(%24) : (vector<2xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<4xf32, strided<[2]>>, vector<1xindex>, vector<1xi1>, vector<1xf32>) -> vector<1xf32>, sym_name = "gather_memref_non_unit_stride_read_1_element"}> ({
  ^bb0(%arg26: memref<4xf32, strided<[2]>>, %arg27: vector<1xindex>, %arg28: vector<1xi1>, %arg29: vector<1xf32>):
    %21 = "arith.constant"() <{value = 0 : index}> : () -> index
    %22 = "vector.gather"(%arg26, %21, %arg27, %arg28, %arg29) : (memref<4xf32, strided<[2]>>, index, vector<1xindex>, vector<1xi1>, vector<1xf32>) -> vector<1xf32>
    "func.return"(%22) : (vector<1xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<4xf32, strided<[2]>>, vector<2xindex>, vector<2xi1>, vector<2xf32>) -> vector<2xf32>, sym_name = "gather_memref_non_unit_stride_read_more_than_1_element"}> ({
  ^bb0(%arg22: memref<4xf32, strided<[2]>>, %arg23: vector<2xindex>, %arg24: vector<2xi1>, %arg25: vector<2xf32>):
    %19 = "arith.constant"() <{value = 0 : index}> : () -> index
    %20 = "vector.gather"(%arg22, %19, %arg23, %arg24, %arg25) : (memref<4xf32, strided<[2]>>, index, vector<2xindex>, vector<2xi1>, vector<2xf32>) -> vector<2xf32>
    "func.return"(%20) : (vector<2xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<?x?xf32>, vector<2x3xindex>, vector<2x3xi1>, vector<2x3xf32>) -> vector<2x3xf32>, sym_name = "gather_tensor_2d"}> ({
  ^bb0(%arg18: tensor<?x?xf32>, %arg19: vector<2x3xindex>, %arg20: vector<2x3xi1>, %arg21: vector<2x3xf32>):
    %16 = "arith.constant"() <{value = 0 : index}> : () -> index
    %17 = "arith.constant"() <{value = 1 : index}> : () -> index
    %18 = "vector.gather"(%arg18, %16, %17, %arg19, %arg20, %arg21) : (tensor<?x?xf32>, index, index, vector<2x3xindex>, vector<2x3xi1>, vector<2x3xf32>) -> vector<2x3xf32>
    "func.return"(%18) : (vector<2x3xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<?xf32>, vector<2xindex>, vector<2xf32>) -> vector<2xf32>, sym_name = "gather_tensor_1d_all_set"}> ({
  ^bb0(%arg15: tensor<?xf32>, %arg16: vector<2xindex>, %arg17: vector<2xf32>):
    %13 = "arith.constant"() <{value = dense<true> : vector<2xi1>}> : () -> vector<2xi1>
    %14 = "arith.constant"() <{value = 0 : index}> : () -> index
    %15 = "vector.gather"(%arg15, %14, %arg16, %13, %arg17) : (tensor<?xf32>, index, vector<2xindex>, vector<2xi1>, vector<2xf32>) -> vector<2xf32>
    "func.return"(%15) : (vector<2xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<?xf32>, vector<2xindex>, vector<2xf32>) -> vector<2xf32>, sym_name = "gather_tensor_1d_none_set"}> ({
  ^bb0(%arg12: tensor<?xf32>, %arg13: vector<2xindex>, %arg14: vector<2xf32>):
    %10 = "arith.constant"() <{value = dense<false> : vector<2xi1>}> : () -> vector<2xi1>
    %11 = "arith.constant"() <{value = 0 : index}> : () -> index
    %12 = "vector.gather"(%arg12, %11, %arg13, %10, %arg14) : (tensor<?xf32>, index, vector<2xindex>, vector<2xi1>, vector<2xf32>) -> vector<2xf32>
    "func.return"(%12) : (vector<2xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<100x3xf32>, vector<4xindex>, index, index) -> vector<4xf32>, sym_name = "strided_gather"}> ({
  ^bb0(%arg8: memref<100x3xf32>, %arg9: vector<4xindex>, %arg10: index, %arg11: index):
    %4 = "arith.constant"() <{value = 0 : index}> : () -> index
    %5 = "affine.apply"(%arg10) <{map = #map}> : (index) -> index
    %6 = "memref.subview"(%arg8) <{operandSegmentSizes = array<i32: 1, 0, 0, 0>, static_offsets = array<i64: 0, 0>, static_sizes = array<i64: 100, 1>, static_strides = array<i64: 1, 1>}> : (memref<100x3xf32>) -> memref<100xf32, strided<[3]>>
    %7 = "arith.constant"() <{value = dense<true> : vector<4xi1>}> : () -> vector<4xi1>
    %8 = "arith.constant"() <{value = dense<0.000000e+00> : vector<4xf32>}> : () -> vector<4xf32>
    %9 = "vector.gather"(%6, %4, %arg9, %7, %8) <{alignment = 8 : i64}> : (memref<100xf32, strided<[3]>>, index, vector<4xindex>, vector<4xi1>, vector<4xf32>) -> vector<4xf32>
    "func.return"(%9) : (vector<4xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<?xf32>, vector<[2]xindex>, vector<[2]xi1>, vector<[2]xf32>) -> vector<[2]xf32>, sym_name = "scalable_gather_1d"}> ({
  ^bb0(%arg4: tensor<?xf32>, %arg5: vector<[2]xindex>, %arg6: vector<[2]xi1>, %arg7: vector<[2]xf32>):
    %2 = "arith.constant"() <{value = 0 : index}> : () -> index
    %3 = "vector.gather"(%arg4, %2, %arg5, %arg6, %arg7) : (tensor<?xf32>, index, vector<[2]xindex>, vector<[2]xi1>, vector<[2]xf32>) -> vector<[2]xf32>
    "func.return"(%3) : (vector<[2]xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<4x2xf32>, vector<4xi32>, vector<4xi1>, vector<4xf32>) -> vector<4xf32>, sym_name = "gather_memref_2d_delinearize"}> ({
  ^bb0(%arg0: memref<4x2xf32>, %arg1: vector<4xi32>, %arg2: vector<4xi1>, %arg3: vector<4xf32>):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "vector.gather"(%arg0, %0, %0, %arg1, %arg2, %arg3) : (memref<4x2xf32>, index, index, vector<4xi32>, vector<4xi1>, vector<4xf32>) -> vector<4xf32>
    "func.return"(%1) : (vector<4xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<4x2xf32>, index, index, vector<2xi32>, vector<2xi1>, vector<2xf32>) -> vector<2xf32>, sym_name = "gather_memref_2d_delinearize_nonzero_offsets"}> ({
  ^bb0(%arg0: memref<4x2xf32>, %arg1: index, %arg2: index, %arg3: vector<2xi32>, %arg4: vector<2xi1>, %arg5: vector<2xf32>):
    %0 = "vector.gather"(%arg0, %arg1, %arg2, %arg3, %arg4, %arg5) : (memref<4x2xf32>, index, index, vector<2xi32>, vector<2xi1>, vector<2xf32>) -> vector<2xf32>
    "func.return"(%0) : (vector<2xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<6x5xf32>, vector<2xindex>, vector<2xi1>, vector<2xf32>) -> vector<2xf32>, sym_name = "strided_gather_with_non_zero_offset"}> ({
  ^bb0(%arg0: memref<6x5xf32>, %arg1: vector<2xindex>, %arg2: vector<2xi1>, %arg3: vector<2xf32>):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "memref.subview"(%arg0) <{operandSegmentSizes = array<i32: 1, 0, 0, 0>, static_offsets = array<i64: 0, 3>, static_sizes = array<i64: 6, 1>, static_strides = array<i64: 1, 1>}> : (memref<6x5xf32>) -> memref<6xf32, strided<[5], offset: 3>>
    %2 = "vector.gather"(%1, %0, %arg1, %arg2, %arg3) : (memref<6xf32, strided<[5], offset: 3>>, index, vector<2xindex>, vector<2xi1>, vector<2xf32>) -> vector<2xf32>
    "func.return"(%2) : (vector<2xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<4x3xf32>, index, vector<2xindex>, vector<2xi1>, vector<2xf32>) -> vector<2xf32>, sym_name = "negative_strided_gather_with_dynamic_offset"}> ({
  ^bb0(%arg0: memref<4x3xf32>, %arg1: index, %arg2: vector<2xindex>, %arg3: vector<2xi1>, %arg4: vector<2xf32>):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "memref.subview"(%arg0, %arg1) <{operandSegmentSizes = array<i32: 1, 1, 0, 0>, static_offsets = array<i64: 0, -9223372036854775808>, static_sizes = array<i64: 4, 1>, static_strides = array<i64: 1, 1>}> : (memref<4x3xf32>, index) -> memref<4xf32, strided<[3], offset: ?>>
    %2 = "vector.gather"(%1, %0, %arg2, %arg3, %arg4) : (memref<4xf32, strided<[3], offset: ?>>, index, vector<2xindex>, vector<2xi1>, vector<2xf32>) -> vector<2xf32>
    "func.return"(%2) : (vector<2xf32>) -> ()
  }) : () -> ()
}) : () -> ()

