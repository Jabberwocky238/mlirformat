"builtin.module"() ({
  "func.func"() <{function_type = (index) -> vector<8xi4>, sym_name = "vector_load_2d_i4"}> ({
  ^bb0(%arg0: index loc("<stdin>":3:8)):
    %0 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<4x8xi4> loc("<stdin>":4:10)
    %1 = "vector.load"(%0, %arg0, %arg0) : (memref<4x8xi4>, index, index) -> vector<8xi4> loc("<stdin>":5:10)
    "func.return"(%1) : (vector<8xi4>) -> () loc("<stdin>":6:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
