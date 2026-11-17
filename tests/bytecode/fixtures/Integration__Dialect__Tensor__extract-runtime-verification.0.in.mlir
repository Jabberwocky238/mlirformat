"builtin.module"() ({
  "func.func"() <{function_type = (tensor<1xf32>, index) -> (), sym_name = "extract"}> ({
  ^bb0(%arg6: tensor<1xf32> loc("<stdin>":3:8), %arg7: index loc("<stdin>":3:30)):
    %9 = "tensor.extract"(%arg6, %arg7) : (tensor<1xf32>, index) -> f32 loc("<stdin>":4:10)
    "func.return"() : () -> () loc("<stdin>":5:5)
  }) : () -> () loc("<stdin>":2:3)
  "func.func"() <{function_type = (tensor<?xf32>, index) -> (), sym_name = "extract_dynamic"}> ({
  ^bb0(%arg4: tensor<?xf32> loc("<stdin>":8:8), %arg5: index loc("<stdin>":8:30)):
    %8 = "tensor.extract"(%arg4, %arg5) : (tensor<?xf32>, index) -> f32 loc("<stdin>":9:10)
    "func.return"() : () -> () loc("<stdin>":10:5)
  }) : () -> () loc("<stdin>":7:3)
  "func.func"() <{function_type = (tensor<?x?x?xf32>, index, index, index) -> (), sym_name = "extract_nd_dynamic"}> ({
  ^bb0(%arg0: tensor<?x?x?xf32> loc("<stdin>":13:8), %arg1: index loc("<stdin>":13:34), %arg2: index loc("<stdin>":13:48), %arg3: index loc("<stdin>":13:62)):
    %7 = "tensor.extract"(%arg0, %arg1, %arg2, %arg3) : (tensor<?x?x?xf32>, index, index, index) -> f32 loc("<stdin>":14:10)
    "func.return"() : () -> () loc("<stdin>":15:5)
  }) : () -> () loc("<stdin>":12:3)
  "func.func"() <{function_type = () -> (), sym_name = "main"}> ({
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":18:10)
    %1 = "arith.constant"() <{value = 1 : index}> : () -> index loc("<stdin>":19:10)
    %2 = "arith.constant"() <{value = -1 : index}> : () -> index loc("<stdin>":20:10)
    %3 = "arith.constant"() <{value = 2 : index}> : () -> index loc("<stdin>":21:10)
    %4 = "tensor.empty"() : () -> tensor<1xf32> loc("<stdin>":22:10)
    %5 = "tensor.empty"(%1) : (index) -> tensor<?xf32> loc("<stdin>":23:10)
    %6 = "tensor.empty"(%3, %3, %3) : (index, index, index) -> tensor<?x?x?xf32> loc("<stdin>":24:10)
    "func.call"(%4, %1) <{callee = @extract}> : (tensor<1xf32>, index) -> () loc("<stdin>":25:5)
    "func.call"(%5, %1) <{callee = @extract_dynamic}> : (tensor<?xf32>, index) -> () loc("<stdin>":26:5)
    "func.call"(%6, %1, %2, %0) <{callee = @extract_nd_dynamic}> : (tensor<?x?x?xf32>, index, index, index) -> () loc("<stdin>":27:5)
    "func.call"(%4, %0) <{callee = @extract}> : (tensor<1xf32>, index) -> () loc("<stdin>":28:5)
    "func.call"(%5, %0) <{callee = @extract_dynamic}> : (tensor<?xf32>, index) -> () loc("<stdin>":29:5)
    "func.call"(%6, %1, %1, %0) <{callee = @extract_nd_dynamic}> : (tensor<?x?x?xf32>, index, index, index) -> () loc("<stdin>":30:5)
    "func.return"() : () -> () loc("<stdin>":31:5)
  }) : () -> () loc("<stdin>":17:3)
}) : () -> () loc("<stdin>":1:1)
