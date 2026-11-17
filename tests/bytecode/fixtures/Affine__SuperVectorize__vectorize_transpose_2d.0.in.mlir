"builtin.module"() ({
  "func.func"() <{function_type = (memref<?x?x?xf32>) -> (), sym_name = "vec2d"}> ({
  ^bb0(%arg7: memref<?x?x?xf32> loc("<stdin>":6:8)):
    %9 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":7:10)
    %10 = "arith.constant"() <{value = 1 : index}> : () -> index loc("<stdin>":8:11)
    %11 = "arith.constant"() <{value = 2 : index}> : () -> index loc("<stdin>":9:11)
    %12 = "memref.dim"(%arg7, %9) : (memref<?x?x?xf32>, index) -> index loc("<stdin>":10:11)
    %13 = "memref.dim"(%arg7, %10) : (memref<?x?x?xf32>, index) -> index loc("<stdin>":11:11)
    %14 = "memref.dim"(%arg7, %11) : (memref<?x?x?xf32>, index) -> index loc("<stdin>":12:11)
    "affine.for"(%12) <{lowerBoundMap = affine_map<() -> (0)>, operandSegmentSizes = array<i32: 0, 1, 0>, step = 1 : index, upperBoundMap = affine_map<()[s0] -> (s0)>}> ({
    ^bb0(%arg11: index loc("<stdin>":14:10)):
      "affine.for"(%13) <{lowerBoundMap = affine_map<() -> (0)>, operandSegmentSizes = array<i32: 0, 1, 0>, step = 1 : index, upperBoundMap = affine_map<()[s0] -> (s0)>}> ({
      ^bb0(%arg12: index loc("<stdin>":16:12)):
        "affine.for"(%14) <{lowerBoundMap = affine_map<() -> (0)>, operandSegmentSizes = array<i32: 0, 1, 0>, step = 1 : index, upperBoundMap = affine_map<()[s0] -> (s0)>}> ({
        ^bb0(%arg13: index loc("<stdin>":18:14)):
          %16 = "affine.load"(%arg7, %arg11, %arg12, %arg13) <{map = affine_map<(d0, d1, d2) -> (d0, d1, d2)>}> : (memref<?x?x?xf32>, index, index, index) -> f32 loc("<stdin>":19:17)
          "affine.yield"() : () -> () loc("<stdin>":20:11)
        }) : (index) -> () loc("<stdin>":17:9)
        "affine.yield"() : () -> () loc("<stdin>":22:9)
      }) : (index) -> () loc("<stdin>":15:7)
      "affine.yield"() : () -> () loc("<stdin>":24:7)
    }) : (index) -> () loc("<stdin>":13:5)
    "affine.for"(%12) <{lowerBoundMap = affine_map<() -> (0)>, operandSegmentSizes = array<i32: 0, 1, 0>, step = 1 : index, upperBoundMap = affine_map<()[s0] -> (s0)>}> ({
    ^bb0(%arg8: index loc("<stdin>":27:10)):
      "affine.for"(%13) <{lowerBoundMap = affine_map<() -> (0)>, operandSegmentSizes = array<i32: 0, 1, 0>, step = 1 : index, upperBoundMap = affine_map<()[s0] -> (s0)>}> ({
      ^bb0(%arg9: index loc("<stdin>":29:12)):
        "affine.for"(%14) <{lowerBoundMap = affine_map<() -> (0)>, operandSegmentSizes = array<i32: 0, 1, 0>, step = 1 : index, upperBoundMap = affine_map<()[s0] -> (s0)>}> ({
        ^bb0(%arg10: index loc("<stdin>":31:14)):
          %15 = "affine.load"(%arg7, %arg9, %arg10, %arg8) <{map = affine_map<(d0, d1, d2) -> (d0, d1, d2)>}> : (memref<?x?x?xf32>, index, index, index) -> f32 loc("<stdin>":32:17)
          "affine.yield"() : () -> () loc("<stdin>":33:11)
        }) : (index) -> () loc("<stdin>":30:9)
        "affine.yield"() : () -> () loc("<stdin>":35:9)
      }) : (index) -> () loc("<stdin>":28:7)
      "affine.yield"() : () -> () loc("<stdin>":37:7)
    }) : (index) -> () loc("<stdin>":26:5)
    "func.return"() : () -> () loc("<stdin>":39:5)
  }) : () -> () loc("<stdin>":5:3)
  "func.func"() <{function_type = (memref<?x?x?xf32>) -> (), sym_name = "vec2d_imperfectly_nested"}> ({
  ^bb0(%arg0: memref<?x?x?xf32> loc("<stdin>":42:8)):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":43:10)
    %1 = "arith.constant"() <{value = 1 : index}> : () -> index loc("<stdin>":44:10)
    %2 = "arith.constant"() <{value = 2 : index}> : () -> index loc("<stdin>":45:10)
    %3 = "memref.dim"(%arg0, %0) : (memref<?x?x?xf32>, index) -> index loc("<stdin>":46:10)
    %4 = "memref.dim"(%arg0, %1) : (memref<?x?x?xf32>, index) -> index loc("<stdin>":47:10)
    %5 = "memref.dim"(%arg0, %2) : (memref<?x?x?xf32>, index) -> index loc("<stdin>":48:10)
    "affine.for"(%3) <{lowerBoundMap = affine_map<() -> (0)>, operandSegmentSizes = array<i32: 0, 1, 0>, step = 1 : index, upperBoundMap = affine_map<()[s0] -> (s0)>}> ({
    ^bb0(%arg1: index loc("<stdin>":50:10)):
      "affine.for"(%4) <{lowerBoundMap = affine_map<() -> (0)>, operandSegmentSizes = array<i32: 0, 1, 0>, step = 1 : index, upperBoundMap = affine_map<()[s0] -> (s0)>}> ({
      ^bb0(%arg5: index loc("<stdin>":52:12)):
        "affine.for"(%5) <{lowerBoundMap = affine_map<() -> (0)>, operandSegmentSizes = array<i32: 0, 1, 0>, step = 1 : index, upperBoundMap = affine_map<()[s0] -> (s0)>}> ({
        ^bb0(%arg6: index loc("<stdin>":54:14)):
          %8 = "affine.load"(%arg0, %arg6, %arg5, %arg1) <{map = affine_map<(d0, d1, d2) -> (d0, d1, d2)>}> : (memref<?x?x?xf32>, index, index, index) -> f32 loc("<stdin>":55:16)
          "affine.yield"() : () -> () loc("<stdin>":56:11)
        }) : (index) -> () loc("<stdin>":53:9)
        "affine.yield"() : () -> () loc("<stdin>":58:9)
      }) : (index) -> () loc("<stdin>":51:7)
      "affine.for"(%4) <{lowerBoundMap = affine_map<() -> (0)>, operandSegmentSizes = array<i32: 0, 1, 0>, step = 1 : index, upperBoundMap = affine_map<()[s0] -> (s0)>}> ({
      ^bb0(%arg2: index loc("<stdin>":61:12)):
        "affine.for"(%5) <{lowerBoundMap = affine_map<() -> (0)>, operandSegmentSizes = array<i32: 0, 1, 0>, step = 1 : index, upperBoundMap = affine_map<()[s0] -> (s0)>}> ({
        ^bb0(%arg4: index loc("<stdin>":63:14)):
          %7 = "affine.load"(%arg0, %arg2, %arg4, %arg1) <{map = affine_map<(d0, d1, d2) -> (d0, d1, d2)>}> : (memref<?x?x?xf32>, index, index, index) -> f32 loc("<stdin>":64:16)
          "affine.yield"() : () -> () loc("<stdin>":65:11)
        }) : (index) -> () loc("<stdin>":62:9)
        "affine.for"(%5) <{lowerBoundMap = affine_map<() -> (0)>, operandSegmentSizes = array<i32: 0, 1, 0>, step = 1 : index, upperBoundMap = affine_map<()[s0] -> (s0)>}> ({
        ^bb0(%arg3: index loc("<stdin>":68:14)):
          %6 = "affine.load"(%arg0, %arg2, %arg3, %arg1) <{map = affine_map<(d0, d1, d2) -> (d0, d1, d2)>}> : (memref<?x?x?xf32>, index, index, index) -> f32 loc("<stdin>":69:16)
          "affine.yield"() : () -> () loc("<stdin>":70:11)
        }) : (index) -> () loc("<stdin>":67:9)
        "affine.yield"() : () -> () loc("<stdin>":72:9)
      }) : (index) -> () loc("<stdin>":60:7)
      "affine.yield"() : () -> () loc("<stdin>":74:7)
    }) : (index) -> () loc("<stdin>":49:5)
    "func.return"() : () -> () loc("<stdin>":76:5)
  }) : () -> () loc("<stdin>":41:3)
}) : () -> () loc("<stdin>":4:1)
