"builtin.module"() ({
  "func.func"() <{function_type = (memref<8x12x16xf32>, memref<8x24x48xf32>) -> (), sym_name = "vec_affine_apply"}> ({
  ^bb0(%arg0: memref<8x12x16xf32> loc("<stdin>":10:8), %arg1: memref<8x24x48xf32> loc("<stdin>":10:36)):
    "affine.for"() <{lowerBoundMap = affine_map<() -> (0)>, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = affine_map<() -> (8)>}> ({
    ^bb0(%arg2: index loc("<stdin>":12:10)):
      "affine.for"() <{lowerBoundMap = affine_map<() -> (0)>, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = affine_map<() -> (24)>}> ({
      ^bb0(%arg3: index loc("<stdin>":14:12)):
        "affine.for"() <{lowerBoundMap = affine_map<() -> (0)>, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = affine_map<() -> (48)>}> ({
        ^bb0(%arg4: index loc("<stdin>":16:14)):
          %0 = "affine.apply"(%arg3) <{map = affine_map<(d0) -> (d0 mod 12)>}> : (index) -> index loc("<stdin>":17:16)
          %1 = "affine.apply"(%arg4) <{map = affine_map<(d0) -> (d0 mod 16)>}> : (index) -> index loc("<stdin>":18:16)
          %2 = "affine.load"(%arg0, %arg2, %0, %1) <{map = affine_map<(d0, d1, d2) -> (d0, d1, d2)>}> : (memref<8x12x16xf32>, index, index, index) -> f32 loc("<stdin>":19:16)
          "affine.store"(%2, %arg1, %arg2, %arg3, %arg4) <{map = affine_map<(d0, d1, d2) -> (d0, d1, d2)>}> : (f32, memref<8x24x48xf32>, index, index, index) -> () loc("<stdin>":20:11)
          "affine.yield"() : () -> () loc("<stdin>":21:11)
        }) : () -> () loc("<stdin>":15:9)
        "affine.yield"() : () -> () loc("<stdin>":23:9)
      }) : () -> () loc("<stdin>":13:7)
      "affine.yield"() : () -> () loc("<stdin>":25:7)
    }) : () -> () loc("<stdin>":11:5)
    "func.return"() : () -> () loc("<stdin>":27:5)
  }) : () -> () loc("<stdin>":9:3)
}) : () -> () loc("<stdin>":8:1)
