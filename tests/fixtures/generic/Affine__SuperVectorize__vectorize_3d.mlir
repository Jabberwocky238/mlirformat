#map = affine_map<(d0, d1, d2) -> (d0, d1, d2)>
#map1 = affine_map<() -> (0)>
#map2 = affine_map<()[s0] -> (s0)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<?x?x?xf32>) -> (), sym_name = "vec3d"}> ({
  ^bb0(%arg0: memref<?x?x?xf32>):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = 1 : index}> : () -> index
    %2 = "arith.constant"() <{value = 2 : index}> : () -> index
    %3 = "memref.dim"(%arg0, %0) : (memref<?x?x?xf32>, index) -> index
    %4 = "memref.dim"(%arg0, %1) : (memref<?x?x?xf32>, index) -> index
    %5 = "memref.dim"(%arg0, %2) : (memref<?x?x?xf32>, index) -> index
    "affine.for"(%3) <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 1, 0>, step = 1 : index, upperBoundMap = #map2}> ({
    ^bb0(%arg1: index):
      "affine.for"(%3) <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 1, 0>, step = 1 : index, upperBoundMap = #map2}> ({
      ^bb0(%arg2: index):
        "affine.for"(%3) <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 1, 0>, step = 1 : index, upperBoundMap = #map2}> ({
        ^bb0(%arg3: index):
          "affine.for"(%4) <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 1, 0>, step = 1 : index, upperBoundMap = #map2}> ({
          ^bb0(%arg4: index):
            "affine.for"(%5) <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 1, 0>, step = 1 : index, upperBoundMap = #map2}> ({
            ^bb0(%arg5: index):
              %6 = "affine.load"(%arg0, %arg3, %arg4, %arg5) <{map = #map}> : (memref<?x?x?xf32>, index, index, index) -> f32
              "affine.yield"() : () -> ()
            }) : (index) -> ()
            "affine.yield"() : () -> ()
          }) : (index) -> ()
          "affine.yield"() : () -> ()
        }) : (index) -> ()
        "affine.yield"() : () -> ()
      }) : (index) -> ()
      "affine.yield"() : () -> ()
    }) : (index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

