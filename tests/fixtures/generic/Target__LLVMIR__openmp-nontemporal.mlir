"builtin.module"() ({
^bb0:
}) : () -> ()

// -----
"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "simd_nontemporal", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    %0 = "llvm.mlir.constant"() <{value = 10 : i64}> : () -> i64
    %1 = "llvm.mlir.constant"() <{value = 1 : i64}> : () -> i64
    %2 = "llvm.alloca"(%1) <{elem_type = i64}> : (i64) -> !llvm.ptr
    %3 = "llvm.alloca"(%1) <{elem_type = i64}> : (i64) -> !llvm.ptr
    "omp.simd"(%2, %3) <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 2, 0, 0>}> ({
      "omp.loop_nest"(%1, %0, %1) <{loop_inclusive}> ({
      ^bb0(%arg0: i64):
        %4 = "llvm.load"(%3) <{nontemporal, ordering = 0 : i64}> : (!llvm.ptr) -> i64
        "llvm.store"(%4, %2) <{nontemporal, ordering = 0 : i64}> : (i64, !llvm.ptr) -> ()
        "omp.yield"() : () -> ()
      }) : (i64, i64, i64) -> ()
    }) : (!llvm.ptr, !llvm.ptr) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, arg_attrs = [{fir.bindc_name = "n"}, {fir.bindc_name = "a"}], function_type = !llvm.func<void (ptr, ptr)>, linkage = #llvm.linkage<external>, sym_name = "_QPtest", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: !llvm.ptr, %arg1: !llvm.ptr):
    %0 = "llvm.mlir.constant"() <{value = 1 : i32}> : () -> i32
    %1 = "llvm.alloca"(%0) <{alignment = 8 : i64, elem_type = !llvm.struct<(ptr, i64, i32, i8, i8, i8, i8, array<1 x array<3 x i64>>)>}> : (i32) -> !llvm.ptr
    %2 = "llvm.alloca"(%0) <{alignment = 8 : i64, elem_type = !llvm.struct<(ptr, i64, i32, i8, i8, i8, i8, array<1 x array<3 x i64>>)>}> : (i32) -> !llvm.ptr
    %3 = "llvm.mlir.constant"() <{value = 1 : i64}> : () -> i64
    %4 = "llvm.alloca"(%3) <{elem_type = i32}> {bindc_name = "i", pinned} : (i64) -> !llvm.ptr
    %5 = "llvm.load"(%arg0) <{ordering = 0 : i64}> : (!llvm.ptr) -> i32
    "omp.simd"(%arg1) <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 1, 0, 0>}> ({
      "omp.loop_nest"(%0, %5, %0) <{loop_inclusive}> ({
      ^bb0(%arg2: i32):
        "llvm.store"(%arg2, %4) <{ordering = 0 : i64}> : (i32, !llvm.ptr) -> ()
        %6 = "llvm.mlir.constant"() <{value = 48 : i32}> : () -> i32
        "llvm.intr.memcpy"(%2, %arg1, %6) <{isVolatile = false}> : (!llvm.ptr, !llvm.ptr, i32) -> ()
        %7 = "llvm.load"(%4) <{ordering = 0 : i64}> : (!llvm.ptr) -> i32
        %8 = "llvm.sext"(%7) : (i32) -> i64
        %9 = "llvm.getelementptr"(%2) <{elem_type = !llvm.struct<(ptr, i64, i32, i8, i8, i8, i8, array<1 x array<3 x i64>>)>, noWrapFlags = 0 : i32, rawConstantIndices = array<i32: 0, 0>}> : (!llvm.ptr) -> !llvm.ptr
        %10 = "llvm.load"(%9) <{ordering = 0 : i64}> : (!llvm.ptr) -> !llvm.ptr
        %11 = "llvm.mlir.constant"() <{value = 0 : index}> : () -> i64
        %12 = "llvm.getelementptr"(%2, %11) <{elem_type = !llvm.struct<(ptr, i64, i32, i8, i8, i8, i8, array<1 x array<3 x i64>>)>, noWrapFlags = 0 : i32, rawConstantIndices = array<i32: 0, 7, -2147483648, 0>}> : (!llvm.ptr, i64) -> !llvm.ptr
        %13 = "llvm.load"(%12) <{ordering = 0 : i64}> : (!llvm.ptr) -> i64
        %14 = "llvm.getelementptr"(%2, %11) <{elem_type = !llvm.struct<(ptr, i64, i32, i8, i8, i8, i8, array<1 x array<3 x i64>>)>, noWrapFlags = 0 : i32, rawConstantIndices = array<i32: 0, 7, -2147483648, 1>}> : (!llvm.ptr, i64) -> !llvm.ptr
        %15 = "llvm.load"(%14) <{ordering = 0 : i64}> : (!llvm.ptr) -> i64
        %16 = "llvm.getelementptr"(%2, %11) <{elem_type = !llvm.struct<(ptr, i64, i32, i8, i8, i8, i8, array<1 x array<3 x i64>>)>, noWrapFlags = 0 : i32, rawConstantIndices = array<i32: 0, 7, -2147483648, 2>}> : (!llvm.ptr, i64) -> !llvm.ptr
        %17 = "llvm.load"(%16) <{ordering = 0 : i64}> : (!llvm.ptr) -> i64
        %18 = "llvm.mlir.constant"() <{value = 0 : i64}> : () -> i64
        %19 = "llvm.sub"(%8, %13) <{overflowFlags = 1 : i32}> : (i64, i64) -> i64
        %20 = "llvm.mul"(%19, %3) <{overflowFlags = 1 : i32}> : (i64, i64) -> i64
        %21 = "llvm.mul"(%20, %3) <{overflowFlags = 1 : i32}> : (i64, i64) -> i64
        %22 = "llvm.add"(%21, %18) <{overflowFlags = 1 : i32}> : (i64, i64) -> i64
        %23 = "llvm.mul"(%3, %15) <{overflowFlags = 1 : i32}> : (i64, i64) -> i64
        %24 = "llvm.getelementptr"(%10, %22) <{elem_type = f32, noWrapFlags = 0 : i32, rawConstantIndices = array<i32: -2147483648>}> : (!llvm.ptr, i64) -> !llvm.ptr
        %25 = "llvm.load"(%24) <{nontemporal, ordering = 0 : i64}> : (!llvm.ptr) -> f32
        %26 = "llvm.mlir.constant"() <{value = 2.000000e+01 : f32}> : () -> f32
        %27 = "llvm.fadd"(%25, %26) <{fastmathFlags = #llvm.fastmath<contract>}> : (f32, f32) -> f32
        %28 = "llvm.mlir.constant"() <{value = 48 : i32}> : () -> i32
        "llvm.intr.memcpy"(%1, %arg1, %28) <{isVolatile = false}> : (!llvm.ptr, !llvm.ptr, i32) -> ()
        %29 = "llvm.load"(%4) <{ordering = 0 : i64}> : (!llvm.ptr) -> i32
        %30 = "llvm.sext"(%29) : (i32) -> i64
        %31 = "llvm.getelementptr"(%1) <{elem_type = !llvm.struct<(ptr, i64, i32, i8, i8, i8, i8, array<1 x array<3 x i64>>)>, noWrapFlags = 0 : i32, rawConstantIndices = array<i32: 0, 0>}> : (!llvm.ptr) -> !llvm.ptr
        %32 = "llvm.load"(%31) <{ordering = 0 : i64}> : (!llvm.ptr) -> !llvm.ptr
        %33 = "llvm.mlir.constant"() <{value = 0 : index}> : () -> i64
        %34 = "llvm.getelementptr"(%1, %33) <{elem_type = !llvm.struct<(ptr, i64, i32, i8, i8, i8, i8, array<1 x array<3 x i64>>)>, noWrapFlags = 0 : i32, rawConstantIndices = array<i32: 0, 7, -2147483648, 0>}> : (!llvm.ptr, i64) -> !llvm.ptr
        %35 = "llvm.load"(%34) <{ordering = 0 : i64}> : (!llvm.ptr) -> i64
        %36 = "llvm.getelementptr"(%1, %33) <{elem_type = !llvm.struct<(ptr, i64, i32, i8, i8, i8, i8, array<1 x array<3 x i64>>)>, noWrapFlags = 0 : i32, rawConstantIndices = array<i32: 0, 7, -2147483648, 1>}> : (!llvm.ptr, i64) -> !llvm.ptr
        %37 = "llvm.load"(%36) <{ordering = 0 : i64}> : (!llvm.ptr) -> i64
        %38 = "llvm.getelementptr"(%1, %33) <{elem_type = !llvm.struct<(ptr, i64, i32, i8, i8, i8, i8, array<1 x array<3 x i64>>)>, noWrapFlags = 0 : i32, rawConstantIndices = array<i32: 0, 7, -2147483648, 2>}> : (!llvm.ptr, i64) -> !llvm.ptr
        %39 = "llvm.load"(%38) <{ordering = 0 : i64}> : (!llvm.ptr) -> i64
        %40 = "llvm.sub"(%30, %35) <{overflowFlags = 1 : i32}> : (i64, i64) -> i64
        %41 = "llvm.mul"(%40, %3) <{overflowFlags = 1 : i32}> : (i64, i64) -> i64
        %42 = "llvm.mul"(%41, %3) <{overflowFlags = 1 : i32}> : (i64, i64) -> i64
        %43 = "llvm.add"(%42, %18) <{overflowFlags = 1 : i32}> : (i64, i64) -> i64
        %44 = "llvm.mul"(%3, %37) <{overflowFlags = 1 : i32}> : (i64, i64) -> i64
        %45 = "llvm.getelementptr"(%32, %43) <{elem_type = f32, noWrapFlags = 0 : i32, rawConstantIndices = array<i32: -2147483648>}> : (!llvm.ptr, i64) -> !llvm.ptr
        "llvm.store"(%27, %45) <{nontemporal, ordering = 0 : i64}> : (f32, !llvm.ptr) -> ()
        "omp.yield"() : () -> ()
      }) : (i32, i32, i32) -> ()
    }) : (!llvm.ptr) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
^bb0:
}) : () -> ()

