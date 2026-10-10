#map = affine_map<(d0, d1) -> (d0, d1)>
#map1 = affine_map<(d0) -> (d0)>
#map2 = affine_map<() -> (0, 1)>
#map3 = affine_map<() -> (10, 5)>
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "normalize_parallel"}> ({
    %0 = "arith.constant"() <{value = 1.000000e+00 : f32}> : () -> f32
    %1 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<2x4xf32>
    "affine.parallel"() <{lowerBoundsGroups = dense<1> : tensor<2xi32>, lowerBoundsMap = #map2, reductions = [], steps = [3, 2], upperBoundsGroups = dense<1> : tensor<2xi32>, upperBoundsMap = #map3}> ({
    ^bb0(%arg0: index, %arg1: index):
      "affine.parallel"(%arg0, %arg1) <{lowerBoundsGroups = dense<1> : tensor<1xi32>, lowerBoundsMap = #map1, reductions = [], steps = [1], upperBoundsGroups = dense<1> : tensor<1xi32>, upperBoundsMap = #map1}> ({
      ^bb0(%arg2: index):
        "affine.store"(%0, %1, %arg0, %arg2) <{map = #map}> : (f32, memref<2x4xf32>, index, index) -> ()
        "affine.yield"() : () -> ()
      }) : (index, index) -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0) -> (d0)>
#map1 = affine_map<(d0) -> (d0 + 4)>
"builtin.module"() ({
  "func.func"() <{function_type = (index) -> (), sym_name = "relative_bounds"}> ({
  ^bb0(%arg0: index):
    "affine.for"(%arg0, %arg0) <{lowerBoundMap = #map, operandSegmentSizes = array<i32: 1, 1, 0>, step = 1 : index, upperBoundMap = #map1}> ({
    ^bb0(%arg1: index):
      "affine.yield"() : () -> ()
    }) : (index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0) -> (d0)>
#map1 = affine_map<() -> (0)>
#map2 = affine_map<() -> (1)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<1xf32>, memref<1xf32>) -> (), sym_name = "promote_single_iter_loop"}> ({
  ^bb0(%arg0: memref<1xf32>, %arg1: memref<1xf32>):
    "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map2}> ({
    ^bb0(%arg2: index):
      %0 = "affine.load"(%arg0, %arg2) <{map = #map}> : (memref<1xf32>, index) -> f32
      "affine.store"(%0, %arg1, %arg2) <{map = #map}> : (f32, memref<1xf32>, index) -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<() -> (0)>
#map1 = affine_map<() -> (32)>
#map2 = affine_map<() -> (2)>
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "simple_loop_nest"}> ({
    "affine.for"() <{lowerBoundMap = #map2, operandSegmentSizes = array<i32: 0, 0, 0>, step = 2 : index, upperBoundMap = #map1}> ({
    ^bb0(%arg0: index):
      "affine.for"() <{lowerBoundMap = #map, operandSegmentSizes = array<i32: 0, 0, 0>, step = 3 : index, upperBoundMap = #map1}> ({
      ^bb0(%arg1: index):
        "test.foo"(%arg0, %arg1) : (index, index) -> ()
        "affine.yield"() : () -> ()
      }) : () -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<() -> (0)>
#map1 = affine_map<()[s0] -> (s0)>
#map2 = affine_map<() -> (2)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<?x?xf32>, index) -> (), sym_name = "loop_with_unknown_upper_bound"}> ({
  ^bb0(%arg0: memref<?x?xf32>, %arg1: index):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "memref.dim"(%arg0, %0) : (memref<?x?xf32>, index) -> index
    "affine.for"(%1) <{lowerBoundMap = #map2, operandSegmentSizes = array<i32: 0, 1, 0>, step = 32 : index, upperBoundMap = #map1}> ({
    ^bb0(%arg2: index):
      "affine.for"(%arg1) <{lowerBoundMap = #map, operandSegmentSizes = array<i32: 0, 1, 0>, step = 2 : index, upperBoundMap = #map1}> ({
      ^bb0(%arg3: index):
        "test.foo"(%arg2, %arg3) : (index, index) -> ()
        "affine.yield"() : () -> ()
      }) : (index) -> ()
      "affine.yield"() : () -> ()
    }) : (index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<() -> (2)>
#map1 = affine_map<(d0) -> (d0, 512)>
#map2 = affine_map<()[s0] -> (s0)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<?x?xf32>, index) -> (), sym_name = "loop_with_multiple_upper_bounds"}> ({
  ^bb0(%arg0: memref<?x?xf32>, %arg1: index):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "memref.dim"(%arg0, %0) : (memref<?x?xf32>, index) -> index
    "affine.for"(%1) <{lowerBoundMap = #map, operandSegmentSizes = array<i32: 0, 1, 0>, step = 32 : index, upperBoundMap = #map2}> ({
    ^bb0(%arg2: index):
      "affine.for"(%arg1) <{lowerBoundMap = #map, operandSegmentSizes = array<i32: 0, 1, 0>, step = 1 : index, upperBoundMap = #map1}> ({
      ^bb0(%arg3: index):
        "test.foo"(%arg2, %arg3) : (index, index) -> ()
        "affine.yield"() : () -> ()
      }) : (index) -> ()
      "affine.yield"() : () -> ()
    }) : (index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1) -> (d0, d1)>
#map1 = affine_map<(d0) -> (d0)>
#map2 = affine_map<(d0)[s0] -> (d0 + 32, s0)>
#map3 = affine_map<() -> (0)>
#map4 = affine_map<()[s0] -> (s0)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<1024x1024xf32>, memref<1024x1024xf32>, memref<1024x1024xf32>) -> (), sym_name = "tiled_matmul"}> ({
  ^bb0(%arg0: memref<1024x1024xf32>, %arg1: memref<1024x1024xf32>, %arg2: memref<1024x1024xf32>):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = 1 : index}> : () -> index
    %2 = "memref.dim"(%arg0, %0) : (memref<1024x1024xf32>, index) -> index
    %3 = "memref.dim"(%arg1, %1) : (memref<1024x1024xf32>, index) -> index
    %4 = "memref.dim"(%arg0, %1) : (memref<1024x1024xf32>, index) -> index
    "affine.for"(%2) <{lowerBoundMap = #map3, operandSegmentSizes = array<i32: 0, 1, 0>, step = 32 : index, upperBoundMap = #map4}> ({
    ^bb0(%arg3: index):
      "affine.for"(%3) <{lowerBoundMap = #map3, operandSegmentSizes = array<i32: 0, 1, 0>, step = 32 : index, upperBoundMap = #map4}> ({
      ^bb0(%arg4: index):
        "affine.for"(%4) <{lowerBoundMap = #map3, operandSegmentSizes = array<i32: 0, 1, 0>, step = 32 : index, upperBoundMap = #map4}> ({
        ^bb0(%arg5: index):
          "affine.for"(%arg3, %arg3, %2) <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 1, 2, 0>, step = 1 : index, upperBoundMap = #map2}> ({
          ^bb0(%arg6: index):
            "affine.for"(%arg4, %arg4, %3) <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 1, 2, 0>, step = 1 : index, upperBoundMap = #map2}> ({
            ^bb0(%arg7: index):
              "affine.for"(%arg5, %arg5, %4) <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 1, 2, 0>, step = 1 : index, upperBoundMap = #map2}> ({
              ^bb0(%arg8: index):
                %5 = "affine.load"(%arg0, %arg6, %arg8) <{map = #map}> : (memref<1024x1024xf32>, index, index) -> f32
                %6 = "affine.load"(%arg1, %arg8, %arg7) <{map = #map}> : (memref<1024x1024xf32>, index, index) -> f32
                %7 = "affine.load"(%arg2, %arg6, %arg7) <{map = #map}> : (memref<1024x1024xf32>, index, index) -> f32
                %8 = "arith.mulf"(%5, %6) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
                %9 = "arith.addf"(%7, %8) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
                "affine.store"(%9, %arg2, %arg6, %arg7) <{map = #map}> : (f32, memref<1024x1024xf32>, index, index) -> ()
                "affine.yield"() : () -> ()
              }) : (index, index, index) -> ()
              "affine.yield"() : () -> ()
            }) : (index, index, index) -> ()
            "affine.yield"() : () -> ()
          }) : (index, index, index) -> ()
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
#map = affine_map<()[s0] -> (s0)>
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "constant_lower_bound"}> ({
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = 1 : index}> : () -> index
    "scf.for"(%0, %1, %1) ({
    ^bb0(%arg0: index):
      "affine.for"(%0, %1) <{lowerBoundMap = #map, operandSegmentSizes = array<i32: 1, 1, 0>, step = 1 : index, upperBoundMap = #map}> ({
      ^bb0(%arg1: index):
        "affine.yield"() : () -> ()
      }) : (index, index) -> ()
      "scf.yield"() : () -> ()
    }) : (index, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<() -> (0)>
#map1 = affine_map<()[s0, s1] -> (s0)>
"builtin.module"() ({
  "func.func"() <{function_type = (index, index) -> (), sym_name = "upper_bound_by_symbol"}> ({
  ^bb0(%arg0: index, %arg1: index):
    "affine.for"(%arg0, %arg1) <{lowerBoundMap = #map, operandSegmentSizes = array<i32: 0, 2, 0>, step = 4 : index, upperBoundMap = #map1}> ({
    ^bb0(%arg2: index):
      "test.foo"(%arg2) : (index) -> ()
      "affine.yield"() : () -> ()
    }) : (index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<()[s0, s1] -> (s0)>
#map1 = affine_map<() -> (10)>
"builtin.module"() ({
  "func.func"() <{function_type = (index, index) -> (), sym_name = "lower_bound_by_symbol"}> ({
  ^bb0(%arg0: index, %arg1: index):
    "affine.for"(%arg0, %arg1) <{lowerBoundMap = #map, operandSegmentSizes = array<i32: 2, 0, 0>, step = 4 : index, upperBoundMap = #map1}> ({
    ^bb0(%arg2: index):
      "test.foo"(%arg2) : (index) -> ()
      "affine.yield"() : () -> ()
    }) : (index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<() -> (0)>
#map1 = affine_map<(d0, d1) -> (d0)>
"builtin.module"() ({
  "func.func"() <{function_type = (index, index) -> (), sym_name = "upper_bound_by_dim"}> ({
  ^bb0(%arg0: index, %arg1: index):
    "affine.for"(%arg0, %arg1) <{lowerBoundMap = #map, operandSegmentSizes = array<i32: 0, 2, 0>, step = 4 : index, upperBoundMap = #map1}> ({
    ^bb0(%arg2: index):
      "test.foo"(%arg2) : (index) -> ()
      "affine.yield"() : () -> ()
    }) : (index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1) -> (d0)>
#map1 = affine_map<() -> (10)>
"builtin.module"() ({
  "func.func"() <{function_type = (index, index) -> (), sym_name = "upper_bound_by_dim"}> ({
  ^bb0(%arg0: index, %arg1: index):
    "affine.for"(%arg0, %arg1) <{lowerBoundMap = #map, operandSegmentSizes = array<i32: 2, 0, 0>, step = 4 : index, upperBoundMap = #map1}> ({
    ^bb0(%arg2: index):
      "test.foo"(%arg2) : (index) -> ()
      "affine.yield"() : () -> ()
    }) : (index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0) -> (d0)>
#map1 = affine_map<(d0, d1) -> (d1 + 32, d0 + 64, 1024)>
#map2 = affine_map<(d0) -> (d0 + 64, 1024)>
#map3 = affine_map<() -> (0)>
#map4 = affine_map<() -> (1024)>
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "multi_level_tiled_matmul"}> ({
    %0 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<1024xf16>
    "affine.for"() <{lowerBoundMap = #map3, operandSegmentSizes = array<i32: 0, 0, 0>, step = 64 : index, upperBoundMap = #map4}> ({
    ^bb0(%arg0: index):
      "affine.for"(%arg0, %arg0) <{lowerBoundMap = #map, operandSegmentSizes = array<i32: 1, 1, 0>, step = 32 : index, upperBoundMap = #map2}> ({
      ^bb0(%arg1: index):
        "affine.for"(%arg1, %arg0, %arg1) <{lowerBoundMap = #map, operandSegmentSizes = array<i32: 1, 2, 0>, step = 1 : index, upperBoundMap = #map1}> ({
        ^bb0(%arg2: index):
          %1 = "affine.load"(%0, %arg2) <{map = #map}> : (memref<1024xf16>, index) -> f16
          "affine.yield"() : () -> ()
        }) : (index, index, index) -> ()
        "affine.yield"() : () -> ()
      }) : (index, index) -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

