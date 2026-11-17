"builtin.module"() ({
  "func.func"() <{function_type = (tensor<1x1x8xi8>) -> (i8, i8), sym_name = "extract_from_collapse_shape"}> ({
  ^bb0(%arg0: tensor<1x1x8xi8> loc("<stdin>":3:8)):
    %0 = "arith.constant"() <{value = 1 : index}> : () -> index loc("<stdin>":4:10)
    %1 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":5:10)
    %2 = "tensor.collapse_shape"(%arg0) <{reassociation = [[0, 1, 2]]}> : (tensor<1x1x8xi8>) -> tensor<8xi8> loc("<stdin>":6:10)
    %3 = "tensor.extract"(%2, %1) : (tensor<8xi8>, index) -> i8 loc("<stdin>":7:10)
    %4 = "tensor.extract"(%2, %0) : (tensor<8xi8>, index) -> i8 loc("<stdin>":8:10)
    "func.return"(%3, %4) : (i8, i8) -> () loc("<stdin>":9:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
