"builtin.module"() ({
  "gpu.module"() <{sym_name = "kernels"}> ({
    "gpu.func"() <{function_type = () -> (), kernel}> ({
      %2 = "gpu.thread_id"() <{dimension = #gpu<dim x>}> : () -> index
      %3 = "arith.constant"() <{value = 2 : i8}> : () -> i8
      %4 = "arith.constant"() <{value = 3.000000e+00 : f32}> : () -> f32
      "gpu.printf"(%2, %3, %4) <{format = "Hello from %lld, %d, %f\0A"}> : (index, i8, f32) -> ()
      "gpu.return"() : () -> ()
    }) {sym_name = "hello"} : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "main"}> ({
    %0 = "arith.constant"() <{value = 2 : index}> : () -> index
    %1 = "arith.constant"() <{value = 1 : index}> : () -> index
    "gpu.launch_func"(%1, %1, %1, %0, %1, %1) <{kernel = @kernels::@hello, operandSegmentSizes = array<i32: 0, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0>}> : (index, index, index, index, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) {gpu.container_module} : () -> ()

