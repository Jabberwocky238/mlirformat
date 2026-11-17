"builtin.module"() ({
  "func.func"() <{function_type = (memref<f32>) -> memref<f32>, sym_name = "f", sym_visibility = "private"}> ({
  }) : () -> () loc("<stdin>":3:3)
  "func.func"() <{function_type = (memref<f32>) -> memref<f32>, sym_name = "g"}> ({
  ^bb0(%arg0: memref<f32> loc("<stdin>":6:8)):
    %0 = "func.call"(%arg0) <{callee = @f}> : (memref<f32>) -> memref<f32> loc("<stdin>":7:10)
    "func.return"(%0) : (memref<f32>) -> () loc("<stdin>":8:5)
  }) : () -> () loc("<stdin>":5:3)
}) : () -> () loc("<stdin>":2:1)
