"builtin.module"() ({
^bb0:
}) : () -> ()

// -----
#map = affine_map<(d0) -> (d0)>
#map1 = affine_map<(d0) -> (d0 + 256)>
#map2 = affine_map<() -> (0)>
#map3 = affine_map<() -> (256)>
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "loop_nest_1d"}> ({
    %0 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<256xf32>
    %1 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<512xf32>
    %2 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<256xf32, 2>
    "affine.for"() <{lowerBoundMap = #map2, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map3}> ({
    ^bb0(%arg0: index):
      %3 = "affine.load"(%0, %arg0) <{map = #map}> : (memref<256xf32>, index) -> f32
      %4 = "affine.apply"(%arg0) <{map = #map1}> : (index) -> index
      %5 = "affine.load"(%1, %4) <{map = #map}> : (memref<512xf32>, index) -> f32
      %6 = "affine.load"(%2, %arg0) <{map = #map}> : (memref<256xf32, 2>, index) -> f32
      "affine.yield"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1) -> (d0 * 16 + d1)>
#map1 = affine_map<(d0, d1) -> (d0, d1)>
#map2 = affine_map<() -> (0)>
#map3 = affine_map<() -> (16)>
#map4 = affine_map<() -> (32)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<512x32xf32>, memref<512x32xf32>, memref<512x32xf32>) -> (), sym_name = "loop_nest_high_d"}> ({
  ^bb0(%arg0: memref<512x32xf32>, %arg1: memref<512x32xf32>, %arg2: memref<512x32xf32>):
    "affine.for"() <{lowerBoundMap = #map2, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map4}> ({
    ^bb0(%arg3: index):
      "affine.for"() <{lowerBoundMap = #map2, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map4}> ({
      ^bb0(%arg4: index):
        "affine.for"() <{lowerBoundMap = #map2, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map4}> ({
        ^bb0(%arg5: index):
          "affine.for"() <{lowerBoundMap = #map2, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map3}> ({
          ^bb0(%arg8: index):
            %6 = "affine.apply"(%arg4, %arg8) <{map = #map}> : (index, index) -> index
            %7 = "affine.load"(%arg1, %6, %arg3) <{map = #map1}> : (memref<512x32xf32>, index, index) -> f32
            "foo"(%7) : (f32) -> ()
            "affine.yield"() : () -> ()
          }) : () -> ()
          "affine.for"() <{lowerBoundMap = #map2, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map3}> ({
          ^bb0(%arg7: index):
            %4 = "affine.apply"(%arg5, %arg7) <{map = #map}> : (index, index) -> index
            %5 = "affine.load"(%arg0, %4, %arg4) <{map = #map1}> : (memref<512x32xf32>, index, index) -> f32
            "bar"(%5) : (f32) -> ()
            "affine.yield"() : () -> ()
          }) : () -> ()
          "affine.for"() <{lowerBoundMap = #map2, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map3}> ({
          ^bb0(%arg6: index):
            %0 = "abc_compute"() : () -> f32
            %1 = "affine.apply"(%arg5, %arg6) <{map = #map}> : (index, index) -> index
            %2 = "affine.load"(%arg2, %1, %arg3) <{map = #map1}> : (memref<512x32xf32>, index, index) -> f32
            %3 = "addf32"(%0, %2) : (f32, f32) -> f32
            "affine.store"(%3, %arg2, %1, %arg3) <{map = #map1}> : (f32, memref<512x32xf32>, index, index) -> ()
            "affine.yield"() : () -> ()
          }) : () -> ()
          "foobar"() : () -> ()
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
#map = affine_map<(d0) -> (d0 mod 2)>
#map1 = affine_map<(d0, d1) -> (d0, d1)>
#map2 = affine_map<() -> (0)>
#map3 = affine_map<() -> (8)>
#map4 = affine_map<() -> (32)>
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "loop_nest_modulo"}> ({
    %0 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<256x8xf32>
    "affine.for"() <{lowerBoundMap = #map2, operandSegmentSizes = array<i32: 0, 0, 0>, step = 4 : index, upperBoundMap = #map4}> ({
    ^bb0(%arg0: index):
      "affine.for"() <{lowerBoundMap = #map2, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map3}> ({
      ^bb0(%arg1: index):
        %1 = "affine.apply"(%arg1) <{map = #map}> : (index) -> index
        %2 = "affine.load"(%0, %arg0, %1) <{map = #map1}> : (memref<256x8xf32>, index, index) -> f32
        "affine.yield"() : () -> ()
      }) : () -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1) -> (d0, d1)>
#map1 = affine_map<(d0) -> (d0)>
#map2 = affine_map<(d0) -> (d0 + 32)>
#map3 = affine_map<() -> (0)>
#map4 = affine_map<() -> (1024)>
#map5 = affine_map<() -> (256)>
"builtin.module"() ({
  "func.func"() <{function_type = () -> memref<256x1024xf32>, sym_name = "loop_nest_tiled"}> ({
    %0 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<256x1024xf32>
    "affine.for"() <{lowerBoundMap = #map3, operandSegmentSizes = array<i32: 0, 0, 0>, step = 32 : index, upperBoundMap = #map5}> ({
    ^bb0(%arg0: index):
      "affine.for"() <{lowerBoundMap = #map3, operandSegmentSizes = array<i32: 0, 0, 0>, step = 32 : index, upperBoundMap = #map4}> ({
      ^bb0(%arg1: index):
        "affine.for"(%arg0, %arg0) <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 1, 1, 0>, step = 1 : index, upperBoundMap = #map2}> ({
        ^bb0(%arg2: index):
          "affine.for"(%arg1, %arg1) <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 1, 1, 0>, step = 1 : index, upperBoundMap = #map2}> ({
          ^bb0(%arg3: index):
            %1 = "affine.load"(%0, %arg2, %arg3) <{map = #map}> : (memref<256x1024xf32>, index, index) -> f32
            "affine.yield"() : () -> ()
          }) : (index, index) -> ()
          "affine.yield"() : () -> ()
        }) : (index, index) -> ()
        "affine.yield"() : () -> ()
      }) : () -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    "func.return"(%0) : (memref<256x1024xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1) -> (d0, d1)>
#map1 = affine_map<() -> (0)>
#map2 = affine_map<()[s0] -> (s0)>
#map3 = affine_map<() -> (100)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<100x100xf32>) -> (), sym_name = "dma_constant_dim_access"}> ({
  ^bb0(%arg0: memref<100x100xf32>):
    %0 = "arith.constant"() <{value = 1 : index}> : () -> index
    %1 = "arith.constant"() <{value = 100 : index}> : () -> index
    "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map3}> ({
    ^bb0(%arg1: index):
      "affine.for"(%1) <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 1, 0>, step = 1 : index, upperBoundMap = #map2}> ({
      ^bb0(%arg2: index):
        %2 = "affine.load"(%arg0, %0, %arg2) <{map = #map}> : (memref<100x100xf32>, index, index) -> f32
        "affine.yield"() : () -> ()
      }) : (index) -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1)[s0, s1] -> (d1 + s0 + s1)>
#map1 = affine_map<(d0, d1) -> (d0, d1)>
#map2 = affine_map<() -> (0)>
#map3 = affine_map<() -> (100)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<100x100xf32>, index) -> (), sym_name = "dma_with_symbolic_accesses"}> ({
  ^bb0(%arg0: memref<100x100xf32>, %arg1: index):
    %0 = "arith.constant"() <{value = 9 : index}> : () -> index
    "affine.for"() <{lowerBoundMap = #map2, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map3}> ({
    ^bb0(%arg2: index):
      "affine.for"() <{lowerBoundMap = #map2, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map3}> ({
      ^bb0(%arg3: index):
        %1 = "affine.apply"(%arg2, %arg3, %arg1, %0) <{map = #map}> : (index, index, index, index) -> index
        %2 = "affine.load"(%arg0, %arg2, %1) <{map = #map1}> : (memref<100x100xf32>, index, index) -> f32
        "affine.yield"() : () -> ()
      }) : () -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0)[s0] -> (d0 + s0)>
#map1 = affine_map<(d0, d1) -> (d0, d1)>
#map2 = affine_map<()[s0] -> (s0)>
#map3 = affine_map<() -> (0)>
#map4 = affine_map<() -> (100)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<100x100xf32>, index, index) -> (), sym_name = "dma_with_symbolic_loop_bounds"}> ({
  ^bb0(%arg0: memref<100x100xf32>, %arg1: index, %arg2: index):
    %0 = "arith.constant"() <{value = 9 : index}> : () -> index
    "affine.for"() <{lowerBoundMap = #map3, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map4}> ({
    ^bb0(%arg3: index):
      "affine.for"(%arg1, %arg2) <{lowerBoundMap = #map2, operandSegmentSizes = array<i32: 1, 1, 0>, step = 1 : index, upperBoundMap = #map2}> ({
      ^bb0(%arg4: index):
        %1 = "affine.apply"(%arg4, %0) <{map = #map}> : (index, index) -> index
        %2 = "affine.load"(%arg0, %arg3, %1) <{map = #map1}> : (memref<100x100xf32>, index, index) -> f32
        "affine.yield"() : () -> ()
      }) : (index, index) -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1) -> (d0, d1)>
#map1 = affine_map<() -> (0)>
#map2 = affine_map<()[s0] -> (s0)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<?x?xf32>) -> (), sym_name = "dma_unknown_size"}> ({
  ^bb0(%arg0: memref<?x?xf32>):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "memref.dim"(%arg0, %0) : (memref<?x?xf32>, index) -> index
    %2 = "memref.dim"(%arg0, %0) : (memref<?x?xf32>, index) -> index
    "affine.for"(%1) <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 1, 0>, step = 1 : index, upperBoundMap = #map2}> ({
    ^bb0(%arg1: index):
      "affine.for"(%2) <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 1, 0>, step = 1 : index, upperBoundMap = #map2}> ({
      ^bb0(%arg2: index):
        %3 = "affine.load"(%arg0, %arg1, %arg2) <{map = #map}> : (memref<?x?xf32>, index, index) -> f32
        "affine.yield"() : () -> ()
      }) : (index) -> ()
      "affine.yield"() : () -> ()
    }) : (index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0) -> (d0 mod 128)>
#map1 = affine_map<(d0, d1, d2) -> (d0, d1, d2)>
#map2 = affine_map<() -> (0)>
#map3 = affine_map<() -> (1024)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<1024x1024x1024xf32>) -> (), sym_name = "dma_memref_3d"}> ({
  ^bb0(%arg0: memref<1024x1024x1024xf32>):
    "affine.for"() <{lowerBoundMap = #map2, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map3}> ({
    ^bb0(%arg1: index):
      "affine.for"() <{lowerBoundMap = #map2, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map3}> ({
      ^bb0(%arg2: index):
        "affine.for"() <{lowerBoundMap = #map2, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map3}> ({
        ^bb0(%arg3: index):
          %0 = "affine.apply"(%arg1) <{map = #map}> : (index) -> index
          %1 = "affine.apply"(%arg2) <{map = #map}> : (index) -> index
          %2 = "affine.apply"(%arg3) <{map = #map}> : (index) -> index
          %3 = "affine.load"(%arg0, %0, %1, %2) <{map = #map1}> : (memref<1024x1024x1024xf32>, index, index, index) -> f32
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
#map = affine_map<(d0) -> (d0 + 64)>
#map1 = affine_map<(d0) -> (d0 + 128)>
#map2 = affine_map<(d0) -> (d0 + 2)>
#map3 = affine_map<(d0, d1) -> (d0, d1)>
#map4 = affine_map<(d0) -> (d0 + 192)>
#map5 = affine_map<() -> (0)>
#map6 = affine_map<() -> (256)>
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "multi_load_store_union"}> ({
    %0 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<512x512xf32>
    "affine.for"() <{lowerBoundMap = #map5, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map6}> ({
    ^bb0(%arg0: index):
      "affine.for"() <{lowerBoundMap = #map5, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map6}> ({
      ^bb0(%arg1: index):
        %1 = "affine.apply"(%arg0) <{map = #map}> : (index) -> index
        %2 = "affine.apply"(%arg1) <{map = #map1}> : (index) -> index
        %3 = "affine.apply"(%arg0) <{map = #map2}> : (index) -> index
        %4 = "affine.apply"(%arg1) <{map = #map2}> : (index) -> index
        %5 = "affine.load"(%0, %3, %2) <{map = #map3}> : (memref<512x512xf32>, index, index) -> f32
        %6 = "affine.load"(%0, %1, %4) <{map = #map3}> : (memref<512x512xf32>, index, index) -> f32
        %7 = "affine.apply"(%arg0) <{map = #map1}> : (index) -> index
        %8 = "affine.apply"(%arg1) <{map = #map4}> : (index) -> index
        "affine.store"(%5, %0, %3, %8) <{map = #map3}> : (f32, memref<512x512xf32>, index, index) -> ()
        "affine.store"(%6, %0, %7, %4) <{map = #map3}> : (f32, memref<512x512xf32>, index, index) -> ()
        "affine.yield"() : () -> ()
      }) : () -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0) -> (d0)>
#map1 = affine_map<() -> (1)>
#map2 = affine_map<() -> (255)>
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "dma_loop_straightline_interspersed"}> ({
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = 255 : index}> : () -> index
    %2 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<256xf32>
    %3 = "affine.load"(%2, %0) <{map = #map}> : (memref<256xf32>, index) -> f32
    "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map2}> ({
    ^bb0(%arg0: index):
      %5 = "affine.load"(%2, %arg0) <{map = #map}> : (memref<256xf32>, index) -> f32
      "affine.yield"() : () -> ()
    }) : () -> ()
    %4 = "affine.load"(%2, %1) <{map = #map}> : (memref<256xf32>, index) -> f32
    "affine.store"(%4, %2, %0) <{map = #map}> : (f32, memref<256xf32>, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0) -> (d0, d0)>
#map1 = affine_map<(d0, d1) -> (d0, d1)>
#map2 = affine_map<() -> (0)>
#map3 = affine_map<() -> (256)>
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "dma_mixed_loop_blocks"}> ({
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<256x256xvector<8xf32>>
    "affine.for"() <{lowerBoundMap = #map2, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map3}> ({
    ^bb0(%arg0: index):
      %2 = "affine.load"(%1, %0) <{map = #map}> : (memref<256x256xvector<8xf32>>, index) -> vector<8xf32>
      "foo"(%2) : (vector<8xf32>) -> ()
      "affine.for"() <{lowerBoundMap = #map2, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map3}> ({
      ^bb0(%arg1: index):
        %3 = "affine.load"(%1, %arg0, %arg1) <{map = #map1}> : (memref<256x256xvector<8xf32>>, index, index) -> vector<8xf32>
        "bar"(%3) : (vector<8xf32>) -> ()
        "affine.yield"() : () -> ()
      }) : () -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0) -> (d0)>
#map1 = affine_map<(d0) -> (d0 + 4)>
#map2 = affine_map<() -> (0)>
#map3 = affine_map<() -> (1024)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<1027xf32>) -> (), sym_name = "relative_loop_bounds"}> ({
  ^bb0(%arg0: memref<1027xf32>):
    "affine.for"() <{lowerBoundMap = #map2, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map3}> ({
    ^bb0(%arg1: index):
      "affine.for"(%arg1, %arg1) <{lowerBoundMap = #map, operandSegmentSizes = array<i32: 1, 1, 0>, step = 1 : index, upperBoundMap = #map1}> ({
      ^bb0(%arg2: index):
        %0 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
        "affine.store"(%0, %arg0, %arg2) <{map = #map}> : (f32, memref<1027xf32>, index) -> ()
        "affine.yield"() : () -> ()
      }) : (index, index) -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0) -> (d0 + 100)>
#map1 = affine_map<(d0) -> (d0 + 25)>
#map2 = affine_map<(d0) -> (d0)>
#map3 = affine_map<() -> (0)>
#map4 = affine_map<() -> (10)>
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "test_read_write_region_union"}> ({
    %0 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<256xf32>
    "affine.for"() <{lowerBoundMap = #map3, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map4}> ({
    ^bb0(%arg0: index):
      %1 = "affine.apply"(%arg0) <{map = #map}> : (index) -> index
      %2 = "affine.apply"(%arg0) <{map = #map1}> : (index) -> index
      %3 = "affine.load"(%0, %1) <{map = #map2}> : (memref<256xf32>, index) -> f32
      "affine.store"(%3, %0, %2) <{map = #map2}> : (f32, memref<256xf32>, index) -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0) -> (d0 floordiv 8)>
#map1 = affine_map<(d0, d1) -> (d0, d1)>
#map2 = affine_map<(d0) -> (d0)>
#map3 = affine_map<() -> (0)>
#map4 = affine_map<() -> (64)>
#map5 = affine_map<(d0) -> (d0 + 3)>
#map6 = affine_map<() -> (9)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<4x4x16x1xf32>, memref<144x9xf32>, memref<2xf32>) -> (memref<144x9xf32>, memref<2xf32>), sym_name = "test_analysis_util"}> ({
  ^bb0(%arg0: memref<4x4x16x1xf32>, %arg1: memref<144x9xf32>, %arg2: memref<2xf32>):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<64x1xf32>
    %2 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<144x4xf32>
    %3 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    "affine.for"() <{lowerBoundMap = #map3, operandSegmentSizes = array<i32: 0, 0, 0>, step = 3 : index, upperBoundMap = #map6}> ({
    ^bb0(%arg3: index):
      "affine.for"(%arg3, %arg3) <{lowerBoundMap = #map2, operandSegmentSizes = array<i32: 1, 1, 0>, step = 1 : index, upperBoundMap = #map5}> ({
      ^bb0(%arg4: index):
        "affine.for"() <{lowerBoundMap = #map3, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map4}> ({
        ^bb0(%arg5: index):
          %4 = "affine.load"(%arg2, %arg4) <{map = #map}> : (memref<2xf32>, index) -> f32
          %5 = "affine.load"(%1, %arg5, %0) <{map = #map1}> : (memref<64x1xf32>, index, index) -> f32
          "affine.store"(%5, %arg2, %arg5) <{map = #map2}> : (f32, memref<2xf32>, index) -> ()
          "affine.yield"() : () -> ()
        }) : () -> ()
        "affine.yield"() : () -> ()
      }) : (index, index) -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    "func.return"(%arg1, %arg2) : (memref<144x9xf32>, memref<2xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1) -> ((d0 + d1 * 72) floordiv 2304 + (d0 mod 9) floordiv 3)>
#map1 = affine_map<(d0, d1) -> ((d0 + d1 * 72) mod 2304 - (((d0 + d1 * 72) mod 2304) floordiv 1152) * 1151 - (((d0 + d1 * 72) mod 1152) floordiv 9) * 9 - ((d0 mod 9) floordiv 3) * 3)>
#map2 = affine_map<(d0, d1) -> ((((d0 + d1 * 72) mod 1152) floordiv 9) floordiv 8)>
#map3 = affine_map<(d0, d1, d2, d3) -> (d0, d1, d2, d3)>
#map4 = affine_map<() -> (0)>
#map5 = affine_map<() -> (64)>
#map6 = affine_map<(d0) -> (d0)>
#map7 = affine_map<(d0) -> (d0 + 3)>
#map8 = affine_map<() -> (9)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<4x4x16x1xvector<8x128xf32>>, memref<144x9xvector<8x128xf32>>, memref<2xvector<8x128xf32>>) -> (memref<144x9xvector<8x128xf32>>, memref<2xvector<8x128xf32>>), sym_name = "test_memref_bounds"}> ({
  ^bb0(%arg0: memref<4x4x16x1xvector<8x128xf32>>, %arg1: memref<144x9xvector<8x128xf32>>, %arg2: memref<2xvector<8x128xf32>>):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    "affine.for"() <{lowerBoundMap = #map4, operandSegmentSizes = array<i32: 0, 0, 0>, step = 3 : index, upperBoundMap = #map8}> ({
    ^bb0(%arg3: index):
      "affine.for"(%arg3, %arg3) <{lowerBoundMap = #map6, operandSegmentSizes = array<i32: 1, 1, 0>, step = 1 : index, upperBoundMap = #map7}> ({
      ^bb0(%arg4: index):
        "affine.for"() <{lowerBoundMap = #map4, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map5}> ({
        ^bb0(%arg5: index):
          %1 = "affine.apply"(%arg4, %arg5) <{map = #map}> : (index, index) -> index
          %2 = "affine.apply"(%arg4, %arg5) <{map = #map1}> : (index, index) -> index
          %3 = "affine.apply"(%arg4, %arg5) <{map = #map2}> : (index, index) -> index
          %4 = "affine.load"(%arg0, %1, %2, %3, %0) <{map = #map3}> : (memref<4x4x16x1xvector<8x128xf32>>, index, index, index, index) -> vector<8x128xf32>
          "affine.yield"() : () -> ()
        }) : () -> ()
        "affine.yield"() : () -> ()
      }) : (index, index) -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    "func.return"(%arg1, %arg2) : (memref<144x9xvector<8x128xf32>>, memref<2xvector<8x128xf32>>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1) -> (d0, d1)>
#map1 = affine_map<(d0) -> (d0)>
#map2 = affine_map<(d0) -> (d0 + 4)>
#map3 = affine_map<() -> (0)>
#map4 = affine_map<() -> (1024)>
#map5 = affine_map<() -> (256)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<256x1024xf32>) -> (), sym_name = "load_store_same_memref"}> ({
  ^bb0(%arg0: memref<256x1024xf32>):
    "affine.for"() <{lowerBoundMap = #map3, operandSegmentSizes = array<i32: 0, 0, 0>, step = 4 : index, upperBoundMap = #map5}> ({
    ^bb0(%arg1: index):
      "affine.for"() <{lowerBoundMap = #map3, operandSegmentSizes = array<i32: 0, 0, 0>, step = 4 : index, upperBoundMap = #map4}> ({
      ^bb0(%arg2: index):
        "affine.for"(%arg1, %arg1) <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 1, 1, 0>, step = 1 : index, upperBoundMap = #map2}> ({
        ^bb0(%arg3: index):
          "affine.for"(%arg2, %arg2) <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 1, 1, 0>, step = 1 : index, upperBoundMap = #map2}> ({
          ^bb0(%arg4: index):
            %0 = "affine.load"(%arg0, %arg3, %arg4) <{map = #map}> : (memref<256x1024xf32>, index, index) -> f32
            %1 = "arith.mulf"(%0, %0) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
            "affine.store"(%1, %arg0, %arg3, %arg4) <{map = #map}> : (f32, memref<256x1024xf32>, index, index) -> ()
            "affine.yield"() : () -> ()
          }) : (index, index) -> ()
          "affine.yield"() : () -> ()
        }) : (index, index) -> ()
        "affine.yield"() : () -> ()
      }) : () -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1) -> (d0, d1)>
#map1 = affine_map<(d0) -> (d0)>
#map2 = affine_map<(d0) -> (d0 + 4)>
#map3 = affine_map<() -> (0)>
#map4 = affine_map<() -> (8)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<8x8xvector<64xf32>>, memref<8x8xvector<64xf32>>, memref<8x8xvector<64xf32>>) -> memref<8x8xvector<64xf32>>, sym_name = "simple_matmul"}> ({
  ^bb0(%arg0: memref<8x8xvector<64xf32>>, %arg1: memref<8x8xvector<64xf32>>, %arg2: memref<8x8xvector<64xf32>>):
    "affine.for"() <{lowerBoundMap = #map3, operandSegmentSizes = array<i32: 0, 0, 0>, step = 4 : index, upperBoundMap = #map4}> ({
    ^bb0(%arg3: index):
      "affine.for"() <{lowerBoundMap = #map3, operandSegmentSizes = array<i32: 0, 0, 0>, step = 4 : index, upperBoundMap = #map4}> ({
      ^bb0(%arg4: index):
        "affine.for"() <{lowerBoundMap = #map3, operandSegmentSizes = array<i32: 0, 0, 0>, step = 4 : index, upperBoundMap = #map4}> ({
        ^bb0(%arg5: index):
          "affine.for"(%arg3, %arg3) <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 1, 1, 0>, step = 1 : index, upperBoundMap = #map2}> ({
          ^bb0(%arg6: index):
            "affine.for"(%arg4, %arg4) <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 1, 1, 0>, step = 1 : index, upperBoundMap = #map2}> ({
            ^bb0(%arg7: index):
              "affine.for"(%arg5, %arg5) <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 1, 1, 0>, step = 1 : index, upperBoundMap = #map2}> ({
              ^bb0(%arg8: index):
                %0 = "affine.load"(%arg0, %arg6, %arg8) <{map = #map}> : (memref<8x8xvector<64xf32>>, index, index) -> vector<64xf32>
                %1 = "affine.load"(%arg1, %arg8, %arg7) <{map = #map}> : (memref<8x8xvector<64xf32>>, index, index) -> vector<64xf32>
                %2 = "affine.load"(%arg2, %arg6, %arg7) <{map = #map}> : (memref<8x8xvector<64xf32>>, index, index) -> vector<64xf32>
                %3 = "arith.mulf"(%0, %1) <{fastmath = #arith.fastmath<none>}> : (vector<64xf32>, vector<64xf32>) -> vector<64xf32>
                %4 = "arith.addf"(%2, %3) <{fastmath = #arith.fastmath<none>}> : (vector<64xf32>, vector<64xf32>) -> vector<64xf32>
                "affine.store"(%4, %arg2, %arg6, %arg7) <{map = #map}> : (vector<64xf32>, memref<8x8xvector<64xf32>>, index, index) -> ()
                "affine.yield"() : () -> ()
              }) : (index, index) -> ()
              "affine.yield"() : () -> ()
            }) : (index, index) -> ()
            "affine.yield"() : () -> ()
          }) : (index, index) -> ()
          "affine.yield"() : () -> ()
        }) : () -> ()
        "affine.yield"() : () -> ()
      }) : () -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    "func.return"(%arg2) : (memref<8x8xvector<64xf32>>) -> ()
  }) : () -> ()
}) : () -> ()

