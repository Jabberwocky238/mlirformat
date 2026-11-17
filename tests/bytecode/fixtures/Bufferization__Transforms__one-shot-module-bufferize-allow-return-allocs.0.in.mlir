"builtin.module"() ({
  "func.func"() <{function_type = () -> tensor<10xf32>, sym_name = "create_tensor"}> ({
    %2 = "bufferization.alloc_tensor"() <{operandSegmentSizes = array<i32: 0, 0, 0>}> : () -> tensor<10xf32> loc("<stdin>":3:10)
    "func.return"(%2) : (tensor<10xf32>) -> () loc("<stdin>":4:5)
  }) : () -> () loc("<stdin>":2:3)
  "func.func"() <{function_type = (index) -> f32, sym_name = "caller"}> ({
  ^bb0(%arg0: index loc("<stdin>":7:8)):
    %0 = "func.call"() <{callee = @create_tensor}> : () -> tensor<10xf32> loc("<stdin>":8:10)
    %1 = "tensor.extract"(%0, %arg0) : (tensor<10xf32>, index) -> f32 loc("<stdin>":9:10)
    "func.return"(%1) : (f32) -> () loc("<stdin>":10:5)
  }) : () -> () loc("<stdin>":6:3)
}) : () -> () loc("<stdin>":1:1)
