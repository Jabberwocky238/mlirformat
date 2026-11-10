"builtin.module"() ({
  "gpu.module"() <{sym_name = "kernels"}> ({
    "gpu.func"() <{function_type = (f32) -> (), kernel}> ({
    ^bb0(%arg2: f32):
      "gpu.return"() : () -> ()
    }) {sym_name = "kernel_1"} : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (index, f32) -> (), sym_name = "launch_func_kernel_operand_types"}> ({
  ^bb0(%arg0: index, %arg1: f32):
    "gpu.launch_func"(%arg0, %arg0, %arg0, %arg0, %arg0, %arg0, %arg1) <{kernel = @kernels::@kernel_1, operandSegmentSizes = array<i32: 0, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 1, 0>}> : (index, index, index, index, index, index, f32) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) {gpu.container_module} : () -> ()

