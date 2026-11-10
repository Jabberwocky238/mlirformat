#map = affine_map<(d0) -> (d0)>
#map1 = affine_map<(d0, d1) -> (d0, d1)>
#map2 = affine_map<() -> (0)>
#map3 = affine_map<() -> (30)>
#map4 = affine_map<() -> (20)>
#map5 = affine_map<(d0, d1) -> (d1)>
#map6 = affine_map<() -> (97)>
#map7 = affine_map<() -> (82)>
"builtin.module"() ({
  "func.func"() <{function_type = (index, index) -> f32, sym_name = "vector_add_2d"}> ({
  ^bb0(%arg7: index, %arg8: index):
    %4 = "memref.alloc"(%arg7, %arg8) <{operandSegmentSizes = array<i32: 2, 0>}> : (index, index) -> memref<?x?xf32>
    %5 = "memref.alloc"(%arg7, %arg8) <{operandSegmentSizes = array<i32: 2, 0>}> : (index, index) -> memref<?x?xf32>
    %6 = "memref.alloc"(%arg7, %arg8) <{operandSegmentSizes = array<i32: 2, 0>}> : (index, index) -> memref<?x?xf32>
    %7 = "arith.constant"() <{value = 0 : index}> : () -> index
    %8 = "arith.constant"() <{value = 1.000000e+00 : f32}> : () -> f32
    %9 = "arith.constant"() <{value = dense<1.000000e+00> : vector<8x256xf32>}> : () -> vector<8x256xf32>
    %10 = "arith.constant"() <{value = dense<1.000000e+00> : vector<1x3x7x8x8xf32>}> : () -> vector<1x3x7x8x8xf32>
    %11 = "arith.constant"() <{value = dense<1.000000e+00> : vector<1x3x7x4x4xf32>}> : () -> vector<1x3x7x4x4xf32>
    %12 = "arith.constant"() <{value = dense<1.000000e+00> : vector<3x4x5x8xf32>}> : () -> vector<3x4x5x8xf32>
    %13 = "arith.constant"() <{value = dense<1.000000e+00> : vector<3x4x4x8xf32>}> : () -> vector<3x4x4x8xf32>
    %14 = "arith.constant"() <{value = dense<1.000000e+00> : vector<1x2x10x32xf32>}> : () -> vector<1x2x10x32xf32>
    %15 = "arith.constant"() <{value = 7 : index}> : () -> index
    %16 = "arith.constant"() <{value = 42 : index}> : () -> index
    %17 = "memref.load"(%6, %15, %16) : (memref<?x?xf32>, index, index) -> f32
    "func.return"(%17) : (f32) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<20x30xf32>, memref<20xf32>) -> (), sym_name = "double_loop_nest"}> ({
  ^bb0(%arg3: memref<20x30xf32>, %arg4: memref<20xf32>):
    "affine.for"() <{lowerBoundMap = #map2, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map4}> ({
    ^bb0(%arg5: index):
      %2 = "affine.load"(%arg4, %arg5) <{map = #map}> : (memref<20xf32>, index) -> f32
      "affine.for"() <{lowerBoundMap = #map2, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map3}> ({
      ^bb0(%arg6: index):
        %3 = "affine.load"(%arg3, %arg5, %arg6) <{map = #map1}> : (memref<20x30xf32>, index, index) -> f32
        "affine.store"(%3, %arg3, %arg5, %arg6) <{map = #map1}> : (f32, memref<20x30xf32>, index, index) -> ()
        "affine.yield"() : () -> ()
      }) : () -> ()
      "affine.store"(%2, %arg4, %arg5) <{map = #map}> : (f32, memref<20xf32>, index) -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<82x97xf32>) -> (), sym_name = "transfer_rank_mismatch_no_crash"}> ({
  ^bb0(%arg0: memref<82x97xf32>):
    %0 = "ub.poison"() <{value = #ub.poison}> : () -> f32
    "affine.for"() <{lowerBoundMap = #map2, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map7}> ({
    ^bb0(%arg1: index):
      "affine.for"() <{lowerBoundMap = #map2, operandSegmentSizes = array<i32: 0, 0, 0>, step = 128 : index, upperBoundMap = #map6}> ({
      ^bb0(%arg2: index):
        %1 = "vector.transfer_read"(%arg0, %arg1, %arg2, %0) <{in_bounds = [false], operandSegmentSizes = array<i32: 1, 2, 1, 0>, permutation_map = #map5}> : (memref<82x97xf32>, index, index, f32) -> vector<128xf32>
        "affine.yield"() : () -> ()
      }) : () -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

