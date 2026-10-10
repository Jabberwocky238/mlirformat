#map = affine_map<(d0, d1) -> (d0, d1)>
#map1 = affine_map<(d0, d1, d2) -> (d0, d1 * 8 + d2)>
#map2 = affine_map<(d0, d1) -> (d0, d1 * 8)>
#map3 = affine_map<(d0, d1) -> (d0, d1 * 4)>
#map4 = affine_map<() -> (0)>
#map5 = affine_map<()[s0] -> (s0)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<?x?xf32>, memref<?x?x?xf32>) -> (), sym_name = "loop_simple"}> ({
  ^bb0(%arg0: memref<?x?xf32>, %arg1: memref<?x?x?xf32>):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "memref.dim"(%arg0, %0) : (memref<?x?xf32>, index) -> index
    "affine.for"(%1) <{lowerBoundMap = #map4, operandSegmentSizes = array<i32: 0, 1, 0>, step = 1 : index, upperBoundMap = #map5}> ({
    ^bb0(%arg2: index):
      "affine.for"(%1) <{lowerBoundMap = #map4, operandSegmentSizes = array<i32: 0, 1, 0>, step = 1 : index, upperBoundMap = #map5}> ({
      ^bb0(%arg3: index):
        %2 = "affine.load"(%arg0, %0, %arg2) <{map = #map}> : (memref<?x?xf32>, index, index) -> f32
        %3 = "affine.load"(%arg0, %0, %arg2, %arg3) <{map = #map1}> : (memref<?x?xf32>, index, index, index) -> f32
        %4 = "affine.load"(%arg0, %arg2, %0) <{map = #map}> : (memref<?x?xf32>, index, index) -> f32
        %5 = "affine.load"(%arg0, %arg2, %arg3) <{map = #map2}> : (memref<?x?xf32>, index, index) -> f32
        %6 = "affine.load"(%arg0, %arg3, %arg2) <{map = #map3}> : (memref<?x?xf32>, index, index) -> f32
        "affine.yield"() : () -> ()
      }) : (index) -> ()
      "affine.yield"() : () -> ()
    }) : (index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0) -> (0)>
#map1 = affine_map<(d0) -> (d0 * -2)>
#map2 = affine_map<(d0) -> (d0 * 2)>
#map3 = affine_map<(d0, d1) -> ((d0 + d1) floordiv 2)>
#map4 = affine_map<() -> (0)>
#map5 = affine_map<() -> (100)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<100xf32>) -> (), sym_name = "loop_unsimplified"}> ({
  ^bb0(%arg0: memref<100xf32>):
    "affine.for"() <{lowerBoundMap = #map4, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map5}> ({
    ^bb0(%arg1: index):
      %0 = "affine.load"(%arg0, %arg1) <{map = #map}> : (memref<100xf32>, index) -> f32
      %1 = "affine.apply"(%arg1) <{map = #map1}> : (index) -> index
      %2 = "affine.apply"(%arg1) <{map = #map2}> : (index) -> index
      %3 = "affine.load"(%arg0, %1, %2) <{map = #map3}> : (memref<100xf32>, index, index) -> f32
      "affine.yield"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0) -> (d0)>
#map1 = affine_map<(d0, d1, d2, d3) -> (0, d0 * -16 + d1, 0, d2 * -16 + d3)>
#map2 = affine_map<(d0) -> (d0 * 16)>
#map3 = affine_map<(d0) -> (d0 * 16 + 16)>
#map4 = affine_map<(d0, d1, d2, d3, d4, d5) -> (0, d0 * -16 + d1, -d2 + d3, d4 * -16 + d5)>
#map5 = affine_map<(d0, d1, d2) -> (0, d0, d1, d2)>
#map6 = affine_map<(d0) -> (d0 + 1)>
#map7 = affine_map<() -> (0)>
#map8 = affine_map<() -> (14)>
#map9 = affine_map<() -> (224)>
#map10 = affine_map<() -> (4)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<*xf32>) -> (), sym_name = "tiled"}> ({
  ^bb0(%arg0: memref<*xf32>):
    %0 = "memref.alloc"() <{alignment = 64 : i64, operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<1x224x224x64xf32>
    %1 = "memref.cast"(%arg0) : (memref<*xf32>) -> memref<64xf32>
    "affine.for"() <{lowerBoundMap = #map7, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map10}> ({
    ^bb0(%arg1: index):
      "affine.for"() <{lowerBoundMap = #map7, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map9}> ({
      ^bb0(%arg2: index):
        "affine.for"() <{lowerBoundMap = #map7, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map8}> ({
        ^bb0(%arg3: index):
          %2 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<1x16x1x16xf32>
          "affine.for"(%arg1, %arg1) <{lowerBoundMap = #map2, operandSegmentSizes = array<i32: 1, 1, 0>, step = 1 : index, upperBoundMap = #map3}> ({
          ^bb0(%arg7: index):
            "affine.for"(%arg3, %arg3) <{lowerBoundMap = #map2, operandSegmentSizes = array<i32: 1, 1, 0>, step = 1 : index, upperBoundMap = #map3}> ({
            ^bb0(%arg8: index):
              %4 = "affine.load"(%1, %arg7) <{map = #map}> : (memref<64xf32>, index) -> f32
              "affine.store"(%4, %2, %arg1, %arg7, %arg3, %arg8) <{map = #map1}> : (f32, memref<1x16x1x16xf32>, index, index, index, index) -> ()
              "affine.yield"() : () -> ()
            }) : (index, index) -> ()
            "affine.yield"() : () -> ()
          }) : (index, index) -> ()
          "affine.for"(%arg1, %arg1) <{lowerBoundMap = #map2, operandSegmentSizes = array<i32: 1, 1, 0>, step = 1 : index, upperBoundMap = #map3}> ({
          ^bb0(%arg4: index):
            "affine.for"(%arg2, %arg2) <{lowerBoundMap = #map, operandSegmentSizes = array<i32: 1, 1, 0>, step = 1 : index, upperBoundMap = #map6}> ({
            ^bb0(%arg5: index):
              "affine.for"(%arg3, %arg3) <{lowerBoundMap = #map2, operandSegmentSizes = array<i32: 1, 1, 0>, step = 1 : index, upperBoundMap = #map3}> ({
              ^bb0(%arg6: index):
                %3 = "affine.load"(%2, %arg1, %arg4, %arg2, %arg5, %arg3, %arg6) <{map = #map4}> : (memref<1x16x1x16xf32>, index, index, index, index, index, index) -> f32
                "affine.store"(%3, %0, %arg5, %arg6, %arg4) <{map = #map5}> : (f32, memref<1x224x224x64xf32>, index, index, index) -> ()
                "affine.yield"() : () -> ()
              }) : (index, index) -> ()
              "affine.yield"() : () -> ()
            }) : (index, index) -> ()
            "affine.yield"() : () -> ()
          }) : (index, index) -> ()
          "memref.dealloc"(%2) : (memref<1x16x1x16xf32>) -> ()
          "affine.yield"() : () -> ()
        }) : () -> ()
        "affine.yield"() : () -> ()
      }) : () -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

