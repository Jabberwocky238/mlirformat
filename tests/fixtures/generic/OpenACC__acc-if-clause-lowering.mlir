"builtin.module"() ({
  "func.func"() <{function_type = (memref<10xi32>, i1) -> (), sym_name = "test_parallel_if"}> ({
  ^bb0(%arg0: memref<10xi32>, %arg1: i1):
    %0 = "arith.constant"() <{value = 0 : i32}> : () -> i32
    %1 = "arith.constant"() <{value = 1 : index}> : () -> index
    %2 = "arith.constant"() <{value = 10 : index}> : () -> index
    %3 = "acc.copyin"(%arg0) <{dataClause = #acc<data_clause acc_copyin>, implicit = false, modifiers = #acc<data_clause_modifier none>, operandSegmentSizes = array<i32: 1, 0, 0, 0>, structured = true, varType = i32}> : (memref<10xi32>) -> memref<10xi32>
    %4 = "acc.create"(%arg0) <{dataClause = #acc<data_clause acc_copyout>, implicit = false, modifiers = #acc<data_clause_modifier none>, operandSegmentSizes = array<i32: 1, 0, 0, 0>, structured = true, varType = i32}> : (memref<10xi32>) -> memref<10xi32>
    "acc.parallel"(%arg1, %3, %4) <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 2>}> ({
      "scf.for"(%1, %2, %1) ({
      ^bb0(%arg2: index):
        "memref.store"(%0, %arg0, %arg2) : (i32, memref<10xi32>, index) -> ()
        "scf.yield"() : () -> ()
      }) : (index, index, index) -> ()
      "acc.yield"() : () -> ()
    }) : (i1, memref<10xi32>, memref<10xi32>) -> ()
    "acc.delete"(%4) <{dataClause = #acc<data_clause acc_delete>, implicit = false, modifiers = #acc<data_clause_modifier none>, operandSegmentSizes = array<i32: 1, 0, 0>, structured = true}> : (memref<10xi32>) -> ()
    "acc.copyout"(%3, %arg0) <{dataClause = #acc<data_clause acc_copyout>, implicit = false, modifiers = #acc<data_clause_modifier none>, operandSegmentSizes = array<i32: 1, 1, 0, 0>, structured = true, varType = i32}> : (memref<10xi32>, memref<10xi32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (i1, i32) -> (), sym_name = "test_parallel_if_multiblock"}> ({
  ^bb0(%arg0: i1, %arg1: i32):
    %0 = "arith.constant"() <{value = 0 : i32}> : () -> i32
    %1 = "arith.constant"() <{value = 1 : i32}> : () -> i32
    %2 = "memref.alloca"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<i32>
    "memref.store"(%arg1, %2) : (i32, memref<i32>) -> ()
    "acc.parallel"(%arg0) <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0>}> ({
      "cf.br"()[^bb1] : () -> ()
    ^bb1:  // 2 preds: ^bb0, ^bb2
      %3 = "memref.load"(%2) : (memref<i32>) -> i32
      %4 = "arith.cmpi"(%3, %0) <{predicate = 4 : i64}> : (i32, i32) -> i1
      "cf.cond_br"(%4)[^bb2, ^bb3] <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (i1) -> ()
    ^bb2:  // pred: ^bb1
      %5 = "arith.subi"(%3, %1) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
      "memref.store"(%5, %2) : (i32, memref<i32>) -> ()
      "cf.br"()[^bb1] : () -> ()
    ^bb3:  // pred: ^bb1
      "acc.yield"() : () -> ()
    }) : (i1) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<5xi32>, i1) -> (), sym_name = "test_kernels_if"}> ({
  ^bb0(%arg0: memref<5xi32>, %arg1: i1):
    %0 = "arith.constant"() <{value = 1 : i32}> : () -> i32
    %1 = "arith.constant"() <{value = 1 : index}> : () -> index
    %2 = "arith.constant"() <{value = 5 : index}> : () -> index
    %3 = "acc.copyin"(%arg0) <{dataClause = #acc<data_clause acc_copyin>, implicit = false, modifiers = #acc<data_clause_modifier none>, operandSegmentSizes = array<i32: 1, 0, 0, 0>, structured = true, varType = i32}> : (memref<5xi32>) -> memref<5xi32>
    %4 = "acc.create"(%arg0) <{dataClause = #acc<data_clause acc_copyout>, implicit = false, modifiers = #acc<data_clause_modifier none>, operandSegmentSizes = array<i32: 1, 0, 0, 0>, structured = true, varType = i32}> : (memref<5xi32>) -> memref<5xi32>
    "acc.kernels"(%arg1, %3, %4) <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 2>}> ({
      "scf.for"(%1, %2, %1) ({
      ^bb0(%arg2: index):
        "memref.store"(%0, %arg0, %arg2) : (i32, memref<5xi32>, index) -> ()
        "scf.yield"() : () -> ()
      }) : (index, index, index) -> ()
      "acc.terminator"() : () -> ()
    }) : (i1, memref<5xi32>, memref<5xi32>) -> ()
    "acc.delete"(%4) <{dataClause = #acc<data_clause acc_delete>, implicit = false, modifiers = #acc<data_clause_modifier none>, operandSegmentSizes = array<i32: 1, 0, 0>, structured = true}> : (memref<5xi32>) -> ()
    "acc.copyout"(%3, %arg0) <{dataClause = #acc<data_clause acc_copyout>, implicit = false, modifiers = #acc<data_clause_modifier none>, operandSegmentSizes = array<i32: 1, 1, 0, 0>, structured = true, varType = i32}> : (memref<5xi32>, memref<5xi32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<8xi32>, i1) -> (), sym_name = "test_serial_if"}> ({
  ^bb0(%arg0: memref<8xi32>, %arg1: i1):
    %0 = "arith.constant"() <{value = 2 : i32}> : () -> i32
    %1 = "arith.constant"() <{value = 1 : index}> : () -> index
    %2 = "arith.constant"() <{value = 8 : index}> : () -> index
    %3 = "acc.copyin"(%arg0) <{dataClause = #acc<data_clause acc_copyin>, implicit = false, modifiers = #acc<data_clause_modifier none>, operandSegmentSizes = array<i32: 1, 0, 0, 0>, structured = true, varType = i32}> : (memref<8xi32>) -> memref<8xi32>
    %4 = "acc.create"(%arg0) <{dataClause = #acc<data_clause acc_copyout>, implicit = false, modifiers = #acc<data_clause_modifier none>, operandSegmentSizes = array<i32: 1, 0, 0, 0>, structured = true, varType = i32}> : (memref<8xi32>) -> memref<8xi32>
    "acc.serial"(%arg1, %3, %4) <{operandSegmentSizes = array<i32: 0, 0, 1, 0, 0, 0, 0, 2>}> ({
      "scf.for"(%1, %2, %1) ({
      ^bb0(%arg2: index):
        "memref.store"(%0, %arg0, %arg2) : (i32, memref<8xi32>, index) -> ()
        "scf.yield"() : () -> ()
      }) : (index, index, index) -> ()
      "acc.yield"() : () -> ()
    }) : (i1, memref<8xi32>, memref<8xi32>) -> ()
    "acc.delete"(%4) <{dataClause = #acc<data_clause acc_delete>, implicit = false, modifiers = #acc<data_clause_modifier none>, operandSegmentSizes = array<i32: 1, 0, 0>, structured = true}> : (memref<8xi32>) -> ()
    "acc.copyout"(%3, %arg0) <{dataClause = #acc<data_clause acc_copyout>, implicit = false, modifiers = #acc<data_clause_modifier none>, operandSegmentSizes = array<i32: 1, 1, 0, 0>, structured = true, varType = i32}> : (memref<8xi32>, memref<8xi32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<10xi32>) -> (), sym_name = "test_parallel_no_if"}> ({
  ^bb0(%arg0: memref<10xi32>):
    %0 = "arith.constant"() <{value = 0 : i32}> : () -> i32
    %1 = "arith.constant"() <{value = 1 : index}> : () -> index
    %2 = "arith.constant"() <{value = 10 : index}> : () -> index
    %3 = "acc.copyin"(%arg0) <{dataClause = #acc<data_clause acc_copyin>, implicit = false, modifiers = #acc<data_clause_modifier none>, operandSegmentSizes = array<i32: 1, 0, 0, 0>, structured = true, varType = i32}> : (memref<10xi32>) -> memref<10xi32>
    "acc.parallel"(%3) <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1>}> ({
      "scf.for"(%1, %2, %1) ({
      ^bb0(%arg1: index):
        "memref.store"(%0, %arg0, %arg1) : (i32, memref<10xi32>, index) -> ()
        "scf.yield"() : () -> ()
      }) : (index, index, index) -> ()
      "acc.yield"() : () -> ()
    }) : (memref<10xi32>) -> ()
    "acc.copyout"(%3, %arg0) <{dataClause = #acc<data_clause acc_copyout>, implicit = false, modifiers = #acc<data_clause_modifier none>, operandSegmentSizes = array<i32: 1, 1, 0, 0>, structured = true, varType = i32}> : (memref<10xi32>, memref<10xi32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "acc.private.recipe"() <{sym_name = "privatization_memref_i32", type = memref<i32>}> ({
  ^bb0(%arg7: memref<i32>):
    %16 = "memref.alloca"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<i32>
    "acc.yield"(%16) : (memref<i32>) -> ()
  }, {
  }) : () -> ()
  "acc.reduction.recipe"() <{reductionOperator = #acc.reduction_operator<add>, sym_name = "reduction_add_memref_f32", type = memref<f32>}> ({
  ^bb0(%arg6: memref<f32>):
    %14 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %15 = "memref.alloca"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<f32>
    "memref.store"(%14, %15) : (f32, memref<f32>) -> ()
    "acc.yield"(%15) : (memref<f32>) -> ()
  }, {
  ^bb0(%arg4: memref<f32>, %arg5: memref<f32>):
    %11 = "memref.load"(%arg4) : (memref<f32>) -> f32
    %12 = "memref.load"(%arg5) : (memref<f32>) -> f32
    %13 = "arith.addf"(%11, %12) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
    "memref.store"(%13, %arg4) : (f32, memref<f32>) -> ()
    "acc.yield"(%arg4) : (memref<f32>) -> ()
  }, {
  }) : () -> ()
  "func.func"() <{function_type = (memref<f32>, memref<8xf32>, i1) -> (), sym_name = "test_reduction_if"}> ({
  ^bb0(%arg0: memref<f32>, %arg1: memref<8xf32>, %arg2: i1):
    %0 = "arith.constant"() <{value = 8 : i32}> : () -> i32
    %1 = "arith.constant"() <{value = 1 : i32}> : () -> i32
    %2 = "acc.copyin"(%arg0) <{dataClause = #acc<data_clause acc_reduction>, implicit = true, modifiers = #acc<data_clause_modifier none>, operandSegmentSizes = array<i32: 1, 0, 0, 0>, structured = true, varType = f32}> : (memref<f32>) -> memref<f32>
    "acc.parallel"(%arg2, %2) <{combined, operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1>}> ({
      %3 = "acc.reduction"(%arg0) <{dataClause = #acc<data_clause acc_reduction>, implicit = false, modifiers = #acc<data_clause_modifier none>, operandSegmentSizes = array<i32: 1, 0, 0, 0>, recipe = @reduction_add_memref_f32, structured = true, varType = f32}> : (memref<f32>) -> memref<f32>
      %4 = "memref.alloca"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<i32>
      %5 = "acc.private"(%4) <{dataClause = #acc<data_clause acc_private>, implicit = false, modifiers = #acc<data_clause_modifier none>, operandSegmentSizes = array<i32: 1, 0, 0, 0>, recipe = @privatization_memref_i32, structured = true, varType = i32}> : (memref<i32>) -> memref<i32>
      "acc.loop"(%1, %0, %1, %5, %3) <{combined = #acc.combined_constructs<parallel_loop>, inclusiveUpperbound = array<i1: true>, independent = [#acc.device_type<none>], operandSegmentSizes = array<i32: 1, 1, 1, 0, 0, 0, 0, 0, 1, 0, 1>, vector = [#acc.device_type<none>]}> ({
      ^bb0(%arg3: i32):
        "memref.store"(%arg3, %5) : (i32, memref<i32>) -> ()
        %6 = "memref.load"(%5) : (memref<i32>) -> i32
        %7 = "arith.index_cast"(%6) : (i32) -> index
        %8 = "memref.load"(%arg1, %7) : (memref<8xf32>, index) -> f32
        %9 = "memref.load"(%arg0) : (memref<f32>) -> f32
        %10 = "arith.addf"(%9, %8) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
        "memref.store"(%10, %arg0) : (f32, memref<f32>) -> ()
        "acc.yield"() : () -> ()
      }) : (i32, i32, i32, memref<i32>, memref<f32>) -> ()
      "acc.yield"() : () -> ()
    }) : (i1, memref<f32>) -> ()
    "acc.copyout"(%2, %arg0) <{dataClause = #acc<data_clause acc_reduction>, implicit = true, modifiers = #acc<data_clause_modifier none>, operandSegmentSizes = array<i32: 1, 1, 0, 0>, structured = true, varType = f32}> : (memref<f32>, memref<f32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<10xi32>, i1) -> (), sym_name = "test_acc_var_replacement"}> ({
  ^bb0(%arg0: memref<10xi32>, %arg1: i1):
    %0 = "arith.constant"() <{value = 0 : i32}> : () -> i32
    %1 = "arith.constant"() <{value = 1 : index}> : () -> index
    %2 = "arith.constant"() <{value = 10 : index}> : () -> index
    %3 = "acc.copyin"(%arg0) <{dataClause = #acc<data_clause acc_copyin>, implicit = false, modifiers = #acc<data_clause_modifier none>, operandSegmentSizes = array<i32: 1, 0, 0, 0>, structured = true, varType = i32}> : (memref<10xi32>) -> memref<10xi32>
    "acc.parallel"(%arg1, %3) <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1>}> ({
      "scf.for"(%1, %2, %1) ({
      ^bb0(%arg2: index):
        "memref.store"(%0, %3, %arg2) : (i32, memref<10xi32>, index) -> ()
        "scf.yield"() : () -> ()
      }) : (index, index, index) -> ()
      "acc.yield"() : () -> ()
    }) : (i1, memref<10xi32>) -> ()
    "acc.copyout"(%3, %arg0) <{dataClause = #acc<data_clause acc_copyout>, implicit = false, modifiers = #acc<data_clause_modifier none>, operandSegmentSizes = array<i32: 1, 1, 0, 0>, structured = true, varType = i32}> : (memref<10xi32>, memref<10xi32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "acc.firstprivate.recipe"() <{sym_name = "memref_i32", type = memref<i32>}> ({
  ^bb0(%arg6: memref<i32>):
    %8 = "memref.alloca"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<i32>
    "acc.yield"(%8) : (memref<i32>) -> ()
  }, {
  ^bb0(%arg4: memref<i32>, %arg5: memref<i32>):
    %7 = "memref.load"(%arg4) : (memref<i32>) -> i32
    "memref.store"(%7, %arg5) : (i32, memref<i32>) -> ()
    "acc.terminator"() : () -> ()
  }, {
  }) : () -> ()
  "func.func"() <{function_type = (memref<10xi32>, memref<i32>, i1) -> (), sym_name = "test_acc_firstprivate"}> ({
  ^bb0(%arg0: memref<10xi32>, %arg1: memref<i32>, %arg2: i1):
    %0 = "arith.constant"() <{value = 0 : i32}> : () -> i32
    %1 = "arith.constant"() <{value = 1 : index}> : () -> index
    %2 = "arith.constant"() <{value = 10 : index}> : () -> index
    %3 = "acc.copyin"(%arg0) <{dataClause = #acc<data_clause acc_copyin>, implicit = false, modifiers = #acc<data_clause_modifier none>, operandSegmentSizes = array<i32: 1, 0, 0, 0>, structured = true, varType = i32}> : (memref<10xi32>) -> memref<10xi32>
    %4 = "acc.firstprivate"(%arg1) <{dataClause = #acc<data_clause acc_firstprivate>, implicit = false, modifiers = #acc<data_clause_modifier none>, operandSegmentSizes = array<i32: 1, 0, 0, 0>, recipe = @memref_i32, structured = true, varType = i32}> : (memref<i32>) -> memref<i32>
    "acc.parallel"(%arg2, %4, %3) <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, 1>}> ({
      %5 = "memref.load"(%4) : (memref<i32>) -> i32
      %6 = "arith.index_cast"(%5) : (i32) -> index
      "scf.for"(%1, %6, %1) ({
      ^bb0(%arg3: index):
        "memref.store"(%0, %3, %arg3) : (i32, memref<10xi32>, index) -> ()
        "scf.yield"() : () -> ()
      }) : (index, index, index) -> ()
      "acc.yield"() : () -> ()
    }) : (i1, memref<i32>, memref<10xi32>) -> ()
    "acc.copyout"(%3, %arg0) <{dataClause = #acc<data_clause acc_copyout>, implicit = false, modifiers = #acc<data_clause_modifier none>, operandSegmentSizes = array<i32: 1, 1, 0, 0>, structured = true, varType = i32}> : (memref<10xi32>, memref<10xi32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "acc.reduction.recipe"() <{reductionOperator = #acc.reduction_operator<add>, sym_name = "reduction_add_memref_i32", type = memref<i32>}> ({
  ^bb0(%arg7: memref<i32>):
    %10 = "arith.constant"() <{value = 0 : i32}> : () -> i32
    %11 = "memref.alloca"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<i32>
    "memref.store"(%10, %11) : (i32, memref<i32>) -> ()
    "acc.yield"(%11) : (memref<i32>) -> ()
  }, {
  ^bb0(%arg5: memref<i32>, %arg6: memref<i32>):
    %7 = "memref.load"(%arg6) : (memref<i32>) -> i32
    %8 = "memref.load"(%arg5) : (memref<i32>) -> i32
    %9 = "arith.addi"(%8, %7) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
    "memref.store"(%9, %arg5) : (i32, memref<i32>) -> ()
    "acc.yield"(%arg5) : (memref<i32>) -> ()
  }, {
  }) : () -> ()
  "func.func"() <{function_type = (memref<i32>, i1) -> (), sym_name = "test_acc_reduction"}> ({
  ^bb0(%arg3: memref<i32>, %arg4: i1):
    %3 = "arith.constant"() <{value = 0 : i32}> : () -> i32
    %4 = "acc.reduction"(%arg3) <{dataClause = #acc<data_clause acc_reduction>, implicit = false, modifiers = #acc<data_clause_modifier none>, operandSegmentSizes = array<i32: 1, 0, 0, 0>, recipe = @reduction_add_memref_i32, structured = true, varType = i32}> : (memref<i32>) -> memref<i32>
    "acc.parallel"(%arg4, %4) <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 1, 0, 1, 0, 0, 0>}> ({
      %5 = "memref.load"(%4) : (memref<i32>) -> i32
      %6 = "arith.addi"(%5, %3) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
      "memref.store"(%6, %4) : (i32, memref<i32>) -> ()
      "acc.yield"() : () -> ()
    }) : (i1, memref<i32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "acc.private.recipe"() <{sym_name = "privatization_memref_i32", type = memref<i32>}> ({
  ^bb0(%arg2: memref<i32>):
    %2 = "memref.alloca"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<i32>
    "acc.yield"(%2) : (memref<i32>) -> ()
  }, {
  }) : () -> ()
  "func.func"() <{function_type = (memref<i32>, i1) -> (), sym_name = "test_acc_private"}> ({
  ^bb0(%arg0: memref<i32>, %arg1: i1):
    %0 = "arith.constant"() <{value = 0 : i32}> : () -> i32
    %1 = "acc.private"(%arg0) <{dataClause = #acc<data_clause acc_private>, implicit = false, modifiers = #acc<data_clause_modifier none>, operandSegmentSizes = array<i32: 1, 0, 0, 0>, recipe = @privatization_memref_i32, structured = true, varType = i32}> : (memref<i32>) -> memref<i32>
    "acc.parallel"(%arg1, %1) <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0>}> ({
      "memref.store"(%0, %1) : (i32, memref<i32>) -> ()
      "acc.yield"() : () -> ()
    }) : (i1, memref<i32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<i32>, memref<i32>, i1) -> (), sym_name = "test_parallel_if_atomic_capture"}> ({
  ^bb0(%arg0: memref<i32>, %arg1: memref<i32>, %arg2: i1):
    %0 = "arith.constant"() <{value = 1 : i32}> : () -> i32
    "acc.parallel"(%arg2) <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0>}> ({
      "acc.atomic.capture"() ({
        "acc.atomic.update"(%arg0) ({
        ^bb0(%arg3: i32):
          %1 = "arith.addi"(%arg3, %0) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
          "acc.yield"(%1) : (i32) -> ()
        }) : (memref<i32>) -> ()
        "acc.atomic.read"(%arg0, %arg1) <{element_type = i32}> : (memref<i32>, memref<i32>) -> ()
        "acc.terminator"() : () -> ()
      }) : () -> ()
      "acc.yield"() : () -> ()
    }) : (i1) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<10xi32>, i1) -> (), sym_name = "test_kernels_if_shared_present"}> ({
  ^bb0(%arg0: memref<10xi32>, %arg1: i1):
    %0 = "arith.constant"() <{value = 0 : i32}> : () -> i32
    %1 = "arith.constant"() <{value = 0 : index}> : () -> index
    %2 = "arith.constant"() <{value = 1 : index}> : () -> index
    %3 = "arith.constant"() <{value = 10 : index}> : () -> index
    %4 = "acc.present"(%arg0) <{dataClause = #acc<data_clause acc_present>, implicit = false, modifiers = #acc<data_clause_modifier none>, operandSegmentSizes = array<i32: 1, 0, 0, 0>, structured = true, varType = i32}> : (memref<10xi32>) -> memref<10xi32>
    "acc.data"(%4) <{operandSegmentSizes = array<i32: 0, 0, 0, 1>}> ({
      "acc.kernels"(%arg1, %4) <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1>}> ({
        "scf.for"(%1, %3, %2) ({
        ^bb0(%arg2: index):
          "memref.store"(%0, %4, %arg2) : (i32, memref<10xi32>, index) -> ()
          "scf.yield"() : () -> ()
        }) : (index, index, index) -> ()
        "acc.terminator"() : () -> ()
      }) : (i1, memref<10xi32>) -> ()
      "acc.terminator"() : () -> ()
    }) : (memref<10xi32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<10xi32>, i1, i1) -> (), sym_name = "test_sibling_compute_shared_data"}> ({
  ^bb0(%arg0: memref<10xi32>, %arg1: i1, %arg2: i1):
    %0 = "arith.constant"() <{value = 0 : i32}> : () -> i32
    %1 = "arith.constant"() <{value = 0 : index}> : () -> index
    %2 = "acc.copyin"(%arg0) <{dataClause = #acc<data_clause acc_copyin>, implicit = false, modifiers = #acc<data_clause_modifier none>, operandSegmentSizes = array<i32: 1, 0, 0, 0>, structured = true, varType = i32}> : (memref<10xi32>) -> memref<10xi32>
    "acc.parallel"(%arg1, %2) <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1>}> ({
      "memref.store"(%0, %2, %1) : (i32, memref<10xi32>, index) -> ()
      "acc.yield"() : () -> ()
    }) : (i1, memref<10xi32>) -> ()
    "acc.serial"(%arg2, %2) <{operandSegmentSizes = array<i32: 0, 0, 1, 0, 0, 0, 0, 1>}> ({
      "memref.store"(%0, %2, %1) : (i32, memref<10xi32>, index) -> ()
      "acc.yield"() : () -> ()
    }) : (i1, memref<10xi32>) -> ()
    "acc.copyout"(%2, %arg0) <{dataClause = #acc<data_clause acc_copyout>, implicit = false, modifiers = #acc<data_clause_modifier none>, operandSegmentSizes = array<i32: 1, 1, 0, 0>, structured = true, varType = i32}> : (memref<10xi32>, memref<10xi32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<10xi32>, i1) -> (), sym_name = "test_duplicate_data_operand"}> ({
  ^bb0(%arg0: memref<10xi32>, %arg1: i1):
    %0 = "arith.constant"() <{value = 0 : i32}> : () -> i32
    %1 = "arith.constant"() <{value = 0 : index}> : () -> index
    %2 = "acc.copyin"(%arg0) <{dataClause = #acc<data_clause acc_copyin>, implicit = false, modifiers = #acc<data_clause_modifier none>, operandSegmentSizes = array<i32: 1, 0, 0, 0>, structured = true, varType = i32}> : (memref<10xi32>) -> memref<10xi32>
    "acc.parallel"(%arg1, %2, %2) <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 2>}> ({
      "memref.store"(%0, %2, %1) : (i32, memref<10xi32>, index) -> ()
      "acc.yield"() : () -> ()
    }) : (i1, memref<10xi32>, memref<10xi32>) -> ()
    "acc.copyout"(%2, %arg0) <{dataClause = #acc<data_clause acc_copyout>, implicit = false, modifiers = #acc<data_clause_modifier none>, operandSegmentSizes = array<i32: 1, 1, 0, 0>, structured = true, varType = i32}> : (memref<10xi32>, memref<10xi32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

