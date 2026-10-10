#map = affine_map<(d0) -> (d0)>
#map1 = affine_map<() -> (0)>
#map2 = affine_map<() -> (10)>
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "nested_loops_both_having_invariant_code"}> ({
    %0 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<10xf32>
    %1 = "arith.constant"() <{value = 7.000000e+00 : f32}> : () -> f32
    %2 = "arith.constant"() <{value = 8.000000e+00 : f32}> : () -> f32
    "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map2}> ({
    ^bb0(%arg0: index):
      %3 = "arith.addf"(%1, %2) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map2}> ({
      ^bb0(%arg1: index):
        "affine.store"(%3, %0, %arg0) <{map = #map}> : (f32, memref<10xf32>, index) -> ()
        "affine.yield"() : () -> ()
      }) : () -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0) -> (d0 + 1)>
#map1 = affine_map<(d0) -> (d0)>
#map2 = affine_map<() -> (0)>
#map3 = affine_map<() -> (10)>
"builtin.module"() ({
  "func.func"() <{function_type = () -> memref<10xf32>, sym_name = "store_affine_apply"}> ({
    %0 = "arith.constant"() <{value = 7.000000e+00 : f32}> : () -> f32
    %1 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<10xf32>
    "affine.for"() <{lowerBoundMap = #map2, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map3}> ({
    ^bb0(%arg0: index):
      %2 = "affine.apply"(%arg0) <{map = #map}> : (index) -> index
      "affine.store"(%0, %1, %2) <{map = #map1}> : (f32, memref<10xf32>, index) -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    "func.return"(%1) : (memref<10xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<() -> (0)>
#map1 = affine_map<() -> (10)>
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "nested_loops_code_invariant_to_both"}> ({
    %0 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<10xf32>
    %1 = "arith.constant"() <{value = 7.000000e+00 : f32}> : () -> f32
    %2 = "arith.constant"() <{value = 8.000000e+00 : f32}> : () -> f32
    "affine.for"() <{lowerBoundMap = #map, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map1}> ({
    ^bb0(%arg0: index):
      "affine.for"() <{lowerBoundMap = #map, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map1}> ({
      ^bb0(%arg1: index):
        %3 = "arith.addf"(%1, %2) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
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
#map3 = affine_map<() -> (30)>
#map4 = affine_map<() -> (20)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<10xindex>) -> (), sym_name = "nested_loops_inner_loops_invariant_to_outermost_loop"}> ({
  ^bb0(%arg0: memref<10xindex>):
    "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map4}> ({
    ^bb0(%arg1: index):
      "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map3}> ({
      ^bb0(%arg2: index):
        %0 = "affine.for"(%arg2) <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 1>, step = 1 : index, upperBoundMap = #map2}> ({
        ^bb0(%arg3: index, %arg4: index):
          %1 = "affine.load"(%arg0, %arg3) <{map = #map}> : (memref<10xindex>, index) -> index
          %2 = "arith.addi"(%arg4, %1) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
          "affine.yield"(%2) : (index) -> ()
        }) : (index) -> index
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
  "func.func"() <{function_type = () -> (), sym_name = "single_loop_nothing_invariant"}> ({
    %0 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<10xf32>
    %1 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<11xf32>
    "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map2}> ({
    ^bb0(%arg0: index):
      %2 = "affine.load"(%0, %arg0) <{map = #map}> : (memref<10xf32>, index) -> f32
      %3 = "affine.load"(%1, %arg0) <{map = #map}> : (memref<11xf32>, index) -> f32
      %4 = "arith.addf"(%2, %3) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "affine.store"(%4, %0, %arg0) <{map = #map}> : (f32, memref<10xf32>, index) -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0) -> (d0 + 1)>
#map1 = affine_map<(d0) -> (d0)>
#map2 = affine_map<() -> (0)>
#map3 = affine_map<() -> (10)>
#set = affine_set<(d0, d1) : (d1 - d0 >= 0)>
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "invariant_code_inside_affine_if"}> ({
    %0 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<10xf32>
    %1 = "arith.constant"() <{value = 8.000000e+00 : f32}> : () -> f32
    "affine.for"() <{lowerBoundMap = #map2, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map3}> ({
    ^bb0(%arg0: index):
      %2 = "affine.apply"(%arg0) <{map = #map}> : (index) -> index
      "affine.if"(%arg0, %2) <{condition = #set}> ({
        %3 = "arith.addf"(%1, %1) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
        "affine.store"(%3, %0, %arg0) <{map = #map1}> : (f32, memref<10xf32>, index) -> ()
        "affine.yield"() : () -> ()
      }, {
      }) : (index, index) -> ()
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
  "func.func"() <{function_type = () -> (), sym_name = "dependent_stores"}> ({
    %0 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<10xf32>
    %1 = "arith.constant"() <{value = 7.000000e+00 : f32}> : () -> f32
    %2 = "arith.constant"() <{value = 8.000000e+00 : f32}> : () -> f32
    "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map2}> ({
    ^bb0(%arg0: index):
      %3 = "arith.addf"(%1, %2) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map2}> ({
      ^bb0(%arg1: index):
        %4 = "arith.mulf"(%1, %1) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
        "affine.store"(%4, %0, %arg1) <{map = #map}> : (f32, memref<10xf32>, index) -> ()
        "affine.store"(%3, %0, %arg0) <{map = #map}> : (f32, memref<10xf32>, index) -> ()
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
  "func.func"() <{function_type = () -> (), sym_name = "independent_stores"}> ({
    %0 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<10xf32>
    %1 = "arith.constant"() <{value = 7.000000e+00 : f32}> : () -> f32
    %2 = "arith.constant"() <{value = 8.000000e+00 : f32}> : () -> f32
    "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map2}> ({
    ^bb0(%arg0: index):
      %3 = "arith.addf"(%1, %2) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map2}> ({
      ^bb0(%arg1: index):
        %4 = "arith.mulf"(%1, %1) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
        "affine.store"(%3, %0, %arg0) <{map = #map}> : (f32, memref<10xf32>, index) -> ()
        "affine.store"(%4, %0, %arg1) <{map = #map}> : (f32, memref<10xf32>, index) -> ()
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
  "func.func"() <{function_type = () -> (), sym_name = "load_dependent_store"}> ({
    %0 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<10xf32>
    %1 = "arith.constant"() <{value = 7.000000e+00 : f32}> : () -> f32
    %2 = "arith.constant"() <{value = 8.000000e+00 : f32}> : () -> f32
    "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map2}> ({
    ^bb0(%arg0: index):
      %3 = "arith.addf"(%1, %2) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map2}> ({
      ^bb0(%arg1: index):
        %4 = "arith.addf"(%1, %1) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
        "affine.store"(%3, %0, %arg1) <{map = #map}> : (f32, memref<10xf32>, index) -> ()
        %5 = "affine.load"(%0, %arg0) <{map = #map}> : (memref<10xf32>, index) -> f32
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
  "func.func"() <{function_type = () -> (), sym_name = "load_after_load"}> ({
    %0 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<10xf32>
    %1 = "arith.constant"() <{value = 7.000000e+00 : f32}> : () -> f32
    %2 = "arith.constant"() <{value = 8.000000e+00 : f32}> : () -> f32
    "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map2}> ({
    ^bb0(%arg0: index):
      %3 = "arith.addf"(%1, %2) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map2}> ({
      ^bb0(%arg1: index):
        %4 = "arith.addf"(%1, %1) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
        %5 = "affine.load"(%0, %arg1) <{map = #map}> : (memref<10xf32>, index) -> f32
        %6 = "affine.load"(%0, %arg0) <{map = #map}> : (memref<10xf32>, index) -> f32
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
#set = affine_set<(d0, d1) : (d1 - d0 >= 0)>
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "invariant_affine_if"}> ({
    %0 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<10xf32>
    %1 = "arith.constant"() <{value = 8.000000e+00 : f32}> : () -> f32
    "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map2}> ({
    ^bb0(%arg0: index):
      "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map2}> ({
      ^bb0(%arg1: index):
        "affine.if"(%arg0, %arg0) <{condition = #set}> ({
          %2 = "arith.addf"(%1, %1) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
          "affine.store"(%2, %0, %arg0) <{map = #map}> : (f32, memref<10xf32>, index) -> ()
          "affine.yield"() : () -> ()
        }, {
        }) : (index, index) -> ()
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
#set = affine_set<(d0, d1) : (d1 - d0 >= 0)>
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "invariant_affine_if2"}> ({
    %0 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<10xf32>
    %1 = "arith.constant"() <{value = 8.000000e+00 : f32}> : () -> f32
    "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map2}> ({
    ^bb0(%arg0: index):
      "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map2}> ({
      ^bb0(%arg1: index):
        "affine.if"(%arg0, %arg0) <{condition = #set}> ({
          %2 = "arith.addf"(%1, %1) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
          "affine.store"(%2, %0, %arg1) <{map = #map}> : (f32, memref<10xf32>, index) -> ()
          "affine.yield"() : () -> ()
        }, {
        }) : (index, index) -> ()
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
#set = affine_set<(d0, d1) : (d1 - d0 >= 0)>
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "invariant_affine_nested_if"}> ({
    %0 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<10xf32>
    %1 = "arith.constant"() <{value = 8.000000e+00 : f32}> : () -> f32
    "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map2}> ({
    ^bb0(%arg0: index):
      "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map2}> ({
      ^bb0(%arg1: index):
        "affine.if"(%arg0, %arg0) <{condition = #set}> ({
          %2 = "arith.addf"(%1, %1) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
          "affine.store"(%2, %0, %arg0) <{map = #map}> : (f32, memref<10xf32>, index) -> ()
          "affine.if"(%arg0, %arg0) <{condition = #set}> ({
            "affine.store"(%2, %0, %arg1) <{map = #map}> : (f32, memref<10xf32>, index) -> ()
            "affine.yield"() : () -> ()
          }, {
          }) : (index, index) -> ()
          "affine.yield"() : () -> ()
        }, {
        }) : (index, index) -> ()
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
#set = affine_set<(d0, d1) : (d1 - d0 >= 0)>
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "invariant_affine_nested_if_else"}> ({
    %0 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<10xf32>
    %1 = "arith.constant"() <{value = 8.000000e+00 : f32}> : () -> f32
    "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map2}> ({
    ^bb0(%arg0: index):
      "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map2}> ({
      ^bb0(%arg1: index):
        "affine.if"(%arg0, %arg0) <{condition = #set}> ({
          %2 = "arith.addf"(%1, %1) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
          "affine.store"(%2, %0, %arg0) <{map = #map}> : (f32, memref<10xf32>, index) -> ()
          "affine.if"(%arg0, %arg0) <{condition = #set}> ({
            "affine.store"(%2, %0, %arg0) <{map = #map}> : (f32, memref<10xf32>, index) -> ()
            "affine.yield"() : () -> ()
          }, {
            "affine.store"(%2, %0, %arg1) <{map = #map}> : (f32, memref<10xf32>, index) -> ()
            "affine.yield"() : () -> ()
          }) : (index, index) -> ()
          "affine.yield"() : () -> ()
        }, {
        }) : (index, index) -> ()
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
#set = affine_set<(d0, d1) : (d1 - d0 >= 0)>
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "invariant_affine_nested_if_else2"}> ({
    %0 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<10xf32>
    %1 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<10xf32>
    %2 = "arith.constant"() <{value = 8.000000e+00 : f32}> : () -> f32
    "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map2}> ({
    ^bb0(%arg0: index):
      "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map2}> ({
      ^bb0(%arg1: index):
        "affine.if"(%arg0, %arg0) <{condition = #set}> ({
          %3 = "arith.addf"(%2, %2) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
          %4 = "affine.load"(%0, %arg0) <{map = #map}> : (memref<10xf32>, index) -> f32
          "affine.if"(%arg0, %arg0) <{condition = #set}> ({
            "affine.store"(%3, %1, %arg0) <{map = #map}> : (f32, memref<10xf32>, index) -> ()
            "affine.yield"() : () -> ()
          }, {
            %5 = "affine.load"(%0, %arg0) <{map = #map}> : (memref<10xf32>, index) -> f32
            "affine.yield"() : () -> ()
          }) : (index, index) -> ()
          "affine.yield"() : () -> ()
        }, {
        }) : (index, index) -> ()
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
#set = affine_set<(d0, d1) : (d1 - d0 >= 0)>
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "invariant_affine_nested_if2"}> ({
    %0 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<10xf32>
    %1 = "arith.constant"() <{value = 8.000000e+00 : f32}> : () -> f32
    "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map2}> ({
    ^bb0(%arg0: index):
      "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map2}> ({
      ^bb0(%arg1: index):
        "affine.if"(%arg0, %arg0) <{condition = #set}> ({
          %2 = "arith.addf"(%1, %1) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
          %3 = "affine.load"(%0, %arg0) <{map = #map}> : (memref<10xf32>, index) -> f32
          "affine.if"(%arg0, %arg0) <{condition = #set}> ({
            %4 = "affine.load"(%0, %arg0) <{map = #map}> : (memref<10xf32>, index) -> f32
            "affine.yield"() : () -> ()
          }, {
          }) : (index, index) -> ()
          "affine.yield"() : () -> ()
        }, {
        }) : (index, index) -> ()
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
#set = affine_set<(d0, d1) : (d1 - d0 >= 0)>
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "invariant_affine_for_inside_affine_if"}> ({
    %0 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<10xf32>
    %1 = "arith.constant"() <{value = 8.000000e+00 : f32}> : () -> f32
    "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map2}> ({
    ^bb0(%arg0: index):
      "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map2}> ({
      ^bb0(%arg1: index):
        "affine.if"(%arg0, %arg0) <{condition = #set}> ({
          %2 = "arith.addf"(%1, %1) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
          "affine.store"(%2, %0, %arg0) <{map = #map}> : (f32, memref<10xf32>, index) -> ()
          "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map2}> ({
          ^bb0(%arg2: index):
            "affine.store"(%2, %0, %arg2) <{map = #map}> : (f32, memref<10xf32>, index) -> ()
            "affine.yield"() : () -> ()
          }) : () -> ()
          "affine.yield"() : () -> ()
        }, {
        }) : (index, index) -> ()
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
#map2 = affine_map<() -> (5)>
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "invariant_constant_and_load"}> ({
    %0 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<100xf32>
    %1 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<100xf32>
    "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map2}> ({
    ^bb0(%arg0: index):
      %2 = "arith.constant"() <{value = 0 : index}> : () -> index
      %3 = "affine.load"(%1, %2) <{map = #map}> : (memref<100xf32>, index) -> f32
      "affine.store"(%3, %0, %arg0) <{map = #map}> : (f32, memref<100xf32>, index) -> ()
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
  "func.func"() <{function_type = () -> (), sym_name = "nested_load_store_same_memref"}> ({
    %0 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<10xf32>
    %1 = "arith.constant"() <{value = 8.000000e+00 : f32}> : () -> f32
    %2 = "arith.constant"() <{value = 0 : index}> : () -> index
    "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map2}> ({
    ^bb0(%arg0: index):
      %3 = "affine.load"(%0, %2) <{map = #map}> : (memref<10xf32>, index) -> f32
      "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map2}> ({
      ^bb0(%arg1: index):
        "affine.store"(%1, %0, %arg1) <{map = #map}> : (f32, memref<10xf32>, index) -> ()
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
  "func.func"() <{function_type = () -> (), sym_name = "nested_load_store_same_memref2"}> ({
    %0 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<10xf32>
    %1 = "arith.constant"() <{value = 8.000000e+00 : f32}> : () -> f32
    %2 = "arith.constant"() <{value = 0 : index}> : () -> index
    "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map2}> ({
    ^bb0(%arg0: index):
      "affine.store"(%1, %0, %2) <{map = #map}> : (f32, memref<10xf32>, index) -> ()
      "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map2}> ({
      ^bb0(%arg1: index):
        %3 = "affine.load"(%0, %arg0) <{map = #map}> : (memref<10xf32>, index) -> f32
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
#map3 = affine_map<() -> (512)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<10x512xf32>) -> (), sym_name = "do_not_hoist_dependent_side_effect_free_op"}> ({
  ^bb0(%arg0: memref<10x512xf32>):
    %0 = "memref.alloca"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<1xf32>
    %1 = "arith.constant"() <{value = 8.000000e+00 : f32}> : () -> f32
    "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map3}> ({
    ^bb0(%arg1: index):
      "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map2}> ({
      ^bb0(%arg2: index):
        %4 = "affine.load"(%arg0, %arg1, %arg2) <{map = #map}> : (memref<10x512xf32>, index, index) -> f32
        %5 = "affine.load"(%0) <{map = #map1}> : (memref<1xf32>) -> f32
        %6 = "arith.addf"(%4, %5) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
        "affine.store"(%6, %0) <{map = #map1}> : (f32, memref<1xf32>) -> ()
        "affine.yield"() : () -> ()
      }) : () -> ()
      %2 = "affine.load"(%0) <{map = #map1}> : (memref<1xf32>) -> f32
      %3 = "arith.mulf"(%2, %1) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "affine.yield"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0) -> (d0 * 4)>
#map1 = affine_map<() -> (0)>
#map2 = affine_map<() -> (10)>
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "vector_loop_nothing_invariant"}> ({
    %0 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<40xf32>
    %1 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<40xf32>
    "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map2}> ({
    ^bb0(%arg0: index):
      %2 = "affine.vector_load"(%0, %arg0) <{map = #map}> : (memref<40xf32>, index) -> vector<4xf32>
      %3 = "affine.vector_load"(%1, %arg0) <{map = #map}> : (memref<40xf32>, index) -> vector<4xf32>
      %4 = "arith.addf"(%2, %3) <{fastmath = #arith.fastmath<none>}> : (vector<4xf32>, vector<4xf32>) -> vector<4xf32>
      "affine.vector_store"(%4, %0, %arg0) <{map = #map}> : (vector<4xf32>, memref<40xf32>, index) -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<() -> (0)>
#map1 = affine_map<() -> (10)>
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "vector_loop_all_invariant"}> ({
    %0 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<4xf32>
    %1 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<4xf32>
    %2 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<4xf32>
    "affine.for"() <{lowerBoundMap = #map, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map1}> ({
    ^bb0(%arg0: index):
      %3 = "affine.vector_load"(%0) <{map = #map}> : (memref<4xf32>) -> vector<4xf32>
      %4 = "affine.vector_load"(%1) <{map = #map}> : (memref<4xf32>) -> vector<4xf32>
      %5 = "arith.addf"(%3, %4) <{fastmath = #arith.fastmath<none>}> : (vector<4xf32>, vector<4xf32>) -> vector<4xf32>
      "affine.vector_store"(%5, %2) <{map = #map}> : (vector<4xf32>, memref<4xf32>) -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0) -> (d0)>
#map1 = affine_map<() -> (0)>
#map2 = affine_map<() -> (10)>
#set = affine_set<(d0) : (d0 - 10 >= 0)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<1024xf32>) -> f32, sym_name = "affine_if_not_invariant"}> ({
  ^bb0(%arg0: memref<1024xf32>):
    %0 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %1 = "arith.constant"() <{value = 1.000000e+00 : f32}> : () -> f32
    %2 = "affine.for"(%0) <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 1>, step = 2 : index, upperBoundMap = #map2}> ({
    ^bb0(%arg1: index, %arg2: f32):
      %3 = "affine.load"(%arg0, %arg1) <{map = #map}> : (memref<1024xf32>, index) -> f32
      %4 = "affine.if"(%arg1) <{condition = #set}> ({
        %6 = "arith.addf"(%arg2, %3) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
        "affine.yield"(%6) : (f32) -> ()
      }, {
        "affine.yield"(%arg2) : (f32) -> ()
      }) : (index) -> f32
      %5 = "arith.addf"(%4, %1) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "affine.yield"(%5) : (f32) -> ()
    }) : (f32) -> f32
    "func.return"(%2) : (f32) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1) -> (d0, d1)>
#map1 = affine_map<() -> (0)>
#map2 = affine_map<() -> (512)>
#map3 = affine_map<(d0) -> (d0, 0)>
#map4 = affine_map<() -> (30)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<30x512xf32, 1>, memref<30x1xf32, 1>) -> (), sym_name = "affine_for_not_invariant"}> ({
  ^bb0(%arg0: memref<30x512xf32, 1>, %arg1: memref<30x1xf32, 1>):
    %0 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %1 = "arith.constant"() <{value = 1.100000e+00 : f32}> : () -> f32
    "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map4}> ({
    ^bb0(%arg2: index):
      %2 = "affine.for"(%0) <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 1>, step = 1 : index, upperBoundMap = #map2}> ({
      ^bb0(%arg3: index, %arg4: f32):
        %4 = "affine.load"(%arg0, %arg2, %arg3) <{map = #map}> : (memref<30x512xf32, 1>, index, index) -> f32
        %5 = "arith.addf"(%arg4, %4) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
        "affine.yield"(%5) : (f32) -> ()
      }) : (f32) -> f32
      %3 = "arith.mulf"(%2, %1) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "affine.store"(%3, %arg1, %arg2) <{map = #map3}> : (f32, memref<30x1xf32, 1>, index) -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<() -> (0)>
#map1 = affine_map<() -> (11)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<10xindex>) -> (), sym_name = "use_of_iter_operands_invariant"}> ({
  ^bb0(%arg0: memref<10xindex>):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "affine.for"(%0) <{lowerBoundMap = #map, operandSegmentSizes = array<i32: 0, 0, 1>, step = 1 : index, upperBoundMap = #map1}> ({
    ^bb0(%arg1: index, %arg2: index):
      %2 = "arith.muli"(%0, %0) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
      %3 = "arith.addi"(%arg2, %2) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
      "affine.yield"(%3) : (index) -> ()
    }) : (index) -> index
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<() -> (0)>
#map1 = affine_map<() -> (11)>
#map2 = affine_map<(d0, d1, d2) -> (d0 + 3968, d1 + d2 * 64)>
#map3 = affine_map<(d0) -> (64, d0 * -64 + 1020)>
#map4 = affine_map<() -> (0, 0)>
#map5 = affine_map<(d0) -> (128, 122, 64, d0 * -64 + 2040)>
#map6 = affine_map<() -> (16)>
#map7 = affine_map<() -> (32)>
#map8 = affine_map<(d0, d1) -> (d0 + 3968, d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<10xindex>) -> (), sym_name = "use_of_iter_args_not_invariant"}> ({
  ^bb0(%arg17: memref<10xindex>):
    %4 = "arith.constant"() <{value = 0 : index}> : () -> index
    %5 = "affine.for"(%4) <{lowerBoundMap = #map, operandSegmentSizes = array<i32: 0, 0, 1>, step = 1 : index, upperBoundMap = #map1}> ({
    ^bb0(%arg18: index, %arg19: index):
      %6 = "arith.addi"(%arg19, %4) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
      "affine.yield"(%6) : (index) -> ()
    }) : (index) -> index
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<4090x2040xf32>, index) -> (), sym_name = "affine_parallel"}> ({
  ^bb0(%arg0: memref<4090x2040xf32>, %arg1: index):
    %0 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    "affine.parallel"() <{lowerBoundsGroups = dense<1> : tensor<1xi32>, lowerBoundsMap = #map, reductions = [], steps = [1], upperBoundsGroups = dense<1> : tensor<1xi32>, upperBoundsMap = #map7}> ({
    ^bb0(%arg12: index):
      "affine.for"() <{lowerBoundMap = #map, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map6}> ({
      ^bb0(%arg13: index):
        "affine.parallel"(%arg12) <{lowerBoundsGroups = dense<1> : tensor<2xi32>, lowerBoundsMap = #map4, reductions = [], steps = [1, 1], upperBoundsGroups = dense<2> : tensor<2xi32>, upperBoundsMap = #map5}> ({
        ^bb0(%arg14: index, %arg15: index):
          "affine.for"(%arg13) <{lowerBoundMap = #map, operandSegmentSizes = array<i32: 0, 1, 0>, step = 1 : index, upperBoundMap = #map3}> ({
          ^bb0(%arg16: index):
            "affine.store"(%0, %arg0, %arg14, %arg15, %arg12) <{map = #map2}> : (f32, memref<4090x2040xf32>, index, index, index) -> ()
            "affine.yield"() : () -> ()
          }) : (index) -> ()
          "affine.yield"() : () -> ()
        }) : (index) -> ()
        "affine.yield"() : () -> ()
      }) : () -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    %1 = "arith.constant"() <{value = 0 : index}> : () -> index
    %2 = "arith.constant"() <{value = 1 : index}> : () -> index
    %3 = "arith.constant"() <{value = 32 : index}> : () -> index
    "scf.parallel"(%1, %3, %2) <{operandSegmentSizes = array<i32: 1, 1, 1, 0>}> ({
    ^bb0(%arg7: index):
      "affine.for"() <{lowerBoundMap = #map, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map6}> ({
      ^bb0(%arg8: index):
        "affine.parallel"(%arg1) <{lowerBoundsGroups = dense<1> : tensor<2xi32>, lowerBoundsMap = #map4, reductions = [], steps = [1, 1], upperBoundsGroups = dense<2> : tensor<2xi32>, upperBoundsMap = #map5}> ({
        ^bb0(%arg9: index, %arg10: index):
          "affine.for"(%arg8) <{lowerBoundMap = #map, operandSegmentSizes = array<i32: 0, 1, 0>, step = 1 : index, upperBoundMap = #map3}> ({
          ^bb0(%arg11: index):
            "affine.store"(%0, %arg0, %arg9, %arg10) <{map = #map8}> : (f32, memref<4090x2040xf32>, index, index) -> ()
            "affine.yield"() : () -> ()
          }) : (index) -> ()
          "affine.yield"() : () -> ()
        }) : (index) -> ()
        "affine.yield"() : () -> ()
      }) : () -> ()
      "scf.reduce"() : () -> ()
    }) : (index, index, index) -> ()
    "affine.for"() <{lowerBoundMap = #map, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map7}> ({
    ^bb0(%arg2: index):
      "affine.for"() <{lowerBoundMap = #map, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map6}> ({
      ^bb0(%arg3: index):
        "affine.parallel"(%arg2) <{lowerBoundsGroups = dense<1> : tensor<2xi32>, lowerBoundsMap = #map4, reductions = [], steps = [1, 1], upperBoundsGroups = dense<2> : tensor<2xi32>, upperBoundsMap = #map5}> ({
        ^bb0(%arg4: index, %arg5: index):
          "scf.for"(%1, %arg1, %2) ({
          ^bb0(%arg6: index):
            "affine.store"(%0, %arg0, %arg4, %arg5, %arg2) <{map = #map2}> : (f32, memref<4090x2040xf32>, index, index, index) -> ()
            "scf.yield"() : () -> ()
          }) : (index, index, index) -> ()
          "affine.yield"() : () -> ()
        }) : (index) -> ()
        "affine.yield"() : () -> ()
      }) : () -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0) -> (d0 * 163840)>
#map1 = affine_map<(d0) -> (d0)>
#map2 = affine_map<() -> (0)>
#map3 = affine_map<() -> (320)>
#map4 = affine_map<() -> (64)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<10485760xi32>, memref<1xi32>, memref<10485760xi32>) -> (), sym_name = "affine_invariant_use_after_dma"}> ({
  ^bb0(%arg0: memref<10485760xi32>, %arg1: memref<1xi32>, %arg2: memref<10485760xi32>):
    %0 = "arith.constant"() <{value = 320 : index}> : () -> index
    %1 = "arith.constant"() <{value = 0 : index}> : () -> index
    %2 = "arith.constant"() <{value = 1 : index}> : () -> index
    %3 = "memref.alloc"() <{alignment = 16 : i64, operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<0xi32, 2>
    %4 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<1xi32, 2>
    "affine.for"() <{lowerBoundMap = #map2, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map4}> ({
    ^bb0(%arg3: index):
      %5 = "affine.apply"(%arg3) <{map = #map}> : (index) -> index
      %6 = "memref.alloc"() <{alignment = 16 : i64, operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<0xi32, 2>
      %7 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<320xi32, 2>
      "affine.dma_start"(%arg0, %5, %7, %1, %6, %1, %0) {dst_map = #map1, src_map = #map1, tag_map = #map1} : (memref<10485760xi32>, index, memref<320xi32, 2>, index, memref<0xi32, 2>, index, index) -> ()
      "affine.dma_start"(%arg1, %1, %4, %1, %3, %1, %2) {dst_map = #map1, src_map = #map1, tag_map = #map1} : (memref<1xi32>, index, memref<1xi32, 2>, index, memref<0xi32, 2>, index, index) -> ()
      "affine.dma_wait"(%6, %1, %0) {tag_map = #map1} : (memref<0xi32, 2>, index, index) -> ()
      "affine.dma_wait"(%3, %1, %2) {tag_map = #map1} : (memref<0xi32, 2>, index, index) -> ()
      %8 = "affine.apply"(%arg3) <{map = #map}> : (index) -> index
      %9 = "memref.alloc"() <{alignment = 16 : i64, operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<0xi32, 2>
      %10 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<320xi32, 2>
      "affine.for"() <{lowerBoundMap = #map2, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map3}> ({
      ^bb0(%arg4: index):
        %11 = "affine.load"(%7, %arg4) <{map = #map1}> : (memref<320xi32, 2>, index) -> i32
        %12 = "affine.load"(%4) <{map = #map2}> : (memref<1xi32, 2>) -> i32
        %13 = "arith.addi"(%11, %12) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
        %14 = "arith.addi"(%13, %11) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
        "affine.store"(%14, %10, %arg4) <{map = #map1}> : (i32, memref<320xi32, 2>, index) -> ()
        "affine.yield"() : () -> ()
      }) : () -> ()
      "affine.dma_start"(%10, %1, %arg2, %8, %9, %1, %0) {dst_map = #map1, src_map = #map1, tag_map = #map1} : (memref<320xi32, 2>, index, memref<10485760xi32>, index, memref<0xi32, 2>, index, index) -> ()
      "affine.dma_wait"(%9, %1, %0) {tag_map = #map1} : (memref<0xi32, 2>, index, index) -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1) -> (d0, d1)>
#map1 = affine_map<(d0) -> (d0, d0)>
#map2 = affine_map<() -> (0)>
#map3 = affine_map<() -> (10)>
#map4 = affine_map<(d0, d1, d2, d3) -> (0, d0 + d1, d2, d3)>
#map5 = affine_map<() -> (16)>
#map6 = affine_map<() -> (1)>
#map7 = affine_map<() -> (512)>
#map8 = affine_map<() -> (14)>
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "affine_prefetch_invariant"}> ({
    %9 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<10x10xf32>
    "affine.for"() <{lowerBoundMap = #map2, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map3}> ({
    ^bb0(%arg8: index):
      "affine.for"() <{lowerBoundMap = #map2, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map3}> ({
      ^bb0(%arg9: index):
        %10 = "affine.load"(%9, %arg8, %arg9) <{map = #map}> : (memref<10x10xf32>, index, index) -> f32
        "affine.prefetch"(%9, %arg8) <{isDataCache = true, isWrite = true, localityHint = 0 : i32, map = #map1}> : (memref<10x10xf32>, index) -> ()
        "affine.yield"() : () -> ()
      }) : () -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "side_effecting_ops"}> ({
    %0 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %1 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<1x512x16x16xf32>
    %2 = "gpu.wait"() : () -> !gpu.async.token
    "affine.for"() <{lowerBoundMap = #map2, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map8}> ({
    ^bb0(%arg0: index):
      "affine.for"() <{lowerBoundMap = #map2, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map8}> ({
      ^bb0(%arg1: index):
        "affine.parallel"() <{lowerBoundsGroups = dense<1> : tensor<1xi32>, lowerBoundsMap = #map2, reductions = [], steps = [1], upperBoundsGroups = dense<1> : tensor<1xi32>, upperBoundsMap = #map7}> ({
        ^bb0(%arg2: index):
          "affine.for"() <{lowerBoundMap = #map2, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map6}> ({
          ^bb0(%arg3: index):
            "affine.for"() <{lowerBoundMap = #map2, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map6}> ({
            ^bb0(%arg4: index):
              "affine.for"() <{lowerBoundMap = #map2, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map6}> ({
              ^bb0(%arg5: index):
                %3 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<1xf32, 3>
                %4 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<1xf32, 3>
                "affine.store"(%0, %3) <{map = #map2}> : (f32, memref<1xf32, 3>) -> ()
                "affine.store"(%0, %4) <{map = #map2}> : (f32, memref<1xf32, 3>) -> ()
                %5:2 = "gpu.alloc"(%2) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (!gpu.async.token) -> (memref<1x512x16x16xf32>, !gpu.async.token)
                %6 = "gpu.memcpy"(%2, %5#0, %1) : (!gpu.async.token, memref<1x512x16x16xf32>, memref<1x512x16x16xf32>) -> !gpu.async.token
                "affine.for"() <{lowerBoundMap = #map2, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map5}> ({
                ^bb0(%arg6: index):
                  "affine.for"() <{lowerBoundMap = #map2, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map5}> ({
                  ^bb0(%arg7: index):
                    "affine.store"(%0, %5#0, %arg2, %arg5, %arg6, %arg7) <{map = #map4}> : (f32, memref<1x512x16x16xf32>, index, index, index, index) -> ()
                    "affine.yield"() : () -> ()
                  }) : () -> ()
                  "affine.yield"() : () -> ()
                }) : () -> ()
                "memref.dealloc"(%4) : (memref<1xf32, 3>) -> ()
                "memref.dealloc"(%3) : (memref<1xf32, 3>) -> ()
                %7 = "gpu.memcpy"(%2, %1, %5#0) : (!gpu.async.token, memref<1x512x16x16xf32>, memref<1x512x16x16xf32>) -> !gpu.async.token
                %8 = "gpu.dealloc"(%5#1, %5#0) : (!gpu.async.token, memref<1x512x16x16xf32>) -> !gpu.async.token
                "affine.yield"() : () -> ()
              }) : () -> ()
              "affine.yield"() : () -> ()
            }) : () -> ()
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

