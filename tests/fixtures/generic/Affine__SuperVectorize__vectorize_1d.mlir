#map = affine_map<(d0) -> (d0, d0)>
#map1 = affine_map<() -> (0)>
#map2 = affine_map<()[s0] -> (s0)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<?x?xf32>, memref<?x?x?xf32>) -> (), sym_name = "vec1d_1"}> ({
  ^bb0(%arg0: memref<?x?xf32>, %arg1: memref<?x?x?xf32>):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = 1 : index}> : () -> index
    %2 = "arith.constant"() <{value = 2 : index}> : () -> index
    %3 = "memref.dim"(%arg0, %0) : (memref<?x?xf32>, index) -> index
    %4 = "memref.dim"(%arg0, %1) : (memref<?x?xf32>, index) -> index
    %5 = "memref.dim"(%arg1, %2) : (memref<?x?x?xf32>, index) -> index
    "affine.for"(%3) <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 1, 0>, step = 1 : index, upperBoundMap = #map2}> ({
    ^bb0(%arg2: index):
      %6 = "affine.load"(%arg0, %0) <{map = #map}> : (memref<?x?xf32>, index) -> f32
      "affine.yield"() : () -> ()
    }) : (index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1) -> (d0, d1)>
#map1 = affine_map<() -> (0)>
#map2 = affine_map<()[s0] -> (s0)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<?x?xf32>, memref<?x?x?xf32>) -> (), sym_name = "vec1d_2"}> ({
  ^bb0(%arg0: memref<?x?xf32>, %arg1: memref<?x?x?xf32>):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = 1 : index}> : () -> index
    %2 = "arith.constant"() <{value = 2 : index}> : () -> index
    %3 = "memref.dim"(%arg0, %0) : (memref<?x?xf32>, index) -> index
    %4 = "memref.dim"(%arg0, %1) : (memref<?x?xf32>, index) -> index
    %5 = "memref.dim"(%arg1, %2) : (memref<?x?x?xf32>, index) -> index
    "affine.for"(%3) <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 1, 0>, step = 1 : index, upperBoundMap = #map2}> ({
    ^bb0(%arg2: index):
      %6 = "affine.load"(%arg0, %0, %arg2) <{map = #map}> : (memref<?x?xf32>, index, index) -> f32
      "affine.yield"() : () -> ()
    }) : (index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1) -> (d0, d0 + d1)>
#map1 = affine_map<() -> (0)>
#map2 = affine_map<()[s0] -> (s0)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<?x?xf32>, memref<?x?x?xf32>) -> (), sym_name = "vec1d_3"}> ({
  ^bb0(%arg0: memref<?x?xf32>, %arg1: memref<?x?x?xf32>):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = 1 : index}> : () -> index
    %2 = "arith.constant"() <{value = 2 : index}> : () -> index
    %3 = "memref.dim"(%arg0, %0) : (memref<?x?xf32>, index) -> index
    %4 = "memref.dim"(%arg0, %1) : (memref<?x?xf32>, index) -> index
    %5 = "memref.dim"(%arg1, %2) : (memref<?x?x?xf32>, index) -> index
    "affine.for"(%3) <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 1, 0>, step = 1 : index, upperBoundMap = #map2}> ({
    ^bb0(%arg2: index):
      "affine.for"(%4) <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 1, 0>, step = 1 : index, upperBoundMap = #map2}> ({
      ^bb0(%arg3: index):
        %6 = "affine.load"(%arg0, %arg3, %arg2) <{map = #map}> : (memref<?x?xf32>, index, index) -> f32
        "affine.yield"() : () -> ()
      }) : (index) -> ()
      "affine.yield"() : () -> ()
    }) : (index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1) -> (d0, d1)>
