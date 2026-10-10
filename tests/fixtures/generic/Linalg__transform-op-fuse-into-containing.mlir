#map = affine_map<()[s0, s1] -> (s0 ceildiv s1)>
#map1 = affine_map<(d0)[s0] -> (d0 * s0)>
#map2 = affine_map<(d0)[s0, s1] -> (-(d0 * s1) + s0, s1)>
#map3 = affine_map<(d0) -> (d0)>
"builtin.module"() ({
  "func.func"() <{function_type = (index, tensor<?xf32>, tensor<?xf32>) -> tensor<?xf32>, sym_name = "fuse_tileable_op"}> ({
  ^bb0(%arg1: index, %arg2: tensor<?xf32>, %arg3: tensor<?xf32>):
    %3 = "arith.constant"() <{value = 4.200000e+01 : f32}> : () -> f32
    %4 = "arith.constant"() <{value = 0 : index}> : () -> index
    %5 = "linalg.fill"(%3, %arg2) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg8: f32, %arg9: f32):
      "linalg.yield"(%arg8) : (f32) -> ()
    }) : (f32, tensor<?xf32>) -> tensor<?xf32>
    %6 = "tensor.dim"(%arg2, %4) : (tensor<?xf32>, index) -> index
    %7 = "affine.apply"(%6, %arg1) <{map = #map}> : (index, index) -> index
    %8 = "scf.forall"(%7, %arg3) <{operandSegmentSizes = array<i32: 0, 1, 0, 1>, staticLowerBound = array<i64: 0>, staticStep = array<i64: 1>, staticUpperBound = array<i64: -9223372036854775808>}> ({
    ^bb0(%arg4: index, %arg5: tensor<?xf32>):
      %9 = "affine.apply"(%arg4, %arg1) <{map = #map1}> : (index, index) -> index
      %10 = "affine.min"(%arg4, %6, %arg1) <{map = #map2}> : (index, index, index) -> index
      %11 = "tensor.extract_slice"(%arg5, %9, %10) <{operandSegmentSizes = array<i32: 1, 1, 1, 0>, static_offsets = array<i64: -9223372036854775808>, static_sizes = array<i64: -9223372036854775808>, static_strides = array<i64: 1>}> : (tensor<?xf32>, index, index) -> tensor<?xf32>
      %12 = "tensor.extract_slice"(%5, %9, %10) <{operandSegmentSizes = array<i32: 1, 1, 1, 0>, static_offsets = array<i64: -9223372036854775808>, static_sizes = array<i64: -9223372036854775808>, static_strides = array<i64: 1>}> : (tensor<?xf32>, index, index) -> tensor<?xf32>
      %13 = "linalg.elementwise"(%12, %11) <{indexing_maps = [#map3, #map3], kind = #linalg.elementwise_kind<exp>, operandSegmentSizes = array<i32: 1, 1>}> ({
      ^bb0(%arg6: f32, %arg7: f32):
        %14 = "math.exp"(%arg6) <{fastmath = #arith.fastmath<none>}> : (f32) -> f32
        "linalg.yield"(%14) : (f32) -> ()
      }) : (tensor<?xf32>, tensor<?xf32>) -> tensor<?xf32>
      "scf.forall.in_parallel"() ({
        "tensor.parallel_insert_slice"(%13, %arg5, %9, %10) <{operandSegmentSizes = array<i32: 1, 1, 1, 1, 0>, static_offsets = array<i64: -9223372036854775808>, static_sizes = array<i64: -9223372036854775808>, static_strides = array<i64: 1>}> : (tensor<?xf32>, tensor<?xf32>, index, index) -> ()
      }) : () -> ()
    }) : (index, tensor<?xf32>) -> tensor<?xf32>
    "func.return"(%8) : (tensor<?xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "dummy1"}> ({
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "dummy2"}> ({
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "dummy3"}> ({
    "func.return"() : () -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["linalg.fill"]}> : (!transform.any_op) -> !transform.op<"linalg.fill">
      %1 = "transform.structured.match"(%arg0) <{ops = ["scf.forall"]}> : (!transform.any_op) -> !transform.op<"scf.forall">
      %2:2 = "transform.structured.fuse_into_containing_op"(%0, %1) : (!transform.op<"linalg.fill">, !transform.op<"scf.forall">) -> (!transform.any_op, !transform.any_op)
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
#map = affine_map<()[s0] -> (64 ceildiv s0)>
#map1 = affine_map<(d0)[s0] -> (d0 * s0)>
#map2 = affine_map<(d0)[s0] -> (-(d0 * s0) + 64, s0)>
"builtin.module"() ({
  "func.func"() <{function_type = (index, tensor<64xf32>, tensor<64xf32>) -> tensor<64xf32>, sym_name = "fuse_untileable_op"}> ({
  ^bb0(%arg1: index, %arg2: tensor<64xf32>, %arg3: tensor<64xf32>):
    %3 = "tensor.empty"(%arg1) : (index) -> tensor<?xf32>
    %4 = "affine.apply"(%arg1) <{map = #map}> : (index) -> index
    %5 = "scf.forall"(%4, %arg3) <{operandSegmentSizes = array<i32: 0, 1, 0, 1>, staticLowerBound = array<i64: 0>, staticStep = array<i64: 1>, staticUpperBound = array<i64: -9223372036854775808>}> ({
    ^bb0(%arg4: index, %arg5: tensor<64xf32>):
      %6 = "affine.apply"(%arg4, %arg1) <{map = #map1}> : (index, index) -> index
      %7 = "affine.min"(%arg4, %arg1) <{map = #map2}> : (index, index) -> index
      %8 = "tensor.extract_slice"(%arg5, %6, %7) <{operandSegmentSizes = array<i32: 1, 1, 1, 0>, static_offsets = array<i64: -9223372036854775808>, static_sizes = array<i64: -9223372036854775808>, static_strides = array<i64: 1>}> : (tensor<64xf32>, index, index) -> tensor<?xf32>
      %9 = "linalg.exp"(%3, %8) <{operandSegmentSizes = array<i32: 1, 1>}> ({
      ^bb0(%arg6: f32, %arg7: f32):
        %10 = "math.exp"(%arg6) <{fastmath = #arith.fastmath<none>}> : (f32) -> f32
        "linalg.yield"(%10) : (f32) -> ()
      }) : (tensor<?xf32>, tensor<?xf32>) -> tensor<?xf32>
      "scf.forall.in_parallel"() ({
        "tensor.parallel_insert_slice"(%9, %arg5, %6, %7) <{operandSegmentSizes = array<i32: 1, 1, 1, 1, 0>, static_offsets = array<i64: -9223372036854775808>, static_sizes = array<i64: -9223372036854775808>, static_strides = array<i64: 1>}> : (tensor<?xf32>, tensor<64xf32>, index, index) -> ()
      }) : () -> ()
    }) : (index, tensor<64xf32>) -> tensor<64xf32>
    "func.return"(%5) : (tensor<64xf32>) -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["tensor.empty"]}> : (!transform.any_op) -> !transform.op<"tensor.empty">
      %1 = "transform.structured.match"(%arg0) <{ops = ["scf.forall"]}> : (!transform.any_op) -> !transform.op<"scf.forall">
      %2:2 = "transform.structured.fuse_into_containing_op"(%0, %1) : (!transform.op<"tensor.empty">, !transform.op<"scf.forall">) -> (!transform.any_op, !transform.any_op)
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<f32>) -> tensor<f32>, sym_name = "foo"}> ({
  ^bb0(%arg8: tensor<f32>):
    "func.return"(%arg8) : (tensor<f32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (index, tensor<?xf32>, tensor<?xf32>) -> tensor<?xf32>, sym_name = "fuse_tileable_op_rank_reducing"}> ({
  ^bb0(%arg1: index, %arg2: tensor<?xf32>, %arg3: tensor<?xf32>):
    %3 = "arith.constant"() <{value = 4.200000e+01 : f32}> : () -> f32
    %4 = "arith.constant"() <{value = 0 : index}> : () -> index
    %5 = "linalg.fill"(%3, %arg3) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg6: f32, %arg7: f32):
      "linalg.yield"(%arg6) : (f32) -> ()
    }) : (f32, tensor<?xf32>) -> tensor<?xf32>
    %6 = "tensor.dim"(%arg2, %4) : (tensor<?xf32>, index) -> index
    %7 = "scf.forall"(%6, %5) <{operandSegmentSizes = array<i32: 0, 1, 0, 1>, staticLowerBound = array<i64: 0>, staticStep = array<i64: 1>, staticUpperBound = array<i64: -9223372036854775808>}> ({
    ^bb0(%arg4: index, %arg5: tensor<?xf32>):
      %8 = "tensor.extract_slice"(%arg5, %arg4) <{operandSegmentSizes = array<i32: 1, 1, 0, 0>, static_offsets = array<i64: -9223372036854775808>, static_sizes = array<i64: 1>, static_strides = array<i64: 1>}> : (tensor<?xf32>, index) -> tensor<f32>
      %9 = "func.call"(%8) <{callee = @foo}> : (tensor<f32>) -> tensor<f32>
      "scf.forall.in_parallel"() ({
        "tensor.parallel_insert_slice"(%9, %arg5, %arg4) <{operandSegmentSizes = array<i32: 1, 1, 1, 0, 0>, static_offsets = array<i64: -9223372036854775808>, static_sizes = array<i64: 1>, static_strides = array<i64: 1>}> : (tensor<f32>, tensor<?xf32>, index) -> ()
      }) : () -> ()
    }) : (index, tensor<?xf32>) -> tensor<?xf32>
    "func.return"(%7) : (tensor<?xf32>) -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["linalg.fill"]}> : (!transform.any_op) -> !transform.op<"linalg.fill">
      %1 = "transform.structured.match"(%arg0) <{ops = ["scf.forall"]}> : (!transform.any_op) -> !transform.op<"scf.forall">
      %2:2 = "transform.structured.fuse_into_containing_op"(%0, %1) : (!transform.op<"linalg.fill">, !transform.op<"scf.forall">) -> (!transform.any_op, !transform.any_op)
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
#map = affine_map<()[s0, s1] -> (s0 ceildiv s1)>
#map1 = affine_map<(d0)[s0] -> (d0 * s0)>
#map2 = affine_map<(d0)[s0, s1] -> (-(d0 * s1) + s0, s1)>
"builtin.module"() ({
  "func.func"() <{function_type = (index, tensor<?xf32>, tensor<?xf32>) -> tensor<?xf32>, sym_name = "fuse_tileable_op_through_bbarg"}> ({
  ^bb0(%arg1: index, %arg2: tensor<?xf32>, %arg3: tensor<?xf32>):
    %3 = "arith.constant"() <{value = 4.200000e+01 : f32}> : () -> f32
    %4 = "arith.constant"() <{value = 0 : index}> : () -> index
    %5 = "linalg.fill"(%3, %arg3) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg8: f32, %arg9: f32):
      "linalg.yield"(%arg8) : (f32) -> ()
    }) : (f32, tensor<?xf32>) -> tensor<?xf32>
    %6 = "tensor.dim"(%arg2, %4) : (tensor<?xf32>, index) -> index
    %7 = "affine.apply"(%6, %arg1) <{map = #map}> : (index, index) -> index
    %8 = "scf.forall"(%7, %5) <{operandSegmentSizes = array<i32: 0, 1, 0, 1>, staticLowerBound = array<i64: 0>, staticStep = array<i64: 1>, staticUpperBound = array<i64: -9223372036854775808>}> ({
    ^bb0(%arg4: index, %arg5: tensor<?xf32>):
      %9 = "affine.apply"(%arg4, %arg1) <{map = #map1}> : (index, index) -> index
      %10 = "affine.min"(%arg4, %6, %arg1) <{map = #map2}> : (index, index, index) -> index
      %11 = "tensor.extract_slice"(%arg5, %9, %10) <{operandSegmentSizes = array<i32: 1, 1, 1, 0>, static_offsets = array<i64: -9223372036854775808>, static_sizes = array<i64: -9223372036854775808>, static_strides = array<i64: 1>}> : (tensor<?xf32>, index, index) -> tensor<?xf32>
      %12 = "tensor.extract_slice"(%arg2, %9, %10) <{operandSegmentSizes = array<i32: 1, 1, 1, 0>, static_offsets = array<i64: -9223372036854775808>, static_sizes = array<i64: -9223372036854775808>, static_strides = array<i64: 1>}> : (tensor<?xf32>, index, index) -> tensor<?xf32>
      %13 = "linalg.exp"(%12, %11) <{operandSegmentSizes = array<i32: 1, 1>}> ({
      ^bb0(%arg6: f32, %arg7: f32):
        %14 = "math.exp"(%arg6) <{fastmath = #arith.fastmath<none>}> : (f32) -> f32
        "linalg.yield"(%14) : (f32) -> ()
      }) : (tensor<?xf32>, tensor<?xf32>) -> tensor<?xf32>
      "scf.forall.in_parallel"() ({
        "tensor.parallel_insert_slice"(%13, %arg5, %9, %10) <{operandSegmentSizes = array<i32: 1, 1, 1, 1, 0>, static_offsets = array<i64: -9223372036854775808>, static_sizes = array<i64: -9223372036854775808>, static_strides = array<i64: 1>}> : (tensor<?xf32>, tensor<?xf32>, index, index) -> ()
      }) : () -> ()
    }) : (index, tensor<?xf32>) -> tensor<?xf32>
    "func.return"(%8) : (tensor<?xf32>) -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["linalg.fill"]}> : (!transform.any_op) -> !transform.any_op
      %1 = "transform.structured.match"(%arg0) <{ops = ["scf.forall"]}> : (!transform.any_op) -> !transform.any_op
      %2:2 = "transform.structured.fuse_into_containing_op"(%0, %1) : (!transform.any_op, !transform.any_op) -> (!transform.any_op, !transform.any_op)
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
#map = affine_map<()[s0, s1] -> (s0 ceildiv s1)>
#map1 = affine_map<(d0)[s0] -> (d0 * s0)>
#map2 = affine_map<(d0)[s0, s1] -> (-(d0 * s1) + s0, s1)>
"builtin.module"() ({
  "func.func"() <{function_type = (index, tensor<?xf32>) -> tensor<?xf32>, sym_name = "fuse_tileable_op_through_bbarg_inout"}> ({
  ^bb0(%arg1: index, %arg2: tensor<?xf32>):
    %3 = "arith.constant"() <{value = 4.200000e+01 : f32}> : () -> f32
    %4 = "arith.constant"() <{value = 0 : index}> : () -> index
    %5 = "linalg.fill"(%3, %arg2) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg7: f32, %arg8: f32):
      "linalg.yield"(%arg7) : (f32) -> ()
    }) : (f32, tensor<?xf32>) -> tensor<?xf32>
    %6 = "tensor.dim"(%arg2, %4) : (tensor<?xf32>, index) -> index
    %7 = "affine.apply"(%6, %arg1) <{map = #map}> : (index, index) -> index
    %8 = "scf.forall"(%7, %arg2) <{operandSegmentSizes = array<i32: 0, 1, 0, 1>, staticLowerBound = array<i64: 0>, staticStep = array<i64: 1>, staticUpperBound = array<i64: -9223372036854775808>}> ({
    ^bb0(%arg3: index, %arg4: tensor<?xf32>):
      %9 = "affine.apply"(%arg3, %arg1) <{map = #map1}> : (index, index) -> index
      %10 = "affine.min"(%arg3, %6, %arg1) <{map = #map2}> : (index, index, index) -> index
      %11 = "tensor.extract_slice"(%arg4, %9, %10) <{operandSegmentSizes = array<i32: 1, 1, 1, 0>, static_offsets = array<i64: -9223372036854775808>, static_sizes = array<i64: -9223372036854775808>, static_strides = array<i64: 1>}> : (tensor<?xf32>, index, index) -> tensor<?xf32>
      %12 = "tensor.extract_slice"(%5, %9, %10) <{operandSegmentSizes = array<i32: 1, 1, 1, 0>, static_offsets = array<i64: -9223372036854775808>, static_sizes = array<i64: -9223372036854775808>, static_strides = array<i64: 1>}> : (tensor<?xf32>, index, index) -> tensor<?xf32>
      %13 = "linalg.exp"(%12, %11) <{operandSegmentSizes = array<i32: 1, 1>}> ({
      ^bb0(%arg5: f32, %arg6: f32):
        %14 = "math.exp"(%arg5) <{fastmath = #arith.fastmath<none>}> : (f32) -> f32
        "linalg.yield"(%14) : (f32) -> ()
      }) : (tensor<?xf32>, tensor<?xf32>) -> tensor<?xf32>
      "scf.forall.in_parallel"() ({
        "tensor.parallel_insert_slice"(%13, %arg4, %9, %10) <{operandSegmentSizes = array<i32: 1, 1, 1, 1, 0>, static_offsets = array<i64: -9223372036854775808>, static_sizes = array<i64: -9223372036854775808>, static_strides = array<i64: 1>}> : (tensor<?xf32>, tensor<?xf32>, index, index) -> ()
      }) : () -> ()
    }) : (index, tensor<?xf32>) -> tensor<?xf32>
    "func.return"(%8) : (tensor<?xf32>) -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["linalg.fill"]}> : (!transform.any_op) -> !transform.any_op
      %1 = "transform.structured.match"(%arg0) <{ops = ["scf.forall"]}> : (!transform.any_op) -> !transform.any_op
      %2:2 = "transform.structured.fuse_into_containing_op"(%0, %1) : (!transform.any_op, !transform.any_op) -> (!transform.any_op, !transform.any_op)
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0) -> (d0 * 2)>
#map1 = affine_map<(d0) -> (d0 * 4)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<4x4x4xf32>, tensor<4x4x4xf32>) -> tensor<4x4x4xf32>, sym_name = "fuse_tileable_op_no_dps"}> ({
  ^bb0(%arg1: tensor<4x4x4xf32>, %arg2: tensor<4x4x4xf32>):
    %3 = "test.tiling_no_dps_op"(%arg1, %arg2) : (tensor<4x4x4xf32>, tensor<4x4x4xf32>) -> tensor<4x4x4xf32>
    %4 = "tensor.empty"() : () -> tensor<4x4x4xf32>
    %5 = "scf.forall"(%4) <{operandSegmentSizes = array<i32: 0, 0, 0, 1>, staticLowerBound = array<i64: 0, 0, 0>, staticStep = array<i64: 1, 1, 1>, staticUpperBound = array<i64: 4, 2, 1>}> ({
    ^bb0(%arg3: index, %arg4: index, %arg5: index, %arg6: tensor<4x4x4xf32>):
      %6 = "affine.apply"(%arg4) <{map = #map}> : (index) -> index
      %7 = "affine.apply"(%arg5) <{map = #map1}> : (index) -> index
      %8 = "tensor.extract_slice"(%3, %arg3, %6, %7) <{operandSegmentSizes = array<i32: 1, 3, 0, 0>, static_offsets = array<i64: -9223372036854775808, -9223372036854775808, -9223372036854775808>, static_sizes = array<i64: 1, 2, 4>, static_strides = array<i64: 1, 1, 1>}> : (tensor<4x4x4xf32>, index, index, index) -> tensor<1x2x4xf32>
      %9 = "test.unregistered_op"(%8, %8) : (tensor<1x2x4xf32>, tensor<1x2x4xf32>) -> tensor<1x2x4xf32>
      "scf.forall.in_parallel"() ({
        "tensor.parallel_insert_slice"(%9, %arg6, %arg3, %6, %7) <{operandSegmentSizes = array<i32: 1, 1, 3, 0, 0>, static_offsets = array<i64: -9223372036854775808, -9223372036854775808, -9223372036854775808>, static_sizes = array<i64: 1, 2, 4>, static_strides = array<i64: 1, 1, 1>}> : (tensor<1x2x4xf32>, tensor<4x4x4xf32>, index, index, index) -> ()
      }) : () -> ()
    }) : (tensor<4x4x4xf32>) -> tensor<4x4x4xf32>
    "func.return"(%5) : (tensor<4x4x4xf32>) -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["test.tiling_no_dps_op"]}> : (!transform.any_op) -> !transform.any_op
      %1 = "transform.structured.match"(%arg0) <{ops = ["scf.forall"]}> : (!transform.any_op) -> !transform.any_op
      %2:2 = "transform.structured.fuse_into_containing_op"(%0, %1) : (!transform.any_op, !transform.any_op) -> (!transform.any_op, !transform.any_op)
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2) -> (d0, d1, d2)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x?x?xf32>, tensor<?x?x?xf32>) -> tensor<?x?x?xf32>, sym_name = "fuse_tileable_op_through_bbarg_inout_nested"}> ({
  ^bb0(%arg1: tensor<?x?x?xf32>, %arg2: tensor<?x?x?xf32>):
    %5 = "arith.constant"() <{value = 2 : index}> : () -> index
    %6 = "arith.constant"() <{value = 1 : index}> : () -> index
    %7 = "arith.constant"() <{value = 0 : index}> : () -> index
    %8 = "linalg.elementwise"(%arg1, %arg2) <{indexing_maps = [#map, #map], kind = #linalg.elementwise_kind<abs>, operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg11: f32, %arg12: f32):
      %20 = "math.absf"(%arg11) <{fastmath = #arith.fastmath<none>}> : (f32) -> f32
      "linalg.yield"(%20) : (f32) -> ()
    }) : (tensor<?x?x?xf32>, tensor<?x?x?xf32>) -> tensor<?x?x?xf32>
    %9 = "tensor.dim"(%arg2, %7) : (tensor<?x?x?xf32>, index) -> index
    %10 = "tensor.dim"(%arg2, %6) : (tensor<?x?x?xf32>, index) -> index
    %11 = "tensor.dim"(%arg2, %5) : (tensor<?x?x?xf32>, index) -> index
    %12 = "scf.for"(%7, %9, %6, %arg2) ({
    ^bb0(%arg3: index, %arg4: tensor<?x?x?xf32>):
      %13 = "scf.for"(%7, %10, %6, %arg4) ({
      ^bb0(%arg5: index, %arg6: tensor<?x?x?xf32>):
        %14 = "scf.for"(%7, %11, %6, %arg6) ({
        ^bb0(%arg7: index, %arg8: tensor<?x?x?xf32>):
          %15 = "tensor.extract_slice"(%8, %arg3, %arg5, %arg7) <{operandSegmentSizes = array<i32: 1, 3, 0, 0>, static_offsets = array<i64: -9223372036854775808, -9223372036854775808, -9223372036854775808>, static_sizes = array<i64: 1, 1, 1>, static_strides = array<i64: 1, 1, 1>}> : (tensor<?x?x?xf32>, index, index, index) -> tensor<1x1x1xf32>
          %16 = "tensor.extract_slice"(%arg8, %arg3, %arg5, %arg7) <{operandSegmentSizes = array<i32: 1, 3, 0, 0>, static_offsets = array<i64: -9223372036854775808, -9223372036854775808, -9223372036854775808>, static_sizes = array<i64: 1, 1, 1>, static_strides = array<i64: 1, 1, 1>}> : (tensor<?x?x?xf32>, index, index, index) -> tensor<1x1x1xf32>
          %17 = "linalg.elementwise"(%15, %16) <{indexing_maps = [#map, #map], kind = #linalg.elementwise_kind<exp>, operandSegmentSizes = array<i32: 1, 1>}> ({
          ^bb0(%arg9: f32, %arg10: f32):
            %19 = "math.exp"(%arg9) <{fastmath = #arith.fastmath<none>}> : (f32) -> f32
            "linalg.yield"(%19) : (f32) -> ()
          }) : (tensor<1x1x1xf32>, tensor<1x1x1xf32>) -> tensor<1x1x1xf32>
          %18 = "tensor.insert_slice"(%17, %arg8, %arg3, %arg5, %arg7) <{operandSegmentSizes = array<i32: 1, 1, 3, 0, 0>, static_offsets = array<i64: -9223372036854775808, -9223372036854775808, -9223372036854775808>, static_sizes = array<i64: 1, 1, 1>, static_strides = array<i64: 1, 1, 1>}> : (tensor<1x1x1xf32>, tensor<?x?x?xf32>, index, index, index) -> tensor<?x?x?xf32>
          "scf.yield"(%18) : (tensor<?x?x?xf32>) -> ()
        }) : (index, index, index, tensor<?x?x?xf32>) -> tensor<?x?x?xf32>
        "scf.yield"(%14) : (tensor<?x?x?xf32>) -> ()
      }) : (index, index, index, tensor<?x?x?xf32>) -> tensor<?x?x?xf32>
      "scf.yield"(%13) : (tensor<?x?x?xf32>) -> ()
    }) : (index, index, index, tensor<?x?x?xf32>) -> tensor<?x?x?xf32>
    "func.return"(%12) : (tensor<?x?x?xf32>) -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["linalg.elementwise"]}> : (!transform.any_op) -> !transform.any_op
      %1 = "transform.structured.match"(%arg0) <{ops = ["scf.for"]}> : (!transform.any_op) -> !transform.any_op
      %2:2 = "transform.split_handle"(%0) <{fail_on_payload_too_small = true, pass_through_empty_handle = true}> : (!transform.any_op) -> (!transform.any_op, !transform.any_op)
      %3:3 = "transform.split_handle"(%1) <{fail_on_payload_too_small = true, pass_through_empty_handle = true}> : (!transform.any_op) -> (!transform.any_op, !transform.any_op, !transform.any_op)
      %4:2 = "transform.structured.fuse_into_containing_op"(%2#0, %3#2) : (!transform.any_op, !transform.any_op) -> (!transform.any_op, !transform.any_op)
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0) -> (d0)>
#map1 = affine_map<()[s0, s1] -> (s0 ceildiv s1)>
#map2 = affine_map<(d0)[s0] -> (d0 * s0)>
#map3 = affine_map<(d0)[s0, s1] -> (-(d0 * s1) + s0, s1)>
"builtin.module"() ({
  "func.func"() <{function_type = (index, tensor<?xf32>, tensor<?xf32>, tensor<?xf32>, tensor<?xf32>) -> tensor<?xf32>, sym_name = "fuse_tileable_multi_output_op"}> ({
  ^bb0(%arg1: index, %arg2: tensor<?xf32>, %arg3: tensor<?xf32>, %arg4: tensor<?xf32>, %arg5: tensor<?xf32>):
    %3 = "arith.constant"() <{value = 4.200000e+01 : f32}> : () -> f32
    %4 = "arith.constant"() <{value = 0 : index}> : () -> index
    %5:2 = "linalg.generic"(%arg2, %arg3, %arg5) <{indexing_maps = [#map, #map, #map], iterator_types = [#linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 1, 2>}> ({
    ^bb0(%arg10: f32, %arg11: f32, %arg12: f32):
      %15 = "arith.addf"(%arg10, %arg11) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %16 = "arith.addf"(%15, %arg12) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%15, %16) : (f32, f32) -> ()
    }) : (tensor<?xf32>, tensor<?xf32>, tensor<?xf32>) -> (tensor<?xf32>, tensor<?xf32>)
    %6 = "tensor.dim"(%arg3, %4) : (tensor<?xf32>, index) -> index
    %7 = "affine.apply"(%6, %arg1) <{map = #map1}> : (index, index) -> index
    %8 = "scf.forall"(%7, %arg4) <{operandSegmentSizes = array<i32: 0, 1, 0, 1>, staticLowerBound = array<i64: 0>, staticStep = array<i64: 1>, staticUpperBound = array<i64: -9223372036854775808>}> ({
    ^bb0(%arg6: index, %arg7: tensor<?xf32>):
      %9 = "affine.apply"(%arg6, %arg1) <{map = #map2}> : (index, index) -> index
      %10 = "affine.min"(%arg6, %6, %arg1) <{map = #map3}> : (index, index, index) -> index
      %11 = "tensor.extract_slice"(%arg7, %9, %10) <{operandSegmentSizes = array<i32: 1, 1, 1, 0>, static_offsets = array<i64: -9223372036854775808>, static_sizes = array<i64: -9223372036854775808>, static_strides = array<i64: 1>}> : (tensor<?xf32>, index, index) -> tensor<?xf32>
      %12 = "tensor.extract_slice"(%5#0, %9, %10) <{operandSegmentSizes = array<i32: 1, 1, 1, 0>, static_offsets = array<i64: -9223372036854775808>, static_sizes = array<i64: -9223372036854775808>, static_strides = array<i64: 1>}> : (tensor<?xf32>, index, index) -> tensor<?xf32>
      %13 = "linalg.exp"(%12, %11) <{operandSegmentSizes = array<i32: 1, 1>}> ({
      ^bb0(%arg8: f32, %arg9: f32):
        %14 = "math.exp"(%arg8) <{fastmath = #arith.fastmath<none>}> : (f32) -> f32
        "linalg.yield"(%14) : (f32) -> ()
      }) : (tensor<?xf32>, tensor<?xf32>) -> tensor<?xf32>
      "scf.forall.in_parallel"() ({
        "tensor.parallel_insert_slice"(%13, %arg7, %9, %10) <{operandSegmentSizes = array<i32: 1, 1, 1, 1, 0>, static_offsets = array<i64: -9223372036854775808>, static_sizes = array<i64: -9223372036854775808>, static_strides = array<i64: 1>}> : (tensor<?xf32>, tensor<?xf32>, index, index) -> ()
      }) : () -> ()
    }) : (index, tensor<?xf32>) -> tensor<?xf32>
    "func.return"(%8) : (tensor<?xf32>) -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["linalg.generic"]}> : (!transform.any_op) -> !transform.op<"linalg.generic">
      %1 = "transform.structured.match"(%arg0) <{ops = ["scf.forall"]}> : (!transform.any_op) -> !transform.op<"scf.forall">
      %2:2 = "transform.structured.fuse_into_containing_op"(%0, %1) : (!transform.op<"linalg.generic">, !transform.op<"scf.forall">) -> (!transform.any_op, !transform.any_op)
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<2xf32>, tensor<2xf32>) -> tensor<2xf32>, sym_name = "fuse_repeated"}> ({
  ^bb0(%arg1: tensor<2xf32>, %arg2: tensor<2xf32>):
    %4 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %5 = "linalg.fill"(%4, %arg1) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg7: f32, %arg8: f32):
      "linalg.yield"(%arg7) : (f32) -> ()
    }) : (f32, tensor<2xf32>) -> tensor<2xf32>
    %6 = "scf.forall"(%arg2) <{operandSegmentSizes = array<i32: 0, 0, 0, 1>, staticLowerBound = array<i64: 0>, staticStep = array<i64: 1>, staticUpperBound = array<i64: 2>}> ({
    ^bb0(%arg3: index, %arg4: tensor<2xf32>):
      %7 = "tensor.extract_slice"(%5, %arg3) <{operandSegmentSizes = array<i32: 1, 1, 0, 0>, static_offsets = array<i64: -9223372036854775808>, static_sizes = array<i64: 1>, static_strides = array<i64: 1>}> : (tensor<2xf32>, index) -> tensor<1xf32>
      %8 = "tensor.extract_slice"(%arg4, %arg3) <{operandSegmentSizes = array<i32: 1, 1, 0, 0>, static_offsets = array<i64: -9223372036854775808>, static_sizes = array<i64: 1>, static_strides = array<i64: 1>}> : (tensor<2xf32>, index) -> tensor<1xf32>
      %9 = "linalg.exp"(%7, %8) <{operandSegmentSizes = array<i32: 1, 1>}> ({
      ^bb0(%arg5: f32, %arg6: f32):
        %10 = "math.exp"(%arg5) <{fastmath = #arith.fastmath<none>}> : (f32) -> f32
        "linalg.yield"(%10) : (f32) -> ()
      }) : (tensor<1xf32>, tensor<1xf32>) -> tensor<1xf32>
      "scf.forall.in_parallel"() ({
        "tensor.parallel_insert_slice"(%9, %arg4, %arg3) <{operandSegmentSizes = array<i32: 1, 1, 1, 0, 0>, static_offsets = array<i64: -9223372036854775808>, static_sizes = array<i64: 1>, static_strides = array<i64: 1>}> : (tensor<1xf32>, tensor<2xf32>, index) -> ()
      }) : () -> ()
    }) : (tensor<2xf32>) -> tensor<2xf32>
    "func.return"(%6) : (tensor<2xf32>) -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["linalg.fill"]}> : (!transform.any_op) -> !transform.any_op
      %1 = "transform.structured.match"(%arg0) <{ops = ["scf.forall"]}> : (!transform.any_op) -> !transform.any_op
      %2 = "transform.merge_handles"(%0, %0) : (!transform.any_op, !transform.any_op) -> !transform.any_op
      %3:2 = "transform.structured.fuse_into_containing_op"(%2, %1) : (!transform.any_op, !transform.any_op) -> (!transform.any_op, !transform.any_op)
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0) -> (d0)>
#map1 = affine_map<()[s0, s1] -> (s0 ceildiv s1)>
#map2 = affine_map<(d0)[s0] -> (d0 * s0)>
#map3 = affine_map<(d0)[s0, s1] -> (-(d0 * s1) + s0, s1)>
"builtin.module"() ({
  "func.func"() <{function_type = (index, tensor<?xf32>, tensor<?xf32>, tensor<?xf32>, tensor<?xf32>) -> (tensor<?xf32>, tensor<?xf32>, tensor<?xf32>), sym_name = "fuse_tileable_multi_output_op_multi_use"}> ({
  ^bb0(%arg1: index, %arg2: tensor<?xf32>, %arg3: tensor<?xf32>, %arg4: tensor<?xf32>, %arg5: tensor<?xf32>):
    %3 = "arith.constant"() <{value = 4.200000e+01 : f32}> : () -> f32
    %4 = "arith.constant"() <{value = 0 : index}> : () -> index
    %5:2 = "linalg.generic"(%arg2, %arg3, %arg5) <{indexing_maps = [#map, #map, #map], iterator_types = [#linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 1, 2>}> ({
    ^bb0(%arg10: f32, %arg11: f32, %arg12: f32):
      %15 = "arith.addf"(%arg10, %arg11) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %16 = "arith.addf"(%15, %arg12) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%15, %16) : (f32, f32) -> ()
    }) : (tensor<?xf32>, tensor<?xf32>, tensor<?xf32>) -> (tensor<?xf32>, tensor<?xf32>)
    %6 = "tensor.dim"(%arg3, %4) : (tensor<?xf32>, index) -> index
    %7 = "affine.apply"(%6, %arg1) <{map = #map1}> : (index, index) -> index
    %8 = "scf.forall"(%7, %arg4) <{operandSegmentSizes = array<i32: 0, 1, 0, 1>, staticLowerBound = array<i64: 0>, staticStep = array<i64: 1>, staticUpperBound = array<i64: -9223372036854775808>}> ({
    ^bb0(%arg6: index, %arg7: tensor<?xf32>):
      %9 = "affine.apply"(%arg6, %arg1) <{map = #map2}> : (index, index) -> index
      %10 = "affine.min"(%arg6, %6, %arg1) <{map = #map3}> : (index, index, index) -> index
      %11 = "tensor.extract_slice"(%arg7, %9, %10) <{operandSegmentSizes = array<i32: 1, 1, 1, 0>, static_offsets = array<i64: -9223372036854775808>, static_sizes = array<i64: -9223372036854775808>, static_strides = array<i64: 1>}> : (tensor<?xf32>, index, index) -> tensor<?xf32>
      %12 = "tensor.extract_slice"(%5#0, %9, %10) <{operandSegmentSizes = array<i32: 1, 1, 1, 0>, static_offsets = array<i64: -9223372036854775808>, static_sizes = array<i64: -9223372036854775808>, static_strides = array<i64: 1>}> : (tensor<?xf32>, index, index) -> tensor<?xf32>
      %13 = "linalg.exp"(%12, %11) <{operandSegmentSizes = array<i32: 1, 1>}> ({
      ^bb0(%arg8: f32, %arg9: f32):
        %14 = "math.exp"(%arg8) <{fastmath = #arith.fastmath<none>}> : (f32) -> f32
        "linalg.yield"(%14) : (f32) -> ()
      }) : (tensor<?xf32>, tensor<?xf32>) -> tensor<?xf32>
      "scf.forall.in_parallel"() ({
        "tensor.parallel_insert_slice"(%13, %arg7, %9, %10) <{operandSegmentSizes = array<i32: 1, 1, 1, 1, 0>, static_offsets = array<i64: -9223372036854775808>, static_sizes = array<i64: -9223372036854775808>, static_strides = array<i64: 1>}> : (tensor<?xf32>, tensor<?xf32>, index, index) -> ()
      }) : () -> ()
    }) : (index, tensor<?xf32>) -> tensor<?xf32>
    "func.return"(%8, %5#0, %5#1) : (tensor<?xf32>, tensor<?xf32>, tensor<?xf32>) -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["linalg.generic"]}> : (!transform.any_op) -> !transform.op<"linalg.generic">
      %1 = "transform.structured.match"(%arg0) <{ops = ["scf.forall"]}> : (!transform.any_op) -> !transform.op<"scf.forall">
      %2:2 = "transform.structured.fuse_into_containing_op"(%0, %1) : (!transform.op<"linalg.generic">, !transform.op<"scf.forall">) -> (!transform.any_op, !transform.any_op)
      "transform.debug.emit_remark_at"(%2#1) <{message = "new containing op"}> : (!transform.any_op) -> ()
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0) -> (d0)>
#map1 = affine_map<()[s0, s1] -> (s0 ceildiv s1)>
#map2 = affine_map<(d0)[s0] -> (d0 * s0)>
#map3 = affine_map<(d0)[s0, s1] -> (-(d0 * s1) + s0, s1)>
"builtin.module"() ({
  "func.func"() <{function_type = (index, tensor<?xf32>, tensor<?xf32>, tensor<?xf32>, tensor<?xf32>) -> (tensor<?xf32>, tensor<?xf32>), sym_name = "fuse_tileable_mixed_dominating_uses"}> ({
  ^bb0(%arg1: index, %arg2: tensor<?xf32>, %arg3: tensor<?xf32>, %arg4: tensor<?xf32>, %arg5: tensor<?xf32>):
    %3 = "arith.constant"() <{value = 4.200000e+01 : f32}> : () -> f32
    %4 = "arith.constant"() <{value = 0 : index}> : () -> index
    %5 = "linalg.generic"(%arg2, %arg3) <{indexing_maps = [#map, #map], iterator_types = [#linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg10: f32, %arg11: f32):
      %15 = "arith.addf"(%arg10, %arg11) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%15) : (f32) -> ()
    }) : (tensor<?xf32>, tensor<?xf32>) -> tensor<?xf32>
    %6 = "tensor.dim"(%5, %4) : (tensor<?xf32>, index) -> index
    %7 = "affine.apply"(%6, %arg1) <{map = #map1}> : (index, index) -> index
    %8 = "scf.forall"(%7, %arg4) <{operandSegmentSizes = array<i32: 0, 1, 0, 1>, staticLowerBound = array<i64: 0>, staticStep = array<i64: 1>, staticUpperBound = array<i64: -9223372036854775808>}> ({
    ^bb0(%arg6: index, %arg7: tensor<?xf32>):
      %9 = "affine.apply"(%arg6, %arg1) <{map = #map2}> : (index, index) -> index
      %10 = "affine.min"(%arg6, %6, %arg1) <{map = #map3}> : (index, index, index) -> index
      %11 = "tensor.extract_slice"(%arg7, %9, %10) <{operandSegmentSizes = array<i32: 1, 1, 1, 0>, static_offsets = array<i64: -9223372036854775808>, static_sizes = array<i64: -9223372036854775808>, static_strides = array<i64: 1>}> : (tensor<?xf32>, index, index) -> tensor<?xf32>
      %12 = "tensor.extract_slice"(%5, %9, %10) <{operandSegmentSizes = array<i32: 1, 1, 1, 0>, static_offsets = array<i64: -9223372036854775808>, static_sizes = array<i64: -9223372036854775808>, static_strides = array<i64: 1>}> : (tensor<?xf32>, index, index) -> tensor<?xf32>
      %13 = "linalg.exp"(%12, %11) <{operandSegmentSizes = array<i32: 1, 1>}> ({
      ^bb0(%arg8: f32, %arg9: f32):
        %14 = "math.exp"(%arg8) <{fastmath = #arith.fastmath<none>}> : (f32) -> f32
        "linalg.yield"(%14) : (f32) -> ()
      }) : (tensor<?xf32>, tensor<?xf32>) -> tensor<?xf32>
      "scf.forall.in_parallel"() ({
        "tensor.parallel_insert_slice"(%13, %arg7, %9, %10) <{operandSegmentSizes = array<i32: 1, 1, 1, 1, 0>, static_offsets = array<i64: -9223372036854775808>, static_sizes = array<i64: -9223372036854775808>, static_strides = array<i64: 1>}> : (tensor<?xf32>, tensor<?xf32>, index, index) -> ()
      }) : () -> ()
    }) : (index, tensor<?xf32>) -> tensor<?xf32>
    "func.return"(%8, %5) : (tensor<?xf32>, tensor<?xf32>) -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["linalg.generic"]}> : (!transform.any_op) -> !transform.op<"linalg.generic">
      %1 = "transform.structured.match"(%arg0) <{ops = ["scf.forall"]}> : (!transform.any_op) -> !transform.op<"scf.forall">
      %2:2 = "transform.structured.fuse_into_containing_op"(%0, %1) : (!transform.op<"linalg.generic">, !transform.op<"scf.forall">) -> (!transform.any_op, !transform.any_op)
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1) -> (d0, d1)>
#map1 = affine_map<(d0, d1) -> (d0)>
#map2 = affine_map<()[s0, s1] -> (s0 ceildiv s1)>
#map3 = affine_map<(d0)[s0] -> (d0 * s0)>
#map4 = affine_map<(d0)[s0, s1] -> (-(d0 * s1) + s0, s1)>
"builtin.module"() ({
  "func.func"() <{function_type = (index, tensor<?x?xf32>, tensor<?xf32>, tensor<?xf32>, tensor<?xf32>) -> (tensor<?xf32>, tensor<?xf32>), sym_name = "fuse_tileable_reductions"}> ({
  ^bb0(%arg1: index, %arg2: tensor<?x?xf32>, %arg3: tensor<?xf32>, %arg4: tensor<?xf32>, %arg5: tensor<?xf32>):
    %3 = "arith.constant"() <{value = 4.200000e+01 : f32}> : () -> f32
    %4 = "arith.constant"() <{value = 0 : index}> : () -> index
    %5 = "linalg.generic"(%arg2, %arg3) <{indexing_maps = [#map, #map1], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<reduction>], operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg10: f32, %arg11: f32):
      %15 = "arith.maximumf"(%arg10, %arg11) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%15) : (f32) -> ()
    }) : (tensor<?x?xf32>, tensor<?xf32>) -> tensor<?xf32>
    %6 = "tensor.dim"(%arg3, %4) : (tensor<?xf32>, index) -> index
    %7 = "affine.apply"(%6, %arg1) <{map = #map2}> : (index, index) -> index
    %8 = "scf.forall"(%7, %arg4) <{operandSegmentSizes = array<i32: 0, 1, 0, 1>, staticLowerBound = array<i64: 0>, staticStep = array<i64: 1>, staticUpperBound = array<i64: -9223372036854775808>}> ({
    ^bb0(%arg6: index, %arg7: tensor<?xf32>):
      %9 = "affine.apply"(%arg6, %arg1) <{map = #map3}> : (index, index) -> index
      %10 = "affine.min"(%arg6, %6, %arg1) <{map = #map4}> : (index, index, index) -> index
      %11 = "tensor.extract_slice"(%arg7, %9, %10) <{operandSegmentSizes = array<i32: 1, 1, 1, 0>, static_offsets = array<i64: -9223372036854775808>, static_sizes = array<i64: -9223372036854775808>, static_strides = array<i64: 1>}> : (tensor<?xf32>, index, index) -> tensor<?xf32>
      %12 = "tensor.extract_slice"(%5, %9, %10) <{operandSegmentSizes = array<i32: 1, 1, 1, 0>, static_offsets = array<i64: -9223372036854775808>, static_sizes = array<i64: -9223372036854775808>, static_strides = array<i64: 1>}> : (tensor<?xf32>, index, index) -> tensor<?xf32>
      %13 = "linalg.exp"(%12, %11) <{operandSegmentSizes = array<i32: 1, 1>}> ({
      ^bb0(%arg8: f32, %arg9: f32):
        %14 = "math.exp"(%arg8) <{fastmath = #arith.fastmath<none>}> : (f32) -> f32
        "linalg.yield"(%14) : (f32) -> ()
      }) : (tensor<?xf32>, tensor<?xf32>) -> tensor<?xf32>
      "scf.forall.in_parallel"() ({
        "tensor.parallel_insert_slice"(%13, %arg7, %9, %10) <{operandSegmentSizes = array<i32: 1, 1, 1, 1, 0>, static_offsets = array<i64: -9223372036854775808>, static_sizes = array<i64: -9223372036854775808>, static_strides = array<i64: 1>}> : (tensor<?xf32>, tensor<?xf32>, index, index) -> ()
      }) : () -> ()
    }) : (index, tensor<?xf32>) -> tensor<?xf32>
    "func.return"(%8, %5) : (tensor<?xf32>, tensor<?xf32>) -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["linalg.generic"]}> : (!transform.any_op) -> !transform.op<"linalg.generic">
      %1 = "transform.structured.match"(%arg0) <{ops = ["scf.forall"]}> : (!transform.any_op) -> !transform.op<"scf.forall">
      %2:2 = "transform.structured.fuse_into_containing_op"(%0, %1) : (!transform.op<"linalg.generic">, !transform.op<"scf.forall">) -> (!transform.any_op, !transform.any_op)
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0) -> (d0)>
#map1 = affine_map<()[s0, s1] -> (s0 ceildiv s1)>
#map2 = affine_map<(d0)[s0] -> (d0 * s0)>
#map3 = affine_map<(d0)[s0, s1] -> (-(d0 * s1) + s0, s1)>
"builtin.module"() ({
  "func.func"() <{function_type = (index, tensor<?xf32>, tensor<?xf32>, tensor<?xf32>, tensor<?xf32>) -> (tensor<?xf32>, tensor<?xf32>), sym_name = "fuse_tileable_using_new_handle"}> ({
  ^bb0(%arg1: index, %arg2: tensor<?xf32>, %arg3: tensor<?xf32>, %arg4: tensor<?xf32>, %arg5: tensor<?xf32>):
    %5 = "arith.constant"() <{value = 4.200000e+01 : f32}> : () -> f32
    %6 = "arith.constant"() <{value = 0 : index}> : () -> index
    %7 = "linalg.generic"(%arg2, %arg3) <{indexing_maps = [#map, #map], iterator_types = [#linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg12: f32, %arg13: f32):
      %19 = "arith.addf"(%arg12, %arg13) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%19) : (f32) -> ()
    }) : (tensor<?xf32>, tensor<?xf32>) -> tensor<?xf32>
    %8 = "linalg.generic"(%7, %arg3) <{indexing_maps = [#map, #map], iterator_types = [#linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg10: f32, %arg11: f32):
      %18 = "arith.mulf"(%arg10, %arg11) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%18) : (f32) -> ()
    }) : (tensor<?xf32>, tensor<?xf32>) -> tensor<?xf32>
    %9 = "tensor.dim"(%arg3, %6) : (tensor<?xf32>, index) -> index
    %10 = "affine.apply"(%9, %arg1) <{map = #map1}> : (index, index) -> index
    %11 = "scf.forall"(%10, %arg4) <{operandSegmentSizes = array<i32: 0, 1, 0, 1>, staticLowerBound = array<i64: 0>, staticStep = array<i64: 1>, staticUpperBound = array<i64: -9223372036854775808>}> ({
    ^bb0(%arg6: index, %arg7: tensor<?xf32>):
      %12 = "affine.apply"(%arg6, %arg1) <{map = #map2}> : (index, index) -> index
      %13 = "affine.min"(%arg6, %9, %arg1) <{map = #map3}> : (index, index, index) -> index
      %14 = "tensor.extract_slice"(%arg7, %12, %13) <{operandSegmentSizes = array<i32: 1, 1, 1, 0>, static_offsets = array<i64: -9223372036854775808>, static_sizes = array<i64: -9223372036854775808>, static_strides = array<i64: 1>}> : (tensor<?xf32>, index, index) -> tensor<?xf32>
      %15 = "tensor.extract_slice"(%8, %12, %13) <{operandSegmentSizes = array<i32: 1, 1, 1, 0>, static_offsets = array<i64: -9223372036854775808>, static_sizes = array<i64: -9223372036854775808>, static_strides = array<i64: 1>}> : (tensor<?xf32>, index, index) -> tensor<?xf32>
      %16 = "linalg.exp"(%15, %14) <{operandSegmentSizes = array<i32: 1, 1>}> ({
      ^bb0(%arg8: f32, %arg9: f32):
        %17 = "math.exp"(%arg8) <{fastmath = #arith.fastmath<none>}> : (f32) -> f32
        "linalg.yield"(%17) : (f32) -> ()
      }) : (tensor<?xf32>, tensor<?xf32>) -> tensor<?xf32>
      "scf.forall.in_parallel"() ({
        "tensor.parallel_insert_slice"(%16, %arg7, %10, %13) <{operandSegmentSizes = array<i32: 1, 1, 1, 1, 0>, static_offsets = array<i64: -9223372036854775808>, static_sizes = array<i64: -9223372036854775808>, static_strides = array<i64: 1>}> : (tensor<?xf32>, tensor<?xf32>, index, index) -> ()
      }) : () -> ()
    }) : (index, tensor<?xf32>) -> tensor<?xf32>
    "func.return"(%11, %8) : (tensor<?xf32>, tensor<?xf32>) -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["linalg.generic"]}> : (!transform.any_op) -> !transform.op<"linalg.generic">
      %1:2 = "transform.split_handle"(%0) <{fail_on_payload_too_small = true, pass_through_empty_handle = true}> : (!transform.op<"linalg.generic">) -> (!transform.op<"linalg.generic">, !transform.op<"linalg.generic">)
      %2 = "transform.structured.match"(%arg0) <{ops = ["scf.forall"]}> : (!transform.any_op) -> !transform.op<"scf.forall">
      %3:2 = "transform.structured.fuse_into_containing_op"(%1#1, %2) : (!transform.op<"linalg.generic">, !transform.op<"scf.forall">) -> (!transform.any_op, !transform.op<"scf.forall">)
      %4:2 = "transform.structured.fuse_into_containing_op"(%1#0, %3#1) : (!transform.op<"linalg.generic">, !transform.op<"scf.forall">) -> (!transform.any_op, !transform.op<"scf.forall">)
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2) -> (d0, d1, d2)>
#map1 = affine_map<(d0, d1, d2) -> (d0, d1)>
#map2 = affine_map<(d0) -> (d0 * 4)>
"builtin.module"() ({
  "func.func"() <{function_type = () -> tensor<16x128x128xf32>, sym_name = "softmax_dispatch_0_generic_16x128x128_f32"}> ({
    %3 = "arith.constant"() <{value = 0 : index}> : () -> index
    %4 = "arith.constant"() <{value = dense<5.000000e+00> : tensor<16x128x128xf32>}> : () -> tensor<16x128x128xf32>
    %5 = "arith.constant"() <{value = 5.000000e+00 : f32}> : () -> f32
    %6 = "tensor.empty"() : () -> tensor<16x128xf32>
    %7 = "tensor.empty"() : () -> tensor<16x128x128xf32>
    %8 = "linalg.fill"(%5, %6) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg17: f32, %arg18: f32):
      "linalg.yield"(%arg17) : (f32) -> ()
    }) : (f32, tensor<16x128xf32>) -> tensor<16x128xf32>
    %9 = "linalg.fill"(%5, %6) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg15: f32, %arg16: f32):
      "linalg.yield"(%arg15) : (f32) -> ()
    }) : (f32, tensor<16x128xf32>) -> tensor<16x128xf32>
    %10 = "linalg.generic"(%4, %9) <{indexing_maps = [#map, #map1], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<reduction>], operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg13: f32, %arg14: f32):
      %32 = "arith.maximumf"(%arg13, %arg14) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%32) : (f32) -> ()
    }) {producer} : (tensor<16x128x128xf32>, tensor<16x128xf32>) -> tensor<16x128xf32>
    %11 = "arith.constant"() <{value = 16 : index}> : () -> index
    %12 = "arith.constant"() <{value = 32 : index}> : () -> index
    %13 = "scf.forall"(%7) <{operandSegmentSizes = array<i32: 0, 0, 0, 1>, staticLowerBound = array<i64: 0, 0>, staticStep = array<i64: 1, 1>, staticUpperBound = array<i64: 16, 32>}> ({
    ^bb0(%arg1: index, %arg2: index, %arg3: tensor<16x128x128xf32>):
      %14 = "affine.apply"(%arg2) <{map = #map2}> : (index) -> index
      %15 = "tensor.extract_slice"(%10, %arg1, %14) <{operandSegmentSizes = array<i32: 1, 2, 0, 0>, static_offsets = array<i64: -9223372036854775808, -9223372036854775808>, static_sizes = array<i64: 1, 4>, static_strides = array<i64: 1, 1>}> : (tensor<16x128xf32>, index, index) -> tensor<1x4xf32>
      %16 = "tensor.extract_slice"(%7, %arg1, %14) <{operandSegmentSizes = array<i32: 1, 2, 0, 0>, static_offsets = array<i64: -9223372036854775808, -9223372036854775808, 0>, static_sizes = array<i64: 1, 4, 128>, static_strides = array<i64: 1, 1, 1>}> : (tensor<16x128x128xf32>, index, index) -> tensor<1x4x128xf32>
      %17 = "tensor.extract_slice"(%8, %arg1, %14) <{operandSegmentSizes = array<i32: 1, 2, 0, 0>, static_offsets = array<i64: -9223372036854775808, -9223372036854775808>, static_sizes = array<i64: 1, 4>, static_strides = array<i64: 1, 1>}> : (tensor<16x128xf32>, index, index) -> tensor<1x4xf32>
      %18:2 = "linalg.generic"(%15, %16, %17) <{indexing_maps = [#map1, #map, #map1], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<reduction>], operandSegmentSizes = array<i32: 1, 2>}> ({
      ^bb0(%arg10: f32, %arg11: f32, %arg12: f32):
        %29 = "arith.subf"(%5, %arg10) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
        %30 = "math.exp"(%29) <{fastmath = #arith.fastmath<none>}> : (f32) -> f32
        %31 = "arith.addf"(%30, %arg12) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
        "linalg.yield"(%30, %31) : (f32, f32) -> ()
      }) : (tensor<1x4xf32>, tensor<1x4x128xf32>, tensor<1x4xf32>) -> (tensor<1x4x128xf32>, tensor<1x4xf32>)
      %19 = "tensor.extract_slice"(%10, %arg1, %14) <{operandSegmentSizes = array<i32: 1, 2, 0, 0>, static_offsets = array<i64: -9223372036854775808, -9223372036854775808>, static_sizes = array<i64: 1, 4>, static_strides = array<i64: 1, 1>}> : (tensor<16x128xf32>, index, index) -> tensor<1x4xf32>
      %20 = "tensor.extract_slice"(%7, %arg1, %14) <{operandSegmentSizes = array<i32: 1, 2, 0, 0>, static_offsets = array<i64: -9223372036854775808, -9223372036854775808, 0>, static_sizes = array<i64: 1, 4, 128>, static_strides = array<i64: 1, 1, 1>}> : (tensor<16x128x128xf32>, index, index) -> tensor<1x4x128xf32>
      %21 = "tensor.extract_slice"(%8, %arg1, %14) <{operandSegmentSizes = array<i32: 1, 2, 0, 0>, static_offsets = array<i64: -9223372036854775808, -9223372036854775808>, static_sizes = array<i64: 1, 4>, static_strides = array<i64: 1, 1>}> : (tensor<16x128xf32>, index, index) -> tensor<1x4xf32>
      %22:2 = "linalg.generic"(%19, %20, %21) <{indexing_maps = [#map1, #map, #map1], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<reduction>], operandSegmentSizes = array<i32: 1, 2>}> ({
      ^bb0(%arg7: f32, %arg8: f32, %arg9: f32):
        %26 = "arith.subf"(%5, %arg7) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
        %27 = "math.exp"(%26) <{fastmath = #arith.fastmath<none>}> : (f32) -> f32
        %28 = "arith.addf"(%27, %arg9) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
        "linalg.yield"(%27, %28) : (f32, f32) -> ()
      }) : (tensor<1x4xf32>, tensor<1x4x128xf32>, tensor<1x4xf32>) -> (tensor<1x4x128xf32>, tensor<1x4xf32>)
      %23 = "tensor.extract_slice"(%arg3, %arg1, %14) <{operandSegmentSizes = array<i32: 1, 2, 0, 0>, static_offsets = array<i64: -9223372036854775808, -9223372036854775808, 0>, static_sizes = array<i64: 1, 4, 128>, static_strides = array<i64: 1, 1, 1>}> : (tensor<16x128x128xf32>, index, index) -> tensor<1x4x128xf32>
      %24 = "linalg.generic"(%18#0, %22#1, %23) <{indexing_maps = [#map, #map1, #map], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 2, 1>}> ({
      ^bb0(%arg4: f32, %arg5: f32, %arg6: f32):
        %25 = "arith.divf"(%arg4, %arg5) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
        "linalg.yield"(%25) : (f32) -> ()
      }) : (tensor<1x4x128xf32>, tensor<1x4xf32>, tensor<1x4x128xf32>) -> tensor<1x4x128xf32>
      "scf.forall.in_parallel"() ({
        "tensor.parallel_insert_slice"(%24, %arg3, %arg1, %14) <{operandSegmentSizes = array<i32: 1, 1, 2, 0, 0>, static_offsets = array<i64: -9223372036854775808, -9223372036854775808, 0>, static_sizes = array<i64: 1, 4, 128>, static_strides = array<i64: 1, 1, 1>}> : (tensor<1x4x128xf32>, tensor<16x128x128xf32>, index, index) -> ()
      }) : () -> ()
    }) : (tensor<16x128x128xf32>) -> tensor<16x128x128xf32>
    "func.return"(%13) : (tensor<16x128x128xf32>) -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{op_attrs = {producer}}> : (!transform.any_op) -> !transform.op<"linalg.generic">
      %1 = "transform.structured.match"(%arg0) <{ops = ["scf.forall"]}> : (!transform.any_op) -> !transform.op<"scf.forall">
      %2:2 = "transform.structured.fuse_into_containing_op"(%0, %1) : (!transform.op<"linalg.generic">, !transform.op<"scf.forall">) -> (!transform.any_op, !transform.any_op)
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2) -> (d0, d2)>
#map1 = affine_map<(d0, d1, d2) -> (d2, d1)>
#map2 = affine_map<(d0, d1, d2) -> (d0, d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<123x456xf32>, tensor<456x789xf32>, tensor<123x789xf32>) -> tensor<123x789xf32>, sym_name = "copy_1d_1024xf16"}> ({
  ^bb0(%arg1: tensor<123x456xf32>, %arg2: tensor<456x789xf32>, %arg3: tensor<123x789xf32>):
    %4 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %5 = "linalg.fill"(%4, %arg3) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg7: f32, %arg8: f32):
      "linalg.yield"(%arg7) : (f32) -> ()
    }) : (f32, tensor<123x789xf32>) -> tensor<123x789xf32>
    %6 = "linalg.matmul"(%arg1, %arg2, %5) <{indexing_maps = [#map, #map1, #map2], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg4: f32, %arg5: f32, %arg6: f32):
      %7 = "arith.mulf"(%arg4, %arg5) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %8 = "arith.addf"(%arg6, %7) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%8) : (f32) -> ()
    }) : (tensor<123x456xf32>, tensor<456x789xf32>, tensor<123x789xf32>) -> tensor<123x789xf32>
    "func.return"(%6) : (tensor<123x789xf32>) -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["linalg.fill"]}> : (!transform.any_op) -> !transform.any_op
      %1 = "transform.structured.match"(%arg0) <{ops = ["linalg.matmul"]}> : (!transform.any_op) -> !transform.any_op
      %2:2 = "transform.structured.tile_using_forall"(%1) <{operandSegmentSizes = array<i32: 1, 0, 0, 0, 0>, static_num_threads = array<i64>, static_tile_sizes = array<i64: 50, 16>}> : (!transform.any_op) -> (!transform.any_op, !transform.any_op)
      %3:2 = "transform.structured.fuse_into_containing_op"(%0, %2#0) : (!transform.any_op, !transform.any_op) -> (!transform.any_op, !transform.any_op)
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

