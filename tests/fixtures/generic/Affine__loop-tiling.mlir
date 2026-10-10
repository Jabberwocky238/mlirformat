#map = affine_map<() -> (0)>
#map1 = affine_map<() -> (1024)>
#map2 = affine_map<() -> (512)>
#map3 = affine_map<() -> (256)>
#map4 = affine_map<() -> (50)>
#map5 = affine_map<() -> (21)>
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "loop_tiling"}> ({
    "affine.for"() <{lowerBoundMap = #map, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map3}> ({
    ^bb0(%arg2: index):
      "affine.for"() <{lowerBoundMap = #map, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map2}> ({
      ^bb0(%arg3: index):
        "affine.for"() <{lowerBoundMap = #map, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map1}> ({
        ^bb0(%arg4: index):
          "test.foo"(%arg2, %arg3, %arg4) : (index, index, index) -> ()
          "affine.yield"() : () -> ()
        }) : () -> ()
        "affine.yield"() : () -> ()
      }) : () -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    "affine.for"() <{lowerBoundMap = #map, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map4}> ({
    ^bb0(%arg1: index):
      "test.bar"(%arg1, %arg1) : (index, index) -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    "affine.for"() <{lowerBoundMap = #map, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map5}> ({
    ^bb0(%arg0: index):
      "test.foobar"(%arg0) : (index) -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<()[s0] -> (0, s0)>
#map1 = affine_map<()[s0, s1] -> (s0, 4096 floordiv s1)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<?xi32>, index, index) -> (), sym_name = "loop_max_min_bound"}> ({
  ^bb0(%arg0: memref<?xi32>, %arg1: index, %arg2: index):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "memref.dim"(%arg0, %0) : (memref<?xi32>, index) -> index
    "affine.for"(%arg1, %1, %arg2) <{lowerBoundMap = #map, operandSegmentSizes = array<i32: 1, 2, 0>, step = 1 : index, upperBoundMap = #map1}> ({
    ^bb0(%arg3: index):
      %2 = "arith.addi"(%arg3, %arg3) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
      "affine.yield"() : () -> ()
    }) : (index, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1) -> (d0, d1)>
#map1 = affine_map<() -> (0)>
#map2 = affine_map<() -> (250)>
#map3 = affine_map<() -> (256)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<256x256xvector<64xf32>>, memref<256x256xvector<64xf32>>, memref<256x256xvector<64xf32>>) -> memref<256x256xvector<64xf32>>, sym_name = "simple_matmul"}> ({
  ^bb0(%arg0: memref<256x256xvector<64xf32>>, %arg1: memref<256x256xvector<64xf32>>, %arg2: memref<256x256xvector<64xf32>>):
    "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map3}> ({
    ^bb0(%arg3: index):
      "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map3}> ({
      ^bb0(%arg4: index):
        "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map2}> ({
        ^bb0(%arg5: index):
          %0 = "affine.load"(%arg0, %arg3, %arg5) <{map = #map}> : (memref<256x256xvector<64xf32>>, index, index) -> vector<64xf32>
          %1 = "affine.load"(%arg1, %arg5, %arg4) <{map = #map}> : (memref<256x256xvector<64xf32>>, index, index) -> vector<64xf32>
          %2 = "affine.load"(%arg2, %arg3, %arg4) <{map = #map}> : (memref<256x256xvector<64xf32>>, index, index) -> vector<64xf32>
          %3 = "arith.mulf"(%0, %1) <{fastmath = #arith.fastmath<none>}> : (vector<64xf32>, vector<64xf32>) -> vector<64xf32>
          %4 = "arith.addf"(%2, %3) <{fastmath = #arith.fastmath<none>}> : (vector<64xf32>, vector<64xf32>) -> vector<64xf32>
          "affine.store"(%4, %arg2, %arg3, %arg4) <{map = #map}> : (vector<64xf32>, memref<256x256xvector<64xf32>>, index, index) -> ()
          "affine.yield"() : () -> ()
        }) : () -> ()
        "affine.yield"() : () -> ()
      }) : () -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    "func.return"(%arg2) : (memref<256x256xvector<64xf32>>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1) -> (d0, d1)>
#map1 = affine_map<() -> (0)>
#map2 = affine_map<()[s0] -> (s0)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<?x?xf32>, memref<?x?xf32>, memref<?x?xf32>) -> (), sym_name = "tile_using_symbolic_loop_upper_bounds"}> ({
  ^bb0(%arg0: memref<?x?xf32>, %arg1: memref<?x?xf32>, %arg2: memref<?x?xf32>):
    %0 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %1 = "arith.constant"() <{value = 0 : index}> : () -> index
    %2 = "memref.dim"(%arg0, %1) : (memref<?x?xf32>, index) -> index
    "affine.for"(%2) <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 1, 0>, step = 1 : index, upperBoundMap = #map2}> ({
    ^bb0(%arg3: index):
      "affine.for"(%2) <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 1, 0>, step = 1 : index, upperBoundMap = #map2}> ({
      ^bb0(%arg4: index):
        "affine.store"(%0, %arg2, %arg3, %arg4) <{map = #map}> : (f32, memref<?x?xf32>, index, index) -> ()
        "affine.for"(%2) <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 1, 0>, step = 1 : index, upperBoundMap = #map2}> ({
        ^bb0(%arg5: index):
          %3 = "affine.load"(%arg0, %arg3, %arg5) <{map = #map}> : (memref<?x?xf32>, index, index) -> f32
          %4 = "affine.load"(%arg1, %arg5, %arg4) <{map = #map}> : (memref<?x?xf32>, index, index) -> f32
          %5 = "arith.mulf"(%3, %4) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
          %6 = "affine.load"(%arg2, %arg3, %arg4) <{map = #map}> : (memref<?x?xf32>, index, index) -> f32
          %7 = "arith.addf"(%6, %5) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
          "affine.store"(%7, %arg2, %arg3, %arg4) <{map = #map}> : (f32, memref<?x?xf32>, index, index) -> ()
          "affine.yield"() : () -> ()
        }) : (index) -> ()
        "affine.yield"() : () -> ()
      }) : (index) -> ()
      "affine.yield"() : () -> ()
    }) : (index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0) -> (d0)>
#map1 = affine_map<() -> (0)>
#map2 = affine_map<()[s0, s1] -> (s0 + s1)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<?xf32>, index) -> (), sym_name = "tile_using_loop_upper_bounds_in_two_symbols"}> ({
  ^bb0(%arg0: memref<?xf32>, %arg1: index):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "memref.dim"(%arg0, %0) : (memref<?xf32>, index) -> index
    "affine.for"(%1, %arg1) <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 2, 0>, step = 1 : index, upperBoundMap = #map2}> ({
    ^bb0(%arg2: index):
      %2 = "affine.load"(%arg0, %arg2) <{map = #map}> : (memref<?xf32>, index) -> f32
      "affine.yield"() : () -> ()
    }) : (index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0) -> (d0)>
#map1 = affine_map<() -> (0)>
#map2 = affine_map<()[s0] -> (s0)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<50xf32>, index) -> (), sym_name = "tile_loop_with_non_unit_step"}> ({
  ^bb0(%arg0: memref<50xf32>, %arg1: index):
    "affine.for"(%arg1) <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 1, 0>, step = 5 : index, upperBoundMap = #map2}> ({
    ^bb0(%arg2: index):
      %0 = "affine.load"(%arg0, %arg2) <{map = #map}> : (memref<50xf32>, index) -> f32
      "affine.yield"() : () -> ()
    }) : (index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0) -> (d0)>
#map1 = affine_map<(d0) -> (d0 + 4)>
#map2 = affine_map<(d0) -> (d0 + 2)>
"builtin.module"() ({
  "func.func"() <{function_type = (index, index) -> (), sym_name = "tile_size_larger_than_trip_count_symbolic_bound"}> ({
  ^bb0(%arg0: index, %arg1: index):
    "affine.for"(%arg0, %arg0) <{lowerBoundMap = #map, operandSegmentSizes = array<i32: 1, 1, 0>, step = 1 : index, upperBoundMap = #map2}> ({
    ^bb0(%arg2: index):
      "affine.for"(%arg1, %arg1) <{lowerBoundMap = #map, operandSegmentSizes = array<i32: 1, 1, 0>, step = 1 : index, upperBoundMap = #map1}> ({
      ^bb0(%arg3: index):
        "test.foo"() : () -> ()
        "affine.yield"() : () -> ()
      }) : (index, index) -> ()
      "affine.yield"() : () -> ()
    }) : (index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1) -> (d0, d1)>
#map1 = affine_map<() -> (0)>
#map2 = affine_map<() -> (1)>
#map3 = affine_map<() -> (196608)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<196608x1xf32>, memref<196608x1xf32>) -> memref<196608x1xf32>, sym_name = "trip_count_one"}> ({
  ^bb0(%arg0: memref<196608x1xf32>, %arg1: memref<196608x1xf32>):
    "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map3}> ({
    ^bb0(%arg2: index):
      "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map2}> ({
      ^bb0(%arg3: index):
        %0 = "affine.load"(%arg0, %arg2, %arg3) <{map = #map}> : (memref<196608x1xf32>, index, index) -> f32
        "affine.store"(%0, %arg1, %arg2, %arg3) <{map = #map}> : (f32, memref<196608x1xf32>, index, index) -> ()
        "affine.yield"() : () -> ()
      }) : () -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    "func.return"(%arg1) : (memref<196608x1xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<() -> (0)>
#map1 = affine_map<()[s0] -> (s0)>
"builtin.module"() ({
  "func.func"() <{function_type = (index, index) -> (), sym_name = "separate_full_tile_2d"}> ({
  ^bb0(%arg0: index, %arg1: index):
    "affine.for"(%arg0) <{lowerBoundMap = #map, operandSegmentSizes = array<i32: 0, 1, 0>, step = 1 : index, upperBoundMap = #map1}> ({
    ^bb0(%arg2: index):
      "affine.for"(%arg1) <{lowerBoundMap = #map, operandSegmentSizes = array<i32: 0, 1, 0>, step = 1 : index, upperBoundMap = #map1}> ({
      ^bb0(%arg3: index):
        "test.foo"() : () -> ()
        "affine.yield"() : () -> ()
      }) : (index) -> ()
      "affine.yield"() : () -> ()
    }) : (index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<() -> (0)>
#map1 = affine_map<(d0)[s0] -> (d0, s0)>
#map2 = affine_map<()[s0] -> (s0)>
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "non_hyperrectangular_loop"}> ({
    %0 = "arith.constant"() <{value = 128 : index}> : () -> index
    "affine.for"(%0) <{lowerBoundMap = #map, operandSegmentSizes = array<i32: 0, 1, 0>, step = 1 : index, upperBoundMap = #map2}> ({
    ^bb0(%arg0: index):
      "affine.for"(%arg0, %0) <{lowerBoundMap = #map, operandSegmentSizes = array<i32: 0, 2, 0>, step = 1 : index, upperBoundMap = #map1}> ({
      ^bb0(%arg1: index):
        "test.foo"() : () -> ()
        "affine.yield"() : () -> ()
      }) : (index, index) -> ()
      "affine.yield"() : () -> ()
    }) : (index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<() -> (0)>
#map1 = affine_map<() -> (10)>
"builtin.module"() ({
  "func.func"() <{function_type = (index) -> (), sym_name = "yield_values"}> ({
  ^bb0(%arg0: index):
    %0 = "affine.for"(%arg0) <{lowerBoundMap = #map, operandSegmentSizes = array<i32: 0, 0, 1>, step = 1 : index, upperBoundMap = #map1}> ({
    ^bb0(%arg1: index, %arg2: index):
      "test.foo"() : () -> ()
      "affine.yield"(%arg2) : (index) -> ()
    }) : (index) -> index
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
^bb0:
}) : () -> ()

// -----
#map = affine_map<(d0, d1) -> (d0, d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (index, index, index, index) -> (), sym_name = "separate_full_tile_1d_max_min"}> ({
  ^bb0(%arg0: index, %arg1: index, %arg2: index, %arg3: index):
    "affine.for"(%arg0, %arg1, %arg2, %arg3) <{lowerBoundMap = #map, operandSegmentSizes = array<i32: 2, 2, 0>, step = 1 : index, upperBoundMap = #map}> ({
    ^bb0(%arg4: index):
      "affine.yield"() : () -> ()
    }) : (index, index, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

