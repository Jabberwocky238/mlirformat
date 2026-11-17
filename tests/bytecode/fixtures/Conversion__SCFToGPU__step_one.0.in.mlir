"builtin.module"() ({
  "func.func"() <{function_type = (memref<?x?x?x?xf32>, memref<?x?x?x?xf32>) -> (), sym_name = "step_1"}> ({
  ^bb0(%arg0: memref<?x?x?x?xf32> loc("<stdin>":10:8), %arg1: memref<?x?x?x?xf32> loc("<stdin>":10:36)):
    "affine.for"() <{lowerBoundMap = affine_map<() -> (0)>, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = affine_map<() -> (42)>}> ({
    ^bb0(%arg2: index loc("<stdin>":12:10)):
      "affine.for"() <{lowerBoundMap = affine_map<() -> (0)>, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = affine_map<() -> (10)>}> ({
      ^bb0(%arg3: index loc("<stdin>":14:12)):
        "affine.for"() <{lowerBoundMap = affine_map<() -> (2)>, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = affine_map<() -> (16)>}> ({
        ^bb0(%arg4: index loc("<stdin>":16:14)):
          "affine.for"() <{lowerBoundMap = affine_map<() -> (5)>, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = affine_map<() -> (17)>}> ({
          ^bb0(%arg5: index loc("<stdin>":18:16)):
            %0 = "memref.load"(%arg0, %arg2, %arg3, %arg4, %arg5) : (memref<?x?x?x?xf32>, index, index, index, index) -> f32 loc("<stdin>":19:18)
            "memref.store"(%0, %arg1, %arg2, %arg3, %arg4, %arg5) : (f32, memref<?x?x?x?xf32>, index, index, index, index) -> () loc("<stdin>":20:13)
            "affine.yield"() : () -> () loc("<stdin>":21:13)
          }) : () -> () loc("<stdin>":17:11)
          "affine.yield"() : () -> () loc("<stdin>":23:11)
        }) : () -> () loc("<stdin>":15:9)
        "affine.yield"() : () -> () loc("<stdin>":25:9)
      }) : () -> () loc("<stdin>":13:7)
      "affine.yield"() : () -> () loc("<stdin>":27:7)
    }) : () -> () loc("<stdin>":11:5)
    "func.return"() : () -> () loc("<stdin>":29:5)
  }) : () -> () loc("<stdin>":9:3)
}) : () -> () loc("<stdin>":8:1)
