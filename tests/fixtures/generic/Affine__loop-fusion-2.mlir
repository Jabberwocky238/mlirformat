"builtin.module"() ({
^bb0:
}) : () -> ()

// -----
#map = affine_map<(d0, d1) -> (d0, d1)>
#map1 = affine_map<() -> (0)>
#map2 = affine_map<() -> (4)>
#map3 = affine_map<() -> (64)>
#map4 = affine_map<(d0, d1, d2) -> (d0 * 16 - d1 + 15, d2)>
#map5 = affine_map<() -> (16)>
#map6 = affine_map<(d0, d1, d2) -> (d0 * 16 + d1, d2)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<64x4xf32>, memref<64x4xf32>) -> (), sym_name = "should_fuse_at_depth_above_loop_carried_dependence"}> ({
  ^bb0(%arg0: memref<64x4xf32>, %arg1: memref<64x4xf32>):
    %0 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<64x4xf32>
    %1 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map3}> ({
    ^bb0(%arg8: index):
      "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map2}> ({
      ^bb0(%arg9: index):
        "affine.store"(%1, %0, %arg8, %arg9) <{map = #map}> : (f32, memref<64x4xf32>, index, index) -> ()
        "affine.yield"() : () -> ()
      }) : () -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map2}> ({
    ^bb0(%arg2: index):
      "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map2}> ({
      ^bb0(%arg3: index):
        "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map5}> ({
        ^bb0(%arg7: index):
          %6 = "affine.load"(%arg1, %arg3, %arg7, %arg2) <{map = #map4}> : (memref<64x4xf32>, index, index, index) -> f32
          "op0"(%6) : (f32) -> ()
          "affine.yield"() : () -> ()
        }) : () -> ()
        "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map2}> ({
        ^bb0(%arg4: index):
          "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map5}> ({
          ^bb0(%arg6: index):
            %5 = "affine.load"(%arg0, %arg4, %arg6, %arg3) <{map = #map4}> : (memref<64x4xf32>, index, index, index) -> f32
            "op1"(%5) : (f32) -> ()
            "affine.yield"() : () -> ()
          }) : () -> ()
          "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map5}> ({
          ^bb0(%arg5: index):
            %2 = "op2"() : () -> f32
            %3 = "affine.load"(%0, %arg4, %arg5, %arg2) <{map = #map6}> : (memref<64x4xf32>, index, index, index) -> f32
            %4 = "arith.addf"(%3, %2) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
            "affine.store"(%4, %0, %arg4, %arg5, %arg2) <{map = #map6}> : (f32, memref<64x4xf32>, index, index, index) -> ()
            "affine.yield"() : () -> ()
          }) : () -> ()
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
#map = affine_map<(d0) -> (d0)>
#map1 = affine_map<() -> (0)>
#map2 = affine_map<() -> (10)>
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "should_fuse_only_two_loops_and_remove_producer"}> ({
    %0 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<10xf32>
    %1 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<10xf32>
    %2 = "arith.constant"() <{value = 7.000000e+00 : f32}> : () -> f32
    "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map2}> ({
    ^bb0(%arg2: index):
      "affine.store"(%2, %0, %arg2) <{map = #map}> : (f32, memref<10xf32>, index) -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map2}> ({
    ^bb0(%arg1: index):
      %4 = "affine.load"(%0, %arg1) <{map = #map}> : (memref<10xf32>, index) -> f32
      "affine.store"(%4, %1, %arg1) <{map = #map}> : (f32, memref<10xf32>, index) -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map2}> ({
    ^bb0(%arg0: index):
      %3 = "affine.load"(%0, %arg0) <{map = #map}> : (memref<10xf32>, index) -> f32
      "affine.store"(%3, %1, %arg0) <{map = #map}> : (f32, memref<10xf32>, index) -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0) -> (d0)>
#map1 = affine_map<() -> (0)>
#map2 = affine_map<() -> (10)>
#map3 = affine_map<() -> (5)>
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "should_fuse_after_one_loop_interchange"}> ({
    %0 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<10xf32>
    %1 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map2}> ({
    ^bb0(%arg2: index):
      "affine.store"(%1, %0, %arg2) <{map = #map}> : (f32, memref<10xf32>, index) -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map3}> ({
    ^bb0(%arg0: index):
      "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map2}> ({
      ^bb0(%arg1: index):
        %2 = "affine.load"(%0, %arg1) <{map = #map}> : (memref<10xf32>, index) -> f32
        "affine.store"(%2, %0, %arg1) <{map = #map}> : (f32, memref<10xf32>, index) -> ()
        "affine.yield"() : () -> ()
      }) : () -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1) -> (d0, d1)>
#map1 = affine_map<() -> (0)>
#map2 = affine_map<() -> (8)>
#map3 = affine_map<() -> (6)>
#map4 = affine_map<() -> (2)>
#map5 = affine_map<() -> (4)>
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "should_fuse_after_two_loop_interchanges"}> ({
    %0 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<6x8xf32>
    %1 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map3}> ({
    ^bb0(%arg4: index):
      "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map2}> ({
      ^bb0(%arg5: index):
        "affine.store"(%1, %0, %arg4, %arg5) <{map = #map}> : (f32, memref<6x8xf32>, index, index) -> ()
        "affine.yield"() : () -> ()
      }) : () -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map5}> ({
    ^bb0(%arg0: index):
      "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map3}> ({
      ^bb0(%arg1: index):
        "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map4}> ({
        ^bb0(%arg2: index):
          "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map2}> ({
          ^bb0(%arg3: index):
            %2 = "affine.load"(%0, %arg1, %arg3) <{map = #map}> : (memref<6x8xf32>, index, index) -> f32
            %3 = "arith.addf"(%2, %2) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
            "affine.store"(%3, %0, %arg1, %arg3) <{map = #map}> : (f32, memref<6x8xf32>, index, index) -> ()
            "affine.yield"() : () -> ()
          }) : () -> ()
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
#map = affine_map<(d0) -> (d0)>
#map1 = affine_map<() -> (0)>
#map2 = affine_map<() -> (10)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<10xf32>) -> memref<10xf32>, sym_name = "should_fuse_live_out_writer"}> ({
  ^bb0(%arg0: memref<10xf32>):
    %0 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map2}> ({
    ^bb0(%arg2: index):
      "affine.store"(%0, %arg0, %arg2) <{map = #map}> : (f32, memref<10xf32>, index) -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map2}> ({
    ^bb0(%arg1: index):
      %1 = "affine.load"(%arg0, %arg1) <{map = #map}> : (memref<10xf32>, index) -> f32
      "affine.store"(%1, %arg0, %arg1) <{map = #map}> : (f32, memref<10xf32>, index) -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    "func.return"(%arg0) : (memref<10xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1) -> (d0, d1)>
#map1 = affine_map<() -> (0)>
#map2 = affine_map<() -> (8)>
#map3 = affine_map<() -> (32)>
#map4 = affine_map<(d0, d1, d2) -> (d0 * 16 + d1, d2)>
#map5 = affine_map<() -> (16)>
#map6 = affine_map<() -> (2)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<128x8xf32>, memref<32x8xf32>, f32) -> memref<32x8xf32>, sym_name = "slice_tile"}> ({
  ^bb0(%arg0: memref<128x8xf32>, %arg1: memref<32x8xf32>, %arg2: f32):
    "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map3}> ({
    ^bb0(%arg8: index):
      "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map2}> ({
      ^bb0(%arg9: index):
        "affine.store"(%arg2, %arg1, %arg8, %arg9) <{map = #map}> : (f32, memref<32x8xf32>, index, index) -> ()
        "affine.yield"() : () -> ()
      }) : () -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map6}> ({
    ^bb0(%arg3: index):
      "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map2}> ({
      ^bb0(%arg4: index):
        "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map2}> ({
        ^bb0(%arg5: index):
          "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map5}> ({
          ^bb0(%arg7: index):
            %2 = "affine.load"(%arg0, %arg5, %arg7, %arg4) <{map = #map4}> : (memref<128x8xf32>, index, index, index) -> f32
            %3 = "foo"(%2) : (f32) -> f32
            "affine.yield"() : () -> ()
          }) : () -> ()
          "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map5}> ({
          ^bb0(%arg6: index):
            %0 = "affine.load"(%arg1, %arg3, %arg6, %arg4) <{map = #map4}> : (memref<32x8xf32>, index, index, index) -> f32
            %1 = "arith.addf"(%0, %0) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
            "affine.store"(%1, %arg1, %arg3, %arg6, %arg4) <{map = #map4}> : (f32, memref<32x8xf32>, index, index, index) -> ()
            "affine.yield"() : () -> ()
          }) : () -> ()
          "affine.yield"() : () -> ()
        }) : () -> ()
        "affine.yield"() : () -> ()
      }) : () -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    "func.return"(%arg1) : (memref<32x8xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0) -> (d0)>
#map1 = affine_map<(d0, d1) -> (d0 - d1)>
#map2 = affine_map<() -> (0)>
#map3 = affine_map<() -> (10)>
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "test_add_slice_bounds"}> ({
    %0 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<10xf32>
    %1 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<10xf32>
    %2 = "arith.constant"() <{value = 7.000000e+00 : f32}> : () -> f32
    %3 = "arith.constant"() <{value = 0 : index}> : () -> index
    "affine.for"() <{lowerBoundMap = #map2, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map3}> ({
    ^bb0(%arg3: index):
      "affine.for"() <{lowerBoundMap = #map2, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map3}> ({
      ^bb0(%arg4: index):
        "affine.for"() <{lowerBoundMap = #map2, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map3}> ({
        ^bb0(%arg5: index):
          %5 = "affine.apply"(%arg3) <{map = #map}> : (index) -> index
          %6 = "affine.apply"(%arg3) <{map = #map}> : (index) -> index
          %7 = "affine.apply"(%5, %6) <{map = #map1}> : (index, index) -> index
          "affine.store"(%2, %0, %7) <{map = #map}> : (f32, memref<10xf32>, index) -> ()
          "affine.yield"() : () -> ()
        }) : () -> ()
        "affine.yield"() : () -> ()
      }) : () -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    "affine.for"() <{lowerBoundMap = #map2, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map3}> ({
    ^bb0(%arg0: index):
      "affine.for"() <{lowerBoundMap = #map2, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map3}> ({
      ^bb0(%arg1: index):
        "affine.for"() <{lowerBoundMap = #map2, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map3}> ({
        ^bb0(%arg2: index):
          %4 = "affine.load"(%0, %3) <{map = #map}> : (memref<10xf32>, index) -> f32
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
#map = affine_map<(d0, d1) -> (d0, d1)>
#map1 = affine_map<() -> (0)>
#map2 = affine_map<() -> (10)>
#map3 = affine_map<() -> (3)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<10x10xf32>, memref<10x10xf32>) -> (), sym_name = "should_fuse_init_loops_siblings_then_shared_producer"}> ({
  ^bb0(%arg0: memref<10x10xf32>, %arg1: memref<10x10xf32>):
    %0 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<10x10xf32>
    %1 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %2 = "arith.constant"() <{value = 1.000000e+00 : f32}> : () -> f32
    %3 = "arith.constant"() <{value = 7.000000e+00 : f32}> : () -> f32
    "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map2}> ({
    ^bb0(%arg10: index):
      "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map2}> ({
      ^bb0(%arg11: index):
        "affine.store"(%3, %0, %arg10, %arg11) <{map = #map}> : (f32, memref<10x10xf32>, index, index) -> ()
        "affine.yield"() : () -> ()
      }) : () -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map3}> ({
    ^bb0(%arg8: index):
      "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map3}> ({
      ^bb0(%arg9: index):
        "affine.store"(%1, %arg0, %arg8, %arg9) <{map = #map}> : (f32, memref<10x10xf32>, index, index) -> ()
        "affine.yield"() : () -> ()
      }) : () -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map3}> ({
    ^bb0(%arg6: index):
      "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map3}> ({
      ^bb0(%arg7: index):
        %7 = "affine.load"(%0, %arg6, %arg7) <{map = #map}> : (memref<10x10xf32>, index, index) -> f32
        %8 = "affine.load"(%arg0, %arg6, %arg7) <{map = #map}> : (memref<10x10xf32>, index, index) -> f32
        %9 = "arith.mulf"(%7, %8) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
        "affine.store"(%9, %arg0, %arg6, %arg7) <{map = #map}> : (f32, memref<10x10xf32>, index, index) -> ()
        "affine.yield"() : () -> ()
      }) : () -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map3}> ({
    ^bb0(%arg4: index):
      "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map3}> ({
      ^bb0(%arg5: index):
        "affine.store"(%2, %arg1, %arg4, %arg5) <{map = #map}> : (f32, memref<10x10xf32>, index, index) -> ()
        "affine.yield"() : () -> ()
      }) : () -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map3}> ({
    ^bb0(%arg2: index):
      "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map3}> ({
      ^bb0(%arg3: index):
        %4 = "affine.load"(%0, %arg2, %arg3) <{map = #map}> : (memref<10x10xf32>, index, index) -> f32
        %5 = "affine.load"(%arg1, %arg2, %arg3) <{map = #map}> : (memref<10x10xf32>, index, index) -> f32
        %6 = "arith.addf"(%4, %5) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
        "affine.store"(%6, %arg1, %arg2, %arg3) <{map = #map}> : (f32, memref<10x10xf32>, index, index) -> ()
        "affine.yield"() : () -> ()
      }) : () -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1) -> (d0, d1)>
#map1 = affine_map<() -> (0)>
#map2 = affine_map<() -> (10)>
#map3 = affine_map<(d0) -> (d0)>
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "two_matrix_vector_products"}> ({
    %0 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<10x10xf32>
    %1 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<10xf32>
    %2 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<10xf32>
    %3 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<10xf32>
    %4 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<10xf32>
    %5 = "arith.constant"() <{value = 7.000000e+00 : f32}> : () -> f32
    "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map2}> ({
    ^bb0(%arg4: index):
      "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map2}> ({
      ^bb0(%arg5: index):
        "affine.store"(%5, %0, %arg4, %arg5) <{map = #map}> : (f32, memref<10x10xf32>, index, index) -> ()
        "affine.yield"() : () -> ()
      }) : () -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map2}> ({
    ^bb0(%arg2: index):
      "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map2}> ({
      ^bb0(%arg3: index):
        %11 = "affine.load"(%0, %arg2, %arg3) <{map = #map}> : (memref<10x10xf32>, index, index) -> f32
        %12 = "affine.load"(%1, %arg3) <{map = #map3}> : (memref<10xf32>, index) -> f32
        %13 = "arith.mulf"(%11, %12) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
        %14 = "affine.load"(%3, %arg3) <{map = #map3}> : (memref<10xf32>, index) -> f32
        %15 = "arith.addf"(%13, %14) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
        "affine.store"(%15, %3, %arg3) <{map = #map3}> : (f32, memref<10xf32>, index) -> ()
        "affine.yield"() : () -> ()
      }) : () -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map2}> ({
    ^bb0(%arg0: index):
      "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map2}> ({
      ^bb0(%arg1: index):
        %6 = "affine.load"(%0, %arg0, %arg1) <{map = #map}> : (memref<10x10xf32>, index, index) -> f32
        %7 = "affine.load"(%2, %arg1) <{map = #map3}> : (memref<10xf32>, index) -> f32
        %8 = "arith.mulf"(%6, %7) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
        %9 = "affine.load"(%4, %arg1) <{map = #map3}> : (memref<10xf32>, index) -> f32
        %10 = "arith.addf"(%8, %9) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
        "affine.store"(%10, %4, %arg1) <{map = #map3}> : (f32, memref<10xf32>, index) -> ()
        "affine.yield"() : () -> ()
      }) : () -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1) -> (d0, d1)>
#map1 = affine_map<() -> (0)>
#map2 = affine_map<() -> (16)>
#map3 = affine_map<() -> (100)>
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "should_not_slice_past_slice_barrier"}> ({
    %0 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<100x16xf32>
    "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map3}> ({
    ^bb0(%arg2: index):
      "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map2}> ({
      ^bb0(%arg3: index):
        %2 = "op1"() : () -> f32
        "affine.store"(%2, %0, %arg2, %arg3) <{map = #map}> : (f32, memref<100x16xf32>, index, index) -> ()
        "affine.yield"() : () -> ()
      }) {slice_fusion_barrier = true} : () -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map3}> ({
    ^bb0(%arg0: index):
      "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map2}> ({
      ^bb0(%arg1: index):
        %1 = "affine.load"(%0, %arg0, %arg1) <{map = #map}> : (memref<100x16xf32>, index, index) -> f32
        "op2"(%1) : (f32) -> ()
        "affine.yield"() : () -> ()
      }) : () -> ()
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
#map4 = affine_map<() -> (4)>
#map5 = affine_map<() -> (9)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<4x4x16x1xf32>, memref<144x9xf32>, memref<9xf32>) -> (), sym_name = "fuse_across_dim_mismatch"}> ({
  ^bb0(%arg0: memref<4x4x16x1xf32>, %arg1: memref<144x9xf32>, %arg2: memref<9xf32>):
    %0 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<144x4xf32>
    %1 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    "affine.for"() <{lowerBoundMap = #map2, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map5}> ({
    ^bb0(%arg7: index):
      "affine.for"() <{lowerBoundMap = #map2, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map4}> ({
      ^bb0(%arg8: index):
        "affine.for"() <{lowerBoundMap = #map2, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map3}> ({
        ^bb0(%arg9: index):
          %4 = "affine.apply"(%arg7, %arg9) <{map = #map}> : (index, index) -> index
          "affine.store"(%1, %0, %4, %arg8) <{map = #map1}> : (f32, memref<144x4xf32>, index, index) -> ()
          "affine.yield"() : () -> ()
        }) : () -> ()
        "affine.yield"() : () -> ()
      }) : () -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    "affine.for"() <{lowerBoundMap = #map2, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map5}> ({
    ^bb0(%arg3: index):
      "affine.for"() <{lowerBoundMap = #map2, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map5}> ({
      ^bb0(%arg4: index):
        "affine.for"() <{lowerBoundMap = #map2, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map4}> ({
        ^bb0(%arg5: index):
          "affine.for"() <{lowerBoundMap = #map2, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map3}> ({
          ^bb0(%arg6: index):
            %2 = "affine.apply"(%arg3, %arg6) <{map = #map}> : (index, index) -> index
            %3 = "affine.load"(%0, %2, %arg5) <{map = #map1}> : (memref<144x4xf32>, index, index) -> f32
            "affine.yield"() : () -> ()
          }) : () -> ()
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
#map = affine_map<(d0, d1) -> ((d0 * 72 + d1) floordiv 2304)>
#map1 = affine_map<(d0, d1) -> (((d0 * 72 + d1) mod 2304) floordiv 1152)>
#map2 = affine_map<(d0, d1) -> ((((d0 * 72 + d1) mod 1152) floordiv 9) floordiv 8)>
#map3 = affine_map<(d0, d1) -> ((d1 mod 9) floordiv 3)>
#map4 = affine_map<(d0, d1) -> (d1 mod 3)>
#map5 = affine_map<(d0, d1, d2, d3, d4, d5) -> (d0, d1, d2, d3, d4, d5)>
#map6 = affine_map<(d0, d1) -> (d0, d1)>
#map7 = affine_map<() -> (0)>
#map8 = affine_map<() -> (9)>
#map9 = affine_map<() -> (64)>
#map10 = affine_map<(d0, d1) -> (d0 * 16 + d1)>
#map11 = affine_map<() -> (16)>
#map12 = affine_map<() -> (4)>
#map13 = affine_map<(d0, d1) -> (d0 * 16 - d1 + 15)>
"builtin.module"() ({
  "func.func"() <{function_type = (f32) -> (), sym_name = "fuse_across_varying_dims_complex"}> ({
  ^bb0(%arg0: f32):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<2x2x3x3x16x1xf32>
    %2 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<64x9xf32>
    %3 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<144x4xf32>
    "affine.for"() <{lowerBoundMap = #map7, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map9}> ({
    ^bb0(%arg9: index):
      "affine.for"() <{lowerBoundMap = #map7, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map8}> ({
      ^bb0(%arg10: index):
        %9 = "affine.apply"(%arg9, %arg10) <{map = #map}> : (index, index) -> index
        %10 = "affine.apply"(%arg9, %arg10) <{map = #map1}> : (index, index) -> index
        %11 = "affine.apply"(%arg9, %arg10) <{map = #map2}> : (index, index) -> index
        %12 = "affine.apply"(%arg9, %arg10) <{map = #map3}> : (index, index) -> index
        %13 = "affine.apply"(%arg9, %arg10) <{map = #map4}> : (index, index) -> index
        %14 = "affine.load"(%1, %9, %10, %12, %13, %11, %0) <{map = #map5}> : (memref<2x2x3x3x16x1xf32>, index, index, index, index, index, index) -> f32
        "affine.store"(%14, %2, %arg9, %arg10) <{map = #map6}> : (f32, memref<64x9xf32>, index, index) -> ()
        "affine.yield"() : () -> ()
      }) : () -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    "affine.for"() <{lowerBoundMap = #map7, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map8}> ({
    ^bb0(%arg5: index):
      "affine.for"() <{lowerBoundMap = #map7, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map12}> ({
      ^bb0(%arg6: index):
        "affine.for"() <{lowerBoundMap = #map7, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map11}> ({
        ^bb0(%arg8: index):
          %7 = "affine.apply"(%arg6, %arg8) <{map = #map10}> : (index, index) -> index
          %8 = "affine.load"(%2, %7, %arg5) <{map = #map6}> : (memref<64x9xf32>, index, index) -> f32
          "affine.yield"() : () -> ()
        }) : () -> ()
        "affine.for"() <{lowerBoundMap = #map7, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map11}> ({
        ^bb0(%arg7: index):
          %6 = "affine.apply"(%arg5, %arg7) <{map = #map10}> : (index, index) -> index
          "affine.store"(%arg0, %3, %6, %arg6) <{map = #map6}> : (f32, memref<144x4xf32>, index, index) -> ()
          "affine.yield"() : () -> ()
        }) : () -> ()
        "affine.yield"() : () -> ()
      }) : () -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    "affine.for"() <{lowerBoundMap = #map7, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map8}> ({
    ^bb0(%arg1: index):
      "affine.for"() <{lowerBoundMap = #map7, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map8}> ({
      ^bb0(%arg2: index):
        "affine.for"() <{lowerBoundMap = #map7, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map12}> ({
        ^bb0(%arg3: index):
          "affine.for"() <{lowerBoundMap = #map7, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map11}> ({
          ^bb0(%arg4: index):
            %4 = "affine.apply"(%arg3, %arg4) <{map = #map13}> : (index, index) -> index
            %5 = "affine.load"(%2, %4, %arg2) <{map = #map6}> : (memref<64x9xf32>, index, index) -> f32
            "affine.yield"() : () -> ()
          }) : () -> ()
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
#map = affine_map<(d0) -> (d0)>
#map1 = affine_map<() -> (0)>
#map2 = affine_map<() -> (100)>
#map3 = affine_map<() -> (15)>
#map4 = affine_map<() -> (25)>
#map5 = affine_map<() -> (10)>
#map6 = affine_map<() -> (20)>
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "should_fuse_with_slice_union"}> ({
    %0 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<100xf32>
    %1 = "arith.constant"() <{value = 0 : index}> : () -> index
    %2 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map2}> ({
    ^bb0(%arg2: index):
      "affine.store"(%2, %0, %arg2) <{map = #map}> : (f32, memref<100xf32>, index) -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    "affine.for"() <{lowerBoundMap = #map5, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map6}> ({
    ^bb0(%arg0: index):
      %3 = "affine.load"(%0, %arg0) <{map = #map}> : (memref<100xf32>, index) -> f32
      "affine.for"() <{lowerBoundMap = #map3, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map4}> ({
      ^bb0(%arg1: index):
        %4 = "affine.load"(%0, %arg1) <{map = #map}> : (memref<100xf32>, index) -> f32
        "affine.yield"() : () -> ()
      }) : () -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1) -> (d0, d1)>
#map1 = affine_map<() -> (0)>
#map2 = affine_map<() -> (1024)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<1024x1024xf32>, memref<1024x1024xf32>, memref<1024x1024xf32>, memref<1024x1024xf32>) -> (), sym_name = "affine_add_mm_fused"}> ({
  ^bb0(%arg0: memref<1024x1024xf32>, %arg1: memref<1024x1024xf32>, %arg2: memref<1024x1024xf32>, %arg3: memref<1024x1024xf32>):
    "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map2}> ({
    ^bb0(%arg7: index):
      "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map2}> ({
      ^bb0(%arg8: index):
        %5 = "affine.load"(%arg3, %arg7, %arg8) <{map = #map}> : (memref<1024x1024xf32>, index, index) -> f32
        %6 = "affine.load"(%arg2, %arg7, %arg8) <{map = #map}> : (memref<1024x1024xf32>, index, index) -> f32
        %7 = "arith.addf"(%6, %5) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
        "affine.store"(%7, %arg2, %arg7, %arg8) <{map = #map}> : (f32, memref<1024x1024xf32>, index, index) -> ()
        "affine.yield"() : () -> ()
      }) : () -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map2}> ({
    ^bb0(%arg4: index):
      "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map2}> ({
      ^bb0(%arg5: index):
        "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map2}> ({
        ^bb0(%arg6: index):
          %0 = "affine.load"(%arg1, %arg6, %arg5) <{map = #map}> : (memref<1024x1024xf32>, index, index) -> f32
          %1 = "affine.load"(%arg0, %arg4, %arg6) <{map = #map}> : (memref<1024x1024xf32>, index, index) -> f32
          %2 = "arith.mulf"(%1, %0) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
          %3 = "affine.load"(%arg2, %arg4, %arg5) <{map = #map}> : (memref<1024x1024xf32>, index, index) -> f32
          %4 = "arith.addf"(%3, %2) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
          "affine.store"(%4, %arg2, %arg4, %arg5) <{map = #map}> : (f32, memref<1024x1024xf32>, index, index) -> ()
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
#map = affine_map<(d0, d1) -> (d0, d1)>
#map1 = affine_map<() -> (0)>
#map2 = affine_map<() -> (1024)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<1024x1024xf32>, memref<1024x1024xf32>, memref<1024x1024xf32>, memref<1024x1024xf32>, memref<1024x1024xf32>) -> (), sym_name = "affine_2mm_fused"}> ({
  ^bb0(%arg0: memref<1024x1024xf32>, %arg1: memref<1024x1024xf32>, %arg2: memref<1024x1024xf32>, %arg3: memref<1024x1024xf32>, %arg4: memref<1024x1024xf32>):
    %0 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map2}> ({
    ^bb0(%arg13: index):
      "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map2}> ({
      ^bb0(%arg14: index):
        "affine.store"(%0, %arg2, %arg13, %arg14) <{map = #map}> : (f32, memref<1024x1024xf32>, index, index) -> ()
        "affine.yield"() : () -> ()
      }) : () -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map2}> ({
    ^bb0(%arg11: index):
      "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map2}> ({
      ^bb0(%arg12: index):
        "affine.store"(%0, %arg4, %arg11, %arg12) <{map = #map}> : (f32, memref<1024x1024xf32>, index, index) -> ()
        "affine.yield"() : () -> ()
      }) : () -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map2}> ({
    ^bb0(%arg8: index):
      "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map2}> ({
      ^bb0(%arg9: index):
        "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map2}> ({
        ^bb0(%arg10: index):
          %6 = "affine.load"(%arg1, %arg10, %arg9) <{map = #map}> : (memref<1024x1024xf32>, index, index) -> f32
          %7 = "affine.load"(%arg0, %arg8, %arg10) <{map = #map}> : (memref<1024x1024xf32>, index, index) -> f32
          %8 = "arith.mulf"(%7, %6) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
          %9 = "affine.load"(%arg2, %arg8, %arg9) <{map = #map}> : (memref<1024x1024xf32>, index, index) -> f32
          %10 = "arith.addf"(%9, %8) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
          "affine.store"(%10, %arg2, %arg8, %arg9) <{map = #map}> : (f32, memref<1024x1024xf32>, index, index) -> ()
          "affine.yield"() : () -> ()
        }) : () -> ()
        "affine.yield"() : () -> ()
      }) : () -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map2}> ({
    ^bb0(%arg5: index):
      "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map2}> ({
      ^bb0(%arg6: index):
        "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map2}> ({
        ^bb0(%arg7: index):
          %1 = "affine.load"(%arg1, %arg7, %arg6) <{map = #map}> : (memref<1024x1024xf32>, index, index) -> f32
          %2 = "affine.load"(%arg0, %arg5, %arg7) <{map = #map}> : (memref<1024x1024xf32>, index, index) -> f32
          %3 = "arith.mulf"(%2, %1) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
          %4 = "affine.load"(%arg4, %arg5, %arg6) <{map = #map}> : (memref<1024x1024xf32>, index, index) -> f32
          %5 = "arith.addf"(%4, %3) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
          "affine.store"(%5, %arg4, %arg5, %arg6) <{map = #map}> : (f32, memref<1024x1024xf32>, index, index) -> ()
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
#map = affine_map<(d0, d1) -> (d0, d1)>
#map1 = affine_map<() -> (0)>
#map2 = affine_map<() -> (1024)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<1024x1024xf32>, memref<1024x1024xf32>, memref<1024x1024xf32>, memref<1024x1024xf32>, memref<1024x1024xf32>) -> (), sym_name = "affine_2_dependent_mm_fused"}> ({
  ^bb0(%arg0: memref<1024x1024xf32>, %arg1: memref<1024x1024xf32>, %arg2: memref<1024x1024xf32>, %arg3: memref<1024x1024xf32>, %arg4: memref<1024x1024xf32>):
    "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map2}> ({
    ^bb0(%arg8: index):
      "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map2}> ({
      ^bb0(%arg9: index):
        "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map2}> ({
        ^bb0(%arg10: index):
          %5 = "affine.load"(%arg1, %arg10, %arg9) <{map = #map}> : (memref<1024x1024xf32>, index, index) -> f32
          %6 = "affine.load"(%arg0, %arg8, %arg10) <{map = #map}> : (memref<1024x1024xf32>, index, index) -> f32
          %7 = "arith.mulf"(%6, %5) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
          %8 = "affine.load"(%arg2, %arg8, %arg9) <{map = #map}> : (memref<1024x1024xf32>, index, index) -> f32
          %9 = "arith.addf"(%8, %7) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
          "affine.store"(%9, %arg2, %arg8, %arg9) <{map = #map}> : (f32, memref<1024x1024xf32>, index, index) -> ()
          "affine.yield"() : () -> ()
        }) : () -> ()
        "affine.yield"() : () -> ()
      }) : () -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map2}> ({
    ^bb0(%arg5: index):
      "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map2}> ({
      ^bb0(%arg6: index):
        "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map2}> ({
        ^bb0(%arg7: index):
          %0 = "affine.load"(%arg3, %arg7, %arg6) <{map = #map}> : (memref<1024x1024xf32>, index, index) -> f32
          %1 = "affine.load"(%arg2, %arg5, %arg7) <{map = #map}> : (memref<1024x1024xf32>, index, index) -> f32
          %2 = "arith.mulf"(%1, %0) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
          %3 = "affine.load"(%arg4, %arg5, %arg6) <{map = #map}> : (memref<1024x1024xf32>, index, index) -> f32
          %4 = "arith.addf"(%3, %2) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
          "affine.store"(%4, %arg4, %arg5, %arg6) <{map = #map}> : (f32, memref<1024x1024xf32>, index, index) -> ()
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
#map = affine_map<(d0) -> (d0)>
#map1 = affine_map<() -> (0)>
#map2 = affine_map<() -> (10)>
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "should_fuse_self_dependence_multi_store_producer"}> ({
    %0 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<10xf32>
    %1 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<10xf32>
    %2 = "arith.constant"() <{value = 7.000000e+00 : f32}> : () -> f32
    "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map2}> ({
    ^bb0(%arg1: index):
      "affine.store"(%2, %1, %arg1) <{map = #map}> : (f32, memref<10xf32>, index) -> ()
      %4 = "affine.load"(%1, %arg1) <{map = #map}> : (memref<10xf32>, index) -> f32
      "affine.store"(%4, %0, %arg1) <{map = #map}> : (f32, memref<10xf32>, index) -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map2}> ({
    ^bb0(%arg0: index):
      %3 = "affine.load"(%0, %arg0) <{map = #map}> : (memref<10xf32>, index) -> f32
      "affine.yield"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0) -> (d0)>
#map1 = affine_map<() -> (0)>
#map2 = affine_map<() -> (10)>
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "should_fuse_dead_multi_store_producer"}> ({
    %0 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<10xf32>
    %1 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<10xf32>
    %2 = "arith.constant"() <{value = 7.000000e+00 : f32}> : () -> f32
    "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map2}> ({
    ^bb0(%arg1: index):
      "affine.store"(%2, %1, %arg1) <{map = #map}> : (f32, memref<10xf32>, index) -> ()
      "affine.store"(%2, %0, %arg1) <{map = #map}> : (f32, memref<10xf32>, index) -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map2}> ({
    ^bb0(%arg0: index):
      %3 = "affine.load"(%0, %arg0) <{map = #map}> : (memref<10xf32>, index) -> f32
      "affine.yield"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0) -> (d0)>
#map1 = affine_map<() -> (0)>
#map2 = affine_map<() -> (10)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<10xf32>) -> (), sym_name = "should_fuse_function_live_out_multi_store_producer"}> ({
  ^bb0(%arg0: memref<10xf32>):
    %0 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<10xf32>
    %1 = "arith.constant"() <{value = 7.000000e+00 : f32}> : () -> f32
    "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map2}> ({
    ^bb0(%arg2: index):
      "affine.store"(%1, %arg0, %arg2) <{map = #map}> : (f32, memref<10xf32>, index) -> ()
      "affine.store"(%1, %0, %arg2) <{map = #map}> : (f32, memref<10xf32>, index) -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map2}> ({
    ^bb0(%arg1: index):
      %2 = "affine.load"(%0, %arg1) <{map = #map}> : (memref<10xf32>, index) -> f32
      "affine.yield"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

