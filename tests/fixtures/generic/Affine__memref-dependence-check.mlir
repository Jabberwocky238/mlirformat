"builtin.module"() ({
^bb0:
}) : () -> ()

// -----
#map = affine_map<(d0) -> (d0)>
#map1 = affine_map<() -> (0)>
#map2 = affine_map<() -> (10)>
#set = affine_set<(d0) : (1 == 0)>
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "store_may_execute_before_load"}> ({
    %0 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<10xf32>
    %1 = "arith.constant"() <{value = 7.000000e+00 : f32}> : () -> f32
    %2 = "arith.constant"() <{value = 4 : index}> : () -> index
    "affine.if"(%2) <{condition = #set}> ({
      "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map2}> ({
      ^bb0(%arg1: index):
        "affine.store"(%1, %0, %arg1) <{map = #map}> : (f32, memref<10xf32>, index) -> ()
        "affine.yield"() : () -> ()
      }) : () -> ()
      "affine.yield"() : () -> ()
    }, {
    }) : (index) -> ()
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
  "func.func"() <{function_type = () -> (), sym_name = "dependent_loops"}> ({
    %0 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<10xf32>
    %1 = "arith.constant"() <{value = 7.000000e+00 : f32}> : () -> f32
    "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map2}> ({
    ^bb0(%arg1: index):
      "affine.store"(%1, %0, %arg1) <{map = #map}> : (f32, memref<10xf32>, index) -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map2}> ({
    ^bb0(%arg0: index):
      %2 = "affine.load"(%0, %arg0) <{map = #map}> : (memref<10xf32>, index) -> f32
      "affine.yield"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0) -> (d0)>
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "different_memrefs"}> ({
    %0 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<100xf32>
    %1 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<100xf32>
    %2 = "arith.constant"() <{value = 0 : index}> : () -> index
    %3 = "arith.constant"() <{value = 1.000000e+00 : f32}> : () -> f32
    "affine.store"(%3, %0, %2) <{map = #map}> : (f32, memref<100xf32>, index) -> ()
    %4 = "affine.load"(%1, %2) <{map = #map}> : (memref<100xf32>, index) -> f32
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0) -> (d0)>
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "store_load_different_elements"}> ({
    %0 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<100xf32>
    %1 = "arith.constant"() <{value = 0 : index}> : () -> index
    %2 = "arith.constant"() <{value = 1 : index}> : () -> index
    %3 = "arith.constant"() <{value = 7.000000e+00 : f32}> : () -> f32
    "affine.store"(%3, %0, %1) <{map = #map}> : (f32, memref<100xf32>, index) -> ()
    %4 = "affine.load"(%0, %2) <{map = #map}> : (memref<100xf32>, index) -> f32
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0) -> (d0)>
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "load_store_different_elements"}> ({
    %0 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<100xf32>
    %1 = "arith.constant"() <{value = 0 : index}> : () -> index
    %2 = "arith.constant"() <{value = 1 : index}> : () -> index
    %3 = "arith.constant"() <{value = 7.000000e+00 : f32}> : () -> f32
    %4 = "affine.load"(%0, %2) <{map = #map}> : (memref<100xf32>, index) -> f32
    "affine.store"(%3, %0, %1) <{map = #map}> : (f32, memref<100xf32>, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0) -> (d0)>
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "store_load_same_element"}> ({
    %0 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<100xf32>
    %1 = "arith.constant"() <{value = 11 : index}> : () -> index
    %2 = "arith.constant"() <{value = 7.000000e+00 : f32}> : () -> f32
    "affine.store"(%2, %0, %1) <{map = #map}> : (f32, memref<100xf32>, index) -> ()
    %3 = "affine.load"(%0, %1) <{map = #map}> : (memref<100xf32>, index) -> f32
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0) -> (d0)>
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "load_load_same_element"}> ({
    %0 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<100xf32>
    %1 = "arith.constant"() <{value = 11 : index}> : () -> index
    %2 = "arith.constant"() <{value = 7.000000e+00 : f32}> : () -> f32
    %3 = "affine.load"(%0, %1) <{map = #map}> : (memref<100xf32>, index) -> f32
    %4 = "affine.load"(%0, %1) <{map = #map}> : (memref<100xf32>, index) -> f32
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0) -> (d0)>
"builtin.module"() ({
  "func.func"() <{function_type = (index) -> (), sym_name = "store_load_same_symbol"}> ({
  ^bb0(%arg0: index):
    %0 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<100xf32>
    %1 = "arith.constant"() <{value = 7.000000e+00 : f32}> : () -> f32
    "affine.store"(%1, %0, %arg0) <{map = #map}> : (f32, memref<100xf32>, index) -> ()
    %2 = "affine.load"(%0, %arg0) <{map = #map}> : (memref<100xf32>, index) -> f32
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0) -> (d0)>
"builtin.module"() ({
  "func.func"() <{function_type = (index, index) -> (), sym_name = "store_load_different_symbols"}> ({
  ^bb0(%arg0: index, %arg1: index):
    %0 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<100xf32>
    %1 = "arith.constant"() <{value = 7.000000e+00 : f32}> : () -> f32
    "affine.store"(%1, %0, %arg0) <{map = #map}> : (f32, memref<100xf32>, index) -> ()
    %2 = "affine.load"(%0, %arg1) <{map = #map}> : (memref<100xf32>, index) -> f32
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0) -> (d0)>
#map1 = affine_map<(d0) -> (d0 + 1)>
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "store_load_diff_element_affine_apply_const"}> ({
    %0 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<100xf32>
    %1 = "arith.constant"() <{value = 1 : index}> : () -> index
    %2 = "arith.constant"() <{value = 8.000000e+00 : f32}> : () -> f32
    %3 = "affine.apply"(%1) <{map = #map}> : (index) -> index
    "affine.store"(%2, %0, %3) <{map = #map}> : (f32, memref<100xf32>, index) -> ()
    %4 = "affine.apply"(%1) <{map = #map1}> : (index) -> index
    %5 = "affine.load"(%0, %4) <{map = #map}> : (memref<100xf32>, index) -> f32
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0) -> (d0 + 1)>
#map1 = affine_map<(d0) -> (d0)>
#map2 = affine_map<(d0) -> (d0 - 1)>
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "store_load_same_element_affine_apply_const"}> ({
    %0 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<100xf32>
    %1 = "arith.constant"() <{value = 7.000000e+00 : f32}> : () -> f32
    %2 = "arith.constant"() <{value = 9 : index}> : () -> index
    %3 = "arith.constant"() <{value = 11 : index}> : () -> index
    %4 = "affine.apply"(%2) <{map = #map}> : (index) -> index
    "affine.store"(%1, %0, %4) <{map = #map1}> : (f32, memref<100xf32>, index) -> ()
    %5 = "affine.apply"(%3) <{map = #map2}> : (index) -> index
    %6 = "affine.load"(%0, %5) <{map = #map1}> : (memref<100xf32>, index) -> f32
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0) -> (d0)>
"builtin.module"() ({
  "func.func"() <{function_type = (index) -> (), sym_name = "store_load_affine_apply_symbol"}> ({
  ^bb0(%arg0: index):
    %0 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<100xf32>
    %1 = "arith.constant"() <{value = 7.000000e+00 : f32}> : () -> f32
    %2 = "affine.apply"(%arg0) <{map = #map}> : (index) -> index
    "affine.store"(%1, %0, %2) <{map = #map}> : (f32, memref<100xf32>, index) -> ()
    %3 = "affine.apply"(%arg0) <{map = #map}> : (index) -> index
    %4 = "affine.load"(%0, %3) <{map = #map}> : (memref<100xf32>, index) -> f32
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0) -> (d0)>
#map1 = affine_map<(d0) -> (d0 + 1)>
"builtin.module"() ({
  "func.func"() <{function_type = (index) -> (), sym_name = "store_load_affine_apply_symbol_offset"}> ({
  ^bb0(%arg0: index):
    %0 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<100xf32>
    %1 = "arith.constant"() <{value = 7.000000e+00 : f32}> : () -> f32
    %2 = "affine.apply"(%arg0) <{map = #map}> : (index) -> index
    "affine.store"(%1, %0, %2) <{map = #map}> : (f32, memref<100xf32>, index) -> ()
    %3 = "affine.apply"(%arg0) <{map = #map1}> : (index) -> index
    %4 = "affine.load"(%0, %3) <{map = #map}> : (memref<100xf32>, index) -> f32
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0) -> (d0)>
#map1 = affine_map<() -> (0)>
#map2 = affine_map<() -> (10)>
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "store_range_load_after_range"}> ({
    %0 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<100xf32>
    %1 = "arith.constant"() <{value = 7.000000e+00 : f32}> : () -> f32
    %2 = "arith.constant"() <{value = 10 : index}> : () -> index
    "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map2}> ({
    ^bb0(%arg0: index):
      %3 = "affine.apply"(%arg0) <{map = #map}> : (index) -> index
      "affine.store"(%1, %0, %3) <{map = #map}> : (f32, memref<100xf32>, index) -> ()
      %4 = "affine.apply"(%2) <{map = #map}> : (index) -> index
      %5 = "affine.load"(%0, %4) <{map = #map}> : (memref<100xf32>, index) -> f32
      "affine.yield"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0) -> (d0)>
#map1 = affine_map<() -> (0)>
#map2 = affine_map<()[s0] -> (s0)>
"builtin.module"() ({
  "func.func"() <{function_type = (index, index) -> (), sym_name = "store_load_func_symbol"}> ({
  ^bb0(%arg0: index, %arg1: index):
    %0 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<100xf32>
    %1 = "arith.constant"() <{value = 7.000000e+00 : f32}> : () -> f32
    %2 = "arith.constant"() <{value = 10 : index}> : () -> index
    "affine.for"(%arg1) <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 1, 0>, step = 1 : index, upperBoundMap = #map2}> ({
    ^bb0(%arg2: index):
      %3 = "affine.apply"(%arg0) <{map = #map}> : (index) -> index
      "affine.store"(%1, %0, %3) <{map = #map}> : (f32, memref<100xf32>, index) -> ()
      %4 = "affine.apply"(%arg0) <{map = #map}> : (index) -> index
      %5 = "affine.load"(%0, %4) <{map = #map}> : (memref<100xf32>, index) -> f32
      "affine.yield"() : () -> ()
    }) : (index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0) -> (d0)>
#map1 = affine_map<(d0) -> (d0 - 1)>
#map2 = affine_map<() -> (0)>
#map3 = affine_map<() -> (10)>
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "store_range_load_last_in_range"}> ({
    %0 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<100xf32>
    %1 = "arith.constant"() <{value = 7.000000e+00 : f32}> : () -> f32
    %2 = "arith.constant"() <{value = 10 : index}> : () -> index
    "affine.for"() <{lowerBoundMap = #map2, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map3}> ({
    ^bb0(%arg0: index):
      %3 = "affine.apply"(%arg0) <{map = #map}> : (index) -> index
      "affine.store"(%1, %0, %3) <{map = #map}> : (f32, memref<100xf32>, index) -> ()
      %4 = "affine.apply"(%2) <{map = #map1}> : (index) -> index
      %5 = "affine.load"(%0, %4) <{map = #map}> : (memref<100xf32>, index) -> f32
      "affine.yield"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0) -> (d0)>
#map1 = affine_map<() -> (1)>
#map2 = affine_map<() -> (11)>
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "store_range_load_before_range"}> ({
    %0 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<100xf32>
    %1 = "arith.constant"() <{value = 7.000000e+00 : f32}> : () -> f32
    %2 = "arith.constant"() <{value = 0 : index}> : () -> index
    "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map2}> ({
    ^bb0(%arg0: index):
      %3 = "affine.apply"(%arg0) <{map = #map}> : (index) -> index
      "affine.store"(%1, %0, %3) <{map = #map}> : (f32, memref<100xf32>, index) -> ()
      %4 = "affine.apply"(%2) <{map = #map}> : (index) -> index
      %5 = "affine.load"(%0, %4) <{map = #map}> : (memref<100xf32>, index) -> f32
      "affine.yield"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0) -> (d0)>
#map1 = affine_map<(d0) -> (d0 + 1)>
#map2 = affine_map<() -> (1)>
#map3 = affine_map<() -> (11)>
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "store_range_load_first_in_range"}> ({
    %0 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<100xf32>
    %1 = "arith.constant"() <{value = 7.000000e+00 : f32}> : () -> f32
    %2 = "arith.constant"() <{value = 0 : index}> : () -> index
    "affine.for"() <{lowerBoundMap = #map2, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map3}> ({
    ^bb0(%arg0: index):
      %3 = "affine.apply"(%arg0) <{map = #map}> : (index) -> index
      "affine.store"(%1, %0, %3) <{map = #map}> : (f32, memref<100xf32>, index) -> ()
      %4 = "affine.apply"(%2) <{map = #map1}> : (index) -> index
      %5 = "affine.load"(%0, %4) <{map = #map}> : (memref<100xf32>, index) -> f32
      "affine.yield"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0) -> (d0 + 3)>
#map1 = affine_map<(d0) -> (d0)>
#map2 = affine_map<() -> (1)>
#map3 = affine_map<() -> (11)>
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "store_plus_3"}> ({
    %0 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<100xf32>
    %1 = "arith.constant"() <{value = 7.000000e+00 : f32}> : () -> f32
    "affine.for"() <{lowerBoundMap = #map2, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map3}> ({
    ^bb0(%arg0: index):
      %2 = "affine.apply"(%arg0) <{map = #map}> : (index) -> index
      "affine.store"(%1, %0, %2) <{map = #map1}> : (f32, memref<100xf32>, index) -> ()
      %3 = "affine.apply"(%arg0) <{map = #map1}> : (index) -> index
      %4 = "affine.load"(%0, %3) <{map = #map1}> : (memref<100xf32>, index) -> f32
      "affine.yield"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0) -> (d0)>
#map1 = affine_map<(d0) -> (d0 - 2)>
#map2 = affine_map<() -> (2)>
#map3 = affine_map<() -> (11)>
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "load_minus_2"}> ({
    %0 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<100xf32>
    %1 = "arith.constant"() <{value = 7.000000e+00 : f32}> : () -> f32
    "affine.for"() <{lowerBoundMap = #map2, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map3}> ({
    ^bb0(%arg0: index):
      %2 = "affine.apply"(%arg0) <{map = #map}> : (index) -> index
      "affine.store"(%1, %0, %2) <{map = #map}> : (f32, memref<100xf32>, index) -> ()
      %3 = "affine.apply"(%arg0) <{map = #map1}> : (index) -> index
      %4 = "affine.load"(%0, %3) <{map = #map}> : (memref<100xf32>, index) -> f32
      "affine.yield"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1) -> (d0)>
#map1 = affine_map<(d0, d1) -> (d1)>
#map2 = affine_map<(d0, d1) -> (d0, d1)>
#map3 = affine_map<() -> (0)>
#map4 = affine_map<() -> (11)>
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "perfectly_nested_loops_loop_independent"}> ({
    %0 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<10x10xf32>
    %1 = "arith.constant"() <{value = 7.000000e+00 : f32}> : () -> f32
    "affine.for"() <{lowerBoundMap = #map3, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map4}> ({
    ^bb0(%arg0: index):
      "affine.for"() <{lowerBoundMap = #map3, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map4}> ({
      ^bb0(%arg1: index):
        %2 = "affine.apply"(%arg0, %arg1) <{map = #map}> : (index, index) -> index
        %3 = "affine.apply"(%arg0, %arg1) <{map = #map1}> : (index, index) -> index
        "affine.store"(%1, %0, %2, %3) <{map = #map2}> : (f32, memref<10x10xf32>, index, index) -> ()
        %4 = "affine.apply"(%arg0, %arg1) <{map = #map}> : (index, index) -> index
        %5 = "affine.apply"(%arg0, %arg1) <{map = #map1}> : (index, index) -> index
        %6 = "affine.load"(%0, %4, %5) <{map = #map2}> : (memref<10x10xf32>, index, index) -> f32
        "affine.yield"() : () -> ()
      }) : () -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1) -> (d0)>
#map1 = affine_map<(d0, d1) -> (d1)>
#map2 = affine_map<(d0, d1) -> (d0, d1)>
#map3 = affine_map<(d0, d1) -> (d0 - 2)>
#map4 = affine_map<() -> (0)>
#map5 = affine_map<() -> (9)>
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "perfectly_nested_loops_loop_carried_at_depth1"}> ({
    %0 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<10x10xf32>
    %1 = "arith.constant"() <{value = 7.000000e+00 : f32}> : () -> f32
    "affine.for"() <{lowerBoundMap = #map4, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map5}> ({
    ^bb0(%arg0: index):
      "affine.for"() <{lowerBoundMap = #map4, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map5}> ({
      ^bb0(%arg1: index):
        %2 = "affine.apply"(%arg0, %arg1) <{map = #map}> : (index, index) -> index
        %3 = "affine.apply"(%arg0, %arg1) <{map = #map1}> : (index, index) -> index
        "affine.store"(%1, %0, %2, %3) <{map = #map2}> : (f32, memref<10x10xf32>, index, index) -> ()
        %4 = "affine.apply"(%arg0, %arg1) <{map = #map3}> : (index, index) -> index
        %5 = "affine.apply"(%arg0, %arg1) <{map = #map1}> : (index, index) -> index
        %6 = "affine.load"(%0, %4, %5) <{map = #map2}> : (memref<10x10xf32>, index, index) -> f32
        "affine.yield"() : () -> ()
      }) : () -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1) -> (d0)>
#map1 = affine_map<(d0, d1) -> (d1)>
#map2 = affine_map<(d0, d1) -> (d0, d1)>
#map3 = affine_map<(d0, d1) -> (d1 - 3)>
#map4 = affine_map<() -> (0)>
#map5 = affine_map<() -> (10)>
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "perfectly_nested_loops_loop_carried_at_depth2"}> ({
    %0 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<10x10xf32>
    %1 = "arith.constant"() <{value = 7.000000e+00 : f32}> : () -> f32
    "affine.for"() <{lowerBoundMap = #map4, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map5}> ({
    ^bb0(%arg0: index):
      "affine.for"() <{lowerBoundMap = #map4, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map5}> ({
      ^bb0(%arg1: index):
        %2 = "affine.apply"(%arg0, %arg1) <{map = #map}> : (index, index) -> index
        %3 = "affine.apply"(%arg0, %arg1) <{map = #map1}> : (index, index) -> index
        "affine.store"(%1, %0, %2, %3) <{map = #map2}> : (f32, memref<10x10xf32>, index, index) -> ()
        %4 = "affine.apply"(%arg0, %arg1) <{map = #map}> : (index, index) -> index
        %5 = "affine.apply"(%arg0, %arg1) <{map = #map3}> : (index, index) -> index
        %6 = "affine.load"(%0, %4, %5) <{map = #map2}> : (memref<10x10xf32>, index, index) -> f32
        "affine.yield"() : () -> ()
      }) : () -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1) -> (d0)>
#map1 = affine_map<(d0, d1) -> (d1)>
#map2 = affine_map<(d0, d1) -> (d0, d1)>
#map3 = affine_map<() -> (0)>
#map4 = affine_map<() -> (10)>
#map5 = affine_map<() -> (9)>
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "one_common_loop"}> ({
    %0 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<10x10xf32>
    %1 = "arith.constant"() <{value = 7.000000e+00 : f32}> : () -> f32
    "affine.for"() <{lowerBoundMap = #map3, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map4}> ({
    ^bb0(%arg0: index):
      "affine.for"() <{lowerBoundMap = #map3, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map4}> ({
      ^bb0(%arg2: index):
        %5 = "affine.apply"(%arg0, %arg2) <{map = #map}> : (index, index) -> index
        %6 = "affine.apply"(%arg0, %arg2) <{map = #map1}> : (index, index) -> index
        "affine.store"(%1, %0, %5, %6) <{map = #map2}> : (f32, memref<10x10xf32>, index, index) -> ()
        "affine.yield"() : () -> ()
      }) : () -> ()
      "affine.for"() <{lowerBoundMap = #map3, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map5}> ({
      ^bb0(%arg1: index):
        %2 = "affine.apply"(%arg0, %arg1) <{map = #map}> : (index, index) -> index
        %3 = "affine.apply"(%arg0, %arg1) <{map = #map1}> : (index, index) -> index
        %4 = "affine.load"(%0, %2, %3) <{map = #map2}> : (memref<10x10xf32>, index, index) -> f32
        "affine.yield"() : () -> ()
      }) : () -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0) -> (d0)>
#map1 = affine_map<(d0) -> (d0 + 1)>
#map2 = affine_map<() -> (0)>
#map3 = affine_map<() -> (9)>
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "dependence_cycle"}> ({
    %0 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<100xf32>
    %1 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<100xf32>
    "affine.for"() <{lowerBoundMap = #map2, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map3}> ({
    ^bb0(%arg0: index):
      %2 = "affine.apply"(%arg0) <{map = #map}> : (index) -> index
      %3 = "affine.load"(%0, %2) <{map = #map}> : (memref<100xf32>, index) -> f32
      %4 = "affine.apply"(%arg0) <{map = #map}> : (index) -> index
      "affine.store"(%3, %1, %4) <{map = #map}> : (f32, memref<100xf32>, index) -> ()
      %5 = "affine.apply"(%arg0) <{map = #map}> : (index) -> index
      %6 = "affine.load"(%1, %5) <{map = #map}> : (memref<100xf32>, index) -> f32
      %7 = "affine.apply"(%arg0) <{map = #map1}> : (index) -> index
      "affine.store"(%6, %0, %7) <{map = #map}> : (f32, memref<100xf32>, index) -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1) -> (d0 - 1)>
#map1 = affine_map<(d0, d1) -> (d1 + 1)>
#map2 = affine_map<(d0, d1) -> (d0, d1)>
#map3 = affine_map<(d0, d1) -> (d0)>
#map4 = affine_map<(d0, d1) -> (d1)>
#map5 = affine_map<() -> (0)>
#map6 = affine_map<()[s0] -> (s0)>
"builtin.module"() ({
  "func.func"() <{function_type = (index, index) -> (), sym_name = "negative_and_positive_direction_vectors"}> ({
  ^bb0(%arg0: index, %arg1: index):
    %0 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<10x10xf32>
    %1 = "arith.constant"() <{value = 7.000000e+00 : f32}> : () -> f32
    "affine.for"(%arg0) <{lowerBoundMap = #map5, operandSegmentSizes = array<i32: 0, 1, 0>, step = 1 : index, upperBoundMap = #map6}> ({
    ^bb0(%arg2: index):
      "affine.for"(%arg1) <{lowerBoundMap = #map5, operandSegmentSizes = array<i32: 0, 1, 0>, step = 1 : index, upperBoundMap = #map6}> ({
      ^bb0(%arg3: index):
        %2 = "affine.apply"(%arg2, %arg3) <{map = #map}> : (index, index) -> index
        %3 = "affine.apply"(%arg2, %arg3) <{map = #map1}> : (index, index) -> index
        %4 = "affine.load"(%0, %2, %3) <{map = #map2}> : (memref<10x10xf32>, index, index) -> f32
        %5 = "affine.apply"(%arg2, %arg3) <{map = #map3}> : (index, index) -> index
        %6 = "affine.apply"(%arg2, %arg3) <{map = #map4}> : (index, index) -> index
        "affine.store"(%1, %0, %5, %6) <{map = #map2}> : (f32, memref<10x10xf32>, index, index) -> ()
        "affine.yield"() : () -> ()
      }) : (index) -> ()
      "affine.yield"() : () -> ()
    }) : (index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0) -> (d0 + 1)>
#map1 = affine_map<(d0) -> (d0)>
#map2 = affine_map<() -> (0)>
#map3 = affine_map<() -> (10)>
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "war_raw_waw_deps"}> ({
    %0 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<100xf32>
    %1 = "arith.constant"() <{value = 7.000000e+00 : f32}> : () -> f32
    "affine.for"() <{lowerBoundMap = #map2, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map3}> ({
    ^bb0(%arg0: index):
      "affine.for"() <{lowerBoundMap = #map2, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map3}> ({
      ^bb0(%arg1: index):
        %2 = "affine.apply"(%arg1) <{map = #map}> : (index) -> index
        %3 = "affine.load"(%0, %2) <{map = #map1}> : (memref<100xf32>, index) -> f32
        %4 = "affine.apply"(%arg1) <{map = #map1}> : (index) -> index
        "affine.store"(%1, %0, %4) <{map = #map1}> : (f32, memref<100xf32>, index) -> ()
        "affine.yield"() : () -> ()
      }) : () -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0) -> (d0 mod 2)>
#map1 = affine_map<(d0) -> (d0)>
#map2 = affine_map<(d0) -> ((d0 + 1) mod 2)>
#map3 = affine_map<() -> (0)>
#map4 = affine_map<() -> (10)>
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "mod_deps"}> ({
    %0 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<100xf32>
    %1 = "arith.constant"() <{value = 7.000000e+00 : f32}> : () -> f32
    "affine.for"() <{lowerBoundMap = #map3, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map4}> ({
    ^bb0(%arg0: index):
      %2 = "affine.apply"(%arg0) <{map = #map}> : (index) -> index
      %3 = "affine.load"(%0, %2) <{map = #map1}> : (memref<100xf32>, index) -> f32
      %4 = "affine.apply"(%arg0) <{map = #map2}> : (index) -> index
      "affine.store"(%1, %0, %4) <{map = #map1}> : (f32, memref<100xf32>, index) -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1) -> (d0, d1)>
#map1 = affine_map<() -> (0)>
#map2 = affine_map<() -> (8)>
#map3 = affine_map<() -> (128)>
#map4 = affine_map<(d0, d1) -> (d0 * 16 + d1)>
#map5 = affine_map<() -> (16)>
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "loop_nest_depth"}> ({
    %0 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<100x100xf32>
    %1 = "arith.constant"() <{value = 7.000000e+00 : f32}> : () -> f32
    "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map3}> ({
    ^bb0(%arg4: index):
      "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map2}> ({
      ^bb0(%arg5: index):
        "affine.store"(%1, %0, %arg4, %arg5) <{map = #map}> : (f32, memref<100x100xf32>, index, index) -> ()
        "affine.yield"() : () -> ()
      }) : () -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map2}> ({
    ^bb0(%arg0: index):
      "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map2}> ({
      ^bb0(%arg1: index):
        "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map2}> ({
        ^bb0(%arg2: index):
          "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map5}> ({
          ^bb0(%arg3: index):
            %2 = "affine.apply"(%arg2, %arg3) <{map = #map4}> : (index, index) -> index
            %3 = "affine.load"(%0, %2, %arg1) <{map = #map}> : (memref<100x100xf32>, index, index) -> f32
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
#map = affine_map<(d0, d1, d2) -> (d0 floordiv 4)>
#map1 = affine_map<(d0, d1, d2) -> (d1 mod 2)>
#map2 = affine_map<(d0, d1, d2) -> (d2 floordiv 4)>
#map3 = affine_map<(d0, d1, d2) -> (d0, d1, d2)>
#map4 = affine_map<() -> (0)>
#map5 = affine_map<() -> (8)>
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "mod_div_3d"}> ({
    %0 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<2x2x2xi32>
    %1 = "arith.constant"() <{value = 0 : i32}> : () -> i32
    "affine.for"() <{lowerBoundMap = #map4, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map5}> ({
    ^bb0(%arg0: index):
      "affine.for"() <{lowerBoundMap = #map4, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map5}> ({
      ^bb0(%arg1: index):
        "affine.for"() <{lowerBoundMap = #map4, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map5}> ({
        ^bb0(%arg2: index):
          %2 = "affine.apply"(%arg0, %arg1, %arg2) <{map = #map}> : (index, index, index) -> index
          %3 = "affine.apply"(%arg0, %arg1, %arg2) <{map = #map1}> : (index, index, index) -> index
          %4 = "affine.apply"(%arg0, %arg1, %arg2) <{map = #map2}> : (index, index, index) -> index
          "affine.store"(%1, %0, %2, %3, %4) <{map = #map3}> : (i32, memref<2x2x2xi32>, index, index, index) -> ()
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
#map = affine_map<(d0, d1, d2, d3, d4, d5) -> (d0, d1, d2, d3, d4, d5)>
#map1 = affine_map<() -> (0)>
#map2 = affine_map<() -> (1)>
#map3 = affine_map<() -> (16)>
#map4 = affine_map<() -> (3)>
#map5 = affine_map<() -> (2)>
#map6 = affine_map<(d0, d1) -> (d0 * 9216 + d1 * 128)>
#map7 = affine_map<(d0) -> (d0 floordiv 294912)>
#map8 = affine_map<(d0) -> ((d0 mod 294912) floordiv 147456)>
#map9 = affine_map<(d0) -> (((d0 mod 147456) floordiv 1152) floordiv 8)>
#map10 = affine_map<(d0) -> ((d0 mod 1152) floordiv 384)>
#map11 = affine_map<(d0) -> ((d0 mod 384) floordiv 128)>
#map12 = affine_map<(d0) -> ((d0 mod 128) floordiv 128)>
#map13 = affine_map<(d0, d1) -> (d0, d1)>
#map14 = affine_map<() -> (9)>
#map15 = affine_map<() -> (64)>
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "delinearize_mod_floordiv"}> ({
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = 0 : i32}> : () -> i32
    %2 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<2x2x3x3x16x1xi32>
    %3 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<64x9xi32>
    "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map5}> ({
    ^bb0(%arg2: index):
      "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map5}> ({
      ^bb0(%arg3: index):
        "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map4}> ({
        ^bb0(%arg4: index):
          "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map4}> ({
          ^bb0(%arg5: index):
            "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map3}> ({
            ^bb0(%arg6: index):
              "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map2}> ({
              ^bb0(%arg7: index):
                "affine.store"(%1, %2, %arg2, %arg3, %arg4, %arg5, %arg6, %arg7) <{map = #map}> : (i32, memref<2x2x3x3x16x1xi32>, index, index, index, index, index, index) -> ()
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
    "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map15}> ({
    ^bb0(%arg0: index):
      "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map14}> ({
      ^bb0(%arg1: index):
        %4 = "affine.apply"(%arg0, %arg1) <{map = #map6}> : (index, index) -> index
        %5 = "affine.apply"(%4) <{map = #map7}> : (index) -> index
        %6 = "affine.apply"(%4) <{map = #map8}> : (index) -> index
        %7 = "affine.apply"(%4) <{map = #map9}> : (index) -> index
        %8 = "affine.apply"(%4) <{map = #map10}> : (index) -> index
        %9 = "affine.apply"(%4) <{map = #map11}> : (index) -> index
        %10 = "affine.apply"(%4) <{map = #map12}> : (index) -> index
        %11 = "affine.load"(%2, %5, %6, %8, %9, %7, %10) <{map = #map}> : (memref<2x2x3x3x16x1xi32>, index, index, index, index, index, index) -> i32
        "affine.store"(%11, %3, %arg0, %arg1) <{map = #map13}> : (i32, memref<64x9xi32>, index, index) -> ()
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
#map2 = affine_map<() -> (8)>
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "strided_loop_with_dependence_at_depth2"}> ({
    %0 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<10xf32>
    %1 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 2 : index, upperBoundMap = #map2}> ({
    ^bb0(%arg0: index):
      "affine.store"(%1, %0, %arg0) <{map = #map}> : (f32, memref<10xf32>, index) -> ()
      %2 = "affine.load"(%0, %arg0) <{map = #map}> : (memref<10xf32>, index) -> f32
      "affine.yield"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0) -> (d0 + 1)>
#map1 = affine_map<(d0) -> (d0)>
#map2 = affine_map<() -> (0)>
#map3 = affine_map<() -> (8)>
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "strided_loop_with_no_dependence"}> ({
    %0 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<10xf32>
    %1 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    "affine.for"() <{lowerBoundMap = #map2, operandSegmentSizes = array<i32: 0, 0, 0>, step = 2 : index, upperBoundMap = #map3}> ({
    ^bb0(%arg0: index):
      %2 = "affine.apply"(%arg0) <{map = #map}> : (index) -> index
      "affine.store"(%1, %0, %2) <{map = #map1}> : (f32, memref<10xf32>, index) -> ()
      %3 = "affine.load"(%0, %arg0) <{map = #map1}> : (memref<10xf32>, index) -> f32
      "affine.yield"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0) -> (d0 + 4)>
#map1 = affine_map<(d0) -> (d0)>
#map2 = affine_map<() -> (0)>
#map3 = affine_map<() -> (8)>
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "strided_loop_with_loop_carried_dependence_at_depth1"}> ({
    %0 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<10xf32>
    %1 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    "affine.for"() <{lowerBoundMap = #map2, operandSegmentSizes = array<i32: 0, 0, 0>, step = 2 : index, upperBoundMap = #map3}> ({
    ^bb0(%arg0: index):
      %2 = "affine.apply"(%arg0) <{map = #map}> : (index) -> index
      "affine.store"(%1, %0, %2) <{map = #map1}> : (f32, memref<10xf32>, index) -> ()
      %3 = "affine.load"(%0, %arg0) <{map = #map1}> : (memref<10xf32>, index) -> f32
      "affine.yield"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0) -> (d0 - 1)>
#map1 = affine_map<(d0) -> (d0)>
#map2 = affine_map<(d0) -> (d0 + 1)>
#map3 = affine_map<() -> (0)>
#map4 = affine_map<() -> (10)>
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "test_dep_store_depth1_load_depth2"}> ({
    %0 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<100xf32>
    %1 = "arith.constant"() <{value = 7.000000e+00 : f32}> : () -> f32
    "affine.for"() <{lowerBoundMap = #map3, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map4}> ({
    ^bb0(%arg0: index):
      %2 = "affine.apply"(%arg0) <{map = #map}> : (index) -> index
      "affine.store"(%1, %0, %2) <{map = #map1}> : (f32, memref<100xf32>, index) -> ()
      "affine.for"(%arg0, %arg0) <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 1, 1, 0>, step = 1 : index, upperBoundMap = #map2}> ({
      ^bb0(%arg1: index):
        %3 = "affine.load"(%0, %arg1) <{map = #map1}> : (memref<100xf32>, index) -> f32
        "affine.yield"() : () -> ()
      }) : (index, index) -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0) -> (d0)>
#map1 = affine_map<(d0) -> (d0 + 1)>
#map2 = affine_map<(d0) -> (d0 - 2)>
#map3 = affine_map<() -> (0)>
#map4 = affine_map<() -> (10)>
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "test_dep_store_depth2_load_depth1"}> ({
    %0 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<100xf32>
    %1 = "arith.constant"() <{value = 7.000000e+00 : f32}> : () -> f32
    "affine.for"() <{lowerBoundMap = #map3, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map4}> ({
    ^bb0(%arg0: index):
      "affine.for"(%arg0, %arg0) <{lowerBoundMap = #map, operandSegmentSizes = array<i32: 1, 1, 0>, step = 1 : index, upperBoundMap = #map1}> ({
      ^bb0(%arg1: index):
        "affine.store"(%1, %0, %arg1) <{map = #map}> : (f32, memref<100xf32>, index) -> ()
        "affine.yield"() : () -> ()
      }) : (index, index) -> ()
      %2 = "affine.apply"(%arg0) <{map = #map2}> : (index) -> index
      %3 = "affine.load"(%0, %2) <{map = #map}> : (memref<100xf32>, index) -> f32
      "affine.yield"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0) -> (d0)>
#map1 = affine_map<() -> (0)>
#map2 = affine_map<() -> (100)>
#set = affine_set<(d0) : (d0 - 50 >= 0)>
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "test_affine_for_if_same_block"}> ({
    %0 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<100xf32>
    %1 = "arith.constant"() <{value = 7.000000e+00 : f32}> : () -> f32
    "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map2}> ({
    ^bb0(%arg0: index):
      "affine.if"(%arg0) <{condition = #set}> ({
        %2 = "affine.load"(%0, %arg0) <{map = #map}> : (memref<100xf32>, index) -> f32
        "affine.store"(%1, %0, %arg0) <{map = #map}> : (f32, memref<100xf32>, index) -> ()
        "affine.yield"() : () -> ()
      }, {
      }) : (index) -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0) -> (d0)>
#map1 = affine_map<() -> (0)>
#map2 = affine_map<() -> (10)>
#set = affine_set<(d0) : (d0 - 50 >= 0)>
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "test_affine_for_if_separated"}> ({
    %0 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<100xf32>
    %1 = "arith.constant"() <{value = 7.000000e+00 : f32}> : () -> f32
    "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map2}> ({
    ^bb0(%arg0: index):
      "affine.if"(%arg0) <{condition = #set}> ({
        %2 = "affine.load"(%0, %arg0) <{map = #map}> : (memref<100xf32>, index) -> f32
        "affine.yield"() : () -> ()
      }, {
        "affine.store"(%1, %0, %arg0) <{map = #map}> : (f32, memref<100xf32>, index) -> ()
        "affine.yield"() : () -> ()
      }) : (index) -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0) -> (d0)>
#map1 = affine_map<() -> (0)>
#map2 = affine_map<() -> (100)>
#set = affine_set<(d0) : (d0 - 25 >= 0)>
#set1 = affine_set<(d0) : (-d0 + 75 >= 0)>
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "test_affine_for_if_partially_joined"}> ({
    %0 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<100xf32>
    %1 = "arith.constant"() <{value = 7.000000e+00 : f32}> : () -> f32
    "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map2}> ({
    ^bb0(%arg0: index):
      "affine.if"(%arg0) <{condition = #set}> ({
        %2 = "affine.load"(%0, %arg0) <{map = #map}> : (memref<100xf32>, index) -> f32
        "affine.yield"() : () -> ()
      }, {
      }) : (index) -> ()
      "affine.if"(%arg0) <{condition = #set1}> ({
        "affine.store"(%1, %0, %arg0) <{map = #map}> : (f32, memref<100xf32>, index) -> ()
        "affine.yield"() : () -> ()
      }, {
      }) : (index) -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1) -> (d0, d1)>
#map1 = affine_map<() -> (0)>
#map2 = affine_map<() -> (100)>
#set = affine_set<(d0, d1) : (d0 - 75 >= 0, d1 - 50 >= 0)>
#set1 = affine_set<(d0) : (d0 - 50 >= 0)>
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "test_interleaved_affine_for_if"}> ({
    %0 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<100x100xf32>
    %1 = "arith.constant"() <{value = 7.000000e+00 : f32}> : () -> f32
    "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map2}> ({
    ^bb0(%arg0: index):
      "affine.if"(%arg0) <{condition = #set1}> ({
        "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map2}> ({
        ^bb0(%arg1: index):
          %2 = "affine.load"(%0, %arg0, %arg1) <{map = #map}> : (memref<100x100xf32>, index, index) -> f32
          "affine.if"(%arg0, %arg1) <{condition = #set}> ({
            "affine.store"(%1, %0, %arg0, %arg1) <{map = #map}> : (f32, memref<100x100xf32>, index, index) -> ()
            "affine.yield"() : () -> ()
          }, {
          }) : (index, index) -> ()
          "affine.yield"() : () -> ()
        }) : () -> ()
        "affine.yield"() : () -> ()
      }, {
      }) : (index) -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0) -> (d0)>
#map1 = affine_map<() -> (0)>
#map2 = affine_map<() -> (101)>
#set = affine_set<(d0)[s0] : (d0 - s0 floordiv 2 >= 0)>
#set1 = affine_set<(d0) : (-d0 + 51 >= 0)>
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "test_interleaved_affine_for_if"}> ({
    %0 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<101xf32>
    %1 = "arith.constant"() <{value = 0 : index}> : () -> index
    %2 = "memref.dim"(%0, %1) : (memref<101xf32>, index) -> index
    %3 = "arith.constant"() <{value = 7.000000e+00 : f32}> : () -> f32
    "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map2}> ({
    ^bb0(%arg0: index):
      "affine.if"(%arg0, %2) <{condition = #set}> ({
        %4 = "affine.load"(%0, %arg0) <{map = #map}> : (memref<101xf32>, index) -> f32
        "affine.yield"() : () -> ()
      }, {
      }) : (index, index) -> ()
      "affine.if"(%arg0) <{condition = #set1}> ({
        "affine.store"(%3, %0, %arg0) <{map = #map}> : (f32, memref<101xf32>, index) -> ()
        "affine.yield"() : () -> ()
      }, {
      }) : (index) -> ()
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
  "func.func"() <{function_type = () -> (), sym_name = "dependent_parallel"}> ({
    %0 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<10xf32>
    %1 = "arith.constant"() <{value = 7.000000e+00 : f32}> : () -> f32
    "affine.parallel"() <{lowerBoundsGroups = dense<1> : tensor<1xi32>, lowerBoundsMap = #map1, reductions = [], steps = [1], upperBoundsGroups = dense<1> : tensor<1xi32>, upperBoundsMap = #map2}> ({
    ^bb0(%arg1: index):
      "affine.store"(%1, %0, %arg1) <{map = #map}> : (f32, memref<10xf32>, index) -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    "affine.parallel"() <{lowerBoundsGroups = dense<1> : tensor<1xi32>, lowerBoundsMap = #map1, reductions = [], steps = [1], upperBoundsGroups = dense<1> : tensor<1xi32>, upperBoundsMap = #map2}> ({
    ^bb0(%arg0: index):
      %2 = "affine.load"(%0, %arg0) <{map = #map}> : (memref<10xf32>, index) -> f32
      "affine.yield"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0) -> (d0)>
#set = affine_set<(d0, d1, d2, d3) : ((d0 + 1) mod 8 >= 0, d0 * -8 >= 0)>
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "affine_if_no_dependence"}> ({
    %0 = "arith.constant"() <{value = 1 : index}> : () -> index
    %1 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<15xi1>
    %2 = "arith.constant"() <{value = true}> : () -> i1
    "affine.store"(%2, %1, %0) <{map = #map}> : (i1, memref<15xi1>, index) -> ()
    "affine.if"(%0, %0, %0, %0) <{condition = #set}> ({
      %3 = "affine.load"(%1, %0) <{map = #map}> : (memref<15xi1>, index) -> i1
      "affine.yield"() : () -> ()
    }, {
    }) : (index, index, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1) -> (d0, d1, 129)>
#map1 = affine_map<() -> (0, 0)>
#map2 = affine_map<() -> (1, 130)>
#map3 = affine_map<(d0, d1, d2) -> (0, d0 + d1, d2)>
#map4 = affine_map<() -> (0)>
#map5 = affine_map<() -> (130)>
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "affine_parallel_dep_check_1"}> ({
    %0 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<1x130xf32>
    %1 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<1x130x130xf32>
    %2 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    "affine.parallel"() <{lowerBoundsGroups = dense<1> : tensor<2xi32>, lowerBoundsMap = #map1, reductions = [], steps = [1, 1], upperBoundsGroups = dense<1> : tensor<2xi32>, upperBoundsMap = #map2}> ({
    ^bb0(%arg3: index, %arg4: index):
      "affine.store"(%2, %1, %arg3, %arg4) <{map = #map}> : (f32, memref<1x130x130xf32>, index, index) -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    %3 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<1x128x128xf32>
    "affine.parallel"() <{lowerBoundsGroups = dense<1> : tensor<1xi32>, lowerBoundsMap = #map4, reductions = [], steps = [1], upperBoundsGroups = dense<1> : tensor<1xi32>, upperBoundsMap = #map5}> ({
    ^bb0(%arg0: index):
      "affine.parallel"() <{lowerBoundsGroups = dense<1> : tensor<2xi32>, lowerBoundsMap = #map1, reductions = [], steps = [1, 1], upperBoundsGroups = dense<1> : tensor<2xi32>, upperBoundsMap = #map2}> ({
      ^bb0(%arg1: index, %arg2: index):
        %4 = "affine.load"(%1, %arg0, %arg1, %arg2) <{map = #map3}> : (memref<1x130x130xf32>, index, index, index) -> f32
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
#map2 = affine_map<() -> (127)>
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "affine_parallel_dep_check_2"}> ({
    %0 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<128xf32>
    %1 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    "affine.parallel"() <{lowerBoundsGroups = dense<1> : tensor<1xi32>, lowerBoundsMap = #map1, reductions = [], steps = [1], upperBoundsGroups = dense<1> : tensor<1xi32>, upperBoundsMap = #map2}> ({
    ^bb0(%arg0: index):
      "affine.store"(%1, %0, %arg0) <{map = #map}> : (f32, memref<128xf32>, index) -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    %2 = "affine.load"(%0) <{map = #map2}> : (memref<128xf32>) -> f32
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

