"builtin.module"() ({
  "func.func"() <{function_type = (tensor<128x256xf32>, tensor<?x?x?x?xf32>) -> tensor<?x?x?x?xf32>, sym_name = "pack"}> ({
  ^bb0(%arg6: tensor<128x256xf32> loc("<stdin>":3:8), %arg7: tensor<?x?x?x?xf32> loc("<stdin>":3:36)):
    %12 = "arith.constant"() <{value = 8 : index}> : () -> index loc("<stdin>":4:11)
    %13 = "arith.constant"() <{value = 4 : index}> : () -> index loc("<stdin>":5:11)
    %14 = "vector.vscale"() : () -> index loc("<stdin>":6:11)
    %15 = "arith.muli"(%12, %14) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index loc("<stdin>":7:11)
    %16 = "arith.muli"(%13, %14) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index loc("<stdin>":8:11)
    %17 = "linalg.pack"(%arg6, %arg7, %15, %16) <{inner_dims_pos = array<i64: 0, 1>, operandSegmentSizes = array<i32: 1, 1, 0, 2>, static_inner_tiles = array<i64: -9223372036854775808, -9223372036854775808>}> : (tensor<128x256xf32>, tensor<?x?x?x?xf32>, index, index) -> tensor<?x?x?x?xf32> loc("<stdin>":9:11)
    "func.return"(%17) : (tensor<?x?x?x?xf32>) -> () loc("<stdin>":10:5)
  }) : () -> () loc("<stdin>":2:3)
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "ones_equal"}> ({
    ^bb0(%arg5: !transform.any_op loc("<stdin>":14:10)):
      %10 = "transform.structured.match"(%arg5) <{ops = ["linalg.pack"]}> : (!transform.any_op) -> !transform.any_op loc("<stdin>":15:13)
      %11:3 = "transform.structured.tile_using_for"(%10) <{inner_tile_alignments = array<i64: 2, 2>, scalable_sizes = array<i1: false, false>, static_sizes = array<i64: 1, 1>}> : (!transform.any_op) -> (!transform.any_op, !transform.any_op, !transform.any_op) loc("<stdin>":16:15)
      "transform.yield"() : () -> () loc("<stdin>":17:7)
    }) : () -> () loc("<stdin>":13:5)
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "ones_multiple"}> ({
    ^bb0(%arg4: !transform.any_op loc("<stdin>":20:10)):
      %8 = "transform.structured.match"(%arg4) <{ops = ["linalg.pack"]}> : (!transform.any_op) -> !transform.any_op loc("<stdin>":21:12)
      %9:3 = "transform.structured.tile_using_for"(%8) <{inner_tile_alignments = array<i64: 1, 1>, scalable_sizes = array<i1: false, false>, static_sizes = array<i64: 1, 1>}> : (!transform.any_op) -> (!transform.any_op, !transform.any_op, !transform.any_op) loc("<stdin>":22:14)
      "transform.yield"() : () -> () loc("<stdin>":23:7)
    }) : () -> () loc("<stdin>":19:5)
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "ones_nohint"}> ({
    ^bb0(%arg3: !transform.any_op loc("<stdin>":26:10)):
      %6 = "transform.structured.match"(%arg3) <{ops = ["linalg.pack"]}> : (!transform.any_op) -> !transform.any_op loc("<stdin>":27:12)
      %7:3 = "transform.structured.tile_using_for"(%6) <{scalable_sizes = array<i1: false, false>, static_sizes = array<i64: 1, 1>}> : (!transform.any_op) -> (!transform.any_op, !transform.any_op, !transform.any_op) loc("<stdin>":28:14)
      "transform.yield"() : () -> () loc("<stdin>":29:7)
    }) : () -> () loc("<stdin>":25:5)
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "twofour_equal"}> ({
    ^bb0(%arg2: !transform.any_op loc("<stdin>":32:10)):
      %4 = "transform.structured.match"(%arg2) <{ops = ["linalg.pack"]}> : (!transform.any_op) -> !transform.any_op loc("<stdin>":33:12)
      %5:3 = "transform.structured.tile_using_for"(%4) <{inner_tile_alignments = array<i64: 2, 2>, scalable_sizes = array<i1: false, false>, static_sizes = array<i64: 2, 4>}> : (!transform.any_op) -> (!transform.any_op, !transform.any_op, !transform.any_op) loc("<stdin>":34:14)
      "transform.yield"() : () -> () loc("<stdin>":35:7)
    }) : () -> () loc("<stdin>":31:5)
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "twofour_multiple"}> ({
    ^bb0(%arg1: !transform.any_op loc("<stdin>":38:10)):
      %2 = "transform.structured.match"(%arg1) <{ops = ["linalg.pack"]}> : (!transform.any_op) -> !transform.any_op loc("<stdin>":39:12)
      %3:3 = "transform.structured.tile_using_for"(%2) <{inner_tile_alignments = array<i64: 1, 1>, scalable_sizes = array<i1: false, false>, static_sizes = array<i64: 2, 4>}> : (!transform.any_op) -> (!transform.any_op, !transform.any_op, !transform.any_op) loc("<stdin>":40:14)
      "transform.yield"() : () -> () loc("<stdin>":41:7)
    }) : () -> () loc("<stdin>":37:5)
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "twofour_nohint"}> ({
    ^bb0(%arg0: !transform.any_op loc("<stdin>":44:10)):
      %0 = "transform.structured.match"(%arg0) <{ops = ["linalg.pack"]}> : (!transform.any_op) -> !transform.any_op loc("<stdin>":45:12)
      %1:3 = "transform.structured.tile_using_for"(%0) <{scalable_sizes = array<i1: false, false>, static_sizes = array<i64: 2, 4>}> : (!transform.any_op) -> (!transform.any_op, !transform.any_op, !transform.any_op) loc("<stdin>":46:14)
      "transform.yield"() : () -> () loc("<stdin>":47:7)
    }) : () -> () loc("<stdin>":43:5)
  }) {transform.with_named_sequence} : () -> () loc("<stdin>":12:3)
}) : () -> () loc("<stdin>":1:1)
