"builtin.module"() ({
  "gpu.module"() <{sym_name = "kernel_module", targets = [#nvvm.target]}> ({
    "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (i32, ptr, ptr, i64, i64, i64)>, linkage = #llvm.linkage<external>, sym_name = "kernel", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    ^bb0(%arg1: i32 loc("<stdin>":4:10), %arg2: !llvm.ptr loc("<stdin>":4:22), %arg3: !llvm.ptr loc("<stdin>":4:40), %arg4: i64 loc("<stdin>":4:58), %arg5: i64 loc("<stdin>":4:70), %arg6: i64 loc("<stdin>":4:82)):
      "llvm.return"() : () -> () loc("<stdin>":5:7)
    }) {gpu.kernel} : () -> () loc("<stdin>":3:5)
  }) : () -> () loc("<stdin>":2:3)
  "func.func"() <{function_type = (memref<?xf32>) -> (), sym_name = "foo"}> ({
  ^bb0(%arg0: memref<?xf32> loc("<stdin>":9:8)):
    %0 = "arith.constant"() <{value = 8 : index}> : () -> index loc("<stdin>":10:10)
    %1 = "arith.constant"() <{value = 32 : i32}> : () -> i32 loc("<stdin>":11:10)
    %2 = "arith.constant"() <{value = 256 : i32}> : () -> i32 loc("<stdin>":12:10)
    "gpu.launch_func"(%0, %0, %0, %0, %0, %0, %2, %1, %arg0) <{kernel = @kernel_module::@kernel, operandSegmentSizes = array<i32: 0, 1, 1, 1, 1, 1, 1, 0, 0, 0, 1, 2, 0>}> : (index, index, index, index, index, index, i32, i32, memref<?xf32>) -> () loc("<stdin>":13:5)
    "func.return"() : () -> () loc("<stdin>":14:5)
  }) : () -> () loc("<stdin>":8:3)
}) {gpu.container_module} : () -> () loc("<stdin>":1:1)
