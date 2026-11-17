"builtin.module"() ({
  "builtin.module"() ({
    "func.func"() <{function_type = (memref<7xf32, 1>, f32) -> (), sym_name = "foo"}> ({
    ^bb0(%arg2: memref<7xf32, 1> loc("<stdin>":4:10), %arg3: f32 loc("<stdin>":4:35)):
      %2 = "gpu.wait"() : () -> !gpu.async.token loc("<stdin>":5:12)
      %3 = "gpu.memset"(%2, %arg2, %arg3) : (!gpu.async.token, memref<7xf32, 1>, f32) -> !gpu.async.token loc("<stdin>":6:12)
      "gpu.wait"(%3) : (!gpu.async.token) -> () loc("<stdin>":7:7)
      "func.return"() : () -> () loc("<stdin>":8:7)
    }) : () -> () loc("<stdin>":3:5)
  }) {gpu.container_module} : () -> () loc("<stdin>":2:3)
  "builtin.module"() ({
    "func.func"() <{function_type = (memref<7xf16, 1>, f16) -> (), sym_name = "foo16"}> ({
    ^bb0(%arg0: memref<7xf16, 1> loc("<stdin>":13:10), %arg1: f16 loc("<stdin>":13:35)):
      %0 = "gpu.wait"() : () -> !gpu.async.token loc("<stdin>":14:12)
      %1 = "gpu.memset"(%0, %arg0, %arg1) : (!gpu.async.token, memref<7xf16, 1>, f16) -> !gpu.async.token loc("<stdin>":15:12)
      "gpu.wait"(%1) : (!gpu.async.token) -> () loc("<stdin>":16:7)
      "func.return"() : () -> () loc("<stdin>":17:7)
    }) : () -> () loc("<stdin>":12:5)
  }) {gpu.container_module} : () -> () loc("<stdin>":11:3)
}) : () -> () loc("<stdin>":1:1)
