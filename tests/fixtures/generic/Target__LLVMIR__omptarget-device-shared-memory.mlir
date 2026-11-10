"builtin.module"() ({
  "omp.private"() <{data_sharing_type = #omp<data_sharing_type{type = private}>, sym_name = "privatizer", type = i32}> ({
  }, {
  }, {
  }) : () -> ()
  "omp.declare_reduction"() <{sym_name = "reduction", type = i32}> ({
  }, {
  ^bb0(%arg10: i32):
    %18 = "llvm.mlir.constant"() <{value = 0 : i32}> : () -> i32
    "omp.yield"(%18) : (i32) -> ()
  }, {
  ^bb0(%arg8: i32, %arg9: i32):
    %17 = "llvm.add"(%arg8, %arg9) <{overflowFlags = 0 : i32}> : (i32, i32) -> i32
    "omp.yield"(%17) : (i32) -> ()
  }, {
  }, {
  }, {
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "main", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    %0 = "llvm.mlir.constant"() <{value = 1 : i64}> : () -> i64
    %1 = "llvm.alloca"(%0) <{elem_type = i32}> {bindc_name = "x"} : (i64) -> !llvm.ptr<5>
    %2 = "llvm.addrspacecast"(%1) : (!llvm.ptr<5>) -> !llvm.ptr
    %3 = "llvm.alloca"(%0) <{elem_type = i32}> {bindc_name = "y"} : (i64) -> !llvm.ptr<5>
    %4 = "llvm.addrspacecast"(%3) : (!llvm.ptr<5>) -> !llvm.ptr
    %5 = "llvm.alloca"(%0) <{elem_type = i32}> {bindc_name = "z"} : (i64) -> !llvm.ptr<5>
    %6 = "llvm.addrspacecast"(%5) : (!llvm.ptr<5>) -> !llvm.ptr
    %7 = "omp.map.info"(%2) <{map_capture_type = #omp<variable_capture_kind(ByRef)>, map_type = #omp<clause_map_flags to|from>, name = "x", operandSegmentSizes = array<i32: 1, 0, 0, 0>, partial_map = false, var_ptr_type = i32}> : (!llvm.ptr) -> !llvm.ptr
    %8 = "omp.map.info"(%4) <{map_capture_type = #omp<variable_capture_kind(ByRef)>, map_type = #omp<clause_map_flags to|from>, name = "y", operandSegmentSizes = array<i32: 1, 0, 0, 0>, partial_map = false, var_ptr_type = i32}> : (!llvm.ptr) -> !llvm.ptr
    %9 = "omp.map.info"(%6) <{map_capture_type = #omp<variable_capture_kind(ByRef)>, map_type = #omp<clause_map_flags to|from>, name = "z", operandSegmentSizes = array<i32: 1, 0, 0, 0>, partial_map = false, var_ptr_type = i32}> : (!llvm.ptr) -> !llvm.ptr
    "omp.target"(%7, %8, %9) <{kernel_type = #omp<kernel_type(generic)>, operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3, 0, 0, 0>}> ({
    ^bb0(%arg0: !llvm.ptr, %arg1: !llvm.ptr, %arg2: !llvm.ptr):
      %10 = "llvm.mlir.constant"() <{value = 10000 : i32}> : () -> i32
      %11 = "llvm.mlir.constant"() <{value = 1 : i32}> : () -> i32
      "omp.teams"(%arg0) <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 1, 0>, reduction_byref = array<i1: false>, reduction_syms = [@reduction]}> ({
      ^bb0(%arg3: !llvm.ptr):
        "omp.distribute"(%arg1, %arg2) <{operandSegmentSizes = array<i32: 0, 0, 0, 2>, private_syms = [@privatizer, @privatizer]}> ({
        ^bb0(%arg4: !llvm.ptr, %arg5: !llvm.ptr):
          "omp.loop_nest"(%11, %10, %11) <{loop_inclusive}> ({
          ^bb0(%arg6: i32):
            "llvm.store"(%arg6, %arg4) <{ordering = 0 : i64}> : (i32, !llvm.ptr) -> ()
            %12 = "llvm.load"(%arg3) <{ordering = 0 : i64}> : (!llvm.ptr) -> i32
            %13 = "llvm.add"(%12, %11) <{overflowFlags = 0 : i32}> : (i32, i32) -> i32
            "llvm.store"(%13, %arg3) <{ordering = 0 : i64}> : (i32, !llvm.ptr) -> ()
            "omp.parallel"(%arg5) <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 1>, reduction_byref = array<i1: false>, reduction_syms = [@reduction]}> ({
            ^bb0(%arg7: !llvm.ptr):
              %14 = "llvm.load"(%arg4) <{ordering = 0 : i64}> : (!llvm.ptr) -> i32
              %15 = "llvm.load"(%arg7) <{ordering = 0 : i64}> : (!llvm.ptr) -> i32
              %16 = "llvm.add"(%14, %15) <{overflowFlags = 0 : i32}> : (i32, i32) -> i32
              "llvm.store"(%16, %arg7) <{ordering = 0 : i64}> : (i32, !llvm.ptr) -> ()
              "omp.terminator"() : () -> ()
            }) : (!llvm.ptr) -> ()
            "omp.yield"() : () -> ()
          }) : (i32, i32, i32) -> ()
        }) : (!llvm.ptr, !llvm.ptr) -> ()
        "omp.terminator"() : () -> ()
      }) : (!llvm.ptr) -> ()
      "omp.terminator"() : () -> ()
    }) : (!llvm.ptr, !llvm.ptr, !llvm.ptr) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
}) {dlti.dl_spec = #dlti.dl_spec<"dlti.alloca_memory_space" = 5 : ui32>, llvm.data_layout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-p7:160:256:256:32-p8:128:128:128:48-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7:8", llvm.target_triple = "amdgcn-amd-amdhsa", omp.is_gpu = true, omp.is_target_device = true} : () -> ()

