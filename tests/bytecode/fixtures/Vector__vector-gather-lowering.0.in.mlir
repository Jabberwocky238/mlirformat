"builtin.module"() ({
  "func.func"() <{function_type = (memref<?xf32>, vector<2xindex>, vector<2xi1>, vector<2xf32>) -> vector<2xf32>, sym_name = "gather_memref_1d"}> ({
  ^bb0(%arg54: memref<?xf32> loc("<stdin>":4:8), %arg55: vector<2xindex> loc("<stdin>":4:31), %arg56: vector<2xi1> loc("<stdin>":4:56), %arg57: vector<2xf32> loc("<stdin>":4:78)):
    %39 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":5:11)
    %40 = "vector.gather"(%arg54, %39, %arg55, %arg56, %arg57) : (memref<?xf32>, index, vector<2xindex>, vector<2xi1>, vector<2xf32>) -> vector<2xf32> loc("<stdin>":6:11)
    "func.return"(%40) : (vector<2xf32>) -> () loc("<stdin>":7:5)
  }) : () -> () loc("<stdin>":3:3)
  "func.func"() <{function_type = (memref<?xf32>, vector<2xi32>, vector<2xi1>, vector<2xf32>) -> vector<2xf32>, sym_name = "gather_memref_1d_i32_index"}> ({
  ^bb0(%arg50: memref<?xf32> loc("<stdin>":10:8), %arg51: vector<2xi32> loc("<stdin>":10:31), %arg52: vector<2xi1> loc("<stdin>":10:54), %arg53: vector<2xf32> loc("<stdin>":10:76)):
    %37 = "arith.constant"() <{value = 42 : index}> : () -> index loc("<stdin>":11:11)
    %38 = "vector.gather"(%arg50, %37, %arg51, %arg52, %arg53) : (memref<?xf32>, index, vector<2xi32>, vector<2xi1>, vector<2xf32>) -> vector<2xf32> loc("<stdin>":12:11)
    "func.return"(%38) : (vector<2xf32>) -> () loc("<stdin>":13:5)
  }) : () -> () loc("<stdin>":9:3)
  "func.func"() <{function_type = (memref<?x?xf32>, vector<2x3xindex>, vector<2x3xi1>, vector<2x3xf32>) -> vector<2x3xf32>, sym_name = "gather_memref_2d"}> ({
  ^bb0(%arg46: memref<?x?xf32> loc("<stdin>":16:8), %arg47: vector<2x3xindex> loc("<stdin>":16:33), %arg48: vector<2x3xi1> loc("<stdin>":16:60), %arg49: vector<2x3xf32> loc("<stdin>":16:84)):
    %34 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":17:11)
    %35 = "arith.constant"() <{value = 1 : index}> : () -> index loc("<stdin>":18:11)
    %36 = "vector.gather"(%arg46, %34, %35, %arg47, %arg48, %arg49) : (memref<?x?xf32>, index, index, vector<2x3xindex>, vector<2x3xi1>, vector<2x3xf32>) -> vector<2x3xf32> loc("<stdin>":19:11)
    "func.return"(%36) : (vector<2x3xf32>) -> () loc("<stdin>":20:5)
  }) : () -> () loc("<stdin>":15:3)
  "func.func"() <{function_type = (memref<?x?xf32>, vector<2x[3]xindex>, vector<2x[3]xi1>, vector<2x[3]xf32>) -> vector<2x[3]xf32>, sym_name = "scalable_gather_memref_2d"}> ({
  ^bb0(%arg42: memref<?x?xf32> loc("<stdin>":23:8), %arg43: vector<2x[3]xindex> loc("<stdin>":23:33), %arg44: vector<2x[3]xi1> loc("<stdin>":23:62), %arg45: vector<2x[3]xf32> loc("<stdin>":23:88)):
    %31 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":24:11)
    %32 = "arith.constant"() <{value = 1 : index}> : () -> index loc("<stdin>":25:11)
    %33 = "vector.gather"(%arg42, %31, %32, %arg43, %arg44, %arg45) : (memref<?x?xf32>, index, index, vector<2x[3]xindex>, vector<2x[3]xi1>, vector<2x[3]xf32>) -> vector<2x[3]xf32> loc("<stdin>":26:11)
    "func.return"(%33) : (vector<2x[3]xf32>) -> () loc("<stdin>":27:5)
  }) : () -> () loc("<stdin>":22:3)
  "func.func"() <{function_type = (memref<?x?xf32>, vector<2x[3]xindex>, vector<2x[3]xi1>, vector<2x[3]xf32>) -> vector<2x[3]xf32>, sym_name = "scalable_gather_memref_2d_with_alignment"}> ({
  ^bb0(%arg38: memref<?x?xf32> loc("<stdin>":30:8), %arg39: vector<2x[3]xindex> loc("<stdin>":30:33), %arg40: vector<2x[3]xi1> loc("<stdin>":30:62), %arg41: vector<2x[3]xf32> loc("<stdin>":30:88)):
    %28 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":31:11)
    %29 = "arith.constant"() <{value = 1 : index}> : () -> index loc("<stdin>":32:11)
    %30 = "vector.gather"(%arg38, %28, %29, %arg39, %arg40, %arg41) <{alignment = 8 : i64}> : (memref<?x?xf32>, index, index, vector<2x[3]xindex>, vector<2x[3]xi1>, vector<2x[3]xf32>) -> vector<2x[3]xf32> loc("<stdin>":33:11)
    "func.return"(%30) : (vector<2x[3]xf32>) -> () loc("<stdin>":34:5)
  }) : () -> () loc("<stdin>":29:3)
  "func.func"() <{function_type = (memref<?x?xf32>, vector<[4]x8xindex>, vector<[4]x8xi1>, vector<[4]x8xf32>) -> vector<[4]x8xf32>, sym_name = "scalable_gather_cant_unroll"}> ({
  ^bb0(%arg34: memref<?x?xf32> loc("<stdin>":37:8), %arg35: vector<[4]x8xindex> loc("<stdin>":37:33), %arg36: vector<[4]x8xi1> loc("<stdin>":37:62), %arg37: vector<[4]x8xf32> loc("<stdin>":37:88)):
    %25 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":38:11)
    %26 = "arith.constant"() <{value = 1 : index}> : () -> index loc("<stdin>":39:11)
    %27 = "vector.gather"(%arg34, %25, %26, %arg35, %arg36, %arg37) : (memref<?x?xf32>, index, index, vector<[4]x8xindex>, vector<[4]x8xi1>, vector<[4]x8xf32>) -> vector<[4]x8xf32> loc("<stdin>":40:11)
    "func.return"(%27) : (vector<[4]x8xf32>) -> () loc("<stdin>":41:5)
  }) : () -> () loc("<stdin>":36:3)
  "func.func"() <{function_type = (tensor<?xf32>, vector<2xindex>, vector<2xi1>, vector<2xf32>) -> vector<2xf32>, sym_name = "gather_tensor_1d"}> ({
  ^bb0(%arg30: tensor<?xf32> loc("<stdin>":44:8), %arg31: vector<2xindex> loc("<stdin>":44:31), %arg32: vector<2xi1> loc("<stdin>":44:56), %arg33: vector<2xf32> loc("<stdin>":44:78)):
    %23 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":45:11)
    %24 = "vector.gather"(%arg30, %23, %arg31, %arg32, %arg33) : (tensor<?xf32>, index, vector<2xindex>, vector<2xi1>, vector<2xf32>) -> vector<2xf32> loc("<stdin>":46:11)
    "func.return"(%24) : (vector<2xf32>) -> () loc("<stdin>":47:5)
  }) : () -> () loc("<stdin>":43:3)
  "func.func"() <{function_type = (memref<4xf32, strided<[2]>>, vector<1xindex>, vector<1xi1>, vector<1xf32>) -> vector<1xf32>, sym_name = "gather_memref_non_unit_stride_read_1_element"}> ({
  ^bb0(%arg26: memref<4xf32, strided<[2]>> loc("<stdin>":50:8), %arg27: vector<1xindex> loc("<stdin>":50:45), %arg28: vector<1xi1> loc("<stdin>":50:70), %arg29: vector<1xf32> loc("<stdin>":50:92)):
    %21 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":51:11)
    %22 = "vector.gather"(%arg26, %21, %arg27, %arg28, %arg29) : (memref<4xf32, strided<[2]>>, index, vector<1xindex>, vector<1xi1>, vector<1xf32>) -> vector<1xf32> loc("<stdin>":52:11)
    "func.return"(%22) : (vector<1xf32>) -> () loc("<stdin>":53:5)
  }) : () -> () loc("<stdin>":49:3)
  "func.func"() <{function_type = (memref<4xf32, strided<[2]>>, vector<2xindex>, vector<2xi1>, vector<2xf32>) -> vector<2xf32>, sym_name = "gather_memref_non_unit_stride_read_more_than_1_element"}> ({
  ^bb0(%arg22: memref<4xf32, strided<[2]>> loc("<stdin>":56:8), %arg23: vector<2xindex> loc("<stdin>":56:45), %arg24: vector<2xi1> loc("<stdin>":56:70), %arg25: vector<2xf32> loc("<stdin>":56:92)):
    %19 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":57:11)
    %20 = "vector.gather"(%arg22, %19, %arg23, %arg24, %arg25) : (memref<4xf32, strided<[2]>>, index, vector<2xindex>, vector<2xi1>, vector<2xf32>) -> vector<2xf32> loc("<stdin>":58:11)
    "func.return"(%20) : (vector<2xf32>) -> () loc("<stdin>":59:5)
  }) : () -> () loc("<stdin>":55:3)
  "func.func"() <{function_type = (tensor<?x?xf32>, vector<2x3xindex>, vector<2x3xi1>, vector<2x3xf32>) -> vector<2x3xf32>, sym_name = "gather_tensor_2d"}> ({
  ^bb0(%arg18: tensor<?x?xf32> loc("<stdin>":62:8), %arg19: vector<2x3xindex> loc("<stdin>":62:33), %arg20: vector<2x3xi1> loc("<stdin>":62:60), %arg21: vector<2x3xf32> loc("<stdin>":62:84)):
    %16 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":63:11)
    %17 = "arith.constant"() <{value = 1 : index}> : () -> index loc("<stdin>":64:11)
    %18 = "vector.gather"(%arg18, %16, %17, %arg19, %arg20, %arg21) : (tensor<?x?xf32>, index, index, vector<2x3xindex>, vector<2x3xi1>, vector<2x3xf32>) -> vector<2x3xf32> loc("<stdin>":65:11)
    "func.return"(%18) : (vector<2x3xf32>) -> () loc("<stdin>":66:5)
  }) : () -> () loc("<stdin>":61:3)
  "func.func"() <{function_type = (tensor<?xf32>, vector<2xindex>, vector<2xf32>) -> vector<2xf32>, sym_name = "gather_tensor_1d_all_set"}> ({
  ^bb0(%arg15: tensor<?xf32> loc("<stdin>":69:8), %arg16: vector<2xindex> loc("<stdin>":69:31), %arg17: vector<2xf32> loc("<stdin>":69:56)):
    %13 = "arith.constant"() <{value = dense<true> : vector<2xi1>}> : () -> vector<2xi1> loc("<stdin>":70:11)
    %14 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":71:11)
    %15 = "vector.gather"(%arg15, %14, %arg16, %13, %arg17) : (tensor<?xf32>, index, vector<2xindex>, vector<2xi1>, vector<2xf32>) -> vector<2xf32> loc("<stdin>":72:11)
    "func.return"(%15) : (vector<2xf32>) -> () loc("<stdin>":73:5)
  }) : () -> () loc("<stdin>":68:3)
  "func.func"() <{function_type = (tensor<?xf32>, vector<2xindex>, vector<2xf32>) -> vector<2xf32>, sym_name = "gather_tensor_1d_none_set"}> ({
  ^bb0(%arg12: tensor<?xf32> loc("<stdin>":76:8), %arg13: vector<2xindex> loc("<stdin>":76:31), %arg14: vector<2xf32> loc("<stdin>":76:56)):
    %10 = "arith.constant"() <{value = dense<false> : vector<2xi1>}> : () -> vector<2xi1> loc("<stdin>":77:11)
    %11 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":78:11)
    %12 = "vector.gather"(%arg12, %11, %arg13, %10, %arg14) : (tensor<?xf32>, index, vector<2xindex>, vector<2xi1>, vector<2xf32>) -> vector<2xf32> loc("<stdin>":79:11)
    "func.return"(%12) : (vector<2xf32>) -> () loc("<stdin>":80:5)
  }) : () -> () loc("<stdin>":75:3)
  "func.func"() <{function_type = (memref<100x3xf32>, vector<4xindex>, index, index) -> vector<4xf32>, sym_name = "strided_gather"}> ({
  ^bb0(%arg8: memref<100x3xf32> loc("<stdin>":83:8), %arg9: vector<4xindex> loc("<stdin>":83:34), %arg10: index loc("<stdin>":83:58), %arg11: index loc("<stdin>":83:73)):
    %4 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":84:10)
    %5 = "affine.apply"(%arg10) <{map = affine_map<()[s0] -> (s0 * 4096)>}> : (index) -> index loc("<stdin>":85:10)
    %6 = "memref.subview"(%arg8) <{operandSegmentSizes = array<i32: 1, 0, 0, 0>, static_offsets = array<i64: 0, 0>, static_sizes = array<i64: 100, 1>, static_strides = array<i64: 1, 1>}> : (memref<100x3xf32>) -> memref<100xf32, strided<[3]>> loc("<stdin>":86:10)
    %7 = "arith.constant"() <{value = dense<true> : vector<4xi1>}> : () -> vector<4xi1> loc("<stdin>":87:10)
    %8 = "arith.constant"() <{value = dense<0.000000e+00> : vector<4xf32>}> : () -> vector<4xf32> loc("<stdin>":88:10)
    %9 = "vector.gather"(%6, %4, %arg9, %7, %8) <{alignment = 8 : i64}> : (memref<100xf32, strided<[3]>>, index, vector<4xindex>, vector<4xi1>, vector<4xf32>) -> vector<4xf32> loc("<stdin>":89:10)
    "func.return"(%9) : (vector<4xf32>) -> () loc("<stdin>":90:5)
  }) : () -> () loc("<stdin>":82:3)
  "func.func"() <{function_type = (tensor<?xf32>, vector<[2]xindex>, vector<[2]xi1>, vector<[2]xf32>) -> vector<[2]xf32>, sym_name = "scalable_gather_1d"}> ({
  ^bb0(%arg4: tensor<?xf32> loc("<stdin>":93:8), %arg5: vector<[2]xindex> loc("<stdin>":93:30), %arg6: vector<[2]xi1> loc("<stdin>":93:56), %arg7: vector<[2]xf32> loc("<stdin>":93:79)):
    %2 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":94:10)
    %3 = "vector.gather"(%arg4, %2, %arg5, %arg6, %arg7) : (tensor<?xf32>, index, vector<[2]xindex>, vector<[2]xi1>, vector<[2]xf32>) -> vector<[2]xf32> loc("<stdin>":95:10)
    "func.return"(%3) : (vector<[2]xf32>) -> () loc("<stdin>":96:5)
  }) : () -> () loc("<stdin>":92:3)
  "func.func"() <{function_type = (memref<4x2xf32>, vector<4xi32>, vector<4xi1>, vector<4xf32>) -> vector<4xf32>, sym_name = "gather_memref_2d_delinearize"}> ({
  ^bb0(%arg0: memref<4x2xf32> loc("<stdin>":99:8), %arg1: vector<4xi32> loc("<stdin>":99:32), %arg2: vector<4xi1> loc("<stdin>":99:54), %arg3: vector<4xf32> loc("<stdin>":99:75)):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":100:10)
    %1 = "vector.gather"(%arg0, %0, %0, %arg1, %arg2, %arg3) : (memref<4x2xf32>, index, index, vector<4xi32>, vector<4xi1>, vector<4xf32>) -> vector<4xf32> loc("<stdin>":101:10)
    "func.return"(%1) : (vector<4xf32>) -> () loc("<stdin>":102:5)
  }) : () -> () loc("<stdin>":98:3)
}) : () -> () loc("<stdin>":2:1)
