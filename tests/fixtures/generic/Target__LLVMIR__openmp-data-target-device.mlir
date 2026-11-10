"builtin.module"() ({
  "llvm.mlir.global"() <{addr_space = 4 : i32, constant, global_type = i32, linkage = #llvm.linkage<weak_odr>, sym_name = "__oclc_ABI_version", unnamed_addr = 1 : i64, value = 400 : i32, visibility_ = 1 : i64}> ({
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "_QQmain", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    %1 = "llvm.mlir.constant"() <{value = 99 : index}> : () -> i64
    %2 = "llvm.mlir.constant"() <{value = 0 : index}> : () -> i64
    %3 = "llvm.mlir.constant"() <{value = 1 : index}> : () -> i64
    %4 = "llvm.mlir.constant"() <{value = 100 : index}> : () -> i64
    %5 = "llvm.mlir.constant"() <{value = 1 : i64}> : () -> i64
    %6 = "llvm.alloca"(%5) <{elem_type = i32}> {bindc_name = "array_length"} : (i64) -> !llvm.ptr<5>
    %7 = "llvm.addrspacecast"(%6) : (!llvm.ptr<5>) -> !llvm.ptr
    %8 = "llvm.mlir.constant"() <{value = 1 : i64}> : () -> i64
    %9 = "llvm.alloca"(%8) <{elem_type = i32}> {bindc_name = "index_"} : (i64) -> !llvm.ptr<5>
    %10 = "llvm.addrspacecast"(%9) : (!llvm.ptr<5>) -> !llvm.ptr
    %11 = "llvm.mlir.addressof"() <{global_name = @_QFEint_array}> : () -> !llvm.ptr
    %12 = "omp.map.bounds"(%2, %1, %4, %3, %3) <{operandSegmentSizes = array<i32: 1, 1, 1, 1, 1>, stride_in_bytes = false}> : (i64, i64, i64, i64, i64) -> !omp.map_bounds_ty
    %13 = "omp.map.info"(%11, %12) <{map_capture_type = #omp<variable_capture_kind(ByRef)>, map_type = #omp<clause_map_flags from>, name = "int_array", operandSegmentSizes = array<i32: 1, 0, 0, 1>, partial_map = false, var_ptr_type = !llvm.array<100 x i32>}> : (!llvm.ptr, !omp.map_bounds_ty) -> !llvm.ptr
    "omp.target_data"(%13) <{operandSegmentSizes = array<i32: 0, 0, 1, 0, 0, 0>}> ({
      %14 = "omp.map.info"(%11, %12) <{map_capture_type = #omp<variable_capture_kind(ByRef)>, map_type = #omp<clause_map_flags from>, name = "int_array", operandSegmentSizes = array<i32: 1, 0, 0, 1>, partial_map = false, var_ptr_type = !llvm.array<100 x i32>}> : (!llvm.ptr, !omp.map_bounds_ty) -> !llvm.ptr
      %15 = "omp.map.info"(%10) <{map_capture_type = #omp<variable_capture_kind(ByCopy)>, map_type = #omp<clause_map_flags implicit>, name = "index_", operandSegmentSizes = array<i32: 1, 0, 0, 0>, partial_map = false, var_ptr_type = i32}> : (!llvm.ptr) -> !llvm.ptr
      %16 = "llvm.mlir.constant"() <{value = 100 : i32}> : () -> i32
      %17 = "llvm.mlir.constant"() <{value = 1 : i32}> : () -> i32
      "omp.target"(%16, %17, %14, %15) <{kernel_type = #omp<kernel_type(spmd)>, operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0, 2, 0, 0, 0>}> ({
      ^bb0(%arg0: i32, %arg1: i32, %arg2: !llvm.ptr, %arg3: !llvm.ptr):
        %18 = "llvm.mlir.constant"() <{value = 100 : index}> : () -> i64
        "omp.parallel"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0>}> ({
          %19 = "llvm.mlir.constant"() <{value = 1 : i64}> : () -> i64
          %20 = "llvm.alloca"(%19) <{elem_type = i32}> {pinned} : (i64) -> !llvm.ptr<5>
          %21 = "llvm.addrspacecast"(%20) : (!llvm.ptr<5>) -> !llvm.ptr
          "omp.wsloop"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0>}> ({
            "omp.loop_nest"(%arg1, %arg0, %arg1) <{loop_inclusive}> ({
            ^bb0(%arg4: i32):
              "llvm.store"(%arg4, %21) <{ordering = 0 : i64}> : (i32, !llvm.ptr) -> ()
              %22 = "llvm.load"(%21) <{ordering = 0 : i64}> : (!llvm.ptr) -> i32
              %23 = "llvm.sext"(%22) : (i32) -> i64
              %24 = "llvm.mlir.constant"() <{value = 1 : i64}> : () -> i64
              %25 = "llvm.mlir.constant"() <{value = 0 : i64}> : () -> i64
              %26 = "llvm.sub"(%23, %24) <{overflowFlags = 1 : i32}> : (i64, i64) -> i64
              %27 = "llvm.mul"(%26, %24) <{overflowFlags = 1 : i32}> : (i64, i64) -> i64
              %28 = "llvm.mul"(%27, %24) <{overflowFlags = 1 : i32}> : (i64, i64) -> i64
              %29 = "llvm.add"(%28, %25) <{overflowFlags = 1 : i32}> : (i64, i64) -> i64
              %30 = "llvm.mul"(%24, %18) <{overflowFlags = 1 : i32}> : (i64, i64) -> i64
              %31 = "llvm.getelementptr"(%arg2, %29) <{elem_type = i32, noWrapFlags = 0 : i32, rawConstantIndices = array<i32: -2147483648>}> : (!llvm.ptr, i64) -> !llvm.ptr
              "llvm.store"(%22, %31) <{ordering = 0 : i64}> : (i32, !llvm.ptr) -> ()
              "omp.yield"() : () -> ()
            }) : (i32, i32, i32) -> ()
          }) : () -> ()
          "omp.terminator"() : () -> ()
        }) {omp.combined} : () -> ()
        "omp.terminator"() : () -> ()
      }) {omp.combined} : (i32, i32, !llvm.ptr, !llvm.ptr) -> ()
      "omp.terminator"() : () -> ()
    }) : (!llvm.ptr) -> ()
    "llvm.return"() : () -> ()
  }) {fir.bindc_name = "main", omp.declare_target = #omp.declaretarget<device_type = (host), capture_clause = (to)>} : () -> ()
  "llvm.mlir.global"() <{addr_space = 0 : i32, global_type = !llvm.array<100 x i32>, linkage = #llvm.linkage<internal>, sym_name = "_QFEint_array", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    %0 = "llvm.mlir.zero"() : () -> !llvm.array<100 x i32>
    "llvm.return"(%0) : (!llvm.array<100 x i32>) -> ()
  }) : () -> ()
}) {omp.target_triples = ["amdgcn-amd-amdhsa"]} : () -> ()

