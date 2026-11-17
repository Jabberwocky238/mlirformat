"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?xf32>) -> tensor<?xf32>, sym_name = "tensor_load_of_buffer_cast"}> ({
  ^bb0(%arg0: tensor<?xf32> loc("<stdin>":3:8)):
    %0 = "bufferization.to_buffer"(%arg0) : (tensor<?xf32>) -> memref<?xf32> loc("<stdin>":4:10)
    %1 = "bufferization.to_tensor"(%0) : (memref<?xf32>) -> tensor<?xf32> loc("<stdin>":5:10)
    "func.return"(%1) : (tensor<?xf32>) -> () loc("<stdin>":6:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
