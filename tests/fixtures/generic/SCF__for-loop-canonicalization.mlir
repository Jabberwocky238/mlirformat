#map = affine_map<(d0, d1) -> (2, d1 - d0)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<i64>) -> (), sym_name = "scf_for_canonicalize_min"}> ({
  ^bb0(%arg0: memref<i64>):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = 2 : index}> : () -> index
    %2 = "arith.constant"() <{value = 4 : index}> : () -> index
    "scf.for"(%0, %2, %1) ({
    ^bb0(%arg1: index):
      %3 = "affine.min"(%arg1, %2) <{map = #map}> : (index, index) -> index
      %4 = "arith.index_cast"(%3) : (index) -> i64
      "memref.store"(%4, %arg0) : (i64, memref<i64>) -> ()
      "scf.yield"() : () -> ()
    }) : (index, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1) -> (-2, -(d1 - d0))>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<i64>) -> (), sym_name = "scf_for_canonicalize_max"}> ({
  ^bb0(%arg0: memref<i64>):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = 2 : index}> : () -> index
    %2 = "arith.constant"() <{value = 4 : index}> : () -> index
    "scf.for"(%0, %2, %1) ({
    ^bb0(%arg1: index):
      %3 = "affine.max"(%arg1, %2) <{map = #map}> : (index, index) -> index
      %4 = "arith.index_cast"(%3) : (index) -> i64
      "memref.store"(%4, %arg0) : (i64, memref<i64>) -> ()
      "scf.yield"() : () -> ()
    }) : (index, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1) -> (-2, -(d1 - d0))>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<i64>) -> (), sym_name = "scf_for_max_not_canonicalizable"}> ({
  ^bb0(%arg0: memref<i64>):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = 2 : index}> : () -> index
    %2 = "arith.constant"() <{value = 3 : index}> : () -> index
    %3 = "arith.constant"() <{value = 4 : index}> : () -> index
    "scf.for"(%0, %3, %1) ({
    ^bb0(%arg1: index):
      %4 = "affine.max"(%arg1, %2) <{map = #map}> : (index, index) -> index
      %5 = "arith.index_cast"(%4) : (index) -> i64
      "memref.store"(%5, %arg0) : (i64, memref<i64>) -> ()
      "scf.yield"() : () -> ()
    }) : (index, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2, d3) -> (5, d1 + d3 - d0 - d2)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<i64>) -> (), sym_name = "scf_for_loop_nest_canonicalize_min"}> ({
  ^bb0(%arg0: memref<i64>):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = 2 : index}> : () -> index
    %2 = "arith.constant"() <{value = 3 : index}> : () -> index
    %3 = "arith.constant"() <{value = 4 : index}> : () -> index
    %4 = "arith.constant"() <{value = 6 : index}> : () -> index
    "scf.for"(%0, %3, %1) ({
    ^bb0(%arg1: index):
      "scf.for"(%0, %4, %2) ({
      ^bb0(%arg2: index):
        %5 = "affine.min"(%arg1, %3, %arg2, %4) <{map = #map}> : (index, index, index, index) -> index
        %6 = "arith.index_cast"(%5) : (index) -> i64
        "memref.store"(%6, %arg0) : (i64, memref<i64>) -> ()
        "scf.yield"() : () -> ()
      }) : (index, index, index) -> ()
      "scf.yield"() : () -> ()
    }) : (index, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0)[s0] -> (2, -d0 + s0)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<i64>) -> (), sym_name = "scf_for_not_canonicalizable_1"}> ({
  ^bb0(%arg0: memref<i64>):
    %0 = "arith.constant"() <{value = 1 : index}> : () -> index
    %1 = "arith.constant"() <{value = 2 : index}> : () -> index
    %2 = "arith.constant"() <{value = 4 : index}> : () -> index
    "scf.for"(%0, %2, %1) ({
    ^bb0(%arg1: index):
      %3 = "affine.min"(%arg1, %2) <{map = #map}> : (index, index) -> index
      %4 = "arith.index_cast"(%3) : (index) -> i64
      "memref.store"(%4, %arg0) : (i64, memref<i64>) -> ()
      "scf.yield"() : () -> ()
    }) : (index, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0) -> (256, -d0 + 256)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<i64>) -> (), sym_name = "scf_for_canonicalize_partly"}> ({
  ^bb0(%arg0: memref<i64>):
    %0 = "arith.constant"() <{value = 1 : index}> : () -> index
    %1 = "arith.constant"() <{value = 16 : index}> : () -> index
    %2 = "arith.constant"() <{value = 256 : index}> : () -> index
    "scf.for"(%0, %2, %1) ({
    ^bb0(%arg1: index):
      %3 = "affine.min"(%arg1) <{map = #map}> : (index) -> index
      %4 = "arith.index_cast"(%3) : (index) -> i64
      "memref.store"(%4, %arg0) : (i64, memref<i64>) -> ()
      "scf.yield"() : () -> ()
    }) : (index, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0) -> (d0 * 42)>
#map1 = affine_map<(d0, d1, d2) -> (d0, d1 - d2)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<i64>, index) -> (), sym_name = "scf_for_not_canonicalizable_2"}> ({
  ^bb0(%arg0: memref<i64>, %arg1: index):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "affine.apply"(%arg1) <{map = #map}> : (index) -> index
    "scf.for"(%0, %1, %arg1) ({
    ^bb0(%arg2: index):
      %2 = "affine.min"(%arg1, %1, %arg2) <{map = #map1}> : (index, index, index) -> index
      %3 = "arith.index_cast"(%2) : (index) -> i64
      "memref.store"(%3, %arg0) : (i64, memref<i64>) -> ()
      "scf.yield"() : () -> ()
    }) : (index, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0)[s0] -> (d0 * s0)>
#map1 = affine_map<(d0, d1, d2) -> (d0, d2 - d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<i64>, index) -> (), sym_name = "scf_for_not_canonicalizable_3"}> ({
  ^bb0(%arg0: memref<i64>, %arg1: index):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "affine.apply"(%arg1, %arg1) <{map = #map}> : (index, index) -> index
    "scf.for"(%0, %1, %arg1) ({
    ^bb0(%arg2: index):
      %2 = "affine.min"(%arg1, %arg2, %1) <{map = #map1}> : (index, index, index) -> index
      %3 = "arith.index_cast"(%2) : (index) -> i64
      "memref.store"(%3, %arg0) : (i64, memref<i64>) -> ()
      "scf.yield"() : () -> ()
    }) : (index, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0)[s0] -> (d0 + s0, 0)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<i64>, index) -> (), sym_name = "scf_for_invalid_loop"}> ({
  ^bb0(%arg0: memref<i64>, %arg1: index):
    %0 = "arith.constant"() <{value = 1 : index}> : () -> index
    %1 = "arith.constant"() <{value = 7 : index}> : () -> index
    %2 = "arith.constant"() <{value = 256 : index}> : () -> index
    "scf.for"(%2, %0, %0) ({
    ^bb0(%arg2: index):
      %3 = "affine.min"(%arg2, %1) <{map = #map}> : (index, index) -> index
      %4 = "arith.index_cast"(%3) : (index) -> i64
      "memref.store"(%4, %arg0) : (i64, memref<i64>) -> ()
      "scf.yield"() : () -> ()
    }) : (index, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1) -> (2, d1 - d0)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<i64>) -> (), sym_name = "scf_parallel_canonicalize_min_1"}> ({
  ^bb0(%arg0: memref<i64>):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = 2 : index}> : () -> index
    %2 = "arith.constant"() <{value = 4 : index}> : () -> index
    "scf.parallel"(%0, %2, %1) <{operandSegmentSizes = array<i32: 1, 1, 1, 0>}> ({
    ^bb0(%arg1: index):
      %3 = "affine.min"(%arg1, %2) <{map = #map}> : (index, index) -> index
      %4 = "arith.index_cast"(%3) : (index) -> i64
      "memref.store"(%4, %arg0) : (i64, memref<i64>) -> ()
      "scf.reduce"() : () -> ()
    }) : (index, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0)[s0] -> (2, -d0 + s0)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<i64>) -> (), sym_name = "scf_parallel_canonicalize_min_2"}> ({
  ^bb0(%arg0: memref<i64>):
    %0 = "arith.constant"() <{value = 1 : index}> : () -> index
    %1 = "arith.constant"() <{value = 2 : index}> : () -> index
    %2 = "arith.constant"() <{value = 7 : index}> : () -> index
    "scf.parallel"(%0, %2, %1) <{operandSegmentSizes = array<i32: 1, 1, 1, 0>}> ({
    ^bb0(%arg1: index):
      %3 = "affine.min"(%arg1, %2) <{map = #map}> : (index, index) -> index
      %4 = "arith.index_cast"(%3) : (index) -> i64
      "memref.store"(%4, %arg0) : (i64, memref<i64>) -> ()
      "scf.reduce"() : () -> ()
    }) : (index, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x?xf32>) -> index, sym_name = "tensor_dim_of_iter_arg"}> ({
  ^bb0(%arg0: tensor<?x?xf32>):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = 1 : index}> : () -> index
    %2 = "arith.constant"() <{value = 10 : index}> : () -> index
    %3:2 = "scf.for"(%0, %2, %1, %arg0, %0) ({
    ^bb0(%arg1: index, %arg2: tensor<?x?xf32>, %arg3: index):
      %4 = "tensor.dim"(%arg2, %0) : (tensor<?x?xf32>, index) -> index
      "scf.yield"(%arg2, %4) : (tensor<?x?xf32>, index) -> ()
    }) : (index, index, index, tensor<?x?xf32>, index) -> (tensor<?x?xf32>, index)
    "func.return"(%3#1) : (index) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x?xf32>, tensor<10x10xf32>) -> index, sym_name = "tensor_dim_of_iter_arg_insertslice"}> ({
  ^bb0(%arg0: tensor<?x?xf32>, %arg1: tensor<10x10xf32>):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = 1 : index}> : () -> index
    %2 = "arith.constant"() <{value = 10 : index}> : () -> index
    %3:2 = "scf.for"(%0, %2, %1, %arg0, %0) ({
    ^bb0(%arg2: index, %arg3: tensor<?x?xf32>, %arg4: index):
      %4 = "tensor.dim"(%arg3, %0) : (tensor<?x?xf32>, index) -> index
      %5 = "tensor.insert_slice"(%arg1, %arg3) <{operandSegmentSizes = array<i32: 1, 1, 0, 0, 0>, static_offsets = array<i64: 0, 0>, static_sizes = array<i64: 10, 10>, static_strides = array<i64: 1, 1>}> : (tensor<10x10xf32>, tensor<?x?xf32>) -> tensor<?x?xf32>
      %6 = "tensor.insert_slice"(%arg1, %5) <{operandSegmentSizes = array<i32: 1, 1, 0, 0, 0>, static_offsets = array<i64: 1, 1>, static_sizes = array<i64: 10, 10>, static_strides = array<i64: 1, 1>}> : (tensor<10x10xf32>, tensor<?x?xf32>) -> tensor<?x?xf32>
      "scf.yield"(%6, %4) : (tensor<?x?xf32>, index) -> ()
    }) : (index, index, index, tensor<?x?xf32>, index) -> (tensor<?x?xf32>, index)
    "func.return"(%3#1) : (index) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x?xf32>, tensor<10x10xf32>) -> index, sym_name = "tensor_dim_of_iter_arg_nested_for"}> ({
  ^bb0(%arg0: tensor<?x?xf32>, %arg1: tensor<10x10xf32>):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = 1 : index}> : () -> index
    %2 = "arith.constant"() <{value = 10 : index}> : () -> index
    %3:2 = "scf.for"(%0, %2, %1, %arg0, %0) ({
    ^bb0(%arg2: index, %arg3: tensor<?x?xf32>, %arg4: index):
      %4:2 = "scf.for"(%0, %2, %1, %arg3, %arg4) ({
      ^bb0(%arg5: index, %arg6: tensor<?x?xf32>, %arg7: index):
        %5 = "tensor.dim"(%arg6, %0) : (tensor<?x?xf32>, index) -> index
        %6 = "tensor.insert_slice"(%arg1, %arg6) <{operandSegmentSizes = array<i32: 1, 1, 0, 0, 0>, static_offsets = array<i64: 0, 0>, static_sizes = array<i64: 10, 10>, static_strides = array<i64: 1, 1>}> : (tensor<10x10xf32>, tensor<?x?xf32>) -> tensor<?x?xf32>
        "scf.yield"(%6, %5) : (tensor<?x?xf32>, index) -> ()
      }) : (index, index, index, tensor<?x?xf32>, index) -> (tensor<?x?xf32>, index)
      "scf.yield"(%4#0, %4#1) : (tensor<?x?xf32>, index) -> ()
    }) : (index, index, index, tensor<?x?xf32>, index) -> (tensor<?x?xf32>, index)
    "func.return"(%3#1) : (index) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x?xf32>, tensor<?x?xf32>) -> index, sym_name = "tensor_dim_of_iter_arg_no_canonicalize"}> ({
  ^bb0(%arg0: tensor<?x?xf32>, %arg1: tensor<?x?xf32>):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = 1 : index}> : () -> index
    %2 = "arith.constant"() <{value = 10 : index}> : () -> index
    %3:2 = "scf.for"(%0, %2, %1, %arg0, %0) ({
    ^bb0(%arg2: index, %arg3: tensor<?x?xf32>, %arg4: index):
      %4 = "tensor.dim"(%arg3, %0) : (tensor<?x?xf32>, index) -> index
      "scf.yield"(%arg1, %4) : (tensor<?x?xf32>, index) -> ()
    }) : (index, index, index, tensor<?x?xf32>, index) -> (tensor<?x?xf32>, index)
    "func.return"(%3#1) : (index) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x?xf32>) -> index, sym_name = "tensor_dim_of_loop_result"}> ({
  ^bb0(%arg0: tensor<?x?xf32>):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = 1 : index}> : () -> index
    %2 = "arith.constant"() <{value = 10 : index}> : () -> index
    %3 = "scf.for"(%0, %2, %1, %arg0) ({
    ^bb0(%arg1: index, %arg2: tensor<?x?xf32>):
      "scf.yield"(%arg2) : (tensor<?x?xf32>) -> ()
    }) : (index, index, index, tensor<?x?xf32>) -> tensor<?x?xf32>
    %4 = "tensor.dim"(%3, %0) : (tensor<?x?xf32>, index) -> index
    "func.return"(%4) : (index) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x?xf32>, tensor<?x?xf32>) -> index, sym_name = "tensor_dim_of_loop_result_no_canonicalize"}> ({
  ^bb0(%arg0: tensor<?x?xf32>, %arg1: tensor<?x?xf32>):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = 1 : index}> : () -> index
    %2 = "arith.constant"() <{value = 10 : index}> : () -> index
    %3:2 = "scf.for"(%0, %2, %1, %arg0, %arg1) ({
    ^bb0(%arg2: index, %arg3: tensor<?x?xf32>, %arg4: tensor<?x?xf32>):
      "scf.yield"(%arg3, %arg1) : (tensor<?x?xf32>, tensor<?x?xf32>) -> ()
    }) : (index, index, index, tensor<?x?xf32>, tensor<?x?xf32>) -> (tensor<?x?xf32>, tensor<?x?xf32>)
    %4 = "tensor.dim"(%3#1, %0) : (tensor<?x?xf32>, index) -> index
    "func.return"(%4) : (index) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1) -> (4, d1 - d0)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<i64>) -> (), sym_name = "one_trip_scf_for_canonicalize_min"}> ({
  ^bb0(%arg0: memref<i64>):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = 2 : index}> : () -> index
    %2 = "arith.constant"() <{value = 4 : index}> : () -> index
    "scf.for"(%0, %2, %2) ({
    ^bb0(%arg1: index):
      %3 = "affine.min"(%arg1, %2) <{map = #map}> : (index, index) -> index
      %4 = "arith.index_cast"(%3) : (index) -> i64
      "memref.store"(%4, %arg0) : (i64, memref<i64>) -> ()
      "scf.yield"() : () -> ()
    }) : (index, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0)[s0] -> (-(d0 * (5 ceildiv s0)) + 5, 3)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<i64>) -> (), sym_name = "regression_multiplication_with_sym"}> ({
  ^bb0(%arg0: memref<i64>):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = 1 : index}> : () -> index
    %2 = "arith.constant"() <{value = 2 : index}> : () -> index
    %3 = "arith.constant"() <{value = 4 : index}> : () -> index
    %4 = "test.dummy"() : () -> index
    "scf.for"(%0, %4, %1) ({
    ^bb0(%arg1: index):
      %5 = "affine.min"(%arg1, %4) <{map = #map}> : (index, index) -> index
      %6 = "arith.index_cast"(%5) : (index) -> i64
      "memref.store"(%6, %arg0) : (i64, memref<i64>) -> ()
      "scf.yield"() : () -> ()
    }) : (index, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2) -> (d0 floordiv 64)>
#map1 = affine_map<(d0, d1, d2) -> (d2 * 64 - 2, 5, (d1 mod 4) floordiv 8)>
"builtin.module"() ({
  "func.func"() <{function_type = (index) -> (), sym_name = "foo", sym_visibility = "private"}> ({
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "func1"}> ({
    %0 = "arith.constant"() <{value = true}> : () -> i1
    %1 = "arith.constant"() <{value = 0 : index}> : () -> index
    %2 = "arith.constant"() <{value = 5 : index}> : () -> index
    %3 = "arith.constant"() <{value = 11 : index}> : () -> index
    %4 = "arith.constant"() <{value = 14 : index}> : () -> index
    %5 = "arith.constant"() <{value = 15 : index}> : () -> index
    %6 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<7xf32>
    %7 = "affine.apply"(%5, %1, %4) <{map = #map}> : (index, index, index) -> index
    %8 = "affine.min"(%2, %7, %3) <{map = #map1}> : (index, index, index) -> index
    "func.call"(%8) <{callee = @foo}> : (index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

