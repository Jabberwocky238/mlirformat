"builtin.module"() ({
  "omp.private"() <{data_sharing_type = #omp<data_sharing_type{type = private}>, sym_name = "_QFEk_private_i32", type = i32}> ({
  }, {
  }, {
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "_QQmain", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    %2 = "llvm.mlir.constant"() <{value = 1 : i32}> : () -> i32
    %3 = "llvm.alloca"(%2) <{alignment = 8 : i64, elem_type = !llvm.struct<(ptr, i64, i32, i8, i8, i8, i8, array<1 x array<3 x i64>>)>}> : (i32) -> !llvm.ptr<5>
    %4 = "llvm.addrspacecast"(%3) : (!llvm.ptr<5>) -> !llvm.ptr
    %5 = "llvm.mlir.constant"() <{value = 1 : i64}> : () -> i64
    %6 = "llvm.alloca"(%5) <{elem_type = i32}> {bindc_name = "k"} : (i64) -> !llvm.ptr<5>
    %7 = "llvm.addrspacecast"(%6) : (!llvm.ptr<5>) -> !llvm.ptr
    %8 = "llvm.mlir.constant"() <{value = 1 : i64}> : () -> i64
    %9 = "llvm.alloca"(%8) <{elem_type = i32}> {bindc_name = "b"} : (i64) -> !llvm.ptr<5>
    %10 = "llvm.addrspacecast"(%9) : (!llvm.ptr<5>) -> !llvm.ptr
    %11 = "llvm.mlir.constant"() <{value = 1 : index}> : () -> i64
    %12 = "llvm.mlir.constant"() <{value = 0 : index}> : () -> i64
    %13 = "llvm.mlir.addressof"() <{global_name = @_QFEa}> : () -> !llvm.ptr
    %14 = "llvm.mlir.addressof"() <{global_name = @_QFECnz}> : () -> !llvm.ptr
    %15 = "llvm.getelementptr"(%4, %12) <{elem_type = !llvm.struct<(ptr, i64, i32, i8, i8, i8, i8, array<1 x array<3 x i64>>)>, noWrapFlags = 0 : i32, rawConstantIndices = array<i32: 0, 7, -2147483648, 0>}> : (!llvm.ptr, i64) -> !llvm.ptr
    %16 = "llvm.load"(%15) <{ordering = 0 : i64}> : (!llvm.ptr) -> i64
    %17 = "llvm.getelementptr"(%4, %12) <{elem_type = !llvm.struct<(ptr, i64, i32, i8, i8, i8, i8, array<1 x array<3 x i64>>)>, noWrapFlags = 0 : i32, rawConstantIndices = array<i32: 0, 7, -2147483648, 1>}> : (!llvm.ptr, i64) -> !llvm.ptr
    %18 = "llvm.load"(%17) <{ordering = 0 : i64}> : (!llvm.ptr) -> i64
    %19 = "llvm.getelementptr"(%4, %12) <{elem_type = !llvm.struct<(ptr, i64, i32, i8, i8, i8, i8, array<1 x array<3 x i64>>)>, noWrapFlags = 0 : i32, rawConstantIndices = array<i32: 0, 7, -2147483648, 2>}> : (!llvm.ptr, i64) -> !llvm.ptr
    %20 = "llvm.load"(%19) <{ordering = 0 : i64}> : (!llvm.ptr) -> i64
    %21 = "llvm.sub"(%18, %11) <{overflowFlags = 0 : i32}> : (i64, i64) -> i64
    %22 = "omp.map.bounds"(%12, %21, %18, %20, %16) <{operandSegmentSizes = array<i32: 1, 1, 1, 1, 1>, stride_in_bytes = true}> : (i64, i64, i64, i64, i64) -> !omp.map_bounds_ty
    %23 = "llvm.getelementptr"(%13) <{elem_type = !llvm.struct<(ptr, i64, i32, i8, i8, i8, i8, array<1 x array<3 x i64>>)>, noWrapFlags = 0 : i32, rawConstantIndices = array<i32: 0, 0>}> : (!llvm.ptr) -> !llvm.ptr
    %24 = "omp.map.info"(%13, %23, %22) <{map_capture_type = #omp<variable_capture_kind(ByRef)>, map_type = #omp<clause_map_flags to|from>, name = "", operandSegmentSizes = array<i32: 1, 1, 0, 1>, partial_map = false, var_type = i32}> : (!llvm.ptr, !llvm.ptr, !omp.map_bounds_ty) -> !llvm.ptr
    %25 = "omp.map.info"(%13, %24) <{map_capture_type = #omp<variable_capture_kind(ByRef)>, map_type = #omp<clause_map_flags to>, members_index = [[0]], name = "a", operandSegmentSizes = array<i32: 1, 0, 1, 0>, partial_map = false, var_type = !llvm.struct<(ptr, i64, i32, i8, i8, i8, i8, array<1 x array<3 x i64>>)>}> : (!llvm.ptr, !llvm.ptr) -> !llvm.ptr
    %26 = "omp.map.info"(%10) <{map_capture_type = #omp<variable_capture_kind(ByRef)>, map_type = #omp<clause_map_flags to|from>, name = "b", operandSegmentSizes = array<i32: 1, 0, 0, 0>, partial_map = false, var_type = i32}> : (!llvm.ptr) -> !llvm.ptr
    %27 = "omp.map.info"(%7) <{map_capture_type = #omp<variable_capture_kind(ByCopy)>, map_type = #omp<clause_map_flags implicit>, name = "k", operandSegmentSizes = array<i32: 1, 0, 0, 0>, partial_map = false, var_type = i32}> : (!llvm.ptr) -> !llvm.ptr
    %28 = "omp.map.info"(%14) <{map_capture_type = #omp<variable_capture_kind(ByCopy)>, map_type = #omp<clause_map_flags implicit>, name = "nz", operandSegmentSizes = array<i32: 1, 0, 0, 0>, partial_map = false, var_type = i32}> : (!llvm.ptr) -> !llvm.ptr
    "omp.target"(%25, %26, %27, %28, %24) <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 0, 0, 5, 0, 0>}> ({
    ^bb0(%arg0: !llvm.ptr, %arg1: !llvm.ptr, %arg2: !llvm.ptr, %arg3: !llvm.ptr, %arg4: !llvm.ptr):
      %29 = "llvm.mlir.constant"() <{value = 0 : index}> : () -> i64
      %30 = "llvm.mlir.constant"() <{value = 13 : i32}> : () -> i32
      %31 = "llvm.mlir.constant"() <{value = 1000 : i32}> : () -> i32
      %32 = "llvm.mlir.constant"() <{value = 1 : i32}> : () -> i32
      "omp.teams"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 0>}> ({
        "omp.parallel"(%arg2) <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 1, 0>, private_syms = [@_QFEk_private_i32]}> ({
        ^bb0(%arg5: !llvm.ptr):
          %33 = "llvm.mlir.constant"() <{value = 1 : i32}> : () -> i32
          %34 = "llvm.alloca"(%33) <{alignment = 8 : i64, elem_type = !llvm.struct<(ptr, i64, i32, i8, i8, i8, i8, array<1 x array<3 x i64>>)>}> : (i32) -> !llvm.ptr<5>
          %35 = "llvm.addrspacecast"(%34) : (!llvm.ptr<5>) -> !llvm.ptr
          "omp.distribute"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0>}> ({
            "omp.wsloop"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0>}> ({
              "omp.loop_nest"(%32, %31, %32) <{loop_inclusive}> ({
              ^bb0(%arg6: i32):
                "llvm.store"(%arg6, %arg5) <{ordering = 0 : i64}> : (i32, !llvm.ptr) -> ()
                %36 = "llvm.mlir.constant"() <{value = 48 : i32}> : () -> i32
                "llvm.intr.memcpy"(%35, %arg0, %36) <{isVolatile = false}> : (!llvm.ptr, !llvm.ptr, i32) -> ()
                "omp.yield"() : () -> ()
              }) : (i32, i32, i32) -> ()
            }) {omp.composite} : () -> ()
          }) {omp.composite} : () -> ()
          "omp.terminator"() : () -> ()
        }) {omp.composite} : (!llvm.ptr) -> ()
        "omp.terminator"() : () -> ()
      }) : () -> ()
      "omp.terminator"() : () -> ()
    }) : (!llvm.ptr, !llvm.ptr, !llvm.ptr, !llvm.ptr, !llvm.ptr) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.mlir.global"() <{addr_space = 0 : i32, global_type = !llvm.struct<(ptr, i64, i32, i8, i8, i8, i8, array<1 x array<3 x i64>>)>, linkage = #llvm.linkage<internal>, sym_name = "_QFEa", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    %1 = "llvm.mlir.undef"() : () -> !llvm.struct<(ptr, i64, i32, i8, i8, i8, i8, array<1 x array<3 x i64>>)>
    "llvm.return"(%1) : (!llvm.struct<(ptr, i64, i32, i8, i8, i8, i8, array<1 x array<3 x i64>>)>) -> ()
  }) : () -> ()
  "llvm.mlir.global"() <{addr_space = 0 : i32, constant, global_type = i32, linkage = #llvm.linkage<internal>, sym_name = "_QFECnz", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    %0 = "llvm.mlir.constant"() <{value = 1000 : i32}> : () -> i32
    "llvm.return"(%0) : (i32) -> ()
  }) : () -> ()
}) {llvm.data_layout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-p7:160:256:256:32-p8:128:128:128:48-p9:192:256:256:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7:8:9", llvm.target_triple = "amdgcn-amd-amdhsa", omp.is_gpu = true, omp.is_target_device = true} : () -> ()

