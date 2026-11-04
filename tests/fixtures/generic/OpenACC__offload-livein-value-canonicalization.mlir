"builtin.module"() ({
^bb0:
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (i64) -> (), sym_name = "use_i64", sym_visibility = "private"}> ({
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "test_constant_sink"}> ({
    %0 = "arith.constant"() <{value = 1 : i64}> : () -> i64
    "acc.serial"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 0>}> ({
      "func.call"(%0) <{callee = @use_i64}> : (i64) -> ()
      "acc.yield"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (i64) -> (), sym_name = "use_i64", sym_visibility = "private"}> ({
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "test_constant_rematerialize"}> ({
    %0 = "arith.constant"() <{value = 1 : i64}> : () -> i64
    "func.call"(%0) <{callee = @use_i64}> : (i64) -> ()
    "acc.serial"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 0>}> ({
      "func.call"(%0) <{callee = @use_i64}> : (i64) -> ()
      "acc.yield"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<10xf32>) -> (), sym_name = "test_accbounds_sink"}> ({
  ^bb0(%arg0: memref<10xf32>):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = 10 : index}> : () -> index
    %2 = "acc.bounds"(%0, %1) <{operandSegmentSizes = array<i32: 1, 1, 0, 0, 0>, strideInBytes = false}> : (index, index) -> !acc.data_bounds_ty
    "acc.serial"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 0>}> ({
      %3 = "acc.copyin"(%arg0, %2) <{dataClause = #acc<data_clause acc_copyin>, implicit = false, modifiers = #acc<data_clause_modifier none>, operandSegmentSizes = array<i32: 1, 0, 1, 0>, structured = true, varType = f32}> : (memref<10xf32>, !acc.data_bounds_ty) -> memref<10xf32>
      "acc.yield"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<10xf32>) -> (), sym_name = "test_accbounds_rematerialize"}> ({
  ^bb0(%arg0: memref<10xf32>):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = 10 : index}> : () -> index
    %2 = "acc.bounds"(%0, %1) <{operandSegmentSizes = array<i32: 1, 1, 0, 0, 0>, strideInBytes = false}> : (index, index) -> !acc.data_bounds_ty
    %3 = "acc.copyin"(%arg0, %2) <{dataClause = #acc<data_clause acc_copyin>, implicit = false, modifiers = #acc<data_clause_modifier none>, operandSegmentSizes = array<i32: 1, 0, 1, 0>, structured = true, varType = f32}> : (memref<10xf32>, !acc.data_bounds_ty) -> memref<10xf32>
    "acc.serial"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 0>}> ({
      %4 = "acc.copyin"(%arg0, %2) <{dataClause = #acc<data_clause acc_copyin>, implicit = false, modifiers = #acc<data_clause_modifier none>, operandSegmentSizes = array<i32: 1, 0, 1, 0>, structured = true, varType = f32}> : (memref<10xf32>, !acc.data_bounds_ty) -> memref<10xf32>
      "acc.yield"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "memref.global"() <{initial_value = dense<0.000000e+00> : tensor<10xf32>, sym_name = "memref_global_with_declare", type = memref<10xf32>}> {acc.declare = #acc.declare<dataClause =  acc_copyin>} : () -> ()
  "func.func"() <{function_type = (memref<10xf32>) -> (), sym_name = "use_memref", sym_visibility = "private"}> ({
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "test_memref_get_global_sink"}> ({
    %0 = "memref.get_global"() <{name = @memref_global_with_declare}> : () -> memref<10xf32>
    "acc.serial"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 0>}> ({
      "func.call"(%0) <{callee = @use_memref}> : (memref<10xf32>) -> ()
      "acc.yield"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "memref.global"() <{initial_value = dense<0.000000e+00> : tensor<2x5xf32>, sym_name = "memref_global_reinterpret", type = memref<2x5xf32>}> {acc.declare = #acc.declare<dataClause =  acc_copyin>} : () -> ()
  "func.func"() <{function_type = (memref<10xf32>) -> (), sym_name = "use_memref_1d", sym_visibility = "private"}> ({
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "test_memref_reinterpret_cast_sink"}> ({
    %0 = "memref.get_global"() <{name = @memref_global_reinterpret}> : () -> memref<2x5xf32>
    %1 = "memref.reinterpret_cast"(%0) <{operandSegmentSizes = array<i32: 1, 0, 0, 0>, static_offsets = array<i64: 0>, static_sizes = array<i64: 10>, static_strides = array<i64: 1>}> : (memref<2x5xf32>) -> memref<10xf32>
    "acc.serial"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 0>}> ({
      "func.call"(%1) <{callee = @use_memref_1d}> : (memref<10xf32>) -> ()
      "acc.yield"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (i32) -> (), sym_name = "use_i32", sym_visibility = "private"}> ({
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "test_parallel_region"}> ({
    %0 = "arith.constant"() <{value = 42 : i32}> : () -> i32
    "acc.parallel"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0>}> ({
      "func.call"(%0) <{callee = @use_i32}> : (i32) -> ()
      "acc.yield"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (f32) -> (), sym_name = "use_f32", sym_visibility = "private"}> ({
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "test_kernels_region"}> ({
    %0 = "arith.constant"() <{value = 3.140000e+00 : f32}> : () -> f32
    "acc.kernels"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0>}> ({
      "func.call"(%0) <{callee = @use_f32}> : (f32) -> ()
      "acc.terminator"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (index) -> (), sym_name = "use_index", sym_visibility = "private"}> ({
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "test_multiple_constants"}> ({
    %0 = "arith.constant"() <{value = 1 : index}> : () -> index
    %1 = "arith.constant"() <{value = 2 : index}> : () -> index
    "func.call"(%0) <{callee = @use_index}> : (index) -> ()
    "acc.serial"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 0>}> ({
      "func.call"(%0) <{callee = @use_index}> : (index) -> ()
      "func.call"(%1) <{callee = @use_index}> : (index) -> ()
      "acc.yield"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (index) -> (), sym_name = "use_index", sym_visibility = "private"}> ({
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "test_gpu_launch_region"}> ({
    %0 = "arith.constant"() <{value = 1 : index}> : () -> index
    %1 = "arith.constant"() <{value = 42 : index}> : () -> index
    "gpu.launch"(%0, %0, %0, %0, %0, %0) <{operandSegmentSizes = array<i32: 0, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0>}> ({
    ^bb0(%arg0: index, %arg1: index, %arg2: index, %arg3: index, %arg4: index, %arg5: index, %arg6: index, %arg7: index, %arg8: index, %arg9: index, %arg10: index, %arg11: index):
      "func.call"(%1) <{callee = @use_index}> : (index) -> ()
      "gpu.terminator"() : () -> ()
    }) {workgroup_attributions = 0 : i64} : (index, index, index, index, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (index) -> (), sym_name = "use_index", sym_visibility = "private"}> ({
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "test_gpu_launch_rematerialize"}> ({
    %0 = "arith.constant"() <{value = 1 : index}> : () -> index
    %1 = "arith.constant"() <{value = 42 : index}> : () -> index
    "func.call"(%1) <{callee = @use_index}> : (index) -> ()
    "gpu.launch"(%0, %0, %0, %0, %0, %0) <{operandSegmentSizes = array<i32: 0, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0>}> ({
    ^bb0(%arg0: index, %arg1: index, %arg2: index, %arg3: index, %arg4: index, %arg5: index, %arg6: index, %arg7: index, %arg8: index, %arg9: index, %arg10: index, %arg11: index):
      "func.call"(%1) <{callee = @use_index}> : (index) -> ()
      "gpu.terminator"() : () -> ()
    }) {workgroup_attributions = 0 : i64} : (index, index, index, index, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

