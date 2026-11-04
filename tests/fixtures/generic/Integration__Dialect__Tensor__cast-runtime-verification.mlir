"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?xf32>) -> tensor<10xf32>, sym_name = "cast_to_static_dim", sym_visibility = "private"}> ({
  ^bb0(%arg2: tensor<?xf32>):
    %8 = "tensor.cast"(%arg2) : (tensor<?xf32>) -> tensor<10xf32>
    "func.return"(%8) : (tensor<10xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<*xf32>) -> tensor<f32>, sym_name = "cast_to_ranked", sym_visibility = "private"}> ({
  ^bb0(%arg1: tensor<*xf32>):
    %7 = "tensor.cast"(%arg1) : (tensor<*xf32>) -> tensor<f32>
    "func.return"(%7) : (tensor<f32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<*xf32>) -> tensor<?xf32>, sym_name = "valid_cast", sym_visibility = "private"}> ({
  ^bb0(%arg0: tensor<*xf32>):
    %6 = "tensor.cast"(%arg0) : (tensor<*xf32>) -> tensor<?xf32>
    "func.return"(%6) : (tensor<?xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "main"}> ({
    %0 = "tensor.empty"() : () -> tensor<5xf32>
    %1 = "tensor.cast"(%0) : (tensor<5xf32>) -> tensor<?xf32>
    %2 = "func.call"(%1) <{callee = @cast_to_static_dim}> : (tensor<?xf32>) -> tensor<10xf32>
    %3 = "tensor.cast"(%0) : (tensor<5xf32>) -> tensor<*xf32>
    %4 = "func.call"(%3) <{callee = @cast_to_ranked}> : (tensor<*xf32>) -> tensor<f32>
    %5 = "func.call"(%3) <{callee = @valid_cast}> : (tensor<*xf32>) -> tensor<?xf32>
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

