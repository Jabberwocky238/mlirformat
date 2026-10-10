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
  "func.func"() <{function_type = (tensor<?xf32>, tensor<?xf32>, index, index, index) -> (), sym_name = "scf_for_swapping_yield"}> ({
  ^bb0(%arg0: tensor<?xf32>, %arg1: tensor<?xf32>, %arg2: index, %arg3: index, %arg4: index):
    %0 = "arith.constant"() <{value = 5.000000e+00 : f32}> : () -> f32
    %1:2 = "scf.for"(%arg2, %arg3, %arg4, %arg0, %arg1) ({
    ^bb0(%arg5: index, %arg6: tensor<?xf32>, %arg7: tensor<?xf32>):
      %3 = "linalg.fill"(%0, %arg6) <{operandSegmentSizes = array<i32: 1, 1>}> ({
      ^bb0(%arg10: f32, %arg11: f32):
        "linalg.yield"(%arg10) : (f32) -> ()
      }) : (f32, tensor<?xf32>) -> tensor<?xf32>
      %4 = "linalg.fill"(%0, %arg7) <{operandSegmentSizes = array<i32: 1, 1>}> ({
      ^bb0(%arg8: f32, %arg9: f32):
        "linalg.yield"(%arg8) : (f32) -> ()
      }) : (f32, tensor<?xf32>) -> tensor<?xf32>
      "scf.yield"(%4, %3) : (tensor<?xf32>, tensor<?xf32>) -> ()
    }) : (index, index, index, tensor<?xf32>, tensor<?xf32>) -> (tensor<?xf32>, tensor<?xf32>)
    %2 = "test.reify_bound"(%1#0) <{dim = 0 : i64, type = "EQ"}> : (tensor<?xf32>) -> index
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
  "func.func"() <{function_type = (index, index, i1) -> (), sym_name = "scf_if_no_affine_bound"}> ({
  ^bb0(%arg0: index, %arg1: index, %arg2: i1):
    %0 = "scf.if"(%arg2) ({
      "scf.yield"(%arg0) : (index) -> ()
    }, {
      "scf.yield"(%arg1) : (index) -> ()
    }) : (i1) -> index
    %1 = "test.reify_bound"(%0) <{type = "LB"}> : (index) -> index
    "test.some_use"(%1) : (index) -> ()
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

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (index, index, index) -> (), sym_name = "compare_scf_for"}> ({
  ^bb0(%arg0: index, %arg1: index, %arg2: index):
    "scf.for"(%arg0, %arg1, %arg2) ({
    ^bb0(%arg3: index):
      "test.compare"(%arg3, %arg0) <{cmp = "GE"}> : (index, index) -> ()
      "test.compare"(%arg3, %arg1) <{cmp = "LT"}> : (index, index) -> ()
      "scf.yield"() : () -> ()
    }) : (index, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "scf_for_induction_var_upper_bound"}> ({
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = 1 : index}> : () -> index
    %2 = "arith.constant"() <{value = 2 : index}> : () -> index
    %3 = "arith.constant"() <{value = 3 : index}> : () -> index
    %4 = "arith.constant"() <{value = 4 : index}> : () -> index
    %5 = "arith.constant"() <{value = 5 : index}> : () -> index
    %6 = "arith.constant"() <{value = 8 : index}> : () -> index
    %7 = "arith.constant"() <{value = 10 : index}> : () -> index
    "scf.for"(%0, %7, %4) ({
    ^bb0(%arg1: index):
      "test.compare"(%arg1, %6) <{cmp = "LE"}> : (index, index) -> ()
      "scf.yield"() : () -> ()
    }) : (index, index, index) -> ()
    "scf.for"(%2, %6, %3) ({
    ^bb0(%arg0: index):
      "test.compare"(%arg0, %5) <{cmp = "LE"}> : (index, index) -> ()
      "scf.yield"() : () -> ()
    }) : (index, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0)[s0] -> (d0 ceildiv s0)>
"builtin.module"() ({
  "func.func"() <{function_type = (index, index) -> (), sym_name = "scf_for_induction_var_computed_upper_bound"}> ({
  ^bb0(%arg0: index, %arg1: index):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = 1 : index}> : () -> index
    %2 = "affine.apply"(%arg0, %arg1) <{map = #map}> : (index, index) -> index
    %3 = "arith.subi"(%2, %1) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
    %4 = "arith.muli"(%3, %arg1) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
    "scf.for"(%0, %arg0, %arg1) ({
    ^bb0(%arg2: index):
      "test.compare"(%arg2, %4) <{cmp = "LE"}> : (index, index) -> ()
      "scf.yield"() : () -> ()
    }) : (index, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "scf_for_result_infer"}> ({
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = 1 : index}> : () -> index
    %2 = "arith.constant"() <{value = 10 : index}> : () -> index
    %3 = "scf.for"(%0, %2, %1, %0) ({
    ^bb0(%arg0: index, %arg1: index):
      %4 = "test.some_use"() : () -> i1
      %5 = "scf.if"(%4) ({
        %6 = "arith.addi"(%arg1, %1) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
        "scf.yield"(%6) : (index) -> ()
      }, {
        "scf.yield"(%arg1) : (index) -> ()
      }) : (i1) -> index
      "scf.yield"(%5) : (index) -> ()
    }) : (index, index, index, index) -> index
    "test.compare"(%3, %2) <{cmp = "LE"}> : (index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (index) -> (), sym_name = "scf_for_result_infer_dynamic_init"}> ({
  ^bb0(%arg0: index):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = 1 : index}> : () -> index
    %2 = "arith.constant"() <{value = 10 : index}> : () -> index
    %3 = "scf.for"(%0, %2, %1, %arg0) ({
    ^bb0(%arg1: index, %arg2: index):
      %5 = "test.some_use"() : () -> i1
      %6 = "scf.if"(%5) ({
        %7 = "arith.addi"(%arg2, %1) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
        "scf.yield"(%7) : (index) -> ()
      }, {
        "scf.yield"(%arg2) : (index) -> ()
      }) : (i1) -> index
      "scf.yield"(%6) : (index) -> ()
    }) : (index, index, index, index) -> index
    %4 = "arith.addi"(%arg0, %2) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
    "test.compare"(%3, %4) <{cmp = "LE"}> : (index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (index) -> (), sym_name = "scf_for_result_infer_dynamic_init_big_step"}> ({
  ^bb0(%arg2: index):
    %1 = "arith.constant"() <{value = 0 : index}> : () -> index
    %2 = "arith.constant"() <{value = 1 : index}> : () -> index
    %3 = "arith.constant"() <{value = 2 : index}> : () -> index
    %4 = "arith.constant"() <{value = 4 : index}> : () -> index
    %5 = "arith.constant"() <{value = 5 : index}> : () -> index
    %6 = "arith.constant"() <{value = 10 : index}> : () -> index
    %7 = "scf.for"(%1, %6, %3, %arg2) ({
    ^bb0(%arg3: index, %arg4: index):
      %10 = "test.some_use"() : () -> i1
      %11 = "scf.if"(%10) ({
        %12 = "arith.addi"(%arg4, %2) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
        "scf.yield"(%12) : (index) -> ()
      }, {
        "scf.yield"(%arg4) : (index) -> ()
      }) : (i1) -> index
      "scf.yield"(%11) : (index) -> ()
    }) : (index, index, index, index) -> index
    %8 = "arith.addi"(%arg2, %5) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
    %9 = "arith.addi"(%arg2, %4) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
    "test.compare"(%7, %8) <{cmp = "LE"}> : (index, index) -> ()
    "test.compare"(%7, %9) <{cmp = "LE"}> : (index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (index) -> (), sym_name = "scf_forall_computed_upper_bound"}> ({
  ^bb0(%arg0: index):
    %0 = "arith.constant"() <{value = 6 : index}> : () -> index
    "scf.forall"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0>, staticLowerBound = array<i64: 0>, staticStep = array<i64: 3>, staticUpperBound = array<i64: 8>}> ({
    ^bb0(%arg1: index):
      "test.compare"(%arg1, %0) <{cmp = "LE"}> : (index, index) -> ()
      "scf.forall.in_parallel"() ({
      ^bb0:
      }) : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

