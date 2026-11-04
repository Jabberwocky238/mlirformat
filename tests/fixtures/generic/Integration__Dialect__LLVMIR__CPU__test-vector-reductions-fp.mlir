"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "printNewline", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (f32)>, linkage = #llvm.linkage<external>, sym_name = "printF32", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "entry", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    %0 = "llvm.mlir.constant"() <{value = 1.000000e+00 : f32}> : () -> f32
    %1 = "llvm.mlir.constant"() <{value = 2.000000e+00 : f32}> : () -> f32
    %2 = "llvm.mlir.constant"() <{value = 3.000000e+00 : f32}> : () -> f32
    %3 = "llvm.mlir.constant"() <{value = 4.000000e+00 : f32}> : () -> f32
    %4 = "llvm.mlir.undef"() : () -> vector<4xf32>
    %5 = "llvm.mlir.constant"() <{value = 0 : index}> : () -> i64
    %6 = "llvm.insertelement"(%4, %0, %5) : (vector<4xf32>, f32, i64) -> vector<4xf32>
    %7 = "llvm.shufflevector"(%6, %4) <{mask = array<i32: 0, 0, 0, 0>}> : (vector<4xf32>, vector<4xf32>) -> vector<4xf32>
    %8 = "llvm.mlir.constant"() <{value = 1 : i64}> : () -> i64
    %9 = "llvm.insertelement"(%7, %1, %8) : (vector<4xf32>, f32, i64) -> vector<4xf32>
    %10 = "llvm.mlir.constant"() <{value = 2 : i64}> : () -> i64
    %11 = "llvm.insertelement"(%9, %2, %10) : (vector<4xf32>, f32, i64) -> vector<4xf32>
    %12 = "llvm.mlir.constant"() <{value = 3 : i64}> : () -> i64
    %13 = "llvm.insertelement"(%11, %3, %12) : (vector<4xf32>, f32, i64) -> vector<4xf32>
    %14 = "llvm.intr.vector.reduce.fmax"(%13) <{fastmathFlags = #llvm.fastmath<none>}> : (vector<4xf32>) -> f32
    "llvm.call"(%14) <{CConv = #llvm.cconv<ccc>, TailCallKind = #llvm.tailcallkind<none>, callee = @printF32, fastmathFlags = #llvm.fastmath<none>, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 1, 0>}> : (f32) -> ()
    "llvm.call"() <{CConv = #llvm.cconv<ccc>, TailCallKind = #llvm.tailcallkind<none>, callee = @printNewline, fastmathFlags = #llvm.fastmath<none>, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 0, 0>}> : () -> ()
    %15 = "llvm.intr.vector.reduce.fmin"(%13) <{fastmathFlags = #llvm.fastmath<none>}> : (vector<4xf32>) -> f32
    "llvm.call"(%15) <{CConv = #llvm.cconv<ccc>, TailCallKind = #llvm.tailcallkind<none>, callee = @printF32, fastmathFlags = #llvm.fastmath<none>, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 1, 0>}> : (f32) -> ()
    "llvm.call"() <{CConv = #llvm.cconv<ccc>, TailCallKind = #llvm.tailcallkind<none>, callee = @printNewline, fastmathFlags = #llvm.fastmath<none>, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 0, 0>}> : () -> ()
    %16 = "llvm.intr.vector.reduce.fmaximum"(%13) <{fastmathFlags = #llvm.fastmath<none>}> : (vector<4xf32>) -> f32
    "llvm.call"(%16) <{CConv = #llvm.cconv<ccc>, TailCallKind = #llvm.tailcallkind<none>, callee = @printF32, fastmathFlags = #llvm.fastmath<none>, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 1, 0>}> : (f32) -> ()
    "llvm.call"() <{CConv = #llvm.cconv<ccc>, TailCallKind = #llvm.tailcallkind<none>, callee = @printNewline, fastmathFlags = #llvm.fastmath<none>, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 0, 0>}> : () -> ()
    %17 = "llvm.intr.vector.reduce.fminimum"(%13) <{fastmathFlags = #llvm.fastmath<none>}> : (vector<4xf32>) -> f32
    "llvm.call"(%17) <{CConv = #llvm.cconv<ccc>, TailCallKind = #llvm.tailcallkind<none>, callee = @printF32, fastmathFlags = #llvm.fastmath<none>, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 1, 0>}> : (f32) -> ()
    "llvm.call"() <{CConv = #llvm.cconv<ccc>, TailCallKind = #llvm.tailcallkind<none>, callee = @printNewline, fastmathFlags = #llvm.fastmath<none>, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 0, 0>}> : () -> ()
    %18 = "llvm.intr.vector.reduce.fadd"(%0, %13) <{fastmathFlags = #llvm.fastmath<none>}> : (f32, vector<4xf32>) -> f32
    "llvm.call"(%18) <{CConv = #llvm.cconv<ccc>, TailCallKind = #llvm.tailcallkind<none>, callee = @printF32, fastmathFlags = #llvm.fastmath<none>, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 1, 0>}> : (f32) -> ()
    "llvm.call"() <{CConv = #llvm.cconv<ccc>, TailCallKind = #llvm.tailcallkind<none>, callee = @printNewline, fastmathFlags = #llvm.fastmath<none>, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 0, 0>}> : () -> ()
    %19 = "llvm.intr.vector.reduce.fadd"(%0, %13) <{fastmathFlags = #llvm.fastmath<none>}> {reassoc = true} : (f32, vector<4xf32>) -> f32
    "llvm.call"(%19) <{CConv = #llvm.cconv<ccc>, TailCallKind = #llvm.tailcallkind<none>, callee = @printF32, fastmathFlags = #llvm.fastmath<none>, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 1, 0>}> : (f32) -> ()
    "llvm.call"() <{CConv = #llvm.cconv<ccc>, TailCallKind = #llvm.tailcallkind<none>, callee = @printNewline, fastmathFlags = #llvm.fastmath<none>, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 0, 0>}> : () -> ()
    %20 = "llvm.intr.vector.reduce.fadd"(%1, %13) <{fastmathFlags = #llvm.fastmath<none>}> : (f32, vector<4xf32>) -> f32
    "llvm.call"(%20) <{CConv = #llvm.cconv<ccc>, TailCallKind = #llvm.tailcallkind<none>, callee = @printF32, fastmathFlags = #llvm.fastmath<none>, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 1, 0>}> : (f32) -> ()
    "llvm.call"() <{CConv = #llvm.cconv<ccc>, TailCallKind = #llvm.tailcallkind<none>, callee = @printNewline, fastmathFlags = #llvm.fastmath<none>, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 0, 0>}> : () -> ()
    %21 = "llvm.intr.vector.reduce.fadd"(%1, %13) <{fastmathFlags = #llvm.fastmath<none>}> {reassoc = true} : (f32, vector<4xf32>) -> f32
    "llvm.call"(%21) <{CConv = #llvm.cconv<ccc>, TailCallKind = #llvm.tailcallkind<none>, callee = @printF32, fastmathFlags = #llvm.fastmath<none>, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 1, 0>}> : (f32) -> ()
    "llvm.call"() <{CConv = #llvm.cconv<ccc>, TailCallKind = #llvm.tailcallkind<none>, callee = @printNewline, fastmathFlags = #llvm.fastmath<none>, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 0, 0>}> : () -> ()
    %22 = "llvm.intr.vector.reduce.fmul"(%0, %13) <{fastmathFlags = #llvm.fastmath<none>}> : (f32, vector<4xf32>) -> f32
    "llvm.call"(%22) <{CConv = #llvm.cconv<ccc>, TailCallKind = #llvm.tailcallkind<none>, callee = @printF32, fastmathFlags = #llvm.fastmath<none>, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 1, 0>}> : (f32) -> ()
    "llvm.call"() <{CConv = #llvm.cconv<ccc>, TailCallKind = #llvm.tailcallkind<none>, callee = @printNewline, fastmathFlags = #llvm.fastmath<none>, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 0, 0>}> : () -> ()
    %23 = "llvm.intr.vector.reduce.fmul"(%0, %13) <{fastmathFlags = #llvm.fastmath<none>}> {reassoc = true} : (f32, vector<4xf32>) -> f32
    "llvm.call"(%23) <{CConv = #llvm.cconv<ccc>, TailCallKind = #llvm.tailcallkind<none>, callee = @printF32, fastmathFlags = #llvm.fastmath<none>, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 1, 0>}> : (f32) -> ()
    "llvm.call"() <{CConv = #llvm.cconv<ccc>, TailCallKind = #llvm.tailcallkind<none>, callee = @printNewline, fastmathFlags = #llvm.fastmath<none>, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 0, 0>}> : () -> ()
    %24 = "llvm.intr.vector.reduce.fmul"(%1, %13) <{fastmathFlags = #llvm.fastmath<none>}> : (f32, vector<4xf32>) -> f32
    "llvm.call"(%24) <{CConv = #llvm.cconv<ccc>, TailCallKind = #llvm.tailcallkind<none>, callee = @printF32, fastmathFlags = #llvm.fastmath<none>, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 1, 0>}> : (f32) -> ()
    "llvm.call"() <{CConv = #llvm.cconv<ccc>, TailCallKind = #llvm.tailcallkind<none>, callee = @printNewline, fastmathFlags = #llvm.fastmath<none>, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 0, 0>}> : () -> ()
    %25 = "llvm.intr.vector.reduce.fmul"(%1, %13) <{fastmathFlags = #llvm.fastmath<none>}> {reassoc = true} : (f32, vector<4xf32>) -> f32
    "llvm.call"(%25) <{CConv = #llvm.cconv<ccc>, TailCallKind = #llvm.tailcallkind<none>, callee = @printF32, fastmathFlags = #llvm.fastmath<none>, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 1, 0>}> : (f32) -> ()
    "llvm.call"() <{CConv = #llvm.cconv<ccc>, TailCallKind = #llvm.tailcallkind<none>, callee = @printNewline, fastmathFlags = #llvm.fastmath<none>, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 0, 0>}> : () -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

