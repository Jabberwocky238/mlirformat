"builtin.module"() ({
  "llvm.mlir.global"() <{addr_space = 0 : i32, global_type = !llvm.array<3 x i32>, linkage = #llvm.linkage<external>, sym_name = "_QMtest_0Earray_1d", unnamed_addr = 0 : i64, value = dense<[1, 2, 3]> : tensor<3xi32>, visibility_ = 0 : i64}> ({
  }) {omp.declare_target = #omp.declaretarget<device_type = (any), capture_clause = (link)>} : () -> ()
  "llvm.mlir.global"() <{addr_space = 0 : i32, global_type = !llvm.array<2 x array<2 x i32>>, linkage = #llvm.linkage<external>, sym_name = "_QMtest_0Earray_2d", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    %34 = "llvm.mlir.undef"() : () -> !llvm.array<2 x array<2 x i32>>
    %35 = "llvm.mlir.constant"() <{value = 1 : i32}> : () -> i32
    %36 = "llvm.insertvalue"(%34, %35) <{position = array<i64: 0, 0>}> : (!llvm.array<2 x array<2 x i32>>, i32) -> !llvm.array<2 x array<2 x i32>>
    %37 = "llvm.mlir.constant"() <{value = 2 : i32}> : () -> i32
    %38 = "llvm.insertvalue"(%36, %37) <{position = array<i64: 0, 1>}> : (!llvm.array<2 x array<2 x i32>>, i32) -> !llvm.array<2 x array<2 x i32>>
    %39 = "llvm.mlir.constant"() <{value = 3 : i32}> : () -> i32
    %40 = "llvm.insertvalue"(%38, %39) <{position = array<i64: 1, 0>}> : (!llvm.array<2 x array<2 x i32>>, i32) -> !llvm.array<2 x array<2 x i32>>
    %41 = "llvm.mlir.constant"() <{value = 4 : i32}> : () -> i32
    %42 = "llvm.insertvalue"(%40, %41) <{position = array<i64: 1, 1>}> : (!llvm.array<2 x array<2 x i32>>, i32) -> !llvm.array<2 x array<2 x i32>>
    %43 = "llvm.mlir.constant"() <{value = 2 : index}> : () -> i64
    %44 = "llvm.mlir.constant"() <{value = 2 : index}> : () -> i64
    "llvm.return"(%42) : (!llvm.array<2 x array<2 x i32>>) -> ()
  }) {omp.declare_target = #omp.declaretarget<device_type = (any), capture_clause = (link)>} : () -> ()
  "llvm.mlir.global"() <{addr_space = 0 : i32, global_type = f32, linkage = #llvm.linkage<external>, sym_name = "_QMtest_0Edata_extended_link_1", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    %33 = "llvm.mlir.constant"() <{value = 2.000000e+00 : f32}> : () -> f32
    "llvm.return"(%33) : (f32) -> ()
  }) {omp.declare_target = #omp.declaretarget<device_type = (any), capture_clause = (link)>} : () -> ()
  "llvm.mlir.global"() <{addr_space = 0 : i32, global_type = f32, linkage = #llvm.linkage<external>, sym_name = "_QMtest_0Edata_extended_link_2", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    %32 = "llvm.mlir.constant"() <{value = 3.000000e+00 : f32}> : () -> f32
    "llvm.return"(%32) : (f32) -> ()
  }) {omp.declare_target = #omp.declaretarget<device_type = (any), capture_clause = (link)>} : () -> ()
  "llvm.mlir.global"() <{addr_space = 0 : i32, global_type = f32, linkage = #llvm.linkage<external>, sym_name = "_QMtest_0Edata_extended_to_1", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    %31 = "llvm.mlir.constant"() <{value = 2.000000e+00 : f32}> : () -> f32
    "llvm.return"(%31) : (f32) -> ()
  }) {omp.declare_target = #omp.declaretarget<device_type = (any), capture_clause = (to)>} : () -> ()
  "llvm.mlir.global"() <{addr_space = 0 : i32, global_type = f32, linkage = #llvm.linkage<external>, sym_name = "_QMtest_0Edata_extended_enter_1", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    %30 = "llvm.mlir.constant"() <{value = 2.000000e+00 : f32}> : () -> f32
    "llvm.return"(%30) : (f32) -> ()
  }) {omp.declare_target = #omp.declaretarget<device_type = (any), capture_clause = (enter)>} : () -> ()
  "llvm.mlir.global"() <{addr_space = 0 : i32, global_type = f32, linkage = #llvm.linkage<external>, sym_name = "_QMtest_0Edata_extended_to_2", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    %29 = "llvm.mlir.constant"() <{value = 3.000000e+00 : f32}> : () -> f32
    "llvm.return"(%29) : (f32) -> ()
  }) {omp.declare_target = #omp.declaretarget<device_type = (any), capture_clause = (to)>} : () -> ()
  "llvm.mlir.global"() <{addr_space = 0 : i32, global_type = f32, linkage = #llvm.linkage<external>, sym_name = "_QMtest_0Edata_extended_enter_2", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    %28 = "llvm.mlir.constant"() <{value = 3.000000e+00 : f32}> : () -> f32
    "llvm.return"(%28) : (f32) -> ()
  }) {omp.declare_target = #omp.declaretarget<device_type = (any), capture_clause = (enter)>} : () -> ()
  "llvm.mlir.global"() <{addr_space = 0 : i32, global_type = i32, linkage = #llvm.linkage<external>, sym_name = "_QMtest_0Edata_int", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    %27 = "llvm.mlir.constant"() <{value = 10 : i32}> : () -> i32
    "llvm.return"(%27) : (i32) -> ()
  }) {omp.declare_target = #omp.declaretarget<device_type = (any), capture_clause = (link)>} : () -> ()
  "llvm.mlir.global"() <{addr_space = 0 : i32, global_type = i32, linkage = #llvm.linkage<external>, sym_name = "_QMtest_0Edata_int_clauseless_to", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    %26 = "llvm.mlir.constant"() <{value = 1 : i32}> : () -> i32
    "llvm.return"(%26) : (i32) -> ()
  }) {omp.declare_target = #omp.declaretarget<device_type = (any), capture_clause = (to)>} : () -> ()
  "llvm.mlir.global"() <{addr_space = 0 : i32, global_type = i32, linkage = #llvm.linkage<external>, sym_name = "_QMtest_0Edata_int_clauseless_enter", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    %25 = "llvm.mlir.constant"() <{value = 1 : i32}> : () -> i32
    "llvm.return"(%25) : (i32) -> ()
  }) {omp.declare_target = #omp.declaretarget<device_type = (any), capture_clause = (enter)>} : () -> ()
  "llvm.mlir.global"() <{addr_space = 0 : i32, global_type = i32, linkage = #llvm.linkage<external>, sym_name = "_QMtest_0Edata_int_to", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    %24 = "llvm.mlir.constant"() <{value = 5 : i32}> : () -> i32
    "llvm.return"(%24) : (i32) -> ()
  }) {omp.declare_target = #omp.declaretarget<device_type = (any), capture_clause = (to)>} : () -> ()
  "llvm.mlir.global"() <{addr_space = 0 : i32, global_type = i32, linkage = #llvm.linkage<external>, sym_name = "_QMtest_0Edata_int_enter", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    %23 = "llvm.mlir.constant"() <{value = 5 : i32}> : () -> i32
    "llvm.return"(%23) : (i32) -> ()
  }) {omp.declare_target = #omp.declaretarget<device_type = (any), capture_clause = (enter)>} : () -> ()
  "llvm.mlir.global"() <{addr_space = 0 : i32, global_type = !llvm.struct<(ptr, i64, i32, i8, i8, i8, i8)>, linkage = #llvm.linkage<external>, sym_name = "_QMtest_0Ept1", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    %1 = "llvm.mlir.zero"() : () -> !llvm.ptr
    %2 = "llvm.mlir.constant"() <{value = 9 : i32}> : () -> i32
    %3 = "llvm.mlir.zero"() : () -> !llvm.ptr
    %4 = "llvm.getelementptr"(%3) <{elem_type = i32, noWrapFlags = 0 : i32, rawConstantIndices = array<i32: 1>}> : (!llvm.ptr) -> !llvm.ptr
    %5 = "llvm.ptrtoint"(%4) : (!llvm.ptr) -> i64
    %6 = "llvm.mlir.undef"() : () -> !llvm.struct<(ptr, i64, i32, i8, i8, i8, i8)>
    %7 = "llvm.insertvalue"(%6, %5) <{position = array<i64: 1>}> : (!llvm.struct<(ptr, i64, i32, i8, i8, i8, i8)>, i64) -> !llvm.struct<(ptr, i64, i32, i8, i8, i8, i8)>
    %8 = "llvm.mlir.constant"() <{value = 20180515 : i32}> : () -> i32
    %9 = "llvm.insertvalue"(%7, %8) <{position = array<i64: 2>}> : (!llvm.struct<(ptr, i64, i32, i8, i8, i8, i8)>, i32) -> !llvm.struct<(ptr, i64, i32, i8, i8, i8, i8)>
    %10 = "llvm.mlir.constant"() <{value = 0 : i32}> : () -> i32
    %11 = "llvm.trunc"(%10) <{overflowFlags = 0 : i32}> : (i32) -> i8
    %12 = "llvm.insertvalue"(%9, %11) <{position = array<i64: 3>}> : (!llvm.struct<(ptr, i64, i32, i8, i8, i8, i8)>, i8) -> !llvm.struct<(ptr, i64, i32, i8, i8, i8, i8)>
    %13 = "llvm.trunc"(%2) <{overflowFlags = 0 : i32}> : (i32) -> i8
    %14 = "llvm.insertvalue"(%12, %13) <{position = array<i64: 4>}> : (!llvm.struct<(ptr, i64, i32, i8, i8, i8, i8)>, i8) -> !llvm.struct<(ptr, i64, i32, i8, i8, i8, i8)>
    %15 = "llvm.mlir.constant"() <{value = 1 : i32}> : () -> i32
    %16 = "llvm.trunc"(%15) <{overflowFlags = 0 : i32}> : (i32) -> i8
    %17 = "llvm.insertvalue"(%14, %16) <{position = array<i64: 5>}> : (!llvm.struct<(ptr, i64, i32, i8, i8, i8, i8)>, i8) -> !llvm.struct<(ptr, i64, i32, i8, i8, i8, i8)>
    %18 = "llvm.mlir.constant"() <{value = 0 : i32}> : () -> i32
    %19 = "llvm.trunc"(%18) <{overflowFlags = 0 : i32}> : (i32) -> i8
    %20 = "llvm.insertvalue"(%17, %19) <{position = array<i64: 6>}> : (!llvm.struct<(ptr, i64, i32, i8, i8, i8, i8)>, i8) -> !llvm.struct<(ptr, i64, i32, i8, i8, i8, i8)>
    %21 = "llvm.bitcast"(%1) : (!llvm.ptr) -> !llvm.ptr
    %22 = "llvm.insertvalue"(%20, %21) <{position = array<i64: 0>}> : (!llvm.struct<(ptr, i64, i32, i8, i8, i8, i8)>, !llvm.ptr) -> !llvm.struct<(ptr, i64, i32, i8, i8, i8, i8)>
    "llvm.return"(%22) : (!llvm.struct<(ptr, i64, i32, i8, i8, i8, i8)>) -> ()
  }) {omp.declare_target = #omp.declaretarget<device_type = (any), capture_clause = (link)>} : () -> ()
  "llvm.mlir.global"() <{addr_space = 0 : i32, global_type = i32, linkage = #llvm.linkage<external>, sym_name = "_QMtest_0Ept2_tar", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    %0 = "llvm.mlir.constant"() <{value = 5 : i32}> : () -> i32
    "llvm.return"(%0) : (i32) -> ()
  }) {omp.declare_target = #omp.declaretarget<device_type = (any), capture_clause = (link)>} : () -> ()
}) {llvm.target_triple = "x86_64-unknown-linux-gnu", omp.is_target_device = false} : () -> ()