#map1 = affine_map<() -> (0)>
#map2 = affine_map<()[s0] -> (s0)>
"builtin.module"() ({
  "func.func"() <{function_type = (index, index) -> f32, sym_name = "vector_add_2d"}> ({
  ^bb0(%arg0: index, %arg1: index):
    %0 = "memref.alloc"(%arg0, %arg1) <{operandSegmentSizes = array<i32: 2, 0>}> : (index, index) -> memref<?x?xf32>
    %1 = "memref.alloc"(%arg0, %arg1) <{operandSegmentSizes = array<i32: 2, 0>}> : (index, index) -> memref<?x?xf32>
    %2 = "memref.alloc"(%arg0, %arg1) <{operandSegmentSizes = array<i32: 2, 0>}> : (index, index) -> memref<?x?xf32>
    %3 = "arith.constant"() <{value = 1.000000e+00 : f32}> : () -> f32
    %4 = "arith.constant"() <{value = 2.000000e+00 : f32}> : () -> f32
    "affine.for"(%arg0) <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 1, 0>, step = 1 : index, upperBoundMap = #map2}> ({
    ^bb0(%arg6: index):
      "affine.for"(%arg1) <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 1, 0>, step = 1 : index, upperBoundMap = #map2}> ({
      ^bb0(%arg7: index):
        "affine.store"(%3, %0, %arg6, %arg7) <{map = #map}> : (f32, memref<?x?xf32>, index, index) -> ()
        "affine.yield"() : () -> ()
      }) : (index) -> ()
      "affine.yield"() : () -> ()
    }) : (index) -> ()
    "affine.for"(%arg0) <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 1, 0>, step = 1 : index, upperBoundMap = #map2}> ({
    ^bb0(%arg4: index):
      "affine.for"(%arg1) <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 1, 0>, step = 1 : index, upperBoundMap = #map2}> ({
      ^bb0(%arg5: index):
        "affine.store"(%4, %1, %arg4, %arg5) <{map = #map}> : (f32, memref<?x?xf32>, index, index) -> ()
        "affine.yield"() : () -> ()
      }) : (index) -> ()
      "affine.yield"() : () -> ()
    }) : (index) -> ()
    "affine.for"(%arg0) <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 1, 0>, step = 1 : index, upperBoundMap = #map2}> ({
    ^bb0(%arg2: index):
      "affine.for"(%arg1) <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 1, 0>, step = 1 : index, upperBoundMap = #map2}> ({
      ^bb0(%arg3: index):
        %8 = "affine.load"(%0, %arg2, %arg3) <{map = #map}> : (memref<?x?xf32>, index, index) -> f32
        %9 = "affine.load"(%1, %arg2, %arg3) <{map = #map}> : (memref<?x?xf32>, index, index) -> f32
        %10 = "arith.addf"(%8, %9) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
        %11 = "arith.addf"(%10, %3) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
        %12 = "arith.addf"(%10, %4) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
        %13 = "arith.addf"(%12, %11) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
        "affine.store"(%13, %2, %arg2, %arg3) <{map = #map}> : (f32, memref<?x?xf32>, index, index) -> ()
        "affine.yield"() : () -> ()
      }) : (index) -> ()
      "affine.yield"() : () -> ()
    }) : (index) -> ()
    %5 = "arith.constant"() <{value = 7 : index}> : () -> index
    %6 = "arith.constant"() <{value = 42 : index}> : () -> index
    %7 = "affine.load"(%2, %5, %6) <{map = #map}> : (memref<?x?xf32>, index, index) -> f32
    "func.return"(%7) : (f32) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1) -> (d0, d1)>
