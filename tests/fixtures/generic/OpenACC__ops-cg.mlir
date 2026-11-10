"builtin.module"() ({
^bb0:
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "par_dim_sequential"}> ({
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = 1 : index}> : () -> index
    %2 = "arith.constant"() <{value = 4 : index}> : () -> index
    "scf.parallel"(%0, %2, %1) <{operandSegmentSizes = array<i32: 1, 1, 1, 0>}> ({
    ^bb0(%arg0: index):
      "scf.reduce"() : () -> ()
    }) {acc.par_dims = #acc<par_dims[sequential]>} : (index, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "par_dim_single_thread_x"}> ({
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = 1 : index}> : () -> index
    %2 = "arith.constant"() <{value = 128 : index}> : () -> index
    "scf.parallel"(%0, %2, %1) <{operandSegmentSizes = array<i32: 1, 1, 1, 0>}> ({
    ^bb0(%arg0: index):
      "scf.reduce"() : () -> ()
    }) {acc.par_dims = #acc<par_dims[thread_x]>} : (index, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "par_dims_block_thread"}> ({
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = 1 : index}> : () -> index
    %2 = "arith.constant"() <{value = 8 : index}> : () -> index
    %3 = "arith.constant"() <{value = 128 : index}> : () -> index
    "scf.parallel"(%0, %0, %2, %3, %1, %1) <{operandSegmentSizes = array<i32: 2, 2, 2, 0>}> ({
    ^bb0(%arg0: index, %arg1: index):
      "scf.reduce"() : () -> ()
    }) {acc.par_dims = #acc<par_dims[block_x, thread_x]>} : (index, index, index, index, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "par_dims_all_dims"}> ({
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = 1 : index}> : () -> index
    "scf.parallel"(%0, %1, %1) <{operandSegmentSizes = array<i32: 1, 1, 1, 0>}> ({
    ^bb0(%arg0: index):
      "scf.reduce"() : () -> ()
    }) {acc.par_dims = #acc<par_dims[block_x, block_y, block_z, thread_x, thread_y, thread_z]>} : (index, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "par_dims_2d_grid"}> ({
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = 1 : index}> : () -> index
    %2 = "arith.constant"() <{value = 4 : index}> : () -> index
    %3 = "arith.constant"() <{value = 32 : index}> : () -> index
    "scf.parallel"(%0, %0, %2, %3, %1, %1) <{operandSegmentSizes = array<i32: 2, 2, 2, 0>}> ({
    ^bb0(%arg0: index, %arg1: index):
      "scf.reduce"() : () -> ()
    }) {acc.par_dims = #acc<par_dims[block_y, thread_y]>} : (index, index, index, index, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<1024xf32>, memref<f32>) -> (), sym_name = "compute_region_single_dim"}> ({
  ^bb0(%arg0: memref<1024xf32>, %arg1: memref<f32>):
    %0 = "arith.constant"() <{value = 128 : index}> : () -> index
    %1 = "acc.copyin"(%arg0) <{dataClause = #acc<data_clause acc_copyin>, implicit = false, modifiers = #acc<data_clause_modifier none>, operandSegmentSizes = array<i32: 1, 0, 0, 0>, structured = true, varType = f32}> : (memref<1024xf32>) -> memref<1024xf32>
    %2 = "acc.copyin"(%arg1) <{dataClause = #acc<data_clause acc_copy>, implicit = false, modifiers = #acc<data_clause_modifier none>, operandSegmentSizes = array<i32: 1, 0, 0, 0>, structured = true, varType = f32}> : (memref<f32>) -> memref<f32>
    "acc.kernel_environment"(%1, %2) <{operandSegmentSizes = array<i32: 2, 0, 0, 0>}> ({
      %3 = "acc.par_width"(%0) <{par_dim = #acc.par_dim<thread_x>}> : (index) -> index
      "acc.compute_region"(%3, %1, %2) <{operandSegmentSizes = array<i32: 1, 2, 0>, origin = "acc.parallel"}> ({
      ^bb0(%arg2: index, %arg3: memref<1024xf32>, %arg4: memref<f32>):
        %4 = "arith.constant"() <{value = 0 : index}> : () -> index
        %5 = "arith.constant"() <{value = 1 : index}> : () -> index
        %6 = "arith.constant"() <{value = 128 : index}> : () -> index
        %7 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
        "memref.store"(%7, %arg4) : (f32, memref<f32>) -> ()
        "scf.parallel"(%4, %6, %5) <{operandSegmentSizes = array<i32: 1, 1, 1, 0>}> ({
        ^bb0(%arg5: index):
          %8 = "memref.load"(%arg3, %arg5) : (memref<1024xf32>, index) -> f32
          %9 = "memref.load"(%arg4) : (memref<f32>) -> f32
          %10 = "arith.addf"(%9, %8) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
          "memref.store"(%10, %arg4) : (f32, memref<f32>) -> ()
          "scf.reduce"() : () -> ()
        }) {acc.par_dims = #acc<par_dims[thread_x]>} : (index, index, index) -> ()
        "acc.yield"() : () -> ()
      }) : (index, memref<1024xf32>, memref<f32>) -> ()
    }) : (memref<1024xf32>, memref<f32>) -> ()
    "acc.copyout"(%2, %arg1) <{dataClause = #acc<data_clause acc_copy>, implicit = false, modifiers = #acc<data_clause_modifier none>, operandSegmentSizes = array<i32: 1, 1, 0, 0>, structured = true, varType = f32}> : (memref<f32>, memref<f32>) -> ()
    "acc.delete"(%1) <{dataClause = #acc<data_clause acc_delete>, implicit = false, modifiers = #acc<data_clause_modifier none>, operandSegmentSizes = array<i32: 1, 0, 0>, structured = true}> : (memref<1024xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<8xi32>, memref<i32>) -> (), sym_name = "compute_region_two_dims"}> ({
  ^bb0(%arg0: memref<8xi32>, %arg1: memref<i32>):
    %0 = "arith.constant"() <{value = 8 : index}> : () -> index
    %1 = "arith.constant"() <{value = 128 : index}> : () -> index
    %2 = "acc.copyin"(%arg0) <{dataClause = #acc<data_clause acc_copyin>, implicit = false, modifiers = #acc<data_clause_modifier none>, operandSegmentSizes = array<i32: 1, 0, 0, 0>, structured = true, varType = i32}> : (memref<8xi32>) -> memref<8xi32>
    %3 = "acc.copyin"(%arg1) <{dataClause = #acc<data_clause acc_reduction>, implicit = false, modifiers = #acc<data_clause_modifier none>, operandSegmentSizes = array<i32: 1, 0, 0, 0>, structured = true, varType = i32}> : (memref<i32>) -> memref<i32>
    "acc.kernel_environment"(%2, %3) <{operandSegmentSizes = array<i32: 2, 0, 0, 0>}> ({
      %4 = "acc.par_width"(%0) <{par_dim = #acc.par_dim<block_x>}> : (index) -> index
      %5 = "acc.par_width"(%1) <{par_dim = #acc.par_dim<thread_x>}> : (index) -> index
      "acc.compute_region"(%4, %5, %2, %3) <{operandSegmentSizes = array<i32: 2, 2, 0>, origin = "acc.parallel"}> ({
      ^bb0(%arg2: index, %arg3: index, %arg4: memref<8xi32>, %arg5: memref<i32>):
        %6 = "arith.constant"() <{value = 0 : index}> : () -> index
        %7 = "arith.constant"() <{value = 1 : index}> : () -> index
        %8 = "arith.constant"() <{value = 8 : index}> : () -> index
        %9 = "arith.constant"() <{value = 0 : i32}> : () -> i32
        %10 = "acc.reduction_init"(%arg5) <{reductionOperator = #acc.reduction_operator<add>}> ({
          %14 = "memref.alloca"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<i32>
          "memref.store"(%9, %14) : (i32, memref<i32>) -> ()
          "acc.yield"(%14) : (memref<i32>) -> ()
        }) : (memref<i32>) -> memref<i32>
        "scf.parallel"(%6, %8, %7) <{operandSegmentSizes = array<i32: 1, 1, 1, 0>}> ({
        ^bb0(%arg6: index):
          %11 = "memref.load"(%arg4, %arg6) : (memref<8xi32>, index) -> i32
          %12 = "memref.load"(%10) : (memref<i32>) -> i32
          %13 = "arith.addi"(%12, %11) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
          "memref.store"(%13, %10) : (i32, memref<i32>) -> ()
          "scf.reduce"() : () -> ()
        }) {acc.par_dims = #acc<par_dims[block_x, thread_x]>} : (index, index, index) -> ()
        "acc.reduction_combine"(%arg5, %10) <{reductionOperator = #acc.reduction_operator<add>}> : (memref<i32>, memref<i32>) -> ()
        "acc.yield"() : () -> ()
      }) : (index, index, memref<8xi32>, memref<i32>) -> ()
    }) : (memref<8xi32>, memref<i32>) -> ()
    "acc.copyout"(%3, %arg1) <{dataClause = #acc<data_clause acc_reduction>, implicit = false, modifiers = #acc<data_clause_modifier none>, operandSegmentSizes = array<i32: 1, 1, 0, 0>, structured = true, varType = i32}> : (memref<i32>, memref<i32>) -> ()
    "acc.delete"(%2) <{dataClause = #acc<data_clause acc_delete>, implicit = false, modifiers = #acc<data_clause_modifier none>, operandSegmentSizes = array<i32: 1, 0, 0>, structured = true}> : (memref<8xi32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<100xf32>) -> (), sym_name = "compute_region_unknown_width"}> ({
  ^bb0(%arg0: memref<100xf32>):
    %0 = "acc.copyin"(%arg0) <{dataClause = #acc<data_clause acc_copyin>, implicit = false, modifiers = #acc<data_clause_modifier none>, operandSegmentSizes = array<i32: 1, 0, 0, 0>, structured = true, varType = f32}> : (memref<100xf32>) -> memref<100xf32>
    "acc.kernel_environment"(%0) <{operandSegmentSizes = array<i32: 1, 0, 0, 0>}> ({
      %1 = "acc.par_width"() <{par_dim = #acc.par_dim<thread_x>}> : () -> index
      "acc.compute_region"(%1, %0) <{operandSegmentSizes = array<i32: 1, 1, 0>, origin = "acc.kernels"}> ({
      ^bb0(%arg1: index, %arg2: memref<100xf32>):
        %2 = "arith.constant"() <{value = 0 : index}> : () -> index
        %3 = "arith.constant"() <{value = 1 : index}> : () -> index
        %4 = "arith.constant"() <{value = 100 : index}> : () -> index
        "scf.parallel"(%2, %4, %3) <{operandSegmentSizes = array<i32: 1, 1, 1, 0>}> ({
        ^bb0(%arg3: index):
          "scf.reduce"() : () -> ()
        }) {acc.par_dims = #acc<par_dims[thread_x]>} : (index, index, index) -> ()
        "acc.yield"() : () -> ()
      }) : (index, memref<100xf32>) -> ()
    }) : (memref<100xf32>) -> ()
    "acc.delete"(%0) <{dataClause = #acc<data_clause acc_delete>, implicit = false, modifiers = #acc<data_clause_modifier none>, operandSegmentSizes = array<i32: 1, 0, 0>, structured = true}> : (memref<100xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<i32>, memref<i32>) -> (), sym_name = "compute_region_no_launch"}> ({
  ^bb0(%arg0: memref<i32>, %arg1: memref<i32>):
    %0 = "acc.copyin"(%arg0) <{dataClause = #acc<data_clause acc_copy>, implicit = false, modifiers = #acc<data_clause_modifier none>, operandSegmentSizes = array<i32: 1, 0, 0, 0>, structured = true, varType = i32}> : (memref<i32>) -> memref<i32>
    %1 = "acc.copyin"(%arg1) <{dataClause = #acc<data_clause acc_copy>, implicit = false, modifiers = #acc<data_clause_modifier none>, operandSegmentSizes = array<i32: 1, 0, 0, 0>, structured = true, varType = i32}> : (memref<i32>) -> memref<i32>
    "acc.kernel_environment"(%0, %1) <{operandSegmentSizes = array<i32: 2, 0, 0, 0>}> ({
      "acc.compute_region"(%0, %1) <{operandSegmentSizes = array<i32: 0, 2, 0>, origin = "acc.serial"}> ({
      ^bb0(%arg2: memref<i32>, %arg3: memref<i32>):
        %2 = "arith.constant"() <{value = 1 : i32}> : () -> i32
        "memref.store"(%2, %arg2) : (i32, memref<i32>) -> ()
        "memref.store"(%2, %arg3) : (i32, memref<i32>) -> ()
        "acc.yield"() : () -> ()
      }) : (memref<i32>, memref<i32>) -> ()
    }) : (memref<i32>, memref<i32>) -> ()
    "acc.copyout"(%0, %arg0) <{dataClause = #acc<data_clause acc_copy>, implicit = false, modifiers = #acc<data_clause_modifier none>, operandSegmentSizes = array<i32: 1, 1, 0, 0>, structured = true, varType = i32}> : (memref<i32>, memref<i32>) -> ()
    "acc.copyout"(%1, %arg1) <{dataClause = #acc<data_clause acc_copy>, implicit = false, modifiers = #acc<data_clause_modifier none>, operandSegmentSizes = array<i32: 1, 1, 0, 0>, structured = true, varType = i32}> : (memref<i32>, memref<i32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "compute_region_launch_only"}> ({
    %0 = "arith.constant"() <{value = 32 : index}> : () -> index
    %1 = "acc.par_width"(%0) <{par_dim = #acc.par_dim<thread_x>}> : (index) -> index
    "acc.compute_region"(%1) <{operandSegmentSizes = array<i32: 1, 0, 0>, origin = "acc.parallel"}> ({
    ^bb0(%arg0: index):
      "acc.yield"() : () -> ()
    }) : (index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "compute_region_empty"}> ({
    "acc.compute_region"() <{operandSegmentSizes = array<i32: 0, 0, 0>, origin = "acc.parallel"}> ({
      "acc.yield"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<1024xf32>, !gpu.async.token) -> (), sym_name = "compute_region_all_fields"}> ({
  ^bb0(%arg0: memref<1024xf32>, %arg1: !gpu.async.token):
    %0 = "arith.constant"() <{value = 128 : index}> : () -> index
    %1 = "arith.constant"() <{value = 8 : index}> : () -> index
    %2 = "acc.copyin"(%arg0) <{dataClause = #acc<data_clause acc_copyin>, implicit = false, modifiers = #acc<data_clause_modifier none>, operandSegmentSizes = array<i32: 1, 0, 0, 0>, structured = true, varType = f32}> : (memref<1024xf32>) -> memref<1024xf32>
    "acc.kernel_environment"(%2) <{operandSegmentSizes = array<i32: 1, 0, 0, 0>}> ({
      %3 = "acc.par_width"(%1) <{par_dim = #acc.par_dim<block_x>}> : (index) -> index
      %4 = "acc.par_width"(%0) <{par_dim = #acc.par_dim<thread_x>}> : (index) -> index
      "acc.compute_region"(%3, %4, %2, %arg1) <{kernel_func_name = @compute_kernel, kernel_module_name = @device_module, operandSegmentSizes = array<i32: 2, 1, 1>, origin = "acc.parallel"}> ({
      ^bb0(%arg2: index, %arg3: index, %arg4: memref<1024xf32>):
        %5 = "arith.constant"() <{value = 0 : index}> : () -> index
        %6 = "arith.constant"() <{value = 1 : index}> : () -> index
        %7 = "arith.constant"() <{value = 1024 : index}> : () -> index
        "scf.parallel"(%5, %7, %6) <{operandSegmentSizes = array<i32: 1, 1, 1, 0>}> ({
        ^bb0(%arg5: index):
          "scf.reduce"() : () -> ()
        }) {acc.par_dims = #acc<par_dims[block_x, thread_x]>} : (index, index, index) -> ()
        "acc.yield"() : () -> ()
      }) : (index, index, memref<1024xf32>, !gpu.async.token) -> ()
    }) : (memref<1024xf32>) -> ()
    "acc.delete"(%2) <{dataClause = #acc<data_clause acc_delete>, implicit = false, modifiers = #acc<data_clause_modifier none>, operandSegmentSizes = array<i32: 1, 0, 0>, structured = true}> : (memref<1024xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<8xi32>, memref<i32>) -> (), sym_name = "parallel_reduction_pattern"}> ({
  ^bb0(%arg0: memref<8xi32>, %arg1: memref<i32>):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = 8 : index}> : () -> index
    %2 = "arith.constant"() <{value = 1 : index}> : () -> index
    %3 = "arith.constant"() <{value = 0 : i32}> : () -> i32
    %4 = "memref.alloca"() <{operandSegmentSizes = array<i32: 0, 0>}> {acc.par_dims = #acc<par_dims[thread_x]>} : () -> memref<i32>
    "memref.store"(%3, %4) : (i32, memref<i32>) -> ()
    %5 = "scf.parallel"(%0, %1, %2, %3) <{operandSegmentSizes = array<i32: 1, 1, 1, 1>}> ({
    ^bb0(%arg2: index):
      %6 = "memref.load"(%arg0, %arg2) : (memref<8xi32>, index) -> i32
      "scf.reduce"(%6) ({
      ^bb0(%arg3: i32, %arg4: i32):
        %7 = "arith.addi"(%arg3, %arg4) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
        "scf.reduce.return"(%7) : (i32) -> ()
      }) : (i32) -> ()
    }) {acc.par_dims = #acc<par_dims[thread_x]>} : (index, index, index, i32) -> i32
    "acc.reduction_accumulate"(%5, %4) <{par_dims = #acc<par_dims[thread_x]>, reductionOperator = #acc.reduction_operator<add>}> : (i32, memref<i32>) -> ()
    "acc.reduction_combine"(%arg1, %4) <{reductionOperator = #acc.reduction_operator<add>}> {acc.par_dims = #acc<par_dims[thread_x]>} : (memref<i32>, memref<i32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (f32, memref<f32>) -> (), sym_name = "reduction_accumulate_thread_x"}> ({
  ^bb0(%arg0: f32, %arg1: memref<f32>):
    "acc.reduction_accumulate"(%arg0, %arg1) <{par_dims = #acc<par_dims[thread_x]>, reductionOperator = #acc.reduction_operator<add>}> : (f32, memref<f32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (i32, memref<i32>) -> (), sym_name = "reduction_accumulate_block_thread"}> ({
  ^bb0(%arg0: i32, %arg1: memref<i32>):
    "acc.reduction_accumulate"(%arg0, %arg1) <{par_dims = #acc<par_dims[block_x, thread_x]>, reductionOperator = #acc.reduction_operator<add>}> : (i32, memref<i32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<4xi32>, !acc.data_bounds_ty) -> (), sym_name = "reduction_accumulate_array"}> ({
  ^bb0(%arg0: memref<4xi32>, %arg1: !acc.data_bounds_ty):
    "acc.reduction_accumulate_array"(%arg0, %arg1) <{par_dims = #acc<par_dims[block_x, thread_x]>, reductionOperator = #acc.reduction_operator<add>}> : (memref<4xi32>, !acc.data_bounds_ty) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> i32, sym_name = "compute_region_with_results"}> ({
    %0 = "acc.par_width"() <{par_dim = #acc.par_dim<thread_x>}> : () -> index
    %1 = "acc.compute_region"(%0) <{operandSegmentSizes = array<i32: 1, 0, 0>, origin = "acc.parallel"}> ({
    ^bb0(%arg0: index):
      %2 = "arith.constant"() <{value = 0 : i32}> : () -> i32
      "acc.yield"(%2) : (i32) -> ()
    }) : (index) -> i32
    "func.return"(%1) : (i32) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<i32>, memref<i32>) -> (), sym_name = "predicate_region_gang_vector_atomics"}> ({
  ^bb0(%arg0: memref<i32>, %arg1: memref<i32>):
    %0 = "arith.constant"() <{value = 3 : index}> : () -> index
    %1 = "arith.constant"() <{value = 16 : index}> : () -> index
    %2 = "acc.copyin"(%arg0) <{dataClause = #acc<data_clause acc_copy>, implicit = false, modifiers = #acc<data_clause_modifier none>, operandSegmentSizes = array<i32: 1, 0, 0, 0>, structured = true, varType = i32}> : (memref<i32>) -> memref<i32>
    %3 = "acc.copyin"(%arg1) <{dataClause = #acc<data_clause acc_copy>, implicit = false, modifiers = #acc<data_clause_modifier none>, operandSegmentSizes = array<i32: 1, 0, 0, 0>, structured = true, varType = i32}> : (memref<i32>) -> memref<i32>
    "acc.kernel_environment"(%2, %3) <{operandSegmentSizes = array<i32: 2, 0, 0, 0>}> ({
      %4 = "acc.par_width"(%0) <{par_dim = #acc.par_dim<block_x>}> : (index) -> index
      %5 = "acc.par_width"(%1) <{par_dim = #acc.par_dim<thread_x>}> : (index) -> index
      "acc.compute_region"(%4, %5, %2, %3) <{operandSegmentSizes = array<i32: 2, 2, 0>, origin = "acc.parallel"}> ({
      ^bb0(%arg2: index, %arg3: index, %arg4: memref<i32>, %arg5: memref<i32>):
        %6 = "arith.constant"() <{value = 1 : index}> : () -> index
        %7 = "arith.constant"() <{value = 10 : index}> : () -> index
        "scf.parallel"(%6, %7, %6) <{operandSegmentSizes = array<i32: 1, 1, 1, 0>}> ({
        ^bb0(%arg6: index):
          "acc.predicate_region"() ({
            "acc.atomic.update"(%arg4) ({
            ^bb0(%arg9: i32):
              %10 = "arith.constant"() <{value = 1 : i32}> : () -> i32
              %11 = "arith.addi"(%arg9, %10) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
              "acc.yield"(%11) : (i32) -> ()
            }) : (memref<i32>) -> ()
          }) : () -> ()
          "scf.parallel"(%6, %7, %6) <{operandSegmentSizes = array<i32: 1, 1, 1, 0>}> ({
          ^bb0(%arg7: index):
            "acc.atomic.update"(%arg5) ({
            ^bb0(%arg8: i32):
              %8 = "arith.constant"() <{value = 1 : i32}> : () -> i32
              %9 = "arith.addi"(%arg8, %8) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
              "acc.yield"(%9) : (i32) -> ()
            }) : (memref<i32>) -> ()
            "scf.reduce"() : () -> ()
          }) {acc.par_dims = #acc<par_dims[thread_x]>} : (index, index, index) -> ()
          "scf.reduce"() : () -> ()
        }) {acc.par_dims = #acc<par_dims[block_x]>} : (index, index, index) -> ()
        "acc.yield"() : () -> ()
      }) : (index, index, memref<i32>, memref<i32>) -> ()
    }) : (memref<i32>, memref<i32>) -> ()
    "acc.copyout"(%2, %arg0) <{dataClause = #acc<data_clause acc_copy>, implicit = false, modifiers = #acc<data_clause_modifier none>, operandSegmentSizes = array<i32: 1, 1, 0, 0>, structured = true, varType = i32}> : (memref<i32>, memref<i32>) -> ()
    "acc.copyout"(%3, %arg1) <{dataClause = #acc<data_clause acc_copy>, implicit = false, modifiers = #acc<data_clause_modifier none>, operandSegmentSizes = array<i32: 1, 1, 0, 0>, structured = true, varType = i32}> : (memref<i32>, memref<i32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<i32>, memref<10xi32>) -> (), sym_name = "predicate_region_gang_redundant_setup"}> ({
  ^bb0(%arg0: memref<i32>, %arg1: memref<10xi32>):
    %0 = "arith.constant"() <{value = 3 : index}> : () -> index
    %1 = "arith.constant"() <{value = 16 : index}> : () -> index
    %2 = "acc.copyin"(%arg0) <{dataClause = #acc<data_clause acc_copy>, implicit = false, modifiers = #acc<data_clause_modifier none>, operandSegmentSizes = array<i32: 1, 0, 0, 0>, structured = true, varType = i32}> : (memref<i32>) -> memref<i32>
    %3 = "acc.copyin"(%arg1) <{dataClause = #acc<data_clause acc_copyin>, implicit = false, modifiers = #acc<data_clause_modifier none>, operandSegmentSizes = array<i32: 1, 0, 0, 0>, structured = true, varType = i32}> : (memref<10xi32>) -> memref<10xi32>
    "acc.kernel_environment"(%2, %3) <{operandSegmentSizes = array<i32: 2, 0, 0, 0>}> ({
      %4 = "acc.par_width"(%0) <{par_dim = #acc.par_dim<block_x>}> : (index) -> index
      %5 = "acc.par_width"(%1) <{par_dim = #acc.par_dim<thread_x>}> : (index) -> index
      "acc.compute_region"(%4, %5, %2, %3) <{operandSegmentSizes = array<i32: 2, 2, 0>, origin = "acc.kernels"}> ({
      ^bb0(%arg2: index, %arg3: index, %arg4: memref<i32>, %arg5: memref<10xi32>):
        %6 = "arith.constant"() <{value = 0 : index}> : () -> index
        %7 = "arith.constant"() <{value = 1 : index}> : () -> index
        %8 = "arith.constant"() <{value = 10 : index}> : () -> index
        %9 = "memref.load"(%arg5, %6) : (memref<10xi32>, index) -> i32
        "acc.predicate_region"() ({
          "memref.store"(%9, %arg4) : (i32, memref<i32>) -> ()
        }) : () -> ()
        "scf.parallel"(%7, %8, %7) <{operandSegmentSizes = array<i32: 1, 1, 1, 0>}> ({
        ^bb0(%arg6: index):
          %10 = "memref.load"(%arg4) : (memref<i32>) -> i32
          %11 = "arith.addi"(%10, %10) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
          "memref.store"(%11, %arg4) : (i32, memref<i32>) -> ()
          "scf.parallel"(%7, %8, %7) <{operandSegmentSizes = array<i32: 1, 1, 1, 0>}> ({
          ^bb0(%arg7: index):
            "scf.reduce"() : () -> ()
          }) {acc.par_dims = #acc<par_dims[thread_x]>} : (index, index, index) -> ()
          "scf.reduce"() : () -> ()
        }) {acc.par_dims = #acc<par_dims[block_x]>} : (index, index, index) -> ()
        "acc.yield"() : () -> ()
      }) : (index, index, memref<i32>, memref<10xi32>) -> ()
    }) : (memref<i32>, memref<10xi32>) -> ()
    "acc.copyout"(%2, %arg0) <{dataClause = #acc<data_clause acc_copy>, implicit = false, modifiers = #acc<data_clause_modifier none>, operandSegmentSizes = array<i32: 1, 1, 0, 0>, structured = true, varType = i32}> : (memref<i32>, memref<i32>) -> ()
    "acc.delete"(%3) <{dataClause = #acc<data_clause acc_delete>, implicit = false, modifiers = #acc<data_clause_modifier none>, operandSegmentSizes = array<i32: 1, 0, 0>, structured = true}> : (memref<10xi32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "gpu_shared_memory_static"}> ({
    %0 = "arith.constant"() <{value = 1024 : index}> : () -> index
    %1 = "acc.gpu_shared_memory"(%0) <{num_copies = 1 : i64, static_upper_bound_bytes = 4096 : i64}> : (index) -> memref<?xf32, #gpu.address_space<workgroup>>
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "gpu_shared_memory_runtime_sized"}> ({
    %0 = "arith.constant"() <{value = 128 : index}> : () -> index
    %1 = "acc.gpu_shared_memory"(%0) <{dynamic_shared_memory_fixed_bytes = 24 : i64, dynamic_shared_memory_scaling_bytes = 12 : i64, num_copies = 1 : i64, static_upper_bound_bytes = 1560 : i64}> : (index) -> memref<?xf32, #gpu.address_space<workgroup>>
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "gpu_shared_memory_worker_copies"}> ({
    %0 = "acc.gpu_shared_memory"() <{num_copies = 4 : i64, static_upper_bound_bytes = 256 : i64}> : () -> memref<8xf32, #gpu.address_space<workgroup>>
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

