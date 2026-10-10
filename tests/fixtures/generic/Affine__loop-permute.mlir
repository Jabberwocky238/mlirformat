#map = affine_map<() -> (0)>
#map1 = affine_map<()[s0] -> (s0)>
"builtin.module"() ({
  "func.func"() <{function_type = (index, index, index) -> (), sym_name = "permute"}> ({
  ^bb0(%arg0: index, %arg1: index, %arg2: index):
    "abc"() : () -> ()
    "affine.for"(%arg0) <{lowerBoundMap = #map, operandSegmentSizes = array<i32: 0, 1, 0>, step = 1 : index, upperBoundMap = #map1}> ({
    ^bb0(%arg3: index):
      "affine.for"(%arg1) <{lowerBoundMap = #map, operandSegmentSizes = array<i32: 0, 1, 0>, step = 1 : index, upperBoundMap = #map1}> ({
      ^bb0(%arg4: index):
        "affine.for"(%arg2) <{lowerBoundMap = #map, operandSegmentSizes = array<i32: 0, 1, 0>, step = 1 : index, upperBoundMap = #map1}> ({
        ^bb0(%arg5: index):
          "foo"(%arg3, %arg4) : (index, index) -> ()
          "bar"(%arg5) : (index) -> ()
          "affine.yield"() : () -> ()
        }) : (index) -> ()
        "affine.yield"() : () -> ()
      }) : (index) -> ()
      "affine.yield"() : () -> ()
    }) : (index) -> ()
    "xyz"() : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1) -> (d0 + 10, d1 + 20)>
#map1 = affine_map<() -> (0)>
#map2 = affine_map<()[s0] -> (s0)>
"builtin.module"() ({
  "func.func"() <{function_type = (index, index, index) -> (), sym_name = "check_validity_with_iter_args"}> ({
  ^bb0(%arg0: index, %arg1: index, %arg2: index):
    %0 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<100x100xf32>
    %1 = "arith.constant"() <{value = 1.000000e+00 : f32}> : () -> f32
    %2 = "arith.constant"() <{value = 10 : index}> : () -> index
    %3 = "arith.constant"() <{value = 20 : index}> : () -> index
    "affine.for"(%arg0) <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 1, 0>, step = 1 : index, upperBoundMap = #map2}> ({
    ^bb0(%arg3: index):
      "affine.for"(%arg1) <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 1, 0>, step = 1 : index, upperBoundMap = #map2}> ({
      ^bb0(%arg4: index):
        %4 = "affine.for"(%arg2, %1) <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 1, 1>, step = 1 : index, upperBoundMap = #map2}> ({
        ^bb0(%arg5: index, %arg6: f32):
          %5 = "affine.load"(%0, %arg3, %arg4) <{map = #map}> : (memref<100x100xf32>, index, index) -> f32
          %6 = "arith.addf"(%5, %1) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
          "affine.store"(%6, %0, %arg3, %arg4) <{map = #map}> : (f32, memref<100x100xf32>, index, index) -> ()
          %7 = "arith.addf"(%6, %arg6) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
          "affine.yield"(%arg6) : (f32) -> ()
        }) : (index, f32) -> f32
        "affine.yield"() : () -> ()
      }) : (index) -> ()
      "affine.yield"() : () -> ()
    }) : (index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

