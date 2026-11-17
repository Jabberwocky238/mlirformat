"builtin.module"() ({
  "func.func"() <{function_type = (memref<9x4x5x7xf32>, memref<9x4x5x7xf32>) -> (), sym_name = "copying"}> ({
  ^bb0(%arg0: memref<9x4x5x7xf32> loc("<stdin>":3:8), %arg1: memref<9x4x5x7xf32> loc("<stdin>":3:36)):
    "memref.copy"(%arg0, %arg1) : (memref<9x4x5x7xf32>, memref<9x4x5x7xf32>) -> () loc("<stdin>":4:5)
    "func.return"() : () -> () loc("<stdin>":5:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
