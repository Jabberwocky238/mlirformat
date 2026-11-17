"builtin.module"() ({
  "func.func"() <{function_type = (memref<8xf32>) -> (), sym_name = "disjoint_stores"}> ({
  ^bb0(%arg0: memref<8xf32> loc("<stdin>":7:8)):
    %0 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<16xf32> loc("<stdin>":8:10)
    "affine.for"() <{lowerBoundMap = affine_map<() -> (0)>, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = affine_map<() -> (8)>}> ({
    ^bb0(%arg2: index loc("<stdin>":10:10)):
      %3 = "affine.load"(%arg0, %arg2) <{map = affine_map<(d0) -> (d0)>}> : (memref<8xf32>, index) -> f32 loc("<stdin>":11:12)
      "affine.store"(%3, %0, %arg2) <{map = affine_map<(d0) -> (d0)>}> : (f32, memref<16xf32>, index) -> () loc("<stdin>":12:7)
      "affine.yield"() : () -> () loc("<stdin>":13:7)
    }) : () -> () loc("<stdin>":9:5)
    "affine.for"() <{lowerBoundMap = affine_map<() -> (0)>, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = affine_map<() -> (8)>}> ({
    ^bb0(%arg1: index loc("<stdin>":16:10)):
      %1 = "affine.load"(%arg0, %arg1) <{map = affine_map<(d0) -> (d0)>}> : (memref<8xf32>, index) -> f32 loc("<stdin>":17:12)
      %2 = "arith.negf"(%1) <{fastmath = #arith.fastmath<none>}> : (f32) -> f32 loc("<stdin>":18:12)
      "affine.store"(%2, %0, %arg1) <{map = affine_map<(d0) -> (d0 + 8)>}> : (f32, memref<16xf32>, index) -> () loc("<stdin>":19:7)
      "affine.yield"() : () -> () loc("<stdin>":20:7)
    }) : () -> () loc("<stdin>":15:5)
    "func.return"() : () -> () loc("<stdin>":22:5)
  }) : () -> () loc("<stdin>":6:3)
}) : () -> () loc("<stdin>":5:1)
