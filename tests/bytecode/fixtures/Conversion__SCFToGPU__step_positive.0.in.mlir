"builtin.module"() ({
  "func.func"() <{function_type = (memref<?x?xf32>, memref<?x?xf32>) -> (), sym_name = "step_var"}> ({
  ^bb0(%arg0: memref<?x?xf32> loc("<stdin>":7:8), %arg1: memref<?x?xf32> loc("<stdin>":7:32)):
    "affine.for"() <{lowerBoundMap = affine_map<() -> (5)>, operandSegmentSizes = array<i32: 0, 0, 0>, step = 4 : index, upperBoundMap = affine_map<() -> (15)>}> ({
    ^bb0(%arg2: index loc("<stdin>":9:10)):
      "affine.for"() <{lowerBoundMap = affine_map<() -> (3)>, operandSegmentSizes = array<i32: 0, 0, 0>, step = 7 : index, upperBoundMap = affine_map<() -> (19)>}> ({
      ^bb0(%arg3: index loc("<stdin>":11:12)):
        %0 = "memref.load"(%arg0, %arg2, %arg3) : (memref<?x?xf32>, index, index) -> f32 loc("<stdin>":12:14)
        "memref.store"(%0, %arg1, %arg2, %arg3) : (f32, memref<?x?xf32>, index, index) -> () loc("<stdin>":13:9)
        "affine.yield"() : () -> () loc("<stdin>":14:9)
      }) : () -> () loc("<stdin>":10:7)
      "affine.yield"() : () -> () loc("<stdin>":16:7)
    }) : () -> () loc("<stdin>":8:5)
    "func.return"() : () -> () loc("<stdin>":18:5)
  }) : () -> () loc("<stdin>":6:3)
}) : () -> () loc("<stdin>":5:1)
