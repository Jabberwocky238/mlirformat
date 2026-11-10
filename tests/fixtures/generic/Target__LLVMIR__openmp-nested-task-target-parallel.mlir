"builtin.module"() ({
  "omp.private"() <{data_sharing_type = #omp<data_sharing_type{type = private}>, sym_name = "_QFEi_private_i32", type = i32}> ({
  }, {
  }, {
  }) : () -> ()
  "omp.private"() <{data_sharing_type = #omp<data_sharing_type{type = firstprivate}>, sym_name = "_QFEc_firstprivate_i32", type = i32}> ({
  }, {
  ^bb0(%arg7: !llvm.ptr, %arg8: !llvm.ptr):
    %22 = "llvm.load"(%arg7) <{ordering = 0 : i64}> : (!llvm.ptr) -> i32
    "llvm.store"(%22, %arg8) <{ordering = 0 : i64}> : (i32, !llvm.ptr) -> ()
    "omp.yield"(%arg8) : (!llvm.ptr) -> ()
  }, {
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "_QQmain", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    %2 = "llvm.mlir.constant"() <{value = 1 : i64}> : () -> i64
    %3 = "llvm.alloca"(%2) <{elem_type = i32}> {bindc_name = "i"} : (i64) -> !llvm.ptr
    %4 = "llvm.mlir.constant"() <{value = 1 : i64}> : () -> i64
    %5 = "llvm.alloca"(%4) <{elem_type = i32}> {bindc_name = "c"} : (i64) -> !llvm.ptr
    %6 = "llvm.mlir.constant"() <{value = 10 : index}> : () -> i64
    %7 = "llvm.mlir.constant"() <{value = 0 : index}> : () -> i64
    %8 = "llvm.mlir.constant"() <{value = 10000 : index}> : () -> i64
    %9 = "llvm.mlir.constant"() <{value = 1 : index}> : () -> i64
    %10 = "llvm.mlir.constant"() <{value = 1 : i64}> : () -> i64
    %11 = "llvm.mlir.addressof"() <{global_name = @_QFECchunksz}> : () -> !llvm.ptr
    %12 = "llvm.mlir.constant"() <{value = 1 : i64}> : () -> i64
    %13 = "llvm.trunc"(%9) <{overflowFlags = 0 : i32}> : (i64) -> i32
    "llvm.br"(%13, %6)[^bb1] : (i32, i64) -> ()
  ^bb1(%14: i32, %15: i64):  // pred: ^bb0
    %16 = "llvm.icmp"(%15, %7) <{predicate = 4 : i64}> : (i64, i64) -> i1
    "llvm.store"(%14, %5) <{ordering = 0 : i64}> : (i32, !llvm.ptr) -> ()
    "omp.task"(%5) <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0>, private_syms = [@_QFEc_firstprivate_i32]}> ({
    ^bb0(%arg0: !llvm.ptr):
      %17 = "omp.map.info"(%3) <{map_capture_type = #omp<variable_capture_kind(ByCopy)>, map_type = #omp<clause_map_flags implicit>, name = "i", operandSegmentSizes = array<i32: 1, 0, 0, 0>, partial_map = false, var_ptr_type = i32}> : (!llvm.ptr) -> !llvm.ptr
      %18 = "llvm.mlir.constant"() <{value = 9999 : i32}> : () -> i32
      %19 = "llvm.mlir.constant"() <{value = 1 : i32}> : () -> i32
      %20 = "llvm.load"(%arg0) <{ordering = 0 : i64}> : (!llvm.ptr) -> i32
      %21 = "llvm.add"(%20, %18) <{overflowFlags = 0 : i32}> : (i32, i32) -> i32
      "omp.target"(%19, %20, %21, %17) <{kernel_type = #omp<kernel_type(spmd)>, operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 3, 0, 0, 0, 1, 0, 0, 0>}> ({
      ^bb0(%arg1: i32, %arg2: i32, %arg3: i32, %arg4: !llvm.ptr):
        "omp.parallel"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0>}> ({
          "omp.wsloop"(%arg4) <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 1, 0, 0>, private_syms = [@_QFEi_private_i32]}> ({
          ^bb0(%arg5: !llvm.ptr):
            "omp.loop_nest"(%arg2, %arg3, %arg1) <{loop_inclusive}> ({
            ^bb0(%arg6: i32):
              "llvm.store"(%arg6, %arg5) <{ordering = 0 : i64}> : (i32, !llvm.ptr) -> ()
              "omp.yield"() : () -> ()
            }) : (i32, i32, i32) -> ()
          }) : (!llvm.ptr) -> ()
          "omp.terminator"() : () -> ()
        }) {omp.combined} : () -> ()
        "omp.terminator"() : () -> ()
      }) {omp.combined} : (i32, i32, i32, !llvm.ptr) -> ()
      "omp.terminator"() : () -> ()
    }) : (!llvm.ptr) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.mlir.global"() <{addr_space = 0 : i32, constant, global_type = i32, linkage = #llvm.linkage<internal>, sym_name = "_QFECchunksz", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    %1 = "llvm.mlir.constant"() <{value = 10000 : i32}> : () -> i32
    "llvm.return"(%1) : (i32) -> ()
  }) : () -> ()
  "llvm.mlir.global"() <{addr_space = 0 : i32, constant, global_type = i32, linkage = #llvm.linkage<internal>, sym_name = "_QFECn", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    %0 = "llvm.mlir.constant"() <{value = 100000 : i32}> : () -> i32
    "llvm.return"(%0) : (i32) -> ()
  }) : () -> ()
}) : () -> ()

