#map = affine_map<(d0) -> (d0)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<128xf32>, tensor<128xf32>) -> (tensor<128xf32>, tensor<128xf32>), sym_name = "fuse_1st_for_into_2nd"}> ({
  ^bb0(%arg1: tensor<128xf32>, %arg2: tensor<128xf32>):
    %3 = "arith.constant"() <{value = 0 : index}> : () -> index
    %4 = "arith.constant"() <{value = 16 : index}> : () -> index
    %5 = "arith.constant"() <{value = 128 : index}> : () -> index
    %6 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %7 = "scf.for"(%3, %5, %4, %arg1) ({
    ^bb0(%arg5: index, %arg6: tensor<128xf32>):
      %13 = "vector.transfer_read"(%arg1, %arg5, %6) <{in_bounds = [true], operandSegmentSizes = array<i32: 1, 1, 1, 0>, permutation_map = #map}> : (tensor<128xf32>, index, f32) -> vector<16xf32>
      %14 = "vector.transfer_read"(%arg6, %arg5, %6) <{in_bounds = [true], operandSegmentSizes = array<i32: 1, 1, 1, 0>, permutation_map = #map}> : (tensor<128xf32>, index, f32) -> vector<16xf32>
      %15 = "arith.addf"(%14, %13) <{fastmath = #arith.fastmath<none>}> : (vector<16xf32>, vector<16xf32>) -> vector<16xf32>
      %16 = "vector.transfer_write"(%15, %arg6, %arg5) <{in_bounds = [true], operandSegmentSizes = array<i32: 1, 1, 1, 0>, permutation_map = #map}> : (vector<16xf32>, tensor<128xf32>, index) -> tensor<128xf32>
      "scf.yield"(%16) : (tensor<128xf32>) -> ()
    }) : (index, index, index, tensor<128xf32>) -> tensor<128xf32>
    %8 = "scf.for"(%3, %5, %4, %arg2) ({
    ^bb0(%arg3: index, %arg4: tensor<128xf32>):
      %9 = "vector.transfer_read"(%arg1, %arg3, %6) <{in_bounds = [true], operandSegmentSizes = array<i32: 1, 1, 1, 0>, permutation_map = #map}> : (tensor<128xf32>, index, f32) -> vector<16xf32>
      %10 = "vector.transfer_read"(%arg4, %arg3, %6) <{in_bounds = [true], operandSegmentSizes = array<i32: 1, 1, 1, 0>, permutation_map = #map}> : (tensor<128xf32>, index, f32) -> vector<16xf32>
      %11 = "arith.addf"(%10, %9) <{fastmath = #arith.fastmath<none>}> : (vector<16xf32>, vector<16xf32>) -> vector<16xf32>
      %12 = "vector.transfer_write"(%11, %arg4, %arg3) <{in_bounds = [true], operandSegmentSizes = array<i32: 1, 1, 1, 0>, permutation_map = #map}> : (vector<16xf32>, tensor<128xf32>, index) -> tensor<128xf32>
      "scf.yield"(%12) : (tensor<128xf32>) -> ()
    }) : (index, index, index, tensor<128xf32>) -> tensor<128xf32>
    "func.return"(%7, %8) : (tensor<128xf32>, tensor<128xf32>) -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["scf.for"]}> : (!transform.any_op) -> !transform.any_op
      %1:2 = "transform.split_handle"(%0) <{fail_on_payload_too_small = true, pass_through_empty_handle = true}> : (!transform.any_op) -> (!transform.any_op, !transform.any_op)
      %2 = "transform.loop.fuse_sibling"(%1#0, %1#1) : (!transform.any_op, !transform.any_op) -> !transform.any_op
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0) -> (d0)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<128xf32>, tensor<128xf32>) -> (tensor<128xf32>, tensor<128xf32>), sym_name = "fuse_2nd_for_into_1st"}> ({
  ^bb0(%arg1: tensor<128xf32>, %arg2: tensor<128xf32>):
    %3 = "arith.constant"() <{value = 0 : index}> : () -> index
    %4 = "arith.constant"() <{value = 16 : index}> : () -> index
    %5 = "arith.constant"() <{value = 128 : index}> : () -> index
    %6 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %7 = "scf.for"(%3, %5, %4, %arg1) ({
    ^bb0(%arg5: index, %arg6: tensor<128xf32>):
      %13 = "vector.transfer_read"(%arg1, %arg5, %6) <{in_bounds = [true], operandSegmentSizes = array<i32: 1, 1, 1, 0>, permutation_map = #map}> : (tensor<128xf32>, index, f32) -> vector<16xf32>
      %14 = "vector.transfer_read"(%arg6, %arg5, %6) <{in_bounds = [true], operandSegmentSizes = array<i32: 1, 1, 1, 0>, permutation_map = #map}> : (tensor<128xf32>, index, f32) -> vector<16xf32>
      %15 = "arith.addf"(%14, %13) <{fastmath = #arith.fastmath<none>}> : (vector<16xf32>, vector<16xf32>) -> vector<16xf32>
      %16 = "vector.transfer_write"(%15, %arg6, %arg5) <{in_bounds = [true], operandSegmentSizes = array<i32: 1, 1, 1, 0>, permutation_map = #map}> : (vector<16xf32>, tensor<128xf32>, index) -> tensor<128xf32>
      "scf.yield"(%16) : (tensor<128xf32>) -> ()
    }) : (index, index, index, tensor<128xf32>) -> tensor<128xf32>
    %8 = "scf.for"(%3, %5, %4, %arg2) ({
    ^bb0(%arg3: index, %arg4: tensor<128xf32>):
      %9 = "vector.transfer_read"(%arg1, %arg3, %6) <{in_bounds = [true], operandSegmentSizes = array<i32: 1, 1, 1, 0>, permutation_map = #map}> : (tensor<128xf32>, index, f32) -> vector<16xf32>
      %10 = "vector.transfer_read"(%arg4, %arg3, %6) <{in_bounds = [true], operandSegmentSizes = array<i32: 1, 1, 1, 0>, permutation_map = #map}> : (tensor<128xf32>, index, f32) -> vector<16xf32>
      %11 = "arith.addf"(%10, %9) <{fastmath = #arith.fastmath<none>}> : (vector<16xf32>, vector<16xf32>) -> vector<16xf32>
      %12 = "vector.transfer_write"(%11, %arg4, %arg3) <{in_bounds = [true], operandSegmentSizes = array<i32: 1, 1, 1, 0>, permutation_map = #map}> : (vector<16xf32>, tensor<128xf32>, index) -> tensor<128xf32>
      "scf.yield"(%12) : (tensor<128xf32>) -> ()
    }) : (index, index, index, tensor<128xf32>) -> tensor<128xf32>
    "func.return"(%7, %8) : (tensor<128xf32>, tensor<128xf32>) -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["scf.for"]}> : (!transform.any_op) -> !transform.any_op
      %1:2 = "transform.split_handle"(%0) <{fail_on_payload_too_small = true, pass_through_empty_handle = true}> : (!transform.any_op) -> (!transform.any_op, !transform.any_op)
      %2 = "transform.loop.fuse_sibling"(%1#1, %1#0) : (!transform.any_op, !transform.any_op) -> !transform.any_op
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2) -> (d0, d2)>
#map1 = affine_map<(d0, d1, d2) -> (d2, d1)>
#map2 = affine_map<(d0, d1, d2) -> (d0, d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<128x128xf32>, tensor<128x128xf32>, tensor<128x128xf32>) -> (tensor<128x128xf32>, tensor<128x128xf32>), sym_name = "matmul_fuse_1st_forall_into_2nd"}> ({
  ^bb0(%arg1: tensor<128x128xf32>, %arg2: tensor<128x128xf32>, %arg3: tensor<128x128xf32>):
    %5 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %6 = "tensor.empty"() : () -> tensor<128x128xf32>
    %7 = "linalg.fill"(%5, %6) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg10: f32, %arg11: f32):
      "linalg.yield"(%arg10) : (f32) -> ()
    }) : (f32, tensor<128x128xf32>) -> tensor<128x128xf32>
    %8 = "linalg.matmul"(%arg1, %arg3, %7) <{indexing_maps = [#map, #map1, #map2], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg7: f32, %arg8: f32, %arg9: f32):
      %12 = "arith.mulf"(%arg7, %arg8) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %13 = "arith.addf"(%arg9, %12) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%13) : (f32) -> ()
    }) : (tensor<128x128xf32>, tensor<128x128xf32>, tensor<128x128xf32>) -> tensor<128x128xf32>
    %9 = "linalg.matmul"(%arg2, %arg3, %7) <{indexing_maps = [#map, #map1, #map2], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg4: f32, %arg5: f32, %arg6: f32):
      %10 = "arith.mulf"(%arg4, %arg5) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %11 = "arith.addf"(%arg6, %10) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%11) : (f32) -> ()
    }) : (tensor<128x128xf32>, tensor<128x128xf32>, tensor<128x128xf32>) -> tensor<128x128xf32>
    "func.return"(%8, %9) : (tensor<128x128xf32>, tensor<128x128xf32>) -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["linalg.matmul"]}> : (!transform.any_op) -> !transform.any_op
      %1:2 = "transform.split_handle"(%0) <{fail_on_payload_too_small = true, pass_through_empty_handle = true}> : (!transform.any_op) -> (!transform.any_op, !transform.any_op)
      %2:2 = "transform.structured.tile_using_forall"(%1#0) <{operandSegmentSizes = array<i32: 1, 0, 0, 0, 0>, static_tile_sizes = array<i64: 32>}> : (!transform.any_op) -> (!transform.any_op, !transform.any_op)
      %3:2 = "transform.structured.tile_using_forall"(%1#1) <{operandSegmentSizes = array<i32: 1, 0, 0, 0, 0>, static_tile_sizes = array<i64: 32>}> : (!transform.any_op) -> (!transform.any_op, !transform.any_op)
      %4 = "transform.loop.fuse_sibling"(%3#1, %2#1) : (!transform.any_op, !transform.any_op) -> !transform.any_op
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2) -> (d0, d2)>
#map1 = affine_map<(d0, d1, d2) -> (d2, d1)>
#map2 = affine_map<(d0, d1, d2) -> (d0, d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<128x128xf32>, tensor<128x128xf32>, tensor<128x128xf32>) -> (tensor<128x128xf32>, tensor<128x128xf32>), sym_name = "matmul_fuse_2nd_forall_into_1st"}> ({
  ^bb0(%arg1: tensor<128x128xf32>, %arg2: tensor<128x128xf32>, %arg3: tensor<128x128xf32>):
    %5 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %6 = "tensor.empty"() : () -> tensor<128x128xf32>
    %7 = "linalg.fill"(%5, %6) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg10: f32, %arg11: f32):
      "linalg.yield"(%arg10) : (f32) -> ()
    }) : (f32, tensor<128x128xf32>) -> tensor<128x128xf32>
    %8 = "linalg.matmul"(%arg1, %arg3, %7) <{indexing_maps = [#map, #map1, #map2], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg7: f32, %arg8: f32, %arg9: f32):
      %12 = "arith.mulf"(%arg7, %arg8) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %13 = "arith.addf"(%arg9, %12) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%13) : (f32) -> ()
    }) : (tensor<128x128xf32>, tensor<128x128xf32>, tensor<128x128xf32>) -> tensor<128x128xf32>
    %9 = "linalg.matmul"(%arg2, %arg3, %7) <{indexing_maps = [#map, #map1, #map2], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg4: f32, %arg5: f32, %arg6: f32):
      %10 = "arith.mulf"(%arg4, %arg5) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %11 = "arith.addf"(%arg6, %10) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%11) : (f32) -> ()
    }) : (tensor<128x128xf32>, tensor<128x128xf32>, tensor<128x128xf32>) -> tensor<128x128xf32>
    "func.return"(%8, %9) : (tensor<128x128xf32>, tensor<128x128xf32>) -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["linalg.matmul"]}> : (!transform.any_op) -> !transform.any_op
      %1:2 = "transform.split_handle"(%0) <{fail_on_payload_too_small = true, pass_through_empty_handle = true}> : (!transform.any_op) -> (!transform.any_op, !transform.any_op)
      %2:2 = "transform.structured.tile_using_forall"(%1#0) <{operandSegmentSizes = array<i32: 1, 0, 0, 0, 0>, static_tile_sizes = array<i64: 32>}> : (!transform.any_op) -> (!transform.any_op, !transform.any_op)
      %3:2 = "transform.structured.tile_using_forall"(%1#1) <{operandSegmentSizes = array<i32: 1, 0, 0, 0, 0>, static_tile_sizes = array<i64: 32>}> : (!transform.any_op) -> (!transform.any_op, !transform.any_op)
      %4 = "transform.loop.fuse_sibling"(%2#1, %3#1) : (!transform.any_op, !transform.any_op) -> !transform.any_op
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0) -> (d0)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<128xf32>, tensor<128xf32>) -> (), sym_name = "fuse_no_iter_args"}> ({
  ^bb0(%arg1: tensor<128xf32>, %arg2: tensor<128xf32>):
    %3 = "arith.constant"() <{value = 0 : index}> : () -> index
    %4 = "arith.constant"() <{value = 16 : index}> : () -> index
    %5 = "arith.constant"() <{value = 128 : index}> : () -> index
    %6 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    "scf.for"(%3, %5, %4) ({
    ^bb0(%arg4: index):
      %8 = "vector.transfer_read"(%arg1, %arg4, %6) <{in_bounds = [true], operandSegmentSizes = array<i32: 1, 1, 1, 0>, permutation_map = #map}> : (tensor<128xf32>, index, f32) -> vector<16xf32>
      "scf.yield"() : () -> ()
    }) : (index, index, index) -> ()
    "scf.for"(%3, %5, %4) ({
    ^bb0(%arg3: index):
      %7 = "vector.transfer_read"(%arg2, %arg3, %6) <{in_bounds = [true], operandSegmentSizes = array<i32: 1, 1, 1, 0>, permutation_map = #map}> : (tensor<128xf32>, index, f32) -> vector<16xf32>
      "scf.yield"() : () -> ()
    }) : (index, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["scf.for"]}> : (!transform.any_op) -> !transform.any_op
      %1:2 = "transform.split_handle"(%0) <{fail_on_payload_too_small = true, pass_through_empty_handle = true}> : (!transform.any_op) -> (!transform.any_op, !transform.any_op)
      %2 = "transform.loop.fuse_sibling"(%1#0, %1#1) : (!transform.any_op, !transform.any_op) -> !transform.any_op
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0) -> (d0)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<128xf32>, tensor<128xf32>) -> (tensor<128xf32>, tensor<128xf32>), sym_name = "source_for_uses_result_of_target_for_err"}> ({
  ^bb0(%arg1: tensor<128xf32>, %arg2: tensor<128xf32>):
    %3 = "arith.constant"() <{value = 0 : index}> : () -> index
    %4 = "arith.constant"() <{value = 16 : index}> : () -> index
    %5 = "arith.constant"() <{value = 128 : index}> : () -> index
    %6 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %7 = "scf.for"(%3, %5, %4, %arg1) ({
    ^bb0(%arg5: index, %arg6: tensor<128xf32>):
      %13 = "vector.transfer_read"(%arg1, %arg5, %6) <{in_bounds = [true], operandSegmentSizes = array<i32: 1, 1, 1, 0>, permutation_map = #map}> : (tensor<128xf32>, index, f32) -> vector<16xf32>
      %14 = "vector.transfer_read"(%arg6, %arg5, %6) <{in_bounds = [true], operandSegmentSizes = array<i32: 1, 1, 1, 0>, permutation_map = #map}> : (tensor<128xf32>, index, f32) -> vector<16xf32>
      %15 = "arith.addf"(%14, %13) <{fastmath = #arith.fastmath<none>}> : (vector<16xf32>, vector<16xf32>) -> vector<16xf32>
      %16 = "vector.transfer_write"(%15, %arg6, %arg5) <{in_bounds = [true], operandSegmentSizes = array<i32: 1, 1, 1, 0>, permutation_map = #map}> : (vector<16xf32>, tensor<128xf32>, index) -> tensor<128xf32>
      "scf.yield"(%16) : (tensor<128xf32>) -> ()
    }) : (index, index, index, tensor<128xf32>) -> tensor<128xf32>
    %8 = "scf.for"(%3, %5, %4, %7) ({
    ^bb0(%arg3: index, %arg4: tensor<128xf32>):
      %9 = "vector.transfer_read"(%arg1, %arg3, %6) <{in_bounds = [true], operandSegmentSizes = array<i32: 1, 1, 1, 0>, permutation_map = #map}> : (tensor<128xf32>, index, f32) -> vector<16xf32>
      %10 = "vector.transfer_read"(%arg4, %arg3, %6) <{in_bounds = [true], operandSegmentSizes = array<i32: 1, 1, 1, 0>, permutation_map = #map}> : (tensor<128xf32>, index, f32) -> vector<16xf32>
      %11 = "arith.addf"(%10, %9) <{fastmath = #arith.fastmath<none>}> : (vector<16xf32>, vector<16xf32>) -> vector<16xf32>
      %12 = "vector.transfer_write"(%11, %arg4, %arg3) <{in_bounds = [true], operandSegmentSizes = array<i32: 1, 1, 1, 0>, permutation_map = #map}> : (vector<16xf32>, tensor<128xf32>, index) -> tensor<128xf32>
      "scf.yield"(%12) : (tensor<128xf32>) -> ()
    }) : (index, index, index, tensor<128xf32>) -> tensor<128xf32>
    "func.return"(%7, %8) : (tensor<128xf32>, tensor<128xf32>) -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["scf.for"]}> : (!transform.any_op) -> !transform.any_op
      %1:2 = "transform.split_handle"(%0) <{fail_on_payload_too_small = true, pass_through_empty_handle = true}> : (!transform.any_op) -> (!transform.any_op, !transform.any_op)
      %2 = "transform.loop.fuse_sibling"(%1#0, %1#1) : (!transform.any_op, !transform.any_op) -> !transform.any_op
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2) -> (d0, d2)>
#map1 = affine_map<(d0, d1, d2) -> (d2, d1)>
#map2 = affine_map<(d0, d1, d2) -> (d0, d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<128x128xf32>, tensor<128x128xf32>, tensor<128x128xf32>) -> (tensor<128x128xf32>, tensor<128x128xf32>), sym_name = "source_forall_uses_result_of_target_forall_err"}> ({
  ^bb0(%arg1: tensor<128x128xf32>, %arg2: tensor<128x128xf32>, %arg3: tensor<128x128xf32>):
    %5 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %6 = "tensor.empty"() : () -> tensor<128x128xf32>
    %7 = "linalg.fill"(%5, %6) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg10: f32, %arg11: f32):
      "linalg.yield"(%arg10) : (f32) -> ()
    }) : (f32, tensor<128x128xf32>) -> tensor<128x128xf32>
    %8 = "linalg.matmul"(%arg1, %arg2, %7) <{indexing_maps = [#map, #map1, #map2], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg7: f32, %arg8: f32, %arg9: f32):
      %12 = "arith.mulf"(%arg7, %arg8) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %13 = "arith.addf"(%arg9, %12) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%13) : (f32) -> ()
    }) : (tensor<128x128xf32>, tensor<128x128xf32>, tensor<128x128xf32>) -> tensor<128x128xf32>
    %9 = "linalg.matmul"(%arg1, %8, %7) <{indexing_maps = [#map, #map1, #map2], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg4: f32, %arg5: f32, %arg6: f32):
      %10 = "arith.mulf"(%arg4, %arg5) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %11 = "arith.addf"(%arg6, %10) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%11) : (f32) -> ()
    }) : (tensor<128x128xf32>, tensor<128x128xf32>, tensor<128x128xf32>) -> tensor<128x128xf32>
    "func.return"(%8, %9) : (tensor<128x128xf32>, tensor<128x128xf32>) -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["linalg.matmul"]}> : (!transform.any_op) -> !transform.any_op
      %1:2 = "transform.split_handle"(%0) <{fail_on_payload_too_small = true, pass_through_empty_handle = true}> : (!transform.any_op) -> (!transform.any_op, !transform.any_op)
      %2:2 = "transform.structured.tile_using_forall"(%1#0) <{operandSegmentSizes = array<i32: 1, 0, 0, 0, 0>, static_tile_sizes = array<i64: 32>}> : (!transform.any_op) -> (!transform.any_op, !transform.any_op)
      %3:2 = "transform.structured.tile_using_forall"(%1#1) <{operandSegmentSizes = array<i32: 1, 0, 0, 0, 0>, static_tile_sizes = array<i64: 32>}> : (!transform.any_op) -> (!transform.any_op, !transform.any_op)
      %4 = "transform.loop.fuse_sibling"(%2#1, %3#1) : (!transform.any_op, !transform.any_op) -> !transform.any_op
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0) -> (d0)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<128xf32>, tensor<128xf32>) -> (tensor<128xf32>, tensor<128xf32>), sym_name = "target_for_region_uses_result_of_source_for_err"}> ({
  ^bb0(%arg1: tensor<128xf32>, %arg2: tensor<128xf32>):
    %3 = "arith.constant"() <{value = 0 : index}> : () -> index
    %4 = "arith.constant"() <{value = 16 : index}> : () -> index
    %5 = "arith.constant"() <{value = 128 : index}> : () -> index
    %6 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %7 = "scf.for"(%3, %5, %4, %arg1) ({
    ^bb0(%arg5: index, %arg6: tensor<128xf32>):
      %13 = "vector.transfer_read"(%arg1, %arg5, %6) <{in_bounds = [true], operandSegmentSizes = array<i32: 1, 1, 1, 0>, permutation_map = #map}> : (tensor<128xf32>, index, f32) -> vector<16xf32>
      %14 = "vector.transfer_read"(%arg6, %arg5, %6) <{in_bounds = [true], operandSegmentSizes = array<i32: 1, 1, 1, 0>, permutation_map = #map}> : (tensor<128xf32>, index, f32) -> vector<16xf32>
      %15 = "arith.addf"(%14, %13) <{fastmath = #arith.fastmath<none>}> : (vector<16xf32>, vector<16xf32>) -> vector<16xf32>
      %16 = "vector.transfer_write"(%15, %arg6, %arg5) <{in_bounds = [true], operandSegmentSizes = array<i32: 1, 1, 1, 0>, permutation_map = #map}> : (vector<16xf32>, tensor<128xf32>, index) -> tensor<128xf32>
      "scf.yield"(%16) : (tensor<128xf32>) -> ()
    }) : (index, index, index, tensor<128xf32>) -> tensor<128xf32>
    %8 = "scf.for"(%3, %5, %4, %arg2) ({
    ^bb0(%arg3: index, %arg4: tensor<128xf32>):
      %9 = "vector.transfer_read"(%7, %arg3, %6) <{in_bounds = [true], operandSegmentSizes = array<i32: 1, 1, 1, 0>, permutation_map = #map}> : (tensor<128xf32>, index, f32) -> vector<16xf32>
      %10 = "vector.transfer_read"(%arg4, %arg3, %6) <{in_bounds = [true], operandSegmentSizes = array<i32: 1, 1, 1, 0>, permutation_map = #map}> : (tensor<128xf32>, index, f32) -> vector<16xf32>
      %11 = "arith.addf"(%10, %9) <{fastmath = #arith.fastmath<none>}> : (vector<16xf32>, vector<16xf32>) -> vector<16xf32>
      %12 = "vector.transfer_write"(%11, %arg4, %arg3) <{in_bounds = [true], operandSegmentSizes = array<i32: 1, 1, 1, 0>, permutation_map = #map}> : (vector<16xf32>, tensor<128xf32>, index) -> tensor<128xf32>
      "scf.yield"(%12) : (tensor<128xf32>) -> ()
    }) : (index, index, index, tensor<128xf32>) -> tensor<128xf32>
    "func.return"(%7, %8) : (tensor<128xf32>, tensor<128xf32>) -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["scf.for"]}> : (!transform.any_op) -> !transform.any_op
      %1:2 = "transform.split_handle"(%0) <{fail_on_payload_too_small = true, pass_through_empty_handle = true}> : (!transform.any_op) -> (!transform.any_op, !transform.any_op)
      %2 = "transform.loop.fuse_sibling"(%1#1, %1#0) : (!transform.any_op, !transform.any_op) -> !transform.any_op
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2) -> (d0, d2)>
#map1 = affine_map<(d0, d1, d2) -> (d2, d1)>
#map2 = affine_map<(d0, d1, d2) -> (d0, d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<128x128xf32>, tensor<128x128xf32>, tensor<128x128xf32>) -> (tensor<128x128xf32>, tensor<128x128xf32>), sym_name = "target_forall_depends_on_value_not_dominated_by_source_forall_err"}> ({
  ^bb0(%arg1: tensor<128x128xf32>, %arg2: tensor<128x128xf32>, %arg3: tensor<128x128xf32>):
    %5 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %6 = "tensor.empty"() : () -> tensor<128x128xf32>
    %7 = "linalg.fill"(%5, %6) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg12: f32, %arg13: f32):
      "linalg.yield"(%arg12) : (f32) -> ()
    }) : (f32, tensor<128x128xf32>) -> tensor<128x128xf32>
    %8 = "linalg.matmul"(%arg1, %arg3, %7) <{indexing_maps = [#map, #map1, #map2], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg9: f32, %arg10: f32, %arg11: f32):
      %14 = "arith.mulf"(%arg9, %arg10) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %15 = "arith.addf"(%arg11, %14) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%15) : (f32) -> ()
    }) : (tensor<128x128xf32>, tensor<128x128xf32>, tensor<128x128xf32>) -> tensor<128x128xf32>
    %9 = "tensor.empty"() : () -> tensor<128x128xf32>
    %10 = "linalg.fill"(%5, %6) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg7: f32, %arg8: f32):
      "linalg.yield"(%arg7) : (f32) -> ()
    }) : (f32, tensor<128x128xf32>) -> tensor<128x128xf32>
    %11 = "linalg.matmul"(%arg2, %arg3, %10) <{indexing_maps = [#map, #map1, #map2], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg4: f32, %arg5: f32, %arg6: f32):
      %12 = "arith.mulf"(%arg4, %arg5) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %13 = "arith.addf"(%arg6, %12) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%13) : (f32) -> ()
    }) : (tensor<128x128xf32>, tensor<128x128xf32>, tensor<128x128xf32>) -> tensor<128x128xf32>
    "func.return"(%8, %11) : (tensor<128x128xf32>, tensor<128x128xf32>) -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["linalg.matmul"]}> : (!transform.any_op) -> !transform.any_op
      %1:2 = "transform.split_handle"(%0) <{fail_on_payload_too_small = true, pass_through_empty_handle = true}> : (!transform.any_op) -> (!transform.any_op, !transform.any_op)
      %2:2 = "transform.structured.tile_using_forall"(%1#0) <{operandSegmentSizes = array<i32: 1, 0, 0, 0, 0>, static_tile_sizes = array<i64: 32>}> : (!transform.any_op) -> (!transform.any_op, !transform.any_op)
      %3:2 = "transform.structured.tile_using_forall"(%1#1) <{operandSegmentSizes = array<i32: 1, 0, 0, 0, 0>, static_tile_sizes = array<i64: 32>}> : (!transform.any_op) -> (!transform.any_op, !transform.any_op)
      %4 = "transform.loop.fuse_sibling"(%3#1, %2#1) : (!transform.any_op, !transform.any_op) -> !transform.any_op
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0) -> (d0)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<128xf32>, tensor<128xf32>) -> (tensor<128xf32>, tensor<128xf32>, tensor<128xf32>, tensor<128xf32>), sym_name = "foreach_loop_pair_fuse"}> ({
  ^bb0(%arg3: tensor<128xf32>, %arg4: tensor<128xf32>):
    %3 = "arith.constant"() <{value = 0 : index}> : () -> index
    %4 = "arith.constant"() <{value = 16 : index}> : () -> index
    %5 = "arith.constant"() <{value = 32 : index}> : () -> index
    %6 = "arith.constant"() <{value = 128 : index}> : () -> index
    %7 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %8 = "scf.for"(%3, %6, %4, %arg4) ({
    ^bb0(%arg11: index, %arg12: tensor<128xf32>):
      %24 = "vector.transfer_read"(%arg3, %arg11, %7) <{in_bounds = [true], operandSegmentSizes = array<i32: 1, 1, 1, 0>, permutation_map = #map}> : (tensor<128xf32>, index, f32) -> vector<16xf32>
      %25 = "vector.transfer_read"(%arg12, %arg11, %7) <{in_bounds = [true], operandSegmentSizes = array<i32: 1, 1, 1, 0>, permutation_map = #map}> : (tensor<128xf32>, index, f32) -> vector<16xf32>
      %26 = "arith.addf"(%25, %24) <{fastmath = #arith.fastmath<none>}> : (vector<16xf32>, vector<16xf32>) -> vector<16xf32>
      %27 = "vector.transfer_write"(%26, %arg12, %arg11) <{in_bounds = [true], operandSegmentSizes = array<i32: 1, 1, 1, 0>, permutation_map = #map}> : (vector<16xf32>, tensor<128xf32>, index) -> tensor<128xf32>
      "scf.yield"(%27) : (tensor<128xf32>) -> ()
    }) {target_loops} : (index, index, index, tensor<128xf32>) -> tensor<128xf32>
    %9 = "scf.for"(%3, %6, %4, %arg4) ({
    ^bb0(%arg9: index, %arg10: tensor<128xf32>):
      %20 = "vector.transfer_read"(%arg3, %arg9, %7) <{in_bounds = [true], operandSegmentSizes = array<i32: 1, 1, 1, 0>, permutation_map = #map}> : (tensor<128xf32>, index, f32) -> vector<16xf32>
      %21 = "vector.transfer_read"(%arg10, %arg9, %7) <{in_bounds = [true], operandSegmentSizes = array<i32: 1, 1, 1, 0>, permutation_map = #map}> : (tensor<128xf32>, index, f32) -> vector<16xf32>
      %22 = "arith.addf"(%21, %20) <{fastmath = #arith.fastmath<none>}> : (vector<16xf32>, vector<16xf32>) -> vector<16xf32>
      %23 = "vector.transfer_write"(%22, %arg10, %arg9) <{in_bounds = [true], operandSegmentSizes = array<i32: 1, 1, 1, 0>, permutation_map = #map}> : (vector<16xf32>, tensor<128xf32>, index) -> tensor<128xf32>
      "scf.yield"(%23) : (tensor<128xf32>) -> ()
    }) {source_loops} : (index, index, index, tensor<128xf32>) -> tensor<128xf32>
    %10 = "scf.for"(%3, %6, %5, %arg4) ({
    ^bb0(%arg7: index, %arg8: tensor<128xf32>):
      %16 = "vector.transfer_read"(%arg3, %arg7, %7) <{in_bounds = [true], operandSegmentSizes = array<i32: 1, 1, 1, 0>, permutation_map = #map}> : (tensor<128xf32>, index, f32) -> vector<32xf32>
      %17 = "vector.transfer_read"(%arg8, %arg7, %7) <{in_bounds = [true], operandSegmentSizes = array<i32: 1, 1, 1, 0>, permutation_map = #map}> : (tensor<128xf32>, index, f32) -> vector<32xf32>
      %18 = "arith.addf"(%17, %16) <{fastmath = #arith.fastmath<none>}> : (vector<32xf32>, vector<32xf32>) -> vector<32xf32>
      %19 = "vector.transfer_write"(%18, %arg8, %arg7) <{in_bounds = [true], operandSegmentSizes = array<i32: 1, 1, 1, 0>, permutation_map = #map}> : (vector<32xf32>, tensor<128xf32>, index) -> tensor<128xf32>
      "scf.yield"(%19) : (tensor<128xf32>) -> ()
    }) {target_loops} : (index, index, index, tensor<128xf32>) -> tensor<128xf32>
    %11 = "scf.for"(%3, %6, %5, %arg4) ({
    ^bb0(%arg5: index, %arg6: tensor<128xf32>):
      %12 = "vector.transfer_read"(%arg3, %arg5, %7) <{in_bounds = [true], operandSegmentSizes = array<i32: 1, 1, 1, 0>, permutation_map = #map}> : (tensor<128xf32>, index, f32) -> vector<32xf32>
      %13 = "vector.transfer_read"(%arg6, %arg5, %7) <{in_bounds = [true], operandSegmentSizes = array<i32: 1, 1, 1, 0>, permutation_map = #map}> : (tensor<128xf32>, index, f32) -> vector<32xf32>
      %14 = "arith.addf"(%13, %12) <{fastmath = #arith.fastmath<none>}> : (vector<32xf32>, vector<32xf32>) -> vector<32xf32>
      %15 = "vector.transfer_write"(%14, %arg6, %arg5) <{in_bounds = [true], operandSegmentSizes = array<i32: 1, 1, 1, 0>, permutation_map = #map}> : (vector<32xf32>, tensor<128xf32>, index) -> tensor<128xf32>
      "scf.yield"(%15) : (tensor<128xf32>) -> ()
    }) {source_loops} : (index, index, index, tensor<128xf32>) -> tensor<128xf32>
    "func.return"(%8, %9, %10, %11) : (tensor<128xf32>, tensor<128xf32>, tensor<128xf32>, tensor<128xf32>) -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{op_attrs = {target_loops}, ops = ["scf.for"]}> : (!transform.any_op) -> !transform.any_op
      %1 = "transform.structured.match"(%arg0) <{op_attrs = {source_loops}, ops = ["scf.for"]}> : (!transform.any_op) -> !transform.any_op
      "transform.foreach"(%0, %1) ({
      ^bb0(%arg1: !transform.any_op, %arg2: !transform.any_op):
        %2 = "transform.loop.fuse_sibling"(%arg1, %arg2) : (!transform.any_op, !transform.any_op) -> !transform.any_op
        "transform.yield"() : () -> ()
      }) : (!transform.any_op, !transform.any_op) -> ()
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

