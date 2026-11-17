"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "slicing_memref_store_trivial"}> ({
    %0 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<10xf32> loc("<stdin>":6:10)
    %1 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":7:10)
    %2 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32 loc("<stdin>":8:10)
    "affine.for"() <{lowerBoundMap = affine_map<() -> (0)>, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = affine_map<() -> (10)>}> ({
    ^bb0(%arg0: index loc("<stdin>":10:10)):
      %3 = "affine.apply"(%1) <{map = affine_map<()[s0] -> (s0)>}> : (index) -> index loc("<stdin>":11:12)
      "memref.store"(%2, %0, %3) : (f32, memref<10xf32>, index) -> () loc("<stdin>":12:7)
      %4 = "memref.load"(%0, %1) : (memref<10xf32>, index) -> f32 loc("<stdin>":13:12)
      %5 = "affine.apply"() <{map = affine_map<() -> (0)>}> : () -> index loc("<stdin>":14:12)
      "memref.store"(%2, %0, %5) : (f32, memref<10xf32>, index) -> () loc("<stdin>":15:7)
      "memref.store"(%4, %0, %1) : (f32, memref<10xf32>, index) -> () loc("<stdin>":16:7)
      "affine.yield"() : () -> () loc("<stdin>":17:7)
    }) : () -> () loc("<stdin>":9:5)
    "func.return"() : () -> () loc("<stdin>":19:5)
  }) : () -> () loc("<stdin>":5:3)
}) : () -> () loc("<stdin>":4:1)
