"builtin.module"() ({
  "gpu.module"() <{sym_name = "test_module_1"}> ({
    "gpu.func"() <{function_type = () -> ()}> ({
      "gpu.printf"() <{format = "Hello, world with location\0A"}> : () -> ()
      "gpu.return"() : () -> ()
    }) {sym_name = "test_const_printf_with_loc", workgroup_attributions = 0 : i64} : () -> ()
  }) : () -> ()
  "gpu.module"() <{sym_name = "test_module_2"}> ({
    "func.func"() <{function_type = (i32) -> i32, sym_name = "gpu_abs_with_loc"}> ({
    ^bb0(%arg0: i32):
      %0 = "math.absi"(%arg0) : (i32) -> i32
      "func.return"(%0) : (i32) -> ()
    }) : () -> ()
  }) : () -> ()
}) : () -> ()

