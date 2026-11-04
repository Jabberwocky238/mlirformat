"builtin.module"() ({
  "omp.private"() <{data_sharing_type = #omp<data_sharing_type{type = private}>, sym_name = "_QFEj_private_i32", type = i32}> ({
  }, {
  }, {
  }) : () -> ()
  "omp.private"() <{data_sharing_type = #omp<data_sharing_type{type = private}>, sym_name = "_QFEi_private_i32", type = i32}> ({
  }, {
  }, {
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "test", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    %1 = "llvm.mlir.constant"() <{value = 1 : i64}> : () -> i64
    %2 = "llvm.alloca"(%1) <{elem_type = i32}> {bindc_name = "j"} : (i64) -> !llvm.ptr<5>
    %3 = "llvm.addrspacecast"(%2) : (!llvm.ptr<5>) -> !llvm.ptr
    %4 = "llvm.mlir.constant"() <{value = 1 : i64}> : () -> i64
    %5 = "llvm.alloca"(%4) <{elem_type = i32}> {bindc_name = "i"} : (i64) -> !llvm.ptr<5>
    %6 = "llvm.addrspacecast"(%5) : (!llvm.ptr<5>) -> !llvm.ptr
    %7 = "llvm.mlir.constant"() <{value = 16383 : index}> : () -> i64
    %8 = "llvm.mlir.constant"() <{value = 0 : index}> : () -> i64
    %9 = "llvm.mlir.constant"() <{value = 1 : index}> : () -> i64
    %10 = "llvm.mlir.constant"() <{value = 16384 : i32}> : () -> i32
    %11 = "llvm.mlir.addressof"() <{global_name = @_QFEarray}> : () -> !llvm.ptr
    %12 = "omp.map.info"(%6) <{map_capture_type = #omp<variable_capture_kind(ByCopy)>, map_type = #omp<clause_map_flags implicit>, name = "i", operandSegmentSizes = array<i32: 1, 0, 0, 0>, partial_map = false, var_type = i32}> : (!llvm.ptr) -> !llvm.ptr
    %13 = "omp.map.info"(%3) <{map_capture_type = #omp<variable_capture_kind(ByCopy)>, map_type = #omp<clause_map_flags implicit>, name = "j", operandSegmentSizes = array<i32: 1, 0, 0, 0>, partial_map = false, var_type = i32}> : (!llvm.ptr) -> !llvm.ptr
    %14 = "omp.map.bounds"(%8, %7, %7, %9, %9) <{operandSegmentSizes = array<i32: 1, 1, 1, 1, 1>, stride_in_bytes = false}> : (i64, i64, i64, i64, i64) -> !omp.map_bounds_ty
    %15 = "omp.map.info"(%11, %14) <{map_capture_type = #omp<variable_capture_kind(ByRef)>, map_type = #omp<clause_map_flags to|from|implicit>, name = "array", operandSegmentSizes = array<i32: 1, 0, 0, 1>, partial_map = false, var_type = !llvm.array<16384 x i32>}> : (!llvm.ptr, !omp.map_bounds_ty) -> !llvm.ptr
    %16 = "omp.map.info"(%6) <{map_capture_type = #omp<variable_capture_kind(ByCopy)>, map_type = #omp<clause_map_flags implicit>, name = "i", operandSegmentSizes = array<i32: 1, 0, 0, 0>, partial_map = false, var_type = i32}> : (!llvm.ptr) -> !llvm.ptr
    "omp.target"(%12, %13, %15, %16) <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 0, 0, 4, 0, 0>}> ({
    ^bb0(%arg0: !llvm.ptr, %arg1: !llvm.ptr, %arg2: !llvm.ptr, %arg3: !llvm.ptr):
      %17 = "llvm.mlir.constant"() <{value = 1 : i32}> : () -> i32
      %18 = "llvm.mlir.constant"() <{value = 16384 : i32}> : () -> i32
      "omp.teams"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 0>}> ({
        "omp.distribute"(%arg3) <{operandSegmentSizes = array<i32: 0, 0, 0, 1>, private_syms = [@_QFEi_private_i32]}> ({
        ^bb0(%arg4: !llvm.ptr):
          "omp.loop_nest"(%17, %18, %17) <{loop_inclusive}> ({
          ^bb0(%arg5: i32):
            "omp.parallel"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0>}> ({
              "omp.wsloop"(%arg1) <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 1, 0, 0>, private_syms = [@_QFEj_private_i32]}> ({
              ^bb0(%arg6: !llvm.ptr):
                "omp.loop_nest"(%17, %18, %17) <{loop_inclusive}> ({
                ^bb0(%arg7: i32):
                  "llvm.store"(%arg7, %arg6) <{ordering = 0 : i64}> : (i32, !llvm.ptr) -> ()
                  "omp.yield"() : () -> ()
                }) : (i32, i32, i32) -> ()
              }) : (!llvm.ptr) -> ()
              "omp.terminator"() : () -> ()
            }) : () -> ()
            "omp.yield"() : () -> ()
          }) : (i32, i32, i32) -> ()
        }) : (!llvm.ptr) -> ()
        "omp.terminator"() : () -> ()
      }) : () -> ()
      "omp.terminator"() : () -> ()
    }) : (!llvm.ptr, !llvm.ptr, !llvm.ptr, !llvm.ptr) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.mlir.global"() <{addr_space = 0 : i32, global_type = !llvm.array<16384 x i32>, linkage = #llvm.linkage<internal>, sym_name = "_QFEarray", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    %0 = "llvm.mlir.zero"() : () -> !llvm.array<16384 x i32>
    "llvm.return"(%0) : (!llvm.array<16384 x i32>) -> ()
  }) : () -> ()
}) {dlti.dl_spec = #dlti.dl_spec<"dlti.alloca_memory_space" = 5 : ui32>, llvm.target_triple = "amdgcn-amd-amdhsa", omp.is_target_device = true} : () -> ()

