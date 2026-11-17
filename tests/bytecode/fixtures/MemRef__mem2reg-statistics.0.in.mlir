"builtin.module"() ({
  "func.func"() <{function_type = () -> i32, sym_name = "basic"}> ({
    %0 = "arith.constant"() <{value = 5 : i32}> : () -> i32 loc("<stdin>":3:10)
    %1 = "memref.alloca"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<i32> loc("<stdin>":4:10)
    "memref.store"(%0, %1) : (i32, memref<i32>) -> () loc("<stdin>":5:5)
    %2 = "memref.load"(%1) : (memref<i32>) -> i32 loc("<stdin>":6:10)
    "func.return"(%2) : (i32) -> () loc("<stdin>":7:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
