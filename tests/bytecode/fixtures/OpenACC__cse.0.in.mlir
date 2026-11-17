"builtin.module"() ({
  "func.func"() <{function_type = (memref<10xf32>, index) -> (f32, f32), sym_name = "cse_across_acc_set"}> ({
  ^bb0(%arg0: memref<10xf32> loc("<stdin>":3:8), %arg1: index loc("<stdin>":3:31)):
    %0 = "memref.load"(%arg0, %arg1) : (memref<10xf32>, index) -> f32 loc("<stdin>":4:10)
    %1 = "arith.constant"() <{value = 42 : i32}> : () -> i32 loc("<stdin>":5:10)
    "acc.set"(%1) <{operandSegmentSizes = array<i32: 0, 1, 0>}> : (i32) -> () loc("<stdin>":6:5)
    %2 = "memref.load"(%arg0, %arg1) : (memref<10xf32>, index) -> f32 loc("<stdin>":7:10)
    "func.return"(%0, %2) : (f32, f32) -> () loc("<stdin>":8:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
