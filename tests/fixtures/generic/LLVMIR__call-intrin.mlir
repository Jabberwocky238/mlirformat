"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<vector<4xf32> ()>, linkage = #llvm.linkage<external>, sym_name = "round_sse41", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    %0 = "llvm.mlir.constant"() <{value = 1 : i32}> : () -> i32
    %1 = "llvm.mlir.constant"() <{value = dense<2.000000e-01> : vector<4xf32>}> : () -> vector<4xf32>
    %2 = "llvm.call_intrinsic"(%1, %1, %0) <{fastmathFlags = #llvm.fastmath<reassoc>, intrin = "llvm.x86.sse41.round.ss", op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 3, 0>}> : (vector<4xf32>, vector<4xf32>, i32) -> vector<4xf32>
    "llvm.return"(%2) : (vector<4xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<f32 ()>, linkage = #llvm.linkage<external>, sym_name = "round_overloaded", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    %0 = "llvm.mlir.constant"() <{value = 1.000000e+00 : f32}> : () -> f32
    %1 = "llvm.call_intrinsic"(%0) <{fastmathFlags = #llvm.fastmath<none>, intrin = "llvm.round", op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 1, 0>}> : (f32) -> f32
    "llvm.return"(%1) : (f32) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "lifetime_start", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    %0 = "llvm.mlir.constant"() <{value = 1 : i8}> : () -> i8
    %1 = "llvm.alloca"(%0) <{elem_type = f32}> : (i8) -> !llvm.ptr
    "llvm.call_intrinsic"(%1) <{fastmathFlags = #llvm.fastmath<none>, intrin = "llvm.lifetime.start", op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 1, 0>}> : (!llvm.ptr) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "variadic", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    %0 = "llvm.mlir.constant"() <{value = 1 : i8}> : () -> i8
    %1 = "llvm.alloca"(%0) <{elem_type = f32}> : (i8) -> !llvm.ptr
    "llvm.call_intrinsic"(%1, %1) <{fastmathFlags = #llvm.fastmath<none>, intrin = "llvm.localescape", op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 2, 0>}> : (!llvm.ptr, !llvm.ptr) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "no_intrinsic", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    "llvm.call_intrinsic"() <{fastmathFlags = #llvm.fastmath<none>, intrin = "llvm.does_not_exist", op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 0, 0>}> : () -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "bad_types", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    %0 = "llvm.mlir.constant"() <{value = 1 : i8}> : () -> i8
    %1 = "llvm.call_intrinsic"(%0) <{fastmathFlags = #llvm.fastmath<none>, intrin = "llvm.round", op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 1, 0>}> : (i8) -> i8
    "llvm.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "bad_result", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    "llvm.call_intrinsic"() <{fastmathFlags = #llvm.fastmath<none>, intrin = "llvm.x86.sse41.round.ss", op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 0, 0>}> : () -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "bad_result", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    %0 = "llvm.call_intrinsic"() <{fastmathFlags = #llvm.fastmath<none>, intrin = "llvm.x86.sse41.round.ss", op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 0, 0>}> : () -> vector<8xf32>
    "llvm.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "bad_args", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    %0 = "llvm.call_intrinsic"() <{fastmathFlags = #llvm.fastmath<none>, intrin = "llvm.x86.sse41.round.ss", op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 0, 0>}> : () -> vector<4xf32>
    "llvm.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "bad_args", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    %0 = "llvm.mlir.constant"() <{value = 1 : i64}> : () -> i64
    %1 = "llvm.mlir.constant"() <{value = dense<2.000000e-01> : vector<4xf32>}> : () -> vector<4xf32>
    %2 = "llvm.call_intrinsic"(%1, %1, %0) <{fastmathFlags = #llvm.fastmath<reassoc>, intrin = "llvm.x86.sse41.round.ss", op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 3, 0>}> : (vector<4xf32>, vector<4xf32>, i64) -> vector<4xf32>
    "llvm.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<i32 (i32)>, linkage = #llvm.linkage<external>, sym_name = "intrinsic_call_arg_attrs", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: i32):
    %0 = "llvm.call_intrinsic"(%arg0) <{arg_attrs = [{llvm.signext}], fastmathFlags = #llvm.fastmath<none>, intrin = "llvm.riscv.sha256sig0", op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 1, 0>}> : (i32) -> i32
    "llvm.return"(%0) : (i32) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr)>, linkage = #llvm.linkage<external>, sym_name = "intrinsic_element_type", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: !llvm.ptr):
    %0 = "llvm.call_intrinsic"(%arg0) <{arg_attrs = [{llvm.elementtype = i8}], fastmathFlags = #llvm.fastmath<none>, intrin = "llvm.aarch64.ldxr.p0", op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 1, 0>}> : (!llvm.ptr) -> i64
    "llvm.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

