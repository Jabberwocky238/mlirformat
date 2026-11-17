"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<vector<[4]xf32> (vector<[4]xf32>, f32, i32)>, linkage = #llvm.linkage<external>, sym_name = "binary_fv", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: vector<[4]xf32> loc("<stdin>":3:8), %arg1: f32 loc("<stdin>":3:32), %arg2: i32 loc("<stdin>":3:44)):
    %0 = "vcix.v.sv"(%arg0, %arg1, %arg2) <{opcode = 1 : i32}> : (vector<[4]xf32>, f32, i32) -> vector<[4]xf32> loc("<stdin>":4:10)
    "llvm.return"(%0) : (vector<[4]xf32>) -> () loc("<stdin>":5:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
