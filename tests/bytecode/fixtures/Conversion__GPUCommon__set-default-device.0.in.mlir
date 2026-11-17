"builtin.module"() ({
  "func.func"() <{function_type = (i32) -> (), sym_name = "set_default_device"}> ({
  ^bb0(%arg0: i32 loc("<stdin>":3:8)):
    "gpu.set_default_device"(%arg0) : (i32) -> () loc("<stdin>":4:5)
    "func.return"() : () -> () loc("<stdin>":5:5)
  }) : () -> () loc("<stdin>":2:3)
}) {gpu.container_module} : () -> () loc("<stdin>":1:1)
