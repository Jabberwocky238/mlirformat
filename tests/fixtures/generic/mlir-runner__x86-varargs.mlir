"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<i32 ()>, linkage = #llvm.linkage<external>, sym_name = "caller", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    %27 = "llvm.mlir.constant"() <{value = 3 : i32}> : () -> i32
    %28 = "llvm.mlir.constant"() <{value = 2 : i32}> : () -> i32
    %29 = "llvm.mlir.constant"() <{value = 1 : i32}> : () -> i32
    %30 = "llvm.call"(%29, %28, %27) <{CConv = #llvm.cconv<ccc>, TailCallKind = #llvm.tailcallkind<none>, callee = @foo, fastmathFlags = #llvm.fastmath<none>, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 3, 0>, var_callee_type = !llvm.func<i32 (i32, ...)>}> : (i32, i32, i32) -> i32
    "llvm.return"(%30) : (i32) -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<i32 (i32, ...)>, linkage = #llvm.linkage<external>, sym_name = "foo", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: i32):
    %0 = "llvm.mlir.constant"() <{value = 8 : i64}> : () -> i64
    %1 = "llvm.mlir.constant"() <{value = 2 : i32}> : () -> i32
    %2 = "llvm.mlir.constant"() <{value = 0 : i64}> : () -> i64
    %3 = "llvm.mlir.constant"() <{value = 0 : i64}> : () -> i64
    %4 = "llvm.mlir.constant"() <{value = 8 : i32}> : () -> i32
    %5 = "llvm.mlir.constant"() <{value = 3 : i32}> : () -> i32
    %6 = "llvm.mlir.constant"() <{value = 0 : i64}> : () -> i64
    %7 = "llvm.mlir.constant"() <{value = 0 : i64}> : () -> i64
    %8 = "llvm.mlir.constant"() <{value = 41 : i32}> : () -> i32
    %9 = "llvm.mlir.constant"() <{value = 0 : i32}> : () -> i32
    %10 = "llvm.mlir.constant"() <{value = 0 : i64}> : () -> i64
    %11 = "llvm.mlir.constant"() <{value = 0 : i64}> : () -> i64
    %12 = "llvm.mlir.constant"() <{value = 1 : i32}> : () -> i32
    %13 = "llvm.alloca"(%12) <{alignment = 8 : i64, elem_type = !llvm.array<1 x struct<"struct.va_list", (i32, i32, ptr, ptr)>>}> : (i32) -> !llvm.ptr
    "llvm.intr.vastart"(%13) : (!llvm.ptr) -> ()
    %14 = "llvm.getelementptr"(%13, %11, %10) <{elem_type = !llvm.array<1 x struct<"struct.va_list", (i32, i32, ptr, ptr)>>, noWrapFlags = 0 : i32, rawConstantIndices = array<i32: -2147483648, -2147483648, 0>}> : (!llvm.ptr, i64, i64) -> !llvm.ptr
    %15 = "llvm.load"(%14) <{ordering = 0 : i64}> : (!llvm.ptr) -> i32
    %16 = "llvm.icmp"(%15, %8) <{predicate = 6 : i64}> : (i32, i32) -> i1
    "llvm.cond_br"(%16)[^bb1, ^bb2] <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (i1) -> ()
  ^bb1:  // pred: ^bb0
    %17 = "llvm.getelementptr"(%13, %7, %6) <{elem_type = !llvm.array<1 x struct<"struct.va_list", (i32, i32, ptr, ptr)>>, noWrapFlags = 0 : i32, rawConstantIndices = array<i32: -2147483648, -2147483648, 3>}> : (!llvm.ptr, i64, i64) -> !llvm.ptr
    %18 = "llvm.load"(%17) <{ordering = 0 : i64}> : (!llvm.ptr) -> !llvm.ptr
    %19 = "llvm.zext"(%15) : (i32) -> i64
    %20 = "llvm.getelementptr"(%18, %19) <{elem_type = i8, noWrapFlags = 0 : i32, rawConstantIndices = array<i32: -2147483648>}> : (!llvm.ptr, i64) -> !llvm.ptr
    %21 = "llvm.add"(%15, %4) <{overflowFlags = 0 : i32}> : (i32, i32) -> i32
    "llvm.store"(%21, %14) <{ordering = 0 : i64}> : (i32, !llvm.ptr) -> ()
    "llvm.br"(%20)[^bb3] : (!llvm.ptr) -> ()
  ^bb2:  // pred: ^bb0
    %22 = "llvm.getelementptr"(%13, %3, %2) <{elem_type = !llvm.array<1 x struct<"struct.va_list", (i32, i32, ptr, ptr)>>, noWrapFlags = 0 : i32, rawConstantIndices = array<i32: -2147483648, -2147483648, 2>}> : (!llvm.ptr, i64, i64) -> !llvm.ptr
    %23 = "llvm.load"(%22) <{ordering = 0 : i64}> : (!llvm.ptr) -> !llvm.ptr
    %24 = "llvm.getelementptr"(%23, %0) <{elem_type = i8, noWrapFlags = 0 : i32, rawConstantIndices = array<i32: -2147483648>}> : (!llvm.ptr, i64) -> !llvm.ptr
    "llvm.store"(%24, %22) <{ordering = 0 : i64}> : (!llvm.ptr, !llvm.ptr) -> ()
    "llvm.br"(%23)[^bb3] : (!llvm.ptr) -> ()
  ^bb3(%25: !llvm.ptr):  // 2 preds: ^bb1, ^bb2
    %26 = "llvm.load"(%25) <{ordering = 0 : i64}> : (!llvm.ptr) -> i32
    "llvm.intr.vaend"(%13) : (!llvm.ptr) -> ()
    "llvm.return"(%26) : (i32) -> ()
  }) : () -> ()
}) : () -> ()

