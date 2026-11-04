"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<i32 (ptr)>, linkage = #llvm.linkage<external>, sym_name = "opaque_ptr_load", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg15: !llvm.ptr):
    %6 = "llvm.load"(%arg15) <{ordering = 0 : i64}> : (!llvm.ptr) -> i32
    "llvm.return"(%6) : (i32) -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (i32, ptr)>, linkage = #llvm.linkage<external>, sym_name = "opaque_ptr_store", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg13: i32, %arg14: !llvm.ptr):
    "llvm.store"(%arg13, %arg14) <{ordering = 0 : i64}> : (i32, !llvm.ptr) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr, ptr)>, linkage = #llvm.linkage<external>, sym_name = "opaque_ptr_ptr_store", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg11: !llvm.ptr, %arg12: !llvm.ptr):
    "llvm.store"(%arg11, %arg12) <{ordering = 0 : i64}> : (!llvm.ptr, !llvm.ptr) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<ptr (i32)>, linkage = #llvm.linkage<external>, sym_name = "opaque_ptr_alloca", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg10: i32):
    %5 = "llvm.alloca"(%arg10) <{elem_type = f32}> : (i32) -> !llvm.ptr
    "llvm.return"(%5) : (!llvm.ptr) -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<ptr (ptr, i32)>, linkage = #llvm.linkage<external>, sym_name = "opaque_ptr_gep", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg8: !llvm.ptr, %arg9: i32):
    %4 = "llvm.getelementptr"(%arg8, %arg9) <{elem_type = f32, noWrapFlags = 0 : i32, rawConstantIndices = array<i32: -2147483648>}> : (!llvm.ptr, i32) -> !llvm.ptr
    "llvm.return"(%4) : (!llvm.ptr) -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<ptr (ptr, i32)>, linkage = #llvm.linkage<external>, sym_name = "opaque_ptr_gep_struct", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg6: !llvm.ptr, %arg7: i32):
    %3 = "llvm.getelementptr"(%arg6, %arg7) <{elem_type = !llvm.struct<(struct<(f32, f64)>, struct<(i32, i64)>)>, noWrapFlags = 0 : i32, rawConstantIndices = array<i32: -2147483648, 0, 1>}> : (!llvm.ptr, i32) -> !llvm.ptr
    "llvm.return"(%3) : (!llvm.ptr) -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<vector<48xf32> (ptr, i64)>, linkage = #llvm.linkage<external>, sym_name = "opaque_ptr_matrix_load_store", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg4: !llvm.ptr, %arg5: i64):
    %2 = "llvm.intr.matrix.column.major.load"(%arg4, %arg5) <{columns = 16 : i32, isVolatile = false, rows = 3 : i32}> : (!llvm.ptr, i64) -> vector<48xf32>
    "llvm.intr.matrix.column.major.store"(%2, %arg4, %arg5) <{columns = 16 : i32, isVolatile = false, rows = 3 : i32}> : (vector<48xf32>, !llvm.ptr, i64) -> ()
    "llvm.return"(%2) : (vector<48xf32>) -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<vector<7xf32> (ptr, vector<7xi1>)>, linkage = #llvm.linkage<external>, sym_name = "opaque_ptr_masked_load", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg2: !llvm.ptr, %arg3: vector<7xi1>):
    %1 = "llvm.intr.masked.load"(%arg2, %arg3) <{alignment = 1 : i32}> : (!llvm.ptr, vector<7xi1>) -> vector<7xf32>
    "llvm.return"(%1) : (vector<7xf32>) -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<vector<7xf32> (vector<7x!llvm.ptr>, vector<7xi1>)>, linkage = #llvm.linkage<external>, sym_name = "opaque_ptr_gather", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: vector<7x!llvm.ptr>, %arg1: vector<7xi1>):
    %0 = "llvm.intr.masked.gather"(%arg0, %arg1) <{alignment = 1 : i32}> : (vector<7x!llvm.ptr>, vector<7xi1>) -> vector<7xf32>
    "llvm.return"(%0) : (vector<7xf32>) -> ()
  }) : () -> ()
}) : () -> ()

