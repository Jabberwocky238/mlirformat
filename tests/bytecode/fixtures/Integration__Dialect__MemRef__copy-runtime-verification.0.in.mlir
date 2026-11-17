"builtin.module"() ({
  "func.func"() <{function_type = (memref<?xf32>, memref<?xf32>) -> (), sym_name = "memcpy_helper"}> ({
  ^bb0(%arg0: memref<?xf32> loc("<stdin>":3:8), %arg1: memref<?xf32> loc("<stdin>":3:30)):
    "memref.copy"(%arg0, %arg1) : (memref<?xf32>, memref<?xf32>) -> () loc("<stdin>":4:5)
    "func.return"() : () -> () loc("<stdin>":5:5)
  }) : () -> () loc("<stdin>":2:3)
  "func.func"() <{function_type = () -> (), sym_name = "main"}> ({
    %0 = "memref.alloca"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<4xf32> loc("<stdin>":8:10)
    %1 = "memref.alloca"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<5xf32> loc("<stdin>":9:10)
    %2 = "memref.cast"(%0) : (memref<4xf32>) -> memref<?xf32> loc("<stdin>":10:10)
    %3 = "memref.cast"(%1) : (memref<5xf32>) -> memref<?xf32> loc("<stdin>":11:10)
    "func.call"(%2, %3) <{callee = @memcpy_helper}> : (memref<?xf32>, memref<?xf32>) -> () loc("<stdin>":12:5)
    "func.return"() : () -> () loc("<stdin>":13:5)
  }) : () -> () loc("<stdin>":7:3)
}) : () -> () loc("<stdin>":1:1)
