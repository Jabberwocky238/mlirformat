"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "test_basic"}> ({
    %0 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<i32>
    %1 = "memref.load"(%0) : (memref<i32>) -> i32
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "test_repeat_namelocs"}> ({
    %0 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<i32>
    %1 = "memref.load"(%0) : (memref<i32>) -> i32
    %2 = "memref.load"(%0) : (memref<i32>) -> i32
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<i32>) -> (), sym_name = "test_bb_args1"}> ({
  ^bb0(%arg0: memref<i32>):
    %0 = "memref.load"(%arg0) : (memref<i32>) -> i32
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> (index, index), sym_name = "make_two_results", sym_visibility = "private"}> ({
  }) : () -> ()
  "func.func"() <{function_type = (i1) -> (), sym_name = "test_multiple_results"}> ({
  ^bb0(%arg0: i1):
    %0:2 = "func.call"() <{callee = @make_two_results}> : () -> (index, index)
    %1:2 = "func.call"() <{callee = @make_two_results}> : () -> (index, index)
    %2:2 = "scf.while"(%1#0, %1#0) ({
    ^bb0(%arg3: index, %arg4: index):
      %4 = "arith.cmpi"(%arg3, %arg4) <{predicate = 2 : i64}> : (index, index) -> i1
      "scf.condition"(%4, %arg3, %arg4) : (i1, index, index) -> ()
    }, {
    ^bb0(%arg1: index, %arg2: index):
      %3:2 = "func.call"() <{callee = @make_two_results}> : () -> (index, index)
      "scf.yield"(%3#1, %3#1) : (index, index) -> ()
    }) : (index, index) -> (index, index)
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0) -> (d0)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?xf32>, tensor<?xf32>) -> (), sym_name = "test_op_asm_interface"}> ({
  ^bb0(%arg0: tensor<?xf32>, %arg1: tensor<?xf32>):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = 1 : index}> : () -> index
    %2:2 = "linalg.generic"(%arg0, %arg0, %arg1) <{indexing_maps = [#map, #map, #map], iterator_types = [#linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 1, 2>}> ({
    ^bb0(%arg5: f32, %arg6: f32, %arg7: f32):
      "linalg.yield"(%arg5, %arg5) : (f32, f32) -> ()
    }) : (tensor<?xf32>, tensor<?xf32>, tensor<?xf32>) -> (tensor<?xf32>, tensor<?xf32>)
    %3:2 = "linalg.generic"(%arg0, %arg0, %arg1) <{indexing_maps = [#map, #map, #map], iterator_types = [#linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 1, 2>}> ({
    ^bb0(%arg2: f32, %arg3: f32, %arg4: f32):
      "linalg.yield"(%arg3, %arg4) : (f32, f32) -> ()
    }) : (tensor<?xf32>, tensor<?xf32>, tensor<?xf32>) -> (tensor<?xf32>, tensor<?xf32>)
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<4xf32>, memref<4xf32>) -> (), sym_name = "test_pass"}> ({
  ^bb0(%arg0: memref<4xf32>, %arg1: memref<4xf32>):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = 1 : index}> : () -> index
    %2 = "arith.constant"() <{value = 4 : index}> : () -> index
    "scf.for"(%0, %2, %1) ({
    ^bb0(%arg2: index):
      %3 = "memref.load"(%arg0, %arg2) : (memref<4xf32>, index) -> f32
      "memref.store"(%3, %arg1, %arg2) : (f32, memref<4xf32>, index) -> ()
      "scf.yield"() : () -> ()
    }) : (index, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