#map1 = affine_map<() -> (0)>
#map2 = affine_map<()[s0] -> (s0)>
#map3 = affine_map<(d0) -> (d0)>
#map4 = affine_map<(d0) -> (d0, d0)>
"builtin.module"() ({
  "func.func"() <{function_type = (index, index) -> (f32, f32), sym_name = "vec_constant_with_two_users"}> ({
  ^bb0(%arg0: index, %arg1: index):
    %0 = "memref.alloc"(%arg0, %arg1) <{operandSegmentSizes = array<i32: 2, 0>}> : (index, index) -> memref<?x?xf32>
    %1 = "memref.alloc"(%arg0) <{operandSegmentSizes = array<i32: 1, 0>}> : (index) -> memref<?xf32>
    %2 = "arith.constant"() <{value = 1.000000e+00 : f32}> : () -> f32
    "affine.for"(%arg0) <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 1, 0>, step = 1 : index, upperBoundMap = #map2}> ({
    ^bb0(%arg2: index):
      "affine.for"(%arg1) <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 1, 0>, step = 1 : index, upperBoundMap = #map2}> ({
      ^bb0(%arg3: index):
        "affine.store"(%2, %0, %arg3, %arg2) <{map = #map}> : (f32, memref<?x?xf32>, index, index) -> ()
        "affine.yield"() : () -> ()
      }) : (index) -> ()
      "affine.store"(%2, %1, %arg2) <{map = #map3}> : (f32, memref<?xf32>, index) -> ()
      "affine.yield"() : () -> ()
    }) : (index) -> ()
    %3 = "arith.constant"() <{value = 12 : index}> : () -> index
    %4 = "affine.load"(%0, %3) <{map = #map4}> : (memref<?x?xf32>, index) -> f32
    %5 = "affine.load"(%1, %3) <{map = #map3}> : (memref<?xf32>, index) -> f32
    "func.return"(%4, %5) : (f32, f32) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1) -> (d0, d1)>
#map1 = affine_map<() -> (0)>
#map2 = affine_map<() -> (32)>
#map3 = affine_map<() -> (512)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<32x512xi32>) -> (), sym_name = "vec_block_arg"}> ({
  ^bb0(%arg0: memref<32x512xi32>):
    "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map3}> ({
    ^bb0(%arg1: index):
      "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map2}> ({
      ^bb0(%arg2: index):
        %0 = "arith.index_cast"(%arg2) : (index) -> i32
        "affine.store"(%0, %arg0, %arg2, %arg1) <{map = #map}> : (i32, memref<32x512xi32>, index, index) -> ()
        "affine.yield"() : () -> ()
      }) : () -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2) -> (d0 * 2 + d1 - 1, d2)>
#map1 = affine_map<() -> (0)>
#map2 = affine_map<() -> (2)>
#map3 = affine_map<() -> (512)>
#map4 = affine_map<()[s0] -> (s0)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<?x512xindex>) -> (), sym_name = "vec_block_arg_2"}> ({
  ^bb0(%arg0: memref<?x512xindex>):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "memref.dim"(%arg0, %0) : (memref<?x512xindex>, index) -> index
    "affine.for"(%1) <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 1, 0>, step = 1 : index, upperBoundMap = #map4}> ({
    ^bb0(%arg1: index):
      "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map3}> ({
      ^bb0(%arg2: index):
        "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map2}> ({
        ^bb0(%arg3: index):
          %2 = "affine.load"(%arg0, %arg1, %arg3, %arg2) <{map = #map}> : (memref<?x512xindex>, index, index, index) -> index
          %3 = "arith.muli"(%arg1, %2) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
          %4 = "arith.addi"(%3, %arg3) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
          "affine.yield"() : () -> ()
        }) : () -> ()
        "affine.yield"() : () -> ()
      }) : () -> ()
      "affine.yield"() : () -> ()
    }) : (index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0) -> (d0, d0)>
#map1 = affine_map<() -> (0)>
#map2 = affine_map<()[s0] -> (s0)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<?x?xf32>, memref<?x?x?xf32>) -> (), sym_name = "vec_rejected_1"}> ({
  ^bb0(%arg0: memref<?x?xf32>, %arg1: memref<?x?x?xf32>):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = 1 : index}> : () -> index
    %2 = "arith.constant"() <{value = 2 : index}> : () -> index
    %3 = "memref.dim"(%arg0, %0) : (memref<?x?xf32>, index) -> index
    %4 = "memref.dim"(%arg0, %1) : (memref<?x?xf32>, index) -> index
    %5 = "memref.dim"(%arg1, %2) : (memref<?x?x?xf32>, index) -> index
    "affine.for"(%3) <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 1, 0>, step = 1 : index, upperBoundMap = #map2}> ({
    ^bb0(%arg2: index):
      %6 = "affine.load"(%arg0, %arg2) <{map = #map}> : (memref<?x?xf32>, index) -> f32
      "affine.yield"() : () -> ()
    }) : (index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1) -> (d0, d1)>
