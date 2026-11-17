"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr)>, linkage = #llvm.linkage<external>, sym_name = "_QQmain_omp_outline_1", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg5: !llvm.ptr loc("<stdin>":3:8)):
    %12 = "omp.map.info"(%arg5) <{map_capture_type = #omp<variable_capture_kind(ByRef)>, map_type = #omp<clause_map_flags from>, name = "d", operandSegmentSizes = array<i32: 1, 0, 0, 0>, partial_map = false, var_ptr_type = i32}> : (!llvm.ptr) -> !llvm.ptr loc("<stdin>":4:11)
    "omp.target"(%12) <{kernel_type = #omp<kernel_type(generic)>, operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0>}> ({
    ^bb0(%arg6: !llvm.ptr loc("<stdin>":6:10)):
      "omp.parallel"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0>}> ({
        %13 = "llvm.mlir.constant"() <{value = 1 : i32}> : () -> i32 loc("<stdin>":8:15)
        "llvm.store"(%13, %arg6) <{ordering = 0 : i64}> : (i32, !llvm.ptr) -> () loc("<stdin>":9:9)
        "omp.terminator"() : () -> () loc("<stdin>":10:9)
      }) : () -> () loc("<stdin>":7:7)
      "omp.terminator"() : () -> () loc("<stdin>":12:7)
    }) : (!llvm.ptr) -> () loc("<stdin>":5:5)
    "llvm.return"() : () -> () loc("<stdin>":14:5)
  }) {omp.declare_target = #omp.declaretarget<device_type = (host), capture_clause = (to)>} : () -> () loc("<stdin>":2:3)
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr)>, linkage = #llvm.linkage<external>, sym_name = "_test_num_threads", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg3: !llvm.ptr loc("<stdin>":17:8)):
    %9 = "omp.map.info"(%arg3) <{map_capture_type = #omp<variable_capture_kind(ByRef)>, map_type = #omp<clause_map_flags from>, name = "d", operandSegmentSizes = array<i32: 1, 0, 0, 0>, partial_map = false, var_ptr_type = i32}> : (!llvm.ptr) -> !llvm.ptr loc("<stdin>":18:10)
    "omp.target"(%9) <{kernel_type = #omp<kernel_type(generic)>, operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0>}> ({
    ^bb0(%arg4: !llvm.ptr loc("<stdin>":20:10)):
      %10 = "llvm.mlir.constant"() <{value = 156 : i32}> : () -> i32 loc("<stdin>":21:13)
      "omp.parallel"(%10) <{operandSegmentSizes = array<i32: 0, 0, 0, 1, 0, 0>}> ({
        %11 = "llvm.mlir.constant"() <{value = 1 : i32}> : () -> i32 loc("<stdin>":23:15)
        "llvm.store"(%11, %arg4) <{ordering = 0 : i64}> : (i32, !llvm.ptr) -> () loc("<stdin>":24:9)
        "omp.terminator"() : () -> () loc("<stdin>":25:9)
      }) : (i32) -> () loc("<stdin>":22:7)
      "omp.terminator"() : () -> () loc("<stdin>":27:7)
    }) : (!llvm.ptr) -> () loc("<stdin>":19:5)
    "llvm.return"() : () -> () loc("<stdin>":29:5)
  }) {omp.declare_target = #omp.declaretarget<device_type = (host), capture_clause = (to)>} : () -> () loc("<stdin>":16:3)
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, arg_attrs = [{fir.bindc_name = "ifcond"}], function_type = !llvm.func<void (ptr)>, linkage = #llvm.linkage<external>, sym_name = "parallel_if", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: !llvm.ptr loc("<stdin>":32:8)):
    %0 = "llvm.mlir.constant"() <{value = 1 : i64}> : () -> i64 loc("<stdin>":33:10)
    %1 = "llvm.alloca"(%0) <{elem_type = i32}> {bindc_name = "d"} : (i64) -> !llvm.ptr<5> loc("<stdin>":34:10)
    %2 = "llvm.addrspacecast"(%1) : (!llvm.ptr<5>) -> !llvm.ptr loc("<stdin>":35:10)
    %3 = "omp.map.info"(%2) <{map_capture_type = #omp<variable_capture_kind(ByRef)>, map_type = #omp<clause_map_flags from>, name = "d", operandSegmentSizes = array<i32: 1, 0, 0, 0>, partial_map = false, var_ptr_type = i32}> : (!llvm.ptr) -> !llvm.ptr loc("<stdin>":36:10)
    %4 = "omp.map.info"(%arg0) <{map_capture_type = #omp<variable_capture_kind(ByCopy)>, map_type = #omp<clause_map_flags implicit>, name = "ifcond", operandSegmentSizes = array<i32: 1, 0, 0, 0>, partial_map = false, var_ptr_type = i32}> : (!llvm.ptr) -> !llvm.ptr loc("<stdin>":37:10)
    "omp.target"(%3, %4) <{kernel_type = #omp<kernel_type(generic)>, operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0>}> ({
    ^bb0(%arg1: !llvm.ptr loc("<stdin>":39:10), %arg2: !llvm.ptr loc("<stdin>":39:28)):
      %5 = "llvm.mlir.constant"() <{value = 10 : i32}> : () -> i32 loc("<stdin>":40:12)
      %6 = "llvm.load"(%arg2) <{ordering = 0 : i64}> : (!llvm.ptr) -> i32 loc("<stdin>":41:12)
      %7 = "llvm.mlir.constant"() <{value = 0 : i64}> : () -> i32 loc("<stdin>":42:12)
      %8 = "llvm.icmp"(%6, %7) <{predicate = 1 : i64}> : (i32, i32) -> i1 loc("<stdin>":43:12)
      "omp.parallel"(%8) <{operandSegmentSizes = array<i32: 0, 0, 1, 0, 0, 0>}> ({
        "llvm.store"(%5, %arg1) <{ordering = 0 : i64}> : (i32, !llvm.ptr) -> () loc("<stdin>":45:9)
        "omp.terminator"() : () -> () loc("<stdin>":46:9)
      }) : (i1) -> () loc("<stdin>":44:7)
      "omp.terminator"() : () -> () loc("<stdin>":48:7)
    }) : (!llvm.ptr, !llvm.ptr) -> () loc("<stdin>":38:5)
    "llvm.return"() : () -> () loc("<stdin>":50:5)
  }) : () -> () loc("<stdin>":31:3)
}) {dlti.dl_spec = #dlti.dl_spec<"dlti.alloca_memory_space" = 5 : ui32>, llvm.data_layout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-p7:160:256:256:32-p8:128:128:128:48-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7:8:9", llvm.target_triple = "amdgcn-amd-amdhsa", omp.is_gpu = true, omp.is_target_device = true} : () -> () loc("<stdin>":1:1)
