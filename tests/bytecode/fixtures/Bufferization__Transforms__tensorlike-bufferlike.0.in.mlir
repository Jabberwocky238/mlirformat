"builtin.module"() ({
  "func.func"() <{function_type = (tensor<*xf32>) -> memref<*xf32>, sym_name = "builtin_unranked"}> ({
  ^bb0(%arg0: tensor<*xf32> loc("<stdin>":3:8)):
    %0 = "bufferization.to_buffer"(%arg0) : (tensor<*xf32>) -> memref<*xf32> loc("<stdin>":4:10)
    "func.return"(%0) : (memref<*xf32>) -> () loc("<stdin>":5:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
