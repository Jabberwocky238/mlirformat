"builtin.module"() ({
  "func.func"() <{function_type = (vector<8xi4>, index, index) -> (), sym_name = "vector_store_i4_aligned_const"}> ({
  ^bb0(%arg0: vector<8xi4> loc("<stdin>":3:8), %arg1: index loc("<stdin>":3:29), %arg2: index loc("<stdin>":3:43)):
    %0 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<4x8xi4> loc("<stdin>":4:10)
    "vector.store"(%arg0, %0, %arg1, %arg2) : (vector<8xi4>, memref<4x8xi4>, index, index) -> () loc("<stdin>":5:5)
    "func.return"() : () -> () loc("<stdin>":6:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
