"builtin.module"() ({
  "func.func"() <{function_type = (memref<?xi32>) -> (), sym_name = "yield_launch_token"}> ({
  ^bb0(%arg5: memref<?xi32> loc("<stdin>":3:8)):
    %0 = "arith.constant"() <{value = 1 : index}> : () -> index loc("<stdin>":4:10)
    %1:2 = "async.execute"() <{operandSegmentSizes = array<i32: 0, 0>}> ({
      %2 = "gpu.wait"() : () -> !gpu.async.token loc("<stdin>":6:12)
      %3 = "gpu.launch_func"(%2, %0, %0, %0, %0, %0, %0, %arg5) <{kernel = @kmod::@kernel, operandSegmentSizes = array<i32: 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 1, 0>}> : (!gpu.async.token, index, index, index, index, index, index, memref<?xi32>) -> !gpu.async.token loc("<stdin>":7:12)
      "async.yield"(%3) : (!gpu.async.token) -> () loc("<stdin>":8:7)
    }) : () -> (!async.token, !async.value<!gpu.async.token>) loc("<stdin>":5:12)
    "func.return"() : () -> () loc("<stdin>":10:5)
  }) : () -> () loc("<stdin>":2:3)
  "gpu.module"() <{sym_name = "kmod", targets = [#nvvm.target]}> ({
    "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr, ptr, i64, i64, i64)>, linkage = #llvm.linkage<external>, sym_name = "kernel", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    ^bb0(%arg0: !llvm.ptr loc("<stdin>":14:10), %arg1: !llvm.ptr loc("<stdin>":14:28), %arg2: i64 loc("<stdin>":14:46), %arg3: i64 loc("<stdin>":14:58), %arg4: i64 loc("<stdin>":14:70)):
      "llvm.return"() : () -> () loc("<stdin>":15:7)
    }) {gpu.kernel, nvvm.kernel} : () -> () loc("<stdin>":13:5)
  }) : () -> () loc("<stdin>":12:3)
}) {gpu.container_module} : () -> () loc("<stdin>":1:1)
