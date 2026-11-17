"builtin.module"() ({
  "func.func"() <{arg_attrs = [{bufferization.writable = true}], function_type = (tensor<?xf32>) -> tensor<?xf32>, sym_name = "fill_inplace", sym_visibility = "private"}> ({
  ^bb0(%arg0: tensor<?xf32> loc("<stdin>":3:8)):
    %0 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32 loc("<stdin>":4:10)
    %1 = "linalg.fill"(%0, %arg0) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg1: f32 loc("<stdin>":6:10), %arg2: f32 loc("<stdin>":6:22)):
      "linalg.yield"(%arg1) : (f32) -> () loc("<stdin>":7:7)
    }) : (f32, tensor<?xf32>) -> tensor<?xf32> loc("<stdin>":5:10)
    "func.return"(%1) : (tensor<?xf32>) -> () loc("<stdin>":9:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
