#map = affine_map<() -> (0)>
#map1 = affine_map<() -> (10)>
#map2 = affine_map<(d0, d1) -> (d0, d1)>
#map3 = affine_map<() -> (5)>
"builtin.module"() ({
  "func.func"() <{function_type = (vector<4xf32>, vector<4xf32>) -> (), sym_name = "invalid_operand"}> ({
  ^bb0(%arg4: vector<4xf32>, %arg5: vector<4xf32>):
    "affine.for"() <{lowerBoundMap = #map, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map1}> ({
    ^bb0(%arg6: index):
      %1 = "vector.reduction"(%arg4) <{fastmath = #arith.fastmath<none>, kind = #vector.kind<add>}> : (vector<4xf32>) -> f32
      "affine.yield"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<10x20xf32>, memref<10x20xf32>) -> (), sym_name = "invalid_result"}> ({
  ^bb0(%arg0: memref<10x20xf32>, %arg1: memref<10x20xf32>):
    "affine.for"() <{lowerBoundMap = #map, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map1}> ({
    ^bb0(%arg2: index):
      "affine.for"() <{lowerBoundMap = #map, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map3}> ({
      ^bb0(%arg3: index):
        %0 = "affine.vector_load"(%arg0, %arg2, %arg3) <{map = #map2}> : (memref<10x20xf32>, index, index) -> vector<4xf32>
        "affine.vector_store"(%0, %arg1, %arg2, %arg3) <{map = #map2}> : (vector<4xf32>, memref<10x20xf32>, index, index) -> ()
        "affine.yield"() : () -> ()
      }) : () -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

