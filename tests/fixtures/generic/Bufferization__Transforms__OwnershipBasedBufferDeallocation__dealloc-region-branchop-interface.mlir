"builtin.module"() ({
  "func.func"() <{function_type = (i1, memref<2xf32>, memref<2xf32>) -> (), sym_name = "nested_regions_and_cond_branch"}> ({
  ^bb0(%arg0: i1, %arg1: memref<2xf32>, %arg2: memref<2xf32>):
    "cf.cond_br"(%arg0)[^bb1, ^bb2] <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (i1) -> ()
  ^bb1:  // pred: ^bb0
    "cf.br"(%arg1)[^bb3] : (memref<2xf32>) -> ()
  ^bb2:  // pred: ^bb0
    %0 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<2xf32>
    "test.region_buffer_based"(%arg1, %0) ({
    ^bb0(%arg3: f32, %arg4: f32):
      %2 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<2xf32>
      "test.buffer_based"(%arg1, %2) : (memref<2xf32>, memref<2xf32>) -> ()
      %3 = "math.exp"(%arg3) <{fastmath = #arith.fastmath<none>}> : (f32) -> f32
      "test.region_yield"(%3) : (f32) -> ()
    }) : (memref<2xf32>, memref<2xf32>) -> ()
    "cf.br"(%0)[^bb3] : (memref<2xf32>) -> ()
  ^bb3(%1: memref<2xf32>):  // 2 preds: ^bb1, ^bb2
    "test.copy"(%1, %arg2) : (memref<2xf32>, memref<2xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (index, index) -> memref<?x?xf32>, sym_name = "nested_region_control_flow"}> ({
  ^bb0(%arg0: index, %arg1: index):
    %0 = "arith.cmpi"(%arg0, %arg1) <{predicate = 0 : i64}> : (index, index) -> i1
    %1 = "memref.alloc"(%arg0, %arg0) <{operandSegmentSizes = array<i32: 2, 0>}> : (index, index) -> memref<?x?xf32>
    %2 = "scf.if"(%0) ({
      "scf.yield"(%1) : (memref<?x?xf32>) -> ()
    }, {
      %3 = "memref.alloc"(%arg0, %arg1) <{operandSegmentSizes = array<i32: 2, 0>}> : (index, index) -> memref<?x?xf32>
      "test.read_buffer"(%3) : (memref<?x?xf32>) -> ()
      "scf.yield"(%1) : (memref<?x?xf32>) -> ()
    }) : (i1) -> memref<?x?xf32>
    "func.return"(%2) : (memref<?x?xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (index, index) -> memref<?x?xf32>, sym_name = "nested_region_control_flow_div"}> ({
  ^bb0(%arg0: index, %arg1: index):
    %0 = "arith.cmpi"(%arg0, %arg1) <{predicate = 0 : i64}> : (index, index) -> i1
    %1 = "memref.alloc"(%arg0, %arg0) <{operandSegmentSizes = array<i32: 2, 0>}> : (index, index) -> memref<?x?xf32>
    %2 = "scf.if"(%0) ({
      "scf.yield"(%1) : (memref<?x?xf32>) -> ()
    }, {
      %3 = "memref.alloc"(%arg0, %arg1) <{operandSegmentSizes = array<i32: 2, 0>}> : (index, index) -> memref<?x?xf32>
      "scf.yield"(%3) : (memref<?x?xf32>) -> ()
    }) : (i1) -> memref<?x?xf32>
    "func.return"(%2) : (memref<?x?xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (index) -> memref<?x?xf32>, sym_name = "inner_region_control_flow"}> ({
  ^bb0(%arg0: index):
    %0 = "memref.alloc"(%arg0, %arg0) <{operandSegmentSizes = array<i32: 2, 0>}> : (index, index) -> memref<?x?xf32>
    %1 = "test.region_if"(%0) ({
    ^bb0(%arg3: memref<?x?xf32>):
      "test.region_if_yield"(%arg3) : (memref<?x?xf32>) -> ()
    }, {
    ^bb0(%arg2: memref<?x?xf32>):
      "test.region_if_yield"(%arg2) : (memref<?x?xf32>) -> ()
    }, {
    ^bb0(%arg1: memref<?x?xf32>):
      "test.region_if_yield"(%arg1) : (memref<?x?xf32>) -> ()
    }) : (memref<?x?xf32>) -> memref<?x?xf32>
    "func.return"(%1) : (memref<?x?xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (i1, memref<2xf32>, memref<2xf32>) -> (), sym_name = "nestedRegionsAndCondBranchAlloca"}> ({
  ^bb0(%arg0: i1, %arg1: memref<2xf32>, %arg2: memref<2xf32>):
    "cf.cond_br"(%arg0)[^bb1, ^bb2] <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (i1) -> ()
  ^bb1:  // pred: ^bb0
    "cf.br"(%arg1)[^bb3] : (memref<2xf32>) -> ()
  ^bb2:  // pred: ^bb0
    %0 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<2xf32>
    "test.region_buffer_based"(%arg1, %0) ({
    ^bb0(%arg3: f32, %arg4: f32):
      %2 = "memref.alloca"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<2xf32>
      "test.buffer_based"(%arg1, %2) : (memref<2xf32>, memref<2xf32>) -> ()
      %3 = "math.exp"(%arg3) <{fastmath = #arith.fastmath<none>}> : (f32) -> f32
      "test.region_yield"(%3) : (f32) -> ()
    }) : (memref<2xf32>, memref<2xf32>) -> ()
    "cf.br"(%0)[^bb3] : (memref<2xf32>) -> ()
  ^bb3(%1: memref<2xf32>):  // 2 preds: ^bb1, ^bb2
    "test.copy"(%1, %arg2) : (memref<2xf32>, memref<2xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (index, index, f32) -> memref<?x?xf32>, sym_name = "nestedRegionControlFlowAlloca"}> ({
  ^bb0(%arg0: index, %arg1: index, %arg2: f32):
    %0 = "arith.cmpi"(%arg0, %arg1) <{predicate = 0 : i64}> : (index, index) -> i1
    %1 = "memref.alloc"(%arg0, %arg0) <{operandSegmentSizes = array<i32: 2, 0>}> : (index, index) -> memref<?x?xf32>
    %2 = "scf.if"(%0) ({
      "scf.yield"(%1) : (memref<?x?xf32>) -> ()
    }, {
      %3 = "memref.alloca"(%arg0, %arg1) <{operandSegmentSizes = array<i32: 2, 0>}> : (index, index) -> memref<?x?xf32>
      %4 = "arith.constant"() <{value = 0 : index}> : () -> index
      "memref.store"(%arg2, %3, %4, %4) : (f32, memref<?x?xf32>, index, index) -> ()
      "scf.yield"(%1) : (memref<?x?xf32>) -> ()
    }) : (i1) -> memref<?x?xf32>
    "func.return"(%2) : (memref<?x?xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (index, index, index, memref<2xf32>, memref<2xf32>) -> (), sym_name = "loop_alloc"}> ({
  ^bb0(%arg0: index, %arg1: index, %arg2: index, %arg3: memref<2xf32>, %arg4: memref<2xf32>):
    %0 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<2xf32>
    "test.read_buffer"(%0) : (memref<2xf32>) -> ()
    %1 = "scf.for"(%arg0, %arg1, %arg2, %arg3) ({
    ^bb0(%arg5: index, %arg6: memref<2xf32>):
      %2 = "arith.cmpi"(%arg5, %arg1) <{predicate = 0 : i64}> : (index, index) -> i1
      %3 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<2xf32>
      "scf.yield"(%3) : (memref<2xf32>) -> ()
    }) : (index, index, index, memref<2xf32>) -> memref<2xf32>
    "test.copy"(%1, %arg4) : (memref<2xf32>, memref<2xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (index, index, index, memref<2xf32>, memref<2xf32>) -> (), sym_name = "loop_nested_if_no_alloc"}> ({
  ^bb0(%arg0: index, %arg1: index, %arg2: index, %arg3: memref<2xf32>, %arg4: memref<2xf32>):
    %0 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<2xf32>
    %1 = "scf.for"(%arg0, %arg1, %arg2, %arg3) ({
    ^bb0(%arg5: index, %arg6: memref<2xf32>):
      %2 = "arith.cmpi"(%arg5, %arg1) <{predicate = 0 : i64}> : (index, index) -> i1
      %3 = "scf.if"(%2) ({
        "scf.yield"(%0) : (memref<2xf32>) -> ()
      }, {
        "scf.yield"(%arg6) : (memref<2xf32>) -> ()
      }) : (i1) -> memref<2xf32>
      "scf.yield"(%3) : (memref<2xf32>) -> ()
    }) : (index, index, index, memref<2xf32>) -> memref<2xf32>
    "test.copy"(%1, %arg4) : (memref<2xf32>, memref<2xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (index, index, index, memref<2xf32>) -> memref<2xf32>, sym_name = "loop_nested_if_alloc"}> ({
  ^bb0(%arg0: index, %arg1: index, %arg2: index, %arg3: memref<2xf32>):
    %0 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<2xf32>
    %1 = "scf.for"(%arg0, %arg1, %arg2, %arg3) ({
    ^bb0(%arg4: index, %arg5: memref<2xf32>):
      %2 = "arith.cmpi"(%arg4, %arg1) <{predicate = 0 : i64}> : (index, index) -> i1
      %3 = "scf.if"(%2) ({
        %4 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<2xf32>
        "scf.yield"(%4) : (memref<2xf32>) -> ()
      }, {
        "scf.yield"(%0) : (memref<2xf32>) -> ()
      }) : (i1) -> memref<2xf32>
      "scf.yield"(%3) : (memref<2xf32>) -> ()
    }) : (index, index, index, memref<2xf32>) -> memref<2xf32>
    "func.return"(%1) : (memref<2xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (index, index, index, memref<2xf32>, memref<2xf32>) -> (), sym_name = "loop_nested_alloc"}> ({
  ^bb0(%arg0: index, %arg1: index, %arg2: index, %arg3: memref<2xf32>, %arg4: memref<2xf32>):
    %0 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<2xf32>
    "test.read_buffer"(%0) : (memref<2xf32>) -> ()
    %1 = "scf.for"(%arg0, %arg1, %arg2, %arg3) ({
    ^bb0(%arg5: index, %arg6: memref<2xf32>):
      %2 = "scf.for"(%arg0, %arg1, %arg2, %arg6) ({
      ^bb0(%arg7: index, %arg8: memref<2xf32>):
        %3 = "scf.for"(%arg0, %arg1, %arg2, %arg8) ({
        ^bb0(%arg9: index, %arg10: memref<2xf32>):
          %4 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<2xf32>
          "test.read_buffer"(%4) : (memref<2xf32>) -> ()
          %5 = "arith.cmpi"(%arg5, %arg1) <{predicate = 0 : i64}> : (index, index) -> i1
          %6 = "scf.if"(%5) ({
            %7 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<2xf32>
            "scf.yield"(%7) : (memref<2xf32>) -> ()
          }, {
            "scf.yield"(%arg10) : (memref<2xf32>) -> ()
          }) : (i1) -> memref<2xf32>
          "scf.yield"(%6) : (memref<2xf32>) -> ()
        }) : (index, index, index, memref<2xf32>) -> memref<2xf32>
        "scf.yield"(%3) : (memref<2xf32>) -> ()
      }) : (index, index, index, memref<2xf32>) -> memref<2xf32>
      "scf.yield"(%2) : (memref<2xf32>) -> ()
    }) : (index, index, index, memref<2xf32>) -> memref<2xf32>
    "test.copy"(%1, %arg4) : (memref<2xf32>, memref<2xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0) -> (d0)>
#map1 = affine_map<() -> (0)>
#map2 = affine_map<() -> (10)>
"builtin.module"() ({
  "func.func"() <{function_type = () -> f32, sym_name = "affine_loop"}> ({
    %0 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<1024xf32>
    %1 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %2 = "affine.for"(%1) <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 1>, step = 2 : index, upperBoundMap = #map2}> ({
    ^bb0(%arg0: index, %arg1: f32):
      %3 = "affine.load"(%0, %arg0) <{map = #map}> : (memref<1024xf32>, index) -> f32
      %4 = "arith.addf"(%arg1, %3) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "affine.yield"(%4) : (f32) -> ()
    }) : (f32) -> f32
    "func.return"(%2) : (f32) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (!shape.witness, memref<2xf32>, memref<2xf32>) -> (), sym_name = "assumingOp"}> ({
  ^bb0(%arg0: !shape.witness, %arg1: memref<2xf32>, %arg2: memref<2xf32>):
    %0 = "shape.assuming"(%arg0) ({
      %3 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<2xf32>
      "test.read_buffer"(%3) : (memref<2xf32>) -> ()
      "shape.assuming_yield"(%arg1) : (memref<2xf32>) -> ()
    }) : (!shape.witness) -> memref<2xf32>
    %1 = "shape.assuming"(%arg0) ({
      %2 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<2xf32>
      "shape.assuming_yield"(%2) : (memref<2xf32>) -> ()
    }) : (!shape.witness) -> memref<2xf32>
    "test.copy"(%1, %arg2) : (memref<2xf32>, memref<2xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "noRegionBranchOpInterface"}> ({
    %0 = "test.one_region_with_recursive_memory_effects"() ({
      %1 = "test.one_region_with_recursive_memory_effects"() ({
        %2 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<2xi32>
        "test.read_buffer"(%2) : (memref<2xi32>) -> ()
        "test.return"() : () -> ()
      }) : () -> i32
      "test.return"() : () -> ()
    }) : () -> i32
    "test.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (index) -> (), sym_name = "while_two_arg"}> ({
  ^bb0(%arg0: index):
    %0 = "memref.alloc"(%arg0) <{operandSegmentSizes = array<i32: 1, 0>}> : (index) -> memref<?xf32>
    %1:2 = "scf.while"(%0, %0) ({
    ^bb0(%arg3: memref<?xf32>, %arg4: memref<?xf32>):
      %3 = "test.side_effect_op"() {effects = [{effect = "read"}]} : () -> i1
      "scf.condition"(%3, %arg3, %arg4) : (i1, memref<?xf32>, memref<?xf32>) -> ()
    }, {
    ^bb0(%arg1: memref<?xf32>, %arg2: memref<?xf32>):
      %2 = "memref.alloc"(%arg0) <{operandSegmentSizes = array<i32: 1, 0>}> : (index) -> memref<?xf32>
      "scf.yield"(%arg1, %2) : (memref<?xf32>, memref<?xf32>) -> ()
    }) : (memref<?xf32>, memref<?xf32>) -> (memref<?xf32>, memref<?xf32>)
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (index) -> (), sym_name = "while_three_arg"}> ({
  ^bb0(%arg0: index):
    %0 = "memref.alloc"(%arg0) <{operandSegmentSizes = array<i32: 1, 0>}> : (index) -> memref<?xf32>
    %1:3 = "scf.while"(%0, %0, %0) ({
    ^bb0(%arg4: memref<?xf32>, %arg5: memref<?xf32>, %arg6: memref<?xf32>):
      %4 = "test.side_effect_op"() {effects = [{effect = "read"}]} : () -> i1
      "scf.condition"(%4, %arg4, %arg5, %arg6) : (i1, memref<?xf32>, memref<?xf32>, memref<?xf32>) -> ()
    }, {
    ^bb0(%arg1: memref<?xf32>, %arg2: memref<?xf32>, %arg3: memref<?xf32>):
      %2 = "memref.alloc"(%arg0) <{operandSegmentSizes = array<i32: 1, 0>}> : (index) -> memref<?xf32>
      %3 = "memref.alloc"(%arg0) <{operandSegmentSizes = array<i32: 1, 0>}> : (index) -> memref<?xf32>
      "scf.yield"(%3, %2, %arg2) : (memref<?xf32>, memref<?xf32>, memref<?xf32>) -> ()
    }) : (memref<?xf32>, memref<?xf32>, memref<?xf32>) -> (memref<?xf32>, memref<?xf32>, memref<?xf32>)
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#set = affine_set<() : (0 >= 0)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<10xf32>) -> memref<10xf32>, sym_name = "test_affine_if_1"}> ({
  ^bb0(%arg0: memref<10xf32>):
    %0 = "affine.if"() <{condition = #set}> ({
      %1 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<10xf32>
      "affine.yield"(%1) : (memref<10xf32>) -> ()
    }, {
      "affine.yield"(%arg0) : (memref<10xf32>) -> ()
    }) : () -> memref<10xf32>
    "func.return"(%0) : (memref<10xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#set = affine_set<() : (0 >= 0)>
"builtin.module"() ({
  "func.func"() <{function_type = () -> memref<10xf32>, sym_name = "test_affine_if_2"}> ({
    %0 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<10xf32>
    %1 = "affine.if"() <{condition = #set}> ({
      "affine.yield"(%0) : (memref<10xf32>) -> ()
    }, {
      %2 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<10xf32>
      "affine.yield"(%2) : (memref<10xf32>) -> ()
    }) : () -> memref<10xf32>
    "func.return"(%1) : (memref<10xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#set = affine_set<() : (0 >= 0)>
"builtin.module"() ({
  "func.func"() <{function_type = () -> memref<10xf32>, sym_name = "test_affine_if_3"}> ({
    %0 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<10xf32>
    %1 = "affine.if"() <{condition = #set}> ({
      %2 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<10xf32>
      "affine.yield"(%2) : (memref<10xf32>) -> ()
    }, {
      "affine.yield"(%0) : (memref<10xf32>) -> ()
    }) : () -> memref<10xf32>
    "func.return"(%1) : (memref<10xf32>) -> ()
  }) : () -> ()
}) : () -> ()

