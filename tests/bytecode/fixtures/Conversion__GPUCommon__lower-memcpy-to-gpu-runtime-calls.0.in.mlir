"builtin.module"() ({
  "func.func"() <{function_type = (memref<7xf32, 1>, memref<7xf32>) -> (), sym_name = "foo"}> ({
  ^bb0(%arg0: memref<7xf32, 1> loc("<stdin>":3:8), %arg1: memref<7xf32> loc("<stdin>":3:33)):
    %0 = "gpu.wait"() : () -> !gpu.async.token loc("<stdin>":4:10)
    %1 = "gpu.memcpy"(%0, %arg0, %arg1) : (!gpu.async.token, memref<7xf32, 1>, memref<7xf32>) -> !gpu.async.token loc("<stdin>":5:10)
    "gpu.wait"(%1) : (!gpu.async.token) -> () loc("<stdin>":6:5)
    "func.return"() : () -> () loc("<stdin>":7:5)
  }) : () -> () loc("<stdin>":2:3)
}) {gpu.container_module} : () -> () loc("<stdin>":1:1)
