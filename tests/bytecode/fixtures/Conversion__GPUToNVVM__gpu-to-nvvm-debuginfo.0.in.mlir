"builtin.module"() ({
  "gpu.module"() <{sym_name = "test_module_1"}> ({
    "gpu.func"() <{function_type = () -> ()}> ({
      "gpu.printf"() <{format = "Hello, world with location\0A"}> : () -> () loc("<stdin>":4:7)
      "gpu.return"() : () -> () loc("<stdin>":5:7)
    }) {sym_name = "test_const_printf_with_loc"} : () -> () loc("<stdin>":3:5)
  }) : () -> () loc("<stdin>":2:3)
  "gpu.module"() <{sym_name = "test_module_2"}> ({
    "func.func"() <{function_type = (i32) -> i32, sym_name = "gpu_abs_with_loc"}> ({
    ^bb0(%arg0: i32 loc("<stdin>":10:10)):
      %0 = "math.absi"(%arg0) : (i32) -> i32 loc("<stdin>":11:12)
      "func.return"(%0) : (i32) -> () loc("<stdin>":12:7)
    }) : () -> () loc("<stdin>":9:5)
  }) : () -> () loc("<stdin>":8:3)
}) : () -> () loc("<stdin>":1:1)
