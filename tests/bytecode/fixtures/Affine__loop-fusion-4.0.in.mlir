"builtin.module"() ({
  "func.func"() <{function_type = (memref<7x8x9x10xf32>) -> (), sym_name = "unflatten4d"}> ({
  ^bb0(%arg0: memref<7x8x9x10xf32> loc("<stdin>":10:8)):
    %0 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<5040xf32> loc("<stdin>":11:10)
    %1 = "arith.constant"() <{value = 7.000000e+00 : f32}> : () -> f32 loc("<stdin>":12:10)
    "affine.for"() <{lowerBoundMap = affine_map<() -> (0)>, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = affine_map<() -> (7)>}> ({
    ^bb0(%arg5: index loc("<stdin>":14:10)):
      "affine.for"() <{lowerBoundMap = affine_map<() -> (0)>, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = affine_map<() -> (8)>}> ({
      ^bb0(%arg6: index loc("<stdin>":16:12)):
        "affine.for"() <{lowerBoundMap = affine_map<() -> (0)>, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = affine_map<() -> (9)>}> ({
        ^bb0(%arg7: index loc("<stdin>":18:14)):
          "affine.for"() <{lowerBoundMap = affine_map<() -> (0)>, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = affine_map<() -> (10)>}> ({
          ^bb0(%arg8: index loc("<stdin>":20:16)):
            "affine.store"(%1, %0, %arg5, %arg6, %arg7, %arg8) <{map = affine_map<(d0, d1, d2, d3) -> (d0 * 720 + d1 * 90 + d2 * 10 + d3)>}> : (f32, memref<5040xf32>, index, index, index, index) -> () loc("<stdin>":21:13)
            "affine.yield"() : () -> () loc("<stdin>":22:13)
          }) : () -> () loc("<stdin>":19:11)
          "affine.yield"() : () -> () loc("<stdin>":24:11)
        }) : () -> () loc("<stdin>":17:9)
        "affine.yield"() : () -> () loc("<stdin>":26:9)
      }) : () -> () loc("<stdin>":15:7)
      "affine.yield"() : () -> () loc("<stdin>":28:7)
    }) : () -> () loc("<stdin>":13:5)
    "affine.for"() <{lowerBoundMap = affine_map<() -> (0)>, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = affine_map<() -> (7)>}> ({
    ^bb0(%arg1: index loc("<stdin>":31:10)):
      "affine.for"() <{lowerBoundMap = affine_map<() -> (0)>, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = affine_map<() -> (8)>}> ({
      ^bb0(%arg2: index loc("<stdin>":33:12)):
        "affine.for"() <{lowerBoundMap = affine_map<() -> (0)>, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = affine_map<() -> (9)>}> ({
        ^bb0(%arg3: index loc("<stdin>":35:14)):
          "affine.for"() <{lowerBoundMap = affine_map<() -> (0)>, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = affine_map<() -> (10)>}> ({
          ^bb0(%arg4: index loc("<stdin>":37:16)):
            %2 = "affine.load"(%0, %arg1, %arg2, %arg3, %arg4) <{map = affine_map<(d0, d1, d2, d3) -> (d0 * 720 + d1 * 90 + d2 * 10 + d3)>}> : (memref<5040xf32>, index, index, index, index) -> f32 loc("<stdin>":38:18)
            "affine.store"(%2, %arg0, %arg1, %arg2, %arg3, %arg4) <{map = affine_map<(d0, d1, d2, d3) -> (d0, d1, d2, d3)>}> : (f32, memref<7x8x9x10xf32>, index, index, index, index) -> () loc("<stdin>":39:13)
            "affine.yield"() : () -> () loc("<stdin>":40:13)
          }) : () -> () loc("<stdin>":36:11)
          "affine.yield"() : () -> () loc("<stdin>":42:11)
        }) : () -> () loc("<stdin>":34:9)
        "affine.yield"() : () -> () loc("<stdin>":44:9)
      }) : () -> () loc("<stdin>":32:7)
      "affine.yield"() : () -> () loc("<stdin>":46:7)
    }) : () -> () loc("<stdin>":30:5)
    "func.return"() : () -> () loc("<stdin>":48:5)
  }) : () -> () loc("<stdin>":9:3)
}) : () -> () loc("<stdin>":8:1)
