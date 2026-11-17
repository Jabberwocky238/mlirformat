"builtin.module"() ({
  "gpu.module"() <{sym_name = "kernels"}> ({
    "gpu.func"() <{function_type = (f32) -> (), kernel}> ({
    ^bb0(%arg2: f32 loc("<stdin>":4:10)):
      "gpu.return"() : () -> () loc("<stdin>":5:7)
    }) {sym_name = "kernel_1"} : () -> () loc("<stdin>":3:5)
  }) : () -> () loc("<stdin>":2:3)
  "func.func"() <{function_type = (index, f32) -> (), sym_name = "launch_func_kernel_operand_types"}> ({
  ^bb0(%arg0: index loc("<stdin>":9:8), %arg1: f32 loc("<stdin>":9:22)):
    "gpu.launch_func"(%arg0, %arg0, %arg0, %arg0, %arg0, %arg0, %arg1) <{kernel = @kernels::@kernel_1, operandSegmentSizes = array<i32: 0, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 1, 0>}> : (index, index, index, index, index, index, f32) -> () loc("<stdin>":10:5)
    "func.return"() : () -> () loc("<stdin>":11:5)
  }) : () -> () loc("<stdin>":8:3)
}) {gpu.container_module} : () -> () loc("<stdin>":1:1)
