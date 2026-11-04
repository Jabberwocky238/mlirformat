"builtin.module"() ({
  "omp.private"() <{data_sharing_type = #omp<data_sharing_type{type = private}>, sym_name = "_QFEi_private_i32", type = i32}> ({
  }, {
  }, {
  }) : () -> ()
  "omp.private"() <{data_sharing_type = #omp<data_sharing_type{type = private}>, sym_name = "_QFEpriv_val_dist_private_f32", type = f32}> ({
  }, {
  }, {
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "_QQmain", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    %0 = "llvm.mlir.constant"() <{value = 1 : i64}> : () -> i64
    %1 = "llvm.alloca"(%0) <{elem_type = f32}> {bindc_name = "priv_val_dist"} : (i64) -> !llvm.ptr
    %2 = "llvm.alloca"(%0) <{elem_type = i32}> {bindc_name = "i"} : (i64) -> !llvm.ptr
    %3 = "llvm.mlir.constant"() <{value = 3.140000e+00 : f32}> : () -> f32
    %4 = "llvm.mlir.constant"() <{value = 1000 : i32}> : () -> i32
    %5 = "llvm.mlir.constant"() <{value = 1 : i32}> : () -> i32
    "omp.teams"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 0>}> ({
      "omp.distribute"(%1, %2) <{operandSegmentSizes = array<i32: 0, 0, 0, 2>, private_syms = [@_QFEpriv_val_dist_private_f32, @_QFEi_private_i32]}> ({
      ^bb0(%arg0: !llvm.ptr, %arg1: !llvm.ptr):
        "omp.loop_nest"(%5, %4, %5) <{loop_inclusive}> ({
        ^bb0(%arg2: i32):
          "llvm.store"(%arg2, %arg1) <{ordering = 0 : i64}> : (i32, !llvm.ptr) -> ()
          "llvm.store"(%3, %arg0) <{ordering = 0 : i64}> : (f32, !llvm.ptr) -> ()
          "omp.yield"() : () -> ()
        }) : (i32, i32, i32) -> ()
      }) : (!llvm.ptr, !llvm.ptr) -> ()
      "omp.terminator"() : () -> ()
    }) : () -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr)>, linkage = #llvm.linkage<external>, sym_name = "foo_free", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  }) : () -> ()
  "omp.private"() <{data_sharing_type = #omp<data_sharing_type{type = firstprivate}>, sym_name = "_QFEpriv_val_dist_firstprivate_f32", type = f32}> ({
  }, {
  ^bb0(%arg3: !llvm.ptr, %arg4: !llvm.ptr):
    %4 = "llvm.load"(%arg3) <{ordering = 0 : i64}> : (!llvm.ptr) -> f32
    "llvm.store"(%4, %arg4) <{ordering = 0 : i64}> : (f32, !llvm.ptr) -> ()
    "omp.yield"(%arg4) : (!llvm.ptr) -> ()
  }, {
  ^bb0(%arg2: !llvm.ptr):
    "llvm.call"(%arg2) <{CConv = #llvm.cconv<ccc>, TailCallKind = #llvm.tailcallkind<none>, callee = @foo_free, fastmathFlags = #llvm.fastmath<none>, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 1, 0>}> : (!llvm.ptr) -> ()
    "omp.yield"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "_QQmain", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    %0 = "llvm.mlir.constant"() <{value = 1 : i64}> : () -> i64
    %1 = "llvm.alloca"(%0) <{elem_type = f32}> {bindc_name = "priv_val_dist"} : (i64) -> !llvm.ptr
    %2 = "llvm.mlir.constant"() <{value = 3.140000e+00 : f32}> : () -> f32
    %3 = "llvm.mlir.constant"() <{value = 1 : i32}> : () -> i32
    "omp.distribute"(%1) <{operandSegmentSizes = array<i32: 0, 0, 0, 1>, private_syms = [@_QFEpriv_val_dist_firstprivate_f32]}> ({
    ^bb0(%arg0: !llvm.ptr):
      "omp.loop_nest"(%3, %3, %3) <{loop_inclusive}> ({
      ^bb0(%arg1: i32):
        "llvm.store"(%2, %arg0) <{ordering = 0 : i64}> : (f32, !llvm.ptr) -> ()
        "omp.yield"() : () -> ()
      }) : (i32, i32, i32) -> ()
    }) : (!llvm.ptr) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

