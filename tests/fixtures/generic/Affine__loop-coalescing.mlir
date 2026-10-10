"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "one_3d_nest"}> ({
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = 1 : index}> : () -> index
    %2 = "arith.constant"() <{value = 2 : index}> : () -> index
    %3 = "arith.constant"() <{value = 3 : index}> : () -> index
    %4 = "arith.constant"() <{value = 42 : index}> : () -> index
    %5 = "arith.constant"() <{value = 56 : index}> : () -> index
    "scf.for"(%0, %4, %1) ({
    ^bb0(%arg0: index):
      "scf.for"(%0, %5, %1) ({
      ^bb0(%arg1: index):
        "scf.for"(%0, %3, %1) ({
        ^bb0(%arg2: index):
          "use"(%arg0, %arg1, %arg2) : (index, index, index) -> ()
          "scf.yield"() : () -> ()
        }) : (index, index, index) -> ()
        "scf.yield"() : () -> ()
      }) : (index, index, index) -> ()
      "scf.yield"() : () -> ()
    }) : (index, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "multi_use"}> ({
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = 1 : index}> : () -> index
    %2 = "arith.constant"() <{value = 10 : index}> : () -> index
    "scf.for"(%1, %2, %1) ({
    ^bb0(%arg0: index):
      "scf.for"(%1, %2, %1) ({
      ^bb0(%arg1: index):
        "scf.for"(%1, %2, %1) ({
        ^bb0(%arg2: index):
          "use1"(%arg0, %arg1, %arg2) : (index, index, index) -> ()
          "use2"(%arg0, %arg2, %arg1) : (index, index, index) -> ()
          "use3"(%arg2, %arg1, %arg0) : (index, index, index) -> ()
          "scf.yield"() : () -> ()
        }) : (index, index, index) -> ()
        "scf.yield"() : () -> ()
      }) : (index, index, index) -> ()
      "scf.yield"() : () -> ()
    }) : (index, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "unnormalized_loops"}> ({
    %0 = "arith.constant"() <{value = 2 : index}> : () -> index
    %1 = "arith.constant"() <{value = 3 : index}> : () -> index
    %2 = "arith.constant"() <{value = 5 : index}> : () -> index
    %3 = "arith.constant"() <{value = 7 : index}> : () -> index
    %4 = "arith.constant"() <{value = 10 : index}> : () -> index
    %5 = "arith.constant"() <{value = 17 : index}> : () -> index
    "scf.for"(%2, %4, %0) ({
    ^bb0(%arg0: index):
      "scf.for"(%3, %5, %1) ({
      ^bb0(%arg1: index):
        "use"(%arg0, %arg1) : (index, index) -> ()
        "scf.yield"() : () -> ()
      }) : (index, index, index) -> ()
      "scf.yield"() : () -> ()
    }) : (index, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "noramalized_loops_with_yielded_iter_args"}> ({
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = 1 : index}> : () -> index
    %2 = "arith.constant"() <{value = 3 : index}> : () -> index
    %3 = "arith.constant"() <{value = 42 : index}> : () -> index
    %4 = "arith.constant"() <{value = 56 : index}> : () -> index
    %5 = "scf.for"(%0, %3, %1, %0) ({
    ^bb0(%arg0: index, %arg1: index):
      %6 = "scf.for"(%0, %4, %1, %arg1) ({
      ^bb0(%arg2: index, %arg3: index):
        %7 = "scf.for"(%0, %2, %1, %arg3) ({
        ^bb0(%arg4: index, %arg5: index):
          "use"(%arg0, %arg2, %arg4) : (index, index, index) -> ()
          "scf.yield"(%arg5) : (index) -> ()
        }) : (index, index, index, index) -> index
        "scf.yield"(%7) : (index) -> ()
      }) : (index, index, index, index) -> index
      "scf.yield"(%6) : (index) -> ()
    }) : (index, index, index, index) -> index
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "noramalized_loops_with_shuffled_yielded_iter_args"}> ({
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = 1 : index}> : () -> index
    %2 = "arith.constant"() <{value = 3 : index}> : () -> index
    %3 = "arith.constant"() <{value = 42 : index}> : () -> index
    %4 = "arith.constant"() <{value = 56 : index}> : () -> index
    %5:2 = "scf.for"(%0, %3, %1, %0, %0) ({
    ^bb0(%arg0: index, %arg1: index, %arg2: index):
      %6:2 = "scf.for"(%0, %4, %1, %arg1, %arg2) ({
      ^bb0(%arg3: index, %arg4: index, %arg5: index):
        %7:2 = "scf.for"(%0, %2, %1, %arg4, %arg5) ({
        ^bb0(%arg6: index, %arg7: index, %arg8: index):
          "use"(%arg0, %arg3, %arg6) : (index, index, index) -> ()
          "scf.yield"(%arg8, %arg7) : (index, index) -> ()
        }) : (index, index, index, index, index) -> (index, index)
        "scf.yield"(%7#0, %7#1) : (index, index) -> ()
      }) : (index, index, index, index, index) -> (index, index)
      "scf.yield"(%6#0, %6#1) : (index, index) -> ()
    }) : (index, index, index, index, index) -> (index, index)
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "noramalized_loops_with_yielded_non_iter_args"}> ({
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = 1 : index}> : () -> index
    %2 = "arith.constant"() <{value = 3 : index}> : () -> index
    %3 = "arith.constant"() <{value = 42 : index}> : () -> index
    %4 = "arith.constant"() <{value = 56 : index}> : () -> index
    %5 = "scf.for"(%0, %3, %1, %0) ({
    ^bb0(%arg0: index, %arg1: index):
      %6 = "scf.for"(%0, %4, %1, %arg1) ({
      ^bb0(%arg2: index, %arg3: index):
        %7 = "scf.for"(%0, %2, %1, %arg3) ({
        ^bb0(%arg4: index, %arg5: index):
          %8 = "use"(%arg0, %arg2, %arg4) : (index, index, index) -> index
          "scf.yield"(%8) : (index) -> ()
        }) : (index, index, index, index) -> index
        "scf.yield"(%7) : (index) -> ()
      }) : (index, index, index, index) -> index
      "scf.yield"(%6) : (index) -> ()
    }) : (index, index, index, index) -> index
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (index, index, index, index, index, index) -> (), sym_name = "parametric"}> ({
  ^bb0(%arg0: index, %arg1: index, %arg2: index, %arg3: index, %arg4: index, %arg5: index):
    "scf.for"(%arg0, %arg1, %arg2) ({
    ^bb0(%arg6: index):
      "scf.for"(%arg3, %arg4, %arg5) ({
      ^bb0(%arg7: index):
        "foo"(%arg6, %arg7) : (index, index) -> ()
        "scf.yield"() : () -> ()
      }) : (index, index, index) -> ()
      "scf.yield"() : () -> ()
    }) : (index, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "two_bands"}> ({
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = 1 : index}> : () -> index
    %2 = "arith.constant"() <{value = 10 : index}> : () -> index
    "scf.for"(%0, %2, %1) ({
    ^bb0(%arg0: index):
      "scf.for"(%0, %2, %1) ({
      ^bb0(%arg1: index):
        "scf.for"(%arg0, %arg1, %1) ({
        ^bb0(%arg2: index):
          "scf.for"(%arg0, %arg1, %1) ({
          ^bb0(%arg3: index):
            "foo"() : () -> ()
            "scf.yield"() : () -> ()
          }) : (index, index, index) -> ()
          "scf.yield"() : () -> ()
        }) : (index, index, index) -> ()
        "scf.yield"() : () -> ()
      }) : (index, index, index) -> ()
      "scf.yield"() : () -> ()
    }) : (index, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<() -> (0)>
#map1 = affine_map<() -> (8)>
#map2 = affine_map<() -> (64)>
#map3 = affine_map<() -> (16)>
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "coalesce_affine_for"}> ({
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
#map1 = affine_map<()[s0] -> (s0)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<?x?xf32>) -> (), sym_name = "coalesce_affine_for"}> ({
  ^bb0(%arg0: memref<?x?xf32>):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "memref.dim"(%arg0, %0) : (memref<?x?xf32>, index) -> index
    %2 = "memref.dim"(%arg0, %0) : (memref<?x?xf32>, index) -> index
    %3 = "memref.dim"(%arg0, %0) : (memref<?x?xf32>, index) -> index
    "affine.for"(%1) <{lowerBoundMap = #map, operandSegmentSizes = array<i32: 0, 1, 0>, step = 1 : index, upperBoundMap = #map1}> ({
    ^bb0(%arg1: index):
      "affine.for"(%2) <{lowerBoundMap = #map, operandSegmentSizes = array<i32: 0, 1, 0>, step = 1 : index, upperBoundMap = #map1}> ({
      ^bb0(%arg2: index):
        "affine.for"(%3) <{lowerBoundMap = #map, operandSegmentSizes = array<i32: 0, 1, 0>, step = 1 : index, upperBoundMap = #map1}> ({
        ^bb0(%arg3: index):
          "test.foo"(%arg1, %arg2, %arg3) : (index, index, index) -> ()
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
#map = affine_map<() -> (0)>
#map1 = affine_map<() -> (64)>
#map2 = affine_map<()[s0] -> (s0)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<?x?xf32>) -> (), sym_name = "coalesce_affine_for"}> ({
  ^bb0(%arg0: memref<?x?xf32>):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "memref.dim"(%arg0, %0) : (memref<?x?xf32>, index) -> index
    %2 = "memref.dim"(%arg0, %0) : (memref<?x?xf32>, index) -> index
    "affine.for"(%1) <{lowerBoundMap = #map, operandSegmentSizes = array<i32: 0, 1, 0>, step = 1 : index, upperBoundMap = #map2}> ({
    ^bb0(%arg1: index):
      "affine.for"(%2) <{lowerBoundMap = #map, operandSegmentSizes = array<i32: 0, 1, 0>, step = 1 : index, upperBoundMap = #map2}> ({
      ^bb0(%arg2: index):
        "affine.for"() <{lowerBoundMap = #map, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map1}> ({
        ^bb0(%arg3: index):
          "test.foo"(%arg1, %arg2, %arg3) : (index, index, index) -> ()
          "affine.yield"() : () -> ()
        }) : () -> ()
        "affine.yield"() : () -> ()
      }) : (index) -> ()
      "affine.yield"() : () -> ()
    }) : (index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<() -> (0)>
#map1 = affine_map<()[s0] -> (s0)>
#map2 = affine_map<()[s0] -> (s0, -s0)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<?x?xf32>) -> (), sym_name = "coalesce_affine_for"}> ({
  ^bb0(%arg0: memref<?x?xf32>):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "memref.dim"(%arg0, %0) : (memref<?x?xf32>, index) -> index
    %2 = "memref.dim"(%arg0, %0) : (memref<?x?xf32>, index) -> index
    %3 = "memref.dim"(%arg0, %0) : (memref<?x?xf32>, index) -> index
    "affine.for"(%1) <{lowerBoundMap = #map, operandSegmentSizes = array<i32: 0, 1, 0>, step = 1 : index, upperBoundMap = #map2}> ({
    ^bb0(%arg1: index):
      "affine.for"(%2) <{lowerBoundMap = #map, operandSegmentSizes = array<i32: 0, 1, 0>, step = 1 : index, upperBoundMap = #map1}> ({
      ^bb0(%arg2: index):
        "affine.for"(%3) <{lowerBoundMap = #map, operandSegmentSizes = array<i32: 0, 1, 0>, step = 1 : index, upperBoundMap = #map1}> ({
        ^bb0(%arg3: index):
          "test.foo"(%arg1, %arg2, %arg3) : (index, index, index) -> ()
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
#map = affine_map<(d0) -> (d0 * 110)>
#map1 = affine_map<(d0) -> (696, d0 * 110 + 110)>
#map2 = affine_map<() -> (0)>
#map3 = affine_map<() -> (7)>
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "test_loops_do_not_get_coalesced"}> ({
    "affine.for"() <{lowerBoundMap = #map2, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map3}> ({
    ^bb0(%arg0: index):
      "affine.for"(%arg0, %arg0) <{lowerBoundMap = #map, operandSegmentSizes = array<i32: 1, 1, 0>, step = 1 : index, upperBoundMap = #map1}> ({
      ^bb0(%arg1: index):
        "use"(%arg0, %arg1) : (index, index) -> ()
        "affine.yield"() : () -> ()
      }) : (index, index) -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<() -> (0)>
#map1 = affine_map<() -> (64)>
#map2 = affine_map<() -> (79)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<?xi64>) -> (), sym_name = "inner_loop_has_iter_args"}> ({
  ^bb0(%arg0: memref<?xi64>):
    %0 = "arith.constant"() <{value = 17 : index}> : () -> index
    "affine.for"() <{lowerBoundMap = #map, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map2}> ({
    ^bb0(%arg1: index):
      %1 = "affine.for"(%arg0) <{lowerBoundMap = #map, operandSegmentSizes = array<i32: 0, 0, 1>, step = 1 : index, upperBoundMap = #map1}> ({
      ^bb0(%arg2: index, %arg3: memref<?xi64>):
        %2 = "arith.remui"(%arg2, %0) : (index, index) -> index
        %3 = "arith.index_cast"(%arg2) : (index) -> i64
        "memref.store"(%3, %arg3, %2) : (i64, memref<?xi64>, index) -> ()
        "affine.yield"(%arg3) : (memref<?xi64>) -> ()
      }) : (memref<?xi64>) -> memref<?xi64>
      "affine.yield"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