#map1 = affine_map<() -> (0)>
#map2 = affine_map<()[s0] -> (s0)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<?x?xf32>, memref<?x?x?xf32>) -> (), sym_name = "vec_rejected_2"}> ({
  ^bb0(%arg0: memref<?x?xf32>, %arg1: memref<?x?x?xf32>):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = 1 : index}> : () -> index
    %2 = "arith.constant"() <{value = 2 : index}> : () -> index
    %3 = "memref.dim"(%arg0, %0) : (memref<?x?xf32>, index) -> index
    %4 = "memref.dim"(%arg0, %1) : (memref<?x?xf32>, index) -> index
    %5 = "memref.dim"(%arg1, %2) : (memref<?x?x?xf32>, index) -> index
    "affine.for"(%3) <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 1, 0>, step = 1 : index, upperBoundMap = #map2}> ({
    ^bb0(%arg2: index):
      %6 = "affine.load"(%arg0, %arg2, %0) <{map = #map}> : (memref<?x?xf32>, index, index) -> f32
      "affine.yield"() : () -> ()
    }) : (index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1) -> (d0, d1)>
#map1 = affine_map<() -> (0)>
#map2 = affine_map<()[s0] -> (s0)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<?x?xf32>, memref<?x?x?xf32>) -> (), sym_name = "vec_rejected_3"}> ({
  ^bb0(%arg0: memref<?x?xf32>, %arg1: memref<?x?x?xf32>):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = 1 : index}> : () -> index
    %2 = "arith.constant"() <{value = 2 : index}> : () -> index
    %3 = "memref.dim"(%arg0, %0) : (memref<?x?xf32>, index) -> index
    %4 = "memref.dim"(%arg0, %1) : (memref<?x?xf32>, index) -> index
    %5 = "memref.dim"(%arg1, %2) : (memref<?x?x?xf32>, index) -> index
    "affine.for"(%3) <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 1, 0>, step = 1 : index, upperBoundMap = #map2}> ({
    ^bb0(%arg2: index):
      "affine.for"(%4) <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 1, 0>, step = 1 : index, upperBoundMap = #map2}> ({
      ^bb0(%arg3: index):
        %6 = "affine.load"(%arg0, %arg3, %arg2) <{map = #map}> : (memref<?x?xf32>, index, index) -> f32
        "affine.yield"() : () -> ()
      }) : (index) -> ()
      "affine.yield"() : () -> ()
    }) : (index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1) -> (d0 + d1, d0)>
#map1 = affine_map<() -> (0)>
#map2 = affine_map<()[s0] -> (s0)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<?x?xf32>, memref<?x?x?xf32>) -> (), sym_name = "vec_rejected_4"}> ({
  ^bb0(%arg0: memref<?x?xf32>, %arg1: memref<?x?x?xf32>):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = 1 : index}> : () -> index
    %2 = "arith.constant"() <{value = 2 : index}> : () -> index
    %3 = "memref.dim"(%arg0, %0) : (memref<?x?xf32>, index) -> index
    %4 = "memref.dim"(%arg0, %1) : (memref<?x?xf32>, index) -> index
    %5 = "memref.dim"(%arg1, %2) : (memref<?x?x?xf32>, index) -> index
    "affine.for"(%3) <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 1, 0>, step = 1 : index, upperBoundMap = #map2}> ({
    ^bb0(%arg2: index):
      "affine.for"(%4) <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 1, 0>, step = 1 : index, upperBoundMap = #map2}> ({
      ^bb0(%arg3: index):
        %6 = "affine.load"(%arg0, %arg2, %arg3) <{map = #map}> : (memref<?x?xf32>, index, index) -> f32
        "affine.yield"() : () -> ()
      }) : (index) -> ()
      "affine.yield"() : () -> ()
    }) : (index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1) -> (d0, d1)>
