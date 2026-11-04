"builtin.module"() ({
  "func.func"() <{function_type = (memref<10xf32>, index) -> (), sym_name = "test"}> ({
  ^bb0(%arg0: memref<10xf32>, %arg1: index):
    %0 = "acc.create"(%arg0) <{dataClause = #acc<data_clause acc_create>, implicit = false, modifiers = #acc<data_clause_modifier none>, operandSegmentSizes = array<i32: 1, 0, 0, 0>, structured = true, varType = tensor<10xf32>}> : (memref<10xf32>) -> memref<10xf32>
    "acc.parallel"(%0) <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1>}> ({
      %1 = "memref.load"(%arg0, %arg1) : (memref<10xf32>, index) -> f32
      "acc.yield"() : () -> ()
    }) : (memref<10xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<10xf32>, index) -> (), sym_name = "test"}> ({
  ^bb0(%arg0: memref<10xf32>, %arg1: index):
    %0 = "acc.create"(%arg0) <{dataClause = #acc<data_clause acc_create>, implicit = false, modifiers = #acc<data_clause_modifier none>, operandSegmentSizes = array<i32: 1, 0, 0, 0>, structured = true, varType = tensor<10xf32>}> : (memref<10xf32>) -> memref<10xf32>
    "acc.serial"(%0) <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 1>}> ({
      %1 = "memref.load"(%arg0, %arg1) : (memref<10xf32>, index) -> f32
      "acc.yield"() : () -> ()
    }) : (memref<10xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<10xf32>, index) -> (), sym_name = "test"}> ({
  ^bb0(%arg0: memref<10xf32>, %arg1: index):
    %0 = "acc.create"(%arg0) <{dataClause = #acc<data_clause acc_create>, implicit = false, modifiers = #acc<data_clause_modifier none>, operandSegmentSizes = array<i32: 1, 0, 0, 0>, structured = true, varType = tensor<10xf32>}> : (memref<10xf32>) -> memref<10xf32>
    "acc.kernels"(%0) <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1>}> ({
      %1 = "memref.load"(%arg0, %arg1) : (memref<10xf32>, index) -> f32
      "acc.terminator"() : () -> ()
    }) : (memref<10xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<10xf32>, index) -> (), sym_name = "test"}> ({
  ^bb0(%arg0: memref<10xf32>, %arg1: index):
    %0 = "acc.create"(%arg0) <{dataClause = #acc<data_clause acc_create>, implicit = false, modifiers = #acc<data_clause_modifier none>, operandSegmentSizes = array<i32: 1, 0, 0, 0>, structured = true, varType = tensor<10xf32>}> : (memref<10xf32>) -> memref<10xf32>
    "acc.data"(%0) <{operandSegmentSizes = array<i32: 0, 0, 0, 1>}> ({
      %1 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
      "memref.store"(%1, %arg0, %arg1) : (f32, memref<10xf32>, index) -> ()
      "acc.serial"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 0>}> ({
        %2 = "memref.load"(%arg0, %arg1) : (memref<10xf32>, index) -> f32
        "acc.yield"() : () -> ()
      }) : () -> ()
      "acc.terminator"() : () -> ()
    }) : (memref<10xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<10xf32>) -> (), sym_name = "test"}> ({
  ^bb0(%arg0: memref<10xf32>):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = 1 : index}> : () -> index
    %2 = "arith.constant"() <{value = 10 : index}> : () -> index
    %3 = "acc.create"(%arg0) <{dataClause = #acc<data_clause acc_create>, implicit = false, modifiers = #acc<data_clause_modifier none>, operandSegmentSizes = array<i32: 1, 0, 0, 0>, structured = true, varType = tensor<10xf32>}> : (memref<10xf32>) -> memref<10xf32>
    "acc.parallel"(%3) <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1>}> ({
      "acc.loop"(%0, %2, %1) <{independent = [#acc.device_type<none>], operandSegmentSizes = array<i32: 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0>}> ({
      ^bb0(%arg1: index):
        %4 = "memref.load"(%arg0, %arg1) : (memref<10xf32>, index) -> f32
        "acc.yield"() : () -> ()
      }) : (index, index, index) -> ()
      "acc.yield"() : () -> ()
    }) : (memref<10xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "acc.private.recipe"() <{sym_name = "privatization_memref_10_f32", type = memref<10xf32>}> ({
  ^bb0(%arg3: memref<10xf32>):
    %5 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<10xf32>
    "acc.yield"(%5) : (memref<10xf32>) -> ()
  }, {
  ^bb0(%arg2: memref<10xf32>):
    "memref.dealloc"(%arg2) : (memref<10xf32>) -> ()
    "acc.terminator"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<10xf32>) -> (), sym_name = "test"}> ({
  ^bb0(%arg0: memref<10xf32>):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = 1 : index}> : () -> index
    %2 = "arith.constant"() <{value = 10 : index}> : () -> index
    %3 = "acc.private"(%arg0) <{dataClause = #acc<data_clause acc_private>, implicit = false, modifiers = #acc<data_clause_modifier none>, operandSegmentSizes = array<i32: 1, 0, 0, 0>, recipe = @privatization_memref_10_f32, structured = true, varType = tensor<10xf32>}> : (memref<10xf32>) -> memref<10xf32>
    "acc.parallel"(%3) <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0>}> ({
      "acc.loop"(%0, %2, %1) <{independent = [#acc.device_type<none>], operandSegmentSizes = array<i32: 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0>}> ({
      ^bb0(%arg1: index):
        %4 = "memref.load"(%arg0, %arg1) : (memref<10xf32>, index) -> f32
        "acc.yield"() : () -> ()
      }) : (index, index, index) -> ()
      "acc.yield"() : () -> ()
    }) : (memref<10xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "acc.private.recipe"() <{sym_name = "privatization_memref_10_f32", type = memref<10xf32>}> ({
  ^bb0(%arg3: memref<10xf32>):
    %5 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<10xf32>
    "acc.yield"(%5) : (memref<10xf32>) -> ()
  }, {
  ^bb0(%arg2: memref<10xf32>):
    "memref.dealloc"(%arg2) : (memref<10xf32>) -> ()
    "acc.terminator"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<10xf32>) -> (), sym_name = "test"}> ({
  ^bb0(%arg0: memref<10xf32>):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = 1 : index}> : () -> index
    %2 = "arith.constant"() <{value = 10 : index}> : () -> index
    %3 = "acc.private"(%arg0) <{dataClause = #acc<data_clause acc_private>, implicit = false, modifiers = #acc<data_clause_modifier none>, operandSegmentSizes = array<i32: 1, 0, 0, 0>, recipe = @privatization_memref_10_f32, structured = true, varType = tensor<10xf32>}> : (memref<10xf32>) -> memref<10xf32>
    "acc.parallel"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0>}> ({
      "acc.loop"(%0, %2, %1, %3) <{independent = [#acc.device_type<none>], operandSegmentSizes = array<i32: 1, 1, 1, 0, 0, 0, 0, 0, 1, 0, 0>}> ({
      ^bb0(%arg1: index):
        %4 = "memref.load"(%arg0, %arg1) : (memref<10xf32>, index) -> f32
        "acc.yield"() : () -> ()
      }) : (index, index, index, memref<10xf32>) -> ()
      "acc.yield"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "acc.private.recipe"() <{sym_name = "privatization_memref_10_f32", type = memref<10xf32>}> ({
  ^bb0(%arg3: memref<10xf32>):
    %5 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<10xf32>
    "acc.yield"(%5) : (memref<10xf32>) -> ()
  }, {
  ^bb0(%arg2: memref<10xf32>):
    "memref.dealloc"(%arg2) : (memref<10xf32>) -> ()
    "acc.terminator"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<10xf32>) -> (), sym_name = "test"}> ({
  ^bb0(%arg0: memref<10xf32>):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = 1 : index}> : () -> index
    %2 = "arith.constant"() <{value = 10 : index}> : () -> index
    %3 = "acc.private"(%arg0) <{dataClause = #acc<data_clause acc_private>, implicit = false, modifiers = #acc<data_clause_modifier none>, operandSegmentSizes = array<i32: 1, 0, 0, 0>, recipe = @privatization_memref_10_f32, structured = true, varType = tensor<10xf32>}> : (memref<10xf32>) -> memref<10xf32>
    "acc.serial"(%3) <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 1, 0, 0>}> ({
      "acc.loop"(%0, %2, %1) <{operandSegmentSizes = array<i32: 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0>, seq = [#acc.device_type<none>]}> ({
      ^bb0(%arg1: index):
        %4 = "memref.load"(%arg0, %arg1) : (memref<10xf32>, index) -> f32
        "acc.yield"() : () -> ()
      }) : (index, index, index) -> ()
      "acc.yield"() : () -> ()
    }) : (memref<10xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<10xf32>) -> (), sym_name = "test"}> ({
  ^bb0(%arg0: memref<10xf32>):
    %0 = "acc.use_device"(%arg0) <{dataClause = #acc<data_clause acc_use_device>, implicit = false, modifiers = #acc<data_clause_modifier none>, operandSegmentSizes = array<i32: 1, 0, 0, 0>, structured = true, varType = tensor<10xf32>}> : (memref<10xf32>) -> memref<10xf32>
    "acc.host_data"(%0) <{operandSegmentSizes = array<i32: 0, 1>}> ({
      "func.call"(%arg0) <{callee = @foo}> : (memref<10xf32>) -> ()
      "acc.terminator"() : () -> ()
    }) : (memref<10xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<10xf32>) -> (), sym_name = "foo", sym_visibility = "private"}> ({
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<10xf32>) -> (), sym_name = "test"}> ({
  ^bb0(%arg0: memref<10xf32>):
    %0 = "acc.create"(%arg0) <{dataClause = #acc<data_clause acc_create>, implicit = false, modifiers = #acc<data_clause_modifier none>, name = "arr", operandSegmentSizes = array<i32: 1, 0, 0, 0>, structured = true, varType = tensor<10xf32>}> : (memref<10xf32>) -> memref<10xf32>
    %1 = "acc.declare_enter"(%0) : (memref<10xf32>) -> !acc.declare_token
    "acc.kernels"(%0) <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1>}> ({
      %2 = "arith.constant"() <{value = 0 : index}> : () -> index
      %3 = "arith.constant"() <{value = 1.000000e+00 : f32}> : () -> f32
      "memref.store"(%3, %arg0, %2) : (f32, memref<10xf32>, index) -> ()
      "acc.terminator"() : () -> ()
    }) : (memref<10xf32>) -> ()
    "acc.declare_exit"(%1, %0) <{operandSegmentSizes = array<i32: 1, 1>}> : (!acc.declare_token, memref<10xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

