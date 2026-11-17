"builtin.module"() ({
  "func.func"() <{function_type = (tensor<128x256xf32>, tensor<4x4x128x256xf32>) -> tensor<4x4x128x256xf32>, sym_name = "fuse_pack_as_producer"}> ({
  ^bb0(%arg1: tensor<128x256xf32> loc("<stdin>":5:8), %arg2: tensor<4x4x128x256xf32> loc("<stdin>":5:36)):
    %5 = "tensor.empty"() : () -> tensor<1x1x128x256xf32> loc("<stdin>":6:10)
    %6 = "linalg.pack"(%arg1, %5) <{inner_dims_pos = array<i64: 0, 1>, operandSegmentSizes = array<i32: 1, 1, 0, 0>, static_inner_tiles = array<i64: 128, 256>}> : (tensor<128x256xf32>, tensor<1x1x128x256xf32>) -> tensor<1x1x128x256xf32> loc("<stdin>":7:10)
    %7 = "tensor.empty"() : () -> tensor<4x4x128x256xf32> loc("<stdin>":8:10)
    %8 = "linalg.generic"(%6, %arg2, %7) <{indexing_maps = [affine_map<(d0, d1, d2, d3) -> (0, 0, d2, d3)>, affine_map<(d0, d1, d2, d3) -> (d0, d1, d2, d3)>, affine_map<(d0, d1, d2, d3) -> (d0, d1, d2, d3)>], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg3: f32 loc("<stdin>":10:10), %arg4: f32 loc("<stdin>":10:22), %arg5: f32 loc("<stdin>":10:34)):
      %9 = "arith.addf"(%arg3, %arg4) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32 loc("<stdin>":11:12)
      "linalg.yield"(%9) : (f32) -> () loc("<stdin>":12:7)
    }) : (tensor<1x1x128x256xf32>, tensor<4x4x128x256xf32>, tensor<4x4x128x256xf32>) -> tensor<4x4x128x256xf32> loc("<stdin>":9:10)
    "func.return"(%8) : (tensor<4x4x128x256xf32>) -> () loc("<stdin>":14:5)
  }) : () -> () loc("<stdin>":4:3)
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op loc("<stdin>":18:10)):
      %0 = "transform.structured.match"(%arg0) <{ops = ["linalg.pack"]}> : (!transform.any_op) -> !transform.op<"linalg.pack"> loc("<stdin>":19:12)
      %1:3 = "transform.structured.lower_pack"(%0) <{lowerPadLikeWithInsertSlice = false}> : (!transform.op<"linalg.pack">) -> (!transform.op<"tensor.pad">, !transform.op<"tensor.expand_shape">, !transform.op<"linalg.transpose">) loc("<stdin>":20:14)
      %2 = "transform.structured.match"(%arg0) <{ops = ["linalg.generic"]}> : (!transform.any_op) -> !transform.any_op loc("<stdin>":21:12)
      %3:2 = "transform.structured.tile_using_forall"(%2) <{operandSegmentSizes = array<i32: 1, 0, 0, 0, 0>, static_num_threads = array<i64: 4, 4>}> : (!transform.any_op) -> (!transform.any_op, !transform.any_op) loc("<stdin>":22:14)
      %4:2 = "transform.structured.fuse_into_containing_op"(%1#2, %3#1) : (!transform.op<"linalg.transpose">, !transform.any_op) -> (!transform.any_op, !transform.any_op) loc("<stdin>":23:14)
      "transform.yield"() : () -> () loc("<stdin>":24:7)
    }) : () -> () loc("<stdin>":17:5)
  }) {transform.with_named_sequence} : () -> () loc("<stdin>":16:3)
}) : () -> () loc("<stdin>":3:1)
