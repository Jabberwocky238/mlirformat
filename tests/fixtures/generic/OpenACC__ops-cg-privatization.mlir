"builtin.module"() ({
^bb0:
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "privatize_static_scalar"}> ({
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = 1 : index}> : () -> index
    %2 = "arith.constant"() <{value = 128 : index}> : () -> index
    %3 = "acc.privatize"() : () -> !acc.private_type<memref<f32>>
    "scf.parallel"(%0, %2, %1) <{operandSegmentSizes = array<i32: 1, 1, 1, 0>}> ({
    ^bb0(%arg0: index):
      %4 = "acc.private_local"(%3) : (!acc.private_type<memref<f32>>) -> memref<f32>
      %5 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
      "memref.store"(%5, %4) : (f32, memref<f32>) -> ()
      "scf.reduce"() : () -> ()
    }) {acc.par_dims = #acc<par_dims[thread_x]>} : (index, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "privatize_with_par_dims_attr"}> ({
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = 1 : index}> : () -> index
    %2 = "arith.constant"() <{value = 8 : index}> : () -> index
    %3 = "arith.constant"() <{value = 128 : index}> : () -> index
    %4 = "acc.privatize"() <{par_dims = #acc<par_dims[block_x, thread_x]>}> : () -> !acc.private_type<memref<i32>>
    "scf.parallel"(%0, %0, %2, %3, %1, %1) <{operandSegmentSizes = array<i32: 2, 2, 2, 0>}> ({
    ^bb0(%arg0: index, %arg1: index):
      %5 = "acc.private_local"(%4) : (!acc.private_type<memref<i32>>) -> memref<i32>
      %6 = "arith.constant"() <{value = 0 : i32}> : () -> i32
      "memref.store"(%6, %5) : (i32, memref<i32>) -> ()
      "scf.reduce"() : () -> ()
    }) {acc.par_dims = #acc<par_dims[block_x, thread_x]>} : (index, index, index, index, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (index) -> (), sym_name = "privatize_dynamic_row"}> ({
  ^bb0(%arg0: index):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = 1 : index}> : () -> index
    %2 = "arith.constant"() <{value = 32 : index}> : () -> index
    %3 = "acc.privatize"(%arg0) : (index) -> !acc.private_type<memref<?xf32>>
    "scf.parallel"(%0, %2, %1) <{operandSegmentSizes = array<i32: 1, 1, 1, 0>}> ({
    ^bb0(%arg1: index):
      %4 = "acc.private_local"(%3) : (!acc.private_type<memref<?xf32>>) -> memref<?xf32>
      %5 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
      "memref.store"(%5, %4, %0) : (f32, memref<?xf32>, index) -> ()
      "scf.reduce"() : () -> ()
    }) {acc.par_dims = #acc<par_dims[thread_x]>} : (index, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (index, index) -> (), sym_name = "privatize_dynamic_and_par_dims"}> ({
  ^bb0(%arg0: index, %arg1: index):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = 1 : index}> : () -> index
    %2 = "arith.constant"() <{value = 4 : index}> : () -> index
    %3 = "arith.constant"() <{value = 16 : index}> : () -> index
    %4 = "acc.privatize"(%arg0, %arg1) <{par_dims = #acc<par_dims[block_x, thread_x]>}> : (index, index) -> !acc.private_type<memref<?x?xi32>>
    "scf.parallel"(%0, %0, %2, %3, %1, %1) <{operandSegmentSizes = array<i32: 2, 2, 2, 0>}> ({
    ^bb0(%arg2: index, %arg3: index):
      %5 = "acc.private_local"(%4) : (!acc.private_type<memref<?x?xi32>>) -> memref<?x?xi32>
      %6 = "arith.constant"() <{value = 0 : i32}> : () -> i32
      "memref.store"(%6, %5, %0, %0) : (i32, memref<?x?xi32>, index, index) -> ()
      "scf.reduce"() : () -> ()
    }) {acc.par_dims = #acc<par_dims[block_x, thread_x]>} : (index, index, index, index, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<64xf32>) -> (), sym_name = "privatize_inside_compute_region"}> ({
  ^bb0(%arg0: memref<64xf32>):
    %0 = "acc.copyin"(%arg0) <{dataClause = #acc<data_clause acc_copyin>, implicit = false, modifiers = #acc<data_clause_modifier none>, operandSegmentSizes = array<i32: 1, 0, 0, 0>, structured = true, varType = f32}> : (memref<64xf32>) -> memref<64xf32>
    "acc.kernel_environment"(%0) <{operandSegmentSizes = array<i32: 1, 0, 0, 0>}> ({
      %1 = "arith.constant"() <{value = 64 : index}> : () -> index
      %2 = "acc.par_width"(%1) <{par_dim = #acc.par_dim<thread_x>}> : (index) -> index
      "acc.compute_region"(%2, %0) <{operandSegmentSizes = array<i32: 1, 1, 0>, origin = "acc.parallel"}> ({
      ^bb0(%arg1: index, %arg2: memref<64xf32>):
        %3 = "acc.privatize"() <{par_dims = #acc<par_dims[thread_x]>}> : () -> !acc.private_type<memref<f32>>
        %4 = "arith.constant"() <{value = 0 : index}> : () -> index
        %5 = "arith.constant"() <{value = 1 : index}> : () -> index
        %6 = "arith.constant"() <{value = 64 : index}> : () -> index
        "scf.parallel"(%4, %6, %5) <{operandSegmentSizes = array<i32: 1, 1, 1, 0>}> ({
        ^bb0(%arg3: index):
          %7 = "acc.private_local"(%3) : (!acc.private_type<memref<f32>>) -> memref<f32>
          %8 = "memref.load"(%arg2, %arg3) : (memref<64xf32>, index) -> f32
          "memref.store"(%8, %7) : (f32, memref<f32>) -> ()
          "scf.reduce"() : () -> ()
        }) {acc.par_dims = #acc<par_dims[thread_x]>} : (index, index, index) -> ()
        "acc.yield"() : () -> ()
      }) : (index, memref<64xf32>) -> ()
    }) : (memref<64xf32>) -> ()
    "acc.delete"(%0) <{dataClause = #acc<data_clause acc_delete>, implicit = false, modifiers = #acc<data_clause_modifier none>, operandSegmentSizes = array<i32: 1, 0, 0>, structured = true}> : (memref<64xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "unwrap_private_to_memref"}> ({
    %0 = "acc.privatize"() : () -> !acc.private_type<memref<i32>>
    %1 = "acc.unwrap_private"(%0) : (!acc.private_type<memref<i32>>) -> memref<i32>
    %2 = "arith.constant"() <{value = 0 : i32}> : () -> i32
    "memref.store"(%2, %1) : (i32, memref<i32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "unwrap_private_to_byte_memref"}> ({
    %0 = "acc.privatize"() : () -> !acc.private_type<memref<f64>>
    %1 = "acc.unwrap_private"(%0) : (!acc.private_type<memref<f64>>) -> memref<?xi8>
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

