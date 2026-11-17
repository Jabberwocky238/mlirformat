"builtin.module"() ({
  "gpu.module"() <{sym_name = "foo"}> ({
    "gpu.func"() <{arg_attrs = [{gpu.test_promote_workgroup}], function_type = (memref<5x4xf32>) -> (), kernel}> ({
    ^bb0(%arg0: memref<5x4xf32> loc("<stdin>":4:10)):
      "use"(%arg0) : (memref<5x4xf32>) -> () loc("<stdin>":5:7)
      "gpu.return"() : () -> () loc("<stdin>":6:7)
    }) {sym_name = "memref3d"} : () -> () loc("<stdin>":3:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