#map1 = affine_map<() -> (0)>
#map2 = affine_map<()[s0] -> (s0)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<?x?xf32>, memref<?x?x?xf32>) -> (), sym_name = "vec_rejected_5"}> ({
  ^bb0(%arg0: memref<?x?xf32>, %arg1: memref<?x?x?xf32>):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = 1 : index}> : () -> index
    %2 = "arith.constant"() <{value = 2 : index}> : () -> index
    %3 = "memref.dim"(%arg0, %0) : (memref<?x?xf32>, index) -> index
    %4 = "memref.dim"(%arg0, %1) : (memref<?x?xf32>, index) -> index
    %5 = "memref.dim"(%arg1, %2) : (memref<?x?x?xf32>, index) -> index
    "affine.for"(%3) <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 1, 0>, step = 1 : index, upperBoundMap = #map2}> ({
    ^bb0(%arg2: index):
      "affine.for"(%4) <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 1, 0>, step = 1 : index, upperBoundMap = #map2}> ({
      ^bb0(%arg3: index):
        %6 = "affine.load"(%arg0, %arg2, %arg3) <{map = #map}> : (memref<?x?xf32>, index, index) -> f32
        "affine.store"(%6, %arg0, %arg3, %arg2) <{map = #map}> : (f32, memref<?x?xf32>, index, index) -> ()
        "affine.yield"() : () -> ()
      }) : (index) -> ()
      "affine.yield"() : () -> ()
    }) : (index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2) -> (d0, d0 + d1, d1 + d2)>
#map1 = affine_map<() -> (0)>
#map2 = affine_map<()[s0] -> (s0)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<?x?xf32>, memref<?x?x?xf32>) -> (), sym_name = "vec_rejected_6"}> ({
  ^bb0(%arg0: memref<?x?xf32>, %arg1: memref<?x?x?xf32>):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = 1 : index}> : () -> index
    %2 = "arith.constant"() <{value = 2 : index}> : () -> index
    %3 = "memref.dim"(%arg0, %0) : (memref<?x?xf32>, index) -> index
    %4 = "memref.dim"(%arg0, %1) : (memref<?x?xf32>, index) -> index
    %5 = "memref.dim"(%arg1, %2) : (memref<?x?x?xf32>, index) -> index
    "affine.for"(%3) <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 1, 0>, step = 1 : index, upperBoundMap = #map2}> ({
    ^bb0(%arg2: index):
      "affine.for"(%4) <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 1, 0>, step = 1 : index, upperBoundMap = #map2}> ({
      ^bb0(%arg3: index):
        "affine.for"(%5) <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 1, 0>, step = 1 : index, upperBoundMap = #map2}> ({
        ^bb0(%arg4: index):
          %6 = "affine.load"(%arg1, %arg3, %arg2, %arg4) <{map = #map}> : (memref<?x?x?xf32>, index, index, index) -> f32
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
#map2 = affine_map<()[s0] -> (s0)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<?x?xf32>, memref<?x?x?xf32>) -> (), sym_name = "vec_rejected_7"}> ({
  ^bb0(%arg0: memref<?x?xf32>, %arg1: memref<?x?x?xf32>):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = 1 : index}> : () -> index
    %2 = "arith.constant"() <{value = 2 : index}> : () -> index
    %3 = "memref.dim"(%arg0, %0) : (memref<?x?xf32>, index) -> index
    %4 = "memref.dim"(%arg0, %1) : (memref<?x?xf32>, index) -> index
    %5 = "memref.dim"(%arg1, %2) : (memref<?x?x?xf32>, index) -> index
    "affine.for"(%3) <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 1, 0>, step = 1 : index, upperBoundMap = #map2}> ({
    ^bb0(%arg2: index):
      %6 = "memref.alloc"(%3) <{operandSegmentSizes = array<i32: 1, 0>}> : (index) -> memref<?xvector<2xf32>>
      %7 = "affine.load"(%6, %arg2) <{map = #map}> : (memref<?xvector<2xf32>>, index) -> vector<2xf32>
      "affine.yield"() : () -> ()
    }) : (index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0) -> (d0, d0)>
