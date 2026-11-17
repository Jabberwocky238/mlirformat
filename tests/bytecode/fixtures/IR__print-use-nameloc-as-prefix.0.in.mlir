"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "test_basic"}> ({
    %0 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<i32> loc("<stdin>":3:10)
    %1 = "memref.load"(%0) : (memref<i32>) -> i32 loc("<stdin>":4:10)
    "func.return"() : () -> () loc("<stdin>":5:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
