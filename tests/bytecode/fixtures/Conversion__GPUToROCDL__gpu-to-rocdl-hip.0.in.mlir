"builtin.module"() ({
  "gpu.module"() <{sym_name = "test_module"}> ({
    "gpu.func"() <{function_type = () -> ()}> ({
      "gpu.printf"() <{format = "Hello, world\0A"}> : () -> () loc("<stdin>":4:7)
      "gpu.return"() : () -> () loc("<stdin>":5:7)
    }) {sym_name = "test_const_printf"} : () -> () loc("<stdin>":3:5)
    "gpu.func"() <{function_type = (i32) -> ()}> ({
    ^bb0(%arg0: i32 loc("<stdin>":8:10)):
      "gpu.printf"(%arg0) <{format = "Hello: %d\0A"}> : (i32) -> () loc("<stdin>":9:7)
      "gpu.return"() : () -> () loc("<stdin>":10:7)
    }) {sym_name = "test_printf"} : () -> () loc("<stdin>":7:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
