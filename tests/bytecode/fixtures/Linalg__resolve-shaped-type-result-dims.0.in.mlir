"builtin.module"() ({
  "func.func"() <{function_type = () -> (index, index), sym_name = "empty_tensor_static_dim"}> ({
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":3:10)
    %1 = "arith.constant"() <{value = 2 : index}> : () -> index loc("<stdin>":4:10)
    %2 = "arith.constant"() <{value = 6 : index}> : () -> index loc("<stdin>":5:10)
    %3 = "tensor.empty"(%2) : (index) -> tensor<4x5x?xf32> loc("<stdin>":6:10)
    %4 = "tensor.dim"(%3, %1) : (tensor<4x5x?xf32>, index) -> index loc("<stdin>":7:10)
    %5 = "tensor.dim"(%3, %0) : (tensor<4x5x?xf32>, index) -> index loc("<stdin>":8:10)
    "func.return"(%4, %5) : (index, index) -> () loc("<stdin>":9:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
