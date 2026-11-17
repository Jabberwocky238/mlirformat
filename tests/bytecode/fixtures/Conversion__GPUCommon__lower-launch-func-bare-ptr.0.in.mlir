"builtin.module"() ({
  "gpu.module"() <{sym_name = "kernels", targets = [#nvvm.target]}> ({
    "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (f32, ptr<1>)>, linkage = #llvm.linkage<external>, sym_name = "kernel_1", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    ^bb0(%arg0: f32 loc("<stdin>":4:10), %arg1: !llvm.ptr<1> loc("<stdin>":4:22)):
      %3 = "llvm.mlir.undef"() : () -> !llvm.struct<(ptr<1>, ptr<1>, i64, array<1 x i64>, array<1 x i64>)> loc("<stdin>":5:12)
      %4 = "llvm.insertvalue"(%3, %arg1) <{position = array<i64: 0>}> : (!llvm.struct<(ptr<1>, ptr<1>, i64, array<1 x i64>, array<1 x i64>)>, !llvm.ptr<1>) -> !llvm.struct<(ptr<1>, ptr<1>, i64, array<1 x i64>, array<1 x i64>)> loc("<stdin>":6:12)
      %5 = "llvm.insertvalue"(%4, %arg1) <{position = array<i64: 1>}> : (!llvm.struct<(ptr<1>, ptr<1>, i64, array<1 x i64>, array<1 x i64>)>, !llvm.ptr<1>) -> !llvm.struct<(ptr<1>, ptr<1>, i64, array<1 x i64>, array<1 x i64>)> loc("<stdin>":7:12)
      %6 = "llvm.mlir.constant"() <{value = 0 : index}> : () -> i64 loc("<stdin>":8:12)
      %7 = "llvm.insertvalue"(%5, %6) <{position = array<i64: 2>}> : (!llvm.struct<(ptr<1>, ptr<1>, i64, array<1 x i64>, array<1 x i64>)>, i64) -> !llvm.struct<(ptr<1>, ptr<1>, i64, array<1 x i64>, array<1 x i64>)> loc("<stdin>":9:12)
      %8 = "llvm.mlir.constant"() <{value = 10 : index}> : () -> i64 loc("<stdin>":10:12)
      %9 = "llvm.insertvalue"(%7, %8) <{position = array<i64: 3, 0>}> : (!llvm.struct<(ptr<1>, ptr<1>, i64, array<1 x i64>, array<1 x i64>)>, i64) -> !llvm.struct<(ptr<1>, ptr<1>, i64, array<1 x i64>, array<1 x i64>)> loc("<stdin>":11:12)
      %10 = "llvm.mlir.constant"() <{value = 1 : index}> : () -> i64 loc("<stdin>":12:13)
      %11 = "llvm.insertvalue"(%9, %10) <{position = array<i64: 4, 0>}> : (!llvm.struct<(ptr<1>, ptr<1>, i64, array<1 x i64>, array<1 x i64>)>, i64) -> !llvm.struct<(ptr<1>, ptr<1>, i64, array<1 x i64>, array<1 x i64>)> loc("<stdin>":13:13)
      "llvm.return"() : () -> () loc("<stdin>":14:7)
    }) {gpu.kernel, nvvm.kernel} : () -> () loc("<stdin>":3:5)
  }) : () -> () loc("<stdin>":2:3)
  "func.func"() <{function_type = () -> (), sym_name = "foo"}> ({
    %0 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32 loc("<stdin>":18:10)
    %1 = "gpu.alloc"() <{operandSegmentSizes = array<i32: 0, 0, 0>}> : () -> memref<10xf32, 1> loc("<stdin>":19:10)
    %2 = "arith.constant"() <{value = 8 : index}> : () -> index loc("<stdin>":20:10)
    "gpu.launch_func"(%2, %2, %2, %2, %2, %2, %0, %1) <{kernel = @kernels::@kernel_1, operandSegmentSizes = array<i32: 0, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 2, 0>}> : (index, index, index, index, index, index, f32, memref<10xf32, 1>) -> () loc("<stdin>":21:5)
    "func.return"() : () -> () loc("<stdin>":22:5)
  }) : () -> () loc("<stdin>":17:3)
}) {gpu.container_module} : () -> () loc("<stdin>":1:1)
