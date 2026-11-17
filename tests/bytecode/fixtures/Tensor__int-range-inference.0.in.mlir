"builtin.module"() ({
  "func.func"() <{function_type = (tensor<3x5xi32>) -> index, sym_name = "dim_const"}> ({
  ^bb0(%arg0: tensor<3x5xi32> loc("<stdin>":3:8)):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":4:10)
    %1 = "tensor.dim"(%arg0, %0) : (tensor<3x5xi32>, index) -> index loc("<stdin>":5:10)
    "func.return"(%1) : (index) -> () loc("<stdin>":6:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
