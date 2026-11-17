"builtin.module"() ({
  "func.func"() <{function_type = (memref<?xf32>) -> (), sym_name = "num_worker_threads"}> ({
  ^bb0(%arg0: memref<?xf32> loc("<stdin>":3:8)):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":4:10)
    %1 = "arith.constant"() <{value = 100 : index}> : () -> index loc("<stdin>":5:10)
    %2 = "arith.constant"() <{value = 1 : index}> : () -> index loc("<stdin>":6:10)
    "scf.parallel"(%0, %1, %2) <{operandSegmentSizes = array<i32: 1, 1, 1, 0>}> ({
    ^bb0(%arg1: index loc("<stdin>":8:10)):
      %3 = "arith.constant"() <{value = 1.000000e+00 : f32}> : () -> f32 loc("<stdin>":9:12)
      "memref.store"(%3, %arg0, %arg1) : (f32, memref<?xf32>, index) -> () loc("<stdin>":10:7)
      "scf.reduce"() : () -> () loc("<stdin>":11:7)
    }) : (index, index, index) -> () loc("<stdin>":7:5)
    "func.return"() : () -> () loc("<stdin>":13:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
