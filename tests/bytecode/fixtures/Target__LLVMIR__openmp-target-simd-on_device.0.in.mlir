"builtin.module"() ({
  "omp.private"() <{data_sharing_type = #omp<data_sharing_type{type = private}>, sym_name = "simd_privatizer", type = !llvm.ptr}> ({
  ^bb0(%arg2: !llvm.ptr loc("<stdin>":3:8), %arg3: !llvm.ptr loc("<stdin>":3:26)):
    "omp.yield"(%arg2) : (!llvm.ptr) -> () loc("<stdin>":4:5)
  }, {
  }, {
  }) : () -> () loc("<stdin>":2:3)
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "test_target_simd", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    "omp.target"() <{kernel_type = #omp<kernel_type(generic)>, operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0>}> ({
      %0 = "llvm.mlir.constant"() <{value = 1 : i32}> : () -> i32 loc("<stdin>":10:12)
      %1 = "llvm.alloca"(%0) <{elem_type = i32}> {bindc_name = "x"} : (i32) -> !llvm.ptr loc("<stdin>":11:12)
      "omp.simd"(%1) <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 1, 0>, private_syms = [@simd_privatizer]}> ({
      ^bb0(%arg0: !llvm.ptr loc("<stdin>":13:12)):
        "omp.loop_nest"(%0, %0, %0) <{loop_inclusive}> ({
        ^bb0(%arg1: i32 loc("<stdin>":15:14)):
          "omp.yield"() : () -> () loc("<stdin>":16:11)
        }) : (i32, i32, i32) -> () loc("<stdin>":14:9)
      }) : (!llvm.ptr) -> () loc("<stdin>":12:7)
      "omp.terminator"() : () -> () loc("<stdin>":19:7)
    }) : () -> () loc("<stdin>":9:5)
    "llvm.return"() : () -> () loc("<stdin>":21:5)
  }) : () -> () loc("<stdin>":8:3)
}) {omp.is_target_device = true} : () -> () loc("<stdin>":1:1)
