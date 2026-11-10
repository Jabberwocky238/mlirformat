"builtin.module"() ({
^bb0:
}) : () -> ()

// -----
"builtin.module"() ({
  "memref.global"() <{initial_value = dense<0.000000e+00> : tensor<f32>, sym_name = "gscalar", type = memref<f32>}> : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "test_scalar_in_serial"}> ({
    "acc.serial"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 0>}> ({
      %0 = "memref.get_global"() <{name = @gscalar}> : () -> memref<f32>
      %1 = "memref.load"(%0) : (memref<f32>) -> f32
      "acc.yield"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "memref.global"() <{constant, initial_value = dense<1.000000e+00> : tensor<f32>, sym_name = "gscalarconst", type = memref<f32>}> : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "test_constant_in_serial"}> ({
    "acc.serial"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 0>}> ({
      %0 = "memref.get_global"() <{name = @gscalarconst}> : () -> memref<f32>
      %1 = "memref.load"(%0) : (memref<f32>) -> f32
      "acc.yield"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "memref.global"() <{initial_value = dense<0.000000e+00> : tensor<f32>, sym_name = "gscalar_routine", type = memref<f32>}> : () -> ()
  "acc.routine"() <{func_name = @test_scalar_in_accroutine, sym_name = "acc_routine_0"}> : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "test_scalar_in_accroutine"}> ({
    %0 = "memref.get_global"() <{name = @gscalar_routine}> : () -> memref<f32>
    %1 = "memref.load"(%0) : (memref<f32>) -> f32
    "func.return"() : () -> ()
  }) {acc.routine_info = #acc.routine_info<[@acc_routine_0]>} : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "memref.global"() <{constant, initial_value = dense<1.000000e+00> : tensor<f32>, sym_name = "gscalarconst_routine", type = memref<f32>}> : () -> ()
  "acc.routine"() <{func_name = @test_constant_in_accroutine, sym_name = "acc_routine_0"}> : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "test_constant_in_accroutine"}> ({
    %0 = "memref.get_global"() <{name = @gscalarconst_routine}> : () -> memref<f32>
    %1 = "memref.load"(%0) : (memref<f32>) -> f32
    "func.return"() : () -> ()
  }) {acc.routine_info = #acc.routine_info<[@acc_routine_0]>} : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "memref.global"() <{initial_value = dense<0.000000e+00> : tensor<f32>, sym_name = "global_for_private", type = memref<f32>}> : () -> ()
  "acc.private.recipe"() <{sym_name = "private_recipe_with_global", type = memref<f32>}> ({
  ^bb0(%arg1: memref<f32>):
    %3 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<f32>
    %4 = "memref.get_global"() <{name = @global_for_private}> : () -> memref<f32>
    %5 = "memref.load"(%4) : (memref<f32>) -> f32
    "memref.store"(%5, %3) : (f32, memref<f32>) -> ()
    "acc.yield"(%3) : (memref<f32>) -> ()
  }, {
  ^bb0(%arg0: memref<f32>):
    "memref.dealloc"(%arg0) : (memref<f32>) -> ()
    "acc.terminator"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "test_private_recipe_referenced"}> ({
    %0 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<f32>
    %1 = "acc.private"(%0) <{dataClause = #acc<data_clause acc_private>, implicit = false, modifiers = #acc<data_clause_modifier none>, operandSegmentSizes = array<i32: 1, 0, 0, 0>, recipe = @private_recipe_with_global, structured = true, varType = f32}> : (memref<f32>) -> memref<f32>
    "acc.parallel"(%1) <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0>}> ({
      %2 = "memref.load"(%0) : (memref<f32>) -> f32
      "acc.yield"() : () -> ()
    }) : (memref<f32>) -> ()
    "memref.dealloc"(%0) : (memref<f32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "memref.global"() <{initial_value = dense<0.000000e+00> : tensor<f32>, sym_name = "global_for_private_unused", type = memref<f32>}> : () -> ()
  "acc.private.recipe"() <{sym_name = "private_recipe_unused", type = memref<f32>}> ({
  ^bb0(%arg1: memref<f32>):
    %2 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<f32>
    %3 = "memref.get_global"() <{name = @global_for_private_unused}> : () -> memref<f32>
    %4 = "memref.load"(%3) : (memref<f32>) -> f32
    "memref.store"(%4, %2) : (f32, memref<f32>) -> ()
    "acc.yield"(%2) : (memref<f32>) -> ()
  }, {
  ^bb0(%arg0: memref<f32>):
    "memref.dealloc"(%arg0) : (memref<f32>) -> ()
    "acc.terminator"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "test_private_recipe_not_referenced"}> ({
    %0 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<f32>
    "acc.parallel"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0>}> ({
      %1 = "memref.load"(%0) : (memref<f32>) -> f32
      "acc.yield"() : () -> ()
    }) : () -> ()
    "memref.dealloc"(%0) : (memref<f32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "memref.global"() <{initial_value = dense<0.000000e+00> : tensor<f32>, sym_name = "global_parallel", type = memref<f32>}> : () -> ()
  "memref.global"() <{initial_value = dense<0.000000e+00> : tensor<f32>, sym_name = "global_kernels", type = memref<f32>}> : () -> ()
  "memref.global"() <{constant, initial_value = dense<1.000000e+00> : tensor<f32>, sym_name = "global_serial_const", type = memref<f32>}> : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "test_multiple_constructs"}> ({
    "acc.parallel"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0>}> ({
      %4 = "memref.get_global"() <{name = @global_parallel}> : () -> memref<f32>
      %5 = "memref.load"(%4) : (memref<f32>) -> f32
      "acc.yield"() : () -> ()
    }) : () -> ()
    "acc.kernels"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0>}> ({
      %2 = "memref.get_global"() <{name = @global_kernels}> : () -> memref<f32>
      %3 = "memref.load"(%2) : (memref<f32>) -> f32
      "acc.terminator"() : () -> ()
    }) : () -> ()
    "acc.serial"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 0>}> ({
      %0 = "memref.get_global"() <{name = @global_serial_const}> : () -> memref<f32>
      %1 = "memref.load"(%0) : (memref<f32>) -> f32
      "acc.yield"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "memref.global"() <{initial_value = dense<0.000000e+00> : tensor<f32>, sym_name = "global_in_compute_region", type = memref<f32>}> : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "test_scalar_in_compute_region"}> ({
    "acc.compute_region"() <{operandSegmentSizes = array<i32: 0, 0, 0>, origin = "acc.parallel"}> ({
      %0 = "memref.get_global"() <{name = @global_in_compute_region}> : () -> memref<f32>
      %1 = "memref.load"(%0) : (memref<f32>) -> f32
      "acc.yield"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

