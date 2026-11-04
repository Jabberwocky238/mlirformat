"builtin.module"() ({
^bb0:
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "test_scalar_in_serial"}> ({
    %0 = "memref.alloca"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<i64>
    "acc.serial"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 0>}> ({
      %1 = "memref.load"(%0) : (memref<i64>) -> i64
      "acc.yield"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "test_scalar_in_parallel"}> ({
    %0 = "memref.alloca"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<f32>
    "acc.parallel"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0>}> ({
      %1 = "memref.load"(%0) : (memref<f32>) -> f32
      "acc.yield"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "test_scalar_in_kernels"}> ({
    %0 = "memref.alloca"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<f64>
    "acc.kernels"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0>}> ({
      %1 = "memref.load"(%0) : (memref<f64>) -> f64
      "acc.terminator"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "test_scalar_parallel_defaultnone"}> ({
    %0 = "memref.alloca"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<f32>
    "acc.parallel"() <{defaultAttr = #acc<defaultvalue none>, operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0>}> ({
      %1 = "memref.load"(%0) : (memref<f32>) -> f32
      "acc.yield"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "test_array_in_parallel"}> ({
    %0 = "memref.alloca"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<10xf32>
    "acc.parallel"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0>}> ({
      %1 = "arith.constant"() <{value = 0 : index}> : () -> index
      %2 = "memref.load"(%0, %1) : (memref<10xf32>, index) -> f32
      "acc.yield"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "test_array_in_kernels"}> ({
    %0 = "memref.alloca"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<20xi32>
    "acc.kernels"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0>}> ({
      %1 = "arith.constant"() <{value = 0 : index}> : () -> index
      %2 = "memref.load"(%0, %1) : (memref<20xi32>, index) -> i32
      "acc.terminator"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "test_array_parallel_defaultpresent"}> ({
    %0 = "memref.alloca"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<10xf32>
    "acc.parallel"() <{defaultAttr = #acc<defaultvalue present>, operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0>}> ({
      %1 = "arith.constant"() <{value = 0 : index}> : () -> index
      %2 = "memref.load"(%0, %1) : (memref<10xf32>, index) -> f32
      "acc.yield"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "test_scalar_parallel_defaultpresent"}> ({
    %0 = "memref.alloca"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<f32>
    "acc.parallel"() <{defaultAttr = #acc<defaultvalue present>, operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0>}> ({
      %1 = "memref.load"(%0) : (memref<f32>) -> f32
      "acc.yield"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "test_multidim_array_in_parallel"}> ({
    %0 = "memref.alloca"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<8x16xf32>
    "acc.parallel"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0>}> ({
      %1 = "arith.constant"() <{value = 0 : index}> : () -> index
      %2 = "arith.constant"() <{value = 1 : index}> : () -> index
      %3 = "memref.load"(%0, %1, %2) : (memref<8x16xf32>, index, index) -> f32
      "acc.yield"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (index) -> (), sym_name = "test_dynamic_array"}> ({
  ^bb0(%arg0: index):
    %0 = "memref.alloca"(%arg0) <{operandSegmentSizes = array<i32: 1, 0>}> : (index) -> memref<?xf64>
    "acc.parallel"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0>}> ({
      %1 = "arith.constant"() <{value = 0 : index}> : () -> index
      %2 = "memref.load"(%0, %1) : (memref<?xf64>, index) -> f64
      "acc.yield"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "test_with_explicit_copyin"}> ({
    %0 = "memref.alloca"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<100xf32>
    %1 = "acc.copyin"(%0) <{dataClause = #acc<data_clause acc_copyin>, implicit = false, modifiers = #acc<data_clause_modifier none>, name = "explicit", operandSegmentSizes = array<i32: 1, 0, 0, 0>, structured = true, varType = f32}> : (memref<100xf32>) -> memref<100xf32>
    "acc.parallel"(%1) <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1>}> ({
      %2 = "arith.constant"() <{value = 0 : index}> : () -> index
      %3 = "memref.load"(%0, %2) : (memref<100xf32>, index) -> f32
      "acc.yield"() : () -> ()
    }) : (memref<100xf32>) -> ()
    "acc.copyout"(%1, %0) <{dataClause = #acc<data_clause acc_copyout>, implicit = false, modifiers = #acc<data_clause_modifier none>, name = "explicit", operandSegmentSizes = array<i32: 1, 1, 0, 0>, structured = true, varType = f32}> : (memref<100xf32>, memref<100xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "test_multiple_variables"}> ({
    %0 = "memref.alloca"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<f32>
    %1 = "memref.alloca"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<10xi32>
    "acc.parallel"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0>}> ({
      %2 = "memref.load"(%0) : (memref<f32>) -> f32
      %3 = "arith.constant"() <{value = 0 : index}> : () -> index
      %4 = "memref.load"(%1, %3) : (memref<10xi32>, index) -> i32
      "acc.yield"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (index) -> (), sym_name = "test_memref_view"}> ({
  ^bb0(%arg0: index):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "memref.alloca"(%arg0) <{operandSegmentSizes = array<i32: 1, 0>}> : (index) -> memref<?xi8>
    %2 = "acc.copyin"(%1) <{dataClause = #acc<data_clause acc_copyin>, implicit = false, modifiers = #acc<data_clause_modifier none>, name = "buffer", operandSegmentSizes = array<i32: 1, 0, 0, 0>, structured = true, varType = i8}> : (memref<?xi8>) -> memref<?xi8>
    %3 = "memref.view"(%1, %0) : (memref<?xi8>, index) -> memref<8x64xf32>
    "acc.kernels"(%2) <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1>}> ({
      %4 = "arith.constant"() <{value = 0 : index}> : () -> index
      %5 = "arith.constant"() <{value = 0 : index}> : () -> index
      %6 = "memref.load"(%3, %4, %5) : (memref<8x64xf32>, index, index) -> f32
      "acc.terminator"() : () -> ()
    }) : (memref<?xi8>) -> ()
    "acc.copyout"(%2, %1) <{dataClause = #acc<data_clause acc_copyout>, implicit = false, modifiers = #acc<data_clause_modifier none>, name = "buffer", operandSegmentSizes = array<i32: 1, 1, 0, 0>, structured = true, varType = i8}> : (memref<?xi8>, memref<?xi8>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

