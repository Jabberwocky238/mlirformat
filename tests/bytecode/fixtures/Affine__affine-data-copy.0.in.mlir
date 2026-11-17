"builtin.module"() ({
  "func.func"() <{function_type = (memref<4096x4096xf32>, memref<4096x4096xf32>, memref<4096x4096xf32>) -> memref<4096x4096xf32>, sym_name = "matmul"}> ({
  ^bb0(%arg0: memref<4096x4096xf32> loc("<stdin>":8:8), %arg1: memref<4096x4096xf32> loc("<stdin>":8:38), %arg2: memref<4096x4096xf32> loc("<stdin>":8:68)):
    "affine.for"() <{lowerBoundMap = affine_map<() -> (0)>, operandSegmentSizes = array<i32: 0, 0, 0>, step = 128 : index, upperBoundMap = affine_map<() -> (4096)>}> ({
    ^bb0(%arg3: index loc("<stdin>":10:10)):
      "affine.for"() <{lowerBoundMap = affine_map<() -> (0)>, operandSegmentSizes = array<i32: 0, 0, 0>, step = 128 : index, upperBoundMap = affine_map<() -> (4096)>}> ({
      ^bb0(%arg4: index loc("<stdin>":12:12)):
        "affine.for"() <{lowerBoundMap = affine_map<() -> (0)>, operandSegmentSizes = array<i32: 0, 0, 0>, step = 128 : index, upperBoundMap = affine_map<() -> (4096)>}> ({
        ^bb0(%arg5: index loc("<stdin>":14:14)):
          "affine.for"(%arg3, %arg3) <{lowerBoundMap = affine_map<(d0) -> (d0)>, operandSegmentSizes = array<i32: 1, 1, 0>, step = 1 : index, upperBoundMap = affine_map<(d0) -> (d0 + 128)>}> ({
          ^bb0(%arg6: index loc("<stdin>":16:16)):
            "affine.for"(%arg4, %arg4) <{lowerBoundMap = affine_map<(d0) -> (d0)>, operandSegmentSizes = array<i32: 1, 1, 0>, step = 1 : index, upperBoundMap = affine_map<(d0) -> (d0 + 128)>}> ({
            ^bb0(%arg7: index loc("<stdin>":18:18)):
              "affine.for"(%arg5, %arg5) <{lowerBoundMap = affine_map<(d0) -> (d0)>, operandSegmentSizes = array<i32: 1, 1, 0>, step = 1 : index, upperBoundMap = affine_map<(d0) -> (d0 + 128)>}> ({
              ^bb0(%arg8: index loc("<stdin>":20:20)):
                %0 = "affine.load"(%arg0, %arg6, %arg8) <{map = affine_map<(d0, d1) -> (d0, d1)>}> : (memref<4096x4096xf32>, index, index) -> f32 loc("<stdin>":21:22)
                %1 = "affine.load"(%arg1, %arg8, %arg7) <{map = affine_map<(d0, d1) -> (d0, d1)>}> : (memref<4096x4096xf32>, index, index) -> f32 loc("<stdin>":22:22)
                %2 = "affine.load"(%arg2, %arg6, %arg7) <{map = affine_map<(d0, d1) -> (d0, d1)>}> : (memref<4096x4096xf32>, index, index) -> f32 loc("<stdin>":23:22)
                %3 = "arith.mulf"(%0, %1) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32 loc("<stdin>":24:22)
                %4 = "arith.addf"(%2, %3) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32 loc("<stdin>":25:22)
                "affine.store"(%4, %arg2, %arg6, %arg7) <{map = affine_map<(d0, d1) -> (d0, d1)>}> : (f32, memref<4096x4096xf32>, index, index) -> () loc("<stdin>":26:17)
                "affine.yield"() : () -> () loc("<stdin>":27:17)
              }) : (index, index) -> () loc("<stdin>":19:15)
              "affine.yield"() : () -> () loc("<stdin>":29:15)
            }) : (index, index) -> () loc("<stdin>":17:13)
            "affine.yield"() : () -> () loc("<stdin>":31:13)
          }) : (index, index) -> () loc("<stdin>":15:11)
          "affine.yield"() : () -> () loc("<stdin>":33:11)
        }) : () -> () loc("<stdin>":13:9)
        "affine.yield"() : () -> () loc("<stdin>":35:9)
      }) : () -> () loc("<stdin>":11:7)
      "affine.yield"() : () -> () loc("<stdin>":37:7)
    }) : () -> () loc("<stdin>":9:5)
    "func.return"(%arg2) : (memref<4096x4096xf32>) -> () loc("<stdin>":39:5)
  }) : () -> () loc("<stdin>":7:3)
}) : () -> () loc("<stdin>":6:1)
