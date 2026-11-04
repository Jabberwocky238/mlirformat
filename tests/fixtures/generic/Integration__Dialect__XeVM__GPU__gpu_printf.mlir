"builtin.module"() <{sym_name = "test"}> ({
  "gpu.module"() <{sym_name = "test_module"}> ({
    "gpu.func"() <{function_type = (i32, f32) -> ()}> ({
    ^bb0(%arg0: i32, %arg1: f32):
      "gpu.printf"(%arg0) <{format = "Hello: %d\0A"}> : (i32) -> ()
      "gpu.printf"(%arg1) <{format = "Hello: %f\0A"}> : (f32) -> ()
      "gpu.return"() : () -> ()
    }) {gpu.kernel, sym_name = "test_printf", workgroup_attributions = 0 : i64} : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "main"}> ({
    %0 = "arith.constant"() <{value = 1 : index}> : () -> index
    %1 = "arith.constant"() <{value = 11 : i32}> : () -> i32
    %2 = "arith.constant"() <{value = 4.000000e+00 : f32}> : () -> f32
    "gpu.launch_func"(%0, %0, %0, %0, %0, %0, %1, %2) <{kernel = @test_module::@test_printf, operandSegmentSizes = array<i32: 0, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 2, 0>}> : (index, index, index, index, index, index, i32, f32) -> ()
    "func.return"() : () -> ()
  }) {llvm.emit_c_interface} : () -> ()
}) {gpu.container_module} : () -> ()

