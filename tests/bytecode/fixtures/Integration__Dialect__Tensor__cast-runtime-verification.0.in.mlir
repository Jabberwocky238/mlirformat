"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?xf32>) -> tensor<10xf32>, sym_name = "cast_to_static_dim", sym_visibility = "private"}> ({
  ^bb0(%arg2: tensor<?xf32> loc("<stdin>":3:8)):
    %8 = "tensor.cast"(%arg2) : (tensor<?xf32>) -> tensor<10xf32> loc("<stdin>":4:10)
    "func.return"(%8) : (tensor<10xf32>) -> () loc("<stdin>":5:5)
  }) : () -> () loc("<stdin>":2:3)
  "func.func"() <{function_type = (tensor<*xf32>) -> tensor<f32>, sym_name = "cast_to_ranked", sym_visibility = "private"}> ({
  ^bb0(%arg1: tensor<*xf32> loc("<stdin>":8:8)):
    %7 = "tensor.cast"(%arg1) : (tensor<*xf32>) -> tensor<f32> loc("<stdin>":9:10)
    "func.return"(%7) : (tensor<f32>) -> () loc("<stdin>":10:5)
  }) : () -> () loc("<stdin>":7:3)
  "func.func"() <{function_type = (tensor<*xf32>) -> tensor<?xf32>, sym_name = "valid_cast", sym_visibility = "private"}> ({
  ^bb0(%arg0: tensor<*xf32> loc("<stdin>":13:8)):
    %6 = "tensor.cast"(%arg0) : (tensor<*xf32>) -> tensor<?xf32> loc("<stdin>":14:10)
    "func.return"(%6) : (tensor<?xf32>) -> () loc("<stdin>":15:5)
  }) : () -> () loc("<stdin>":12:3)
  "func.func"() <{function_type = () -> (), sym_name = "main"}> ({
    %0 = "tensor.empty"() : () -> tensor<5xf32> loc("<stdin>":18:10)
    %1 = "tensor.cast"(%0) : (tensor<5xf32>) -> tensor<?xf32> loc("<stdin>":19:10)
    %2 = "func.call"(%1) <{callee = @cast_to_static_dim}> : (tensor<?xf32>) -> tensor<10xf32> loc("<stdin>":20:10)
    %3 = "tensor.cast"(%0) : (tensor<5xf32>) -> tensor<*xf32> loc("<stdin>":21:10)
    %4 = "func.call"(%3) <{callee = @cast_to_ranked}> : (tensor<*xf32>) -> tensor<f32> loc("<stdin>":22:10)
    %5 = "func.call"(%3) <{callee = @valid_cast}> : (tensor<*xf32>) -> tensor<?xf32> loc("<stdin>":23:10)
    "func.return"() : () -> () loc("<stdin>":24:5)
  }) : () -> () loc("<stdin>":17:3)
}) : () -> () loc("<stdin>":1:1)
