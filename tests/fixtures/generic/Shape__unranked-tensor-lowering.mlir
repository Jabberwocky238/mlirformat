"builtin.module"() ({
  "func.func"() <{function_type = (tensor<*xf32>) -> tensor<*xf32>, sym_name = "unranked_tensor_lowering"}> ({
  ^bb0(%arg0: tensor<*xf32>):
    %0 = "shape.shape_of"(%arg0) : (tensor<*xf32>) -> tensor<?xindex>
    %1 = "shape.num_elements"(%0) : (tensor<?xindex>) -> index
    %2 = "tensor.from_elements"(%1) : (index) -> tensor<1xindex>
    %3 = "tensor.reshape"(%arg0, %2) : (tensor<*xf32>, tensor<1xindex>) -> tensor<?xf32>
    %4 = "arith.constant"() <{value = 1.000000e+00 : f32}> : () -> f32
    %5 = "tensor.splat"(%4, %1) : (f32, index) -> tensor<?xf32>
    %6 = "arith.addf"(%3, %5) <{fastmath = #arith.fastmath<none>}> : (tensor<?xf32>, tensor<?xf32>) -> tensor<?xf32>
    %7 = "tensor.reshape"(%6, %0) : (tensor<?xf32>, tensor<?xindex>) -> tensor<*xf32>
    %8 = "shape.shape_of"(%7) : (tensor<*xf32>) -> tensor<?xindex>
    %9 = "shape.num_elements"(%8) : (tensor<?xindex>) -> index
    %10 = "tensor.from_elements"(%9) : (index) -> tensor<1xindex>
    %11 = "tensor.reshape"(%7, %10) : (tensor<*xf32>, tensor<1xindex>) -> tensor<?xf32>
    %12 = "arith.constant"() <{value = 2.000000e+00 : f32}> : () -> f32
    %13 = "tensor.splat"(%12, %9) : (f32, index) -> tensor<?xf32>
    %14 = "arith.mulf"(%11, %13) <{fastmath = #arith.fastmath<none>}> : (tensor<?xf32>, tensor<?xf32>) -> tensor<?xf32>
    %15 = "tensor.reshape"(%14, %8) : (tensor<?xf32>, tensor<?xindex>) -> tensor<*xf32>
    "func.return"(%15) : (tensor<*xf32>) -> ()
  }) : () -> ()
}) : () -> ()

