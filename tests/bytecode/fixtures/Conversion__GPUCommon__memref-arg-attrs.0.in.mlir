"builtin.module"() ({
  "gpu.module"() <{sym_name = "kernel"}> ({
    "gpu.func"() <{arg_attrs = [{llvm.readonly}], function_type = (memref<f32>) -> ()}> ({
    ^bb0(%arg0: memref<f32> loc("<stdin>":4:10)):
      "gpu.return"() : () -> () loc("<stdin>":5:7)
    }) {sym_name = "test_func_readonly"} : () -> () loc("<stdin>":3:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
