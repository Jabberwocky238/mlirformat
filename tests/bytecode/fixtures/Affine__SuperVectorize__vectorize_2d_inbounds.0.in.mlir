"builtin.module"() ({
  "func.func"() <{function_type = (memref<512x512xf32>, memref<512x512xf32>) -> (), sym_name = "copy"}> ({
  ^bb0(%arg6: memref<512x512xf32> loc("<stdin>":9:8), %arg7: memref<512x512xf32> loc("<stdin>":9:36)):
    "affine.for"() <{lowerBoundMap = affine_map<() -> (0)>, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = affine_map<() -> (512)>}> ({
    ^bb0(%arg8: index loc("<stdin>":11:10)):
      "affine.for"() <{lowerBoundMap = affine_map<() -> (0)>, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = affine_map<() -> (512)>}> ({
      ^bb0(%arg9: index loc("<stdin>":13:12)):
        %2 = "affine.load"(%arg6, %arg8, %arg9) <{map = affine_map<(d0, d1) -> (d0, d1)>}> : (memref<512x512xf32>, index, index) -> f32 loc("<stdin>":14:14)
        "affine.store"(%2, %arg7, %arg8, %arg9) <{map = affine_map<(d0, d1) -> (d0, d1)>}> : (f32, memref<512x512xf32>, index, index) -> () loc("<stdin>":15:9)
        "affine.yield"() : () -> () loc("<stdin>":16:9)
      }) : () -> () loc("<stdin>":12:7)
      "affine.yield"() : () -> () loc("<stdin>":18:7)
    }) : () -> () loc("<stdin>":10:5)
    "func.return"() : () -> () loc("<stdin>":20:5)
  }) : () -> () loc("<stdin>":8:3)
  "func.func"() <{function_type = (memref<512x512xf32>, memref<512x512xf32>, memref<512x512xf32>) -> (), sym_name = "matmul"}> ({
  ^bb0(%arg0: memref<512x512xf32> loc("<stdin>":23:8), %arg1: memref<512x512xf32> loc("<stdin>":23:36), %arg2: memref<512x512xf32> loc("<stdin>":23:64)):
    "linalg.matmul"(%arg0, %arg1, %arg2) <{indexing_maps = [affine_map<(d0, d1, d2) -> (d0, d2)>, affine_map<(d0, d1, d2) -> (d2, d1)>, affine_map<(d0, d1, d2) -> (d0, d1)>], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg3: f32 loc("<stdin>":25:10), %arg4: f32 loc("<stdin>":25:22), %arg5: f32 loc("<stdin>":25:34)):
      %0 = "arith.mulf"(%arg3, %arg4) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32 loc("<stdin>":26:12)
      %1 = "arith.addf"(%arg5, %0) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32 loc("<stdin>":27:12)
      "linalg.yield"(%1) : (f32) -> () loc("<stdin>":28:7)
    }) : (memref<512x512xf32>, memref<512x512xf32>, memref<512x512xf32>) -> () loc("<stdin>":24:5)
    "func.return"() : () -> () loc("<stdin>":30:5)
  }) : () -> () loc("<stdin>":22:3)
}) : () -> () loc("<stdin>":7:1)
