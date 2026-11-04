"builtin.module"() ({
  "func.func"() <{function_type = (memref<i32>) -> (), sym_name = "test_1_type_1.a"}> ({
  ^bb0(%arg0: memref<i32>):
    %0 = "arith.constant"() <{value = 0 : i32}> {tag = "zero"} : () -> i32
    "memref.store"(%0, %arg0) : (i32, memref<i32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<i32>, memref<i32>, i1) -> (), sym_name = "test_2_RegionBranchOpInterface_type_1.b"}> ({
  ^bb0(%arg0: memref<i32>, %arg1: memref<i32>, %arg2: i1):
    %0 = "arith.constant"() <{value = 0 : i32}> : () -> i32
    "cf.cond_br"(%arg2, %0, %0)[^bb1, ^bb2] <{operandSegmentSizes = array<i32: 1, 1, 1>}> {tag = "br"} : (i1, i32, i32) -> ()
  ^bb1(%1: i32):  // pred: ^bb0
    "memref.store"(%1, %arg0) : (i32, memref<i32>) -> ()
    "cf.br"()[^bb3] : () -> ()
  ^bb2(%2: i32):  // pred: ^bb0
    "memref.store"(%2, %arg1) : (i32, memref<i32>) -> ()
    "cf.br"()[^bb3] : () -> ()
  ^bb3:  // 2 preds: ^bb1, ^bb2
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (i32, memref<i32>, memref<i32>) -> (), sym_name = "test_3_BranchOpInterface_type_1.b"}> ({
  ^bb0(%arg0: i32, %arg1: memref<i32>, %arg2: memref<i32>):
    %0 = "arith.constant"() <{value = 0 : i32}> : () -> i32
    "cf.switch"(%arg0)[^bb1, ^bb2] <{case_operand_segments = array<i32: 0>, case_values = dense<42> : vector<1xi32>, operandSegmentSizes = array<i32: 1, 0, 0>}> {tag = "flag"} : (i32) -> ()
  ^bb1:  // pred: ^bb0
    "memref.store"(%0, %arg1) : (i32, memref<i32>) -> ()
    "cf.br"()[^bb3] : () -> ()
  ^bb2:  // pred: ^bb0
    "memref.store"(%0, %arg2) : (i32, memref<i32>) -> ()
    "cf.br"()[^bb3] : () -> ()
  ^bb3:  // 2 preds: ^bb1, ^bb2
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<f32>, tensor<f32>, i1) -> tensor<f32>, sym_name = "test_branch_result_in_different_result_1.c"}> ({
  ^bb0(%arg0: tensor<f32>, %arg1: tensor<f32>, %arg2: i1):
    "cf.cond_br"(%arg2, %arg0, %arg1)[^bb1, ^bb2] <{operandSegmentSizes = array<i32: 1, 1, 1>}> {tag = "cond_br"} : (i1, tensor<f32>, tensor<f32>) -> ()
  ^bb1(%0: tensor<f32>):  // pred: ^bb0
    "cf.br"(%0)[^bb3] : (tensor<f32>) -> ()
  ^bb2(%1: tensor<f32>):  // pred: ^bb0
    "cf.br"(%1)[^bb3] : (tensor<f32>) -> ()
  ^bb3(%2: tensor<f32>):  // 2 preds: ^bb1, ^bb2
    "func.return"(%2) : (tensor<f32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<f32>, tensor<f32>, i1) -> tensor<f32>, sym_name = "test_region_branch_result_in_different_result_1.c"}> ({
  ^bb0(%arg0: tensor<f32>, %arg1: tensor<f32>, %arg2: i1):
    %0 = "scf.if"(%arg2) ({
      "scf.yield"(%arg0) : (tensor<f32>) -> ()
    }, {
      "scf.yield"(%arg1) : (tensor<f32>) -> ()
    }) {tag = "region_branch"} : (i1) -> tensor<f32>
    "func.return"(%0) : (tensor<f32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (i32, i32) -> (), sym_name = "private", sym_visibility = "private"}> ({
  ^bb0(%arg4: i32, %arg5: i32):
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i32, i32, i32, memref<i32>) -> (), sym_name = "test_4_type_1.d"}> ({
  ^bb0(%arg0: i32, %arg1: i32, %arg2: i32, %arg3: memref<i32>):
    "test.call_on_device"(%arg0, %arg1, %arg2) <{callee = @private}> {tag = "call"} : (i32, i32, i32) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> f32, sym_name = "test_5_type_2"}> ({
    %0 = "arith.constant"() <{value = 0.000000e+00 : f32}> {tag = "zero"} : () -> f32
    "func.return"(%0) : (f32) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<i32>, i1) -> i32, sym_name = "test_6_RegionBranchTerminatorOpInterface_type_3"}> ({
  ^bb0(%arg0: memref<i32>, %arg1: i1):
    %0 = "arith.constant"() <{value = 0 : i32}> : () -> i32
    %1 = "arith.constant"() <{value = 1 : i32}> : () -> i32
    %2 = "arith.constant"() <{value = 2 : i32}> : () -> i32
    %3:3 = "scf.while"(%0, %1, %2, %2) ({
    ^bb0(%arg5: i32, %arg6: i32, %arg7: i32, %arg8: i32):
      "memref.store"(%arg7, %arg0) : (i32, memref<i32>) -> ()
      "scf.condition"(%arg1, %arg5, %arg6, %arg8) {tag = "condition"} : (i1, i32, i32, i32) -> ()
    }, {
    ^bb0(%arg2: i32, %arg3: i32, %arg4: i32):
      %4 = "arith.addi"(%arg4, %arg4) <{overflowFlags = #arith.overflow<none>}> {tag = "add"} : (i32, i32) -> i32
      %5 = "arith.constant"() <{value = 3 : i32}> : () -> i32
      "scf.yield"(%arg2, %arg3, %arg4, %5) : (i32, i32, i32, i32) -> ()
    }) : (i32, i32, i32, i32) -> (i32, i32, i32)
    "func.return"(%3#0) : (i32) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (i32) -> i32, sym_name = "private0", sym_visibility = "private"}> ({
  ^bb0(%arg4: i32):
    %8 = "arith.addi"(%arg4, %arg4) <{overflowFlags = #arith.overflow<none>}> {tag = "in_private0"} : (i32, i32) -> i32
    "func.return"(%8) : (i32) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<i32>) -> (), sym_name = "test_7_type_3"}> ({
  ^bb0(%arg0: memref<i32>):
    %0 = "arith.constant"() <{value = 0 : index}> {tag = "zero"} : () -> index
    %1 = "arith.constant"() <{value = 10 : index}> {tag = "ten"} : () -> index
    %2 = "arith.constant"() <{value = 1 : index}> {tag = "one"} : () -> index
    %3 = "arith.constant"() <{value = 0 : i32}> {tag = "x"} : () -> i32
    %4 = "arith.constant"() <{value = 1 : i32}> {tag = "y"} : () -> i32
    %5:2 = "scf.for"(%0, %1, %2, %3, %4) ({
    ^bb0(%arg1: index, %arg2: i32, %arg3: i32):
      %6 = "arith.addi"(%3, %3) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
      %7 = "func.call"(%6) <{callee = @private0}> : (i32) -> i32
      "scf.yield"(%7, %arg3) : (i32, i32) -> ()
    }) {tag = "for"} : (index, index, index, i32, i32) -> (i32, i32)
    "memref.store"(%5#0, %arg0) : (i32, memref<i32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (i32) -> i32, sym_name = "private1", sym_visibility = "private"}> ({
  ^bb0(%arg2: i32):
    %7 = "func.call"(%arg2) <{callee = @private2}> : (i32) -> i32
    %8 = "arith.muli"(%arg2, %7) <{overflowFlags = #arith.overflow<none>}> {tag = "in_private1"} : (i32, i32) -> i32
    "func.return"(%8) : (i32) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i32) -> i32, sym_name = "private2", sym_visibility = "private"}> ({
  ^bb0(%arg1: i32):
    %2 = "arith.index_cast"(%arg1) {tag = "in_private2"} : (i32) -> index
    %3 = "scf.index_switch"(%2) <{cases = array<i64: 1, 2>}> ({
      %6 = "arith.constant"() <{value = 30 : i32}> : () -> i32
      "scf.yield"(%6) : (i32) -> ()
    }, {
      %5 = "arith.constant"() <{value = 10 : i32}> : () -> i32
      "scf.yield"(%5) : (i32) -> ()
    }, {
      %4 = "arith.constant"() <{value = 20 : i32}> : () -> i32
      "scf.yield"(%4) : (i32) -> ()
    }) : (index) -> i32
    "func.return"(%3) : (i32) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i32) -> i32, sym_name = "test_8_type_3"}> ({
  ^bb0(%arg0: i32):
    %0 = "func.call"(%arg0) <{callee = @private1}> : (i32) -> i32
    %1 = "arith.muli"(%0, %arg0) <{overflowFlags = #arith.overflow<none>}> {tag = "final"} : (i32, i32) -> i32
    "func.return"(%1) : (i32) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> f32, sym_name = "test_9_negative"}> ({
    %0 = "arith.constant"() <{value = 0.000000e+00 : f32}> {tag = "zero"} : () -> f32
    %1 = "arith.constant"() <{value = 1.000000e+00 : f32}> {tag = "one"} : () -> f32
    "func.return"(%1) : (f32) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> (i32, i32), sym_name = "private_1", sym_visibility = "private"}> ({
    %1 = "arith.constant"() <{value = 0 : i32}> : () -> i32
    %2 = "arith.addi"(%1, %1) <{overflowFlags = #arith.overflow<none>}> {tag = "one"} : (i32, i32) -> i32
    "func.return"(%1, %2) : (i32, i32) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> i32, sym_name = "test_10_negative"}> ({
    %0:2 = "func.call"() <{callee = @private_1}> : () -> (i32, i32)
    "func.return"(%0#0) : (i32) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "dead_block"}> ({
    %0 = "arith.constant"() <{value = false}> : () -> i1
    %1 = "arith.constant"() <{value = 0 : i64}> : () -> i64
    "cf.cond_br"(%0)[^bb1, ^bb2] <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (i1) -> ()
  ^bb1:  // 2 preds: ^bb0, ^bb1
    %2 = "arith.cmpi"(%1, %1) <{predicate = 0 : i64}> {tag = "dead_block_cmpi"} : (i64, i64) -> i1
    "cf.br"()[^bb1] : () -> ()
  ^bb2:  // pred: ^bb0
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<() -> (0)>
#map1 = affine_map<() -> (79)>
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "affine_loop_no_use_iv_has_side_effect_op"}> ({
    %0 = "arith.constant"() <{value = 1 : index}> : () -> index
    %1 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<10xindex>
    "affine.for"() <{lowerBoundMap = #map, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map1}> ({
    ^bb0(%arg0: index):
      "memref.store"(%0, %1, %0) : (index, memref<10xindex>, index) -> ()
      "affine.yield"() : () -> ()
    }) {tag = "for"} : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<() -> (0)>
#map1 = affine_map<() -> (79)>
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "affine_loop_no_use_iv"}> ({
    "affine.for"() <{lowerBoundMap = #map, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map1}> ({
    ^bb0(%arg0: index):
      "affine.yield"() : () -> ()
    }) {tag = "for"} : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (index, index) -> (), sym_name = "forall_no_use_iv_has_side_effect_op"}> ({
  ^bb0(%arg0: index, %arg1: index):
    "scf.parallel"(%arg0, %arg1, %arg1) <{operandSegmentSizes = array<i32: 1, 1, 1, 0>}> ({
    ^bb0(%arg2: index):
      %0 = "memref.alloca"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<10xf32>
      %1 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
      "scf.forall"(%arg1) <{operandSegmentSizes = array<i32: 0, 1, 0, 0>, staticLowerBound = array<i64: 0>, staticStep = array<i64: 1>, staticUpperBound = array<i64: -9223372036854775808>}> ({
      ^bb0(%arg3: index):
        "memref.store"(%1, %0, %arg1) : (f32, memref<10xf32>, index) -> ()
        "scf.forall.in_parallel"() ({
        ^bb0:
        }) : () -> ()
      }) {tag = "forall"} : (index) -> ()
      "scf.reduce"() : () -> ()
    }) : (index, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<10xindex>) -> (), sym_name = "test_for_loop_read_only"}> ({
  ^bb0(%arg0: memref<10xindex>):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = 10 : index}> : () -> index
    %2 = "arith.constant"() <{value = 1 : index}> : () -> index
    %3 = "scf.for"(%0, %1, %2, %0) ({
    ^bb0(%arg1: index, %arg2: index):
      %4 = "memref.load"(%arg0, %arg2) : (memref<10xindex>, index) -> index
      "scf.yield"(%4) : (index) -> ()
    }) {tag = "for"} : (index, index, index, index) -> index
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

