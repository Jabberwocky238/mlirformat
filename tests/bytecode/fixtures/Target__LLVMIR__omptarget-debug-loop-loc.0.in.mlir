"builtin.module"() ({
  "omp.private"() <{data_sharing_type = #omp<data_sharing_type{type = private}>, sym_name = "_QFEj_private_i32", type = i32}> ({
  }, {
  }, {
  }) : () -> () loc("<stdin>":2:3)
  "omp.private"() <{data_sharing_type = #omp<data_sharing_type{type = private}>, sym_name = "_QFEi_private_i32", type = i32}> ({
  }, {
  }, {
  }) : () -> () loc("<stdin>":6:3)
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "test", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    %1 = "llvm.mlir.constant"() <{value = 1 : i64}> : () -> i64 loc("<stdin>":11:10)
    %2 = "llvm.alloca"(%1) <{elem_type = i32}> {bindc_name = "j"} : (i64) -> !llvm.ptr<5> loc("<stdin>":12:10)
    %3 = "llvm.addrspacecast"(%2) : (!llvm.ptr<5>) -> !llvm.ptr loc("<stdin>":13:10)
    %4 = "llvm.alloca"(%1) <{elem_type = i32}> {bindc_name = "i"} : (i64) -> !llvm.ptr<5> loc("<stdin>":14:10)
    %5 = "llvm.addrspacecast"(%4) : (!llvm.ptr<5>) -> !llvm.ptr loc("<stdin>":15:10)
    %6 = "llvm.mlir.addressof"() <{global_name = @_QFEarray}> : () -> !llvm.ptr loc("<stdin>":16:10)
    %7 = "omp.map.info"(%5) <{map_capture_type = #omp<variable_capture_kind(ByCopy)>, map_type = #omp<clause_map_flags implicit>, name = "i", operandSegmentSizes = array<i32: 1, 0, 0, 0>, partial_map = false, var_ptr_type = i32}> : (!llvm.ptr) -> !llvm.ptr loc("<stdin>":17:10)
    %8 = "omp.map.info"(%3) <{map_capture_type = #omp<variable_capture_kind(ByCopy)>, map_type = #omp<clause_map_flags implicit>, name = "j", operandSegmentSizes = array<i32: 1, 0, 0, 0>, partial_map = false, var_ptr_type = i32}> : (!llvm.ptr) -> !llvm.ptr loc("<stdin>":18:10)
    %9 = "omp.map.info"(%6) <{map_capture_type = #omp<variable_capture_kind(ByRef)>, map_type = #omp<clause_map_flags to|from|implicit>, name = "array", operandSegmentSizes = array<i32: 1, 0, 0, 0>, partial_map = false, var_ptr_type = !llvm.array<16384 x i32>}> : (!llvm.ptr) -> !llvm.ptr loc("<stdin>":19:10)
    %10 = "omp.map.info"(%5) <{map_capture_type = #omp<variable_capture_kind(ByCopy)>, map_type = #omp<clause_map_flags implicit>, name = "i", operandSegmentSizes = array<i32: 1, 0, 0, 0>, partial_map = false, var_ptr_type = i32}> : (!llvm.ptr) -> !llvm.ptr loc("<stdin>":20:11)
    "omp.target"(%7, %8, %9, %10) <{kernel_type = #omp<kernel_type(spmd)>, operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0>}> ({
    ^bb0(%arg0: !llvm.ptr loc("<stdin>":22:10), %arg1: !llvm.ptr loc("<stdin>":22:28), %arg2: !llvm.ptr loc("<stdin>":22:46), %arg3: !llvm.ptr loc("<stdin>":22:64)):
      %11 = "llvm.mlir.constant"() <{value = 1 : i32}> : () -> i32 loc("<stdin>":23:13)
      %12 = "llvm.mlir.constant"() <{value = 16384 : i32}> : () -> i32 loc("<stdin>":24:13)
      "omp.teams"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 0, 0>}> ({
        "omp.distribute"(%arg3) <{operandSegmentSizes = array<i32: 0, 0, 0, 1>, private_syms = [@_QFEi_private_i32]}> ({
        ^bb0(%arg4: !llvm.ptr loc("<stdin>":27:14)):
          "omp.loop_nest"(%11, %12, %11) <{loop_inclusive}> ({
          ^bb0(%arg5: i32 loc("<stdin>":29:16)):
            "omp.parallel"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0>}> ({
              "omp.wsloop"(%arg1) <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 1, 0, 0>, private_syms = [@_QFEj_private_i32]}> ({
              ^bb0(%arg6: !llvm.ptr loc("<stdin>":32:20)):
                "omp.loop_nest"(%11, %12, %11) <{loop_inclusive}> ({
                ^bb0(%arg7: i32 loc("<stdin>":34:22)):
                  "llvm.store"(%arg7, %arg6) <{ordering = 0 : i64}> : (i32, !llvm.ptr) -> () loc("<stdin>":35:19)
                  "omp.yield"() : () -> () loc("<stdin>":36:19)
                }) : (i32, i32, i32) -> () loc("<stdin>":33:17)
              }) : (!llvm.ptr) -> () loc("<stdin>":31:15)
              "omp.terminator"() : () -> () loc("<stdin>":39:15)
            }) : () -> () loc("<stdin>":30:13)
            "omp.yield"() : () -> () loc("<stdin>":41:13)
          }) : (i32, i32, i32) -> () loc("<stdin>":28:11)
        }) : (!llvm.ptr) -> () loc("<stdin>":26:9)
        "omp.terminator"() : () -> () loc("<stdin>":44:9)
      }) {omp.combined} : () -> () loc("<stdin>":25:7)
      "omp.terminator"() : () -> () loc("<stdin>":46:7)
    }) {omp.combined} : (!llvm.ptr, !llvm.ptr, !llvm.ptr, !llvm.ptr) -> () loc("<stdin>":21:5)
    "llvm.return"() : () -> () loc("<stdin>":48:5)
  }) : () -> () loc("<stdin>":10:3)
  "llvm.mlir.global"() <{addr_space = 0 : i32, global_type = !llvm.array<16384 x i32>, linkage = #llvm.linkage<internal>, sym_name = "_QFEarray", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    %0 = "llvm.mlir.zero"() : () -> !llvm.array<16384 x i32> loc("<stdin>":51:10)
    "llvm.return"(%0) : (!llvm.array<16384 x i32>) -> () loc("<stdin>":52:5)
  }) : () -> () loc("<stdin>":50:3)
}) {dlti.dl_spec = #dlti.dl_spec<"dlti.alloca_memory_space" = 5 : ui32>, llvm.target_triple = "amdgcn-amd-amdhsa", omp.is_target_device = true} : () -> () loc("<stdin>":1:1)
