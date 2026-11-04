"builtin.module"() ({
  "gpu.module"() <{sym_name = "kernels"}> ({
    "gpu.func"() <{function_type = () -> ()}> ({
      %2 = "gpu.thread_id"() <{dimension = #gpu<dim x>}> : () -> index
      "gpu.printf"(%2) <{format = "Hello from %d\0A"}> : (index) -> ()
      "gpu.return"() : () -> ()
    }) {gpu.kernel, sym_name = "hello", workgroup_attributions = 0 : i64} : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "main"}> ({
    %0 = "arith.constant"() <{value = 2 : index}> : () -> index
    %1 = "arith.constant"() <{value = 1 : index}> : () -> index
    "gpu.launch_func"(%1, %1, %1, %0, %1, %1) <{kernel = @kernels::@hello, operandSegmentSizes = array<i32: 0, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0>}> : (index, index, index, index, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) {gpu.container_module} : () -> ()

