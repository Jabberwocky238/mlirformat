"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "foo"}> ({
    %0 = "gpu.wait"() : () -> !gpu.async.token loc("<stdin>":3:10)
    %1 = "gpu.wait"(%0) : (!gpu.async.token) -> !gpu.async.token loc("<stdin>":4:10)
    "gpu.wait"(%0, %1) : (!gpu.async.token, !gpu.async.token) -> () loc("<stdin>":5:5)
    "func.return"() : () -> () loc("<stdin>":6:5)
  }) : () -> () loc("<stdin>":2:3)
}) {gpu.container_module} : () -> () loc("<stdin>":1:1)
