"builtin.module"() ({
  "func.func"() <{function_type = (tensor<16x64x256xf32>) -> tensor<16x64x256xf32>, sym_name = "softmax"}> ({
  ^bb0(%arg1: tensor<16x64x256xf32>):
    %2 = "tensor.empty"() : () -> tensor<16x64x256xf32>
    %3 = "linalg.softmax"(%arg1, %2) <{dimension = 1 : i64}> : (tensor<16x64x256xf32>, tensor<16x64x256xf32>) -> tensor<16x64x256xf32>
    "func.return"(%3) : (tensor<16x64x256xf32>) -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["linalg.softmax"]}> : (!transform.any_op) -> !transform.any_op
      %1:3 = "transform.structured.tile_using_for"(%0) <{scalable_sizes = array<i1: false, false>, static_sizes = array<i64: 2, 3>}> : (!transform.any_op) -> (!transform.any_op, !transform.any_op, !transform.any_op)
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2) -> (d0, d1, d2)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<16x64x256xf32>) -> tensor<16x64x256xf32>, sym_name = "softmax_tile_n_fuse"}> ({
  ^bb0(%arg1: tensor<16x64x256xf32>):
    %4 = "tensor.empty"() : () -> tensor<16x64x256xf32>
    %5 = "arith.constant"() <{value = 1.000000e+00 : f32}> : () -> f32
    %6 = "linalg.generic"(%arg1, %4) <{indexing_maps = [#map, #map], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg2: f32, %arg3: f32):
      %9 = "arith.addf"(%arg3, %5) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%9) : (f32) -> ()
    }) : (tensor<16x64x256xf32>, tensor<16x64x256xf32>) -> tensor<16x64x256xf32>
    %7 = "tensor.empty"() : () -> tensor<16x64x256xf32>
    %8 = "linalg.softmax"(%6, %7) <{dimension = 1 : i64}> : (tensor<16x64x256xf32>, tensor<16x64x256xf32>) -> tensor<16x64x256xf32>
    "func.return"(%8) : (tensor<16x64x256xf32>) -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["linalg.softmax"]}> : (!transform.any_op) -> !transform.any_op
      %1:2 = "transform.structured.tile_using_forall"(%0) <{operandSegmentSizes = array<i32: 1, 0, 0, 0, 0>, static_num_threads = array<i64: 8, 16>}> : (!transform.any_op) -> (!transform.any_op, !transform.any_op)
      %2 = "transform.structured.match"(%arg0) <{ops = ["linalg.generic"]}> : (!transform.any_op) -> !transform.any_op
      %3:2 = "transform.structured.fuse_into_containing_op"(%2, %1#1) : (!transform.any_op, !transform.any_op) -> (!transform.any_op, !transform.any_op)
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<16x64x256xf32>, memref<16x64x256xf32>) -> (), sym_name = "softmax_memref"}> ({
  ^bb0(%arg1: memref<16x64x256xf32>, %arg2: memref<16x64x256xf32>):
    "linalg.softmax"(%arg1, %arg2) <{dimension = 1 : i64}> : (memref<16x64x256xf32>, memref<16x64x256xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["linalg.softmax"]}> : (!transform.any_op) -> !transform.any_op
      %1:3 = "transform.structured.tile_using_for"(%0) <{scalable_sizes = array<i1: false, false>, static_sizes = array<i64: 2, 3>}> : (!transform.any_op) -> (!transform.any_op, !transform.any_op, !transform.any_op)
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

