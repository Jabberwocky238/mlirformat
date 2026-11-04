"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "_QQmain", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    %0 = "llvm.mlir.constant"() <{value = 1 : i64}> : () -> i64
    %1 = "llvm.alloca"(%0) <{elem_type = !llvm.ptr}> : (i64) -> !llvm.ptr<5>
    %2 = "llvm.addrspacecast"(%1) : (!llvm.ptr<5>) -> !llvm.ptr
    %3 = "omp.map.info"(%2) <{map_capture_type = #omp<variable_capture_kind(ByRef)>, map_type = #omp<clause_map_flags to|from>, name = "", operandSegmentSizes = array<i32: 1, 0, 0, 0>, partial_map = false, var_type = !llvm.ptr}> : (!llvm.ptr) -> !llvm.ptr
    "omp.target_data"(%3) <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 1>}> ({
    ^bb0(%arg0: !llvm.ptr):
      %4 = "omp.map.info"(%arg0) <{map_capture_type = #omp<variable_capture_kind(ByRef)>, map_type = #omp<clause_map_flags to|from>, name = "", operandSegmentSizes = array<i32: 1, 0, 0, 0>, partial_map = false, var_type = !llvm.ptr}> : (!llvm.ptr) -> !llvm.ptr
      "omp.target"(%4) <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0>}> ({
      ^bb0(%arg1: !llvm.ptr):
        %5 = "llvm.mlir.constant"() <{value = 999 : i32}> : () -> i32
        %6 = "llvm.load"(%arg1) <{ordering = 0 : i64}> : (!llvm.ptr) -> !llvm.ptr
        "llvm.store"(%5, %6) <{ordering = 0 : i64}> : (i32, !llvm.ptr) -> ()
        "omp.terminator"() : () -> ()
      }) : (!llvm.ptr) -> ()
      "omp.terminator"() : () -> ()
    }) : (!llvm.ptr) -> ()
    "llvm.return"() : () -> ()
  }) {fir.bindc_name = "main"} : () -> ()
}) {dlti.dl_spec = #dlti.dl_spec<"dlti.alloca_memory_space" = 5 : ui32>, llvm.target_triple = "amdgcn-amd-amdhsa", omp.is_target_device = true} : () -> ()

