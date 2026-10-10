"builtin.module"() ({
^bb0:
}) : () -> ()

// -----
#map = affine_map<(d0, d1) -> (d0, d1)>
#map1 = affine_map<() -> (0)>
#map2 = affine_map<() -> (3)>
#map3 = affine_map<() -> (4)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<3x4xf32>, memref<4x3xf32>, memref<3x3xf32>, memref<3x3xf32>) -> (), sym_name = "mul_add_0"}> ({
  ^bb0(%arg0: memref<3x4xf32>, %arg1: memref<4x3xf32>, %arg2: memref<3x3xf32>, %arg3: memref<3x3xf32>):
    %0 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %1 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<3x3xf32>
    "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map2}> ({
    ^bb0(%arg9: index):
      "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map2}> ({
      ^bb0(%arg10: index):
        "affine.store"(%0, %1, %arg9, %arg10) <{map = #map}> : (f32, memref<3x3xf32>, index, index) -> ()
        "affine.yield"() : () -> ()
      }) : () -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map2}> ({
    ^bb0(%arg6: index):
      "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map2}> ({
      ^bb0(%arg7: index):
        "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map3}> ({
        ^bb0(%arg8: index):
          %5 = "affine.load"(%arg1, %arg8, %arg7) <{map = #map}> : (memref<4x3xf32>, index, index) -> f32
          %6 = "affine.load"(%arg0, %arg6, %arg8) <{map = #map}> : (memref<3x4xf32>, index, index) -> f32
          %7 = "arith.mulf"(%6, %5) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
          %8 = "affine.load"(%1, %arg6, %arg7) <{map = #map}> : (memref<3x3xf32>, index, index) -> f32
          %9 = "arith.addf"(%8, %7) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
          "affine.store"(%9, %1, %arg6, %arg7) <{map = #map}> : (f32, memref<3x3xf32>, index, index) -> ()
          "affine.yield"() : () -> ()
        }) : () -> ()
        "affine.yield"() : () -> ()
      }) : () -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map2}> ({
    ^bb0(%arg4: index):
      "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map2}> ({
      ^bb0(%arg5: index):
        %2 = "affine.load"(%arg2, %arg4, %arg5) <{map = #map}> : (memref<3x3xf32>, index, index) -> f32
        %3 = "affine.load"(%1, %arg4, %arg5) <{map = #map}> : (memref<3x3xf32>, index, index) -> f32
        %4 = "arith.addf"(%3, %2) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
        "affine.store"(%4, %arg3, %arg4, %arg5) <{map = #map}> : (f32, memref<3x3xf32>, index, index) -> ()
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
#map2 = affine_map<() -> (1)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<1xf32>) -> (), sym_name = "should_fuse_multi_outgoing_edge_store_producer"}> ({
  ^bb0(%arg0: memref<1xf32>):
    %0 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map2}> ({
    ^bb0(%arg3: index):
      "affine.store"(%0, %arg0, %arg3) <{map = #map}> : (f32, memref<1xf32>, index) -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map2}> ({
    ^bb0(%arg2: index):
      %2 = "affine.load"(%arg0, %arg2) <{map = #map}> : (memref<1xf32>, index) -> f32
      "affine.yield"() : () -> ()
    }) : () -> ()
    "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map2}> ({
    ^bb0(%arg1: index):
      %1 = "affine.load"(%arg0, %arg1) <{map = #map}> : (memref<1xf32>, index) -> f32
      "affine.yield"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0) -> (d0)>
#map1 = affine_map<() -> (0)>
#map2 = affine_map<() -> (1)>
#map3 = affine_map<(d0, d1, d2) -> (d0, d1, d2)>
#map4 = affine_map<(d0, d1, d2) -> (d0 * 64 + d1, d2)>
#map5 = affine_map<() -> (1024)>
#map6 = affine_map<() -> (64)>
#map7 = affine_map<() -> (16)>
#map8 = affine_map<(d0, d1) -> (d0, d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<1xf32>, memref<1xf32>) -> (), sym_name = "should_fuse_producer_with_multi_outgoing_edges"}> ({
  ^bb0(%arg9: memref<1xf32>, %arg10: memref<1xf32>):
    %7 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map2}> ({
    ^bb0(%arg12: index):
      %9 = "affine.load"(%arg9, %arg12) <{map = #map}> : (memref<1xf32>, index) -> f32
      "affine.store"(%7, %arg10, %arg12) <{map = #map}> : (f32, memref<1xf32>, index) -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map2}> ({
    ^bb0(%arg11: index):
      "affine.store"(%7, %arg9, %arg11) <{map = #map}> : (f32, memref<1xf32>, index) -> ()
      %8 = "affine.load"(%arg10, %arg11) <{map = #map}> : (memref<1xf32>, index) -> f32
      "affine.yield"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<1024x1024xf32>, memref<16x64x1024xf32>, memref<1024x1024xf32>) -> (), sym_name = "reshape_into_matmul"}> ({
  ^bb0(%arg0: memref<1024x1024xf32>, %arg1: memref<16x64x1024xf32>, %arg2: memref<1024x1024xf32>):
    %0 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<1024x1024xf32>
    "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map7}> ({
    ^bb0(%arg6: index):
      "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map6}> ({
      ^bb0(%arg7: index):
        "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map5}> ({
        ^bb0(%arg8: index):
          %6 = "affine.load"(%arg1, %arg6, %arg7, %arg8) <{map = #map3}> : (memref<16x64x1024xf32>, index, index, index) -> f32
          "affine.store"(%6, %0, %arg6, %arg7, %arg8) <{map = #map4}> : (f32, memref<1024x1024xf32>, index, index, index) -> ()
          "affine.yield"() : () -> ()
        }) : () -> ()
        "affine.yield"() : () -> ()
      }) : () -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map5}> ({
    ^bb0(%arg3: index):
      "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map5}> ({
      ^bb0(%arg4: index):
        "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map5}> ({
        ^bb0(%arg5: index):
          %1 = "affine.load"(%0, %arg5, %arg4) <{map = #map8}> : (memref<1024x1024xf32>, index, index) -> f32
          %2 = "affine.load"(%arg0, %arg3, %arg5) <{map = #map8}> : (memref<1024x1024xf32>, index, index) -> f32
          %3 = "arith.mulf"(%2, %1) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
          %4 = "affine.load"(%arg2, %arg3, %arg4) <{map = #map8}> : (memref<1024x1024xf32>, index, index) -> f32
          %5 = "arith.addf"(%4, %3) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
          "affine.store"(%5, %arg2, %arg3, %arg4) <{map = #map8}> : (f32, memref<1024x1024xf32>, index, index) -> ()
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
#map = affine_map<(d0, d1) -> (d0, d1 * 4)>
#map1 = affine_map<() -> (0)>
#map2 = affine_map<() -> (5)>
#map3 = affine_map<() -> (10)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<10x20xf32>, memref<10x20xf32>, memref<10x20xf32>) -> (), sym_name = "vector_loop"}> ({
  ^bb0(%arg0: memref<10x20xf32>, %arg1: memref<10x20xf32>, %arg2: memref<10x20xf32>):
    "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map3}> ({
    ^bb0(%arg5: index):
      "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map2}> ({
      ^bb0(%arg6: index):
        %1 = "affine.vector_load"(%arg0, %arg5, %arg6) <{map = #map}> : (memref<10x20xf32>, index, index) -> vector<4xf32>
        "affine.vector_store"(%1, %arg1, %arg5, %arg6) <{map = #map}> : (vector<4xf32>, memref<10x20xf32>, index, index) -> ()
        "affine.yield"() : () -> ()
      }) : () -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map3}> ({
    ^bb0(%arg3: index):
      "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map2}> ({
      ^bb0(%arg4: index):
        %0 = "affine.vector_load"(%arg1, %arg3, %arg4) <{map = #map}> : (memref<10x20xf32>, index, index) -> vector<4xf32>
        "affine.vector_store"(%0, %arg2, %arg3, %arg4) <{map = #map}> : (vector<4xf32>, memref<10x20xf32>, index, index) -> ()
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
#map2 = affine_map<() -> (32)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<32xf32>, memref<32xf32>) -> (), sym_name = "multi_outgoing_edges"}> ({
  ^bb0(%arg0: memref<32xf32>, %arg1: memref<32xf32>):
    "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map2}> ({
    ^bb0(%arg5: index):
      %9 = "affine.load"(%arg0, %arg5) <{map = #map}> : (memref<32xf32>, index) -> f32
      %10 = "affine.load"(%arg1, %arg5) <{map = #map}> : (memref<32xf32>, index) -> f32
      %11 = "arith.addf"(%9, %10) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "affine.store"(%11, %arg0, %arg5) <{map = #map}> : (f32, memref<32xf32>, index) -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map2}> ({
    ^bb0(%arg4: index):
      %6 = "affine.load"(%arg0, %arg4) <{map = #map}> : (memref<32xf32>, index) -> f32
      %7 = "affine.load"(%arg1, %arg4) <{map = #map}> : (memref<32xf32>, index) -> f32
      %8 = "arith.subf"(%6, %7) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "affine.store"(%8, %arg0, %arg4) <{map = #map}> : (f32, memref<32xf32>, index) -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map2}> ({
    ^bb0(%arg3: index):
      %3 = "affine.load"(%arg0, %arg3) <{map = #map}> : (memref<32xf32>, index) -> f32
      %4 = "affine.load"(%arg1, %arg3) <{map = #map}> : (memref<32xf32>, index) -> f32
      %5 = "arith.mulf"(%3, %4) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "affine.store"(%5, %arg0, %arg3) <{map = #map}> : (f32, memref<32xf32>, index) -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map2}> ({
    ^bb0(%arg2: index):
      %0 = "affine.load"(%arg0, %arg2) <{map = #map}> : (memref<32xf32>, index) -> f32
      %1 = "affine.load"(%arg1, %arg2) <{map = #map}> : (memref<32xf32>, index) -> f32
      %2 = "arith.divf"(%0, %1) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "affine.store"(%2, %arg0, %arg2) <{map = #map}> : (f32, memref<32xf32>, index) -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0) -> (d0)>
#map1 = affine_map<() -> (1)>
#map2 = affine_map<() -> (10)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<?xf32>, memref<?xf32>, memref<?xf32>, index) -> (), sym_name = "calc"}> ({
  ^bb0(%arg0: memref<?xf32>, %arg1: memref<?xf32>, %arg2: memref<?xf32>, %arg3: index):
    %0 = "arith.constant"() <{value = 1 : index}> : () -> index
    %1 = "memref.alloc"(%arg3) <{operandSegmentSizes = array<i32: 1, 0>}> : (index) -> memref<?xf32>
    "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map2}> ({
    ^bb0(%arg5: index):
      %5 = "affine.load"(%arg0, %arg5) <{map = #map}> : (memref<?xf32>, index) -> f32
      %6 = "affine.load"(%arg1, %arg5) <{map = #map}> : (memref<?xf32>, index) -> f32
      %7 = "arith.addf"(%5, %6) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "affine.store"(%7, %1, %arg5) <{map = #map}> : (f32, memref<?xf32>, index) -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map2}> ({
    ^bb0(%arg4: index):
      %2 = "affine.load"(%1, %arg4) <{map = #map}> : (memref<?xf32>, index) -> f32
      %3 = "affine.load"(%arg1, %arg4) <{map = #map}> : (memref<?xf32>, index) -> f32
      %4 = "arith.mulf"(%2, %3) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "affine.store"(%4, %arg2, %arg4) <{map = #map}> : (f32, memref<?xf32>, index) -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0) -> (d0)>
#map1 = affine_map<() -> (0)>
#map2 = affine_map<() -> (32)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<32xf32>, memref<32xf32>) -> (), sym_name = "should_not_fuse_since_non_affine_users"}> ({
  ^bb0(%arg0: memref<32xf32>, %arg1: memref<32xf32>):
    "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map2}> ({
    ^bb0(%arg4: index):
      %6 = "affine.load"(%arg0, %arg4) <{map = #map}> : (memref<32xf32>, index) -> f32
      %7 = "affine.load"(%arg1, %arg4) <{map = #map}> : (memref<32xf32>, index) -> f32
      %8 = "arith.addf"(%6, %7) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "affine.store"(%8, %arg0, %arg4) <{map = #map}> : (f32, memref<32xf32>, index) -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map2}> ({
    ^bb0(%arg3: index):
      %3 = "memref.load"(%arg0, %arg3) : (memref<32xf32>, index) -> f32
      %4 = "memref.load"(%arg1, %arg3) : (memref<32xf32>, index) -> f32
      %5 = "arith.subf"(%3, %4) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "memref.store"(%5, %arg0, %arg3) : (f32, memref<32xf32>, index) -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map2}> ({
    ^bb0(%arg2: index):
      %0 = "affine.load"(%arg0, %arg2) <{map = #map}> : (memref<32xf32>, index) -> f32
      %1 = "affine.load"(%arg1, %arg2) <{map = #map}> : (memref<32xf32>, index) -> f32
      %2 = "arith.mulf"(%0, %1) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "affine.store"(%2, %arg0, %arg2) <{map = #map}> : (f32, memref<32xf32>, index) -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0) -> (d0)>
#map1 = affine_map<() -> (0)>
#map2 = affine_map<() -> (32)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<32xf32>, memref<32xf32>) -> (), sym_name = "should_not_fuse_since_top_level_non_affine_users"}> ({
  ^bb0(%arg0: memref<32xf32>, %arg1: memref<32xf32>):
    %0 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<f32>
    "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map2}> ({
    ^bb0(%arg3: index):
      %6 = "affine.load"(%arg0, %arg3) <{map = #map}> : (memref<32xf32>, index) -> f32
      %7 = "affine.load"(%arg1, %arg3) <{map = #map}> : (memref<32xf32>, index) -> f32
      %8 = "arith.addf"(%6, %7) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "memref.store"(%8, %0) : (f32, memref<f32>) -> ()
      "affine.store"(%8, %arg0, %arg3) <{map = #map}> : (f32, memref<32xf32>, index) -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    %1 = "memref.load"(%0) : (memref<f32>) -> f32
    "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map2}> ({
    ^bb0(%arg2: index):
      %2 = "affine.load"(%arg0, %arg2) <{map = #map}> : (memref<32xf32>, index) -> f32
      %3 = "affine.load"(%arg1, %arg2) <{map = #map}> : (memref<32xf32>, index) -> f32
      %4 = "arith.mulf"(%2, %3) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %5 = "arith.subf"(%4, %1) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "affine.store"(%5, %arg0, %arg2) <{map = #map}> : (f32, memref<32xf32>, index) -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    "memref.dealloc"(%0) : (memref<f32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0) -> (d0)>
#map1 = affine_map<() -> (0)>
#map2 = affine_map<() -> (32)>
#map3 = affine_map<() -> (100)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<32xf32>, memref<32xf32>) -> (), sym_name = "should_not_fuse_since_top_level_non_affine_mem_write_users"}> ({
  ^bb0(%arg11: memref<32xf32>, %arg12: memref<32xf32>):
    %29 = "arith.constant"() <{value = 0 : index}> : () -> index
    %30 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map2}> ({
    ^bb0(%arg14: index):
      %34 = "affine.load"(%arg11, %arg14) <{map = #map}> : (memref<32xf32>, index) -> f32
      %35 = "affine.load"(%arg12, %arg14) <{map = #map}> : (memref<32xf32>, index) -> f32
      %36 = "arith.addf"(%34, %35) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "affine.store"(%36, %arg11, %arg14) <{map = #map}> : (f32, memref<32xf32>, index) -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    "memref.store"(%30, %arg11, %29) : (f32, memref<32xf32>, index) -> ()
    "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map2}> ({
    ^bb0(%arg13: index):
      %31 = "affine.load"(%arg11, %arg13) <{map = #map}> : (memref<32xf32>, index) -> f32
      %32 = "affine.load"(%arg12, %arg13) <{map = #map}> : (memref<32xf32>, index) -> f32
      %33 = "arith.addf"(%31, %32) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "affine.store"(%33, %arg11, %arg13) <{map = #map}> : (f32, memref<32xf32>, index) -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "fuse_non_affine_intervening_op"}> ({
    %24 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %25 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<100xf32>
    %26 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<100xf32>
    %27 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<100xf32>
    "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map3}> ({
    ^bb0(%arg10: index):
      "affine.store"(%24, %25, %arg10) <{map = #map}> : (f32, memref<100xf32>, index) -> ()
      "affine.store"(%24, %27, %arg10) <{map = #map}> : (f32, memref<100xf32>, index) -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    "memref.dealloc"(%27) : (memref<100xf32>) -> ()
    "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map3}> ({
    ^bb0(%arg9: index):
      %28 = "affine.load"(%25, %arg9) <{map = #map}> : (memref<100xf32>, index) -> f32
      "affine.store"(%28, %26, %arg9) <{map = #map}> : (f32, memref<100xf32>, index) -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "fuse_non_affine_intervening_read"}> ({
    %18 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %19 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<100xf32>
    %20 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<100xf32>
    %21 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<100xf32>
    "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map3}> ({
    ^bb0(%arg8: index):
      "affine.store"(%18, %19, %arg8) <{map = #map}> : (f32, memref<100xf32>, index) -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map3}> ({
    ^bb0(%arg7: index):
      %23 = "memref.load"(%19, %arg7) : (memref<100xf32>, index) -> f32
      "affine.yield"() : () -> ()
    }) : () -> ()
    "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map3}> ({
    ^bb0(%arg6: index):
      %22 = "affine.load"(%19, %arg6) <{map = #map}> : (memref<100xf32>, index) -> f32
      "affine.store"(%22, %20, %arg6) <{map = #map}> : (f32, memref<100xf32>, index) -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "fuse_non_affine_intervening_read_nest"}> ({
    %9 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %10 = "arith.constant"() <{value = 0 : index}> : () -> index
    %11 = "arith.constant"() <{value = 1 : index}> : () -> index
    %12 = "arith.constant"() <{value = 100 : index}> : () -> index
    %13 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<100xf32>
    %14 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<100xf32>
    %15 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<100xf32>
    "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map3}> ({
    ^bb0(%arg5: index):
      "affine.store"(%9, %13, %arg5) <{map = #map}> : (f32, memref<100xf32>, index) -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    "scf.for"(%10, %12, %11) ({
    ^bb0(%arg4: index):
      %17 = "memref.load"(%13, %arg4) : (memref<100xf32>, index) -> f32
      "scf.yield"() : () -> ()
    }) : (index, index, index) -> ()
    "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map3}> ({
    ^bb0(%arg3: index):
      %16 = "affine.load"(%13, %arg3) <{map = #map}> : (memref<100xf32>, index) -> f32
      "affine.store"(%16, %14, %arg3) <{map = #map}> : (f32, memref<100xf32>, index) -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "no_fusion_scf_for_store"}> ({
    %0 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %1 = "arith.constant"() <{value = 1.000000e+00 : f32}> : () -> f32
    %2 = "arith.constant"() <{value = 0 : index}> : () -> index
    %3 = "arith.constant"() <{value = 1 : index}> : () -> index
    %4 = "arith.constant"() <{value = 100 : index}> : () -> index
    %5 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<100xf32>
    %6 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<100xf32>
    %7 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<100xf32>
    "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map3}> ({
    ^bb0(%arg2: index):
      "affine.store"(%0, %5, %arg2) <{map = #map}> : (f32, memref<100xf32>, index) -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    "scf.for"(%2, %4, %3) ({
    ^bb0(%arg1: index):
      "memref.store"(%1, %5, %arg1) : (f32, memref<100xf32>, index) -> ()
      "scf.yield"() : () -> ()
    }) : (index, index, index) -> ()
    "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map3}> ({
    ^bb0(%arg0: index):
      %8 = "affine.load"(%5, %arg0) <{map = #map}> : (memref<100xf32>, index) -> f32
      "affine.store"(%8, %6, %arg0) <{map = #map}> : (f32, memref<100xf32>, index) -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0) -> (d0)>
#map1 = affine_map<() -> (0)>
#map2 = affine_map<() -> (128)>
#map3 = affine_map<(d0) -> (d0 mod 128)>
#map4 = affine_map<(d0, d1) -> (d0, d1)>
#map5 = affine_map<() -> (512)>
#map6 = affine_map<() -> (20)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<128xf32>, memref<20x512xf32>) -> (), sym_name = "fuse_minor_affine_map"}> ({
  ^bb0(%arg0: memref<128xf32>, %arg1: memref<20x512xf32>):
    %0 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<128xf32>
    "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map2}> ({
    ^bb0(%arg4: index):
      %2 = "affine.load"(%arg0, %arg4) <{map = #map}> : (memref<128xf32>, index) -> f32
      "affine.store"(%2, %0, %arg4) <{map = #map}> : (f32, memref<128xf32>, index) -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map6}> ({
    ^bb0(%arg2: index):
      "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map5}> ({
      ^bb0(%arg3: index):
        %1 = "affine.load"(%0, %arg3) <{map = #map3}> : (memref<128xf32>, index) -> f32
        "affine.store"(%1, %arg1, %arg2, %arg3) <{map = #map4}> : (f32, memref<20x512xf32>, index, index) -> ()
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
  "func.func"() <{function_type = () -> (), sym_name = "should_fuse_multi_store_producer_and_privatize_memfefs"}> ({
    %3 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<10xf32>
    %4 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<10xf32>
    %5 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<10xf32>
    %6 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map2}> ({
    ^bb0(%arg7: index):
      "affine.store"(%6, %3, %arg7) <{map = #map}> : (f32, memref<10xf32>, index) -> ()
      "affine.store"(%6, %4, %arg7) <{map = #map}> : (f32, memref<10xf32>, index) -> ()
      "affine.store"(%6, %5, %arg7) <{map = #map}> : (f32, memref<10xf32>, index) -> ()
      %9 = "affine.load"(%5, %arg7) <{map = #map}> : (memref<10xf32>, index) -> f32
      "affine.yield"() : () -> ()
    }) : () -> ()
    "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map2}> ({
    ^bb0(%arg6: index):
      %8 = "affine.load"(%3, %arg6) <{map = #map}> : (memref<10xf32>, index) -> f32
      "affine.yield"() : () -> ()
    }) : () -> ()
    "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map2}> ({
    ^bb0(%arg5: index):
      %7 = "affine.load"(%4, %arg5) <{map = #map}> : (memref<10xf32>, index) -> f32
      "affine.yield"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<10xf32>, memref<10xf32>) -> (), sym_name = "should_fuse_multi_store_producer_with_escaping_memrefs_and_remove_src"}> ({
  ^bb0(%arg0: memref<10xf32>, %arg1: memref<10xf32>):
    %0 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map2}> ({
    ^bb0(%arg4: index):
      "affine.store"(%0, %arg0, %arg4) <{map = #map}> : (f32, memref<10xf32>, index) -> ()
      "affine.store"(%0, %arg1, %arg4) <{map = #map}> : (f32, memref<10xf32>, index) -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map2}> ({
    ^bb0(%arg3: index):
      %2 = "affine.load"(%arg0, %arg3) <{map = #map}> : (memref<10xf32>, index) -> f32
      "affine.yield"() : () -> ()
    }) : () -> ()
    "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map2}> ({
    ^bb0(%arg2: index):
      %1 = "affine.load"(%arg1, %arg2) <{map = #map}> : (memref<10xf32>, index) -> f32
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
#map4 = affine_map<() -> (16)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<10xf32>, memref<10xf32>) -> (), sym_name = "should_fuse_multi_store_producer_with_escaping_memrefs_and_preserve_src"}> ({
  ^bb0(%arg6: memref<10xf32>, %arg7: memref<10xf32>):
    %14 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map2}> ({
    ^bb0(%arg10: index):
      "affine.store"(%14, %arg6, %arg10) <{map = #map}> : (f32, memref<10xf32>, index) -> ()
      "affine.store"(%14, %arg7, %arg10) <{map = #map}> : (f32, memref<10xf32>, index) -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map3}> ({
    ^bb0(%arg9: index):
      %16 = "affine.load"(%arg6, %arg9) <{map = #map}> : (memref<10xf32>, index) -> f32
      "affine.yield"() : () -> ()
    }) : () -> ()
    "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map2}> ({
    ^bb0(%arg8: index):
      %15 = "affine.load"(%arg7, %arg8) <{map = #map}> : (memref<10xf32>, index) -> f32
      "affine.yield"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<16xf32>) -> (), sym_name = "should_not_fuse_due_to_dealloc"}> ({
  ^bb0(%arg3: memref<16xf32>):
    %7 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<16xf32>
    %8 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<16xf32>
    %9 = "arith.constant"() <{value = 1.000000e+00 : f32}> : () -> f32
    "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map4}> ({
    ^bb0(%arg5: index):
      %13 = "affine.load"(%arg3, %arg5) <{map = #map}> : (memref<16xf32>, index) -> f32
      "affine.store"(%13, %7, %arg5) <{map = #map}> : (f32, memref<16xf32>, index) -> ()
      "affine.store"(%13, %8, %arg5) <{map = #map}> : (f32, memref<16xf32>, index) -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    "memref.dealloc"(%8) : (memref<16xf32>) -> ()
    %10 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<16xf32>
    "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map4}> ({
    ^bb0(%arg4: index):
      %11 = "affine.load"(%7, %arg4) <{map = #map}> : (memref<16xf32>, index) -> f32
      %12 = "arith.addf"(%9, %11) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "affine.store"(%12, %10, %arg4) <{map = #map}> : (f32, memref<16xf32>, index) -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    "memref.dealloc"(%7) : (memref<16xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<16xf32>) -> (), sym_name = "cannot_fuse_intervening_deallocs"}> ({
  ^bb0(%arg0: memref<16xf32>):
    %0 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<16xf32>
    %1 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<16xf32>
    %2 = "arith.constant"() <{value = 1.000000e+00 : f32}> : () -> f32
    "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map4}> ({
    ^bb0(%arg2: index):
      %6 = "affine.load"(%arg0, %arg2) <{map = #map}> : (memref<16xf32>, index) -> f32
      "affine.store"(%6, %0, %arg2) <{map = #map}> : (f32, memref<16xf32>, index) -> ()
      "affine.store"(%6, %1, %arg2) <{map = #map}> : (f32, memref<16xf32>, index) -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    "memref.dealloc"(%1) : (memref<16xf32>) -> ()
    %3 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<16xf32>
    "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map4}> ({
    ^bb0(%arg1: index):
      %4 = "affine.load"(%0, %arg1) <{map = #map}> : (memref<16xf32>, index) -> f32
      %5 = "arith.addf"(%2, %4) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "affine.store"(%5, %3, %arg1) <{map = #map}> : (f32, memref<16xf32>, index) -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    "memref.dealloc"(%0) : (memref<16xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<() -> ()>
#map1 = affine_map<(d0) -> (d0)>
#map2 = affine_map<() -> (0)>
#map3 = affine_map<() -> (10)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<10xf32>, memref<f32>) -> (), sym_name = "should_fuse_defining_node_has_no_dependence_from_source_node"}> ({
  ^bb0(%arg0: memref<10xf32>, %arg1: memref<f32>):
    "affine.for"() <{lowerBoundMap = #map2, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map3}> ({
    ^bb0(%arg3: index):
      %3 = "affine.load"(%arg1) <{map = #map}> : (memref<f32>) -> f32
      "affine.store"(%3, %arg0, %arg3) <{map = #map1}> : (f32, memref<10xf32>, index) -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    %0 = "affine.load"(%arg1) <{map = #map}> : (memref<f32>) -> f32
    "affine.for"() <{lowerBoundMap = #map2, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map3}> ({
    ^bb0(%arg2: index):
      %1 = "affine.load"(%arg0, %arg2) <{map = #map1}> : (memref<10xf32>, index) -> f32
      %2 = "arith.divf"(%0, %1) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "affine.yield"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<() -> ()>
#map1 = affine_map<(d0) -> (d0)>
#map2 = affine_map<() -> (0)>
#map3 = affine_map<() -> (10)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<10xf32>, memref<f32>) -> (), sym_name = "should_not_fuse_defining_node_has_dependence_from_source_loop"}> ({
  ^bb0(%arg0: memref<10xf32>, %arg1: memref<f32>):
    %0 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    "affine.for"() <{lowerBoundMap = #map2, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map3}> ({
    ^bb0(%arg3: index):
      "affine.store"(%0, %arg1) <{map = #map}> : (f32, memref<f32>) -> ()
      "affine.store"(%0, %arg0, %arg3) <{map = #map1}> : (f32, memref<10xf32>, index) -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    %1 = "affine.load"(%arg1) <{map = #map}> : (memref<f32>) -> f32
    "affine.for"() <{lowerBoundMap = #map2, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map3}> ({
    ^bb0(%arg2: index):
      %2 = "affine.load"(%arg0, %arg2) <{map = #map1}> : (memref<10xf32>, index) -> f32
      %3 = "arith.divf"(%1, %2) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "affine.yield"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0) -> (d0)>
#map1 = affine_map<() -> (0)>
#map2 = affine_map<() -> (10)>
#map3 = affine_map<() -> ()>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<10xf32>, memref<10xf32>, memref<f32>) -> (), sym_name = "should_not_fuse_defining_node_has_transitive_dependence_from_source_loop"}> ({
  ^bb0(%arg0: memref<10xf32>, %arg1: memref<10xf32>, %arg2: memref<f32>):
    %0 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map2}> ({
    ^bb0(%arg5: index):
      "affine.store"(%0, %arg0, %arg5) <{map = #map}> : (f32, memref<10xf32>, index) -> ()
      "affine.store"(%0, %arg1, %arg5) <{map = #map}> : (f32, memref<10xf32>, index) -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map2}> ({
    ^bb0(%arg4: index):
      %4 = "affine.load"(%arg1, %arg4) <{map = #map}> : (memref<10xf32>, index) -> f32
      "affine.store"(%4, %arg2) <{map = #map3}> : (f32, memref<f32>) -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    %1 = "affine.load"(%arg2) <{map = #map3}> : (memref<f32>) -> f32
    "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map2}> ({
    ^bb0(%arg3: index):
      %2 = "affine.load"(%arg0, %arg3) <{map = #map}> : (memref<10xf32>, index) -> f32
      %3 = "arith.divf"(%1, %2) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
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
  "func.func"() <{function_type = (memref<10xf32>) -> (), sym_name = "should_not_fuse_dest_loop_nest_return_value"}> ({
  ^bb0(%arg0: memref<10xf32>):
    %0 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map2}> ({
    ^bb0(%arg3: index):
      "affine.store"(%0, %arg0, %arg3) <{map = #map}> : (f32, memref<10xf32>, index) -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    %1 = "affine.for"(%0) <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 1>, step = 2 : index, upperBoundMap = #map2}> ({
    ^bb0(%arg1: index, %arg2: f32):
      %2 = "affine.load"(%arg0, %arg1) <{map = #map}> : (memref<10xf32>, index) -> f32
      "affine.yield"(%2) : (f32) -> ()
    }) : (f32) -> f32
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0) -> (d0)>
#map1 = affine_map<() -> (0)>
#map2 = affine_map<() -> (10)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<10xf32>) -> (), sym_name = "should_not_fuse_src_loop_nest_return_value"}> ({
  ^bb0(%arg0: memref<10xf32>):
    %0 = "arith.constant"() <{value = 1.000000e+00 : f32}> : () -> f32
    %1 = "affine.for"(%0) <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 1>, step = 2 : index, upperBoundMap = #map2}> ({
    ^bb0(%arg2: index, %arg3: f32):
      %3 = "arith.addf"(%arg3, %arg3) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "affine.store"(%3, %arg0, %arg2) <{map = #map}> : (f32, memref<10xf32>, index) -> ()
      "affine.yield"(%3) : (f32) -> ()
    }) : (f32) -> f32
    "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map2}> ({
    ^bb0(%arg1: index):
      %2 = "affine.load"(%arg0, %arg1) <{map = #map}> : (memref<10xf32>, index) -> f32
      "affine.yield"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0) -> (d0)>
#map1 = affine_map<() -> (0)>
#map2 = affine_map<() -> (16)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<16xf32>) -> (), sym_name = "some_function", sym_visibility = "private"}> ({
  }) : () -> ()
  "func.func"() <{function_type = (memref<16xf32>) -> (), sym_name = "call_op_prevents_fusion"}> ({
  ^bb0(%arg0: memref<16xf32>):
    %0 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<16xf32>
    %1 = "arith.constant"() <{value = 1.000000e+00 : f32}> : () -> f32
    "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map2}> ({
    ^bb0(%arg2: index):
      %5 = "affine.load"(%arg0, %arg2) <{map = #map}> : (memref<16xf32>, index) -> f32
      "affine.store"(%5, %0, %arg2) <{map = #map}> : (f32, memref<16xf32>, index) -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    "func.call"(%0) <{callee = @some_function}> : (memref<16xf32>) -> ()
    %2 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<16xf32>
    "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map2}> ({
    ^bb0(%arg1: index):
      %3 = "affine.load"(%0, %arg1) <{map = #map}> : (memref<16xf32>, index) -> f32
      %4 = "arith.addf"(%1, %3) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "affine.store"(%4, %2, %arg1) <{map = #map}> : (f32, memref<16xf32>, index) -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0) -> (d0)>
#map1 = affine_map<() -> (0)>
#map2 = affine_map<() -> (16)>
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "some_function", sym_visibility = "private"}> ({
  }) : () -> ()
  "func.func"() <{function_type = (memref<16xf32>) -> (), sym_name = "call_op_does_not_prevent_fusion"}> ({
  ^bb0(%arg0: memref<16xf32>):
    %0 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<16xf32>
    %1 = "arith.constant"() <{value = 1.000000e+00 : f32}> : () -> f32
    "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map2}> ({
    ^bb0(%arg2: index):
      %5 = "affine.load"(%arg0, %arg2) <{map = #map}> : (memref<16xf32>, index) -> f32
      "affine.store"(%5, %0, %arg2) <{map = #map}> : (f32, memref<16xf32>, index) -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    "func.call"() <{callee = @some_function}> : () -> ()
    %2 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<16xf32>
    "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map2}> ({
    ^bb0(%arg1: index):
      %3 = "affine.load"(%0, %arg1) <{map = #map}> : (memref<16xf32>, index) -> f32
      %4 = "arith.addf"(%1, %3) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "affine.store"(%4, %2, %arg1) <{map = #map}> : (f32, memref<16xf32>, index) -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0) -> (d0)>
#map1 = affine_map<() -> (0)>
#map2 = affine_map<() -> (10)>
#map3 = affine_map<() -> (7)>
#map4 = affine_map<() -> (5)>
#map5 = affine_map<() -> (9)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<10xf32>) -> (), sym_name = "should_fuse_with_both_consumers_separately"}> ({
  ^bb0(%arg0: memref<10xf32>):
    %0 = "arith.constant"() <{value = 7.000000e+00 : f32}> : () -> f32
    "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map2}> ({
    ^bb0(%arg3: index):
      "affine.store"(%0, %arg0, %arg3) <{map = #map}> : (f32, memref<10xf32>, index) -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map3}> ({
    ^bb0(%arg2: index):
      %2 = "affine.load"(%arg0, %arg2) <{map = #map}> : (memref<10xf32>, index) -> f32
      "affine.yield"() : () -> ()
    }) : () -> ()
    "affine.for"() <{lowerBoundMap = #map4, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map5}> ({
    ^bb0(%arg1: index):
      %1 = "affine.load"(%arg0, %arg1) <{map = #map}> : (memref<10xf32>, index) -> f32
      "affine.yield"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0) -> (d0)>
#map1 = affine_map<(d0) -> (d0 + 1)>
#map2 = affine_map<() -> (0)>
#map3 = affine_map<() -> (5)>
#map4 = affine_map<(d0, d1) -> (d0, d1)>
#map5 = affine_map<() -> (64)>
#map6 = affine_map<() -> (1)>
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "no_fusion_cannot_compute_valid_slice"}> ({
    %12 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<5xf32>
    %13 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<6xf32>
    %14 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<5xf32>
    %15 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    "affine.for"() <{lowerBoundMap = #map2, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map3}> ({
    ^bb0(%arg12: index):
      %18 = "affine.load"(%12, %arg12) <{map = #map}> : (memref<5xf32>, index) -> f32
      "affine.store"(%18, %13, %arg12) <{map = #map1}> : (f32, memref<6xf32>, index) -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    "affine.for"() <{lowerBoundMap = #map2, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map3}> ({
    ^bb0(%arg11: index):
      %16 = "affine.load"(%13, %arg11) <{map = #map}> : (memref<6xf32>, index) -> f32
      %17 = "arith.mulf"(%16, %15) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "affine.store"(%17, %14, %arg11) <{map = #map}> : (f32, memref<5xf32>, index) -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<64x64xf32, 1>, memref<1x64xf32, 1>, memref<1x64xf32, 1>) -> (), sym_name = "reduce_add_f32_f32"}> ({
  ^bb0(%arg0: memref<64x64xf32, 1>, %arg1: memref<1x64xf32, 1>, %arg2: memref<1x64xf32, 1>):
    %0 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %1 = "arith.constant"() <{value = 1.000000e+00 : f32}> : () -> f32
    %2 = "memref.alloca"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<f32, 1>
    %3 = "memref.alloca"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<f32, 1>
    "affine.for"() <{lowerBoundMap = #map2, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map6}> ({
    ^bb0(%arg7: index):
      "affine.for"() <{lowerBoundMap = #map2, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map5}> ({
      ^bb0(%arg8: index):
        %8 = "affine.for"(%0) <{lowerBoundMap = #map2, operandSegmentSizes = array<i32: 0, 0, 1>, step = 1 : index, upperBoundMap = #map5}> ({
        ^bb0(%arg9: index, %arg10: f32):
          %10 = "affine.load"(%arg0, %arg9, %arg8) <{map = #map4}> : (memref<64x64xf32, 1>, index, index) -> f32
          %11 = "arith.addf"(%arg10, %10) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
          "affine.yield"(%11) : (f32) -> ()
        }) : (f32) -> f32
        %9 = "arith.addf"(%8, %8) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
        "affine.store"(%9, %arg1, %arg7, %arg8) <{map = #map4}> : (f32, memref<1x64xf32, 1>, index, index) -> ()
        "affine.yield"() : () -> ()
      }) : () -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    "affine.for"() <{lowerBoundMap = #map2, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map6}> ({
    ^bb0(%arg3: index):
      "affine.for"() <{lowerBoundMap = #map2, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map5}> ({
      ^bb0(%arg4: index):
        %4 = "affine.for"(%1) <{lowerBoundMap = #map2, operandSegmentSizes = array<i32: 0, 0, 1>, step = 1 : index, upperBoundMap = #map5}> ({
        ^bb0(%arg5: index, %arg6: f32):
          %6 = "affine.load"(%arg0, %arg5, %arg4) <{map = #map4}> : (memref<64x64xf32, 1>, index, index) -> f32
          %7 = "arith.mulf"(%arg6, %6) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
          "affine.yield"(%7) : (f32) -> ()
        }) : (f32) -> f32
        %5 = "arith.mulf"(%4, %4) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
        "affine.store"(%5, %arg2, %arg3, %arg4) <{map = #map4}> : (f32, memref<1x64xf32, 1>, index, index) -> ()
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
#map2 = affine_map<() -> (64)>
#map3 = affine_map<() -> (1)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<64x64xf32, 1>, memref<1x64xf32, 1>, memref<1x64xf32, 1>) -> (), sym_name = "reduce_add_non_innermost"}> ({
  ^bb0(%arg0: memref<64x64xf32, 1>, %arg1: memref<1x64xf32, 1>, %arg2: memref<1x64xf32, 1>):
    %0 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %1 = "arith.constant"() <{value = 1.000000e+00 : f32}> : () -> f32
    %2 = "memref.alloca"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<f32, 1>
    %3 = "memref.alloca"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<f32, 1>
    "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map3}> ({
    ^bb0(%arg7: index):
      "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map2}> ({
      ^bb0(%arg8: index):
        %8 = "affine.for"(%0) <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 1>, step = 1 : index, upperBoundMap = #map2}> ({
        ^bb0(%arg9: index, %arg10: f32):
          %10 = "affine.load"(%arg0, %arg9, %arg8) <{map = #map}> : (memref<64x64xf32, 1>, index, index) -> f32
          %11 = "arith.addf"(%arg10, %10) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
          "affine.yield"(%11) : (f32) -> ()
        }) : (f32) -> f32
        %9 = "arith.addf"(%8, %8) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
        "affine.store"(%9, %arg1, %arg7, %arg8) <{map = #map}> : (f32, memref<1x64xf32, 1>, index, index) -> ()
        "affine.yield"() : () -> ()
      }) : () -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map3}> ({
    ^bb0(%arg3: index):
      "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map2}> ({
      ^bb0(%arg4: index):
        %4 = "affine.for"(%1) <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 1>, step = 1 : index, upperBoundMap = #map2}> ({
        ^bb0(%arg5: index, %arg6: f32):
          %6 = "affine.load"(%arg0, %arg5, %arg4) <{map = #map}> : (memref<64x64xf32, 1>, index, index) -> f32
          %7 = "arith.mulf"(%arg6, %6) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
          "affine.yield"(%7) : (f32) -> ()
        }) : (f32) -> f32
        %5 = "arith.mulf"(%4, %4) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
        "affine.store"(%5, %arg2, %arg3, %arg4) <{map = #map}> : (f32, memref<1x64xf32, 1>, index, index) -> ()
        "affine.yield"() : () -> ()
      }) : () -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<() -> ()>
#map1 = affine_map<(d0, d1) -> (d0, d1)>
#map2 = affine_map<() -> (0)>
#map3 = affine_map<() -> (10)>
#map4 = affine_map<() -> (20)>
#map5 = affine_map<(d0) -> (d0)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<20x10xf32, 1>, memref<20x10xf32, 1>, memref<20x10xf32, 1>, memref<20x10xf32, 1>, memref<20x10xf32, 1>, memref<f32, 1>, memref<f32, 1>, memref<f32, 1>, memref<f32, 1>, memref<20x10xf32, 1>, memref<20x10xf32, 1>, memref<20x10xf32, 1>, memref<20x10xf32, 1>) -> (), sym_name = "fuse_large_number_of_loops"}> ({
  ^bb0(%arg5: memref<20x10xf32, 1>, %arg6: memref<20x10xf32, 1>, %arg7: memref<20x10xf32, 1>, %arg8: memref<20x10xf32, 1>, %arg9: memref<20x10xf32, 1>, %arg10: memref<f32, 1>, %arg11: memref<f32, 1>, %arg12: memref<f32, 1>, %arg13: memref<f32, 1>, %arg14: memref<20x10xf32, 1>, %arg15: memref<20x10xf32, 1>, %arg16: memref<20x10xf32, 1>, %arg17: memref<20x10xf32, 1>):
    %6 = "arith.constant"() <{value = 1.000000e+00 : f32}> : () -> f32
    %7 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<f32, 1>
    "affine.store"(%6, %7) <{map = #map}> : (f32, memref<f32, 1>) -> ()
    %8 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<20x10xf32, 1>
    "affine.for"() <{lowerBoundMap = #map2, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map4}> ({
    ^bb0(%arg56: index):
      "affine.for"() <{lowerBoundMap = #map2, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map3}> ({
      ^bb0(%arg57: index):
        %76 = "affine.load"(%arg11) <{map = #map}> : (memref<f32, 1>) -> f32
        "affine.store"(%76, %8, %arg56, %arg57) <{map = #map1}> : (f32, memref<20x10xf32, 1>, index, index) -> ()
        "affine.yield"() : () -> ()
      }) : () -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    %9 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<20x10xf32, 1>
    "affine.for"() <{lowerBoundMap = #map2, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map4}> ({
    ^bb0(%arg54: index):
      "affine.for"() <{lowerBoundMap = #map2, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map3}> ({
      ^bb0(%arg55: index):
        %73 = "affine.load"(%8, %arg54, %arg55) <{map = #map1}> : (memref<20x10xf32, 1>, index, index) -> f32
        %74 = "affine.load"(%arg8, %arg54, %arg55) <{map = #map1}> : (memref<20x10xf32, 1>, index, index) -> f32
        %75 = "arith.mulf"(%74, %73) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
        "affine.store"(%75, %9, %arg54, %arg55) <{map = #map1}> : (f32, memref<20x10xf32, 1>, index, index) -> ()
        "affine.yield"() : () -> ()
      }) : () -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    %10 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<f32, 1>
    %11 = "affine.load"(%arg11) <{map = #map}> : (memref<f32, 1>) -> f32
    %12 = "affine.load"(%7) <{map = #map}> : (memref<f32, 1>) -> f32
    %13 = "arith.subf"(%12, %11) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
    "affine.store"(%13, %10) <{map = #map}> : (f32, memref<f32, 1>) -> ()
    %14 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<20x10xf32, 1>
    "affine.for"() <{lowerBoundMap = #map2, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map4}> ({
    ^bb0(%arg52: index):
      "affine.for"() <{lowerBoundMap = #map2, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map3}> ({
      ^bb0(%arg53: index):
        %72 = "affine.load"(%10) <{map = #map}> : (memref<f32, 1>) -> f32
        "affine.store"(%72, %14, %arg52, %arg53) <{map = #map1}> : (f32, memref<20x10xf32, 1>, index, index) -> ()
        "affine.yield"() : () -> ()
      }) : () -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    %15 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<20x10xf32, 1>
    "affine.for"() <{lowerBoundMap = #map2, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map4}> ({
    ^bb0(%arg50: index):
      "affine.for"() <{lowerBoundMap = #map2, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map3}> ({
      ^bb0(%arg51: index):
        %69 = "affine.load"(%arg6, %arg50, %arg51) <{map = #map1}> : (memref<20x10xf32, 1>, index, index) -> f32
        %70 = "affine.load"(%14, %arg50, %arg51) <{map = #map1}> : (memref<20x10xf32, 1>, index, index) -> f32
        %71 = "arith.mulf"(%70, %69) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
        "affine.store"(%71, %15, %arg50, %arg51) <{map = #map1}> : (f32, memref<20x10xf32, 1>, index, index) -> ()
        "affine.yield"() : () -> ()
      }) : () -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    %16 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<20x10xf32, 1>
    "affine.for"() <{lowerBoundMap = #map2, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map4}> ({
    ^bb0(%arg48: index):
      "affine.for"() <{lowerBoundMap = #map2, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map3}> ({
      ^bb0(%arg49: index):
        %66 = "affine.load"(%arg6, %arg48, %arg49) <{map = #map1}> : (memref<20x10xf32, 1>, index, index) -> f32
        %67 = "affine.load"(%15, %arg48, %arg49) <{map = #map1}> : (memref<20x10xf32, 1>, index, index) -> f32
        %68 = "arith.mulf"(%67, %66) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
        "affine.store"(%68, %16, %arg48, %arg49) <{map = #map1}> : (f32, memref<20x10xf32, 1>, index, index) -> ()
        "affine.yield"() : () -> ()
      }) : () -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    "affine.for"() <{lowerBoundMap = #map2, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map4}> ({
    ^bb0(%arg46: index):
      "affine.for"() <{lowerBoundMap = #map2, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map3}> ({
      ^bb0(%arg47: index):
        %63 = "affine.load"(%16, %arg46, %arg47) <{map = #map1}> : (memref<20x10xf32, 1>, index, index) -> f32
        %64 = "affine.load"(%9, %arg46, %arg47) <{map = #map1}> : (memref<20x10xf32, 1>, index, index) -> f32
        %65 = "arith.addf"(%64, %63) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
        "affine.store"(%65, %arg16, %arg46, %arg47) <{map = #map1}> : (f32, memref<20x10xf32, 1>, index, index) -> ()
        "affine.yield"() : () -> ()
      }) : () -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    %17 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<20x10xf32, 1>
    "affine.for"() <{lowerBoundMap = #map2, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map4}> ({
    ^bb0(%arg44: index):
      "affine.for"() <{lowerBoundMap = #map2, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map3}> ({
      ^bb0(%arg45: index):
        %60 = "affine.load"(%8, %arg44, %arg45) <{map = #map1}> : (memref<20x10xf32, 1>, index, index) -> f32
        %61 = "affine.load"(%arg7, %arg44, %arg45) <{map = #map1}> : (memref<20x10xf32, 1>, index, index) -> f32
        %62 = "arith.mulf"(%61, %60) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
        "affine.store"(%62, %17, %arg44, %arg45) <{map = #map1}> : (f32, memref<20x10xf32, 1>, index, index) -> ()
        "affine.yield"() : () -> ()
      }) : () -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    "affine.for"() <{lowerBoundMap = #map2, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map4}> ({
    ^bb0(%arg42: index):
      "affine.for"() <{lowerBoundMap = #map2, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map3}> ({
      ^bb0(%arg43: index):
        %57 = "affine.load"(%15, %arg42, %arg43) <{map = #map1}> : (memref<20x10xf32, 1>, index, index) -> f32
        %58 = "affine.load"(%17, %arg42, %arg43) <{map = #map1}> : (memref<20x10xf32, 1>, index, index) -> f32
        %59 = "arith.addf"(%58, %57) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
        "affine.store"(%59, %arg15, %arg42, %arg43) <{map = #map1}> : (f32, memref<20x10xf32, 1>, index, index) -> ()
        "affine.yield"() : () -> ()
      }) : () -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    %18 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<20x10xf32, 1>
    "affine.for"() <{lowerBoundMap = #map2, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map4}> ({
    ^bb0(%arg40: index):
      "affine.for"() <{lowerBoundMap = #map2, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map3}> ({
      ^bb0(%arg41: index):
        %54 = "affine.load"(%arg15, %arg40, %arg41) <{map = #map1}> : (memref<20x10xf32, 1>, index, index) -> f32
        %55 = "affine.load"(%arg15, %arg40, %arg41) <{map = #map1}> : (memref<20x10xf32, 1>, index, index) -> f32
        %56 = "arith.mulf"(%55, %54) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
        "affine.store"(%56, %18, %arg40, %arg41) <{map = #map1}> : (f32, memref<20x10xf32, 1>, index, index) -> ()
        "affine.yield"() : () -> ()
      }) : () -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    %19 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<20x10xf32, 1>
    "affine.for"() <{lowerBoundMap = #map2, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map4}> ({
    ^bb0(%arg38: index):
      "affine.for"() <{lowerBoundMap = #map2, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map3}> ({
      ^bb0(%arg39: index):
        %51 = "affine.load"(%18, %arg38, %arg39) <{map = #map1}> : (memref<20x10xf32, 1>, index, index) -> f32
        %52 = "affine.load"(%arg16, %arg38, %arg39) <{map = #map1}> : (memref<20x10xf32, 1>, index, index) -> f32
        %53 = "arith.subf"(%52, %51) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
        "affine.store"(%53, %19, %arg38, %arg39) <{map = #map1}> : (f32, memref<20x10xf32, 1>, index, index) -> ()
        "affine.yield"() : () -> ()
      }) : () -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    %20 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<20x10xf32, 1>
    "affine.for"() <{lowerBoundMap = #map2, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map4}> ({
    ^bb0(%arg36: index):
      "affine.for"() <{lowerBoundMap = #map2, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map3}> ({
      ^bb0(%arg37: index):
        %50 = "affine.load"(%arg12) <{map = #map}> : (memref<f32, 1>) -> f32
        "affine.store"(%50, %20, %arg36, %arg37) <{map = #map1}> : (f32, memref<20x10xf32, 1>, index, index) -> ()
        "affine.yield"() : () -> ()
      }) : () -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    %21 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<20x10xf32, 1>
    "affine.for"() <{lowerBoundMap = #map2, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map4}> ({
    ^bb0(%arg34: index):
      "affine.for"() <{lowerBoundMap = #map2, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map3}> ({
      ^bb0(%arg35: index):
        %47 = "affine.load"(%arg9, %arg34, %arg35) <{map = #map1}> : (memref<20x10xf32, 1>, index, index) -> f32
        %48 = "affine.load"(%20, %arg34, %arg35) <{map = #map1}> : (memref<20x10xf32, 1>, index, index) -> f32
        %49 = "arith.mulf"(%48, %47) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
        "affine.store"(%49, %21, %arg34, %arg35) <{map = #map1}> : (f32, memref<20x10xf32, 1>, index, index) -> ()
        "affine.yield"() : () -> ()
      }) : () -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    %22 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<20x10xf32, 1>
    "affine.for"() <{lowerBoundMap = #map2, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map4}> ({
    ^bb0(%arg32: index):
      "affine.for"() <{lowerBoundMap = #map2, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map3}> ({
      ^bb0(%arg33: index):
        %46 = "affine.load"(%arg13) <{map = #map}> : (memref<f32, 1>) -> f32
        "affine.store"(%46, %22, %arg32, %arg33) <{map = #map1}> : (f32, memref<20x10xf32, 1>, index, index) -> ()
        "affine.yield"() : () -> ()
      }) : () -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    %23 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<20x10xf32, 1>
    "affine.for"() <{lowerBoundMap = #map2, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map4}> ({
    ^bb0(%arg30: index):
      "affine.for"() <{lowerBoundMap = #map2, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map3}> ({
      ^bb0(%arg31: index):
        %43 = "affine.load"(%22, %arg30, %arg31) <{map = #map1}> : (memref<20x10xf32, 1>, index, index) -> f32
        %44 = "affine.load"(%19, %arg30, %arg31) <{map = #map1}> : (memref<20x10xf32, 1>, index, index) -> f32
        %45 = "arith.addf"(%44, %43) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
        "affine.store"(%45, %23, %arg30, %arg31) <{map = #map1}> : (f32, memref<20x10xf32, 1>, index, index) -> ()
        "affine.yield"() : () -> ()
      }) : () -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    %24 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<20x10xf32, 1>
    "affine.for"() <{lowerBoundMap = #map2, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map4}> ({
    ^bb0(%arg28: index):
      "affine.for"() <{lowerBoundMap = #map2, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map3}> ({
      ^bb0(%arg29: index):
        %41 = "affine.load"(%23, %arg28, %arg29) <{map = #map1}> : (memref<20x10xf32, 1>, index, index) -> f32
        %42 = "math.sqrt"(%41) <{fastmath = #arith.fastmath<none>}> : (f32) -> f32
        "affine.store"(%42, %24, %arg28, %arg29) <{map = #map1}> : (f32, memref<20x10xf32, 1>, index, index) -> ()
        "affine.yield"() : () -> ()
      }) : () -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    %25 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<20x10xf32, 1>
    "affine.for"() <{lowerBoundMap = #map2, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map4}> ({
    ^bb0(%arg26: index):
      "affine.for"() <{lowerBoundMap = #map2, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map3}> ({
      ^bb0(%arg27: index):
        %40 = "affine.load"(%arg10) <{map = #map}> : (memref<f32, 1>) -> f32
        "affine.store"(%40, %25, %arg26, %arg27) <{map = #map1}> : (f32, memref<20x10xf32, 1>, index, index) -> ()
        "affine.yield"() : () -> ()
      }) : () -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    %26 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<20x10xf32, 1>
    "affine.for"() <{lowerBoundMap = #map2, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map4}> ({
    ^bb0(%arg24: index):
      "affine.for"() <{lowerBoundMap = #map2, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map3}> ({
      ^bb0(%arg25: index):
        %37 = "affine.load"(%arg6, %arg24, %arg25) <{map = #map1}> : (memref<20x10xf32, 1>, index, index) -> f32
        %38 = "affine.load"(%25, %arg24, %arg25) <{map = #map1}> : (memref<20x10xf32, 1>, index, index) -> f32
        %39 = "arith.mulf"(%38, %37) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
        "affine.store"(%39, %26, %arg24, %arg25) <{map = #map1}> : (f32, memref<20x10xf32, 1>, index, index) -> ()
        "affine.yield"() : () -> ()
      }) : () -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    %27 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<20x10xf32, 1>
    "affine.for"() <{lowerBoundMap = #map2, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map4}> ({
    ^bb0(%arg22: index):
      "affine.for"() <{lowerBoundMap = #map2, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map3}> ({
      ^bb0(%arg23: index):
        %34 = "affine.load"(%24, %arg22, %arg23) <{map = #map1}> : (memref<20x10xf32, 1>, index, index) -> f32
        %35 = "affine.load"(%26, %arg22, %arg23) <{map = #map1}> : (memref<20x10xf32, 1>, index, index) -> f32
        %36 = "arith.divf"(%35, %34) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
        "affine.store"(%36, %27, %arg22, %arg23) <{map = #map1}> : (f32, memref<20x10xf32, 1>, index, index) -> ()
        "affine.yield"() : () -> ()
      }) : () -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    "affine.for"() <{lowerBoundMap = #map2, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map4}> ({
    ^bb0(%arg20: index):
      "affine.for"() <{lowerBoundMap = #map2, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map3}> ({
      ^bb0(%arg21: index):
        %31 = "affine.load"(%27, %arg20, %arg21) <{map = #map1}> : (memref<20x10xf32, 1>, index, index) -> f32
        %32 = "affine.load"(%21, %arg20, %arg21) <{map = #map1}> : (memref<20x10xf32, 1>, index, index) -> f32
        %33 = "arith.addf"(%32, %31) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
        "affine.store"(%33, %arg17, %arg20, %arg21) <{map = #map1}> : (f32, memref<20x10xf32, 1>, index, index) -> ()
        "affine.yield"() : () -> ()
      }) : () -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    "affine.for"() <{lowerBoundMap = #map2, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map4}> ({
    ^bb0(%arg18: index):
      "affine.for"() <{lowerBoundMap = #map2, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map3}> ({
      ^bb0(%arg19: index):
        %28 = "affine.load"(%arg17, %arg18, %arg19) <{map = #map1}> : (memref<20x10xf32, 1>, index, index) -> f32
        %29 = "affine.load"(%arg5, %arg18, %arg19) <{map = #map1}> : (memref<20x10xf32, 1>, index, index) -> f32
        %30 = "arith.subf"(%29, %28) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
        "affine.store"(%30, %arg14, %arg18, %arg19) <{map = #map1}> : (f32, memref<20x10xf32, 1>, index, index) -> ()
        "affine.yield"() : () -> ()
      }) : () -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<2x5xf32>) -> (), sym_name = "alias_escaping_memref"}> ({
  ^bb0(%arg2: memref<2x5xf32>):
    %3 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %4 = "memref.reinterpret_cast"(%arg2) <{operandSegmentSizes = array<i32: 1, 0, 0, 0>, static_offsets = array<i64: 0>, static_sizes = array<i64: 10>, static_strides = array<i64: 1>}> : (memref<2x5xf32>) -> memref<10xf32>
    "affine.for"() <{lowerBoundMap = #map2, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map3}> ({
    ^bb0(%arg4: index):
      "affine.store"(%3, %4, %arg4) <{map = #map5}> : (f32, memref<10xf32>, index) -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    "affine.for"() <{lowerBoundMap = #map2, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map3}> ({
    ^bb0(%arg3: index):
      %5 = "affine.load"(%4, %arg3) <{map = #map5}> : (memref<10xf32>, index) -> f32
      "affine.yield"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "unknown_memref_def_op"}> ({
    %0 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %1 = "func.call"() <{callee = @bar}> : () -> memref<10xf32>
    "affine.for"() <{lowerBoundMap = #map2, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map3}> ({
    ^bb0(%arg1: index):
      "affine.store"(%0, %1, %arg1) <{map = #map5}> : (f32, memref<10xf32>, index) -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    "affine.for"() <{lowerBoundMap = #map2, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map3}> ({
    ^bb0(%arg0: index):
      %2 = "affine.load"(%1, %arg0) <{map = #map5}> : (memref<10xf32>, index) -> f32
      "affine.yield"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> memref<10xf32>, sym_name = "bar", sym_visibility = "private"}> ({
  }) : () -> ()
}) : () -> ()

