"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "structured_cfg"}> ({
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = 1 : index}> : () -> index
    %2 = "arith.constant"() <{value = 10 : index}> : () -> index
    "scf.for"(%1, %2, %1) ({
    ^bb0(%arg0: index):
      %3 = "test.zero"(%arg0) : (index) -> i1
      "scf.if"(%3) ({
        "test.one"(%arg0) : (index) -> ()
        "scf.yield"() : () -> ()
      }, {
        "test.two"(%arg0) : (index) -> ()
        "scf.yield"() : () -> ()
      }) : (i1) -> ()
      "test.three"(%arg0) : (index) -> ()
      "scf.yield"() : () -> ()
    }) {walk_blocks, walk_regions} : (index, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "unstructured_cfg"}> ({
    "test.region.op0"() ({
      "test.op0"() : () -> ()
      "cf.br"()[^bb2] : () -> ()
    ^bb1:  // no predecessors
      "test.op1"() : () -> ()
      "cf.br"()[^bb2] : () -> ()
    ^bb2:  // 2 preds: ^bb0, ^bb1
      "test.op2"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "unordered_cfg_with_loop"}> ({
    "test.region.op0"() ({
      %0 = "test.op0"() : () -> i1
      "cf.cond_br"(%0)[^bb2, ^bb3] <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (i1) -> ()
    ^bb1:  // pred: ^bb2
      "test.op1"(%1) : (i32) -> ()
      "cf.br"()[^bb5] : () -> ()
    ^bb2:  // 3 preds: ^bb0, ^bb3, ^bb4
      %1 = "test.op2"() : () -> i32
      "cf.br"()[^bb1] : () -> ()
    ^bb3:  // pred: ^bb0
      "test.op3"() : () -> ()
      "cf.br"()[^bb2] : () -> ()
    ^bb4:  // no predecessors
      "test.op4"() : () -> ()
      "cf.br"()[^bb2] : () -> ()
    ^bb5:  // pred: ^bb1
      "test.op5"() : () -> ()
      "cf.br"()[^bb7] : () -> ()
    ^bb6:  // pred: ^bb6
      "test.op6"() : () -> ()
      "cf.br"()[^bb6] : () -> ()
    ^bb7:  // pred: ^bb5
      "test.op7"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "test_no_skip_block_erasure"}> ({
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = 3 : index}> : () -> index
    "cf.br"()[^bb1] : () -> ()
  ^bb1:  // pred: ^bb0
    %2 = "arith.cmpi"(%0, %1) <{predicate = 0 : i64}> : (index, index) -> i1
    "cf.br"()[^bb2] : () -> ()
  ^bb2:  // pred: ^bb1
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (i32, i32) -> i32, sym_name = "test_no_skip_block_erasure_block_args"}> ({
  ^bb0(%arg0: i32, %arg1: i32):
    "cf.br"()[^bb1] : () -> ()
  ^bb1:  // pred: ^bb0
    %0 = "arith.addi"(%arg0, %arg1) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
    "func.return"(%0) : (i32) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
^bb0:
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<2xf32>, tensor<2xf32>) -> (), sym_name = "graph_region_skip"}> ({
  ^bb0(%arg0: tensor<2xf32>, %arg1: tensor<2xf32>):
    %0 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %1 = "linalg.fill"(%0, %arg0) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg4: f32, %arg5: f32):
      "linalg.yield"(%arg4) : (f32) -> ()
    }) : (f32, tensor<2xf32>) -> tensor<2xf32>
    %2 = "scf.forall"(%arg1) <{operandSegmentSizes = array<i32: 0, 0, 0, 1>, staticLowerBound = array<i64: 0>, staticStep = array<i64: 1>, staticUpperBound = array<i64: 2>}> ({
    ^bb0(%arg2: index, %arg3: tensor<2xf32>):
      %3 = "tensor.extract_slice"(%1, %arg2) <{operandSegmentSizes = array<i32: 1, 1, 0, 0>, static_offsets = array<i64: -9223372036854775808>, static_sizes = array<i64: 1>, static_strides = array<i64: 1>}> : (tensor<2xf32>, index) -> tensor<1xf32>
      %4 = "tensor.extract_slice"(%arg3, %arg2) <{operandSegmentSizes = array<i32: 1, 1, 0, 0>, static_offsets = array<i64: -9223372036854775808>, static_sizes = array<i64: 1>, static_strides = array<i64: 1>}> : (tensor<2xf32>, index) -> tensor<1xf32>
      "scf.forall.in_parallel"() ({
        "tensor.parallel_insert_slice"(%4, %arg3, %arg2) <{operandSegmentSizes = array<i32: 1, 1, 1, 0, 0>, static_offsets = array<i64: -9223372036854775808>, static_sizes = array<i64: 1>, static_strides = array<i64: 1>}> : (tensor<1xf32>, tensor<2xf32>, index) -> ()
      }) : () -> ()
    }) : (tensor<2xf32>) -> tensor<2xf32>
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "gpu.module"() <{sym_name = "issue205717"}> ({
    "func.func"() <{function_type = (i32) -> i32, sym_name = "test_skip_block_erasure_nested_uses"}> ({
    ^bb0(%arg0: i32):
      %0 = "arith.constant"() <{value = 0 : i32}> : () -> i32
      %1 = "arith.constant"() <{value = 1 : i32}> : () -> i32
      %2 = "arith.cmpi"(%arg0, %0) <{predicate = 0 : i64}> : (i32, i32) -> i1
      "cf.cond_br"(%2)[^bb1, ^bb2] <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (i1) -> ()
    ^bb1:  // pred: ^bb0
      "gpu.barrier"() <{scope = #gpu.barrier_scope<workgroup>}> : () -> ()
      "cf.br"(%1)[^bb3] : (i32) -> ()
    ^bb2:  // pred: ^bb0
      "gpu.barrier"() <{scope = #gpu.barrier_scope<workgroup>}> : () -> ()
      %3 = "arith.addi"(%arg0, %1) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
      "cf.br"(%3)[^bb3] : (i32) -> ()
    ^bb3(%4: i32):  // 2 preds: ^bb1, ^bb2
      "func.return"(%4) : (i32) -> ()
    }) : () -> ()
  }) : () -> ()
}) {gpu.container_module, llvm.data_layout = ""} : () -> ()

