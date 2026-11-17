"builtin.module"() ({
  "func.func"() <{function_type = (tensor<5xf32>) -> tensor<5xf32>, sym_name = "expand_shape_identity_fold"}> ({
  ^bb0(%arg0: tensor<5xf32> loc("<stdin>":3:8)):
    %0 = "tensor.expand_shape"(%arg0) <{reassociation = [[0]], static_output_shape = array<i64: 5>}> : (tensor<5xf32>) -> tensor<5xf32> loc("<stdin>":4:10)
    "func.return"(%0) : (tensor<5xf32>) -> () loc("<stdin>":5:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
