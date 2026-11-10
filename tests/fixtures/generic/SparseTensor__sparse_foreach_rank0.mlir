"builtin.module"() ({
  "func.func"() <{function_type = (tensor<i32>) -> (), sym_name = "foreach_scalar_no_reduc"}> ({
  ^bb0(%arg4: tensor<i32>):
    "sparse_tensor.foreach"(%arg4) ({
    ^bb0(%arg5: i32):
      "sparse_tensor.yield"() : () -> ()
    }) : (tensor<i32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<i32>, i32) -> i32, sym_name = "foreach_scalar_with_reduc"}> ({
  ^bb0(%arg0: tensor<i32>, %arg1: i32):
    %0 = "sparse_tensor.foreach"(%arg0, %arg1) ({
    ^bb0(%arg2: i32, %arg3: i32):
      "sparse_tensor.yield"(%arg2) : (i32) -> ()
    }) : (tensor<i32>, i32) -> i32
    "func.return"(%0) : (i32) -> ()
  }) : () -> ()
}) : () -> ()

