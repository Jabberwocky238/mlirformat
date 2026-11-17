"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "main"}> ({
    %0 = "arith.constant"() <{value = 1 : index}> : () -> index loc("<stdin>":3:10)
    "gpu.launch_func"(%0, %0, %0, %0, %0, %0) <{kernel = @kernels::@printf, operandSegmentSizes = array<i32: 0, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0>}> : (index, index, index, index, index, index) -> () loc("<stdin>":4:5)
    "func.return"() : () -> () loc("<stdin>":5:5)
  }) : () -> () loc("<stdin>":2:3)
  "gpu.module"() <{sym_name = "kernels"}> ({
    "gpu.func"() <{function_type = () -> (), kernel}> ({
      "gpu.printf"() <{format = "\0AHello\0A"}> : () -> () loc("<stdin>":9:7)
      "gpu.return"() : () -> () loc("<stdin>":10:7)
    }) {spirv.entry_point_abi = #spirv.entry_point_abi<>, sym_name = "printf"} : () -> () loc("<stdin>":8:5)
  }) : () -> () loc("<stdin>":7:3)
}) {gpu.container_module, spirv.target_env = #spirv.target_env<#spirv.vce<v1.0, [Addresses, Int8, Kernel], []>, #spirv.resource_limits<>>} : () -> () loc("<stdin>":1:1)
