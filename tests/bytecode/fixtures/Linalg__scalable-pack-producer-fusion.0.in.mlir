"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x?xf32>, tensor<?x?x?x?xf32>, tensor<?x?x?x?xf32>) -> tensor<?x?x?x?xf32>, sym_name = "pack_elemwise"}> ({
  ^bb0(%arg6: tensor<?x?xf32> loc("<stdin>":4:8), %arg7: tensor<?x?x?x?xf32> loc("<stdin>":4:32), %arg8: tensor<?x?x?x?xf32> loc("<stdin>":4:60)):
    %12 = "arith.constant"() <{value = 8 : index}> : () -> index loc("<stdin>":5:11)
    %13 = "arith.constant"() <{value = 4 : index}> : () -> index loc("<stdin>":6:11)
    %14 = "vector.vscale"() : () -> index loc("<stdin>":7:11)
    %15 = "arith.muli"(%12, %14) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index loc("<stdin>":8:11)
    %16 = "arith.muli"(%13, %14) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index loc("<stdin>":9:11)
    %17 = "linalg.pack"(%arg6, %arg7, %15, %16) <{inner_dims_pos = array<i64: 0, 1>, operandSegmentSizes = array<i32: 1, 1, 0, 2>, static_inner_tiles = array<i64: -9223372036854775808, -9223372036854775808>}> : (tensor<?x?xf32>, tensor<?x?x?x?xf32>, index, index) -> tensor<?x?x?x?xf32> loc("<stdin>":10:11)
    %18 = "linalg.generic"(%17, %arg8) <{indexing_maps = [affine_map<(d0, d1, d2, d3) -> (d0, d1, d2, d3)>, affine_map<(d0, d1, d2, d3) -> (d0, d1, d2, d3)>], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg9: f32 loc("<stdin>":12:10), %arg10: f32 loc("<stdin>":12:22)):
      %19 = "math.exp"(%arg9) <{fastmath = #arith.fastmath<none>}> : (f32) -> f32 loc("<stdin>":13:13)
      "linalg.yield"(%19) : (f32) -> () loc("<stdin>":14:7)
    }) : (tensor<?x?x?x?xf32>, tensor<?x?x?x?xf32>) -> tensor<?x?x?x?xf32> loc("<stdin>":11:11)
    "func.return"(%18) : (tensor<?x?x?x?xf32>) -> () loc("<stdin>":16:5)
  }) : () -> () loc("<stdin>":3:3)
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "ones_equal"}> ({
    ^bb0(%arg5: !transform.any_op loc("<stdin>":20:10)):
      %10 = "transform.structured.match"(%arg5) <{ops = ["linalg.generic"]}> : (!transform.any_op) -> !transform.any_op loc("<stdin>":21:13)
      %11:3 = "transform.structured.fuse"(%10) <{inner_tile_alignments = array<i64: 2, 2>, operandSegmentSizes = array<i32: 1, 0, 0, 0>, static_tile_sizes = array<i64: 1, 1, 0, 0>}> : (!transform.any_op) -> (!transform.any_op, !transform.any_op, !transform.any_op) loc("<stdin>":22:15)
      "transform.yield"() : () -> () loc("<stdin>":23:7)
    }) : () -> () loc("<stdin>":19:5)
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "ones_multiple"}> ({
    ^bb0(%arg4: !transform.any_op loc("<stdin>":26:10)):
      %8 = "transform.structured.match"(%arg4) <{ops = ["linalg.generic"]}> : (!transform.any_op) -> !transform.any_op loc("<stdin>":27:12)
      %9:3 = "transform.structured.fuse"(%8) <{inner_tile_alignments = array<i64: 1, 1>, operandSegmentSizes = array<i32: 1, 0, 0, 0>, static_tile_sizes = array<i64: 1, 1, 0, 0>}> : (!transform.any_op) -> (!transform.any_op, !transform.any_op, !transform.any_op) loc("<stdin>":28:14)
      "transform.yield"() : () -> () loc("<stdin>":29:7)
    }) : () -> () loc("<stdin>":25:5)
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "ones_nohint"}> ({
    ^bb0(%arg3: !transform.any_op loc("<stdin>":32:10)):
      %6 = "transform.structured.match"(%arg3) <{ops = ["linalg.generic"]}> : (!transform.any_op) -> !transform.any_op loc("<stdin>":33:12)
      %7:3 = "transform.structured.fuse"(%6) <{operandSegmentSizes = array<i32: 1, 0, 0, 0>, static_tile_sizes = array<i64: 1, 1, 0, 0>}> : (!transform.any_op) -> (!transform.any_op, !transform.any_op, !transform.any_op) loc("<stdin>":34:14)
      "transform.yield"() : () -> () loc("<stdin>":35:7)
    }) : () -> () loc("<stdin>":31:5)
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "inner_equal"}> ({
    ^bb0(%arg2: !transform.any_op loc("<stdin>":38:10)):
      %4 = "transform.structured.match"(%arg2) <{ops = ["linalg.generic"]}> : (!transform.any_op) -> !transform.any_op loc("<stdin>":39:12)
      %5:3 = "transform.structured.fuse"(%4) <{inner_tile_alignments = array<i64: 2, 2>, operandSegmentSizes = array<i32: 1, 0, 0, 0>, static_tile_sizes = array<i64: 0, 0, 8, 4>}> : (!transform.any_op) -> (!transform.any_op, !transform.any_op, !transform.any_op) loc("<stdin>":40:14)
      "transform.yield"() : () -> () loc("<stdin>":41:7)
    }) : () -> () loc("<stdin>":37:5)
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "inner_multiple"}> ({
    ^bb0(%arg1: !transform.any_op loc("<stdin>":44:10)):
      %2 = "transform.structured.match"(%arg1) <{ops = ["linalg.generic"]}> : (!transform.any_op) -> !transform.any_op loc("<stdin>":45:12)
      %3:3 = "transform.structured.fuse"(%2) <{inner_tile_alignments = array<i64: 1, 1>, operandSegmentSizes = array<i32: 1, 0, 0, 0>, static_tile_sizes = array<i64: 0, 0, 8, 4>}> : (!transform.any_op) -> (!transform.any_op, !transform.any_op, !transform.any_op) loc("<stdin>":46:14)
      "transform.yield"() : () -> () loc("<stdin>":47:7)
    }) : () -> () loc("<stdin>":43:5)
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "inner_nohint"}> ({
    ^bb0(%arg0: !transform.any_op loc("<stdin>":50:10)):
      %0 = "transform.structured.match"(%arg0) <{ops = ["linalg.generic"]}> : (!transform.any_op) -> !transform.any_op loc("<stdin>":51:12)
      %1:3 = "transform.structured.fuse"(%0) <{operandSegmentSizes = array<i32: 1, 0, 0, 0>, static_tile_sizes = array<i64: 0, 0, 8, 4>}> : (!transform.any_op) -> (!transform.any_op, !transform.any_op, !transform.any_op) loc("<stdin>":52:14)
      "transform.yield"() : () -> () loc("<stdin>":53:7)
    }) : () -> () loc("<stdin>":49:5)
  }) {transform.with_named_sequence} : () -> () loc("<stdin>":18:3)
}) : () -> () loc("<stdin>":2:1)
