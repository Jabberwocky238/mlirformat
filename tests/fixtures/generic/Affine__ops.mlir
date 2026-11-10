#map = affine_map<() -> (0)>
#map1 = affine_map<() -> (10)>
#set = affine_set<() : (0 == 0)>
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "empty"}> ({
    "affine.for"() <{lowerBoundMap = #map, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map1}> ({
    ^bb0(%arg0: index):
      "affine.yield"() : () -> ()
    }) {some_attr = true} : () -> ()
    "affine.if"() <{condition = #set}> ({
      "affine.yield"() : () -> ()
    }, {
    }) {some_attr = true} : () -> ()
    "affine.if"() <{condition = #set}> ({
      "affine.yield"() : () -> ()
    }, {
      "foo"() : () -> ()
      "affine.yield"() : () -> ()
    }) {some_attr = true} : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<() -> (0)>
#map1 = affine_map<() -> (10)>
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "affine.yield"}> ({
    "affine.for"() <{lowerBoundMap = #map, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map1}> ({
    ^bb0(%arg0: index):
      "affine.yield"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0)[s0] -> (1000, d0 + 512, s0)>
#map1 = affine_map<(d0, d1)[s0] -> (d0 - d1, s0 + 512)>
#map2 = affine_map<()[s0, s1] -> (s0 - s1, 11)>
#map3 = affine_map<() -> (77, 78, 79)>
"builtin.module"() ({
  "func.func"() <{function_type = (index, index, index) -> (), sym_name = "affine_min"}> ({
  ^bb0(%arg3: index, %arg4: index, %arg5: index):
    %4 = "affine.min"(%arg3, %arg4) <{map = #map}> : (index, index) -> index
    %5 = "affine.min"(%arg3, %arg4, %arg5) <{map = #map1}> : (index, index, index) -> index
    %6 = "affine.min"(%arg4, %arg5) <{map = #map2}> : (index, index) -> index
    %7 = "affine.min"() <{map = #map3}> : () -> index
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (index, index, index) -> (), sym_name = "affine_max"}> ({
  ^bb0(%arg0: index, %arg1: index, %arg2: index):
    %0 = "affine.max"(%arg0, %arg1) <{map = #map}> : (index, index) -> index
    %1 = "affine.max"(%arg0, %arg1, %arg2) <{map = #map1}> : (index, index, index) -> index
    %2 = "affine.max"(%arg1, %arg2) <{map = #map2}> : (index, index) -> index
    %3 = "affine.max"() <{map = #map3}> : () -> index
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<() -> (0)>
#map1 = affine_map<()[s0] -> (s0)>
"builtin.module"() ({
  "func.func"() <{function_type = (index, index, index) -> (), sym_name = "valid_symbols"}> ({
  ^bb0(%arg0: index, %arg1: index, %arg2: index):
    %0 = "arith.constant"() <{value = 1 : index}> : () -> index
    %1 = "arith.constant"() <{value = 0 : index}> : () -> index
    %2 = "memref.alloc"(%arg0, %arg1) <{operandSegmentSizes = array<i32: 2, 0>}> : (index, index) -> memref<?x?xf32>
    "affine.for"(%arg2) <{lowerBoundMap = #map, operandSegmentSizes = array<i32: 0, 1, 0>, step = 768 : index, upperBoundMap = #map1}> ({
    ^bb0(%arg3: index):
      %3 = "memref.dim"(%2, %0) : (memref<?x?xf32>, index) -> index
      "affine.for"(%3) <{lowerBoundMap = #map, operandSegmentSizes = array<i32: 0, 1, 0>, step = 264 : index, upperBoundMap = #map1}> ({
      ^bb0(%arg4: index):
        %4 = "memref.dim"(%2, %1) : (memref<?x?xf32>, index) -> index
        %5 = "memref.subview"(%2, %1, %1, %4, %arg4, %0, %0) <{operandSegmentSizes = array<i32: 1, 2, 2, 2>, static_offsets = array<i64: -9223372036854775808, -9223372036854775808>, static_sizes = array<i64: -9223372036854775808, -9223372036854775808>, static_strides = array<i64: -9223372036854775808, -9223372036854775808>}> : (memref<?x?xf32>, index, index, index, index, index, index) -> memref<?x?xf32, strided<[?, ?], offset: ?>>
        %6 = "memref.dim"(%5, %1) : (memref<?x?xf32, strided<[?, ?], offset: ?>>, index) -> index
        "affine.for"(%6) <{lowerBoundMap = #map, operandSegmentSizes = array<i32: 0, 1, 0>, step = 768 : index, upperBoundMap = #map1}> ({
        ^bb0(%arg5: index):
          "foo"() : () -> ()
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
#map = affine_map<(d0) -> (d0 - 1)>
#map1 = affine_map<()[s0] -> (s0)>
"builtin.module"() ({
  "func.func"() <{function_type = (index, memref<?xf32>) -> (), sym_name = "valid_symbol_affine_scope"}> ({
  ^bb0(%arg0: index, %arg1: memref<?xf32>):
    "test.affine_scope"() ({
      %0 = "arith.constant"() <{value = 1 : index}> : () -> index
      %1 = "arith.subi"(%arg0, %0) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
      "affine.for"(%1, %arg0) <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 1, 1, 0>, step = 1 : index, upperBoundMap = #map1}> ({
      ^bb0(%arg2: index):
        %2 = "arith.subi"(%1, %arg2) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
        "test.affine_scope"() ({
          "affine.for"(%2, %arg0) <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 1, 1, 0>, step = 1 : index, upperBoundMap = #map1}> ({
          ^bb0(%arg3: index):
            %3 = "affine.load"(%arg1, %arg0) <{map = #map}> : (memref<?xf32>, index) -> f32
            "affine.store"(%3, %arg1, %arg0) <{map = #map}> : (f32, memref<?xf32>, index) -> ()
            "affine.yield"() : () -> ()
          }) : (index, index) -> ()
          "terminate"() : () -> ()
        }) : () -> ()
        "affine.yield"() : () -> ()
      }) : (index, index) -> ()
      "terminate"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0) -> (d0)>
"builtin.module"() ({
  %0 = "test.foo"() : () -> index
  "test.func"() ({
  ^bb0(%arg0: memref<?xf32>):
    %1 = "affine.load"(%arg0, %0) <{map = #map}> : (memref<?xf32>, index) -> f32
    "terminate"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2) -> (d0 * 2, d1 + d2)>
#map1 = affine_map<(d0, d1) -> (d0, d1)>
#map2 = affine_map<(d0, d1) -> (d0 + 10, d1 + 10)>
#map3 = affine_map<() -> (0, 0)>
#map4 = affine_map<()[s0] -> (s0, 100)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<100x100xf32>, index) -> (), sym_name = "parallel"}> ({
  ^bb0(%arg0: memref<100x100xf32>, %arg1: index):
    "affine.parallel"(%arg1) <{lowerBoundsGroups = dense<1> : tensor<2xi32>, lowerBoundsMap = #map3, reductions = [], steps = [10, 10], upperBoundsGroups = dense<1> : tensor<2xi32>, upperBoundsMap = #map4}> ({
    ^bb0(%arg2: index, %arg3: index):
      %0:2 = "affine.parallel"(%arg2, %arg3, %arg2, %arg3) <{lowerBoundsGroups = dense<1> : tensor<2xi32>, lowerBoundsMap = #map1, reductions = [8, 4], steps = [1, 1], upperBoundsGroups = dense<1> : tensor<2xi32>, upperBoundsMap = #map2}> ({
      ^bb0(%arg4: index, %arg5: index):
        %1 = "affine.load"(%arg0, %arg2, %arg3, %arg5) <{map = #map}> : (memref<100x100xf32>, index, index, index) -> f32
        "affine.yield"(%1, %1) : (f32, f32) -> ()
      }) : (index, index, index, index) -> (f32, f32)
      "affine.yield"() : () -> ()
    }) : (index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2) -> (d0, d1, d1, d0, d2)>
#map1 = affine_map<(d0, d1, d2) -> (d0, d0, d1, d2)>
"builtin.module"() ({
  "func.func"() <{function_type = (index, index, index, index) -> (), sym_name = "parallel_min_max"}> ({
  ^bb0(%arg0: index, %arg1: index, %arg2: index, %arg3: index):
    "affine.parallel"(%arg0, %arg1, %arg2, %arg2, %arg3, %arg1) <{lowerBoundsGroups = dense<[2, 1, 2]> : tensor<3xi32>, lowerBoundsMap = #map, reductions = [], steps = [1, 1, 1], upperBoundsGroups = dense<[1, 2, 1]> : tensor<3xi32>, upperBoundsMap = #map1}> ({
    ^bb0(%arg4: index, %arg5: index, %arg6: index):
      "affine.yield"() : () -> ()
    }) : (index, index, index, index, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<() -> ()>
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "parallel_no_ivs"}> ({
    "affine.parallel"() <{lowerBoundsGroups = dense<> : tensor<0xi32>, lowerBoundsMap = #map, reductions = [], steps = [], upperBoundsGroups = dense<> : tensor<0xi32>, upperBoundsMap = #map}> ({
      "affine.yield"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#set = affine_set<() : (0 == 0)>
"builtin.module"() ({
  "func.func"() <{function_type = () -> f32, sym_name = "affine_if"}> ({
    %0 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %1 = "affine.if"() <{condition = #set}> ({
      "affine.yield"(%0) : (f32) -> ()
    }, {
      "affine.yield"(%0) : (f32) -> ()
    }) : () -> f32
    "func.return"(%1) : (f32) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0) -> (d0)>
#map1 = affine_map<() -> (0)>
#map2 = affine_map<() -> (10)>
#set = affine_set<(d0) : (d0 - 10 >= 0)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<1024xf32>) -> f32, sym_name = "yield_loop"}> ({
  ^bb0(%arg4: memref<1024xf32>):
    %5 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %6 = "affine.for"(%5) <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 1>, step = 2 : index, upperBoundMap = #map2}> ({
    ^bb0(%arg5: index, %arg6: f32):
      %7 = "affine.load"(%arg4, %arg5) <{map = #map}> : (memref<1024xf32>, index) -> f32
      %8 = "affine.if"(%arg5) <{condition = #set}> ({
        %9 = "arith.addf"(%arg6, %7) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
        "affine.yield"(%9) : (f32) -> ()
      }, {
        "affine.yield"(%arg6) : (f32) -> ()
      }) : (index) -> f32
      "affine.yield"(%8) : (f32) -> ()
    }) : (f32) -> f32
    "func.return"(%6) : (f32) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<1024xf32>) -> (f32, f32), sym_name = "affine_for_multiple_yield"}> ({
  ^bb0(%arg0: memref<1024xf32>):
    %0 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %1:2 = "affine.for"(%0, %0) <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 2>, step = 2 : index, upperBoundMap = #map2}> ({
    ^bb0(%arg1: index, %arg2: f32, %arg3: f32):
      %2 = "affine.load"(%arg0, %arg1) <{map = #map}> : (memref<1024xf32>, index) -> f32
      %3 = "arith.addf"(%2, %arg2) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %4 = "arith.addf"(%2, %arg3) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "affine.yield"(%3, %4) : (f32, f32) -> ()
    }) : (f32, f32) -> (f32, f32)
    "func.return"(%1#0, %1#1) : (f32, f32) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (index, index, index) -> (index, index), sym_name = "delinearize"}> ({
  ^bb0(%arg2: index, %arg3: index, %arg4: index):
    %1:2 = "affine.delinearize_index"(%arg2, %arg3, %arg4) <{static_basis = array<i64: -9223372036854775808, -9223372036854775808>}> : (index, index, index) -> (index, index)
    "func.return"(%1#0, %1#1) : (index, index) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (index, index) -> (index, index, index), sym_name = "delinearize_mixed"}> ({
  ^bb0(%arg0: index, %arg1: index):
    %0:3 = "affine.delinearize_index"(%arg0, %arg1) <{static_basis = array<i64: 2, -9223372036854775808, 3>}> : (index, index) -> (index, index, index)
    "func.return"(%0#0, %0#1, %0#2) : (index, index, index) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (index, index, index, index) -> index, sym_name = "linearize"}> ({
  ^bb0(%arg16: index, %arg17: index, %arg18: index, %arg19: index):
    %7 = "affine.linearize_index"(%arg16, %arg17, %arg18, %arg19) <{disjoint = false, operandSegmentSizes = array<i32: 2, 2>, static_basis = array<i64: -9223372036854775808, -9223372036854775808>}> : (index, index, index, index) -> index
    "func.return"(%7) : (index) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (index, index, index, index) -> index, sym_name = "linearize_mixed"}> ({
  ^bb0(%arg12: index, %arg13: index, %arg14: index, %arg15: index):
    %6 = "affine.linearize_index"(%arg12, %arg13, %arg14, %arg15) <{disjoint, operandSegmentSizes = array<i32: 3, 1>, static_basis = array<i64: 2, -9223372036854775808, 3>}> : (index, index, index, index) -> index
    "func.return"(%6) : (index) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<16xindex>) -> (vector<16xindex>, vector<16xindex>), sym_name = "delinearize_vector"}> ({
  ^bb0(%arg11: vector<16xindex>):
    %5:2 = "affine.delinearize_index"(%arg11) <{static_basis = array<i64: 4, 8>}> : (vector<16xindex>) -> (vector<16xindex>, vector<16xindex>)
    "func.return"(%5#0, %5#1) : (vector<16xindex>, vector<16xindex>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<8xindex>) -> (vector<8xindex>, vector<8xindex>, vector<8xindex>), sym_name = "delinearize_vector_3d"}> ({
  ^bb0(%arg10: vector<8xindex>):
    %4:3 = "affine.delinearize_index"(%arg10) <{static_basis = array<i64: 2, 3, 4>}> : (vector<8xindex>) -> (vector<8xindex>, vector<8xindex>, vector<8xindex>)
    "func.return"(%4#0, %4#1, %4#2) : (vector<8xindex>, vector<8xindex>, vector<8xindex>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<4xindex>, index, index) -> (vector<4xindex>, vector<4xindex>), sym_name = "delinearize_vector_dynamic_basis"}> ({
  ^bb0(%arg7: vector<4xindex>, %arg8: index, %arg9: index):
    %3:2 = "affine.delinearize_index"(%arg7, %arg8, %arg9) <{static_basis = array<i64: -9223372036854775808, -9223372036854775808>}> : (vector<4xindex>, index, index) -> (vector<4xindex>, vector<4xindex>)
    "func.return"(%3#0, %3#1) : (vector<4xindex>, vector<4xindex>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<16xindex>, vector<16xindex>) -> vector<16xindex>, sym_name = "linearize_vector"}> ({
  ^bb0(%arg5: vector<16xindex>, %arg6: vector<16xindex>):
    %2 = "affine.linearize_index"(%arg5, %arg6) <{disjoint = false, operandSegmentSizes = array<i32: 2, 0>, static_basis = array<i64: 4, 8>}> : (vector<16xindex>, vector<16xindex>) -> vector<16xindex>
    "func.return"(%2) : (vector<16xindex>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<16xindex>, vector<16xindex>) -> vector<16xindex>, sym_name = "linearize_vector_disjoint"}> ({
  ^bb0(%arg3: vector<16xindex>, %arg4: vector<16xindex>):
    %1 = "affine.linearize_index"(%arg3, %arg4) <{disjoint, operandSegmentSizes = array<i32: 2, 0>, static_basis = array<i64: 4, 8>}> : (vector<16xindex>, vector<16xindex>) -> vector<16xindex>
    "func.return"(%1) : (vector<16xindex>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<8xindex>, vector<8xindex>, vector<8xindex>) -> vector<8xindex>, sym_name = "linearize_vector_3d"}> ({
  ^bb0(%arg0: vector<8xindex>, %arg1: vector<8xindex>, %arg2: vector<8xindex>):
    %0 = "affine.linearize_index"(%arg0, %arg1, %arg2) <{disjoint = false, operandSegmentSizes = array<i32: 3, 0>, static_basis = array<i64: 2, 3, 4>}> : (vector<8xindex>, vector<8xindex>, vector<8xindex>) -> vector<8xindex>
    "func.return"(%0) : (vector<8xindex>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<()[s0] -> (s0)>
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "gpu_launch_affine"}> ({
    %0 = "arith.constant"() <{value = 1 : index}> : () -> index
    "gpu.launch"(%0, %0, %0, %0, %0, %0) <{operandSegmentSizes = array<i32: 0, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0>}> ({
    ^bb0(%arg0: index, %arg1: index, %arg2: index, %arg3: index, %arg4: index, %arg5: index, %arg6: index, %arg7: index, %arg8: index, %arg9: index, %arg10: index, %arg11: index):
      %1 = "gpu.thread_id"() <{dimension = #gpu<dim x>}> : () -> index
      %2 = "arith.constant"() <{value = 128 : index}> : () -> index
      "affine.for"(%1, %2) <{lowerBoundMap = #map, operandSegmentSizes = array<i32: 1, 1, 0>, step = 8 : index, upperBoundMap = #map}> ({
      ^bb0(%arg12: index):
        "affine.yield"() : () -> ()
      }) : (index, index) -> ()
      "gpu.terminator"() : () -> ()
    }) : (index, index, index, index, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<()[s0] -> (s0 mod 32)>
#map1 = affine_map<()[s0] -> (s0)>
"builtin.module"() ({
  "gpu.module"() <{sym_name = "gpu"}> ({
    "gpu.func"() <{function_type = (memref<?x?xf32>) -> (), kernel}> ({
    ^bb0(%arg0: memref<?x?xf32>):
      %0 = "arith.constant"() <{value = 3 : index}> : () -> index
      %1 = "memref.dim"(%arg0, %0) : (memref<?x?xf32>, index) -> index
      %2 = "arith.constant"() <{value = 0 : index}> : () -> index
      "affine.for"(%2, %1) <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 1, 1, 0>, step = 32 : index, upperBoundMap = #map1}> ({
      ^bb0(%arg1: index):
        %3 = "gpu.thread_id"() <{dimension = #gpu<dim x>}> : () -> index
        %4 = "affine.apply"(%3) <{map = #map}> : (index) -> index
        %5 = "arith.constant"() <{value = 128 : index}> : () -> index
        "affine.for"(%4, %5) <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 1, 1, 0>, step = 8 : index, upperBoundMap = #map1}> ({
        ^bb0(%arg2: index):
          %6 = "arith.constant"() <{value = 32 : index}> : () -> index
          "affine.yield"() : () -> ()
        }) : (index, index) -> ()
        "affine.yield"() : () -> ()
      }) : (index, index) -> ()
      "gpu.return"() : () -> ()
    }) {sym_name = "affine_thread_id"} : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<() -> (0)>
#map1 = affine_map<(d0)[s0] -> (d0 + s0)>
#map2 = affine_map<() -> (7)>
"builtin.module"() ({
  "func.func"() <{function_type = (index) -> (), sym_name = "arith_add_vaild_symbol_upper_bound"}> ({
  ^bb0(%arg0: index):
    "affine.for"() <{lowerBoundMap = #map, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map2}> ({
    ^bb0(%arg1: index):
      %0 = "arith.addi"(%arg0, %arg0) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
      "affine.for"(%0, %arg0) <{lowerBoundMap = #map, operandSegmentSizes = array<i32: 0, 2, 0>, step = 1 : index, upperBoundMap = #map1}> ({
      ^bb0(%arg2: index):
        "affine.yield"() : () -> ()
      }) : (index, index) -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0)[s0] -> (d0 + s0)>
#map1 = affine_map<() -> (7)>
#map2 = affine_map<() -> (0)>
"builtin.module"() ({
  "func.func"() <{function_type = (index) -> (), sym_name = "arith_add_vaild_symbol_lower_bound"}> ({
  ^bb0(%arg0: index):
    "affine.for"() <{lowerBoundMap = #map2, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map1}> ({
    ^bb0(%arg1: index):
      %0 = "arith.addi"(%arg0, %arg0) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
      "affine.for"(%0, %arg0) <{lowerBoundMap = #map, operandSegmentSizes = array<i32: 2, 0, 0>, step = 1 : index, upperBoundMap = #map1}> ({
      ^bb0(%arg2: index):
        "affine.yield"() : () -> ()
      }) : (index, index) -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0) -> (d0)>
#map1 = affine_map<() -> (0)>
#map2 = affine_map<() -> (100)>
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "parallel_xori_reduce"}> ({
    %0 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<100xi32>
    %1 = "affine.parallel"() <{lowerBoundsGroups = dense<1> : tensor<1xi32>, lowerBoundsMap = #map1, reductions = [15], steps = [1], upperBoundsGroups = dense<1> : tensor<1xi32>, upperBoundsMap = #map2}> ({
    ^bb0(%arg0: index):
      %2 = "affine.load"(%0, %arg0) <{map = #map}> : (memref<100xi32>, index) -> i32
      "affine.yield"(%2) : (i32) -> ()
    }) : () -> i32
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0) -> (d0)>
#map1 = affine_map<() -> (0)>
#map2 = affine_map<() -> (100)>
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "parallel_maxnumf_reduce"}> ({
    %0 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<100xf32>
    %1 = "affine.parallel"() <{lowerBoundsGroups = dense<1> : tensor<1xi32>, lowerBoundsMap = #map1, reductions = [5], steps = [1], upperBoundsGroups = dense<1> : tensor<1xi32>, upperBoundsMap = #map2}> ({
    ^bb0(%arg0: index):
      %2 = "affine.load"(%0, %arg0) <{map = #map}> : (memref<100xf32>, index) -> f32
      "affine.yield"(%2) : (f32) -> ()
    }) : () -> f32
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0) -> (d0)>
#map1 = affine_map<() -> (0)>
#map2 = affine_map<() -> (100)>
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "parallel_minnumf_reduce"}> ({
    %0 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<100xf32>
    %1 = "affine.parallel"() <{lowerBoundsGroups = dense<1> : tensor<1xi32>, lowerBoundsMap = #map1, reductions = [9], steps = [1], upperBoundsGroups = dense<1> : tensor<1xi32>, upperBoundsMap = #map2}> ({
    ^bb0(%arg0: index):
      %2 = "affine.load"(%0, %arg0) <{map = #map}> : (memref<100xf32>, index) -> f32
      "affine.yield"(%2) : (f32) -> ()
    }) : () -> f32
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

