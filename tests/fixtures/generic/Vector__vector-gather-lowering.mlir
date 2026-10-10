#map = affine_map<()[s0] -> (s0 * 4096)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<?xf32>, vector<2xindex>, vector<2xi1>, vector<2xf32>) -> vector<2xf32>, sym_name = "gather_memref_1d"}> ({
  ^bb0(%arg50: memref<?xf32>, %arg51: vector<2xindex>, %arg52: vector<2xi1>, %arg53: vector<2xf32>):
    %37 = "arith.constant"() <{value = 0 : index}> : () -> index
    %38 = "vector.gather"(%arg50, %37, %arg51, %arg52, %arg53) : (memref<?xf32>, index, vector<2xindex>, vector<2xi1>, vector<2xf32>) -> vector<2xf32>
    "func.return"(%38) : (vector<2xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<?xf32>, vector<2xi32>, vector<2xi1>, vector<2xf32>) -> vector<2xf32>, sym_name = "gather_memref_1d_i32_index"}> ({
  ^bb0(%arg46: memref<?xf32>, %arg47: vector<2xi32>, %arg48: vector<2xi1>, %arg49: vector<2xf32>):
    %35 = "arith.constant"() <{value = 42 : index}> : () -> index
    %36 = "vector.gather"(%arg46, %35, %arg47, %arg48, %arg49) : (memref<?xf32>, index, vector<2xi32>, vector<2xi1>, vector<2xf32>) -> vector<2xf32>
    "func.return"(%36) : (vector<2xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<?x?xf32>, vector<2x3xindex>, vector<2x3xi1>, vector<2x3xf32>) -> vector<2x3xf32>, sym_name = "gather_memref_2d"}> ({
  ^bb0(%arg42: memref<?x?xf32>, %arg43: vector<2x3xindex>, %arg44: vector<2x3xi1>, %arg45: vector<2x3xf32>):
    %32 = "arith.constant"() <{value = 0 : index}> : () -> index
    %33 = "arith.constant"() <{value = 1 : index}> : () -> index
    %34 = "vector.gather"(%arg42, %32, %33, %arg43, %arg44, %arg45) : (memref<?x?xf32>, index, index, vector<2x3xindex>, vector<2x3xi1>, vector<2x3xf32>) -> vector<2x3xf32>
    "func.return"(%34) : (vector<2x3xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<?x?xf32>, vector<2x[3]xindex>, vector<2x[3]xi1>, vector<2x[3]xf32>) -> vector<2x[3]xf32>, sym_name = "scalable_gather_memref_2d"}> ({
  ^bb0(%arg38: memref<?x?xf32>, %arg39: vector<2x[3]xindex>, %arg40: vector<2x[3]xi1>, %arg41: vector<2x[3]xf32>):
    %29 = "arith.constant"() <{value = 0 : index}> : () -> index
    %30 = "arith.constant"() <{value = 1 : index}> : () -> index
    %31 = "vector.gather"(%arg38, %29, %30, %arg39, %arg40, %arg41) : (memref<?x?xf32>, index, index, vector<2x[3]xindex>, vector<2x[3]xi1>, vector<2x[3]xf32>) -> vector<2x[3]xf32>
    "func.return"(%31) : (vector<2x[3]xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<?x?xf32>, vector<2x[3]xindex>, vector<2x[3]xi1>, vector<2x[3]xf32>) -> vector<2x[3]xf32>, sym_name = "scalable_gather_memref_2d_with_alignment"}> ({
  ^bb0(%arg34: memref<?x?xf32>, %arg35: vector<2x[3]xindex>, %arg36: vector<2x[3]xi1>, %arg37: vector<2x[3]xf32>):
    %26 = "arith.constant"() <{value = 0 : index}> : () -> index
    %27 = "arith.constant"() <{value = 1 : index}> : () -> index
    %28 = "vector.gather"(%arg34, %26, %27, %arg35, %arg36, %arg37) <{alignment = 8 : i64}> : (memref<?x?xf32>, index, index, vector<2x[3]xindex>, vector<2x[3]xi1>, vector<2x[3]xf32>) -> vector<2x[3]xf32>
    "func.return"(%28) : (vector<2x[3]xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<?x?xf32>, vector<[4]x8xindex>, vector<[4]x8xi1>, vector<[4]x8xf32>) -> vector<[4]x8xf32>, sym_name = "scalable_gather_cant_unroll"}> ({
  ^bb0(%arg30: memref<?x?xf32>, %arg31: vector<[4]x8xindex>, %arg32: vector<[4]x8xi1>, %arg33: vector<[4]x8xf32>):
    %23 = "arith.constant"() <{value = 0 : index}> : () -> index
    %24 = "arith.constant"() <{value = 1 : index}> : () -> index
    %25 = "vector.gather"(%arg30, %23, %24, %arg31, %arg32, %arg33) : (memref<?x?xf32>, index, index, vector<[4]x8xindex>, vector<[4]x8xi1>, vector<[4]x8xf32>) -> vector<[4]x8xf32>
    "func.return"(%25) : (vector<[4]x8xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<?xf32>, vector<2xindex>, vector<2xi1>, vector<2xf32>) -> vector<2xf32>, sym_name = "gather_tensor_1d"}> ({
  ^bb0(%arg26: tensor<?xf32>, %arg27: vector<2xindex>, %arg28: vector<2xi1>, %arg29: vector<2xf32>):
    %21 = "arith.constant"() <{value = 0 : index}> : () -> index
    %22 = "vector.gather"(%arg26, %21, %arg27, %arg28, %arg29) : (tensor<?xf32>, index, vector<2xindex>, vector<2xi1>, vector<2xf32>) -> vector<2xf32>
    "func.return"(%22) : (vector<2xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<4xf32, strided<[2]>>, vector<1xindex>, vector<1xi1>, vector<1xf32>) -> vector<1xf32>, sym_name = "gather_memref_non_unit_stride_read_1_element"}> ({
  ^bb0(%arg22: memref<4xf32, strided<[2]>>, %arg23: vector<1xindex>, %arg24: vector<1xi1>, %arg25: vector<1xf32>):
    %19 = "arith.constant"() <{value = 0 : index}> : () -> index
    %20 = "vector.gather"(%arg22, %19, %arg23, %arg24, %arg25) : (memref<4xf32, strided<[2]>>, index, vector<1xindex>, vector<1xi1>, vector<1xf32>) -> vector<1xf32>
    "func.return"(%20) : (vector<1xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<4xf32, strided<[2]>>, vector<2xindex>, vector<2xi1>, vector<2xf32>) -> vector<2xf32>, sym_name = "gather_memref_non_unit_stride_read_more_than_1_element"}> ({
  ^bb0(%arg18: memref<4xf32, strided<[2]>>, %arg19: vector<2xindex>, %arg20: vector<2xi1>, %arg21: vector<2xf32>):
    %17 = "arith.constant"() <{value = 0 : index}> : () -> index
    %18 = "vector.gather"(%arg18, %17, %arg19, %arg20, %arg21) : (memref<4xf32, strided<[2]>>, index, vector<2xindex>, vector<2xi1>, vector<2xf32>) -> vector<2xf32>
    "func.return"(%18) : (vector<2xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<?x?xf32>, vector<2x3xindex>, vector<2x3xi1>, vector<2x3xf32>) -> vector<2x3xf32>, sym_name = "gather_tensor_2d"}> ({
  ^bb0(%arg14: tensor<?x?xf32>, %arg15: vector<2x3xindex>, %arg16: vector<2x3xi1>, %arg17: vector<2x3xf32>):
    %14 = "arith.constant"() <{value = 0 : index}> : () -> index
    %15 = "arith.constant"() <{value = 1 : index}> : () -> index
    %16 = "vector.gather"(%arg14, %14, %15, %arg15, %arg16, %arg17) : (tensor<?x?xf32>, index, index, vector<2x3xindex>, vector<2x3xi1>, vector<2x3xf32>) -> vector<2x3xf32>
    "func.return"(%16) : (vector<2x3xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<?xf32>, vector<2xindex>, vector<2xf32>) -> vector<2xf32>, sym_name = "gather_tensor_1d_all_set"}> ({
  ^bb0(%arg11: tensor<?xf32>, %arg12: vector<2xindex>, %arg13: vector<2xf32>):
    %11 = "arith.constant"() <{value = dense<true> : vector<2xi1>}> : () -> vector<2xi1>
    %12 = "arith.constant"() <{value = 0 : index}> : () -> index
    %13 = "vector.gather"(%arg11, %12, %arg12, %11, %arg13) : (tensor<?xf32>, index, vector<2xindex>, vector<2xi1>, vector<2xf32>) -> vector<2xf32>
    "func.return"(%13) : (vector<2xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<?xf32>, vector<2xindex>, vector<2xf32>) -> vector<2xf32>, sym_name = "gather_tensor_1d_none_set"}> ({
  ^bb0(%arg8: tensor<?xf32>, %arg9: vector<2xindex>, %arg10: vector<2xf32>):
    %8 = "arith.constant"() <{value = dense<false> : vector<2xi1>}> : () -> vector<2xi1>
    %9 = "arith.constant"() <{value = 0 : index}> : () -> index
    %10 = "vector.gather"(%arg8, %9, %arg9, %8, %arg10) : (tensor<?xf32>, index, vector<2xindex>, vector<2xi1>, vector<2xf32>) -> vector<2xf32>
    "func.return"(%10) : (vector<2xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<100x3xf32>, vector<4xindex>, index, index) -> vector<4xf32>, sym_name = "strided_gather"}> ({
  ^bb0(%arg4: memref<100x3xf32>, %arg5: vector<4xindex>, %arg6: index, %arg7: index):
    %2 = "arith.constant"() <{value = 0 : index}> : () -> index
    %3 = "affine.apply"(%arg6) <{map = #map}> : (index) -> index
    %4 = "memref.subview"(%arg4) <{operandSegmentSizes = array<i32: 1, 0, 0, 0>, static_offsets = array<i64: 0, 0>, static_sizes = array<i64: 100, 1>, static_strides = array<i64: 1, 1>}> : (memref<100x3xf32>) -> memref<100xf32, strided<[3]>>
    %5 = "arith.constant"() <{value = dense<true> : vector<4xi1>}> : () -> vector<4xi1>
    %6 = "arith.constant"() <{value = dense<0.000000e+00> : vector<4xf32>}> : () -> vector<4xf32>
    %7 = "vector.gather"(%4, %2, %arg5, %5, %6) <{alignment = 8 : i64}> : (memref<100xf32, strided<[3]>>, index, vector<4xindex>, vector<4xi1>, vector<4xf32>) -> vector<4xf32>
    "func.return"(%7) : (vector<4xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<?xf32>, vector<[2]xindex>, vector<[2]xi1>, vector<[2]xf32>) -> vector<[2]xf32>, sym_name = "scalable_gather_1d"}> ({
  ^bb0(%arg0: tensor<?xf32>, %arg1: vector<[2]xindex>, %arg2: vector<[2]xi1>, %arg3: vector<[2]xf32>):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "vector.gather"(%arg0, %0, %arg1, %arg2, %arg3) : (tensor<?xf32>, index, vector<[2]xindex>, vector<[2]xi1>, vector<[2]xf32>) -> vector<[2]xf32>
    "func.return"(%1) : (vector<[2]xf32>) -> ()
  }) : () -> ()
}) : () -> ()

