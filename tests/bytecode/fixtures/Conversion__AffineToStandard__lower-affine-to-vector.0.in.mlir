"builtin.module"() ({
  "func.func"() <{function_type = (index) -> (), sym_name = "affine_vector_load"}> ({
  ^bb0(%arg0: index loc("<stdin>":6:8)):
    %0 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<100xf32> loc("<stdin>":7:10)
    "affine.for"() <{lowerBoundMap = affine_map<() -> (0)>, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = affine_map<() -> (16)>}> ({
    ^bb0(%arg1: index loc("<stdin>":9:10)):
      %1 = "affine.vector_load"(%0, %arg1, %arg0) <{map = affine_map<(d0)[s0] -> (d0 + s0 + 7)>}> : (memref<100xf32>, index, index) -> vector<8xf32> loc("<stdin>":10:12)
      "affine.yield"() : () -> () loc("<stdin>":11:7)
    }) : () -> () loc("<stdin>":8:5)
    "func.return"() : () -> () loc("<stdin>":13:5)
  }) : () -> () loc("<stdin>":5:3)
}) : () -> () loc("<stdin>":4:1)
