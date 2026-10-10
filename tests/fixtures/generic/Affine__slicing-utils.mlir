"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "slicing_test"}> ({
    %0 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<1xi32>
    %1 = "slicing-test-op"() : () -> i1
    %2 = "slicing-test-op"() : () -> i2
    %3 = "slicing-test-op"() : () -> i3
    %4 = "slicing-test-op"() : () -> i4
    %5 = "slicing-test-op"(%1, %2) : (i1, i2) -> i5
    %6 = "slicing-test-op"(%3, %4) : (i3, i4) -> i6
    %7 = "slicing-test-op"(%1, %5) : (i1, i5) -> i7
    %8 = "slicing-test-op"(%5, %6) : (i5, i6) -> i8
    %9 = "slicing-test-op"(%7, %8) : (i7, i8) -> i9
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0) -> (d0)>
#map1 = affine_map<() -> (10)>
#map2 = affine_map<()[s0] -> (s0)>
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "slicing_test_2"}> ({
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = 2 : index}> : () -> index
    %2 = "arith.constant"() <{value = 16 : index}> : () -> index
    "affine.for"(%0, %2) <{lowerBoundMap = #map2, operandSegmentSizes = array<i32: 1, 1, 0>, step = 1 : index, upperBoundMap = #map2}> ({
    ^bb0(%arg0: index):
      "affine.for"(%arg0) <{lowerBoundMap = #map, operandSegmentSizes = array<i32: 1, 0, 0>, step = 1 : index, upperBoundMap = #map1}> ({
      ^bb0(%arg1: index):
        %3 = "slicing-test-op"(%arg1) : (index) -> index
        %4 = "slicing-test-op"(%arg0) : (index) -> index
        "affine.yield"() : () -> ()
      }) : (index) -> ()
      "affine.yield"() : () -> ()
    }) : (index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "slicing_test_3"}> ({
    %0 = "arith.constant"() <{value = 1.000000e+00 : f32}> : () -> f32
    %1 = "slicing-test-op"(%0) : (f32) -> index
    "scf.for"(%1, %1, %1) ({
    ^bb0(%arg0: index):
      %2 = "slicing-test-op"(%1, %arg0) : (index, index) -> index
      "scf.yield"() : () -> ()
    }) : (index, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (index) -> index, sym_name = "slicing_test_function_argument"}> ({
  ^bb0(%arg0: index):
    %0 = "slicing-test-op"(%arg0, %arg0) : (index, index) -> index
    "func.return"(%0) : (index) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (index) -> (index, index), sym_name = "slicing_test_multiple_return"}> ({
  ^bb0(%arg0: index):
    %0:2 = "slicing-test-op"(%arg0, %arg0) : (index, index) -> (index, index)
    "func.return"(%0#0, %0#1) : (index, index) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "graph_region_with_cycle"}> ({
    "test.isolated_graph_region"() ({
      %0 = "slicing-test-op"(%1) : (i1) -> i1
      %1 = "slicing-test-op"(%0) : (i1) -> i1
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

