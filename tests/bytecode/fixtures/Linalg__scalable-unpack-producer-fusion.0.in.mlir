"builtin.module"() ({
  "func.func"() <{function_type = (tensor<4x8x?x?xf32>, tensor<?x?xf32>, index, index) -> tensor<?x?xf32>, sym_name = "unpack_elemwise_scalable"}> ({
  ^bb0(%arg4: tensor<4x8x?x?xf32> loc("<stdin>":3:8), %arg5: tensor<?x?xf32> loc("<stdin>":3:36), %arg6: index loc("<stdin>":3:60), %arg7: index loc("<stdin>":3:74)):
    %10 = "arith.constant"() <{value = 4 : index}> : () -> index loc("<stdin>":4:11)
    %11 = "arith.constant"() <{value = 8 : index}> : () -> index loc("<stdin>":5:11)
    %12 = "arith.constant"() <{value = 16 : index}> : () -> index loc("<stdin>":6:11)
    %13 = "vector.vscale"() : () -> index loc("<stdin>":7:11)
    %14 = "arith.muli"(%11, %13) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index loc("<stdin>":8:11)
    %15 = "arith.muli"(%10, %13) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index loc("<stdin>":9:11)
    %16 = "arith.muli"(%12, %13) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index loc("<stdin>":10:11)
    %17 = "tensor.empty"(%arg6, %arg7) : (index, index) -> tensor<?x?xf32> loc("<stdin>":11:11)
    %18 = "linalg.unpack"(%arg4, %17, %14, %15) <{inner_dims_pos = array<i64: 0, 1>, static_inner_tiles = array<i64: -9223372036854775808, -9223372036854775808>}> {operandSegmentSizes = array<i32: 1, 1, 0, 2>} : (tensor<4x8x?x?xf32>, tensor<?x?xf32>, index, index) -> tensor<?x?xf32> loc("<stdin>":12:11)
    %19 = "linalg.exp"(%18, %arg5) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg8: f32 loc("<stdin>":14:10), %arg9: f32 loc("<stdin>":14:22)):
      %20 = "math.exp"(%arg8) <{fastmath = #arith.fastmath<none>}> : (f32) -> f32 loc("<stdin>":15:13)
      "linalg.yield"(%20) : (f32) -> () loc("<stdin>":16:7)
    }) : (tensor<?x?xf32>, tensor<?x?xf32>) -> tensor<?x?xf32> loc("<stdin>":13:11)
    "func.return"(%19) : (tensor<?x?xf32>) -> () loc("<stdin>":18:5)
  }) : () -> () loc("<stdin>":2:3)
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "aligned"}> ({
    ^bb0(%arg3: !transform.any_op loc("<stdin>":22:10)):
      %6 = "transform.structured.match"(%arg3) <{ops = ["linalg.exp"]}> : (!transform.any_op) -> !transform.any_op loc("<stdin>":23:12)
      %7 = "transform.structured.match"(%arg3) <{ops = ["arith.muli"]}> : (!transform.any_op) -> !transform.any_op loc("<stdin>":24:12)
      %8:3 = "transform.split_handle"(%7) <{fail_on_payload_too_small = true, pass_through_empty_handle = true}> : (!transform.any_op) -> (!transform.any_op, !transform.any_op, !transform.any_op) loc("<stdin>":25:14)
      %9:3 = "transform.structured.fuse"(%6, %8#2, %8#0) <{inner_tile_alignments = array<i64: 1, 1>, operandSegmentSizes = array<i32: 1, 2, 0, 0>, static_tile_interchange = array<i64: 0, 1>, static_tile_sizes = array<i64: -9223372036854775808, -9223372036854775808>}> : (!transform.any_op, !transform.any_op, !transform.any_op) -> (!transform.any_op, !transform.any_op, !transform.any_op) loc("<stdin>":26:14)
      "transform.yield"() : () -> () loc("<stdin>":27:7)
    }) : () -> () loc("<stdin>":21:5)
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "equal"}> ({
    ^bb0(%arg2: !transform.any_op loc("<stdin>":30:10)):
      %2 = "transform.structured.match"(%arg2) <{ops = ["linalg.exp"]}> : (!transform.any_op) -> !transform.any_op loc("<stdin>":31:12)
      %3 = "transform.structured.match"(%arg2) <{ops = ["arith.muli"]}> : (!transform.any_op) -> !transform.any_op loc("<stdin>":32:12)
      %4:3 = "transform.split_handle"(%3) <{fail_on_payload_too_small = true, pass_through_empty_handle = true}> : (!transform.any_op) -> (!transform.any_op, !transform.any_op, !transform.any_op) loc("<stdin>":33:14)
      %5:3 = "transform.structured.fuse"(%2, %4#0, %4#1) <{inner_tile_alignments = array<i64: 2, 2>, operandSegmentSizes = array<i32: 1, 2, 0, 0>, static_tile_interchange = array<i64: 0, 1>, static_tile_sizes = array<i64: -9223372036854775808, -9223372036854775808>}> : (!transform.any_op, !transform.any_op, !transform.any_op) -> (!transform.any_op, !transform.any_op, !transform.any_op) loc("<stdin>":34:14)
      "transform.yield"() : () -> () loc("<stdin>":35:7)
    }) : () -> () loc("<stdin>":29:5)
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "unaligned"}> ({
    ^bb0(%arg1: !transform.any_op loc("<stdin>":38:10)):
      %0 = "transform.structured.match"(%arg1) <{ops = ["linalg.exp"]}> : (!transform.any_op) -> !transform.any_op loc("<stdin>":39:12)
      %1:3 = "transform.structured.fuse"(%0) <{operandSegmentSizes = array<i32: 1, 0, 0, 0>, static_tile_interchange = array<i64: 0, 1>, static_tile_sizes = array<i64: 7, 5>}> : (!transform.any_op) -> (!transform.any_op, !transform.any_op, !transform.any_op) loc("<stdin>":40:14)
      "transform.yield"() : () -> () loc("<stdin>":41:7)
    }) : () -> () loc("<stdin>":37:5)
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op loc("<stdin>":44:10)):
      "transform.yield"() : () -> () loc("<stdin>":45:7)
    }) : () -> () loc("<stdin>":43:5)
  }) {transform.with_named_sequence} : () -> () loc("<stdin>":20:3)
}) : () -> () loc("<stdin>":1:1)
