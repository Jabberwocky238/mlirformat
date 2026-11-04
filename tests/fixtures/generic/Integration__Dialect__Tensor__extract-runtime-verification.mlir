"builtin.module"() ({
  "func.func"() <{function_type = (tensor<1xf32>, index) -> (), sym_name = "extract"}> ({
  ^bb0(%arg6: tensor<1xf32>, %arg7: index):
    %9 = "tensor.extract"(%arg6, %arg7) : (tensor<1xf32>, index) -> f32
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<?xf32>, index) -> (), sym_name = "extract_dynamic"}> ({
  ^bb0(%arg4: tensor<?xf32>, %arg5: index):
    %8 = "tensor.extract"(%arg4, %arg5) : (tensor<?xf32>, index) -> f32
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<?x?x?xf32>, index, index, index) -> (), sym_name = "extract_nd_dynamic"}> ({
  ^bb0(%arg0: tensor<?x?x?xf32>, %arg1: index, %arg2: index, %arg3: index):
    %7 = "tensor.extract"(%arg0, %arg1, %arg2, %arg3) : (tensor<?x?x?xf32>, index, index, index) -> f32
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "main"}> ({
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = 1 : index}> : () -> index
    %2 = "arith.constant"() <{value = -1 : index}> : () -> index
    %3 = "arith.constant"() <{value = 2 : index}> : () -> index
    %4 = "tensor.empty"() : () -> tensor<1xf32>
    %5 = "tensor.empty"(%1) : (index) -> tensor<?xf32>
    %6 = "tensor.empty"(%3, %3, %3) : (index, index, index) -> tensor<?x?x?xf32>
    "func.call"(%4, %1) <{callee = @extract}> : (tensor<1xf32>, index) -> ()
    "func.call"(%5, %1) <{callee = @extract_dynamic}> : (tensor<?xf32>, index) -> ()
    "func.call"(%6, %1, %2, %0) <{callee = @extract_nd_dynamic}> : (tensor<?x?x?xf32>, index, index, index) -> ()
    "func.call"(%4, %0) <{callee = @extract}> : (tensor<1xf32>, index) -> ()
    "func.call"(%5, %0) <{callee = @extract_dynamic}> : (tensor<?xf32>, index) -> ()
    "func.call"(%6, %1, %1, %0) <{callee = @extract_nd_dynamic}> : (tensor<?x?x?xf32>, index, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

