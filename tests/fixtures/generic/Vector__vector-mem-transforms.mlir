"builtin.module"() ({
  "func.func"() <{function_type = (memref<?xf32>, vector<16xf32>) -> vector<16xf32>, sym_name = "fold_maskedload_all_true_dynamic"}> ({
  ^bb0(%arg30: memref<?xf32>, %arg31: vector<16xf32>):
    %34 = "arith.constant"() <{value = 0 : index}> : () -> index
    %35 = "vector.constant_mask"() <{mask_dim_sizes = array<i64: 16>}> : () -> vector<16xi1>
    %36 = "vector.maskedload"(%arg30, %34, %35, %arg31) : (memref<?xf32>, index, vector<16xi1>, vector<16xf32>) -> vector<16xf32>
    "func.return"(%36) : (vector<16xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<16xf32>, vector<16xf32>) -> vector<16xf32>, sym_name = "fold_maskedload_all_true_static"}> ({
  ^bb0(%arg28: memref<16xf32>, %arg29: vector<16xf32>):
    %31 = "arith.constant"() <{value = 0 : index}> : () -> index
    %32 = "vector.constant_mask"() <{mask_dim_sizes = array<i64: 16>}> : () -> vector<16xi1>
    %33 = "vector.maskedload"(%arg28, %31, %32, %arg29) : (memref<16xf32>, index, vector<16xi1>, vector<16xf32>) -> vector<16xf32>
    "func.return"(%33) : (vector<16xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<16xf32>, vector<16xf32>) -> vector<16xf32>, sym_name = "fold_maskedload_all_false_static"}> ({
  ^bb0(%arg26: memref<16xf32>, %arg27: vector<16xf32>):
    %28 = "arith.constant"() <{value = 0 : index}> : () -> index
    %29 = "vector.constant_mask"() <{mask_dim_sizes = array<i64: 0>}> : () -> vector<16xi1>
    %30 = "vector.maskedload"(%arg26, %28, %29, %arg27) : (memref<16xf32>, index, vector<16xi1>, vector<16xf32>) -> vector<16xf32>
    "func.return"(%30) : (vector<16xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<?xf32>, vector<16xf32>) -> vector<16xf32>, sym_name = "fold_maskedload_dynamic_non_zero_idx"}> ({
  ^bb0(%arg24: memref<?xf32>, %arg25: vector<16xf32>):
    %25 = "arith.constant"() <{value = 8 : index}> : () -> index
    %26 = "vector.constant_mask"() <{mask_dim_sizes = array<i64: 16>}> : () -> vector<16xi1>
    %27 = "vector.maskedload"(%arg24, %25, %26, %arg25) : (memref<?xf32>, index, vector<16xi1>, vector<16xf32>) -> vector<16xf32>
    "func.return"(%27) : (vector<16xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<16xf32>, vector<16xf32>) -> (), sym_name = "fold_maskedstore_all_true"}> ({
  ^bb0(%arg22: memref<16xf32>, %arg23: vector<16xf32>):
    %23 = "arith.constant"() <{value = 0 : index}> : () -> index
    %24 = "vector.constant_mask"() <{mask_dim_sizes = array<i64: 16>}> : () -> vector<16xi1>
    "vector.maskedstore"(%arg22, %23, %24, %arg23) : (memref<16xf32>, index, vector<16xi1>, vector<16xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<16xf32>, vector<16xf32>) -> (), sym_name = "fold_maskedstore_all_false"}> ({
  ^bb0(%arg20: memref<16xf32>, %arg21: vector<16xf32>):
    %21 = "arith.constant"() <{value = 0 : index}> : () -> index
    %22 = "vector.constant_mask"() <{mask_dim_sizes = array<i64: 0>}> : () -> vector<16xi1>
    "vector.maskedstore"(%arg20, %21, %22, %arg21) : (memref<16xf32>, index, vector<16xi1>, vector<16xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<16xf32>, vector<16xi32>, vector<16xf32>) -> vector<16xf32>, sym_name = "no_fold_gather_all_true"}> ({
  ^bb0(%arg17: memref<16xf32>, %arg18: vector<16xi32>, %arg19: vector<16xf32>):
    %18 = "arith.constant"() <{value = 0 : index}> : () -> index
    %19 = "vector.constant_mask"() <{mask_dim_sizes = array<i64: 16>}> : () -> vector<16xi1>
    %20 = "vector.gather"(%arg17, %18, %arg18, %19, %arg19) : (memref<16xf32>, index, vector<16xi32>, vector<16xi1>, vector<16xf32>) -> vector<16xf32>
    "func.return"(%20) : (vector<16xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<16xf32>, vector<16xi32>, vector<16xf32>) -> vector<16xf32>, sym_name = "fold_gather_all_true"}> ({
  ^bb0(%arg14: memref<16xf32>, %arg15: vector<16xi32>, %arg16: vector<16xf32>):
    %15 = "arith.constant"() <{value = 0 : index}> : () -> index
    %16 = "vector.constant_mask"() <{mask_dim_sizes = array<i64: 0>}> : () -> vector<16xi1>
    %17 = "vector.gather"(%arg14, %15, %arg15, %16, %arg16) : (memref<16xf32>, index, vector<16xi32>, vector<16xi1>, vector<16xf32>) -> vector<16xf32>
    "func.return"(%17) : (vector<16xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<16xf32>, vector<16xi32>, vector<16xf32>) -> (), sym_name = "no_fold_scatter_all_true"}> ({
  ^bb0(%arg11: memref<16xf32>, %arg12: vector<16xi32>, %arg13: vector<16xf32>):
    %13 = "arith.constant"() <{value = 0 : index}> : () -> index
    %14 = "vector.constant_mask"() <{mask_dim_sizes = array<i64: 16>}> : () -> vector<16xi1>
    "vector.scatter"(%arg11, %13, %arg12, %14, %arg13) : (memref<16xf32>, index, vector<16xi32>, vector<16xi1>, vector<16xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<16xf32>, vector<16xi32>, vector<16xf32>) -> (), sym_name = "fold_scatter_all_false"}> ({
  ^bb0(%arg8: memref<16xf32>, %arg9: vector<16xi32>, %arg10: vector<16xf32>):
    %10 = "arith.constant"() <{value = 0 : index}> : () -> index
    %11 = "vector.type_cast"(%arg8) : (memref<16xf32>) -> memref<vector<16xf32>>
    %12 = "vector.constant_mask"() <{mask_dim_sizes = array<i64: 0>}> : () -> vector<16xi1>
    "vector.scatter"(%arg8, %10, %arg9, %12, %arg10) : (memref<16xf32>, index, vector<16xi32>, vector<16xi1>, vector<16xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<16xf32>, vector<16xf32>) -> vector<16xf32>, sym_name = "fold_expandload_all_true"}> ({
  ^bb0(%arg6: memref<16xf32>, %arg7: vector<16xf32>):
    %7 = "arith.constant"() <{value = 0 : index}> : () -> index
    %8 = "vector.constant_mask"() <{mask_dim_sizes = array<i64: 16>}> : () -> vector<16xi1>
    %9 = "vector.expandload"(%arg6, %7, %8, %arg7) : (memref<16xf32>, index, vector<16xi1>, vector<16xf32>) -> vector<16xf32>
    "func.return"(%9) : (vector<16xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<16xf32>, vector<16xf32>) -> vector<16xf32>, sym_name = "fold_expandload_all_false"}> ({
  ^bb0(%arg4: memref<16xf32>, %arg5: vector<16xf32>):
    %4 = "arith.constant"() <{value = 0 : index}> : () -> index
    %5 = "vector.constant_mask"() <{mask_dim_sizes = array<i64: 0>}> : () -> vector<16xi1>
    %6 = "vector.expandload"(%arg4, %4, %5, %arg5) : (memref<16xf32>, index, vector<16xi1>, vector<16xf32>) -> vector<16xf32>
    "func.return"(%6) : (vector<16xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<16xf32>, vector<16xf32>) -> (), sym_name = "fold_compressstore_all_true"}> ({
  ^bb0(%arg2: memref<16xf32>, %arg3: vector<16xf32>):
    %2 = "arith.constant"() <{value = 0 : index}> : () -> index
    %3 = "vector.constant_mask"() <{mask_dim_sizes = array<i64: 16>}> : () -> vector<16xi1>
    "vector.compressstore"(%arg2, %2, %3, %arg3) : (memref<16xf32>, index, vector<16xi1>, vector<16xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<16xf32>, vector<16xf32>) -> (), sym_name = "fold_compressstore_all_false"}> ({
  ^bb0(%arg0: memref<16xf32>, %arg1: vector<16xf32>):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "vector.constant_mask"() <{mask_dim_sizes = array<i64: 0>}> : () -> vector<16xi1>
    "vector.compressstore"(%arg0, %0, %1, %arg1) : (memref<16xf32>, index, vector<16xi1>, vector<16xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

