#map = affine_map<(d0) -> (d0)>
#map1 = affine_map<() -> (0)>
#map2 = affine_map<() -> (512)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<512xf32>, f32) -> (), sym_name = "uniform_arg"}> ({
  ^bb0(%arg0: memref<512xf32>, %arg1: f32):
    "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map2}> ({
    ^bb0(%arg2: index):
      %0 = "affine.load"(%arg0, %arg2) <{map = #map}> : (memref<512xf32>, index) -> f32
      %1 = "arith.addf"(%0, %arg1) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "affine.yield"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0) -> (d0)>
#map1 = affine_map<() -> (0)>
#map2 = affine_map<() -> (512)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<512xf32>, f32) -> (), sym_name = "multi_use_uniform_arg"}> ({
  ^bb0(%arg0: memref<512xf32>, %arg1: f32):
    "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map2}> ({
    ^bb0(%arg2: index):
      %0 = "affine.load"(%arg0, %arg2) <{map = #map}> : (memref<512xf32>, index) -> f32
      %1 = "arith.addf"(%0, %arg1) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %2 = "arith.addf"(%0, %arg1) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "affine.yield"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0) -> (d0, d0)>
#map1 = affine_map<(d0, d1) -> (d0, d1)>
#map2 = affine_map<() -> (0)>
#map3 = affine_map<()[s0] -> (s0)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<?x?xf32>, memref<?x?xf32>) -> (), sym_name = "uniform_load"}> ({
  ^bb0(%arg0: memref<?x?xf32>, %arg1: memref<?x?xf32>):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "memref.dim"(%arg0, %0) : (memref<?x?xf32>, index) -> index
    "affine.for"(%1) <{lowerBoundMap = #map2, operandSegmentSizes = array<i32: 0, 1, 0>, step = 1 : index, upperBoundMap = #map3}> ({
    ^bb0(%arg2: index):
      %2 = "affine.load"(%arg0, %arg2) <{map = #map}> : (memref<?x?xf32>, index) -> f32
      "affine.for"(%1) <{lowerBoundMap = #map2, operandSegmentSizes = array<i32: 0, 1, 0>, step = 1 : index, upperBoundMap = #map3}> ({
      ^bb0(%arg3: index):
        %3 = "affine.load"(%arg0, %arg2, %arg3) <{map = #map1}> : (memref<?x?xf32>, index, index) -> f32
        %4 = "arith.addf"(%2, %3) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
        "affine.yield"() : () -> ()
      }) : (index) -> ()
      "affine.yield"() : () -> ()
    }) : (index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

