"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "fold_wait_op_test1"}> ({
    %0 = "gpu.wait"() : () -> !gpu.async.token loc("<stdin>":3:10)
    "gpu.wait"() : () -> () loc("<stdin>":4:5)
    %1 = "gpu.wait"() : () -> !gpu.async.token loc("<stdin>":5:10)
    "gpu.wait"(%1) : (!gpu.async.token) -> () loc("<stdin>":6:5)
    "func.return"() : () -> () loc("<stdin>":7:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
