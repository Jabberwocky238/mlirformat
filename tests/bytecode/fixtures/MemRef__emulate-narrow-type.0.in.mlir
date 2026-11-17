"builtin.module"() ({
  "func.func"() <{function_type = () -> i8, sym_name = "memref_i8"}> ({
    %0 = "arith.constant"() <{value = 3 : index}> : () -> index loc("<stdin>":3:10)
    %1 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<4xi8, 1> loc("<stdin>":4:10)
    %2 = "memref.load"(%1, %0) : (memref<4xi8, 1>, index) -> i8 loc("<stdin>":5:10)
    "memref.dealloc"(%1) : (memref<4xi8, 1>) -> () loc("<stdin>":6:5)
    "func.return"(%2) : (i8) -> () loc("<stdin>":7:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