#map1 = affine_map<() -> (0)>
#map2 = affine_map<()[s0] -> (s0)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<?x?xf32>, memref<?x?x?xf32>) -> (), sym_name = "vec_rejected_8"}> ({
  ^bb0(%arg0: memref<?x?xf32>, %arg1: memref<?x?x?xf32>):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = 1 : index}> : () -> index
    %2 = "arith.constant"() <{value = 2 : index}> : () -> index
    %3 = "memref.dim"(%arg0, %0) : (memref<?x?xf32>, index) -> index
    %4 = "memref.dim"(%arg0, %1) : (memref<?x?xf32>, index) -> index
    %5 = "memref.dim"(%arg1, %2) : (memref<?x?x?xf32>, index) -> index
    "affine.for"(%3) <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 1, 0>, step = 1 : index, upperBoundMap = #map2}> ({
    ^bb0(%arg2: index):
      "affine.for"(%3) <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 1, 0>, step = 1 : index, upperBoundMap = #map2}> ({
      ^bb0(%arg3: index):
        %6 = "affine.load"(%arg0, %0) <{map = #map}> : (memref<?x?xf32>, index) -> f32
        "affine.yield"() : () -> ()
      }) : (index) -> ()
      "affine.yield"() : () -> ()
    }) : (index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0) -> (d0, d0)>
#map1 = affine_map<() -> (0)>
#map2 = affine_map<()[s0] -> (s0)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<?x?xf32>, memref<?x?x?xf32>) -> (), sym_name = "vec_rejected_9"}> ({
  ^bb0(%arg0: memref<?x?xf32>, %arg1: memref<?x?x?xf32>):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = 1 : index}> : () -> index
    %2 = "arith.constant"() <{value = 2 : index}> : () -> index
    %3 = "memref.dim"(%arg0, %0) : (memref<?x?xf32>, index) -> index
    %4 = "memref.dim"(%arg0, %1) : (memref<?x?xf32>, index) -> index
    %5 = "memref.dim"(%arg1, %2) : (memref<?x?x?xf32>, index) -> index
    "affine.for"(%3) <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 1, 0>, step = 1 : index, upperBoundMap = #map2}> ({
    ^bb0(%arg2: index):
      "affine.for"(%3) <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 1, 0>, step = 1 : index, upperBoundMap = #map2}> ({
      ^bb0(%arg3: index):
        %6 = "affine.load"(%arg0, %0) <{map = #map}> : (memref<?x?xf32>, index) -> f32
        "affine.yield"() : () -> ()
      }) : (index) -> ()
      "affine.yield"() : () -> ()
    }) : (index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0) -> (d0, d0)>
#map1 = affine_map<() -> (0)>
#map2 = affine_map<()[s0] -> (s0)>
#set = affine_set<(d0) : (d0 >= 0)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<?x?xf32>, memref<?x?x?xf32>) -> (), sym_name = "vec_rejected_10"}> ({
  ^bb0(%arg0: memref<?x?xf32>, %arg1: memref<?x?x?xf32>):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = 1 : index}> : () -> index
    %2 = "arith.constant"() <{value = 2 : index}> : () -> index
    %3 = "memref.dim"(%arg0, %0) : (memref<?x?xf32>, index) -> index
    %4 = "memref.dim"(%arg0, %1) : (memref<?x?xf32>, index) -> index
    %5 = "memref.dim"(%arg1, %2) : (memref<?x?x?xf32>, index) -> index
    "affine.for"(%3) <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 1, 0>, step = 1 : index, upperBoundMap = #map2}> ({
    ^bb0(%arg2: index):
      "affine.if"(%arg2) <{condition = #set}> ({
        %6 = "affine.load"(%arg0, %0) <{map = #map}> : (memref<?x?xf32>, index) -> f32
        "affine.yield"() : () -> ()
      }, {
      }) : (index) -> ()
      "affine.yield"() : () -> ()
    }) : (index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1) -> (d0, d1)>
