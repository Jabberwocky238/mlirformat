"builtin.module"() ({
  "omp.private"() <{data_sharing_type = #omp<data_sharing_type{type = private}>, sym_name = "privatizer", type = i32}> ({
  }, {
  }, {
  }) : () -> () loc("<stdin>":2:3)
  "omp.declare_reduction"() <{sym_name = "reduction", type = i32}> ({
  }, {
  ^bb0(%arg10: i32 loc("<stdin>":8:8)):
    %18 = "llvm.mlir.constant"() <{value = 0 : i32}> : () -> i32 loc("<stdin>":9:11)
    "omp.yield"(%18) : (i32) -> () loc("<stdin>":10:5)
  }, {
  ^bb0(%arg8: i32 loc("<stdin>":12:8), %arg9: i32 loc("<stdin>":12:20)):
    %17 = "llvm.add"(%arg8, %arg9) <{overflowFlags = 0 : i32}> : (i32, i32) -> i32 loc("<stdin>":13:11)
    "omp.yield"(%17) : (i32) -> () loc("<stdin>":14:5)
  }, {
  }, {
  }, {
  }) : () -> () loc("<stdin>":6:3)
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "main", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    %0 = "llvm.mlir.constant"() <{value = 1 : i64}> : () -> i64 loc("<stdin>":20:10)
    %1 = "llvm.alloca"(%0) <{elem_type = i32}> {bindc_name = "x"} : (i64) -> !llvm.ptr<5> loc("<stdin>":21:10)
    %2 = "llvm.addrspacecast"(%1) : (!llvm.ptr<5>) -> !llvm.ptr loc("<stdin>":22:10)
    %3 = "llvm.alloca"(%0) <{elem_type = i32}> {bindc_name = "y"} : (i64) -> !llvm.ptr<5> loc("<stdin>":23:10)
    %4 = "llvm.addrspacecast"(%3) : (!llvm.ptr<5>) -> !llvm.ptr loc("<stdin>":24:10)
    %5 = "llvm.alloca"(%0) <{elem_type = i32}> {bindc_name = "z"} : (i64) -> !llvm.ptr<5> loc("<stdin>":25:10)
    %6 = "llvm.addrspacecast"(%5) : (!llvm.ptr<5>) -> !llvm.ptr loc("<stdin>":26:10)
    %7 = "omp.map.info"(%2) <{map_capture_type = #omp<variable_capture_kind(ByRef)>, map_type = #omp<clause_map_flags to|from>, name = "x", operandSegmentSizes = array<i32: 1, 0, 0, 0>, partial_map = false, var_ptr_type = i32}> : (!llvm.ptr) -> !llvm.ptr loc("<stdin>":27:10)
    %8 = "omp.map.info"(%4) <{map_capture_type = #omp<variable_capture_kind(ByRef)>, map_type = #omp<clause_map_flags to|from>, name = "y", operandSegmentSizes = array<i32: 1, 0, 0, 0>, partial_map = false, var_ptr_type = i32}> : (!llvm.ptr) -> !llvm.ptr loc("<stdin>":28:10)
    %9 = "omp.map.info"(%6) <{map_capture_type = #omp<variable_capture_kind(ByRef)>, map_type = #omp<clause_map_flags to|from>, name = "z", operandSegmentSizes = array<i32: 1, 0, 0, 0>, partial_map = false, var_ptr_type = i32}> : (!llvm.ptr) -> !llvm.ptr loc("<stdin>":29:10)
    "omp.target"(%7, %8, %9) <{kernel_type = #omp<kernel_type(generic)>, operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3, 0, 0, 0>}> ({
    ^bb0(%arg0: !llvm.ptr loc("<stdin>":31:10), %arg1: !llvm.ptr loc("<stdin>":31:28), %arg2: !llvm.ptr loc("<stdin>":31:46)):
      %10 = "llvm.mlir.constant"() <{value = 10000 : i32}> : () -> i32 loc("<stdin>":32:13)
      %11 = "llvm.mlir.constant"() <{value = 1 : i32}> : () -> i32 loc("<stdin>":33:13)
      "omp.teams"(%arg0) <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 1, 0>, reduction_byref = array<i1: false>, reduction_syms = [@reduction]}> ({
      ^bb0(%arg3: !llvm.ptr loc("<stdin>":35:12)):
        "omp.distribute"(%arg1, %arg2) <{operandSegmentSizes = array<i32: 0, 0, 0, 2>, private_syms = [@privatizer, @privatizer]}> ({
        ^bb0(%arg4: !llvm.ptr loc("<stdin>":37:14), %arg5: !llvm.ptr loc("<stdin>":37:32)):
          "omp.loop_nest"(%11, %10, %11) <{loop_inclusive}> ({
          ^bb0(%arg6: i32 loc("<stdin>":39:16)):
            "llvm.store"(%arg6, %arg4) <{ordering = 0 : i64}> : (i32, !llvm.ptr) -> () loc("<stdin>":40:13)
            %12 = "llvm.load"(%arg3) <{ordering = 0 : i64}> : (!llvm.ptr) -> i32 loc("<stdin>":41:19)
            %13 = "llvm.add"(%12, %11) <{overflowFlags = 0 : i32}> : (i32, i32) -> i32 loc("<stdin>":42:19)
            "llvm.store"(%13, %arg3) <{ordering = 0 : i64}> : (i32, !llvm.ptr) -> () loc("<stdin>":43:13)
            "omp.parallel"(%arg5) <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 1>, reduction_byref = array<i1: false>, reduction_syms = [@reduction]}> ({
            ^bb0(%arg7: !llvm.ptr loc("<stdin>":45:18)):
              %14 = "llvm.load"(%arg4) <{ordering = 0 : i64}> : (!llvm.ptr) -> i32 loc("<stdin>":46:21)
              %15 = "llvm.load"(%arg7) <{ordering = 0 : i64}> : (!llvm.ptr) -> i32 loc("<stdin>":47:21)
              %16 = "llvm.add"(%14, %15) <{overflowFlags = 0 : i32}> : (i32, i32) -> i32 loc("<stdin>":48:21)
              "llvm.store"(%16, %arg7) <{ordering = 0 : i64}> : (i32, !llvm.ptr) -> () loc("<stdin>":49:15)
              "omp.terminator"() : () -> () loc("<stdin>":50:15)
            }) : (!llvm.ptr) -> () loc("<stdin>":44:13)
            "omp.yield"() : () -> () loc("<stdin>":52:13)
          }) : (i32, i32, i32) -> () loc("<stdin>":38:11)
        }) : (!llvm.ptr, !llvm.ptr) -> () loc("<stdin>":36:9)
        "omp.terminator"() : () -> () loc("<stdin>":55:9)
      }) : (!llvm.ptr) -> () loc("<stdin>":34:7)
      "omp.terminator"() : () -> () loc("<stdin>":57:7)
    }) : (!llvm.ptr, !llvm.ptr, !llvm.ptr) -> () loc("<stdin>":30:5)
    "llvm.return"() : () -> () loc("<stdin>":59:5)
  }) : () -> () loc("<stdin>":19:3)
}) {dlti.dl_spec = #dlti.dl_spec<"dlti.alloca_memory_space" = 5 : ui32>, llvm.data_layout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-p7:160:256:256:32-p8:128:128:128:48-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7:8", llvm.target_triple = "amdgcn-amd-amdhsa", omp.is_gpu = true, omp.is_target_device = true} : () -> () loc("<stdin>":1:1)
