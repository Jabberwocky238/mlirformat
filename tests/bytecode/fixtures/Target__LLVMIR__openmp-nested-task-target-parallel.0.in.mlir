"builtin.module"() ({
  "omp.private"() <{data_sharing_type = #omp<data_sharing_type{type = private}>, sym_name = "_QFEi_private_i32", type = i32}> ({
  }, {
  }, {
  }) : () -> () loc("<stdin>":2:3)
  "omp.private"() <{data_sharing_type = #omp<data_sharing_type{type = firstprivate}>, sym_name = "_QFEc_firstprivate_i32", type = i32}> ({
  }, {
  ^bb0(%arg7: !llvm.ptr loc("<stdin>":8:8), %arg8: !llvm.ptr loc("<stdin>":8:26)):
    %22 = "llvm.load"(%arg7) <{ordering = 0 : i64}> : (!llvm.ptr) -> i32 loc("<stdin>":9:11)
    "llvm.store"(%22, %arg8) <{ordering = 0 : i64}> : (i32, !llvm.ptr) -> () loc("<stdin>":10:5)
    "omp.yield"(%arg8) : (!llvm.ptr) -> () loc("<stdin>":11:5)
  }, {
  }) : () -> () loc("<stdin>":6:3)
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "_QQmain", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    %2 = "llvm.mlir.constant"() <{value = 1 : i64}> : () -> i64 loc("<stdin>":15:10)
    %3 = "llvm.alloca"(%2) <{elem_type = i32}> {bindc_name = "i"} : (i64) -> !llvm.ptr loc("<stdin>":16:10)
    %4 = "llvm.mlir.constant"() <{value = 1 : i64}> : () -> i64 loc("<stdin>":17:10)
    %5 = "llvm.alloca"(%4) <{elem_type = i32}> {bindc_name = "c"} : (i64) -> !llvm.ptr loc("<stdin>":18:10)
    %6 = "llvm.mlir.constant"() <{value = 10 : index}> : () -> i64 loc("<stdin>":19:10)
    %7 = "llvm.mlir.constant"() <{value = 0 : index}> : () -> i64 loc("<stdin>":20:10)
    %8 = "llvm.mlir.constant"() <{value = 10000 : index}> : () -> i64 loc("<stdin>":21:10)
    %9 = "llvm.mlir.constant"() <{value = 1 : index}> : () -> i64 loc("<stdin>":22:10)
    %10 = "llvm.mlir.constant"() <{value = 1 : i64}> : () -> i64 loc("<stdin>":23:11)
    %11 = "llvm.mlir.addressof"() <{global_name = @_QFECchunksz}> : () -> !llvm.ptr loc("<stdin>":24:11)
    %12 = "llvm.mlir.constant"() <{value = 1 : i64}> : () -> i64 loc("<stdin>":25:11)
    %13 = "llvm.trunc"(%9) <{overflowFlags = 0 : i32}> : (i64) -> i32 loc("<stdin>":26:11)
    "llvm.br"(%13, %6)[^bb1] : (i32, i64) -> () loc("<stdin>":27:5)
  ^bb1(%14: i32 loc("<stdin>":28:8), %15: i64 loc("<stdin>":28:18)):  // pred: ^bb0
    %16 = "llvm.icmp"(%15, %7) <{predicate = 4 : i64}> : (i64, i64) -> i1 loc("<stdin>":29:11)
    "llvm.store"(%14, %5) <{ordering = 0 : i64}> : (i32, !llvm.ptr) -> () loc("<stdin>":30:5)
    "omp.task"(%5) <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0>, private_syms = [@_QFEc_firstprivate_i32]}> ({
    ^bb0(%arg0: !llvm.ptr loc("<stdin>":32:10)):
      %17 = "omp.map.info"(%3) <{map_capture_type = #omp<variable_capture_kind(ByCopy)>, map_type = #omp<clause_map_flags implicit>, name = "i", operandSegmentSizes = array<i32: 1, 0, 0, 0>, partial_map = false, var_ptr_type = i32}> : (!llvm.ptr) -> !llvm.ptr loc("<stdin>":33:13)
      %18 = "llvm.mlir.constant"() <{value = 9999 : i32}> : () -> i32 loc("<stdin>":34:13)
      %19 = "llvm.mlir.constant"() <{value = 1 : i32}> : () -> i32 loc("<stdin>":35:13)
      %20 = "llvm.load"(%arg0) <{ordering = 0 : i64}> : (!llvm.ptr) -> i32 loc("<stdin>":36:13)
      %21 = "llvm.add"(%20, %18) <{overflowFlags = 0 : i32}> : (i32, i32) -> i32 loc("<stdin>":37:13)
      "omp.target"(%19, %20, %21, %17) <{kernel_type = #omp<kernel_type(spmd)>, operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 3, 0, 0, 0, 1, 0, 0, 0>}> ({
      ^bb0(%arg1: i32 loc("<stdin>":39:12), %arg2: i32 loc("<stdin>":39:24), %arg3: i32 loc("<stdin>":39:36), %arg4: !llvm.ptr loc("<stdin>":39:48)):
        "omp.parallel"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0>}> ({
          "omp.wsloop"(%arg4) <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 1, 0, 0>, private_syms = [@_QFEi_private_i32]}> ({
          ^bb0(%arg5: !llvm.ptr loc("<stdin>":42:16)):
            "omp.loop_nest"(%arg2, %arg3, %arg1) <{loop_inclusive}> ({
            ^bb0(%arg6: i32 loc("<stdin>":44:18)):
              "llvm.store"(%arg6, %arg5) <{ordering = 0 : i64}> : (i32, !llvm.ptr) -> () loc("<stdin>":45:15)
              "omp.yield"() : () -> () loc("<stdin>":46:15)
            }) : (i32, i32, i32) -> () loc("<stdin>":43:13)
          }) : (!llvm.ptr) -> () loc("<stdin>":41:11)
          "omp.terminator"() : () -> () loc("<stdin>":49:11)
        }) {omp.combined} : () -> () loc("<stdin>":40:9)
        "omp.terminator"() : () -> () loc("<stdin>":51:9)
      }) {omp.combined} : (i32, i32, i32, !llvm.ptr) -> () loc("<stdin>":38:7)
      "omp.terminator"() : () -> () loc("<stdin>":53:7)
    }) : (!llvm.ptr) -> () loc("<stdin>":31:5)
    "llvm.return"() : () -> () loc("<stdin>":55:5)
  }) : () -> () loc("<stdin>":14:3)
  "llvm.mlir.global"() <{addr_space = 0 : i32, constant, global_type = i32, linkage = #llvm.linkage<internal>, sym_name = "_QFECchunksz", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    %1 = "llvm.mlir.constant"() <{value = 10000 : i32}> : () -> i32 loc("<stdin>":58:10)
    "llvm.return"(%1) : (i32) -> () loc("<stdin>":59:5)
  }) : () -> () loc("<stdin>":57:3)
  "llvm.mlir.global"() <{addr_space = 0 : i32, constant, global_type = i32, linkage = #llvm.linkage<internal>, sym_name = "_QFECn", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    %0 = "llvm.mlir.constant"() <{value = 100000 : i32}> : () -> i32 loc("<stdin>":62:10)
    "llvm.return"(%0) : (i32) -> () loc("<stdin>":63:5)
  }) : () -> () loc("<stdin>":61:3)
}) : () -> () loc("<stdin>":1:1)
