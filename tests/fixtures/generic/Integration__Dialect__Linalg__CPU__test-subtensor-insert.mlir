"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "main"}> ({
    %0 = "arith.constant"() <{value = dense<1.000000e+01> : tensor<2xf32>}> : () -> tensor<2xf32>
    %1 = "arith.constant"() <{value = dense<2.000000e+01> : tensor<1xf32>}> : () -> tensor<1xf32>
    %2 = "tensor.insert_slice"(%1, %0) <{operandSegmentSizes = array<i32: 1, 1, 0, 0, 0>, static_offsets = array<i64: 0>, static_sizes = array<i64: 1>, static_strides = array<i64: 1>}> : (tensor<1xf32>, tensor<2xf32>) -> tensor<2xf32>
    %3 = "tensor.cast"(%2) : (tensor<2xf32>) -> tensor<*xf32>
    "func.call"(%3) <{callee = @printMemrefF32}> : (tensor<*xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<*xf32>) -> (), sym_name = "printMemrefF32", sym_visibility = "private"}> ({
  }) : () -> ()
}) : () -> ()

