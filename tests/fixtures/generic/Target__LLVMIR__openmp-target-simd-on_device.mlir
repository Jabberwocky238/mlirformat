"builtin.module"() ({
  "omp.private"() <{data_sharing_type = #omp<data_sharing_type{type = private}>, sym_name = "simd_privatizer", type = !llvm.ptr}> ({
  ^bb0(%arg2: !llvm.ptr, %arg3: !llvm.ptr):
    "omp.yield"(%arg2) : (!llvm.ptr) -> ()
  }, {
  }, {
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "test_target_simd", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    "omp.target"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0>}> ({
      %0 = "llvm.mlir.constant"() <{value = 1 : i32}> : () -> i32
      %1 = "llvm.alloca"(%0) <{elem_type = i32}> {bindc_name = "x"} : (i32) -> !llvm.ptr
      "omp.simd"(%1) <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 1, 0>, private_syms = [@simd_privatizer]}> ({
      ^bb0(%arg0: !llvm.ptr):
        "omp.loop_nest"(%0, %0, %0) <{loop_inclusive}> ({
        ^bb0(%arg1: i32):
          "omp.yield"() : () -> ()
        }) : (i32, i32, i32) -> ()
      }) : (!llvm.ptr) -> ()
      "omp.terminator"() : () -> ()
    }) : () -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
}) {omp.is_target_device = true} : () -> ()

