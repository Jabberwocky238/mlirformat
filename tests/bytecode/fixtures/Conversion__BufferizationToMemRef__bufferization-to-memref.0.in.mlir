"builtin.module"() ({
  "func.func"() <{function_type = (memref<2xf32>) -> memref<2xf32>, sym_name = "conversion_static"}> ({
  ^bb0(%arg0: memref<2xf32> loc("<stdin>":3:8)):
    %0 = "bufferization.clone"(%arg0) : (memref<2xf32>) -> memref<2xf32> loc("<stdin>":4:10)
    "memref.dealloc"(%arg0) : (memref<2xf32>) -> () loc("<stdin>":5:5)
    "func.return"(%0) : (memref<2xf32>) -> () loc("<stdin>":6:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
