"builtin.module"() ({
  "func.func"() <{function_type = (tensor<*xf32>, index) -> index, sym_name = "dim"}> ({
  ^bb0(%arg0: tensor<*xf32> loc("<stdin>":3:8), %arg1: index loc("<stdin>":3:30)):
    %0 = "tensor.dim"(%arg0, %arg1) : (tensor<*xf32>, index) -> index loc("<stdin>":4:10)
    "func.return"(%0) : (index) -> () loc("<stdin>":5:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
