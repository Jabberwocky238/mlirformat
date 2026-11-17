"builtin.module"() ({
  "func.func"() <{function_type = (tensor<2x3x4xf32>) -> tensor<3xindex>, sym_name = "f"}> ({
  ^bb0(%arg0: tensor<2x3x4xf32> loc("<stdin>":3:8)):
    %0 = "shape.shape_of"(%arg0) : (tensor<2x3x4xf32>) -> tensor<3xindex> loc("<stdin>":4:10)
    "func.return"(%0) : (tensor<3xindex>) -> () loc("<stdin>":5:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
