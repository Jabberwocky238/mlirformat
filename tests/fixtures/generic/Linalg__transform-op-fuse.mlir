"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x?xf32>, tensor<?x?xf32>) -> tensor<?x?xf32>, sym_name = "fuse_unary"}> ({
  ^bb0(%arg1: tensor<?x?xf32>, %arg2: tensor<?x?xf32>):
    %2 = "linalg.exp"(%arg1, %arg2) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg6: f32, %arg7: f32):
      %5 = "math.exp"(%arg6) <{fastmath = #arith.fastmath<none>}> : (f32) -> f32
      "linalg.yield"(%5) : (f32) -> ()
    }) : (tensor<?x?xf32>, tensor<?x?xf32>) -> tensor<?x?xf32>
    %3 = "linalg.add"(%2, %arg1, %arg2) <{operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg3: f32, %arg4: f32, %arg5: f32):
      %4 = "arith.addf"(%arg3, %arg4) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%4) : (f32) -> ()
    }) : (tensor<?x?xf32>, tensor<?x?xf32>, tensor<?x?xf32>) -> tensor<?x?xf32>
    "func.return"(%3) : (tensor<?x?xf32>) -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["linalg.add"]}> : (!transform.any_op) -> !transform.any_op
      %1:3 = "transform.structured.fuse"(%0) <{operandSegmentSizes = array<i32: 1, 0, 0>, static_tile_interchange = array<i64: 0, 1>, static_tile_sizes = array<i64: 32, 32>}> : (!transform.any_op) -> (!transform.any_op, !transform.any_op, !transform.any_op)
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x?xf32>, tensor<?x?xf32>) -> tensor<?x?xf32>, sym_name = "fuse_unary"}> ({
  ^bb0(%arg1: tensor<?x?xf32>, %arg2: tensor<?x?xf32>):
    %3 = "linalg.exp"(%arg1, %arg2) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg6: f32, %arg7: f32):
      %6 = "math.exp"(%arg6) <{fastmath = #arith.fastmath<none>}> : (f32) -> f32
      "linalg.yield"(%6) : (f32) -> ()
    }) : (tensor<?x?xf32>, tensor<?x?xf32>) -> tensor<?x?xf32>
    %4 = "linalg.add"(%3, %arg1, %arg2) <{operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg3: f32, %arg4: f32, %arg5: f32):
      %5 = "arith.addf"(%arg3, %arg4) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%5) : (f32) -> ()
    }) : (tensor<?x?xf32>, tensor<?x?xf32>, tensor<?x?xf32>) -> tensor<?x?xf32>
    "func.return"(%4) : (tensor<?x?xf32>) -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["linalg.add"]}> : (!transform.any_op) -> !transform.any_op
      %1:3 = "transform.structured.fuse"(%0) <{operandSegmentSizes = array<i32: 1, 0, 0>, static_tile_interchange = array<i64: 0, 1>, static_tile_sizes = array<i64: 32, 32>}> : (!transform.any_op) -> (!transform.any_op, !transform.op<"scf.for">, !transform.any_op)
      %2:2 = "transform.loop.peel"(%1#1) <{fail_if_already_divisible = false, peel_front = false}> : (!transform.op<"scf.for">) -> (!transform.any_op, !transform.any_op)
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x?xf32>, tensor<?x?xf32>) -> tensor<?x?xf32>, sym_name = "fuse_unary_param"}> ({
  ^bb0(%arg1: tensor<?x?xf32>, %arg2: tensor<?x?xf32>):
    %4 = "linalg.exp"(%arg1, %arg2) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg6: f32, %arg7: f32):
      %7 = "math.exp"(%arg6) <{fastmath = #arith.fastmath<none>}> : (f32) -> f32
      "linalg.yield"(%7) : (f32) -> ()
    }) : (tensor<?x?xf32>, tensor<?x?xf32>) -> tensor<?x?xf32>
    %5 = "linalg.add"(%4, %arg1, %arg2) <{operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg3: f32, %arg4: f32, %arg5: f32):
      %6 = "arith.addf"(%arg3, %arg4) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%6) : (f32) -> ()
    }) : (tensor<?x?xf32>, tensor<?x?xf32>, tensor<?x?xf32>) -> tensor<?x?xf32>
    "func.return"(%5) : (tensor<?x?xf32>) -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["linalg.add"]}> : (!transform.any_op) -> !transform.any_op
      %1 = "transform.param.constant"() <{value = 32 : i32}> : () -> !transform.param<i32>
      %2 = "transform.param.constant"() <{value = 1 : i32}> : () -> !transform.param<i32>
      %3:3 = "transform.structured.fuse"(%0, %1, %2) <{operandSegmentSizes = array<i32: 1, 1, 1>, static_tile_interchange = array<i64: 0, -9223372036854775808>, static_tile_sizes = array<i64: -9223372036854775808, 32>}> : (!transform.any_op, !transform.param<i32>, !transform.param<i32>) -> (!transform.any_op, !transform.any_op, !transform.any_op)
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x?xf32>, tensor<?x?xf32>) -> tensor<?x?xf32>, sym_name = "fuse_unary_forall"}> ({
  ^bb0(%arg1: tensor<?x?xf32>, %arg2: tensor<?x?xf32>):
    %2 = "linalg.exp"(%arg1, %arg2) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg6: f32, %arg7: f32):
      %5 = "math.exp"(%arg6) <{fastmath = #arith.fastmath<none>}> : (f32) -> f32
      "linalg.yield"(%5) : (f32) -> ()
    }) : (tensor<?x?xf32>, tensor<?x?xf32>) -> tensor<?x?xf32>
    %3 = "linalg.add"(%2, %arg1, %arg2) <{operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg3: f32, %arg4: f32, %arg5: f32):
      %4 = "arith.addf"(%arg3, %arg4) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%4) : (f32) -> ()
    }) : (tensor<?x?xf32>, tensor<?x?xf32>, tensor<?x?xf32>) -> tensor<?x?xf32>
    "func.return"(%3) : (tensor<?x?xf32>) -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["linalg.add"]}> : (!transform.any_op) -> !transform.any_op
      %1:2 = "transform.structured.fuse"(%0) <{operandSegmentSizes = array<i32: 1, 0, 0>, static_tile_sizes = array<i64: 32, 32>, use_forall}> : (!transform.any_op) -> (!transform.any_op, !transform.any_op)
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2) -> (d0, d1, d2)>
#map1 = affine_map<(d0, d1, d2) -> (d0, d2)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<12x7x25xf32>) -> tensor<12x25xf32>, sym_name = "interchange_reduction"}> ({
  ^bb0(%arg1: tensor<12x7x25xf32>):
    %3 = "arith.constant"() <{value = 5.000000e+00 : f32}> : () -> f32
    %4 = "tensor.empty"() : () -> tensor<12x25xf32>
    %5 = "linalg.fill"(%3, %4) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg4: f32, %arg5: f32):
      "linalg.yield"(%arg4) : (f32) -> ()
    }) : (f32, tensor<12x25xf32>) -> tensor<12x25xf32>
    %6 = "linalg.generic"(%arg1, %5) <{indexing_maps = [#map, #map1], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<reduction>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg2: f32, %arg3: f32):
      %7 = "arith.addf"(%arg2, %arg3) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%7) : (f32) -> ()
    }) : (tensor<12x7x25xf32>, tensor<12x25xf32>) -> tensor<12x25xf32>
    "func.return"(%6) : (tensor<12x25xf32>) -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["linalg.generic"]}> : (!transform.any_op) -> !transform.any_op
      %1:3 = "transform.structured.fuse"(%0) <{operandSegmentSizes = array<i32: 1, 0, 0>, static_tile_interchange = array<i64: 0, 2, 1>, static_tile_sizes = array<i64: 5, 0, 7>}> : (!transform.any_op) -> (!transform.any_op, !transform.any_op, !transform.any_op)
      %2:2 = "transform.structured.tile_using_for"(%1#0) <{scalable_sizes = array<i1: false, false>, static_sizes = array<i64: 0, 4>}> : (!transform.any_op) -> (!transform.any_op, !transform.any_op)
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<16x48x8x8xf32>, tensor<128x384xf32>) -> tensor<128x384xf32>, sym_name = "unpack_elemwise"}> ({
  ^bb0(%arg1: tensor<16x48x8x8xf32>, %arg2: tensor<128x384xf32>):
    %2 = "tensor.empty"() : () -> tensor<128x384xf32>
    %3 = "linalg.unpack"(%arg1, %2) <{inner_dims_pos = array<i64: 0, 1>, static_inner_tiles = array<i64: 8, 8>}> : (tensor<16x48x8x8xf32>, tensor<128x384xf32>) -> tensor<128x384xf32>
    %4 = "linalg.exp"(%3, %arg2) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg3: f32, %arg4: f32):
      %5 = "math.exp"(%arg3) <{fastmath = #arith.fastmath<none>}> : (f32) -> f32
      "linalg.yield"(%5) : (f32) -> ()
    }) : (tensor<128x384xf32>, tensor<128x384xf32>) -> tensor<128x384xf32>
    "func.return"(%4) : (tensor<128x384xf32>) -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["linalg.exp"]}> : (!transform.any_op) -> !transform.any_op
      %1:3 = "transform.structured.fuse"(%0) <{operandSegmentSizes = array<i32: 1, 0, 0>, static_tile_interchange = array<i64: 0, 1>, static_tile_sizes = array<i64: 16, 32>}> : (!transform.any_op) -> (!transform.any_op, !transform.any_op, !transform.any_op)
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<128x384xf32>, tensor<16x48x8x8xf32>) -> tensor<16x48x8x8xf32>, sym_name = "pack_elemwise"}> ({
  ^bb0(%arg1: tensor<128x384xf32>, %arg2: tensor<16x48x8x8xf32>):
    %2 = "tensor.empty"() : () -> tensor<16x48x8x8xf32>
    %3 = "linalg.pack"(%arg1, %2) <{inner_dims_pos = array<i64: 0, 1>, operandSegmentSizes = array<i32: 1, 1, 0, 0>, static_inner_tiles = array<i64: 8, 8>}> : (tensor<128x384xf32>, tensor<16x48x8x8xf32>) -> tensor<16x48x8x8xf32>
    %4 = "linalg.exp"(%3, %arg2) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg3: f32, %arg4: f32):
      %5 = "math.exp"(%arg3) <{fastmath = #arith.fastmath<none>}> : (f32) -> f32
      "linalg.yield"(%5) : (f32) -> ()
    }) : (tensor<16x48x8x8xf32>, tensor<16x48x8x8xf32>) -> tensor<16x48x8x8xf32>
    "func.return"(%4) : (tensor<16x48x8x8xf32>) -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["linalg.exp"]}> : (!transform.any_op) -> !transform.any_op
      %1:3 = "transform.structured.fuse"(%0) <{operandSegmentSizes = array<i32: 1, 0, 0>, static_tile_sizes = array<i64: 3, 5, 0, 0>}> : (!transform.any_op) -> (!transform.any_op, !transform.any_op, !transform.any_op)
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<128x384xf32>, tensor<16x48x8x8xf32>) -> tensor<16x48x8x8xf32>, sym_name = "nofuse_pack_elemwise"}> ({
  ^bb0(%arg1: tensor<128x384xf32>, %arg2: tensor<16x48x8x8xf32>):
    %2 = "tensor.empty"() : () -> tensor<16x48x8x8xf32>
    %3 = "linalg.pack"(%arg1, %2) <{inner_dims_pos = array<i64: 0, 1>, operandSegmentSizes = array<i32: 1, 1, 0, 0>, static_inner_tiles = array<i64: 8, 8>}> : (tensor<128x384xf32>, tensor<16x48x8x8xf32>) -> tensor<16x48x8x8xf32>
    %4 = "linalg.exp"(%3, %arg2) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg3: f32, %arg4: f32):
      %5 = "math.exp"(%arg3) <{fastmath = #arith.fastmath<none>}> : (f32) -> f32
      "linalg.yield"(%5) : (f32) -> ()
    }) : (tensor<16x48x8x8xf32>, tensor<16x48x8x8xf32>) -> tensor<16x48x8x8xf32>
    "func.return"(%4) : (tensor<16x48x8x8xf32>) -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["linalg.exp"]}> : (!transform.any_op) -> !transform.any_op
      %1:4 = "transform.structured.fuse"(%0) <{operandSegmentSizes = array<i32: 1, 0, 0>, static_tile_sizes = array<i64: 3, 5, 2, 0>}> : (!transform.any_op) -> (!transform.any_op, !transform.any_op, !transform.any_op, !transform.any_op)
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x?xf32>, tensor<?x?xf32>) -> tensor<?x?xf32>, sym_name = "fuse_through_slice"}> ({
  ^bb0(%arg1: tensor<?x?xf32>, %arg2: tensor<?x?xf32>):
    %2 = "linalg.exp"(%arg1, %arg1) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg6: f32, %arg7: f32):
      %10 = "math.exp"(%arg6) <{fastmath = #arith.fastmath<none>}> : (f32) -> f32
      "linalg.yield"(%10) : (f32) -> ()
    }) : (tensor<?x?xf32>, tensor<?x?xf32>) -> tensor<?x?xf32>
    %3 = "arith.constant"() <{value = 0 : index}> : () -> index
    %4 = "arith.constant"() <{value = 1 : index}> : () -> index
    %5 = "tensor.dim"(%arg2, %3) : (tensor<?x?xf32>, index) -> index
    %6 = "tensor.dim"(%arg2, %4) : (tensor<?x?xf32>, index) -> index
    %7 = "tensor.extract_slice"(%2, %5, %6) <{operandSegmentSizes = array<i32: 1, 0, 2, 0>, static_offsets = array<i64: 1, 1>, static_sizes = array<i64: -9223372036854775808, -9223372036854775808>, static_strides = array<i64: 1, 1>}> : (tensor<?x?xf32>, index, index) -> tensor<?x?xf32>
    %8 = "linalg.add"(%7, %arg2, %arg2) <{operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg3: f32, %arg4: f32, %arg5: f32):
      %9 = "arith.addf"(%arg3, %arg4) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%9) : (f32) -> ()
    }) : (tensor<?x?xf32>, tensor<?x?xf32>, tensor<?x?xf32>) -> tensor<?x?xf32>
    "func.return"(%8) : (tensor<?x?xf32>) -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["linalg.add"]}> : (!transform.any_op) -> !transform.any_op
      %1:3 = "transform.structured.fuse"(%0) <{apply_cleanup, operandSegmentSizes = array<i32: 1, 0, 0>, static_tile_interchange = array<i64: 0, 1>, static_tile_sizes = array<i64: 32, 32>}> : (!transform.any_op) -> (!transform.any_op, !transform.op<"scf.for">, !transform.any_op)
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<100x100xf32>, tensor<?x?xf32>) -> tensor<?x?xf32>, sym_name = "fuse_through_slice_and_cast_chain"}> ({
  ^bb0(%arg1: tensor<100x100xf32>, %arg2: tensor<?x?xf32>):
    %2 = "linalg.exp"(%arg1, %arg1) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg6: f32, %arg7: f32):
      %13 = "math.exp"(%arg6) <{fastmath = #arith.fastmath<none>}> : (f32) -> f32
      "linalg.yield"(%13) : (f32) -> ()
    }) : (tensor<100x100xf32>, tensor<100x100xf32>) -> tensor<100x100xf32>
    %3 = "tensor.cast"(%2) : (tensor<100x100xf32>) -> tensor<100x?xf32>
    %4 = "tensor.extract_slice"(%3) <{operandSegmentSizes = array<i32: 1, 0, 0, 0>, static_offsets = array<i64: 1, 1>, static_sizes = array<i64: 98, 98>, static_strides = array<i64: 1, 1>}> : (tensor<100x?xf32>) -> tensor<98x98xf32>
    %5 = "tensor.cast"(%4) : (tensor<98x98xf32>) -> tensor<?x?xf32>
    %6 = "arith.constant"() <{value = 0 : index}> : () -> index
    %7 = "arith.constant"() <{value = 1 : index}> : () -> index
    %8 = "tensor.dim"(%arg2, %6) : (tensor<?x?xf32>, index) -> index
    %9 = "tensor.dim"(%arg2, %7) : (tensor<?x?xf32>, index) -> index
    %10 = "tensor.extract_slice"(%5, %8, %9) <{operandSegmentSizes = array<i32: 1, 0, 2, 0>, static_offsets = array<i64: 1, 1>, static_sizes = array<i64: -9223372036854775808, -9223372036854775808>, static_strides = array<i64: 1, 1>}> : (tensor<?x?xf32>, index, index) -> tensor<?x?xf32>
    %11 = "linalg.add"(%10, %arg2, %arg2) <{operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg3: f32, %arg4: f32, %arg5: f32):
      %12 = "arith.addf"(%arg3, %arg4) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%12) : (f32) -> ()
    }) : (tensor<?x?xf32>, tensor<?x?xf32>, tensor<?x?xf32>) -> tensor<?x?xf32>
    "func.return"(%11) : (tensor<?x?xf32>) -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["linalg.add"]}> : (!transform.any_op) -> !transform.any_op
      %1:3 = "transform.structured.fuse"(%0) <{apply_cleanup, operandSegmentSizes = array<i32: 1, 0, 0>, static_tile_interchange = array<i64: 0, 1>, static_tile_sizes = array<i64: 32, 32>}> : (!transform.any_op) -> (!transform.any_op, !transform.op<"scf.for">, !transform.any_op)
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x?xf32>, tensor<?x?xf32>) -> (tensor<?x?xf32>, tensor<10x10xf32>), sym_name = "fuse_unrelated_slices"}> ({
  ^bb0(%arg1: tensor<?x?xf32>, %arg2: tensor<?x?xf32>):
    %2 = "arith.constant"() <{value = 0 : index}> : () -> index
    %3 = "arith.constant"() <{value = 1 : index}> : () -> index
    %4 = "tensor.dim"(%arg2, %2) : (tensor<?x?xf32>, index) -> index
    %5 = "tensor.dim"(%arg2, %3) : (tensor<?x?xf32>, index) -> index
    %6 = "tensor.extract_slice"(%arg1, %4, %5) <{operandSegmentSizes = array<i32: 1, 0, 2, 0>, static_offsets = array<i64: 1, 1>, static_sizes = array<i64: -9223372036854775808, -9223372036854775808>, static_strides = array<i64: 1, 1>}> : (tensor<?x?xf32>, index, index) -> tensor<?x?xf32>
    %7 = "tensor.extract_slice"(%6) <{operandSegmentSizes = array<i32: 1, 0, 0, 0>, static_offsets = array<i64: 1, 1>, static_sizes = array<i64: 10, 10>, static_strides = array<i64: 1, 1>}> : (tensor<?x?xf32>) -> tensor<10x10xf32>
    %8 = "linalg.exp"(%arg1, %arg1) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg6: f32, %arg7: f32):
      %12 = "math.exp"(%arg6) <{fastmath = #arith.fastmath<none>}> : (f32) -> f32
      "linalg.yield"(%12) : (f32) -> ()
    }) : (tensor<?x?xf32>, tensor<?x?xf32>) -> tensor<?x?xf32>
    %9 = "tensor.extract_slice"(%8, %4, %5) <{operandSegmentSizes = array<i32: 1, 0, 2, 0>, static_offsets = array<i64: 1, 1>, static_sizes = array<i64: -9223372036854775808, -9223372036854775808>, static_strides = array<i64: 1, 1>}> : (tensor<?x?xf32>, index, index) -> tensor<?x?xf32>
    %10 = "linalg.add"(%9, %arg2, %arg2) <{operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg3: f32, %arg4: f32, %arg5: f32):
      %11 = "arith.addf"(%arg3, %arg4) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%11) : (f32) -> ()
    }) : (tensor<?x?xf32>, tensor<?x?xf32>, tensor<?x?xf32>) -> tensor<?x?xf32>
    "func.return"(%10, %7) : (tensor<?x?xf32>, tensor<10x10xf32>) -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["linalg.add"]}> : (!transform.any_op) -> !transform.any_op
      %1:3 = "transform.structured.fuse"(%0) <{apply_cleanup, operandSegmentSizes = array<i32: 1, 0, 0>, static_tile_interchange = array<i64: 0, 1>, static_tile_sizes = array<i64: 32, 32>}> : (!transform.any_op) -> (!transform.any_op, !transform.op<"scf.for">, !transform.any_op)
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<60xf32>) -> tensor<2x3x10xf32>, sym_name = "bubble_up_extract_slice_through_expand_shape"}> ({
  ^bb0(%arg1: tensor<60xf32>):
    %2 = "tensor.expand_shape"(%arg1) <{reassociation = [[0, 1, 2]], static_output_shape = array<i64: 2, 3, 10>}> : (tensor<60xf32>) -> tensor<2x3x10xf32>
    %3 = "tensor.empty"() : () -> tensor<2x3x10xf32>
    %4 = "linalg.exp"(%2, %3) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg2: f32, %arg3: f32):
      %5 = "math.exp"(%arg2) <{fastmath = #arith.fastmath<none>}> : (f32) -> f32
      "linalg.yield"(%5) : (f32) -> ()
    }) : (tensor<2x3x10xf32>, tensor<2x3x10xf32>) -> tensor<2x3x10xf32>
    "func.return"(%4) : (tensor<2x3x10xf32>) -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["linalg.exp"]}> : (!transform.any_op) -> !transform.any_op
      %1:4 = "transform.structured.fuse"(%0) <{apply_cleanup, operandSegmentSizes = array<i32: 1, 0, 0>, static_tile_interchange = array<i64: 0, 1, 2>, static_tile_sizes = array<i64: 1, 1, 5>}> : (!transform.any_op) -> (!transform.any_op, !transform.op<"scf.for">, !transform.any_op, !transform.any_op)
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<120xf32>) -> tensor<3x4x10xf32>, sym_name = "bubble_up_extract_slice_through_expand_shape_full_inner_dim"}> ({
  ^bb0(%arg1: tensor<120xf32>):
    %2 = "tensor.expand_shape"(%arg1) <{reassociation = [[0, 1, 2]], static_output_shape = array<i64: 3, 4, 10>}> : (tensor<120xf32>) -> tensor<3x4x10xf32>
    %3 = "tensor.empty"() : () -> tensor<3x4x10xf32>
    %4 = "linalg.exp"(%2, %3) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg2: f32, %arg3: f32):
      %5 = "math.exp"(%arg2) <{fastmath = #arith.fastmath<none>}> : (f32) -> f32
      "linalg.yield"(%5) : (f32) -> ()
    }) : (tensor<3x4x10xf32>, tensor<3x4x10xf32>) -> tensor<3x4x10xf32>
    "func.return"(%4) : (tensor<3x4x10xf32>) -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["linalg.exp"]}> : (!transform.any_op) -> !transform.any_op
      %1:3 = "transform.structured.fuse"(%0) <{apply_cleanup, operandSegmentSizes = array<i32: 1, 0, 0>, static_tile_interchange = array<i64: 0, 1, 2>, static_tile_sizes = array<i64: 1, 2, 0>}> : (!transform.any_op) -> (!transform.any_op, !transform.op<"scf.for">, !transform.any_op)
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<120xf32>) -> tensor<3x4x10xf32>, sym_name = "no_bubble_up_extract_slice_through_expand_shape_non_contiguous"}> ({
  ^bb0(%arg1: tensor<120xf32>):
    %2 = "tensor.expand_shape"(%arg1) <{reassociation = [[0, 1, 2]], static_output_shape = array<i64: 3, 4, 10>}> : (tensor<120xf32>) -> tensor<3x4x10xf32>
    %3 = "tensor.empty"() : () -> tensor<3x4x10xf32>
    %4 = "linalg.exp"(%2, %3) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg2: f32, %arg3: f32):
      %5 = "math.exp"(%arg2) <{fastmath = #arith.fastmath<none>}> : (f32) -> f32
      "linalg.yield"(%5) : (f32) -> ()
    }) : (tensor<3x4x10xf32>, tensor<3x4x10xf32>) -> tensor<3x4x10xf32>
    "func.return"(%4) : (tensor<3x4x10xf32>) -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["linalg.exp"]}> : (!transform.any_op) -> !transform.any_op
      %1:4 = "transform.structured.fuse"(%0) <{apply_cleanup, operandSegmentSizes = array<i32: 1, 0, 0>, static_tile_interchange = array<i64: 0, 1, 2>, static_tile_sizes = array<i64: 1, 2, 5>}> : (!transform.any_op) -> (!transform.any_op, !transform.op<"scf.for">, !transform.any_op, !transform.any_op)
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "builtin.module"() ({
    "func.func"() <{function_type = (tensor<120x56xf32>) -> tensor<3x4x10x7x8xf32>, sym_name = "bubble_up_extract_slice_through_expand_shape_multiple_expanded_dims"}> ({
    ^bb0(%arg1: tensor<120x56xf32>):
      %2 = "tensor.expand_shape"(%arg1) <{reassociation = [[0, 1, 2], [3, 4]], static_output_shape = array<i64: 3, 4, 10, 7, 8>}> : (tensor<120x56xf32>) -> tensor<3x4x10x7x8xf32>
      %3 = "tensor.empty"() : () -> tensor<3x4x10x7x8xf32>
      %4 = "linalg.exp"(%2, %3) <{operandSegmentSizes = array<i32: 1, 1>}> ({
      ^bb0(%arg2: f32, %arg3: f32):
        %5 = "math.exp"(%arg2) <{fastmath = #arith.fastmath<none>}> : (f32) -> f32
        "linalg.yield"(%5) : (f32) -> ()
      }) : (tensor<3x4x10x7x8xf32>, tensor<3x4x10x7x8xf32>) -> tensor<3x4x10x7x8xf32>
      "func.return"(%4) : (tensor<3x4x10x7x8xf32>) -> ()
    }) : () -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["linalg.exp"]}> : (!transform.any_op) -> !transform.any_op
      %1:5 = "transform.structured.fuse"(%0) <{apply_cleanup, operandSegmentSizes = array<i32: 1, 0, 0>, static_tile_interchange = array<i64: 0, 1, 2, 3, 4>, static_tile_sizes = array<i64: 1, 2, 0, 1, 4>}> : (!transform.any_op) -> (!transform.any_op, !transform.op<"scf.for">, !transform.any_op, !transform.any_op, !transform.any_op)
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "builtin.module"() ({
    "func.func"() <{function_type = (tensor<1x1800x256xf32>) -> tensor<1x1800x8x32xf32>, sym_name = "bubble_up_extract_slice_through_expand_shape_and_fuse_with_expand_producer"}> ({
    ^bb0(%arg1: tensor<1x1800x256xf32>):
      %2 = "tensor.empty"() : () -> tensor<1x1800x256xf32>
      %3 = "linalg.abs"(%arg1, %2) <{operandSegmentSizes = array<i32: 1, 1>}> ({
      ^bb0(%arg4: f32, %arg5: f32):
        %8 = "math.absf"(%arg4) <{fastmath = #arith.fastmath<none>}> : (f32) -> f32
        "linalg.yield"(%8) : (f32) -> ()
      }) : (tensor<1x1800x256xf32>, tensor<1x1800x256xf32>) -> tensor<1x1800x256xf32>
      %4 = "tensor.expand_shape"(%3) <{reassociation = [[0], [1], [2, 3]], static_output_shape = array<i64: 1, 1800, 8, 32>}> : (tensor<1x1800x256xf32>) -> tensor<1x1800x8x32xf32>
      %5 = "tensor.empty"() : () -> tensor<1x1800x8x32xf32>
      %6 = "linalg.exp"(%4, %5) <{operandSegmentSizes = array<i32: 1, 1>}> ({
      ^bb0(%arg2: f32, %arg3: f32):
        %7 = "math.exp"(%arg2) <{fastmath = #arith.fastmath<none>}> : (f32) -> f32
        "linalg.yield"(%7) : (f32) -> ()
      }) : (tensor<1x1800x8x32xf32>, tensor<1x1800x8x32xf32>) -> tensor<1x1800x8x32xf32>
      "func.return"(%6) : (tensor<1x1800x8x32xf32>) -> ()
    }) : () -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["linalg.exp"]}> : (!transform.any_op) -> !transform.any_op
      %1:2 = "transform.structured.fuse"(%0) <{apply_cleanup, operandSegmentSizes = array<i32: 1, 0, 0>, static_tile_interchange = array<i64: 0, 1, 2, 3>, static_tile_sizes = array<i64: 0, 0, 1, 0>}> : (!transform.any_op) -> (!transform.any_op, !transform.op<"scf.for">)
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<60xf32>) -> tensor<2x3x10xf32>, sym_name = "no_bubble_up_extract_slice_through_expand_shape_on_cleanup_false"}> ({
  ^bb0(%arg1: tensor<60xf32>):
    %2 = "tensor.expand_shape"(%arg1) <{reassociation = [[0, 1, 2]], static_output_shape = array<i64: 2, 3, 10>}> : (tensor<60xf32>) -> tensor<2x3x10xf32>
    %3 = "tensor.empty"() : () -> tensor<2x3x10xf32>
    %4 = "linalg.exp"(%2, %3) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg2: f32, %arg3: f32):
      %5 = "math.exp"(%arg2) <{fastmath = #arith.fastmath<none>}> : (f32) -> f32
      "linalg.yield"(%5) : (f32) -> ()
    }) : (tensor<2x3x10xf32>, tensor<2x3x10xf32>) -> tensor<2x3x10xf32>
    "func.return"(%4) : (tensor<2x3x10xf32>) -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["linalg.exp"]}> : (!transform.any_op) -> !transform.any_op
      %1:4 = "transform.structured.fuse"(%0) <{operandSegmentSizes = array<i32: 1, 0, 0>, static_tile_interchange = array<i64: 0, 1, 2>, static_tile_sizes = array<i64: 1, 1, 5>}> : (!transform.any_op) -> (!transform.any_op, !transform.op<"scf.for">, !transform.any_op, !transform.any_op)
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<1x8x1800x32xf32>) -> tensor<8x1800x32xf32>, sym_name = "bubble_up_extract_slice_through_collapse_shape"}> ({
  ^bb0(%arg1: tensor<1x8x1800x32xf32>):
    %2 = "tensor.collapse_shape"(%arg1) <{reassociation = [[0, 1], [2], [3]]}> : (tensor<1x8x1800x32xf32>) -> tensor<8x1800x32xf32>
    %3 = "tensor.empty"() : () -> tensor<8x1800x32xf32>
    %4 = "linalg.exp"(%2, %3) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg2: f32, %arg3: f32):
      %5 = "math.exp"(%arg2) <{fastmath = #arith.fastmath<none>}> : (f32) -> f32
      "linalg.yield"(%5) : (f32) -> ()
    }) : (tensor<8x1800x32xf32>, tensor<8x1800x32xf32>) -> tensor<8x1800x32xf32>
    "func.return"(%4) : (tensor<8x1800x32xf32>) -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["linalg.exp"]}> : (!transform.any_op) -> !transform.any_op
      %1:2 = "transform.structured.fuse"(%0) <{apply_cleanup, operandSegmentSizes = array<i32: 1, 0, 0>, static_tile_interchange = array<i64: 0, 1, 2>, static_tile_sizes = array<i64: 1, 0, 0>}> : (!transform.any_op) -> (!transform.any_op, !transform.op<"scf.for">)
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<1x8x1800x32xf32>) -> tensor<8x1800x32xf32>, sym_name = "bubble_up_extract_slice_through_collapse_shape_with_collapse_producer"}> ({
  ^bb0(%arg1: tensor<1x8x1800x32xf32>):
    %2 = "tensor.empty"() : () -> tensor<1x8x1800x32xf32>
    %3 = "linalg.abs"(%arg1, %2) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg4: f32, %arg5: f32):
      %8 = "math.absf"(%arg4) <{fastmath = #arith.fastmath<none>}> : (f32) -> f32
      "linalg.yield"(%8) : (f32) -> ()
    }) : (tensor<1x8x1800x32xf32>, tensor<1x8x1800x32xf32>) -> tensor<1x8x1800x32xf32>
    %4 = "tensor.collapse_shape"(%3) <{reassociation = [[0, 1], [2], [3]]}> : (tensor<1x8x1800x32xf32>) -> tensor<8x1800x32xf32>
    %5 = "tensor.empty"() : () -> tensor<8x1800x32xf32>
    %6 = "linalg.exp"(%4, %5) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg2: f32, %arg3: f32):
      %7 = "math.exp"(%arg2) <{fastmath = #arith.fastmath<none>}> : (f32) -> f32
      "linalg.yield"(%7) : (f32) -> ()
    }) : (tensor<8x1800x32xf32>, tensor<8x1800x32xf32>) -> tensor<8x1800x32xf32>
    "func.return"(%6) : (tensor<8x1800x32xf32>) -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["linalg.exp"]}> : (!transform.any_op) -> !transform.any_op
      %1:2 = "transform.structured.fuse"(%0) <{apply_cleanup, operandSegmentSizes = array<i32: 1, 0, 0>, static_tile_interchange = array<i64: 0, 1, 2>, static_tile_sizes = array<i64: 1, 0, 0>}> : (!transform.any_op) -> (!transform.any_op, !transform.op<"scf.for">)
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

