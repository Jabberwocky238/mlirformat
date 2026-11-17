"builtin.module"() ({
  "func.func"() <{function_type = (tensor<32x4x?x?xf32>, tensor<?x?xf32>) -> tensor<?x?xf32>, sym_name = "CKkc_to_KC_scalable"}> ({
  ^bb0(%arg3: tensor<32x4x?x?xf32> loc("<stdin>":3:8), %arg4: tensor<?x?xf32> loc("<stdin>":3:37)):
    %6 = "arith.constant"() <{value = 2 : index}> : () -> index loc("<stdin>":4:10)
    %7 = "arith.constant"() <{value = 4 : index}> : () -> index loc("<stdin>":5:10)
    %8 = "vector.vscale"() : () -> index loc("<stdin>":6:10)
    %9 = "arith.muli"(%6, %8) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index loc("<stdin>":7:10)
    %10 = "arith.muli"(%7, %8) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index loc("<stdin>":8:11)
    %11 = "linalg.unpack"(%arg3, %arg4, %9, %10) <{inner_dims_pos = array<i64: 0, 1>, outer_dims_perm = array<i64: 1, 0>, static_inner_tiles = array<i64: -9223372036854775808, -9223372036854775808>}> {operandSegmentSizes = array<i32: 1, 1, 0, 2>} : (tensor<32x4x?x?xf32>, tensor<?x?xf32>, index, index) -> tensor<?x?xf32> loc("<stdin>":9:11)
    "func.return"(%11) : (tensor<?x?xf32>) -> () loc("<stdin>":10:5)
  }) : () -> () loc("<stdin>":2:3)
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "equal"}> ({
    ^bb0(%arg2: !transform.any_op loc("<stdin>":14:10)):
      %4 = "transform.structured.match"(%arg2) <{ops = ["linalg.unpack"]}> : (!transform.any_op) -> !transform.any_op loc("<stdin>":15:12)
      %5:3 = "transform.structured.tile_using_for"(%4) <{inner_tile_alignments = array<i64: 2, 2>, scalable_sizes = array<i1: true, true>, static_sizes = array<i64: 2, 4>}> : (!transform.any_op) -> (!transform.any_op, !transform.any_op, !transform.any_op) loc("<stdin>":16:14)
      "transform.yield"() : () -> () loc("<stdin>":17:7)
    }) : () -> () loc("<stdin>":13:5)
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "aligned"}> ({
    ^bb0(%arg1: !transform.any_op loc("<stdin>":20:10)):
      %2 = "transform.structured.match"(%arg1) <{ops = ["linalg.unpack"]}> : (!transform.any_op) -> !transform.any_op loc("<stdin>":21:12)
      %3:3 = "transform.structured.tile_using_for"(%2) <{inner_tile_alignments = array<i64: 1, 1>, scalable_sizes = array<i1: true, true>, static_sizes = array<i64: 4, 8>}> : (!transform.any_op) -> (!transform.any_op, !transform.any_op, !transform.any_op) loc("<stdin>":22:14)
      "transform.yield"() : () -> () loc("<stdin>":23:7)
    }) : () -> () loc("<stdin>":19:5)
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "unaligned"}> ({
    ^bb0(%arg0: !transform.any_op loc("<stdin>":26:10)):
      %0 = "transform.structured.match"(%arg0) <{ops = ["linalg.unpack"]}> : (!transform.any_op) -> !transform.any_op loc("<stdin>":27:12)
      %1:3 = "transform.structured.tile_using_for"(%0) <{scalable_sizes = array<i1: false, false>, static_sizes = array<i64: 7, 5>}> : (!transform.any_op) -> (!transform.any_op, !transform.any_op, !transform.any_op) loc("<stdin>":28:14)
      "transform.yield"() : () -> () loc("<stdin>":29:7)
    }) : () -> () loc("<stdin>":25:5)
  }) {transform.with_named_sequence} : () -> () loc("<stdin>":12:3)
}) : () -> () loc("<stdin>":1:1)
