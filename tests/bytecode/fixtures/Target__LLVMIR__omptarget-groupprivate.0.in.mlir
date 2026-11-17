"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "_QQmain", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    %0 = "llvm.mlir.addressof"() <{global_name = @global_a}> : () -> !llvm.ptr loc("<stdin>":3:10)
    %1 = "omp.map.info"(%0) <{map_capture_type = #omp<variable_capture_kind(ByCopy)>, map_type = #omp<clause_map_flags to|from>, name = "i", operandSegmentSizes = array<i32: 1, 0, 0, 0>, partial_map = false, var_ptr_type = i32}> : (!llvm.ptr) -> !llvm.ptr loc("<stdin>":4:10)
    "omp.target"(%1) <{kernel_type = #omp<kernel_type(generic)>, operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0>}> ({
    ^bb0(%arg0: !llvm.ptr loc("<stdin>":6:10)):
      %2 = "llvm.load"(%arg0) <{ordering = 0 : i64}> : (!llvm.ptr) -> i32 loc("<stdin>":7:12)
      %3 = "omp.groupprivate"() <{device_type = #omp<device_type(any)>, sym_name = @global_any}> : () -> !llvm.ptr loc("<stdin>":8:12)
      "llvm.store"(%2, %3) <{ordering = 0 : i64}> : (i32, !llvm.ptr) -> () loc("<stdin>":9:7)
      %4 = "omp.groupprivate"() <{device_type = #omp<device_type(host)>, sym_name = @global_host}> : () -> !llvm.ptr loc("<stdin>":10:12)
      "llvm.store"(%2, %4) <{ordering = 0 : i64}> : (i32, !llvm.ptr) -> () loc("<stdin>":11:7)
      %5 = "omp.groupprivate"() <{device_type = #omp<device_type(nohost)>, sym_name = @global_nohost}> : () -> !llvm.ptr loc("<stdin>":12:12)
      "llvm.store"(%2, %5) <{ordering = 0 : i64}> : (i32, !llvm.ptr) -> () loc("<stdin>":13:7)
      "omp.terminator"() : () -> () loc("<stdin>":14:7)
    }) : (!llvm.ptr) -> () loc("<stdin>":5:5)
    "llvm.return"() : () -> () loc("<stdin>":16:5)
  }) {fir.bindc_name = "main"} : () -> () loc("<stdin>":2:3)
  "llvm.mlir.global"() <{addr_space = 0 : i32, global_type = i32, linkage = #llvm.linkage<internal>, sym_name = "global_a", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  }) : () -> () loc("<stdin>":18:3)
  "llvm.mlir.global"() <{addr_space = 0 : i32, global_type = i32, linkage = #llvm.linkage<internal>, sym_name = "global_any", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  }) : () -> () loc("<stdin>":20:3)
  "llvm.mlir.global"() <{addr_space = 0 : i32, global_type = i32, linkage = #llvm.linkage<internal>, sym_name = "global_host", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  }) : () -> () loc("<stdin>":22:3)
  "llvm.mlir.global"() <{addr_space = 0 : i32, global_type = i32, linkage = #llvm.linkage<internal>, sym_name = "global_nohost", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  }) : () -> () loc("<stdin>":24:3)
}) {dlti.dl_spec = #dlti.dl_spec<"dlti.alloca_memory_space" = 5 : ui32>, llvm.target_triple = "amdgcn-amd-amdhsa", omp.is_target_device = true} : () -> () loc("<stdin>":1:1)
