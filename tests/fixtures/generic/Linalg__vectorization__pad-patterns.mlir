#map = affine_map<(d0, d1) -> (d0, d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<5x6xf32>) -> vector<7x9xf32>, sym_name = "pad_and_transfer_read"}> ({
  ^bb0(%arg1: tensor<5x6xf32>):
    %1 = "arith.constant"() <{value = 0 : index}> : () -> index
    %2 = "arith.constant"() <{value = 5.000000e+00 : f32}> : () -> f32
    %3 = "arith.constant"() <{value = 6.000000e+00 : f32}> : () -> f32
    %4 = "tensor.pad"(%arg1) <{operandSegmentSizes = array<i32: 1, 0, 0>, static_high = array<i64: 5, 7>, static_low = array<i64: 0, 0>}> ({
    ^bb0(%arg2: index, %arg3: index):
      "tensor.yield"(%2) : (f32) -> ()
    }) : (tensor<5x6xf32>) -> tensor<10x13xf32>
    %5 = "vector.transfer_read"(%4, %1, %1, %3) <{in_bounds = [false, false], operandSegmentSizes = array<i32: 1, 2, 1, 0>, permutation_map = #map}> : (tensor<10x13xf32>, index, index, f32) -> vector<7x9xf32>
    "func.return"(%5) : (vector<7x9xf32>) -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["func.func"]}> : (!transform.any_op) -> !transform.op<"func.func">
      "transform.apply_patterns"(%0) <{max_iterations = -1 : i64, max_num_rewrites = -1 : i64}> ({
        "transform.apply_patterns.linalg.pad_vectorization"() : () -> ()
      }) : (!transform.op<"func.func">) -> ()
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1) -> (d0, d1)>
"builtin.module"() ({
  "func.func"() <{function_type = () -> vector<7x9xf32>, sym_name = "make_vector", sym_visibility = "private"}> ({
  }) : () -> ()
  "func.func"() <{function_type = (tensor<5x6xf32>) -> tensor<5x6xf32>, sym_name = "pad_and_transfer_write_static_low_and_high"}> ({
  ^bb0(%arg1: tensor<5x6xf32>):
    %1 = "arith.constant"() <{value = 0 : index}> : () -> index
    %2 = "arith.constant"() <{value = 5.000000e+00 : f32}> : () -> f32
    %3 = "tensor.pad"(%arg1) <{operandSegmentSizes = array<i32: 1, 0, 0>, static_high = array<i64: 5, 7>, static_low = array<i64: 0, 0>}> ({
    ^bb0(%arg2: index, %arg3: index):
      "tensor.yield"(%2) : (f32) -> ()
    }) : (tensor<5x6xf32>) -> tensor<10x13xf32>
    %4 = "func.call"() <{callee = @make_vector}> : () -> vector<7x9xf32>
    %5 = "vector.transfer_write"(%4, %3, %1, %1) <{in_bounds = [false, false], operandSegmentSizes = array<i32: 1, 1, 2, 0>, permutation_map = #map}> : (vector<7x9xf32>, tensor<10x13xf32>, index, index) -> tensor<10x13xf32>
    %6 = "tensor.extract_slice"(%5) <{operandSegmentSizes = array<i32: 1, 0, 0, 0>, static_offsets = array<i64: 0, 0>, static_sizes = array<i64: 5, 6>, static_strides = array<i64: 1, 1>}> : (tensor<10x13xf32>) -> tensor<5x6xf32>
    "func.return"(%6) : (tensor<5x6xf32>) -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["func.func"]}> : (!transform.any_op) -> !transform.op<"func.func">
      "transform.apply_patterns"(%0) <{max_iterations = -1 : i64, max_num_rewrites = -1 : i64}> ({
        "transform.apply_patterns.linalg.pad_vectorization"() : () -> ()
      }) : (!transform.op<"func.func">) -> ()
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1) -> (d0, d1)>
"builtin.module"() ({
  "func.func"() <{function_type = () -> vector<7x9xf32>, sym_name = "make_vector", sym_visibility = "private"}> ({
  }) : () -> ()
  "func.func"() <{function_type = (tensor<?x?xf32>, index, index) -> tensor<?x6xf32>, sym_name = "pad_and_transfer_write_static_low_dynamic_high"}> ({
  ^bb0(%arg1: tensor<?x?xf32>, %arg2: index, %arg3: index):
    %1 = "arith.constant"() <{value = 0 : index}> : () -> index
    %2 = "arith.constant"() <{value = 5.000000e+00 : f32}> : () -> f32
    %3 = "tensor.extract_slice"(%arg1, %arg2) <{operandSegmentSizes = array<i32: 1, 0, 1, 0>, static_offsets = array<i64: 0, 0>, static_sizes = array<i64: -9223372036854775808, 6>, static_strides = array<i64: 1, 1>}> : (tensor<?x?xf32>, index) -> tensor<?x6xf32>
    %4 = "tensor.pad"(%3, %arg3) <{operandSegmentSizes = array<i32: 1, 0, 1>, static_high = array<i64: -9223372036854775808, 7>, static_low = array<i64: 0, 0>}> ({
    ^bb0(%arg4: index, %arg5: index):
      "tensor.yield"(%2) : (f32) -> ()
    }) : (tensor<?x6xf32>, index) -> tensor<?x13xf32>
    %5 = "func.call"() <{callee = @make_vector}> : () -> vector<7x9xf32>
    %6 = "vector.transfer_write"(%5, %4, %1, %1) <{in_bounds = [false, false], operandSegmentSizes = array<i32: 1, 1, 2, 0>, permutation_map = #map}> : (vector<7x9xf32>, tensor<?x13xf32>, index, index) -> tensor<?x13xf32>
    %7 = "tensor.extract_slice"(%6, %arg2) <{operandSegmentSizes = array<i32: 1, 0, 1, 0>, static_offsets = array<i64: 0, 0>, static_sizes = array<i64: -9223372036854775808, 6>, static_strides = array<i64: 1, 1>}> : (tensor<?x13xf32>, index) -> tensor<?x6xf32>
    "func.return"(%7) : (tensor<?x6xf32>) -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["func.func"]}> : (!transform.any_op) -> !transform.op<"func.func">
      "transform.apply_patterns"(%0) <{max_iterations = -1 : i64, max_num_rewrites = -1 : i64}> ({
        "transform.apply_patterns.linalg.pad_vectorization"() : () -> ()
      }) : (!transform.op<"func.func">) -> ()
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1) -> (d0, d1)>
"builtin.module"() ({
  "func.func"() <{function_type = () -> vector<7x9xf32>, sym_name = "make_vector", sym_visibility = "private"}> ({
  }) : () -> ()
  "func.func"() <{function_type = (tensor<5x6xf32>) -> tensor<5x6xf32>, sym_name = "pad_and_transfer_write_static_non_zero_low_pad"}> ({
  ^bb0(%arg1: tensor<5x6xf32>):
    %1 = "arith.constant"() <{value = 0 : index}> : () -> index
    %2 = "arith.constant"() <{value = 5.000000e+00 : f32}> : () -> f32
    %3 = "tensor.pad"(%arg1) <{operandSegmentSizes = array<i32: 1, 0, 0>, static_high = array<i64: 5, 6>, static_low = array<i64: 0, 1>}> ({
    ^bb0(%arg2: index, %arg3: index):
      "tensor.yield"(%2) : (f32) -> ()
    }) : (tensor<5x6xf32>) -> tensor<10x13xf32>
    %4 = "func.call"() <{callee = @make_vector}> : () -> vector<7x9xf32>
    %5 = "vector.transfer_write"(%4, %3, %1, %1) <{in_bounds = [false, false], operandSegmentSizes = array<i32: 1, 1, 2, 0>, permutation_map = #map}> : (vector<7x9xf32>, tensor<10x13xf32>, index, index) -> tensor<10x13xf32>
    %6 = "tensor.extract_slice"(%5) <{operandSegmentSizes = array<i32: 1, 0, 0, 0>, static_offsets = array<i64: 0, 0>, static_sizes = array<i64: 5, 6>, static_strides = array<i64: 1, 1>}> : (tensor<10x13xf32>) -> tensor<5x6xf32>
    "func.return"(%6) : (tensor<5x6xf32>) -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["func.func"]}> : (!transform.any_op) -> !transform.op<"func.func">
      "transform.apply_patterns"(%0) <{max_iterations = -1 : i64, max_num_rewrites = -1 : i64}> ({
        "transform.apply_patterns.linalg.pad_vectorization"() : () -> ()
      }) : (!transform.op<"func.func">) -> ()
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1) -> (d0, d1)>
"builtin.module"() ({
  "func.func"() <{function_type = () -> vector<7x9xf32>, sym_name = "make_vector", sym_visibility = "private"}> ({
  }) : () -> ()
  "func.func"() <{function_type = (tensor<5x6xf32>) -> tensor<5x6xf32>, sym_name = "pad_and_transfer_write_static_non_zero_offset"}> ({
  ^bb0(%arg1: tensor<5x6xf32>):
    %1 = "arith.constant"() <{value = 0 : index}> : () -> index
    %2 = "arith.constant"() <{value = 5.000000e+00 : f32}> : () -> f32
    %3 = "tensor.pad"(%arg1) <{operandSegmentSizes = array<i32: 1, 0, 0>, static_high = array<i64: 5, 7>, static_low = array<i64: 0, 0>}> ({
    ^bb0(%arg2: index, %arg3: index):
      "tensor.yield"(%2) : (f32) -> ()
    }) : (tensor<5x6xf32>) -> tensor<10x13xf32>
    %4 = "func.call"() <{callee = @make_vector}> : () -> vector<7x9xf32>
    %5 = "vector.transfer_write"(%4, %3, %1, %1) <{in_bounds = [false, false], operandSegmentSizes = array<i32: 1, 1, 2, 0>, permutation_map = #map}> : (vector<7x9xf32>, tensor<10x13xf32>, index, index) -> tensor<10x13xf32>
    %6 = "tensor.extract_slice"(%5) <{operandSegmentSizes = array<i32: 1, 0, 0, 0>, static_offsets = array<i64: 0, 1>, static_sizes = array<i64: 5, 6>, static_strides = array<i64: 1, 1>}> : (tensor<10x13xf32>) -> tensor<5x6xf32>
    "func.return"(%6) : (tensor<5x6xf32>) -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["func.func"]}> : (!transform.any_op) -> !transform.op<"func.func">
      "transform.apply_patterns"(%0) <{max_iterations = -1 : i64, max_num_rewrites = -1 : i64}> ({
        "transform.apply_patterns.linalg.pad_vectorization"() : () -> ()
      }) : (!transform.op<"func.func">) -> ()
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> tensor<12x13xf32>, sym_name = "make_vector", sym_visibility = "private"}> ({
  }) : () -> ()
  "func.func"() <{function_type = (tensor<5x6xf32>) -> tensor<12x13xf32>, sym_name = "pad_and_insert_slice_source"}> ({
  ^bb0(%arg1: tensor<5x6xf32>):
    %1 = "arith.constant"() <{value = 0 : index}> : () -> index
    %2 = "arith.constant"() <{value = 5.000000e+00 : f32}> : () -> f32
    %3 = "tensor.pad"(%arg1) <{operandSegmentSizes = array<i32: 1, 0, 0>, static_high = array<i64: 2, 3>, static_low = array<i64: 0, 0>}> ({
    ^bb0(%arg2: index, %arg3: index):
      "tensor.yield"(%2) : (f32) -> ()
    }) : (tensor<5x6xf32>) -> tensor<7x9xf32>
    %4 = "func.call"() <{callee = @make_vector}> : () -> tensor<12x13xf32>
    %5 = "tensor.insert_slice"(%3, %4) <{operandSegmentSizes = array<i32: 1, 1, 0, 0, 0>, static_offsets = array<i64: 0, 0>, static_sizes = array<i64: 7, 9>, static_strides = array<i64: 1, 1>}> : (tensor<7x9xf32>, tensor<12x13xf32>) -> tensor<12x13xf32>
    "func.return"(%5) : (tensor<12x13xf32>) -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["func.func"]}> : (!transform.any_op) -> !transform.op<"func.func">
      "transform.apply_patterns"(%0) <{max_iterations = -1 : i64, max_num_rewrites = -1 : i64}> ({
        "transform.apply_patterns.linalg.pad_vectorization"() : () -> ()
      }) : (!transform.op<"func.func">) -> ()
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> tensor<12x13xf32>, sym_name = "make_vector", sym_visibility = "private"}> ({
  }) : () -> ()
  "func.func"() <{function_type = (tensor<1x5x6xf32>) -> tensor<1x12x13xf32>, sym_name = "pad_and_insert_slice_dest"}> ({
  ^bb0(%arg1: tensor<1x5x6xf32>):
    %1 = "arith.constant"() <{value = 5.000000e+00 : f32}> : () -> f32
    %2 = "tensor.pad"(%arg1) <{operandSegmentSizes = array<i32: 1, 0, 0>, static_high = array<i64: 0, 7, 7>, static_low = array<i64: 0, 0, 0>}> ({
    ^bb0(%arg2: index, %arg3: index, %arg4: index):
      "tensor.yield"(%1) : (f32) -> ()
    }) : (tensor<1x5x6xf32>) -> tensor<1x12x13xf32>
    %3 = "func.call"() <{callee = @make_vector}> : () -> tensor<12x13xf32>
    %4 = "tensor.insert_slice"(%3, %2) <{operandSegmentSizes = array<i32: 1, 1, 0, 0, 0>, static_offsets = array<i64: 0, 0, 0>, static_sizes = array<i64: 1, 12, 13>, static_strides = array<i64: 1, 1, 1>}> : (tensor<12x13xf32>, tensor<1x12x13xf32>) -> tensor<1x12x13xf32>
    "func.return"(%4) : (tensor<1x12x13xf32>) -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["func.func"]}> : (!transform.any_op) -> !transform.op<"func.func">
      "transform.apply_patterns"(%0) <{max_iterations = -1 : i64, max_num_rewrites = -1 : i64}> ({
        "transform.apply_patterns.linalg.pad_vectorization"() : () -> ()
      }) : (!transform.op<"func.func">) -> ()
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