#map1 = affine_map<() -> (0)>
#map2 = affine_map<()[s0] -> (s0)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<?x?xf32>, memref<?x?x?xf32>) -> (), sym_name = "vec_rejected_11"}> ({
  ^bb0(%arg0: memref<?x?xf32>, %arg1: memref<?x?x?xf32>):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = 1 : index}> : () -> index
    %2 = "arith.constant"() <{value = 2 : index}> : () -> index
    %3 = "memref.dim"(%arg0, %0) : (memref<?x?xf32>, index) -> index
    %4 = "memref.dim"(%arg0, %1) : (memref<?x?xf32>, index) -> index
    %5 = "memref.dim"(%arg1, %2) : (memref<?x?x?xf32>, index) -> index
    "affine.for"(%3) <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 1, 0>, step = 1 : index, upperBoundMap = #map2}> ({
    ^bb0(%arg2: index):
      "affine.for"(%4) <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 1, 0>, step = 1 : index, upperBoundMap = #map2}> ({
      ^bb0(%arg3: index):
        %6 = "affine.load"(%arg0, %arg3, %arg2) <{map = #map}> : (memref<?x?xf32>, index, index) -> f32
        "affine.store"(%6, %arg0, %arg2, %arg3) <{map = #map}> : (f32, memref<?x?xf32>, index, index) -> ()
        "affine.yield"() : () -> ()
      }) : (index) -> ()
      "affine.yield"() : () -> ()
    }) : (index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0) -> (d0)>
