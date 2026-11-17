"builtin.module"() ({
  "func.func"() <{function_type = (memref<f32>) -> memref<f32>, sym_name = "private_callee", sym_visibility = "private"}> ({
  ^bb0(%arg0: memref<f32> loc("<stdin>":4:8)):
    %3 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<f32> loc("<stdin>":5:10)
    "func.return"(%3) : (memref<f32>) -> () loc("<stdin>":6:5)
  }) : () -> () loc("<stdin>":3:3)
  "func.func"() <{function_type = () -> f32, sym_name = "caller"}> ({
    %0 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<f32> loc("<stdin>":9:10)
    %1 = "func.call"(%0) <{callee = @private_callee}> : (memref<f32>) -> memref<f32> loc("<stdin>":10:10)
    %2 = "memref.load"(%1) : (memref<f32>) -> f32 loc("<stdin>":11:10)
    "func.return"(%2) : (f32) -> () loc("<stdin>":12:5)
  }) : () -> () loc("<stdin>":8:3)
}) : () -> () loc("<stdin>":2:1)
