"builtin.module"() ({
  "func.func"() <{function_type = (tensor<256x128xf32>, tensor<256x128xf32>, tensor<256x128xf32>, tensor<?x?x?x?xf32>) -> tensor<?x?x?x?xf32>, sym_name = "fuse_scalable_pack_consumer_equal"}> ({
  ^bb0(%arg1: tensor<256x128xf32> loc("<stdin>":5:8), %arg2: tensor<256x128xf32> loc("<stdin>":5:36), %arg3: tensor<256x128xf32> loc("<stdin>":5:64), %arg4: tensor<?x?x?x?xf32> loc("<stdin>":5:92)):
    %3 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":6:10)
    %4 = "arith.constant"() <{value = 4 : index}> : () -> index loc("<stdin>":7:10)
    %5 = "arith.constant"() <{value = 8 : index}> : () -> index loc("<stdin>":8:10)
    %6 = "arith.constant"() <{value = 256 : index}> : () -> index loc("<stdin>":9:10)
    %7 = "vector.vscale"() : () -> index loc("<stdin>":10:10)
    %8 = "arith.muli"(%4, %7) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index loc("<stdin>":11:10)
    %9 = "arith.muli"(%5, %7) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index loc("<stdin>":12:10)
    %10 = "scf.for"(%3, %6, %9, %arg3) ({
    ^bb0(%arg5: index loc("<stdin>":14:10), %arg6: tensor<256x128xf32> loc("<stdin>":14:24)):
      %12 = "affine.min"(%arg5, %9) <{map = affine_map<(d0)[s0] -> (-d0 + 256, s0)>}> : (index, index) -> index loc("<stdin>":15:13)
      %13 = "tensor.extract_slice"(%arg6, %arg5, %12) <{operandSegmentSizes = array<i32: 1, 1, 1, 0>, static_offsets = array<i64: -9223372036854775808, 0>, static_sizes = array<i64: -9223372036854775808, 128>, static_strides = array<i64: 1, 1>}> : (tensor<256x128xf32>, index, index) -> tensor<?x128xf32> loc("<stdin>":16:13)
      %14 = "tensor.extract_slice"(%arg1, %arg5, %12) <{operandSegmentSizes = array<i32: 1, 1, 1, 0>, static_offsets = array<i64: -9223372036854775808, 0>, static_sizes = array<i64: -9223372036854775808, 128>, static_strides = array<i64: 1, 1>}> : (tensor<256x128xf32>, index, index) -> tensor<?x128xf32> loc("<stdin>":17:13)
      %15 = "tensor.extract_slice"(%arg2, %arg5, %12) <{operandSegmentSizes = array<i32: 1, 1, 1, 0>, static_offsets = array<i64: -9223372036854775808, 0>, static_sizes = array<i64: -9223372036854775808, 128>, static_strides = array<i64: 1, 1>}> : (tensor<256x128xf32>, index, index) -> tensor<?x128xf32> loc("<stdin>":18:13)
      %16 = "linalg.generic"(%14, %15, %13) <{indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0, d1)>], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 2, 1>}> ({
      ^bb0(%arg7: f32 loc("<stdin>":20:12), %arg8: f32 loc("<stdin>":20:24), %arg9: f32 loc("<stdin>":20:36)):
        %18 = "arith.mulf"(%arg7, %arg8) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32 loc("<stdin>":21:15)
        "linalg.yield"(%18) : (f32) -> () loc("<stdin>":22:9)
      }) : (tensor<?x128xf32>, tensor<?x128xf32>, tensor<?x128xf32>) -> tensor<?x128xf32> loc("<stdin>":19:13)
      %17 = "tensor.insert_slice"(%16, %arg6, %arg5, %12) <{operandSegmentSizes = array<i32: 1, 1, 1, 1, 0>, static_offsets = array<i64: -9223372036854775808, 0>, static_sizes = array<i64: -9223372036854775808, 128>, static_strides = array<i64: 1, 1>}> : (tensor<?x128xf32>, tensor<256x128xf32>, index, index) -> tensor<256x128xf32> loc("<stdin>":24:13)
      "scf.yield"(%17) : (tensor<256x128xf32>) -> () loc("<stdin>":25:7)
    }) : (index, index, index, tensor<256x128xf32>) -> tensor<256x128xf32> loc("<stdin>":13:11)
    %11 = "linalg.pack"(%10, %arg4, %9, %8) <{inner_dims_pos = array<i64: 0, 1>, operandSegmentSizes = array<i32: 1, 1, 0, 2>, outer_dims_perm = array<i64: 0, 1>, static_inner_tiles = array<i64: -9223372036854775808, -9223372036854775808>}> : (tensor<256x128xf32>, tensor<?x?x?x?xf32>, index, index) -> tensor<?x?x?x?xf32> loc("<stdin>":27:11)
    "func.return"(%11) : (tensor<?x?x?x?xf32>) -> () loc("<stdin>":28:5)
  }) : () -> () loc("<stdin>":4:3)
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op loc("<stdin>":32:10)):
      %0 = "transform.structured.match"(%arg0) <{ops = ["linalg.pack"]}> : (!transform.any_op) -> !transform.any_op loc("<stdin>":33:12)
      %1 = "transform.structured.match"(%arg0) <{ops = ["scf.for"]}> : (!transform.any_op) -> !transform.any_op loc("<stdin>":34:12)
      %2:2 = "transform.test.fuse_consumer"(%0, %1) <{inner_tile_alignments = array<i64: 2, 0>}> : (!transform.any_op, !transform.any_op) -> (!transform.any_op, !transform.any_op) loc("<stdin>":35:14)
      "transform.yield"() : () -> () loc("<stdin>":36:7)
    }) : () -> () loc("<stdin>":31:5)
  }) {transform.with_named_sequence} : () -> () loc("<stdin>":30:3)
}) : () -> () loc("<stdin>":3:1)