#map1 = affine_map<(d0) -> (d0 + 1)>
#map2 = affine_map<() -> (0)>
#map3 = affine_map<()[s0] -> (s0)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<?xf32>) -> (), sym_name = "vec_rejected_sequential"}> ({
  ^bb0(%arg0: memref<?xf32>):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "memref.dim"(%arg0, %0) : (memref<?xf32>, index) -> index
    "affine.for"(%1) <{lowerBoundMap = #map2, operandSegmentSizes = array<i32: 0, 1, 0>, step = 1 : index, upperBoundMap = #map3}> ({
    ^bb0(%arg1: index):
      %2 = "affine.load"(%arg0, %arg1) <{map = #map}> : (memref<?xf32>, index) -> f32
      "affine.store"(%2, %arg0, %arg1) <{map = #map1}> : (f32, memref<?xf32>, index) -> ()
      "affine.yield"() : () -> ()
    }) : (index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<() -> (0)>
#map1 = affine_map<() -> (128)>
"builtin.module"() ({
  "func.func"() <{function_type = (f32, f32) -> (), sym_name = "vec_no_load_store_ops"}> ({
  ^bb0(%arg0: f32, %arg1: f32):
    %0 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    "affine.for"() <{lowerBoundMap = #map, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map1}> ({
    ^bb0(%arg2: index):
      %1 = "arith.addf"(%arg0, %arg1) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
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
  "func.func"() <{function_type = (memref<512xi32>) -> (), sym_name = "vec_rejected_unsupported_block_arg"}> ({
  ^bb0(%arg0: memref<512xi32>):
    "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map2}> ({
    ^bb0(%arg1: index):
      %0 = "arith.index_cast"(%arg1) : (index) -> i32
      "affine.store"(%0, %arg0, %arg1) <{map = #map}> : (i32, memref<512xi32>, index) -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1) -> (d0, d1)>
#map1 = affine_map<() -> (0)>
#map2 = affine_map<() -> (128)>
#map3 = affine_map<(d0) -> (d0)>
#map4 = affine_map<() -> (256)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<128x256xf32>, memref<256xf32>) -> (), sym_name = "vec_non_vecdim_reduction"}> ({
  ^bb0(%arg0: memref<128x256xf32>, %arg1: memref<256xf32>):
    %0 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map4}> ({
    ^bb0(%arg2: index):
      %1 = "affine.for"(%0) <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 1>, step = 1 : index, upperBoundMap = #map2}> ({
      ^bb0(%arg3: index, %arg4: f32):
        %2 = "affine.load"(%arg0, %arg3, %arg2) <{map = #map}> : (memref<128x256xf32>, index, index) -> f32
        %3 = "arith.addf"(%arg4, %2) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
        "affine.yield"(%3) : (f32) -> ()
      }) : (f32) -> f32
      "affine.store"(%1, %arg1, %arg2) <{map = #map3}> : (f32, memref<256xf32>, index) -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1) -> (d0, d1)>
#map1 = affine_map<() -> (0)>
#map2 = affine_map<() -> (128)>
#map3 = affine_map<(d0) -> (d0)>
#map4 = affine_map<() -> (256)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<128x256xf32>, memref<128x256xi32>, memref<256xf32>, memref<256xi32>) -> (), sym_name = "vec_non_vecdim_reductions"}> ({
  ^bb0(%arg0: memref<128x256xf32>, %arg1: memref<128x256xi32>, %arg2: memref<256xf32>, %arg3: memref<256xi32>):
    %0 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %1 = "arith.constant"() <{value = 1 : i32}> : () -> i32
    "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map4}> ({
    ^bb0(%arg4: index):
      %2:2 = "affine.for"(%0, %1) <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 2>, step = 1 : index, upperBoundMap = #map2}> ({
      ^bb0(%arg5: index, %arg6: f32, %arg7: i32):
        %3 = "affine.load"(%arg0, %arg5, %arg4) <{map = #map}> : (memref<128x256xf32>, index, index) -> f32
        %4 = "arith.addf"(%arg6, %3) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
        %5 = "affine.load"(%arg1, %arg5, %arg4) <{map = #map}> : (memref<128x256xi32>, index, index) -> i32
        %6 = "arith.muli"(%arg7, %5) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
        "affine.yield"(%4, %6) : (f32, i32) -> ()
      }) : (f32, i32) -> (f32, i32)
      "affine.store"(%2#0, %arg2, %arg4) <{map = #map3}> : (f32, memref<256xf32>, index) -> ()
      "affine.store"(%2#1, %arg3, %arg4) <{map = #map3}> : (i32, memref<256xi32>, index) -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1) -> (d0, d1)>
#map1 = affine_map<() -> (0)>
#map2 = affine_map<() -> (128)>
#map3 = affine_map<(d0) -> (d0)>
#map4 = affine_map<() -> (256)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<128x256xf32>, memref<256xf32>) -> (), sym_name = "vec_no_vecdim_last_value"}> ({
  ^bb0(%arg0: memref<128x256xf32>, %arg1: memref<256xf32>):
    %0 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map4}> ({
    ^bb0(%arg2: index):
      %1 = "affine.for"(%0) <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 1>, step = 1 : index, upperBoundMap = #map2}> ({
      ^bb0(%arg3: index, %arg4: f32):
        %2 = "affine.load"(%arg0, %arg3, %arg2) <{map = #map}> : (memref<128x256xf32>, index, index) -> f32
        "affine.yield"(%2) : (f32) -> ()
      }) : (f32) -> f32
      "affine.store"(%1, %arg1, %arg2) <{map = #map3}> : (f32, memref<256xf32>, index) -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1) -> (d0, d1)>
#map1 = affine_map<() -> (0)>
#map2 = affine_map<() -> (512)>
#map3 = affine_map<(d0) -> (d0)>
#map4 = affine_map<() -> (256)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<256x512xf32>, memref<256xf32>) -> (), sym_name = "vec_vecdim_reduction_rejected"}> ({
  ^bb0(%arg0: memref<256x512xf32>, %arg1: memref<256xf32>):
    %0 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map4}> ({
    ^bb0(%arg2: index):
      %1 = "affine.for"(%0) <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 1>, step = 1 : index, upperBoundMap = #map2}> ({
      ^bb0(%arg3: index, %arg4: f32):
        %2 = "affine.load"(%arg0, %arg2, %arg3) <{map = #map}> : (memref<256x512xf32>, index, index) -> f32
        %3 = "arith.addf"(%arg4, %2) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
        "affine.yield"(%3) : (f32) -> ()
      }) : (f32) -> f32
      "affine.store"(%1, %arg1, %arg2) <{map = #map3}> : (f32, memref<256xf32>, index) -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<() -> (0)>
#map1 = affine_map<() -> (78)>
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "vec_non_scalar_type"}> ({
    %0 = "index.constant"() <{value = 0 : index}> : () -> index
    %1 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<1xi64>
    "affine.for"() <{lowerBoundMap = #map, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map1}> ({
    ^bb0(%arg0: index):
      %2 = "memref.dim"(%1, %0) : (memref<1xi64>, index) -> index
      "affine.yield"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

