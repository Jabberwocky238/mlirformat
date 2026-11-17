"builtin.module"() ({
  "func.func"() <{function_type = (f32, memref<1xf32>) -> (), sym_name = "execute_no_async_args"}> ({
  ^bb0(%arg0: f32 loc("<stdin>":3:8), %arg1: memref<1xf32> loc("<stdin>":3:20)):
    %0 = "async.execute"() <{operandSegmentSizes = array<i32: 0, 0>}> ({
      %1 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":5:12)
      "memref.store"(%arg0, %arg1, %1) : (f32, memref<1xf32>, index) -> () loc("<stdin>":6:7)
      "async.yield"() : () -> () loc("<stdin>":7:7)
    }) : () -> !async.token loc("<stdin>":4:10)
    "async.await"(%0) : (!async.token) -> () loc("<stdin>":9:5)
    "func.return"() : () -> () loc("<stdin>":10:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
