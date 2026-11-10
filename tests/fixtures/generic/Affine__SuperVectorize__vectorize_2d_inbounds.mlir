#map = affine_map<(d0, d1) -> (d0, d1)>
#map1 = affine_map<() -> (0)>
#map2 = affine_map<() -> (512)>
#map3 = affine_map<(d0, d1, d2) -> (d0, d2)>
#map4 = affine_map<(d0, d1, d2) -> (d2, d1)>
#map5 = affine_map<(d0, d1, d2) -> (d0, d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<512x512xf32>, memref<512x512xf32>) -> (), sym_name = "copy"}> ({
  ^bb0(%arg6: memref<512x512xf32>, %arg7: memref<512x512xf32>):
    "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map2}> ({
    ^bb0(%arg8: index):
      "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map2}> ({
      ^bb0(%arg9: index):
        %2 = "affine.load"(%arg6, %arg8, %arg9) <{map = #map}> : (memref<512x512xf32>, index, index) -> f32
        "affine.store"(%2, %arg7, %arg8, %arg9) <{map = #map}> : (f32, memref<512x512xf32>, index, index) -> ()
        "affine.yield"() : () -> ()
      }) : () -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<512x512xf32>, memref<512x512xf32>, memref<512x512xf32>) -> (), sym_name = "matmul"}> ({
  ^bb0(%arg0: memref<512x512xf32>, %arg1: memref<512x512xf32>, %arg2: memref<512x512xf32>):
    "linalg.matmul"(%arg0, %arg1, %arg2) <{indexing_maps = [#map3, #map4, #map5], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg3: f32, %arg4: f32, %arg5: f32):
      %0 = "arith.mulf"(%arg3, %arg4) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %1 = "arith.addf"(%arg5, %0) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%1) : (f32) -> ()
    }) : (memref<512x512xf32>, memref<512x512xf32>, memref<512x512xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

