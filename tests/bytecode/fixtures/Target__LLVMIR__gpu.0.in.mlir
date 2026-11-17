"builtin.module"() ({
  "gpu.binary"() <{objects = [#gpu.object<#nvvm.target, "BLOB">], offloadingHandler = #gpu.select_object, sym_name = "kernel_module"}> : () -> () loc("<stdin>":2:3)
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "foo", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    %0 = "llvm.mlir.constant"() <{value = 8 : index}> : () -> i64 loc("<stdin>":4:10)
    %1 = "llvm.mlir.constant"() <{value = 32 : i32}> : () -> i32 loc("<stdin>":5:10)
    %2 = "llvm.mlir.constant"() <{value = 256 : i32}> : () -> i32 loc("<stdin>":6:10)
    "gpu.launch_func"(%0, %0, %0, %0, %0, %0, %2, %1, %1) <{kernel = @kernel_module::@kernel, operandSegmentSizes = array<i32: 0, 1, 1, 1, 1, 1, 1, 0, 0, 0, 1, 2, 0>}> : (i64, i64, i64, i64, i64, i64, i32, i32, i32) -> () loc("<stdin>":7:5)
    "llvm.return"() : () -> () loc("<stdin>":8:5)
  }) : () -> () loc("<stdin>":3:3)
}) {gpu.container_module} : () -> () loc("<stdin>":1:1)
