"builtin.module"() ({
  "gpu.module"() <{sym_name = "test_module"}> ({
    "gpu.func"() <{function_type = (i32) -> ()}> ({
    ^bb0(%arg0: i32 loc("<stdin>":4:10)):
      "gpu.printf"(%arg0) <{format = "Hello: %d\0A"}> : (i32) -> () loc("<stdin>":5:7)
      "gpu.return"() : () -> () loc("<stdin>":6:7)
    }) {sym_name = "test_printf"} : () -> () loc("<stdin>":3:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
