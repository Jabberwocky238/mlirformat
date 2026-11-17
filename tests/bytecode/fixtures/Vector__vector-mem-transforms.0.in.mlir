"builtin.module"() ({
  "func.func"() <{function_type = (memref<?xf32>, vector<16xf32>) -> vector<16xf32>, sym_name = "fold_maskedload_all_true_dynamic"}> ({
  ^bb0(%arg30: memref<?xf32> loc("<stdin>":3:8), %arg31: vector<16xf32> loc("<stdin>":3:31)):
    %34 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":4:11)
    %35 = "vector.constant_mask"() <{mask_dim_sizes = array<i64: 16>}> : () -> vector<16xi1> loc("<stdin>":5:11)
    %36 = "vector.maskedload"(%arg30, %34, %35, %arg31) : (memref<?xf32>, index, vector<16xi1>, vector<16xf32>) -> vector<16xf32> loc("<stdin>":6:11)
    "func.return"(%36) : (vector<16xf32>) -> () loc("<stdin>":7:5)
  }) : () -> () loc("<stdin>":2:3)
  "func.func"() <{function_type = (memref<16xf32>, vector<16xf32>) -> vector<16xf32>, sym_name = "fold_maskedload_all_true_static"}> ({
  ^bb0(%arg28: memref<16xf32> loc("<stdin>":10:8), %arg29: vector<16xf32> loc("<stdin>":10:32)):
    %31 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":11:11)
    %32 = "vector.constant_mask"() <{mask_dim_sizes = array<i64: 16>}> : () -> vector<16xi1> loc("<stdin>":12:11)
    %33 = "vector.maskedload"(%arg28, %31, %32, %arg29) : (memref<16xf32>, index, vector<16xi1>, vector<16xf32>) -> vector<16xf32> loc("<stdin>":13:11)
    "func.return"(%33) : (vector<16xf32>) -> () loc("<stdin>":14:5)
  }) : () -> () loc("<stdin>":9:3)
  "func.func"() <{function_type = (memref<16xf32>, vector<16xf32>) -> vector<16xf32>, sym_name = "fold_maskedload_all_false_static"}> ({
  ^bb0(%arg26: memref<16xf32> loc("<stdin>":17:8), %arg27: vector<16xf32> loc("<stdin>":17:32)):
    %28 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":18:11)
    %29 = "vector.constant_mask"() <{mask_dim_sizes = array<i64: 0>}> : () -> vector<16xi1> loc("<stdin>":19:11)
    %30 = "vector.maskedload"(%arg26, %28, %29, %arg27) : (memref<16xf32>, index, vector<16xi1>, vector<16xf32>) -> vector<16xf32> loc("<stdin>":20:11)
    "func.return"(%30) : (vector<16xf32>) -> () loc("<stdin>":21:5)
  }) : () -> () loc("<stdin>":16:3)
  "func.func"() <{function_type = (memref<?xf32>, vector<16xf32>) -> vector<16xf32>, sym_name = "fold_maskedload_dynamic_non_zero_idx"}> ({
  ^bb0(%arg24: memref<?xf32> loc("<stdin>":24:8), %arg25: vector<16xf32> loc("<stdin>":24:31)):
    %25 = "arith.constant"() <{value = 8 : index}> : () -> index loc("<stdin>":25:11)
    %26 = "vector.constant_mask"() <{mask_dim_sizes = array<i64: 16>}> : () -> vector<16xi1> loc("<stdin>":26:11)
    %27 = "vector.maskedload"(%arg24, %25, %26, %arg25) : (memref<?xf32>, index, vector<16xi1>, vector<16xf32>) -> vector<16xf32> loc("<stdin>":27:11)
    "func.return"(%27) : (vector<16xf32>) -> () loc("<stdin>":28:5)
  }) : () -> () loc("<stdin>":23:3)
  "func.func"() <{function_type = (memref<16xf32>, vector<16xf32>) -> (), sym_name = "fold_maskedstore_all_true"}> ({
  ^bb0(%arg22: memref<16xf32> loc("<stdin>":31:8), %arg23: vector<16xf32> loc("<stdin>":31:32)):
    %23 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":32:11)
    %24 = "vector.constant_mask"() <{mask_dim_sizes = array<i64: 16>}> : () -> vector<16xi1> loc("<stdin>":33:11)
    "vector.maskedstore"(%arg22, %23, %24, %arg23) : (memref<16xf32>, index, vector<16xi1>, vector<16xf32>) -> () loc("<stdin>":34:5)
    "func.return"() : () -> () loc("<stdin>":35:5)
  }) : () -> () loc("<stdin>":30:3)
  "func.func"() <{function_type = (memref<16xf32>, vector<16xf32>) -> (), sym_name = "fold_maskedstore_all_false"}> ({
  ^bb0(%arg20: memref<16xf32> loc("<stdin>":38:8), %arg21: vector<16xf32> loc("<stdin>":38:32)):
    %21 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":39:11)
    %22 = "vector.constant_mask"() <{mask_dim_sizes = array<i64: 0>}> : () -> vector<16xi1> loc("<stdin>":40:11)
    "vector.maskedstore"(%arg20, %21, %22, %arg21) : (memref<16xf32>, index, vector<16xi1>, vector<16xf32>) -> () loc("<stdin>":41:5)
    "func.return"() : () -> () loc("<stdin>":42:5)
  }) : () -> () loc("<stdin>":37:3)
  "func.func"() <{function_type = (memref<16xf32>, vector<16xi32>, vector<16xf32>) -> vector<16xf32>, sym_name = "no_fold_gather_all_true"}> ({
  ^bb0(%arg17: memref<16xf32> loc("<stdin>":45:8), %arg18: vector<16xi32> loc("<stdin>":45:32), %arg19: vector<16xf32> loc("<stdin>":45:56)):
    %18 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":46:11)
    %19 = "vector.constant_mask"() <{mask_dim_sizes = array<i64: 16>}> : () -> vector<16xi1> loc("<stdin>":47:11)
    %20 = "vector.gather"(%arg17, %18, %arg18, %19, %arg19) : (memref<16xf32>, index, vector<16xi32>, vector<16xi1>, vector<16xf32>) -> vector<16xf32> loc("<stdin>":48:11)
    "func.return"(%20) : (vector<16xf32>) -> () loc("<stdin>":49:5)
  }) : () -> () loc("<stdin>":44:3)
  "func.func"() <{function_type = (memref<16xf32>, vector<16xi32>, vector<16xf32>) -> vector<16xf32>, sym_name = "fold_gather_all_true"}> ({
  ^bb0(%arg14: memref<16xf32> loc("<stdin>":52:8), %arg15: vector<16xi32> loc("<stdin>":52:32), %arg16: vector<16xf32> loc("<stdin>":52:56)):
    %15 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":53:11)
    %16 = "vector.constant_mask"() <{mask_dim_sizes = array<i64: 0>}> : () -> vector<16xi1> loc("<stdin>":54:11)
    %17 = "vector.gather"(%arg14, %15, %arg15, %16, %arg16) : (memref<16xf32>, index, vector<16xi32>, vector<16xi1>, vector<16xf32>) -> vector<16xf32> loc("<stdin>":55:11)
    "func.return"(%17) : (vector<16xf32>) -> () loc("<stdin>":56:5)
  }) : () -> () loc("<stdin>":51:3)
  "func.func"() <{function_type = (memref<16xf32>, vector<16xi32>, vector<16xf32>) -> (), sym_name = "no_fold_scatter_all_true"}> ({
  ^bb0(%arg11: memref<16xf32> loc("<stdin>":59:8), %arg12: vector<16xi32> loc("<stdin>":59:32), %arg13: vector<16xf32> loc("<stdin>":59:56)):
    %13 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":60:11)
    %14 = "vector.constant_mask"() <{mask_dim_sizes = array<i64: 16>}> : () -> vector<16xi1> loc("<stdin>":61:11)
    "vector.scatter"(%arg11, %13, %arg12, %14, %arg13) : (memref<16xf32>, index, vector<16xi32>, vector<16xi1>, vector<16xf32>) -> () loc("<stdin>":62:5)
    "func.return"() : () -> () loc("<stdin>":63:5)
  }) : () -> () loc("<stdin>":58:3)
  "func.func"() <{function_type = (memref<16xf32>, vector<16xi32>, vector<16xf32>) -> (), sym_name = "fold_scatter_all_false"}> ({
  ^bb0(%arg8: memref<16xf32> loc("<stdin>":66:8), %arg9: vector<16xi32> loc("<stdin>":66:31), %arg10: vector<16xf32> loc("<stdin>":66:54)):
    %10 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":67:11)
    %11 = "vector.type_cast"(%arg8) : (memref<16xf32>) -> memref<vector<16xf32>> loc("<stdin>":68:11)
    %12 = "vector.constant_mask"() <{mask_dim_sizes = array<i64: 0>}> : () -> vector<16xi1> loc("<stdin>":69:11)
    "vector.scatter"(%arg8, %10, %arg9, %12, %arg10) : (memref<16xf32>, index, vector<16xi32>, vector<16xi1>, vector<16xf32>) -> () loc("<stdin>":70:5)
    "func.return"() : () -> () loc("<stdin>":71:5)
  }) : () -> () loc("<stdin>":65:3)
  "func.func"() <{function_type = (memref<16xf32>, vector<16xf32>) -> vector<16xf32>, sym_name = "fold_expandload_all_true"}> ({
  ^bb0(%arg6: memref<16xf32> loc("<stdin>":74:8), %arg7: vector<16xf32> loc("<stdin>":74:31)):
    %7 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":75:10)
    %8 = "vector.constant_mask"() <{mask_dim_sizes = array<i64: 16>}> : () -> vector<16xi1> loc("<stdin>":76:10)
    %9 = "vector.expandload"(%arg6, %7, %8, %arg7) : (memref<16xf32>, index, vector<16xi1>, vector<16xf32>) -> vector<16xf32> loc("<stdin>":77:10)
    "func.return"(%9) : (vector<16xf32>) -> () loc("<stdin>":78:5)
  }) : () -> () loc("<stdin>":73:3)
  "func.func"() <{function_type = (memref<16xf32>, vector<16xf32>) -> vector<16xf32>, sym_name = "fold_expandload_all_false"}> ({
  ^bb0(%arg4: memref<16xf32> loc("<stdin>":81:8), %arg5: vector<16xf32> loc("<stdin>":81:31)):
    %4 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":82:10)
    %5 = "vector.constant_mask"() <{mask_dim_sizes = array<i64: 0>}> : () -> vector<16xi1> loc("<stdin>":83:10)
    %6 = "vector.expandload"(%arg4, %4, %5, %arg5) : (memref<16xf32>, index, vector<16xi1>, vector<16xf32>) -> vector<16xf32> loc("<stdin>":84:10)
    "func.return"(%6) : (vector<16xf32>) -> () loc("<stdin>":85:5)
  }) : () -> () loc("<stdin>":80:3)
  "func.func"() <{function_type = (memref<16xf32>, vector<16xf32>) -> (), sym_name = "fold_compressstore_all_true"}> ({
  ^bb0(%arg2: memref<16xf32> loc("<stdin>":88:8), %arg3: vector<16xf32> loc("<stdin>":88:31)):
    %2 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":89:10)
    %3 = "vector.constant_mask"() <{mask_dim_sizes = array<i64: 16>}> : () -> vector<16xi1> loc("<stdin>":90:10)
    "vector.compressstore"(%arg2, %2, %3, %arg3) : (memref<16xf32>, index, vector<16xi1>, vector<16xf32>) -> () loc("<stdin>":91:5)
    "func.return"() : () -> () loc("<stdin>":92:5)
  }) : () -> () loc("<stdin>":87:3)
  "func.func"() <{function_type = (memref<16xf32>, vector<16xf32>) -> (), sym_name = "fold_compressstore_all_false"}> ({
  ^bb0(%arg0: memref<16xf32> loc("<stdin>":95:8), %arg1: vector<16xf32> loc("<stdin>":95:31)):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":96:10)
    %1 = "vector.constant_mask"() <{mask_dim_sizes = array<i64: 0>}> : () -> vector<16xi1> loc("<stdin>":97:10)
    "vector.compressstore"(%arg0, %0, %1, %arg1) : (memref<16xf32>, index, vector<16xi1>, vector<16xf32>) -> () loc("<stdin>":98:5)
    "func.return"() : () -> () loc("<stdin>":99:5)
  }) : () -> () loc("<stdin>":94:3)
}) : () -> () loc("<stdin>":1:1)
