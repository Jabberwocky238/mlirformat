"builtin.module"() ({
  "func.func"() <{function_type = (index) -> (), sym_name = "main"}> ({
  ^bb0(%arg2: index loc("<stdin>":3:8)):
    %4 = "gpu.wait"() : () -> !gpu.async.token loc("<stdin>":4:10)
    %5:2 = "gpu.alloc"(%4, %arg2) <{operandSegmentSizes = array<i32: 1, 1, 0>}> : (!gpu.async.token, index) -> (memref<?xf32>, !gpu.async.token) loc("<stdin>":5:12)
    %6 = "gpu.dealloc"(%5#1, %5#0) : (!gpu.async.token, memref<?xf32>) -> !gpu.async.token loc("<stdin>":6:10)
    "gpu.wait"(%6) : (!gpu.async.token) -> () loc("<stdin>":7:5)
    "func.return"() : () -> () loc("<stdin>":8:5)
  }) : () -> () loc("<stdin>":2:3)
  "func.func"() <{function_type = (index) -> (), sym_name = "alloc_dealloc_sync"}> ({
  ^bb0(%arg1: index loc("<stdin>":11:8)):
    %3 = "gpu.alloc"(%arg1) <{operandSegmentSizes = array<i32: 0, 1, 0>}> : (index) -> memref<?xf32> loc("<stdin>":12:10)
    "gpu.dealloc"(%3) : (memref<?xf32>) -> () loc("<stdin>":13:5)
    "func.return"() : () -> () loc("<stdin>":14:5)
  }) : () -> () loc("<stdin>":10:3)
  "func.func"() <{function_type = (index) -> (), sym_name = "alloc_sync"}> ({
  ^bb0(%arg0: index loc("<stdin>":17:8)):
    %0 = "gpu.alloc"(%arg0) <{hostShared, operandSegmentSizes = array<i32: 0, 1, 0>}> : (index) -> memref<?xf32> loc("<stdin>":18:10)
    %1 = "gpu.wait"() : () -> !gpu.async.token loc("<stdin>":19:10)
    %2 = "gpu.dealloc"(%1, %0) : (!gpu.async.token, memref<?xf32>) -> !gpu.async.token loc("<stdin>":20:10)
    "gpu.wait"(%2) : (!gpu.async.token) -> () loc("<stdin>":21:5)
    "func.return"() : () -> () loc("<stdin>":22:5)
  }) : () -> () loc("<stdin>":16:3)
}) {gpu.container_module} : () -> () loc("<stdin>":1:1)
