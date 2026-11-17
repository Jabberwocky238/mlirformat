"builtin.module"() ({
  "func.func"() <{function_type = (memref<*xf32>) -> (memref<*xf32>, i1), sym_name = "test_inline"}> ({
  ^bb0(%arg1: memref<*xf32> loc("<stdin>":3:8)):
    %3:2 = "func.call"(%arg1) <{callee = @inner_func}> : (memref<*xf32>) -> (memref<*xf32>, i1) loc("<stdin>":4:12)
    "func.return"(%3#0, %3#1) : (memref<*xf32>, i1) -> () loc("<stdin>":5:5)
  }) : () -> () loc("<stdin>":2:3)
  "func.func"() <{function_type = (memref<*xf32>) -> (memref<*xf32>, i1), sym_name = "inner_func"}> ({
  ^bb0(%arg0: memref<*xf32> loc("<stdin>":8:8)):
    %0 = "arith.constant"() <{value = true}> : () -> i1 loc("<stdin>":9:10)
    %1 = "bufferization.clone"(%arg0) : (memref<*xf32>) -> memref<*xf32> loc("<stdin>":10:10)
    %2 = "bufferization.dealloc"(%arg0, %0, %1) <{operandSegmentSizes = array<i32: 1, 1, 1>}> : (memref<*xf32>, i1, memref<*xf32>) -> i1 loc("<stdin>":11:10)
    "func.return"(%1, %2) : (memref<*xf32>, i1) -> () loc("<stdin>":12:5)
  }) : () -> () loc("<stdin>":7:3)
}) : () -> () loc("<stdin>":1:1)
