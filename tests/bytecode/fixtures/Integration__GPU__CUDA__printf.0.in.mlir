"builtin.module"() ({
  "gpu.module"() <{sym_name = "kernels"}> ({
    "gpu.func"() <{function_type = () -> (), kernel}> ({
      %2 = "gpu.thread_id"() <{dimension = #gpu<dim x>}> : () -> index loc("<stdin>":4:12)
      %3 = "arith.constant"() <{value = 2 : i8}> : () -> i8 loc("<stdin>":5:12)
      %4 = "arith.constant"() <{value = 3.000000e+00 : f32}> : () -> f32 loc("<stdin>":6:12)
      "gpu.printf"(%2, %3, %4) <{format = "Hello from %lld, %d, %f\0A"}> : (index, i8, f32) -> () loc("<stdin>":7:7)
      "gpu.return"() : () -> () loc("<stdin>":8:7)
    }) {sym_name = "hello"} : () -> () loc("<stdin>":3:5)
  }) : () -> () loc("<stdin>":2:3)
  "func.func"() <{function_type = () -> (), sym_name = "main"}> ({
    %0 = "arith.constant"() <{value = 2 : index}> : () -> index loc("<stdin>":12:10)
    %1 = "arith.constant"() <{value = 1 : index}> : () -> index loc("<stdin>":13:10)
    "gpu.launch_func"(%1, %1, %1, %0, %1, %1) <{kernel = @kernels::@hello, operandSegmentSizes = array<i32: 0, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0>}> : (index, index, index, index, index, index) -> () loc("<stdin>":14:5)
    "func.return"() : () -> () loc("<stdin>":15:5)
  }) : () -> () loc("<stdin>":11:3)
}) {gpu.container_module} : () -> () loc("<stdin>":1:1)
