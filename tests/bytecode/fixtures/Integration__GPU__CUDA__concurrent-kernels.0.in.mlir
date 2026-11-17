"builtin.module"() ({
  "gpu.module"() <{sym_name = "kernels"}> ({
    "gpu.func"() <{function_type = (memref<i32>) -> (), kernel}> ({
    ^bb0(%arg0: memref<i32> loc("<stdin>":4:10)):
      %7 = "arith.constant"() <{value = 0 : i32}> : () -> i32 loc("<stdin>":5:12)
      %8 = "arith.constant"() <{value = 1 : i32}> : () -> i32 loc("<stdin>":6:12)
      %9 = "arith.constant"() <{value = 2 : i32}> : () -> i32 loc("<stdin>":7:12)
      %10 = "memref.atomic_rmw"(%8, %arg0) <{kind = 1 : i64}> : (i32, memref<i32>) -> i32 loc("<stdin>":8:13)
      "scf.while"() ({
        %11 = "memref.atomic_rmw"(%7, %arg0) <{kind = 1 : i64}> : (i32, memref<i32>) -> i32 loc("<stdin>":10:15)
        %12 = "arith.cmpi"(%11, %9) <{predicate = 2 : i64}> : (i32, i32) -> i1 loc("<stdin>":11:15)
        "scf.condition"(%12) : (i1) -> () loc("<stdin>":12:9)
      }, {
        "scf.yield"() : () -> () loc("<stdin>":14:9)
      }) : () -> () loc("<stdin>":9:7)
      "gpu.return"() : () -> () loc("<stdin>":16:7)
    }) {sym_name = "kernel"} : () -> () loc("<stdin>":3:5)
  }) : () -> () loc("<stdin>":2:3)
  "func.func"() <{function_type = () -> (), sym_name = "main"}> ({
    %0 = "arith.constant"() <{value = 0 : i32}> : () -> i32 loc("<stdin>":20:10)
    %1 = "arith.constant"() <{value = 1 : index}> : () -> index loc("<stdin>":21:10)
    %2 = "gpu.alloc"() <{hostShared, operandSegmentSizes = array<i32: 0, 0, 0>}> : () -> memref<i32> loc("<stdin>":22:10)
    "memref.store"(%0, %2) : (i32, memref<i32>) -> () loc("<stdin>":23:5)
    %3 = "gpu.wait"() : () -> !gpu.async.token loc("<stdin>":24:10)
    %4 = "gpu.wait"() : () -> !gpu.async.token loc("<stdin>":25:10)
    %5 = "gpu.launch_func"(%3, %1, %1, %1, %1, %1, %1, %2) <{kernel = @kernels::@kernel, operandSegmentSizes = array<i32: 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 1, 0>}> : (!gpu.async.token, index, index, index, index, index, index, memref<i32>) -> !gpu.async.token loc("<stdin>":26:10)
    %6 = "gpu.launch_func"(%4, %1, %1, %1, %1, %1, %1, %2) <{kernel = @kernels::@kernel, operandSegmentSizes = array<i32: 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 1, 0>}> : (!gpu.async.token, index, index, index, index, index, index, memref<i32>) -> !gpu.async.token loc("<stdin>":27:10)
    "gpu.wait"(%5, %6) : (!gpu.async.token, !gpu.async.token) -> () loc("<stdin>":28:5)
    "func.return"() : () -> () loc("<stdin>":29:5)
  }) : () -> () loc("<stdin>":19:3)
}) {gpu.container_module} : () -> () loc("<stdin>":1:1)
