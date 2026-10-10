#map = affine_map<()[s0] -> (-(1080 mod s0) + 1080)>
#map1 = affine_map<(d0) -> (d0)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<1x1000xf32>, f32) -> (), sym_name = "eliminate_redundant_masks_through_insert_and_extracts"}> ({
  ^bb0(%arg0: tensor<1x1000xf32>, %arg1: f32):
    %0 = "arith.constant"() <{value = 4 : index}> : () -> index
    %1 = "vector.vscale"() : () -> index
    %2 = "arith.muli"(%1, %0) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
    %3 = "affine.apply"(%2) <{map = #map}> : (index) -> index
    %4 = "arith.constant"() <{value = 0 : index}> : () -> index
    %5 = "arith.constant"() <{value = 1000 : index}> : () -> index
    %6 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %7 = "tensor.extract_slice"(%arg0, %2) <{operandSegmentSizes = array<i32: 1, 0, 1, 0>, static_offsets = array<i64: 0, 0>, static_sizes = array<i64: 1, -9223372036854775808>, static_strides = array<i64: 1, 1>}> : (tensor<1x1000xf32>, index) -> tensor<1x?xf32>
    %8 = "scf.for"(%4, %3, %2, %7) ({
    ^bb0(%arg2: index, %arg3: tensor<1x?xf32>):
      %9 = "tensor.extract_slice"(%arg3, %arg2, %2) <{operandSegmentSizes = array<i32: 1, 1, 1, 0>, static_offsets = array<i64: 0, -9223372036854775808>, static_sizes = array<i64: 1, -9223372036854775808>, static_strides = array<i64: 1, 1>}> : (tensor<1x?xf32>, index, index) -> tensor<?xf32>
      %10 = "tensor.dim"(%9, %4) : (tensor<?xf32>, index) -> index
      %11 = "vector.create_mask"(%10) : (index) -> vector<[4]xi1>
      %12 = "vector.transfer_read"(%9, %4, %6, %11) <{in_bounds = [true], operandSegmentSizes = array<i32: 1, 1, 1, 1>, permutation_map = #map1}> : (tensor<?xf32>, index, f32, vector<[4]xi1>) -> vector<[4]xf32>
      %13 = "vector.mask"(%11) ({
        %16 = "vector.outerproduct"(%12, %arg1) <{kind = #vector.kind<add>}> : (vector<[4]xf32>, f32) -> vector<[4]xf32>
        "vector.yield"(%16) : (vector<[4]xf32>) -> ()
      }) : (vector<[4]xi1>) -> vector<[4]xf32>
      %14 = "vector.transfer_write"(%13, %9, %4, %11) <{in_bounds = [true], operandSegmentSizes = array<i32: 1, 1, 1, 1>, permutation_map = #map1}> : (vector<[4]xf32>, tensor<?xf32>, index, vector<[4]xi1>) -> tensor<?xf32>
      %15 = "tensor.insert_slice"(%14, %arg3, %arg2, %2) <{operandSegmentSizes = array<i32: 1, 1, 1, 1, 0>, static_offsets = array<i64: 0, -9223372036854775808>, static_sizes = array<i64: 1, -9223372036854775808>, static_strides = array<i64: 1, 1>}> : (tensor<?xf32>, tensor<1x?xf32>, index, index) -> tensor<1x?xf32>
      "scf.yield"(%15) : (tensor<1x?xf32>) -> ()
    }) : (index, index, index, tensor<1x?xf32>) -> tensor<1x?xf32>
    "test.some_use"(%8) : (tensor<1x?xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "negative_no_func_body", sym_visibility = "private"}> ({
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0)[s0] -> (-d0 + 1000, s0)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<1000xf32>) -> (), sym_name = "negative_extract_slice_size_shrink"}> ({
  ^bb0(%arg0: tensor<1000xf32>):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = 4 : index}> : () -> index
    %2 = "arith.constant"() <{value = 1000 : index}> : () -> index
    %3 = "vector.vscale"() : () -> index
    %4 = "arith.muli"(%3, %1) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
    %5 = "tensor.extract_slice"(%arg0, %4) <{operandSegmentSizes = array<i32: 1, 0, 1, 0>, static_offsets = array<i64: 0>, static_sizes = array<i64: -9223372036854775808>, static_strides = array<i64: 1>}> : (tensor<1000xf32>, index) -> tensor<?xf32>
    %6 = "scf.for"(%0, %2, %4, %5) ({
    ^bb0(%arg1: index, %arg2: tensor<?xf32>):
      %7 = "tensor.dim"(%arg2, %0) : (tensor<?xf32>, index) -> index
      %8 = "vector.create_mask"(%7) : (index) -> vector<[4]xi1>
      "test.some_use"(%8) : (vector<[4]xi1>) -> ()
      %9 = "affine.min"(%arg1, %4) <{map = #map}> : (index, index) -> index
      %10 = "tensor.extract_slice"(%arg0, %4, %9) <{operandSegmentSizes = array<i32: 1, 1, 1, 0>, static_offsets = array<i64: -9223372036854775808>, static_sizes = array<i64: -9223372036854775808>, static_strides = array<i64: 1>}> : (tensor<1000xf32>, index, index) -> tensor<?xf32>
      "scf.yield"(%10) : (tensor<?xf32>) -> ()
    }) : (index, index, index, tensor<?xf32>) -> tensor<?xf32>
    "test.some_use"(%6) : (tensor<?xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<2x?xf32>) -> (), sym_name = "trivially_all_true_case"}> ({
  ^bb0(%arg0: tensor<2x?xf32>):
    %0 = "arith.constant"() <{value = 2 : index}> : () -> index
    %1 = "arith.constant"() <{value = 4 : index}> : () -> index
    %2 = "vector.vscale"() : () -> index
    %3 = "arith.muli"(%2, %1) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
    %4 = "vector.create_mask"(%0, %3) : (index, index) -> vector<2x[4]xi1>
    "test.some_use"(%4) : (vector<2x[4]xi1>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "negative_constant_dim_not_all_true"}> ({
    %0 = "arith.constant"() <{value = 1 : index}> : () -> index
    %1 = "arith.constant"() <{value = 4 : index}> : () -> index
    %2 = "vector.vscale"() : () -> index
    %3 = "arith.muli"(%2, %1) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
    %4 = "vector.create_mask"(%0, %3) : (index, index) -> vector<2x[4]xi1>
    "test.some_use"(%4) : (vector<2x[4]xi1>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "negative_constant_vscale_multiple_not_all_true"}> ({
    %0 = "arith.constant"() <{value = 2 : index}> : () -> index
    %1 = "arith.constant"() <{value = 3 : index}> : () -> index
    %2 = "vector.vscale"() : () -> index
    %3 = "arith.muli"(%2, %1) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
    %4 = "vector.create_mask"(%0, %3) : (index, index) -> vector<2x[4]xi1>
    "test.some_use"(%4) : (vector<2x[4]xi1>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<2x?xf32>) -> (), sym_name = "negative_value_bounds_fixed_dim_not_all_true"}> ({
  ^bb0(%arg0: tensor<2x?xf32>):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = 4 : index}> : () -> index
    %2 = "vector.vscale"() : () -> index
    %3 = "arith.muli"(%2, %1) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
    %4 = "tensor.dim"(%arg0, %0) : (tensor<2x?xf32>, index) -> index
    %5 = "vector.create_mask"(%4, %3) : (index, index) -> vector<3x[4]xi1>
    "test.some_use"(%5) : (vector<3x[4]xi1>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<2x100xf32>) -> (), sym_name = "negative_value_bounds_scalable_dim_not_all_true"}> ({
  ^bb0(%arg0: tensor<2x100xf32>):
    %0 = "arith.constant"() <{value = 1 : index}> : () -> index
    %1 = "arith.constant"() <{value = 3 : index}> : () -> index
    %2 = "vector.vscale"() : () -> index
    %3 = "arith.muli"(%2, %1) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
    %4 = "tensor.extract_slice"(%arg0, %3) <{operandSegmentSizes = array<i32: 1, 0, 1, 0>, static_offsets = array<i64: 0, 0>, static_sizes = array<i64: 2, -9223372036854775808>, static_strides = array<i64: 1, 1>}> : (tensor<2x100xf32>, index) -> tensor<2x?xf32>
    %5 = "tensor.dim"(%4, %0) : (tensor<2x?xf32>, index) -> index
    %6 = "vector.create_mask"(%1, %5) : (index, index) -> vector<3x[4]xi1>
    "test.some_use"(%6) : (vector<3x[4]xi1>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

