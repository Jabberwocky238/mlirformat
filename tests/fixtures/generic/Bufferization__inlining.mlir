"builtin.module"() ({
  "func.func"() <{function_type = (memref<*xf32>) -> (memref<*xf32>, i1), sym_name = "test_inline"}> ({
  ^bb0(%arg1: memref<*xf32>):
    %3:2 = "func.call"(%arg1) <{callee = @inner_func}> : (memref<*xf32>) -> (memref<*xf32>, i1)
    "func.return"(%3#0, %3#1) : (memref<*xf32>, i1) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<*xf32>) -> (memref<*xf32>, i1), sym_name = "inner_func"}> ({
  ^bb0(%arg0: memref<*xf32>):
    %0 = "arith.constant"() <{value = true}> : () -> i1
    %1 = "bufferization.clone"(%arg0) : (memref<*xf32>) -> memref<*xf32>
    %2 = "bufferization.dealloc"(%arg0, %0, %1) <{operandSegmentSizes = array<i32: 1, 1, 1>}> : (memref<*xf32>, i1, memref<*xf32>) -> i1
    "func.return"(%1, %2) : (memref<*xf32>, i1) -> ()
  }) : () -> ()
}) : () -> ()

