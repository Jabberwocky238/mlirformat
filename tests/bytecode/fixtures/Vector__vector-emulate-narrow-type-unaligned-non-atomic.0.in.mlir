"builtin.module"() ({
  "func.func"() <{function_type = (vector<3xi2>) -> (), sym_name = "vector_store_i2_const_index_two_partial_stores"}> ({
  ^bb0(%arg0: vector<3xi2> loc("<stdin>":3:8)):
    %0 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<3x3xi2> loc("<stdin>":4:10)
    %1 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":5:10)
    %2 = "arith.constant"() <{value = 2 : index}> : () -> index loc("<stdin>":6:10)
    "vector.store"(%arg0, %0, %2, %1) : (vector<3xi2>, memref<3x3xi2>, index, index) -> () loc("<stdin>":7:5)
    "func.return"() : () -> () loc("<stdin>":8:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
