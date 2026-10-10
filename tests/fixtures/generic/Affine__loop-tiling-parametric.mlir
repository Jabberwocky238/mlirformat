"builtin.module"() ({
^bb0:
}) : () -> ()

// -----
#map = affine_map<() -> (0)>
#map1 = affine_map<() -> (1024)>
#map2 = affine_map<() -> (512)>
#map3 = affine_map<() -> (256)>
"builtin.module"() ({
  "func.func"() <{function_type = (index, index, index) -> (), sym_name = "loop_tiling_3d"}> ({
  ^bb0(%arg0: index, %arg1: index, %arg2: index):
    "affine.for"() <{lowerBoundMap = #map, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map3}> ({
    ^bb0(%arg3: index):
      "affine.for"() <{lowerBoundMap = #map, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map2}> ({
      ^bb0(%arg4: index):
        "affine.for"() <{lowerBoundMap = #map, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map1}> ({
        ^bb0(%arg5: index):
          "test.foo"(%arg3, %arg4, %arg5) : (index, index, index) -> ()
          "affine.yield"() : () -> ()
        }) : () -> ()
        "affine.yield"() : () -> ()
      }) : () -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<() -> (0)>
#map1 = affine_map<() -> (1024)>
#map2 = affine_map<() -> (512)>
#map3 = affine_map<() -> (256)>
"builtin.module"() ({
  "func.func"() <{function_type = (index, index, index) -> (), sym_name = "loop_tiling_non_unit_step"}> ({
  ^bb0(%arg0: index, %arg1: index, %arg2: index):
    "affine.for"() <{lowerBoundMap = #map, operandSegmentSizes = array<i32: 0, 0, 0>, step = 4 : index, upperBoundMap = #map3}> ({
    ^bb0(%arg3: index):
      "affine.for"() <{lowerBoundMap = #map, operandSegmentSizes = array<i32: 0, 0, 0>, step = 3 : index, upperBoundMap = #map2}> ({
      ^bb0(%arg4: index):
        "affine.for"() <{lowerBoundMap = #map, operandSegmentSizes = array<i32: 0, 0, 0>, step = 2 : index, upperBoundMap = #map1}> ({
        ^bb0(%arg5: index):
          "test.foo"(%arg3, %arg4, %arg5) : (index, index, index) -> ()
          "affine.yield"() : () -> ()
        }) : () -> ()
        "affine.yield"() : () -> ()
      }) : () -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<() -> (0)>
#map1 = affine_map<()[s0, s1] -> (s0, 4096 floordiv s1)>
"builtin.module"() ({
  "func.func"() <{function_type = (index, memref<?xi32>, index, index) -> (), sym_name = "tile_loop_with_div_in_upper_bound"}> ({
  ^bb0(%arg0: index, %arg1: memref<?xi32>, %arg2: index, %arg3: index):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "memref.dim"(%arg1, %0) : (memref<?xi32>, index) -> index
    "affine.for"(%1, %arg3) <{lowerBoundMap = #map, operandSegmentSizes = array<i32: 0, 2, 0>, step = 1 : index, upperBoundMap = #map1}> ({
    ^bb0(%arg4: index):
      %2 = "arith.addi"(%arg4, %arg4) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
      "affine.yield"() : () -> ()
    }) : (index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<() -> (0)>
#map1 = affine_map<()[s0, s1] -> (s0, 4096 floordiv s1)>
"builtin.module"() ({
  "func.func"() <{function_type = (index, memref<?xi32>, index, index) -> (), sym_name = "tile_loop_with_div_in_upper_bound_non_unit_step"}> ({
  ^bb0(%arg0: index, %arg1: memref<?xi32>, %arg2: index, %arg3: index):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "memref.dim"(%arg1, %0) : (memref<?xi32>, index) -> index
    "affine.for"(%1, %arg3) <{lowerBoundMap = #map, operandSegmentSizes = array<i32: 0, 2, 0>, step = 4 : index, upperBoundMap = #map1}> ({
    ^bb0(%arg4: index):
      %2 = "arith.addi"(%arg4, %arg4) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
      "affine.yield"() : () -> ()
    }) : (index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<() -> (8)>
#map1 = affine_map<()[s0] -> (s0 + 16)>
#map2 = affine_map<() -> (256)>
"builtin.module"() ({
  "func.func"() <{function_type = (index, index, index, index) -> (), sym_name = "tile_loop_with_non_zero_lb"}> ({
  ^bb0(%arg0: index, %arg1: index, %arg2: index, %arg3: index):
    "affine.for"() <{lowerBoundMap = #map, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map2}> ({
    ^bb0(%arg4: index):
      "affine.for"(%arg3) <{lowerBoundMap = #map, operandSegmentSizes = array<i32: 0, 1, 0>, step = 1 : index, upperBoundMap = #map1}> ({
      ^bb0(%arg5: index):
        "affine.for"(%arg3) <{lowerBoundMap = #map, operandSegmentSizes = array<i32: 0, 1, 0>, step = 4 : index, upperBoundMap = #map1}> ({
        ^bb0(%arg6: index):
          "test.foo"(%arg4, %arg5, %arg6) : (index, index, index) -> ()
          "affine.yield"() : () -> ()
        }) : (index) -> ()
        "affine.yield"() : () -> ()
      }) : (index) -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1) -> (d0, d1)>
#map1 = affine_map<() -> (0)>
#map2 = affine_map<() -> (250)>
#map3 = affine_map<() -> (256)>
"builtin.module"() ({
  "func.func"() <{function_type = (index, index, index, memref<256x256xvector<64xf32>>, memref<256x256xvector<64xf32>>, memref<256x256xvector<64xf32>>) -> memref<256x256xvector<64xf32>>, sym_name = "simple_matmul"}> ({
  ^bb0(%arg0: index, %arg1: index, %arg2: index, %arg3: memref<256x256xvector<64xf32>>, %arg4: memref<256x256xvector<64xf32>>, %arg5: memref<256x256xvector<64xf32>>):
    "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map3}> ({
    ^bb0(%arg6: index):
      "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map3}> ({
      ^bb0(%arg7: index):
        "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map2}> ({
        ^bb0(%arg8: index):
          %0 = "affine.load"(%arg3, %arg6, %arg8) <{map = #map}> : (memref<256x256xvector<64xf32>>, index, index) -> vector<64xf32>
          %1 = "affine.load"(%arg4, %arg8, %arg7) <{map = #map}> : (memref<256x256xvector<64xf32>>, index, index) -> vector<64xf32>
          %2 = "affine.load"(%arg5, %arg6, %arg7) <{map = #map}> : (memref<256x256xvector<64xf32>>, index, index) -> vector<64xf32>
          %3 = "arith.mulf"(%0, %1) <{fastmath = #arith.fastmath<none>}> : (vector<64xf32>, vector<64xf32>) -> vector<64xf32>
          %4 = "arith.addf"(%2, %3) <{fastmath = #arith.fastmath<none>}> : (vector<64xf32>, vector<64xf32>) -> vector<64xf32>
          "affine.store"(%4, %arg5, %arg6, %arg7) <{map = #map}> : (vector<64xf32>, memref<256x256xvector<64xf32>>, index, index) -> ()
          "affine.yield"() : () -> ()
        }) : () -> ()
        "affine.yield"() : () -> ()
      }) : () -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    "func.return"(%arg5) : (memref<256x256xvector<64xf32>>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1) -> (d0, d1)>
#map1 = affine_map<() -> (0)>
#map2 = affine_map<()[s0] -> (s0)>
"builtin.module"() ({
  "func.func"() <{function_type = (index, index, memref<?x?xf32>, memref<?x?xf32>, memref<?x?xf32>) -> (), sym_name = "tile_using_symbolic_loop_upper_bounds"}> ({
  ^bb0(%arg0: index, %arg1: index, %arg2: memref<?x?xf32>, %arg3: memref<?x?xf32>, %arg4: memref<?x?xf32>):
    %0 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %1 = "arith.constant"() <{value = 0 : index}> : () -> index
    %2 = "memref.dim"(%arg2, %1) : (memref<?x?xf32>, index) -> index
    "affine.for"(%2) <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 1, 0>, step = 1 : index, upperBoundMap = #map2}> ({
    ^bb0(%arg5: index):
      "affine.for"(%2) <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 1, 0>, step = 1 : index, upperBoundMap = #map2}> ({
      ^bb0(%arg6: index):
        "affine.store"(%0, %arg4, %arg5, %arg6) <{map = #map}> : (f32, memref<?x?xf32>, index, index) -> ()
        "affine.for"(%2) <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 1, 0>, step = 1 : index, upperBoundMap = #map2}> ({
        ^bb0(%arg7: index):
          %3 = "affine.load"(%arg2, %arg5, %arg7) <{map = #map}> : (memref<?x?xf32>, index, index) -> f32
          %4 = "affine.load"(%arg3, %arg7, %arg6) <{map = #map}> : (memref<?x?xf32>, index, index) -> f32
          %5 = "arith.mulf"(%3, %4) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
          %6 = "affine.load"(%arg4, %arg5, %arg6) <{map = #map}> : (memref<?x?xf32>, index, index) -> f32
          %7 = "arith.addf"(%6, %5) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
          "affine.store"(%7, %arg4, %arg5, %arg6) <{map = #map}> : (f32, memref<?x?xf32>, index, index) -> ()
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
  "func.func"() <{function_type = (index, memref<?xf32>, index) -> (), sym_name = "tile_using_loop_upper_bounds_in_two_symbols"}> ({
  ^bb0(%arg0: index, %arg1: memref<?xf32>, %arg2: index):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "memref.dim"(%arg1, %0) : (memref<?xf32>, index) -> index
    "affine.for"(%1, %arg2) <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 2, 0>, step = 1 : index, upperBoundMap = #map2}> ({
    ^bb0(%arg3: index):
      %2 = "affine.load"(%arg1, %arg3) <{map = #map}> : (memref<?xf32>, index) -> f32
      "affine.yield"() : () -> ()
    }) : (index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<() -> (0)>
#map1 = affine_map<(d0)[s0] -> (d0 + s0 + 4)>
#map2 = affine_map<(d0)[s0] -> (d0 + s0 + 2)>
"builtin.module"() ({
  "func.func"() <{function_type = (index, index, index, index, index) -> (), sym_name = "tile_using_upper_bounds_in_dimensions_and_symbols"}> ({
  ^bb0(%arg0: index, %arg1: index, %arg2: index, %arg3: index, %arg4: index):
    "affine.for"(%arg2, %arg4) <{lowerBoundMap = #map, operandSegmentSizes = array<i32: 0, 2, 0>, step = 1 : index, upperBoundMap = #map2}> ({
    ^bb0(%arg5: index):
      "affine.for"(%arg3, %arg4) <{lowerBoundMap = #map, operandSegmentSizes = array<i32: 0, 2, 0>, step = 1 : index, upperBoundMap = #map1}> ({
      ^bb0(%arg6: index):
        "test.foo"() : () -> ()
        "affine.yield"() : () -> ()
      }) : (index, index) -> ()
      "affine.yield"() : () -> ()
    }) : (index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<() -> (0)>
#map1 = affine_map<(d0)[s0] -> (d0 + s0 + 4)>
#map2 = affine_map<(d0)[s0] -> (d0 + s0 + 2)>
"builtin.module"() ({
  "func.func"() <{function_type = (index, index, index, index, index) -> (), sym_name = "tile_using_upper_bounds_in_dimensions_and_symbols_non_unit_steps"}> ({
  ^bb0(%arg0: index, %arg1: index, %arg2: index, %arg3: index, %arg4: index):
    "affine.for"(%arg2, %arg4) <{lowerBoundMap = #map, operandSegmentSizes = array<i32: 0, 2, 0>, step = 2 : index, upperBoundMap = #map2}> ({
    ^bb0(%arg5: index):
      "affine.for"(%arg3, %arg4) <{lowerBoundMap = #map, operandSegmentSizes = array<i32: 0, 2, 0>, step = 4 : index, upperBoundMap = #map1}> ({
      ^bb0(%arg6: index):
        "test.foo"() : () -> ()
        "affine.yield"() : () -> ()
      }) : (index, index) -> ()
      "affine.yield"() : () -> ()
    }) : (index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<() -> (0)>
#map1 = affine_map<() -> (1024)>
#map2 = affine_map<() -> (512)>
#map3 = affine_map<() -> (256)>
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "too_few_tile_size_params"}> ({
    "affine.for"() <{lowerBoundMap = #map, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map3}> ({
    ^bb0(%arg0: index):
      "affine.for"() <{lowerBoundMap = #map, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map2}> ({
      ^bb0(%arg1: index):
        "affine.for"() <{lowerBoundMap = #map, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map1}> ({
        ^bb0(%arg2: index):
          "test.foo"(%arg0, %arg1, %arg2) : (index, index, index) -> ()
          "affine.yield"() : () -> ()
        }) : () -> ()
        "affine.yield"() : () -> ()
      }) : () -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<() -> (0)>
#map1 = affine_map<() -> (1024)>
#map2 = affine_map<() -> (512)>
#map3 = affine_map<() -> (256)>
"builtin.module"() ({
  "func.func"() <{function_type = (f32, f32, f32) -> (), sym_name = "invalid_type_for_tile_size_params"}> ({
  ^bb0(%arg0: f32, %arg1: f32, %arg2: f32):
    "affine.for"() <{lowerBoundMap = #map, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map3}> ({
    ^bb0(%arg3: index):
      "affine.for"() <{lowerBoundMap = #map, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map2}> ({
      ^bb0(%arg4: index):
        "affine.for"() <{lowerBoundMap = #map, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map1}> ({
        ^bb0(%arg5: index):
          "test.foo"(%arg3, %arg4, %arg5) : (index, index, index) -> ()
          "affine.yield"() : () -> ()
        }) : () -> ()
        "affine.yield"() : () -> ()
      }) : () -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

