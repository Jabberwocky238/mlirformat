"builtin.module"() ({
  "func.func"() <{function_type = (memref<1x16x12xf32>, memref<1x16x12xf32>) -> (), sym_name = "unroll_simple_parallel_loop"}> ({
  ^bb0(%arg0: memref<1x16x12xf32> loc("<stdin>":3:8), %arg1: memref<1x16x12xf32> loc("<stdin>":3:36)):
    %0 = "arith.constant"() <{value = 12 : index}> : () -> index loc("<stdin>":4:10)
    %1 = "arith.constant"() <{value = 16 : index}> : () -> index loc("<stdin>":5:10)
    %2 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":6:10)
    %3 = "arith.constant"() <{value = 1 : index}> : () -> index loc("<stdin>":7:10)
    "scf.parallel"(%2, %2, %2, %3, %1, %0, %3, %3, %3) <{operandSegmentSizes = array<i32: 3, 3, 3, 0>}> ({
    ^bb0(%arg2: index loc("<stdin>":9:10), %arg3: index loc("<stdin>":9:24), %arg4: index loc("<stdin>":9:38)):
      %4 = "memref.load"(%arg0, %arg2, %arg3, %arg4) : (memref<1x16x12xf32>, index, index, index) -> f32 loc("<stdin>":10:12)
      "memref.store"(%4, %arg1, %arg2, %arg3, %arg4) : (f32, memref<1x16x12xf32>, index, index, index) -> () loc("<stdin>":11:7)
      "scf.reduce"() : () -> () loc("<stdin>":12:7)
    }) : (index, index, index, index, index, index, index, index, index) -> () loc("<stdin>":8:5)
    "func.return"() : () -> () loc("<stdin>":14:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
