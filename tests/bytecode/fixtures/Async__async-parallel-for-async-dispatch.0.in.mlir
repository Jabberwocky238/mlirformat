"builtin.module"() ({
  "func.func"() <{function_type = (index, index, index, memref<?xf32>) -> (), sym_name = "loop_1d"}> ({
  ^bb0(%arg0: index loc("<stdin>":3:8), %arg1: index loc("<stdin>":3:22), %arg2: index loc("<stdin>":3:36), %arg3: memref<?xf32> loc("<stdin>":3:50)):
    "scf.parallel"(%arg0, %arg1, %arg2) <{operandSegmentSizes = array<i32: 1, 1, 1, 0>}> ({
    ^bb0(%arg4: index loc("<stdin>":5:10)):
      %0 = "arith.constant"() <{value = 1.000000e+00 : f32}> : () -> f32 loc("<stdin>":6:12)
      "memref.store"(%0, %arg3, %arg4) : (f32, memref<?xf32>, index) -> () loc("<stdin>":7:7)
      "scf.reduce"() : () -> () loc("<stdin>":8:7)
    }) : (index, index, index) -> () loc("<stdin>":4:5)
    "func.return"() : () -> () loc("<stdin>":10:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
