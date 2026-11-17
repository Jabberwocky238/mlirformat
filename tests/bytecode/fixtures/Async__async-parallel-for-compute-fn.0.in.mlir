"builtin.module"() ({
  "func.func"() <{function_type = (memref<?xf32>, index, index, index) -> (), sym_name = "clone_constant"}> ({
  ^bb0(%arg0: memref<?xf32> loc("<stdin>":3:8), %arg1: index loc("<stdin>":3:30), %arg2: index loc("<stdin>":3:44), %arg3: index loc("<stdin>":3:58)):
    %0 = "arith.constant"() <{value = 1.000000e+00 : f32}> : () -> f32 loc("<stdin>":4:10)
    "scf.parallel"(%arg1, %arg2, %arg3) <{operandSegmentSizes = array<i32: 1, 1, 1, 0>}> ({
    ^bb0(%arg4: index loc("<stdin>":6:10)):
      "memref.store"(%0, %arg0, %arg4) : (f32, memref<?xf32>, index) -> () loc("<stdin>":7:7)
      "scf.reduce"() : () -> () loc("<stdin>":8:7)
    }) : (index, index, index) -> () loc("<stdin>":5:5)
    "func.return"() : () -> () loc("<stdin>":10:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
