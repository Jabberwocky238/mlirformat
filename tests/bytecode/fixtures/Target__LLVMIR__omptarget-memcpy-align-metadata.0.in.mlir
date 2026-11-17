"builtin.module"() ({
  "omp.private"() <{data_sharing_type = #omp<data_sharing_type{type = private}>, sym_name = "_QFEk_private_i32", type = i32}> ({
  }, {
  }, {
  }) : () -> () loc("<stdin>":2:3)
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "_QQmain", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    %2 = "llvm.mlir.constant"() <{value = 1 : i64}> : () -> i64 loc("<stdin>":7:10)
    %3 = "llvm.alloca"(%2) <{elem_type = i32}> {bindc_name = "k"} : (i64) -> !llvm.ptr<5> loc("<stdin>":8:10)
    %4 = "llvm.addrspacecast"(%3) : (!llvm.ptr<5>) -> !llvm.ptr loc("<stdin>":9:10)
    %5 = "llvm.mlir.constant"() <{value = 1 : i64}> : () -> i64 loc("<stdin>":10:10)
    %6 = "llvm.alloca"(%5) <{elem_type = i32}> {bindc_name = "b"} : (i64) -> !llvm.ptr<5> loc("<stdin>":11:10)
    %7 = "llvm.addrspacecast"(%6) : (!llvm.ptr<5>) -> !llvm.ptr loc("<stdin>":12:10)
    %8 = "llvm.mlir.addressof"() <{global_name = @_QFEa}> : () -> !llvm.ptr loc("<stdin>":13:10)
    %9 = "llvm.mlir.addressof"() <{global_name = @_QFECnz}> : () -> !llvm.ptr loc("<stdin>":14:10)
    %10 = "llvm.getelementptr"(%8) <{elem_type = !llvm.struct<(ptr, i64, i32, i8, i8, i8, i8, array<1 x array<3 x i64>>)>, noWrapFlags = 0 : i32, rawConstantIndices = array<i32: 0, 0>}> : (!llvm.ptr) -> !llvm.ptr loc("<stdin>":15:11)
    %11 = "omp.map.info"(%8, %10) <{map_capture_type = #omp<variable_capture_kind(ByRef)>, map_type = #omp<clause_map_flags to|from>, name = "", operandSegmentSizes = array<i32: 1, 1, 0, 0>, partial_map = false, var_ptr_ptr_type = i32, var_ptr_type = !llvm.struct<(ptr, i64, i32, i8, i8, i8, i8, array<1 x array<3 x i64>>)>}> : (!llvm.ptr, !llvm.ptr) -> !llvm.ptr loc("<stdin>":16:11)
    %12 = "omp.map.info"(%8, %11) <{map_capture_type = #omp<variable_capture_kind(ByRef)>, map_type = #omp<clause_map_flags to>, members_index = [[0]], name = "a", operandSegmentSizes = array<i32: 1, 0, 1, 0>, partial_map = false, var_ptr_type = !llvm.struct<(ptr, i64, i32, i8, i8, i8, i8, array<1 x array<3 x i64>>)>}> : (!llvm.ptr, !llvm.ptr) -> !llvm.ptr loc("<stdin>":17:11)
    %13 = "omp.map.info"(%7) <{map_capture_type = #omp<variable_capture_kind(ByRef)>, map_type = #omp<clause_map_flags to|from>, name = "b", operandSegmentSizes = array<i32: 1, 0, 0, 0>, partial_map = false, var_ptr_type = i32}> : (!llvm.ptr) -> !llvm.ptr loc("<stdin>":18:11)
    %14 = "omp.map.info"(%4) <{map_capture_type = #omp<variable_capture_kind(ByCopy)>, map_type = #omp<clause_map_flags implicit>, name = "k", operandSegmentSizes = array<i32: 1, 0, 0, 0>, partial_map = false, var_ptr_type = i32}> : (!llvm.ptr) -> !llvm.ptr loc("<stdin>":19:11)
    %15 = "omp.map.info"(%9) <{map_capture_type = #omp<variable_capture_kind(ByCopy)>, map_type = #omp<clause_map_flags implicit>, name = "nz", operandSegmentSizes = array<i32: 1, 0, 0, 0>, partial_map = false, var_ptr_type = i32}> : (!llvm.ptr) -> !llvm.ptr loc("<stdin>":20:11)
    "omp.target"(%12, %13, %14, %15, %11) <{kernel_type = #omp<kernel_type(spmd)>, operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 5, 0, 0, 0>}> ({
    ^bb0(%arg0: !llvm.ptr loc("<stdin>":22:10), %arg1: !llvm.ptr loc("<stdin>":22:28), %arg2: !llvm.ptr loc("<stdin>":22:46), %arg3: !llvm.ptr loc("<stdin>":22:64), %arg4: !llvm.ptr loc("<stdin>":22:82)):
      %16 = "llvm.mlir.constant"() <{value = 0 : index}> : () -> i64 loc("<stdin>":23:13)
      %17 = "llvm.mlir.constant"() <{value = 13 : i32}> : () -> i32 loc("<stdin>":24:13)
      %18 = "llvm.mlir.constant"() <{value = 1000 : i32}> : () -> i32 loc("<stdin>":25:13)
      %19 = "llvm.mlir.constant"() <{value = 1 : i32}> : () -> i32 loc("<stdin>":26:13)
      "omp.teams"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 0, 0>}> ({
        "omp.parallel"(%arg2) <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 1, 0>, private_syms = [@_QFEk_private_i32]}> ({
        ^bb0(%arg5: !llvm.ptr loc("<stdin>":29:14)):
          %20 = "llvm.mlir.constant"() <{value = 1 : i32}> : () -> i32 loc("<stdin>":30:17)
          %21 = "llvm.alloca"(%20) <{alignment = 8 : i64, elem_type = !llvm.struct<(ptr, i64, i32, i8, i8, i8, i8, array<1 x array<3 x i64>>)>}> : (i32) -> !llvm.ptr<5> loc("<stdin>":31:17)
          %22 = "llvm.addrspacecast"(%21) : (!llvm.ptr<5>) -> !llvm.ptr loc("<stdin>":32:17)
          "omp.distribute"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0>}> ({
            "omp.wsloop"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0>}> ({
              "omp.loop_nest"(%19, %18, %19) <{loop_inclusive}> ({
              ^bb0(%arg6: i32 loc("<stdin>":36:20)):
                "llvm.store"(%arg6, %arg5) <{ordering = 0 : i64}> : (i32, !llvm.ptr) -> () loc("<stdin>":37:17)
                %23 = "llvm.mlir.constant"() <{value = 48 : i32}> : () -> i32 loc("<stdin>":38:23)
                "llvm.intr.memcpy"(%22, %arg0, %23) <{isVolatile = false}> : (!llvm.ptr, !llvm.ptr, i32) -> () loc("<stdin>":39:17)
                "omp.yield"() : () -> () loc("<stdin>":40:17)
              }) : (i32, i32, i32) -> () loc("<stdin>":35:15)
            }) {omp.composite} : () -> () loc("<stdin>":34:13)
          }) {omp.composite} : () -> () loc("<stdin>":33:11)
          "omp.terminator"() : () -> () loc("<stdin>":44:11)
        }) {omp.composite} : (!llvm.ptr) -> () loc("<stdin>":28:9)
        "omp.terminator"() : () -> () loc("<stdin>":46:9)
      }) {omp.combined} : () -> () loc("<stdin>":27:7)
      "omp.terminator"() : () -> () loc("<stdin>":48:7)
    }) {omp.combined} : (!llvm.ptr, !llvm.ptr, !llvm.ptr, !llvm.ptr, !llvm.ptr) -> () loc("<stdin>":21:5)
    "llvm.return"() : () -> () loc("<stdin>":50:5)
  }) : () -> () loc("<stdin>":6:3)
  "llvm.mlir.global"() <{addr_space = 0 : i32, global_type = !llvm.struct<(ptr, i64, i32, i8, i8, i8, i8, array<1 x array<3 x i64>>)>, linkage = #llvm.linkage<internal>, sym_name = "_QFEa", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    %1 = "llvm.mlir.undef"() : () -> !llvm.struct<(ptr, i64, i32, i8, i8, i8, i8, array<1 x array<3 x i64>>)> loc("<stdin>":53:10)
    "llvm.return"(%1) : (!llvm.struct<(ptr, i64, i32, i8, i8, i8, i8, array<1 x array<3 x i64>>)>) -> () loc("<stdin>":54:5)
  }) : () -> () loc("<stdin>":52:3)
  "llvm.mlir.global"() <{addr_space = 0 : i32, constant, global_type = i32, linkage = #llvm.linkage<internal>, sym_name = "_QFECnz", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    %0 = "llvm.mlir.constant"() <{value = 1000 : i32}> : () -> i32 loc("<stdin>":57:10)
    "llvm.return"(%0) : (i32) -> () loc("<stdin>":58:5)
  }) : () -> () loc("<stdin>":56:3)
}) {llvm.data_layout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-p7:160:256:256:32-p8:128:128:128:48-p9:192:256:256:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7:8:9", llvm.target_triple = "amdgcn-amd-amdhsa", omp.is_gpu = true, omp.is_target_device = true} : () -> () loc("<stdin>":1:1)
