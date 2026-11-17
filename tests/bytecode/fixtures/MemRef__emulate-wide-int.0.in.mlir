"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "memref_i32"}> ({
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":3:10)
    %1 = "arith.constant"() <{value = 1 : i32}> : () -> i32 loc("<stdin>":4:10)
    %2 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<4xi32, 1> loc("<stdin>":5:10)
    %3 = "memref.load"(%2, %0) : (memref<4xi32, 1>, index) -> i32 loc("<stdin>":6:10)
    "memref.store"(%1, %2, %0) : (i32, memref<4xi32, 1>, index) -> () loc("<stdin>":7:5)
    "func.return"() : () -> () loc("<stdin>":8:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
