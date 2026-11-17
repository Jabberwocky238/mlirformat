"builtin.module"() <{sym_name = "test"}> ({
  "gpu.module"() <{sym_name = "test_module"}> ({
    "gpu.func"() <{function_type = (i32, f32) -> (), kernel}> ({
    ^bb0(%arg0: i32 loc("<stdin>":4:10), %arg1: f32 loc("<stdin>":4:22)):
      "gpu.printf"(%arg0) <{format = "Hello: %d\0A"}> : (i32) -> () loc("<stdin>":5:7)
      "gpu.printf"(%arg1) <{format = "Hello: %f\0A"}> : (f32) -> () loc("<stdin>":6:7)
      "gpu.return"() : () -> () loc("<stdin>":7:7)
    }) {sym_name = "test_printf"} : () -> () loc("<stdin>":3:5)
  }) : () -> () loc("<stdin>":2:3)
  "func.func"() <{function_type = () -> (), sym_name = "main"}> ({
    %0 = "arith.constant"() <{value = 1 : index}> : () -> index loc("<stdin>":11:10)
    %1 = "arith.constant"() <{value = 11 : i32}> : () -> i32 loc("<stdin>":12:10)
    %2 = "arith.constant"() <{value = 4.000000e+00 : f32}> : () -> f32 loc("<stdin>":13:10)
    "gpu.launch_func"(%0, %0, %0, %0, %0, %0, %1, %2) <{kernel = @test_module::@test_printf, operandSegmentSizes = array<i32: 0, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 2, 0>}> : (index, index, index, index, index, index, i32, f32) -> () loc("<stdin>":14:5)
    "func.return"() : () -> () loc("<stdin>":15:5)
  }) {llvm.emit_c_interface} : () -> () loc("<stdin>":10:3)
}) {gpu.container_module} : () -> () loc("<stdin>":1:1)
