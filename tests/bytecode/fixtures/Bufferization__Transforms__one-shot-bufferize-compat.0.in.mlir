"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?xf32>) -> (f32, f32), sym_name = "out_of_place_bufferization"}> ({
  ^bb0(%arg0: tensor<?xf32> loc("<stdin>":3:8)):
    %0 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32 loc("<stdin>":4:10)
    %1 = "arith.constant"() <{value = 5 : index}> : () -> index loc("<stdin>":5:10)
    %2 = "tensor.insert"(%0, %arg0, %1) : (f32, tensor<?xf32>, index) -> tensor<?xf32> loc("<stdin>":6:10)
    %3 = "tensor.extract"(%arg0, %1) : (tensor<?xf32>, index) -> f32 loc("<stdin>":7:10)
    %4 = "tensor.extract"(%2, %1) : (tensor<?xf32>, index) -> f32 loc("<stdin>":8:10)
    "func.return"(%3, %4) : (f32, f32) -> () loc("<stdin>":9:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
