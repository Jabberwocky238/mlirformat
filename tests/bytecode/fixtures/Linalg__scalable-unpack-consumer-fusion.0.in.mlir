"builtin.module"() ({
  "func.func"() <{function_type = (tensor<32x?xf32>, tensor<32x?xf32>, tensor<32x?xf32>) -> tensor<?xf32>, sym_name = "fuse_scalable_unpack_consumer"}> ({
  ^bb0(%arg3: tensor<32x?xf32> loc("<stdin>":5:8), %arg4: tensor<32x?xf32> loc("<stdin>":5:33), %arg5: tensor<32x?xf32> loc("<stdin>":5:58)):
    %9 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":6:10)
    %10 = "arith.constant"() <{value = 1 : index}> : () -> index loc("<stdin>":7:11)
    %11 = "arith.constant"() <{value = 8 : index}> : () -> index loc("<stdin>":8:11)
    %12 = "vector.vscale"() : () -> index loc("<stdin>":9:11)
    %13 = "arith.muli"(%11, %12) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index loc("<stdin>":10:11)
    %14 = "tensor.dim"(%arg5, %10) : (tensor<32x?xf32>, index) -> index loc("<stdin>":11:11)
    %15 = "scf.for"(%9, %14, %13, %arg5) ({
    ^bb0(%arg6: index loc("<stdin>":13:10), %arg7: tensor<32x?xf32> loc("<stdin>":13:24)):
      %18 = "affine.min"(%arg6, %13, %14) <{map = affine_map<(d0)[s0, s1] -> (-d0 + s1, s0)>}> : (index, index, index) -> index loc("<stdin>":14:13)
      %19 = "tensor.extract_slice"(%arg3, %arg6, %18) <{operandSegmentSizes = array<i32: 1, 1, 1, 0>, static_offsets = array<i64: 0, -9223372036854775808>, static_sizes = array<i64: 32, -9223372036854775808>, static_strides = array<i64: 1, 1>}> : (tensor<32x?xf32>, index, index) -> tensor<32x?xf32> loc("<stdin>":15:13)
      %20 = "tensor.extract_slice"(%arg4, %arg6, %18) <{operandSegmentSizes = array<i32: 1, 1, 1, 0>, static_offsets = array<i64: 0, -9223372036854775808>, static_sizes = array<i64: 32, -9223372036854775808>, static_strides = array<i64: 1, 1>}> : (tensor<32x?xf32>, index, index) -> tensor<32x?xf32> loc("<stdin>":16:13)
      %21 = "tensor.extract_slice"(%arg7, %arg6, %18) <{operandSegmentSizes = array<i32: 1, 1, 1, 0>, static_offsets = array<i64: 0, -9223372036854775808>, static_sizes = array<i64: 32, -9223372036854775808>, static_strides = array<i64: 1, 1>}> : (tensor<32x?xf32>, index, index) -> tensor<32x?xf32> loc("<stdin>":17:13)
      %22 = "linalg.generic"(%19, %20, %21) <{indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0, d1)>], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 2, 1>}> ({
      ^bb0(%arg8: f32 loc("<stdin>":19:12), %arg9: f32 loc("<stdin>":19:24), %arg10: f32 loc("<stdin>":19:36)):
        %24 = "arith.mulf"(%arg8, %arg9) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32 loc("<stdin>":20:15)
        "linalg.yield"(%24) : (f32) -> () loc("<stdin>":21:9)
      }) : (tensor<32x?xf32>, tensor<32x?xf32>, tensor<32x?xf32>) -> tensor<32x?xf32> loc("<stdin>":18:13)
      %23 = "tensor.insert_slice"(%22, %arg7, %arg6, %18) <{operandSegmentSizes = array<i32: 1, 1, 1, 1, 0>, static_offsets = array<i64: 0, -9223372036854775808>, static_sizes = array<i64: 32, -9223372036854775808>, static_strides = array<i64: 1, 1>}> : (tensor<32x?xf32>, tensor<32x?xf32>, index, index) -> tensor<32x?xf32> loc("<stdin>":23:13)
      "scf.yield"(%23) : (tensor<32x?xf32>) -> () loc("<stdin>":24:7)
    }) : (index, index, index, tensor<32x?xf32>) -> tensor<32x?xf32> loc("<stdin>":12:11)
    %16 = "tensor.empty"(%14) : (index) -> tensor<?xf32> loc("<stdin>":26:11)
    %17 = "linalg.unpack"(%15, %16, %13) <{inner_dims_pos = array<i64: 0>, outer_dims_perm = array<i64: 0>, static_inner_tiles = array<i64: -9223372036854775808>}> {operandSegmentSizes = array<i32: 1, 1, 0, 1>} : (tensor<32x?xf32>, tensor<?xf32>, index) -> tensor<?xf32> loc("<stdin>":27:11)
    "func.return"(%17) : (tensor<?xf32>) -> () loc("<stdin>":28:5)
  }) : () -> () loc("<stdin>":4:3)
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg2: !transform.any_op loc("<stdin>":32:10)):
      %6 = "transform.structured.match"(%arg2) <{ops = ["linalg.unpack"]}> : (!transform.any_op) -> !transform.any_op loc("<stdin>":33:12)
      %7 = "transform.structured.match"(%arg2) <{ops = ["scf.for"]}> : (!transform.any_op) -> !transform.any_op loc("<stdin>":34:12)
      %8:2 = "transform.test.fuse_consumer"(%6, %7) <{inner_tile_alignments = array<i64: 2>}> : (!transform.any_op, !transform.any_op) -> (!transform.any_op, !transform.any_op) loc("<stdin>":35:14)
      "transform.yield"() : () -> () loc("<stdin>":36:7)
    }) : () -> () loc("<stdin>":31:5)
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "no_hint"}> ({
    ^bb0(%arg1: !transform.any_op loc("<stdin>":39:10)):
      %3 = "transform.structured.match"(%arg1) <{ops = ["linalg.unpack"]}> : (!transform.any_op) -> !transform.any_op loc("<stdin>":40:12)
      %4 = "transform.structured.match"(%arg1) <{ops = ["scf.for"]}> : (!transform.any_op) -> !transform.any_op loc("<stdin>":41:12)
      %5:2 = "transform.test.fuse_consumer"(%3, %4) : (!transform.any_op, !transform.any_op) -> (!transform.any_op, !transform.any_op) loc("<stdin>":42:14)
      "transform.yield"() : () -> () loc("<stdin>":43:7)
    }) : () -> () loc("<stdin>":38:5)
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "multiple"}> ({
    ^bb0(%arg0: !transform.any_op loc("<stdin>":46:10)):
      %0 = "transform.structured.match"(%arg0) <{ops = ["linalg.unpack"]}> : (!transform.any_op) -> !transform.any_op loc("<stdin>":47:12)
      %1 = "transform.structured.match"(%arg0) <{ops = ["scf.for"]}> : (!transform.any_op) -> !transform.any_op loc("<stdin>":48:12)
      %2:2 = "transform.test.fuse_consumer"(%0, %1) <{inner_tile_alignments = array<i64: 1>}> : (!transform.any_op, !transform.any_op) -> (!transform.any_op, !transform.any_op) loc("<stdin>":49:14)
      "transform.yield"() : () -> () loc("<stdin>":50:7)
    }) : () -> () loc("<stdin>":45:5)
  }) {transform.with_named_sequence} : () -> () loc("<stdin>":30:3)
}) : () -> () loc("<stdin>":3:1)
