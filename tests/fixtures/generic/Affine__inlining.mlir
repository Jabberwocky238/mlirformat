#map = affine_map<(d0, d1)[s0] -> (d0 + d1 + s0)>
#map1 = affine_map<() -> (1)>
#map2 = affine_map<() -> (10)>
#set = affine_set<(d0)[s0] : (d0 - 2 >= 0, -d0 + 4 >= 0)>
"builtin.module"() ({
  "func.func"() <{function_type = (index) -> (), sym_name = "func_with_affine_ops"}> ({
  ^bb0(%arg1: index):
    %2 = "arith.constant"() <{value = 200 : index}> : () -> index
    "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map2}> ({
    ^bb0(%arg2: index):
      "affine.if"(%arg2, %2) <{condition = #set}> ({
        %3 = "affine.apply"(%arg2, %arg2, %arg1) <{map = #map}> : (index, index, index) -> index
        "affine.yield"() : () -> ()
      }, {
      }) : (index, index) -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "inline_with_affine_ops"}> ({
    %1 = "arith.constant"() <{value = 1 : index}> : () -> index
    "func.call"(%1) <{callee = @func_with_affine_ops}> : (index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "not_inline_in_affine_op"}> ({
    %0 = "arith.constant"() <{value = 1 : index}> : () -> index
    "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map2}> ({
    ^bb0(%arg0: index):
      "func.call"(%0) <{callee = @func_with_affine_ops}> : (index) -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<() -> (1)>
#map1 = affine_map<() -> (10)>
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "func_with_invalid_nested_op"}> ({
    "affine.for"() <{lowerBoundMap = #map, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map1}> ({
    ^bb0(%arg0: index):
      "foo.opaque"() : () -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "not_inline_invalid_nest_op"}> ({
    "func.call"() <{callee = @func_with_invalid_nested_op}> : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<() -> (1)>
#map1 = affine_map<() -> (10)>
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "func_noop"}> ({
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "inline_into_affine_ops"}> ({
    "affine.for"() <{lowerBoundMap = #map, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map1}> ({
    ^bb0(%arg0: index):
      "func.call"() <{callee = @func_noop}> : () -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0) -> (d0)>
#map1 = affine_map<() -> (1)>
#map2 = affine_map<() -> (42)>
"builtin.module"() ({
  "func.func"() <{function_type = (index, memref<?xf32>) -> (), sym_name = "func_dim"}> ({
  ^bb0(%arg2: index, %arg3: memref<?xf32>):
    %0 = "affine.load"(%arg3, %arg2) <{map = #map}> : (memref<?xf32>, index) -> f32
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<?xf32>) -> (), sym_name = "inline_dimension"}> ({
  ^bb0(%arg0: memref<?xf32>):
    "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map2}> ({
    ^bb0(%arg1: index):
      "func.call"(%arg1, %arg0) <{callee = @func_dim}> : (index, memref<?xf32>) -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0) -> (d0)>
#map1 = affine_map<() -> (1)>
#map2 = affine_map<() -> (42)>
"builtin.module"() ({
  "func.func"() <{function_type = (index, memref<32xf32>) -> (), sym_name = "func_vector_dim"}> ({
  ^bb0(%arg2: index, %arg3: memref<32xf32>):
    %0 = "affine.vector_load"(%arg3, %arg2) <{map = #map}> : (memref<32xf32>, index) -> vector<4xf32>
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<32xf32>) -> (), sym_name = "inline_dimension_vector"}> ({
  ^bb0(%arg0: memref<32xf32>):
    "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map2}> ({
    ^bb0(%arg1: index):
      "func.call"(%arg1, %arg0) <{callee = @func_vector_dim}> : (index, memref<32xf32>) -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0) -> (d0)>
#map1 = affine_map<() -> (1)>
#map2 = affine_map<() -> (42)>
"builtin.module"() ({
  "func.func"() <{function_type = () -> index, sym_name = "get_index", sym_visibility = "private"}> ({
  }) : () -> ()
  "func.func"() <{function_type = (memref<?xf32>) -> (), sym_name = "func_top_level"}> ({
  ^bb0(%arg2: memref<?xf32>):
    %0 = "func.call"() <{callee = @get_index}> : () -> index
    %1 = "affine.load"(%arg2, %0) <{map = #map}> : (memref<?xf32>, index) -> f32
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<?xf32>) -> (), sym_name = "no_inline_not_top_level"}> ({
  ^bb0(%arg0: memref<?xf32>):
    "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map2}> ({
    ^bb0(%arg1: index):
      "func.call"(%arg0) <{callee = @func_top_level}> : (memref<?xf32>) -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

