"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<vector<4xf32> ()>, linkage = #llvm.linkage<external>, sym_name = "round_sse41", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    %0 = "llvm.mlir.constant"() <{value = 1 : i32}> : () -> i32 loc("<stdin>":3:10)
    %1 = "llvm.mlir.constant"() <{value = dense<2.000000e-01> : vector<4xf32>}> : () -> vector<4xf32> loc("<stdin>":4:10)
    %2 = "llvm.call_intrinsic"(%1, %1, %0) <{fastmathFlags = #llvm.fastmath<reassoc>, intrin = "llvm.x86.sse41.round.ss", op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 3, 0>}> : (vector<4xf32>, vector<4xf32>, i32) -> vector<4xf32> loc("<stdin>":5:10)
    "llvm.return"(%2) : (vector<4xf32>) -> () loc("<stdin>":6:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
