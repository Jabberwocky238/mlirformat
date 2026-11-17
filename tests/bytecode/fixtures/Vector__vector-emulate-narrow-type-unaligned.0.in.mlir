"builtin.module"() ({
  "func.func"() <{function_type = () -> vector<3x3xi2>, sym_name = "vector_load_i2"}> ({
    %0 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<3x3xi2> loc("<stdin>":3:10)
    %1 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":4:10)
    %2 = "arith.constant"() <{value = 2 : index}> : () -> index loc("<stdin>":5:10)
    %3 = "arith.constant"() <{value = dense<0> : vector<3x3xi2>}> : () -> vector<3x3xi2> loc("<stdin>":6:10)
    %4 = "vector.load"(%0, %2, %1) : (memref<3x3xi2>, index, index) -> vector<3xi2> loc("<stdin>":7:10)
    %5 = "vector.insert"(%4, %3) <{static_position = array<i64: 0>}> : (vector<3xi2>, vector<3x3xi2>) -> vector<3x3xi2> loc("<stdin>":8:10)
    "func.return"(%5) : (vector<3x3xi2>) -> () loc("<stdin>":9:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
