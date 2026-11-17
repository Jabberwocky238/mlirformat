"builtin.module"() ({
  "func.func"() <{function_type = (f32, f32, index) -> f32, sym_name = "unknown_op_aliasing"}> ({
  ^bb0(%arg0: f32 loc("<stdin>":3:8), %arg1: f32 loc("<stdin>":3:20), %arg2: index loc("<stdin>":3:32)):
    %0 = "tensor.empty"() : () -> tensor<10xf32> loc("<stdin>":4:10)
    %1 = "linalg.fill"(%arg0, %0) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg5: f32 loc("<stdin>":6:10), %arg6: f32 loc("<stdin>":6:22)):
      "linalg.yield"(%arg5) : (f32) -> () loc("<stdin>":7:7)
    }) : (f32, tensor<10xf32>) -> tensor<10xf32> loc("<stdin>":5:10)
    %2 = "dummy.dummy_op"(%1) : (tensor<10xf32>) -> tensor<10xf32> loc("<stdin>":9:10)
    %3 = "linalg.fill"(%arg1, %1) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg3: f32 loc("<stdin>":11:10), %arg4: f32 loc("<stdin>":11:22)):
      "linalg.yield"(%arg3) : (f32) -> () loc("<stdin>":12:7)
    }) : (f32, tensor<10xf32>) -> tensor<10xf32> loc("<stdin>":10:10)
    %4 = "tensor.extract"(%2, %arg2) : (tensor<10xf32>, index) -> f32 loc("<stdin>":14:10)
    "func.return"(%4) : (f32) -> () loc("<stdin>":15:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
