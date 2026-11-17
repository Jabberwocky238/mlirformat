"builtin.module"() ({
  "func.func"() <{function_type = (index, index) -> vector<2x4xi8>, sym_name = "negative_vector_load_2d_i8"}> ({
  ^bb0(%arg0: index loc("<stdin>":3:8), %arg1: index loc("<stdin>":3:22)):
    %0 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<3x4xi8> loc("<stdin>":4:10)
    %1 = "vector.load"(%0, %arg0, %arg1) : (memref<3x4xi8>, index, index) -> vector<2x4xi8> loc("<stdin>":5:10)
    "func.return"(%1) : (vector<2x4xi8>) -> () loc("<stdin>":6:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
