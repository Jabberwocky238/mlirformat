"builtin.module"() ({
  "func.func"() <{function_type = (i32, i32) -> i32, sym_name = "basic"}> ({
  ^bb0(%arg0: i32 loc("<stdin>":3:8), %arg1: i32 loc("<stdin>":3:20)):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":4:10)
    %1 = "arith.constant"() <{value = 1 : index}> : () -> index loc("<stdin>":5:10)
    %2 = "memref.alloca"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<2xi32> loc("<stdin>":6:10)
    "memref.store"(%arg0, %2, %0) : (i32, memref<2xi32>, index) -> () loc("<stdin>":7:5)
    "memref.store"(%arg1, %2, %1) : (i32, memref<2xi32>, index) -> () loc("<stdin>":8:5)
    %3 = "memref.load"(%2, %0) : (memref<2xi32>, index) -> i32 loc("<stdin>":9:10)
    "func.return"(%3) : (i32) -> () loc("<stdin>":10:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
