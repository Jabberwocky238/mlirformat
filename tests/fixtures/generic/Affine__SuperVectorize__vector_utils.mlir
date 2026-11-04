#map = affine_map<(d0) -> (d0)>
#map1 = affine_map<(d0, d1) -> (d0, d1)>
#map2 = affine_map<() -> (0)>
#map3 = affine_map<() -> (30)>
#map4 = affine_map<() -> (20)>
"builtin.module"() ({
  "func.func"() <{function_type = (index, index) -> f32, sym_name = "vector_add_2d"}> ({
  ^bb0(%arg4: index, %arg5: index):
    %2 = "memref.alloc"(%arg4, %arg5) <{operandSegmentSizes = array<i32: 2, 0>}> : (index, index) -> memref<?x?xf32>
    %3 = "memref.alloc"(%arg4, %arg5) <{operandSegmentSizes = array<i32: 2, 0>}> : (index, index) -> memref<?x?xf32>
    %4 = "memref.alloc"(%arg4, %arg5) <{operandSegmentSizes = array<i32: 2, 0>}> : (index, index) -> memref<?x?xf32>
    %5 = "arith.constant"() <{value = 0 : index}> : () -> index
    %6 = "arith.constant"() <{value = 1.000000e+00 : f32}> : () -> f32
    %7 = "arith.constant"() <{value = dense<1.000000e+00> : vector<8x256xf32>}> : () -> vector<8x256xf32>
    %8 = "arith.constant"() <{value = dense<1.000000e+00> : vector<1x3x7x8x8xf32>}> : () -> vector<1x3x7x8x8xf32>
    %9 = "arith.constant"() <{value = dense<1.000000e+00> : vector<1x3x7x4x4xf32>}> : () -> vector<1x3x7x4x4xf32>
    %10 = "arith.constant"() <{value = dense<1.000000e+00> : vector<3x4x5x8xf32>}> : () -> vector<3x4x5x8xf32>
    %11 = "arith.constant"() <{value = dense<1.000000e+00> : vector<3x4x4x8xf32>}> : () -> vector<3x4x4x8xf32>
    %12 = "arith.constant"() <{value = dense<1.000000e+00> : vector<1x2x10x32xf32>}> : () -> vector<1x2x10x32xf32>
    %13 = "arith.constant"() <{value = 7 : index}> : () -> index
    %14 = "arith.constant"() <{value = 42 : index}> : () -> index
    %15 = "memref.load"(%4, %13, %14) : (memref<?x?xf32>, index, index) -> f32
    "func.return"(%15) : (f32) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<20x30xf32>, memref<20xf32>) -> (), sym_name = "double_loop_nest"}> ({
  ^bb0(%arg0: memref<20x30xf32>, %arg1: memref<20xf32>):
    "affine.for"() <{lowerBoundMap = #map2, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map4}> ({
    ^bb0(%arg2: index):
      %0 = "affine.load"(%arg1, %arg2) <{map = #map}> : (memref<20xf32>, index) -> f32
      "affine.for"() <{lowerBoundMap = #map2, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map3}> ({
      ^bb0(%arg3: index):
        %1 = "affine.load"(%arg0, %arg2, %arg3) <{map = #map1}> : (memref<20x30xf32>, index, index) -> f32
        "affine.store"(%1, %arg0, %arg2, %arg3) <{map = #map1}> : (f32, memref<20x30xf32>, index, index) -> ()
        "affine.yield"() : () -> ()
      }) : () -> ()
      "affine.store"(%0, %arg1, %arg2) <{map = #map}> : (f32, memref<20xf32>, index) -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

