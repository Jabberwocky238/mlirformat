"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (i32)>, linkage = #llvm.linkage<external>, sym_name = "foo", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  }) : () -> () loc("<stdin>":2:3)
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (i32)>, linkage = #llvm.linkage<external>, sym_name = "omp_target_teams_shared_simple", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: i32 loc("<stdin>":5:8)):
    "omp.teams"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 0, 0>}> ({
      "llvm.call"(%arg0) <{CConv = #llvm.cconv<ccc>, TailCallKind = #llvm.tailcallkind<none>, callee = @foo, fastmathFlags = #llvm.fastmath<none>, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 1, 0>}> : (i32) -> () loc("<stdin>":7:7)
      "omp.terminator"() : () -> () loc("<stdin>":8:7)
    }) : () -> () loc("<stdin>":6:5)
    "llvm.return"() : () -> () loc("<stdin>":10:5)
  }) {omp.declare_target = #omp.declaretarget<device_type = (any), capture_clause = (to)>} : () -> () loc("<stdin>":4:3)
}) {omp.is_target_device = true} : () -> () loc("<stdin>":1:1)
