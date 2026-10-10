#map = affine_map<(d0, d1) -> (d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<?x?xf32>, index, index, index) -> (), sym_name = "hoist_basic_vector_xfer_pair"}> ({
  ^bb0(%arg1: memref<?x?xf32>, %arg2: index, %arg3: index, %arg4: index):
    %2 = "arith.constant"() <{value = 0 : index}> : () -> index
    %3 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    "scf.for"(%arg2, %arg3, %arg4) ({
    ^bb0(%arg5: index):
      %4 = "vector.transfer_read"(%arg1, %2, %2, %3) <{in_bounds = [false], operandSegmentSizes = array<i32: 1, 2, 1, 0>, permutation_map = #map}> : (memref<?x?xf32>, index, index, f32) -> vector<1xf32>
      %5 = "val_use"(%4) : (vector<1xf32>) -> vector<1xf32>
      "vector.transfer_write"(%5, %arg1, %2, %2) <{in_bounds = [false], operandSegmentSizes = array<i32: 1, 1, 2, 0>, permutation_map = #map}> : (vector<1xf32>, memref<?x?xf32>, index, index) -> ()
      "scf.yield"() : () -> ()
    }) : (index, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["func.func"]}> : (!transform.any_op) -> !transform.any_op
      %1 = "transform.structured.hoist_redundant_vector_transfers"(%0) : (!transform.any_op) -> !transform.any_op
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1) -> (d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<?x?xf32>, index, index, index, vector<1xf32>) -> (), sym_name = "negative_hoist_basic_vector_xfer_pair_extra_write"}> ({
  ^bb0(%arg1: memref<?x?xf32>, %arg2: index, %arg3: index, %arg4: index, %arg5: vector<1xf32>):
    %2 = "arith.constant"() <{value = 0 : index}> : () -> index
    %3 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    "scf.for"(%arg2, %arg3, %arg4) ({
    ^bb0(%arg6: index):
      "vector.transfer_write"(%arg5, %arg1, %2, %2) <{in_bounds = [false], operandSegmentSizes = array<i32: 1, 1, 2, 0>, permutation_map = #map}> : (vector<1xf32>, memref<?x?xf32>, index, index) -> ()
      %4 = "vector.transfer_read"(%arg1, %2, %2, %3) <{in_bounds = [false], operandSegmentSizes = array<i32: 1, 2, 1, 0>, permutation_map = #map}> : (memref<?x?xf32>, index, index, f32) -> vector<1xf32>
      %5 = "val_use"(%4) : (vector<1xf32>) -> vector<1xf32>
      "vector.transfer_write"(%5, %arg1, %2, %2) <{in_bounds = [false], operandSegmentSizes = array<i32: 1, 1, 2, 0>, permutation_map = #map}> : (vector<1xf32>, memref<?x?xf32>, index, index) -> ()
      "scf.yield"() : () -> ()
    }) : (index, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["func.func"]}> : (!transform.any_op) -> !transform.any_op
      %1 = "transform.structured.hoist_redundant_vector_transfers"(%0) : (!transform.any_op) -> !transform.any_op
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1) -> (d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<?x?xf32>, index, index, index, vector<1xf32>) -> (), sym_name = "negative_hoist_basic_vector_xfer_pair_extra_write_into_alias"}> ({
  ^bb0(%arg1: memref<?x?xf32>, %arg2: index, %arg3: index, %arg4: index, %arg5: vector<1xf32>):
    %2 = "arith.constant"() <{value = 0 : index}> : () -> index
    %3 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %4 = "memref.subview"(%arg1) <{operandSegmentSizes = array<i32: 1, 0, 0, 0>, static_offsets = array<i64: 0, 0>, static_sizes = array<i64: 1, 1>, static_strides = array<i64: 1, 1>}> : (memref<?x?xf32>) -> memref<1x1xf32, strided<[?, 1]>>
    "scf.for"(%arg2, %arg3, %arg4) ({
    ^bb0(%arg6: index):
      "vector.transfer_write"(%arg5, %4, %2, %2) <{in_bounds = [false], operandSegmentSizes = array<i32: 1, 1, 2, 0>, permutation_map = #map}> : (vector<1xf32>, memref<1x1xf32, strided<[?, 1]>>, index, index) -> ()
      %5 = "vector.transfer_read"(%arg1, %2, %2, %3) <{in_bounds = [false], operandSegmentSizes = array<i32: 1, 2, 1, 0>, permutation_map = #map}> : (memref<?x?xf32>, index, index, f32) -> vector<1xf32>
      %6 = "val_use"(%5) : (vector<1xf32>) -> vector<1xf32>
      "vector.transfer_write"(%6, %arg1, %2, %2) <{in_bounds = [false], operandSegmentSizes = array<i32: 1, 1, 2, 0>, permutation_map = #map}> : (vector<1xf32>, memref<?x?xf32>, index, index) -> ()
      "scf.yield"() : () -> ()
    }) : (index, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["func.func"]}> : (!transform.any_op) -> !transform.any_op
      %1 = "transform.structured.hoist_redundant_vector_transfers"(%0) : (!transform.any_op) -> !transform.any_op
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1) -> (d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<?x?xf32>, index, index, index, vector<1xf32>) -> (), sym_name = "hoist_basic_vector_xfer_pair_with_assume_align"}> ({
  ^bb0(%arg1: memref<?x?xf32>, %arg2: index, %arg3: index, %arg4: index, %arg5: vector<1xf32>):
    %2 = "arith.constant"() <{value = 0 : index}> : () -> index
    %3 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %4 = "memref.assume_alignment"(%arg1) <{alignment = 4 : i32}> : (memref<?x?xf32>) -> memref<?x?xf32>
    "scf.for"(%arg2, %arg3, %arg4) ({
    ^bb0(%arg6: index):
      %5 = "vector.transfer_read"(%4, %2, %2, %3) <{in_bounds = [false], operandSegmentSizes = array<i32: 1, 2, 1, 0>, permutation_map = #map}> : (memref<?x?xf32>, index, index, f32) -> vector<1xf32>
      %6 = "val_use"(%5) : (vector<1xf32>) -> vector<1xf32>
      "vector.transfer_write"(%6, %4, %2, %2) <{in_bounds = [false], operandSegmentSizes = array<i32: 1, 1, 2, 0>, permutation_map = #map}> : (vector<1xf32>, memref<?x?xf32>, index, index) -> ()
      "scf.yield"() : () -> ()
    }) : (index, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["func.func"]}> : (!transform.any_op) -> !transform.any_op
      %1 = "transform.structured.hoist_redundant_vector_transfers"(%0) : (!transform.any_op) -> !transform.any_op
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1) -> (d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<?x?xf32>, index, index, index, vector<1xf32>) -> (), sym_name = "negative_hoist_basic_vector_xfer_pair_with_assume_align"}> ({
  ^bb0(%arg1: memref<?x?xf32>, %arg2: index, %arg3: index, %arg4: index, %arg5: vector<1xf32>):
    %2 = "arith.constant"() <{value = 0 : index}> : () -> index
    %3 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %4 = "memref.assume_alignment"(%arg1) <{alignment = 4 : i32}> : (memref<?x?xf32>) -> memref<?x?xf32>
    "scf.for"(%arg2, %arg3, %arg4) ({
    ^bb0(%arg6: index):
      %5 = "vector.transfer_read"(%4, %2, %2, %3) <{in_bounds = [false], operandSegmentSizes = array<i32: 1, 2, 1, 0>, permutation_map = #map}> : (memref<?x?xf32>, index, index, f32) -> vector<1xf32>
      "mem_use"(%arg1) : (memref<?x?xf32>) -> ()
      "vector.transfer_write"(%5, %4, %2, %2) <{in_bounds = [false], operandSegmentSizes = array<i32: 1, 1, 2, 0>, permutation_map = #map}> : (vector<1xf32>, memref<?x?xf32>, index, index) -> ()
      "scf.yield"() : () -> ()
    }) : (index, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["func.func"]}> : (!transform.any_op) -> !transform.any_op
      %1 = "transform.structured.hoist_redundant_vector_transfers"(%0) : (!transform.any_op) -> !transform.any_op
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1) -> (d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<?x?xf32>, index, index, index) -> (), sym_name = "mem_use_outside"}> ({
  ^bb0(%arg1: memref<?x?xf32>, %arg2: index, %arg3: index, %arg4: index):
    %2 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    "scf.for"(%arg2, %arg3, %arg4) ({
    ^bb0(%arg5: index):
      "scf.for"(%arg2, %arg3, %arg4) ({
      ^bb0(%arg6: index):
        %3 = "vector.transfer_read"(%arg1, %arg5, %arg5, %2) <{in_bounds = [false], operandSegmentSizes = array<i32: 1, 2, 1, 0>, permutation_map = #map}> : (memref<?x?xf32>, index, index, f32) -> vector<1xf32>
        %4 = "val_use"(%3) : (vector<1xf32>) -> vector<1xf32>
        "vector.transfer_write"(%4, %arg1, %arg5, %arg5) <{in_bounds = [false], operandSegmentSizes = array<i32: 1, 1, 2, 0>, permutation_map = #map}> : (vector<1xf32>, memref<?x?xf32>, index, index) -> ()
        "scf.yield"() : () -> ()
      }) : (index, index, index) -> ()
      "scf.yield"() : () -> ()
    }) : (index, index, index) -> ()
    "mem_use"(%arg1) : (memref<?x?xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["func.func"]}> : (!transform.any_op) -> !transform.any_op
      %1 = "transform.structured.hoist_redundant_vector_transfers"(%0) : (!transform.any_op) -> !transform.any_op
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1) -> (d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<?x?xf32>, index, index, index) -> (), sym_name = "mem_use_inside_outer_loop"}> ({
  ^bb0(%arg1: memref<?x?xf32>, %arg2: index, %arg3: index, %arg4: index):
    %2 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    "scf.for"(%arg2, %arg3, %arg4) ({
    ^bb0(%arg5: index):
      "scf.for"(%arg2, %arg3, %arg4) ({
      ^bb0(%arg6: index):
        %3 = "vector.transfer_read"(%arg1, %arg5, %arg5, %2) <{in_bounds = [false], operandSegmentSizes = array<i32: 1, 2, 1, 0>, permutation_map = #map}> : (memref<?x?xf32>, index, index, f32) -> vector<1xf32>
        %4 = "val_use"(%3) : (vector<1xf32>) -> vector<1xf32>
        "vector.transfer_write"(%4, %arg1, %arg5, %arg5) <{in_bounds = [false], operandSegmentSizes = array<i32: 1, 1, 2, 0>, permutation_map = #map}> : (vector<1xf32>, memref<?x?xf32>, index, index) -> ()
        "scf.yield"() : () -> ()
      }) : (index, index, index) -> ()
      "mem_use"(%arg1) : (memref<?x?xf32>) -> ()
      "scf.yield"() : () -> ()
    }) : (index, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["func.func"]}> : (!transform.any_op) -> !transform.any_op
      %1 = "transform.structured.hoist_redundant_vector_transfers"(%0) : (!transform.any_op) -> !transform.any_op
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1) -> (d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<?x?xf32>, index, index, index) -> (), sym_name = "negative_mem_use_inside_inner_loop_before_write"}> ({
  ^bb0(%arg1: memref<?x?xf32>, %arg2: index, %arg3: index, %arg4: index):
    %2 = "arith.constant"() <{value = 0 : index}> : () -> index
    %3 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    "scf.for"(%arg2, %arg3, %arg4) ({
    ^bb0(%arg5: index):
      "scf.for"(%arg2, %arg3, %arg4) ({
      ^bb0(%arg6: index):
        %4 = "vector.transfer_read"(%arg1, %2, %2, %3) <{in_bounds = [false], operandSegmentSizes = array<i32: 1, 2, 1, 0>, permutation_map = #map}> : (memref<?x?xf32>, index, index, f32) -> vector<1xf32>
        %5 = "val_use"(%4) : (vector<1xf32>) -> vector<1xf32>
        "mem_use"(%arg1) : (memref<?x?xf32>) -> ()
        "vector.transfer_write"(%5, %arg1, %2, %2) <{in_bounds = [false], operandSegmentSizes = array<i32: 1, 1, 2, 0>, permutation_map = #map}> : (vector<1xf32>, memref<?x?xf32>, index, index) -> ()
        "scf.yield"() : () -> ()
      }) : (index, index, index) -> ()
      "scf.yield"() : () -> ()
    }) : (index, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["func.func"]}> : (!transform.any_op) -> !transform.any_op
      %1 = "transform.structured.hoist_redundant_vector_transfers"(%0) : (!transform.any_op) -> !transform.any_op
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1) -> (d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<?x?xf32>, index, index, index) -> (), sym_name = "negative_mem_use_inside_inner_loop_after_write"}> ({
  ^bb0(%arg1: memref<?x?xf32>, %arg2: index, %arg3: index, %arg4: index):
    %2 = "arith.constant"() <{value = 0 : index}> : () -> index
    %3 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    "scf.for"(%arg2, %arg3, %arg4) ({
    ^bb0(%arg5: index):
      "scf.for"(%arg2, %arg3, %arg4) ({
      ^bb0(%arg6: index):
        %4 = "vector.transfer_read"(%arg1, %2, %2, %3) <{in_bounds = [false], operandSegmentSizes = array<i32: 1, 2, 1, 0>, permutation_map = #map}> : (memref<?x?xf32>, index, index, f32) -> vector<1xf32>
        %5 = "val_use"(%4) : (vector<1xf32>) -> vector<1xf32>
        "vector.transfer_write"(%5, %arg1, %2, %2) <{in_bounds = [false], operandSegmentSizes = array<i32: 1, 1, 2, 0>, permutation_map = #map}> : (vector<1xf32>, memref<?x?xf32>, index, index) -> ()
        "mem_use"(%arg1) : (memref<?x?xf32>) -> ()
        "scf.yield"() : () -> ()
      }) : (index, index, index) -> ()
      "scf.yield"() : () -> ()
    }) : (index, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["func.func"]}> : (!transform.any_op) -> !transform.any_op
      %1 = "transform.structured.hoist_redundant_vector_transfers"(%0) : (!transform.any_op) -> !transform.any_op
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1) -> (d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<?x?xf32>, index, index, index) -> (), sym_name = "negative_mem_use_inside_inner_loop_before_read"}> ({
  ^bb0(%arg1: memref<?x?xf32>, %arg2: index, %arg3: index, %arg4: index):
    %2 = "arith.constant"() <{value = 0 : index}> : () -> index
    %3 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    "scf.for"(%arg2, %arg3, %arg4) ({
    ^bb0(%arg5: index):
      "scf.for"(%arg2, %arg3, %arg4) ({
      ^bb0(%arg6: index):
        "mem_use"(%arg1) : (memref<?x?xf32>) -> ()
        %4 = "vector.transfer_read"(%arg1, %2, %2, %3) <{in_bounds = [false], operandSegmentSizes = array<i32: 1, 2, 1, 0>, permutation_map = #map}> : (memref<?x?xf32>, index, index, f32) -> vector<1xf32>
        %5 = "val_use"(%4) : (vector<1xf32>) -> vector<1xf32>
        "vector.transfer_write"(%5, %arg1, %2, %2) <{in_bounds = [false], operandSegmentSizes = array<i32: 1, 1, 2, 0>, permutation_map = #map}> : (vector<1xf32>, memref<?x?xf32>, index, index) -> ()
        "scf.yield"() : () -> ()
      }) : (index, index, index) -> ()
      "scf.yield"() : () -> ()
    }) : (index, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["func.func"]}> : (!transform.any_op) -> !transform.any_op
      %1 = "transform.structured.hoist_redundant_vector_transfers"(%0) : (!transform.any_op) -> !transform.any_op
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1) -> (d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<?x?xf32>, memref<?x?xf32>, memref<?x?xf32>, memref<?x?xf32>, index, index, index, index, index, i1) -> (), sym_name = "hoist_vector_transfer_pairs_disjoint"}> ({
  ^bb0(%arg1: memref<?x?xf32>, %arg2: memref<?x?xf32>, %arg3: memref<?x?xf32>, %arg4: memref<?x?xf32>, %arg5: index, %arg6: index, %arg7: index, %arg8: index, %arg9: index, %arg10: i1):
    %2 = "arith.constant"() <{value = 0 : index}> : () -> index
    %3 = "arith.constant"() <{value = 1 : index}> : () -> index
    %4 = "arith.constant"() <{value = 3 : index}> : () -> index
    %5 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    "scf.for"(%arg6, %arg7, %arg8) ({
    ^bb0(%arg11: index):
      "scf.for"(%arg6, %arg7, %arg8) ({
      ^bb0(%arg12: index):
        %6 = "vector.transfer_read"(%arg2, %2, %2, %5) <{in_bounds = [false], operandSegmentSizes = array<i32: 1, 2, 1, 0>, permutation_map = #map}> : (memref<?x?xf32>, index, index, f32) -> vector<2xf32>
        %7 = "vector.transfer_read"(%arg2, %2, %3, %5) <{in_bounds = [false], operandSegmentSizes = array<i32: 1, 2, 1, 0>, permutation_map = #map}> : (memref<?x?xf32>, index, index, f32) -> vector<2xf32>
        %8 = "vector.transfer_read"(%arg3, %2, %2, %5) <{in_bounds = [false], operandSegmentSizes = array<i32: 1, 2, 1, 0>, permutation_map = #map}> : (memref<?x?xf32>, index, index, f32) -> vector<3xf32>
        %9 = "vector.transfer_read"(%arg3, %2, %4, %5) <{in_bounds = [false], operandSegmentSizes = array<i32: 1, 2, 1, 0>, permutation_map = #map}> : (memref<?x?xf32>, index, index, f32) -> vector<3xf32>
        %10 = "vector.transfer_read"(%arg4, %2, %arg9, %5) <{in_bounds = [false], operandSegmentSizes = array<i32: 1, 2, 1, 0>, permutation_map = #map}> : (memref<?x?xf32>, index, index, f32) -> vector<4xf32>
        %11 = "vector.transfer_read"(%arg4, %3, %arg9, %5) <{in_bounds = [false], operandSegmentSizes = array<i32: 1, 2, 1, 0>, permutation_map = #map}> : (memref<?x?xf32>, index, index, f32) -> vector<4xf32>
        %12 = "vector.transfer_read"(%arg1, %arg11, %arg11, %5) <{in_bounds = [false], operandSegmentSizes = array<i32: 1, 2, 1, 0>, permutation_map = #map}> : (memref<?x?xf32>, index, index, f32) -> vector<2xf32>
        %13 = "vector.transfer_read"(%arg1, %arg9, %arg9, %5) <{in_bounds = [false], operandSegmentSizes = array<i32: 1, 2, 1, 0>, permutation_map = #map}> : (memref<?x?xf32>, index, index, f32) -> vector<2xf32>
        %14 = "some_use"(%6) : (vector<2xf32>) -> vector<2xf32>
        %15 = "some_use"(%7) : (vector<2xf32>) -> vector<2xf32>
        %16 = "some_use"(%8) : (vector<3xf32>) -> vector<3xf32>
        %17 = "some_use"(%9) : (vector<3xf32>) -> vector<3xf32>
        %18 = "some_use"(%10) : (vector<4xf32>) -> vector<4xf32>
        %19 = "some_use"(%11) : (vector<4xf32>) -> vector<4xf32>
        %20 = "some_use"(%12) : (vector<2xf32>) -> vector<2xf32>
        %21 = "some_use"(%13) : (vector<2xf32>) -> vector<2xf32>
        "vector.transfer_write"(%14, %arg2, %2, %2) <{in_bounds = [false], operandSegmentSizes = array<i32: 1, 1, 2, 0>, permutation_map = #map}> : (vector<2xf32>, memref<?x?xf32>, index, index) -> ()
        "vector.transfer_write"(%15, %arg2, %2, %3) <{in_bounds = [false], operandSegmentSizes = array<i32: 1, 1, 2, 0>, permutation_map = #map}> : (vector<2xf32>, memref<?x?xf32>, index, index) -> ()
        "vector.transfer_write"(%16, %arg3, %2, %2) <{in_bounds = [false], operandSegmentSizes = array<i32: 1, 1, 2, 0>, permutation_map = #map}> : (vector<3xf32>, memref<?x?xf32>, index, index) -> ()
        "vector.transfer_write"(%17, %arg3, %2, %4) <{in_bounds = [false], operandSegmentSizes = array<i32: 1, 1, 2, 0>, permutation_map = #map}> : (vector<3xf32>, memref<?x?xf32>, index, index) -> ()
        "vector.transfer_write"(%18, %arg4, %2, %arg9) <{in_bounds = [false], operandSegmentSizes = array<i32: 1, 1, 2, 0>, permutation_map = #map}> : (vector<4xf32>, memref<?x?xf32>, index, index) -> ()
        "vector.transfer_write"(%19, %arg4, %3, %arg9) <{in_bounds = [false], operandSegmentSizes = array<i32: 1, 1, 2, 0>, permutation_map = #map}> : (vector<4xf32>, memref<?x?xf32>, index, index) -> ()
        "vector.transfer_write"(%20, %arg1, %arg11, %arg11) <{in_bounds = [false], operandSegmentSizes = array<i32: 1, 1, 2, 0>, permutation_map = #map}> : (vector<2xf32>, memref<?x?xf32>, index, index) -> ()
        "vector.transfer_write"(%21, %arg1, %arg9, %arg9) <{in_bounds = [false], operandSegmentSizes = array<i32: 1, 1, 2, 0>, permutation_map = #map}> : (vector<2xf32>, memref<?x?xf32>, index, index) -> ()
        "scf.yield"() : () -> ()
      }) : (index, index, index) -> ()
      "scf.yield"() : () -> ()
    }) : (index, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["func.func"]}> : (!transform.any_op) -> !transform.any_op
      %1 = "transform.structured.hoist_redundant_vector_transfers"(%0) : (!transform.any_op) -> !transform.any_op
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1) -> (0)>
#map1 = affine_map<(d0, d1) -> (d1)>
#map2 = affine_map<() -> (0)>
#map3 = affine_map<() -> (64)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<64x64xi32>, memref<64x64xi32>, memref<64x64xi32>) -> (), sym_name = "hoist_vector_transfer_pairs_in_affine_loops"}> ({
  ^bb0(%arg1: memref<64x64xi32>, %arg2: memref<64x64xi32>, %arg3: memref<64x64xi32>):
    %2 = "arith.constant"() <{value = 0 : i32}> : () -> i32
    "affine.for"() <{lowerBoundMap = #map2, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map3}> ({
    ^bb0(%arg4: index):
      "affine.for"() <{lowerBoundMap = #map2, operandSegmentSizes = array<i32: 0, 0, 0>, step = 16 : index, upperBoundMap = #map3}> ({
      ^bb0(%arg5: index):
        "affine.for"() <{lowerBoundMap = #map2, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map3}> ({
        ^bb0(%arg6: index):
          %3 = "vector.transfer_read"(%arg1, %arg4, %arg6, %2) <{in_bounds = [false], operandSegmentSizes = array<i32: 1, 2, 1, 0>, permutation_map = #map}> : (memref<64x64xi32>, index, index, i32) -> vector<16xi32>
          %4 = "vector.transfer_read"(%arg2, %arg6, %arg5, %2) <{in_bounds = [false], operandSegmentSizes = array<i32: 1, 2, 1, 0>, permutation_map = #map1}> : (memref<64x64xi32>, index, index, i32) -> vector<16xi32>
          %5 = "vector.transfer_read"(%arg3, %arg4, %arg5, %2) <{in_bounds = [false], operandSegmentSizes = array<i32: 1, 2, 1, 0>, permutation_map = #map1}> : (memref<64x64xi32>, index, index, i32) -> vector<16xi32>
          %6 = "arith.muli"(%3, %4) <{overflowFlags = #arith.overflow<none>}> : (vector<16xi32>, vector<16xi32>) -> vector<16xi32>
          %7 = "arith.addi"(%5, %6) <{overflowFlags = #arith.overflow<none>}> : (vector<16xi32>, vector<16xi32>) -> vector<16xi32>
          "vector.transfer_write"(%7, %arg3, %arg4, %arg5) <{in_bounds = [false], operandSegmentSizes = array<i32: 1, 1, 2, 0>, permutation_map = #map1}> : (vector<16xi32>, memref<64x64xi32>, index, index) -> ()
          "affine.yield"() : () -> ()
        }) : () -> ()
        "affine.yield"() : () -> ()
      }) : () -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["func.func"]}> : (!transform.any_op) -> !transform.any_op
      %1 = "transform.structured.hoist_redundant_vector_transfers"(%0) : (!transform.any_op) -> !transform.any_op
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1) -> (d0, d1)>
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "hoist_vector_transfer_read"}> ({
    %2 = "arith.constant"() <{value = 0 : index}> : () -> index
    %3 = "arith.constant"() <{value = 128 : index}> : () -> index
    %4 = "arith.constant"() <{value = 1024 : index}> : () -> index
    %5 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %6 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<32x64xf32>
    %7 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<32x128xf32>
    %8 = "memref.subview"(%7, %2, %2) <{operandSegmentSizes = array<i32: 1, 2, 0, 0>, static_offsets = array<i64: -9223372036854775808, -9223372036854775808>, static_sizes = array<i64: 32, 128>, static_strides = array<i64: 1, 1>}> : (memref<32x128xf32>, index, index) -> memref<32x128xf32, strided<[128, 1], offset: ?>>
    "scf.for"(%2, %4, %3) ({
    ^bb0(%arg1: index):
      %9 = "vector.transfer_read"(%7, %2, %2, %5) <{in_bounds = [true, true], operandSegmentSizes = array<i32: 1, 2, 1, 0>, permutation_map = #map}> : (memref<32x128xf32>, index, index, f32) -> vector<32x128xf32>
      %10 = "vector.transfer_read"(%6, %2, %2, %5) <{in_bounds = [true, true], operandSegmentSizes = array<i32: 1, 2, 1, 0>, permutation_map = #map}> : (memref<32x64xf32>, index, index, f32) -> vector<32x64xf32>
      "some_use"(%10, %9, %8) : (vector<32x64xf32>, vector<32x128xf32>, memref<32x128xf32, strided<[128, 1], offset: ?>>) -> ()
      "scf.yield"() : () -> ()
    }) : (index, index, index) -> ()
    "memref.dealloc"(%6) : (memref<32x64xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["func.func"]}> : (!transform.any_op) -> !transform.any_op
      %1 = "transform.structured.hoist_redundant_vector_transfers"(%0) : (!transform.any_op) -> !transform.any_op
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2, d3) -> (d0, d2, d3)>
#map1 = affine_map<(d0, d1, d2, d3) -> (d0, d1, d2, d3)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<6x1x7x32xf32>) -> (), sym_name = "non_matching_transfers"}> ({
  ^bb0(%arg1: memref<6x1x7x32xf32>):
    %2 = "arith.constant"() <{value = 0 : index}> : () -> index
    %3 = "arith.constant"() <{value = 1024 : index}> : () -> index
    %4 = "arith.constant"() <{value = 128 : index}> : () -> index
    %5 = "arith.constant"() <{value = dense<5.500000e+00> : vector<6x7x32xf32>}> : () -> vector<6x7x32xf32>
    %6 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    "scf.for"(%2, %3, %4) ({
    ^bb0(%arg2: index):
      %7 = "vector.transfer_read"(%arg1, %2, %2, %2, %2, %6) <{in_bounds = [true, true, true], operandSegmentSizes = array<i32: 1, 4, 1, 0>, permutation_map = #map}> : (memref<6x1x7x32xf32>, index, index, index, index, f32) -> vector<6x7x32xf32>
      %8 = "arith.addf"(%7, %5) <{fastmath = #arith.fastmath<none>}> : (vector<6x7x32xf32>, vector<6x7x32xf32>) -> vector<6x7x32xf32>
      %9 = "vector.broadcast"(%8) : (vector<6x7x32xf32>) -> vector<1x6x7x32xf32>
      %10 = "vector.transpose"(%9) <{permutation = array<i64: 1, 0, 2, 3>}> : (vector<1x6x7x32xf32>) -> vector<6x1x7x32xf32>
      "vector.transfer_write"(%10, %arg1, %2, %2, %2, %2) <{in_bounds = [true, true, true, true], operandSegmentSizes = array<i32: 1, 1, 4, 0>, permutation_map = #map1}> : (vector<6x1x7x32xf32>, memref<6x1x7x32xf32>, index, index, index, index) -> ()
      "scf.yield"() : () -> ()
    }) : (index, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["func.func"]}> : (!transform.any_op) -> !transform.any_op
      %1 = "transform.structured.hoist_redundant_vector_transfers"(%0) : (!transform.any_op) -> !transform.any_op
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0) -> (d0)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<20xi32>, index, index) -> (), sym_name = "no_hoisting_unknown_bound_loop"}> ({
  ^bb0(%arg1: memref<20xi32>, %arg2: index, %arg3: index):
    %2 = "arith.constant"() <{value = 0 : i32}> : () -> i32
    %3 = "arith.constant"() <{value = 0 : index}> : () -> index
    %4 = "arith.constant"() <{value = 1 : index}> : () -> index
    "scf.for"(%arg2, %arg3, %4) ({
    ^bb0(%arg4: index):
      %5 = "vector.transfer_read"(%arg1, %3, %2) <{in_bounds = [true], operandSegmentSizes = array<i32: 1, 1, 1, 0>, permutation_map = #map}> : (memref<20xi32>, index, i32) -> vector<4xi32>
      "test.some_use"(%5) : (vector<4xi32>) -> ()
      "scf.yield"() : () -> ()
    }) : (index, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["func.func"]}> : (!transform.any_op) -> !transform.any_op
      %1 = "transform.structured.hoist_redundant_vector_transfers"(%0) <{verify_non_zero_trip}> : (!transform.any_op) -> !transform.any_op
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0) -> (d0, 8)>
#map1 = affine_map<(d0) -> (d0, 4)>
#map2 = affine_map<(d0) -> (d0)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<20xi32>, index, index) -> (), sym_name = "no_hoisting_possibly_zero_trip_loop"}> ({
  ^bb0(%arg1: memref<20xi32>, %arg2: index, %arg3: index):
    %2 = "arith.constant"() <{value = 0 : i32}> : () -> i32
    %3 = "arith.constant"() <{value = 0 : index}> : () -> index
    %4 = "arith.constant"() <{value = 1 : index}> : () -> index
    %5 = "affine.min"(%arg2) <{map = #map}> : (index) -> index
    %6 = "affine.max"(%arg3) <{map = #map1}> : (index) -> index
    "scf.for"(%5, %6, %4) ({
    ^bb0(%arg4: index):
      %7 = "vector.transfer_read"(%arg1, %3, %2) <{in_bounds = [true], operandSegmentSizes = array<i32: 1, 1, 1, 0>, permutation_map = #map2}> : (memref<20xi32>, index, i32) -> vector<4xi32>
      "test.some_use"(%7) : (vector<4xi32>) -> ()
      "scf.yield"() : () -> ()
    }) : (index, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["func.func"]}> : (!transform.any_op) -> !transform.any_op
      %1 = "transform.structured.hoist_redundant_vector_transfers"(%0) <{verify_non_zero_trip}> : (!transform.any_op) -> !transform.any_op
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0) -> (d0, 8)>
#map1 = affine_map<(d0) -> (d0)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<20xi32>, index, index) -> (), sym_name = "no_hoisting_possibly_zero_trip_loop_eq_lb_and_ub"}> ({
  ^bb0(%arg1: memref<20xi32>, %arg2: index, %arg3: index):
    %2 = "arith.constant"() <{value = 0 : i32}> : () -> i32
    %3 = "arith.constant"() <{value = 0 : index}> : () -> index
    %4 = "arith.constant"() <{value = 1 : index}> : () -> index
    %5 = "affine.min"(%arg2) <{map = #map}> : (index) -> index
    %6 = "affine.max"(%arg3) <{map = #map}> : (index) -> index
    "scf.for"(%5, %6, %4) ({
    ^bb0(%arg4: index):
      %7 = "vector.transfer_read"(%arg1, %3, %2) <{in_bounds = [true], operandSegmentSizes = array<i32: 1, 1, 1, 0>, permutation_map = #map1}> : (memref<20xi32>, index, i32) -> vector<4xi32>
      "test.some_use"(%7) : (vector<4xi32>) -> ()
      "scf.yield"() : () -> ()
    }) : (index, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["func.func"]}> : (!transform.any_op) -> !transform.any_op
      %1 = "transform.structured.hoist_redundant_vector_transfers"(%0) <{verify_non_zero_trip}> : (!transform.any_op) -> !transform.any_op
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0) -> (d0, 4)>
#map1 = affine_map<(d0) -> (d0, 8)>
#map2 = affine_map<(d0) -> (d0)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<20xi32>, index, index) -> (), sym_name = "hoisting_non_zero_trip_loop"}> ({
  ^bb0(%arg1: memref<20xi32>, %arg2: index, %arg3: index):
    %2 = "arith.constant"() <{value = 0 : i32}> : () -> i32
    %3 = "arith.constant"() <{value = 0 : index}> : () -> index
    %4 = "arith.constant"() <{value = 1 : index}> : () -> index
    %5 = "affine.min"(%arg2) <{map = #map}> : (index) -> index
    %6 = "affine.max"(%arg3) <{map = #map1}> : (index) -> index
    "scf.for"(%5, %6, %4) ({
    ^bb0(%arg4: index):
      %7 = "vector.transfer_read"(%arg1, %3, %2) <{in_bounds = [true], operandSegmentSizes = array<i32: 1, 1, 1, 0>, permutation_map = #map2}> : (memref<20xi32>, index, i32) -> vector<4xi32>
      "test.some_use"(%7) : (vector<4xi32>) -> ()
      "scf.yield"() : () -> ()
    }) : (index, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["func.func"]}> : (!transform.any_op) -> !transform.any_op
      %1 = "transform.structured.hoist_redundant_vector_transfers"(%0) <{verify_non_zero_trip}> : (!transform.any_op) -> !transform.any_op
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0) -> (d0)>
#map1 = affine_map<(d0, d1, d2) -> (d0, d1, d2)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<1x20x1xi32>, memref<9x1xi32>, vector<4xi32>) -> (), sym_name = "no_hoisting_collapse_shape"}> ({
  ^bb0(%arg1: memref<1x20x1xi32>, %arg2: memref<9x1xi32>, %arg3: vector<4xi32>):
    %2 = "arith.constant"() <{value = 0 : i32}> : () -> i32
    %3 = "arith.constant"() <{value = 0 : index}> : () -> index
    %4 = "arith.constant"() <{value = 4 : index}> : () -> index
    %5 = "arith.constant"() <{value = 20 : index}> : () -> index
    %6 = "memref.alloca"() <{alignment = 64 : i64, operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<1x4x1xi32>
    "scf.for"(%3, %5, %4) ({
    ^bb0(%arg4: index):
      %7 = "memref.subview"(%arg1, %arg4) <{operandSegmentSizes = array<i32: 1, 1, 0, 0>, static_offsets = array<i64: 0, -9223372036854775808, 0>, static_sizes = array<i64: 1, 4, 1>, static_strides = array<i64: 1, 1, 1>}> : (memref<1x20x1xi32>, index) -> memref<1x4x1xi32, strided<[20, 1, 1], offset: ?>>
      %8 = "memref.collapse_shape"(%6) <{reassociation = [[0, 1, 2]]}> : (memref<1x4x1xi32>) -> memref<4xi32>
      "vector.transfer_write"(%arg3, %8, %3) <{in_bounds = [true], operandSegmentSizes = array<i32: 1, 1, 1, 0>, permutation_map = #map}> : (vector<4xi32>, memref<4xi32>, index) -> ()
      %9 = "vector.transfer_read"(%6, %3, %3, %3, %2) <{in_bounds = [true, true, true], operandSegmentSizes = array<i32: 1, 3, 1, 0>, permutation_map = #map1}> : (memref<1x4x1xi32>, index, index, index, i32) -> vector<1x4x1xi32>
      "vector.transfer_write"(%9, %7, %3, %3, %3) <{in_bounds = [true, true, true], operandSegmentSizes = array<i32: 1, 1, 3, 0>, permutation_map = #map1}> : (vector<1x4x1xi32>, memref<1x4x1xi32, strided<[20, 1, 1], offset: ?>>, index, index, index) -> ()
      "scf.yield"() : () -> ()
    }) : (index, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["func.func"]}> : (!transform.any_op) -> !transform.any_op
      %1 = "transform.structured.hoist_redundant_vector_transfers"(%0) : (!transform.any_op) -> !transform.any_op
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2) -> (d0, d1, d2)>
#map1 = affine_map<(d0) -> (d0)>
"builtin.module"() ({
  "func.func"() <{function_type = (vector<1x12x1xi32>) -> (), sym_name = "no_hoisting_collapse_shape_2"}> ({
  ^bb0(%arg1: vector<1x12x1xi32>):
    %2 = "arith.constant"() <{value = 0 : i32}> : () -> i32
    %3 = "arith.constant"() <{value = 0 : index}> : () -> index
    %4 = "arith.constant"() <{value = 4 : index}> : () -> index
    %5 = "arith.constant"() <{value = 20 : index}> : () -> index
    %6 = "memref.alloca"() <{alignment = 64 : i64, operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<1x12x1xi32>
    "scf.for"(%3, %5, %4) ({
    ^bb0(%arg2: index):
      %7 = "memref.collapse_shape"(%6) <{reassociation = [[0, 1, 2]]}> : (memref<1x12x1xi32>) -> memref<12xi32>
      "vector.transfer_write"(%arg1, %6, %3, %3, %3) <{in_bounds = [true, true, true], operandSegmentSizes = array<i32: 1, 1, 3, 0>, permutation_map = #map}> : (vector<1x12x1xi32>, memref<1x12x1xi32>, index, index, index) -> ()
      %8 = "vector.transfer_read"(%7, %3, %2) <{in_bounds = [true], operandSegmentSizes = array<i32: 1, 1, 1, 0>, permutation_map = #map1}> : (memref<12xi32>, index, i32) -> vector<12xi32>
      "test.some_use"(%8) : (vector<12xi32>) -> ()
      "scf.yield"() : () -> ()
    }) : (index, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["func.func"]}> : (!transform.any_op) -> !transform.any_op
      %1 = "transform.structured.hoist_redundant_vector_transfers"(%0) : (!transform.any_op) -> !transform.any_op
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0) -> (d0)>
"builtin.module"() ({
  "func.func"() <{function_type = (i32, vector<1xi32>) -> (), sym_name = "no_hoisting_write_to_buffer"}> ({
  ^bb0(%arg1: i32, %arg2: vector<1xi32>):
    %2 = "arith.constant"() <{value = 0 : i32}> : () -> i32
    %3 = "arith.constant"() <{value = 0 : index}> : () -> index
    %4 = "arith.constant"() <{value = 1 : index}> : () -> index
    %5 = "arith.constant"() <{value = 4 : index}> : () -> index
    %6 = "arith.constant"() <{value = 20 : index}> : () -> index
    %7 = "memref.alloca"() <{alignment = 64 : i64, operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<1x1x2xi32>
    %8 = "memref.cast"(%7) : (memref<1x1x2xi32>) -> memref<1x1x2xi32>
    %9 = "memref.collapse_shape"(%7) <{reassociation = [[0, 1, 2]]}> : (memref<1x1x2xi32>) -> memref<2xi32>
    "scf.for"(%3, %6, %5) ({
    ^bb0(%arg3: index):
      %10 = "memref.collapse_shape"(%7) <{reassociation = [[0, 1, 2]]}> : (memref<1x1x2xi32>) -> memref<2xi32>
      %11 = "vector.transfer_read"(%9, %3, %2) <{in_bounds = [true], operandSegmentSizes = array<i32: 1, 1, 1, 0>, permutation_map = #map}> : (memref<2xi32>, index, i32) -> vector<1xi32>
      %12 = "vector.transfer_read"(%10, %3, %2) <{in_bounds = [true], operandSegmentSizes = array<i32: 1, 1, 1, 0>, permutation_map = #map}> : (memref<2xi32>, index, i32) -> vector<1xi32>
      %13 = "vector.outerproduct"(%11, %arg1, %12) <{kind = #vector.kind<add>}> : (vector<1xi32>, i32, vector<1xi32>) -> vector<1xi32>
      "vector.transfer_write"(%13, %9, %3) <{in_bounds = [true], operandSegmentSizes = array<i32: 1, 1, 1, 0>, permutation_map = #map}> : (vector<1xi32>, memref<2xi32>, index) -> ()
      "scf.yield"() : () -> ()
    }) : (index, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["func.func"]}> : (!transform.any_op) -> !transform.any_op
      %1 = "transform.structured.hoist_redundant_vector_transfers"(%0) : (!transform.any_op) -> !transform.any_op
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0) -> (d0 + 1)>
#map1 = affine_map<(d0) -> (d0 + 4)>
#map2 = affine_map<(d0, d1) -> (d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<?x?xf32>, index, index, index, index) -> (), sym_name = "hoist_vector_transfer_pairs_disjoint_dynamic"}> ({
  ^bb0(%arg1: memref<?x?xf32>, %arg2: index, %arg3: index, %arg4: index, %arg5: index):
    %2 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %3 = "affine.apply"(%arg5) <{map = #map}> : (index) -> index
    %4 = "affine.apply"(%arg5) <{map = #map1}> : (index) -> index
    "scf.for"(%arg2, %arg3, %arg4) ({
    ^bb0(%arg6: index):
      "scf.for"(%arg2, %arg3, %arg4) ({
      ^bb0(%arg7: index):
        %5 = "vector.transfer_read"(%arg1, %arg5, %arg5, %2) <{in_bounds = [false], operandSegmentSizes = array<i32: 1, 2, 1, 0>, permutation_map = #map2}> : (memref<?x?xf32>, index, index, f32) -> vector<4xf32>
        %6 = "vector.transfer_read"(%arg1, %3, %arg5, %2) <{in_bounds = [false], operandSegmentSizes = array<i32: 1, 2, 1, 0>, permutation_map = #map2}> : (memref<?x?xf32>, index, index, f32) -> vector<4xf32>
        %7 = "vector.transfer_read"(%arg1, %3, %4, %2) <{in_bounds = [false], operandSegmentSizes = array<i32: 1, 2, 1, 0>, permutation_map = #map2}> : (memref<?x?xf32>, index, index, f32) -> vector<4xf32>
        %8 = "some_use"(%5) : (vector<4xf32>) -> vector<4xf32>
        %9 = "some_use"(%6) : (vector<4xf32>) -> vector<4xf32>
        %10 = "some_use"(%7) : (vector<4xf32>) -> vector<4xf32>
        "vector.transfer_write"(%8, %arg1, %arg5, %arg5) <{in_bounds = [false], operandSegmentSizes = array<i32: 1, 1, 2, 0>, permutation_map = #map2}> : (vector<4xf32>, memref<?x?xf32>, index, index) -> ()
        "vector.transfer_write"(%9, %arg1, %3, %arg5) <{in_bounds = [false], operandSegmentSizes = array<i32: 1, 1, 2, 0>, permutation_map = #map2}> : (vector<4xf32>, memref<?x?xf32>, index, index) -> ()
        "vector.transfer_write"(%10, %arg1, %3, %4) <{in_bounds = [false], operandSegmentSizes = array<i32: 1, 1, 2, 0>, permutation_map = #map2}> : (vector<4xf32>, memref<?x?xf32>, index, index) -> ()
        "scf.yield"() : () -> ()
      }) : (index, index, index) -> ()
      "scf.yield"() : () -> ()
    }) : (index, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["func.func"]}> : (!transform.any_op) -> !transform.any_op
      %1 = "transform.structured.hoist_redundant_vector_transfers"(%0) : (!transform.any_op) -> !transform.any_op
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0) -> (d0 + 3)>
#map1 = affine_map<(d0, d1) -> (d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<?x?xf32>, index, index, index, index) -> (), sym_name = "hoist_vector_transfer_pairs_overlapping_dynamic"}> ({
  ^bb0(%arg1: memref<?x?xf32>, %arg2: index, %arg3: index, %arg4: index, %arg5: index):
    %2 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %3 = "affine.apply"(%arg5) <{map = #map}> : (index) -> index
    "scf.for"(%arg2, %arg3, %arg4) ({
    ^bb0(%arg6: index):
      "scf.for"(%arg2, %arg3, %arg4) ({
      ^bb0(%arg7: index):
        %4 = "vector.transfer_read"(%arg1, %arg5, %arg5, %2) <{in_bounds = [false], operandSegmentSizes = array<i32: 1, 2, 1, 0>, permutation_map = #map1}> : (memref<?x?xf32>, index, index, f32) -> vector<4xf32>
        %5 = "vector.transfer_read"(%arg1, %arg5, %3, %2) <{in_bounds = [false], operandSegmentSizes = array<i32: 1, 2, 1, 0>, permutation_map = #map1}> : (memref<?x?xf32>, index, index, f32) -> vector<4xf32>
        %6 = "some_use"(%4) : (vector<4xf32>) -> vector<4xf32>
        %7 = "some_use"(%5) : (vector<4xf32>) -> vector<4xf32>
        "vector.transfer_write"(%6, %arg1, %arg5, %arg5) <{in_bounds = [false], operandSegmentSizes = array<i32: 1, 1, 2, 0>, permutation_map = #map1}> : (vector<4xf32>, memref<?x?xf32>, index, index) -> ()
        "vector.transfer_write"(%7, %arg1, %arg5, %3) <{in_bounds = [false], operandSegmentSizes = array<i32: 1, 1, 2, 0>, permutation_map = #map1}> : (vector<4xf32>, memref<?x?xf32>, index, index) -> ()
        "scf.yield"() : () -> ()
      }) : (index, index, index) -> ()
      "scf.yield"() : () -> ()
    }) : (index, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["func.func"]}> : (!transform.any_op) -> !transform.any_op
      %1 = "transform.structured.hoist_redundant_vector_transfers"(%0) : (!transform.any_op) -> !transform.any_op
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0) -> ((d0 floordiv 32) * 16)>
#map1 = affine_map<(d0) -> ((d0 floordiv 32) * 16 + 8)>
#map2 = affine_map<(d0) -> ((d0 floordiv 32) * 16 + 16)>
#map3 = affine_map<(d0, d1) -> (d0, d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<?x?xf32>, index, index, index, index, index) -> (), sym_name = "hoist_vector_transfer_pairs_disjoint_dynamic"}> ({
  ^bb0(%arg1: memref<?x?xf32>, %arg2: index, %arg3: index, %arg4: index, %arg5: index, %arg6: index):
    %2 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %3 = "affine.apply"(%arg6) <{map = #map}> : (index) -> index
    %4 = "affine.apply"(%arg6) <{map = #map1}> : (index) -> index
    %5 = "affine.apply"(%arg6) <{map = #map2}> : (index) -> index
    "scf.for"(%arg2, %arg3, %arg4) ({
    ^bb0(%arg7: index):
      "scf.for"(%arg2, %arg3, %arg4) ({
      ^bb0(%arg8: index):
        %6 = "vector.transfer_read"(%arg1, %arg5, %3, %2) <{in_bounds = [false, false], operandSegmentSizes = array<i32: 1, 2, 1, 0>, permutation_map = #map3}> : (memref<?x?xf32>, index, index, f32) -> vector<16x8xf32>
        %7 = "vector.transfer_read"(%arg1, %arg5, %4, %2) <{in_bounds = [false, false], operandSegmentSizes = array<i32: 1, 2, 1, 0>, permutation_map = #map3}> : (memref<?x?xf32>, index, index, f32) -> vector<16x8xf32>
        %8 = "vector.transfer_read"(%arg1, %arg5, %5, %2) <{in_bounds = [false, false], operandSegmentSizes = array<i32: 1, 2, 1, 0>, permutation_map = #map3}> : (memref<?x?xf32>, index, index, f32) -> vector<16x8xf32>
        %9 = "some_use"(%6) : (vector<16x8xf32>) -> vector<16x8xf32>
        %10 = "some_use"(%7) : (vector<16x8xf32>) -> vector<16x8xf32>
        %11 = "some_use"(%8) : (vector<16x8xf32>) -> vector<16x8xf32>
        "vector.transfer_write"(%11, %arg1, %arg5, %5) <{in_bounds = [false, false], operandSegmentSizes = array<i32: 1, 1, 2, 0>, permutation_map = #map3}> : (vector<16x8xf32>, memref<?x?xf32>, index, index) -> ()
        "vector.transfer_write"(%10, %arg1, %arg5, %4) <{in_bounds = [false, false], operandSegmentSizes = array<i32: 1, 1, 2, 0>, permutation_map = #map3}> : (vector<16x8xf32>, memref<?x?xf32>, index, index) -> ()
        "vector.transfer_write"(%9, %arg1, %arg5, %3) <{in_bounds = [false, false], operandSegmentSizes = array<i32: 1, 1, 2, 0>, permutation_map = #map3}> : (vector<16x8xf32>, memref<?x?xf32>, index, index) -> ()
        "scf.yield"() : () -> ()
      }) : (index, index, index) -> ()
      "scf.yield"() : () -> ()
    }) : (index, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["func.func"]}> : (!transform.any_op) -> !transform.any_op
      %1 = "transform.structured.hoist_redundant_vector_transfers"(%0) : (!transform.any_op) -> !transform.any_op
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (index, index, index, vector<3x4xf32>) -> vector<3x4xf32>, sym_name = "hoist_vector_broadcasts"}> ({
  ^bb0(%arg1: index, %arg2: index, %arg3: index, %arg4: vector<3x4xf32>):
    %2 = "scf.for"(%arg1, %arg2, %arg3, %arg4) ({
    ^bb0(%arg5: index, %arg6: vector<3x4xf32>):
      %3 = "vector.extract"(%arg6) <{static_position = array<i64: 0>}> : (vector<3x4xf32>) -> vector<4xf32>
      %4 = "some_use"(%3) : (vector<4xf32>) -> vector<4xf32>
      %5 = "vector.broadcast"(%4) : (vector<4xf32>) -> vector<3x4xf32>
      "scf.yield"(%5) : (vector<3x4xf32>) -> ()
    }) : (index, index, index, vector<3x4xf32>) -> vector<3x4xf32>
    "func.return"(%2) : (vector<3x4xf32>) -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["func.func"]}> : (!transform.any_op) -> !transform.any_op
      %1 = "transform.structured.hoist_redundant_vector_broadcasts"(%0) : (!transform.any_op) -> !transform.any_op
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (index, index, index, vector<3x4xf32>, index) -> vector<3x4xf32>, sym_name = "hoist_vector_broadcasts_dynamic"}> ({
  ^bb0(%arg1: index, %arg2: index, %arg3: index, %arg4: vector<3x4xf32>, %arg5: index):
    %2 = "scf.for"(%arg1, %arg2, %arg3, %arg4) ({
    ^bb0(%arg6: index, %arg7: vector<3x4xf32>):
      %3 = "vector.extract"(%arg7, %arg5) <{static_position = array<i64: -9223372036854775808>}> : (vector<3x4xf32>, index) -> vector<4xf32>
      %4 = "some_use"(%3) : (vector<4xf32>) -> vector<4xf32>
      %5 = "vector.broadcast"(%4) : (vector<4xf32>) -> vector<3x4xf32>
      "scf.yield"(%5) : (vector<3x4xf32>) -> ()
    }) : (index, index, index, vector<3x4xf32>) -> vector<3x4xf32>
    "func.return"(%2) : (vector<3x4xf32>) -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["func.func"]}> : (!transform.any_op) -> !transform.any_op
      %1 = "transform.structured.hoist_redundant_vector_broadcasts"(%0) : (!transform.any_op) -> !transform.any_op
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (index, index, index, vector<3x4xf32>, vector<3x5xf32>) -> (vector<3x4xf32>, vector<3x5xf32>), sym_name = "hoist_vector_broadcasts_multiple"}> ({
  ^bb0(%arg1: index, %arg2: index, %arg3: index, %arg4: vector<3x4xf32>, %arg5: vector<3x5xf32>):
    %2:2 = "scf.for"(%arg1, %arg2, %arg3, %arg4, %arg5) ({
    ^bb0(%arg6: index, %arg7: vector<3x4xf32>, %arg8: vector<3x5xf32>):
      %3 = "vector.extract"(%arg7) <{static_position = array<i64: 0>}> : (vector<3x4xf32>) -> vector<4xf32>
      %4 = "vector.extract"(%arg8) <{static_position = array<i64: 1>}> : (vector<3x5xf32>) -> vector<5xf32>
      %5 = "some_use1"(%3) : (vector<4xf32>) -> vector<4xf32>
      %6 = "some_use2"(%4) : (vector<5xf32>) -> vector<5xf32>
      %7 = "vector.broadcast"(%5) : (vector<4xf32>) -> vector<3x4xf32>
      %8 = "vector.broadcast"(%6) : (vector<5xf32>) -> vector<3x5xf32>
      "scf.yield"(%7, %8) : (vector<3x4xf32>, vector<3x5xf32>) -> ()
    }) : (index, index, index, vector<3x4xf32>, vector<3x5xf32>) -> (vector<3x4xf32>, vector<3x5xf32>)
    "func.return"(%2#0, %2#1) : (vector<3x4xf32>, vector<3x5xf32>) -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["func.func"]}> : (!transform.any_op) -> !transform.any_op
      %1 = "transform.structured.hoist_redundant_vector_broadcasts"(%0) : (!transform.any_op) -> !transform.any_op
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

