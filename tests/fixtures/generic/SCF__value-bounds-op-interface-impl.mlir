"builtin.module"() ({
  "func.func"() <{function_type = (index, index, index) -> (), sym_name = "scf_for"}> ({
  ^bb0(%arg0: index, %arg1: index, %arg2: index):
    "scf.for"(%arg0, %arg1, %arg2) ({
    ^bb0(%arg3: index):
      %0 = "test.reify_bound"(%arg3) <{type = "LB"}> : (index) -> index
      %1 = "test.reify_bound"(%arg3) <{type = "UB"}> : (index) -> index
      "test.some_use"(%0, %1) : (index, index) -> ()
      "scf.yield"() : () -> ()
    }) : (index, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (index, index, index, index) -> (), sym_name = "scf_for_index_result_small"}> ({
  ^bb0(%arg0: index, %arg1: index, %arg2: index, %arg3: index):
    %0 = "scf.for"(%arg1, %arg2, %arg3, %arg0) ({
    ^bb0(%arg4: index, %arg5: index):
      %2 = "test.reify_bound"(%arg5) <{type = "EQ"}> : (index) -> index
      "test.some_use"(%2) : (index) -> ()
      "scf.yield"(%arg5) : (index) -> ()
    }) : (index, index, index, index) -> index
    %1 = "test.reify_bound"(%0) <{type = "EQ"}> : (index) -> index
    "test.some_use"(%1) : (index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (index, index, index, index) -> (), sym_name = "scf_for_index_result"}> ({
  ^bb0(%arg0: index, %arg1: index, %arg2: index, %arg3: index):
    %0 = "scf.for"(%arg1, %arg2, %arg3, %arg0) ({
    ^bb0(%arg4: index, %arg5: index):
      %2 = "arith.addi"(%arg5, %arg1) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
      %3 = "arith.subi"(%2, %arg1) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
      %4 = "test.reify_bound"(%arg5) <{type = "EQ"}> : (index) -> index
      "test.some_use"(%4) : (index) -> ()
      "scf.yield"(%3) : (index) -> ()
    }) : (index, index, index, index) -> index
    %1 = "test.reify_bound"(%0) <{type = "EQ"}> : (index) -> index
    "test.some_use"(%1) : (index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?xf32>, index, index, index) -> (), sym_name = "scf_for_tensor_result_small"}> ({
  ^bb0(%arg0: tensor<?xf32>, %arg1: index, %arg2: index, %arg3: index):
    %0 = "scf.for"(%arg1, %arg2, %arg3, %arg0) ({
    ^bb0(%arg4: index, %arg5: tensor<?xf32>):
      %2 = "test.reify_bound"(%arg5) <{dim = 0 : i64, type = "EQ"}> : (tensor<?xf32>) -> index
      "test.some_use"(%2) : (index) -> ()
      "scf.yield"(%arg5) : (tensor<?xf32>) -> ()
    }) : (index, index, index, tensor<?xf32>) -> tensor<?xf32>
    %1 = "test.reify_bound"(%0) <{dim = 0 : i64, type = "EQ"}> : (tensor<?xf32>) -> index
    "test.some_use"(%1) : (index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?xf32>, index, index, index) -> (), sym_name = "scf_for_tensor_result"}> ({
  ^bb0(%arg0: tensor<?xf32>, %arg1: index, %arg2: index, %arg3: index):
    %0 = "arith.constant"() <{value = 5.000000e+00 : f32}> : () -> f32
    %1 = "scf.for"(%arg1, %arg2, %arg3, %arg0) ({
    ^bb0(%arg4: index, %arg5: tensor<?xf32>):
      %3 = "linalg.fill"(%0, %arg5) <{operandSegmentSizes = array<i32: 1, 1>}> ({
      ^bb0(%arg6: f32, %arg7: f32):
        "linalg.yield"(%arg6) : (f32) -> ()
      }) : (f32, tensor<?xf32>) -> tensor<?xf32>
      %4 = "test.reify_bound"(%arg5) <{dim = 0 : i64, type = "EQ"}> : (tensor<?xf32>) -> index
      "test.some_use"(%4) : (index) -> ()
      "scf.yield"(%3) : (tensor<?xf32>) -> ()
    }) : (index, index, index, tensor<?xf32>) -> tensor<?xf32>
    %2 = "test.reify_bound"(%1) <{dim = 0 : i64, type = "EQ"}> : (tensor<?xf32>) -> index
    "test.some_use"(%2) : (index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (index, index, index) -> (), sym_name = "scf_forall"}> ({
  ^bb0(%arg0: index, %arg1: index, %arg2: index):
    "scf.forall"(%arg0, %arg1, %arg2) <{operandSegmentSizes = array<i32: 1, 1, 1, 0>, staticLowerBound = array<i64: -9223372036854775808>, staticStep = array<i64: -9223372036854775808>, staticUpperBound = array<i64: -9223372036854775808>}> ({
    ^bb0(%arg3: index):
      %0 = "test.reify_bound"(%arg3) <{type = "LB"}> : (index) -> index
      %1 = "test.reify_bound"(%arg3) <{type = "UB"}> : (index) -> index
      "test.some_use"(%0, %1) : (index, index) -> ()
      "scf.forall.in_parallel"() ({
      ^bb0:
      }) : () -> ()
    }) : (index, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (index, index, index, index) -> (), sym_name = "scf_forall_tensor_result"}> ({
  ^bb0(%arg0: index, %arg1: index, %arg2: index, %arg3: index):
    %0 = "arith.constant"() <{value = 5.000000e+00 : f32}> : () -> f32
    %1 = "tensor.empty"(%arg0) : (index) -> tensor<?xf32>
    %2 = "scf.forall"(%arg1, %arg2, %arg3, %1) <{operandSegmentSizes = array<i32: 1, 1, 1, 1>, staticLowerBound = array<i64: -9223372036854775808>, staticStep = array<i64: -9223372036854775808>, staticUpperBound = array<i64: -9223372036854775808>}> ({
    ^bb0(%arg4: index, %arg5: tensor<?xf32>):
      %4 = "linalg.fill"(%0, %arg5) <{operandSegmentSizes = array<i32: 1, 1>}> ({
      ^bb0(%arg6: f32, %arg7: f32):
        "linalg.yield"(%arg6) : (f32) -> ()
      }) : (f32, tensor<?xf32>) -> tensor<?xf32>
      %5 = "test.reify_bound"(%arg5) <{dim = 0 : i64, type = "EQ"}> : (tensor<?xf32>) -> index
      "test.some_use"(%5) : (index) -> ()
      "scf.forall.in_parallel"() ({
        "tensor.parallel_insert_slice"(%4, %arg5, %arg0) <{operandSegmentSizes = array<i32: 1, 1, 0, 1, 0>, static_offsets = array<i64: 0>, static_sizes = array<i64: -9223372036854775808>, static_strides = array<i64: 1>}> : (tensor<?xf32>, tensor<?xf32>, index) -> ()
      }) : () -> ()
    }) : (index, index, index, tensor<?xf32>) -> tensor<?xf32>
    %3 = "test.reify_bound"(%2) <{dim = 0 : i64, type = "EQ"}> : (tensor<?xf32>) -> index
    "test.some_use"(%3) : (index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (i1) -> (), sym_name = "scf_if_constant"}> ({
  ^bb0(%arg0: i1):
    %0 = "arith.constant"() <{value = 4 : index}> : () -> index
    %1 = "arith.constant"() <{value = 9 : index}> : () -> index
    %2 = "scf.if"(%arg0) ({
      "scf.yield"(%0) : (index) -> ()
    }, {
      "scf.yield"(%1) : (index) -> ()
    }) : (i1) -> index
    %3 = "test.reify_bound"(%2) <{type = "LB"}> : (index) -> index
    %4 = "test.reify_bound"(%2) <{type = "UB"}> : (index) -> index
    "test.some_use"(%3, %4) : (index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (index, index, i1) -> (), sym_name = "scf_if_dynamic"}> ({
  ^bb0(%arg0: index, %arg1: index, %arg2: i1):
    %0 = "arith.constant"() <{value = 4 : index}> : () -> index
    %1 = "scf.if"(%arg2) ({
      %6 = "arith.addi"(%arg0, %arg1) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
      "scf.yield"(%6) : (index) -> ()
    }, {
      %4 = "arith.addi"(%arg1, %0) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
      %5 = "arith.addi"(%4, %arg0) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
      "scf.yield"(%5) : (index) -> ()
    }) : (i1) -> index
    %2 = "test.reify_bound"(%1) <{type = "LB"}> : (index) -> index
    %3 = "test.reify_bound"(%1) <{type = "UB"}> : (index) -> index
    "test.some_use"(%2, %3) : (index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (i1) -> (), sym_name = "scf_if_tensor_dim"}> ({
  ^bb0(%arg0: i1):
    %0 = "arith.constant"() <{value = 4 : index}> : () -> index
    %1 = "arith.constant"() <{value = 9 : index}> : () -> index
    %2 = "tensor.empty"(%0) : (index) -> tensor<?xf32>
    %3 = "tensor.empty"(%1) : (index) -> tensor<?xf32>
    %4 = "scf.if"(%arg0) ({
      "scf.yield"(%2) : (tensor<?xf32>) -> ()
    }, {
      "scf.yield"(%3) : (tensor<?xf32>) -> ()
    }) : (i1) -> tensor<?xf32>
    %5 = "test.reify_bound"(%4) <{dim = 0 : i64, type = "LB"}> : (tensor<?xf32>) -> index
    %6 = "test.reify_bound"(%4) <{dim = 0 : i64, type = "UB"}> : (tensor<?xf32>) -> index
    "test.some_use"(%5, %6) : (index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (index, index, i1) -> (), sym_name = "scf_if_eq"}> ({
  ^bb0(%arg0: index, %arg1: index, %arg2: i1):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "scf.if"(%arg2) ({
      %5 = "arith.addi"(%arg0, %arg1) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
      "scf.yield"(%5) : (index) -> ()
    }, {
      %3 = "arith.addi"(%arg1, %0) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
      %4 = "arith.addi"(%3, %arg0) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
      "scf.yield"(%4) : (index) -> ()
    }) : (i1) -> index
    %2 = "test.reify_bound"(%1) <{type = "EQ"}> : (index) -> index
    "test.some_use"(%2) : (index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

