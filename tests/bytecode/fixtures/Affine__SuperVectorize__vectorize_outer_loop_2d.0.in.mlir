"builtin.module"() ({
  "func.func"() <{function_type = (memref<?x?x?xf32>) -> (), sym_name = "vec2d"}> ({
  ^bb0(%arg0: memref<?x?x?xf32> loc("<stdin>":6:8)):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":7:10)
    %1 = "arith.constant"() <{value = 1 : index}> : () -> index loc("<stdin>":8:10)
    %2 = "arith.constant"() <{value = 2 : index}> : () -> index loc("<stdin>":9:10)
    %3 = "memref.dim"(%arg0, %0) : (memref<?x?x?xf32>, index) -> index loc("<stdin>":10:10)
    %4 = "memref.dim"(%arg0, %1) : (memref<?x?x?xf32>, index) -> index loc("<stdin>":11:10)
    %5 = "memref.dim"(%arg0, %2) : (memref<?x?x?xf32>, index) -> index loc("<stdin>":12:10)
    "affine.for"(%3) <{lowerBoundMap = affine_map<() -> (0)>, operandSegmentSizes = array<i32: 0, 1, 0>, step = 1 : index, upperBoundMap = affine_map<()[s0] -> (s0)>}> ({
    ^bb0(%arg4: index loc("<stdin>":14:10)):
      "affine.for"(%4) <{lowerBoundMap = affine_map<() -> (0)>, operandSegmentSizes = array<i32: 0, 1, 0>, step = 1 : index, upperBoundMap = affine_map<()[s0] -> (s0)>}> ({
      ^bb0(%arg5: index loc("<stdin>":16:12)):
        "affine.for"(%5) <{lowerBoundMap = affine_map<() -> (0)>, operandSegmentSizes = array<i32: 0, 1, 0>, step = 1 : index, upperBoundMap = affine_map<()[s0] -> (s0)>}> ({
        ^bb0(%arg6: index loc("<stdin>":18:14)):
          %7 = "affine.load"(%arg0, %arg4, %arg5, %arg6) <{map = affine_map<(d0, d1, d2) -> (d0, d1, d2)>}> : (memref<?x?x?xf32>, index, index, index) -> f32 loc("<stdin>":19:16)
          "affine.yield"() : () -> () loc("<stdin>":20:11)
        }) : (index) -> () loc("<stdin>":17:9)
        "affine.yield"() : () -> () loc("<stdin>":22:9)
      }) : (index) -> () loc("<stdin>":15:7)
      "affine.yield"() : () -> () loc("<stdin>":24:7)
    }) : (index) -> () loc("<stdin>":13:5)
    "affine.for"(%3) <{lowerBoundMap = affine_map<() -> (0)>, operandSegmentSizes = array<i32: 0, 1, 0>, step = 1 : index, upperBoundMap = affine_map<()[s0] -> (s0)>}> ({
    ^bb0(%arg1: index loc("<stdin>":27:10)):
      "affine.for"(%4) <{lowerBoundMap = affine_map<() -> (0)>, operandSegmentSizes = array<i32: 0, 1, 0>, step = 1 : index, upperBoundMap = affine_map<()[s0] -> (s0)>}> ({
      ^bb0(%arg2: index loc("<stdin>":29:12)):
        "affine.for"(%5) <{lowerBoundMap = affine_map<() -> (0)>, operandSegmentSizes = array<i32: 0, 1, 0>, step = 1 : index, upperBoundMap = affine_map<()[s0] -> (s0)>}> ({
        ^bb0(%arg3: index loc("<stdin>":31:14)):
          %6 = "affine.load"(%arg0, %arg2, %arg3, %arg1) <{map = affine_map<(d0, d1, d2) -> (d0, d1, d2)>}> : (memref<?x?x?xf32>, index, index, index) -> f32 loc("<stdin>":32:16)
          "affine.yield"() : () -> () loc("<stdin>":33:11)
        }) : (index) -> () loc("<stdin>":30:9)
        "affine.yield"() : () -> () loc("<stdin>":35:9)
      }) : (index) -> () loc("<stdin>":28:7)
      "affine.yield"() : () -> () loc("<stdin>":37:7)
    }) : (index) -> () loc("<stdin>":26:5)
    "func.return"() : () -> () loc("<stdin>":39:5)
  }) : () -> () loc("<stdin>":5:3)
}) : () -> () loc("<stdin>":4:1)
