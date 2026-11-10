"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "vector_loop"}> ({
    %0 = "arith.constant"() <{value = 128 : index}> : () -> index
    "acc.kernel_environment"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0>}> ({
      %1 = "acc.par_width"(%0) <{par_dim = #acc.par_dim<thread_x>}> : (index) -> index
      "acc.compute_region"(%1) <{operandSegmentSizes = array<i32: 1, 0, 0>, origin = "acc.parallel"}> ({
      ^bb0(%arg0: index):
        %2 = "arith.constant"() <{value = 0 : index}> : () -> index
        %3 = "arith.constant"() <{value = 1 : index}> : () -> index
        %4 = "arith.constant"() <{value = 128 : index}> : () -> index
        "scf.parallel"(%2, %4, %3) <{operandSegmentSizes = array<i32: 1, 1, 1, 0>}> ({
        ^bb0(%arg1: index):
          "scf.reduce"() : () -> ()
        }) {acc.par_dims = #acc<par_dims[thread_x]>} : (index, index, index) -> ()
        "acc.yield"() : () -> ()
      }) : (index) -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "gang_loop"}> ({
    %0 = "arith.constant"() <{value = 8 : index}> : () -> index
    "acc.kernel_environment"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0>}> ({
      %1 = "acc.par_width"(%0) <{par_dim = #acc.par_dim<block_x>}> : (index) -> index
      "acc.compute_region"(%1) <{operandSegmentSizes = array<i32: 1, 0, 0>, origin = "acc.parallel"}> ({
      ^bb0(%arg0: index):
        %2 = "arith.constant"() <{value = 0 : index}> : () -> index
        %3 = "arith.constant"() <{value = 1 : index}> : () -> index
        %4 = "arith.constant"() <{value = 8 : index}> : () -> index
        "scf.parallel"(%2, %4, %3) <{operandSegmentSizes = array<i32: 1, 1, 1, 0>}> ({
        ^bb0(%arg1: index):
          "scf.reduce"() : () -> ()
        }) {acc.par_dims = #acc<par_dims[block_x]>} : (index, index, index) -> ()
        "acc.yield"() : () -> ()
      }) : (index) -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "worker_loop"}> ({
    %0 = "arith.constant"() <{value = 4 : index}> : () -> index
    "acc.kernel_environment"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0>}> ({
      %1 = "acc.par_width"(%0) <{par_dim = #acc.par_dim<thread_y>}> : (index) -> index
      "acc.compute_region"(%1) <{operandSegmentSizes = array<i32: 1, 0, 0>, origin = "acc.parallel"}> ({
      ^bb0(%arg0: index):
        %2 = "arith.constant"() <{value = 0 : index}> : () -> index
        %3 = "arith.constant"() <{value = 1 : index}> : () -> index
        %4 = "arith.constant"() <{value = 8 : index}> : () -> index
        "scf.parallel"(%2, %4, %3) <{operandSegmentSizes = array<i32: 1, 1, 1, 0>}> ({
        ^bb0(%arg1: index):
          "scf.reduce"() : () -> ()
        }) {acc.par_dims = #acc<par_dims[thread_y]>} : (index, index, index) -> ()
        "acc.yield"() : () -> ()
      }) : (index) -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "sequential_loop"}> ({
    "acc.kernel_environment"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0>}> ({
      "acc.compute_region"() <{operandSegmentSizes = array<i32: 0, 0, 0>, origin = "acc.kernels"}> ({
        %0 = "arith.constant"() <{value = 0 : index}> : () -> index
        %1 = "arith.constant"() <{value = 1 : index}> : () -> index
        %2 = "arith.constant"() <{value = 4 : index}> : () -> index
        "scf.parallel"(%0, %2, %1) <{operandSegmentSizes = array<i32: 1, 1, 1, 0>}> ({
        ^bb0(%arg0: index):
          "scf.reduce"() : () -> ()
        }) {acc.par_dims = #acc<par_dims[sequential]>} : (index, index, index) -> ()
        "acc.yield"() : () -> ()
      }) : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "block_and_vector"}> ({
    %0 = "arith.constant"() <{value = 8 : index}> : () -> index
    %1 = "arith.constant"() <{value = 128 : index}> : () -> index
    "acc.kernel_environment"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0>}> ({
      %2 = "acc.par_width"(%0) <{par_dim = #acc.par_dim<block_x>}> : (index) -> index
      %3 = "acc.par_width"(%1) <{par_dim = #acc.par_dim<thread_x>}> : (index) -> index
      "acc.compute_region"(%2, %3) <{operandSegmentSizes = array<i32: 2, 0, 0>, origin = "acc.parallel"}> ({
      ^bb0(%arg0: index, %arg1: index):
        %4 = "arith.constant"() <{value = 0 : index}> : () -> index
        %5 = "arith.constant"() <{value = 1 : index}> : () -> index
        %6 = "arith.constant"() <{value = 8 : index}> : () -> index
        %7 = "arith.constant"() <{value = 128 : index}> : () -> index
        "scf.parallel"(%4, %4, %6, %7, %5, %5) <{operandSegmentSizes = array<i32: 2, 2, 2, 0>}> ({
        ^bb0(%arg2: index, %arg3: index):
          "scf.reduce"() : () -> ()
        }) {acc.par_dims = #acc<par_dims[block_x, thread_x]>} : (index, index, index, index, index, index) -> ()
        "acc.yield"() : () -> ()
      }) : (index, index) -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "scf_for_sequential"}> ({
    "acc.kernel_environment"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0>}> ({
      "acc.compute_region"() <{operandSegmentSizes = array<i32: 0, 0, 0>, origin = "acc.parallel"}> ({
        %0 = "arith.constant"() <{value = 0 : index}> : () -> index
        %1 = "arith.constant"() <{value = 1 : index}> : () -> index
        %2 = "arith.constant"() <{value = 4 : index}> : () -> index
        "scf.for"(%0, %2, %1) ({
        ^bb0(%arg0: index):
          "scf.yield"() : () -> ()
        }) : (index, index, index) -> ()
        "acc.yield"() : () -> ()
      }) : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "collapse_loop"}> ({
    "acc.kernel_environment"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0>}> ({
      "acc.compute_region"() <{operandSegmentSizes = array<i32: 0, 0, 0>, origin = "acc.parallel"}> ({
        %0 = "arith.constant"() <{value = 0 : index}> : () -> index
        %1 = "arith.constant"() <{value = 1 : index}> : () -> index
        %2 = "arith.constant"() <{value = 4 : index}> : () -> index
        "scf.for"(%0, %2, %1) ({
        ^bb0(%arg0: index):
          "scf.yield"() : () -> ()
        }) {acc.collapse_count = 2 : i64, acc.par_dims = #acc<par_dims[sequential]>} : (index, index, index) -> ()
        "acc.yield"() : () -> ()
      }) : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "percent_separator"}> ({
    %0 = "arith.constant"() <{value = 128 : index}> : () -> index
    "acc.kernel_environment"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0>}> ({
      %1 = "acc.par_width"(%0) <{par_dim = #acc.par_dim<thread_x>}> : (index) -> index
      "acc.compute_region"(%1) <{operandSegmentSizes = array<i32: 1, 0, 0>, origin = "acc.parallel"}> ({
      ^bb0(%arg0: index):
        %2 = "arith.constant"() <{value = 0 : index}> : () -> index
        %3 = "arith.constant"() <{value = 1 : index}> : () -> index
        %4 = "arith.constant"() <{value = 128 : index}> : () -> index
        "scf.parallel"(%2, %4, %3) <{operandSegmentSizes = array<i32: 1, 1, 1, 0>}> ({
        ^bb0(%arg1: index):
          "scf.reduce"() : () -> ()
        }) {acc.par_dims = #acc<par_dims[thread_x]>} : (index, index, index) -> ()
        "acc.yield"() : () -> ()
      }) : (index) -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

