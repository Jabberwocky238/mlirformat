"builtin.module"() ({
  "func.func"() <{function_type = (memref<?x?xf32, strided<[?, 1], offset: ?>>, memref<?x?xf32, strided<[?, 1], offset: ?>>, memref<?x?xf32, strided<[?, 1], offset: ?>>) -> (), sym_name = "promote_subview_matmul"}> ({
  ^bb0(%arg1: memref<?x?xf32, strided<[?, 1], offset: ?>> loc("<stdin>":6:8), %arg2: memref<?x?xf32, strided<[?, 1], offset: ?>> loc("<stdin>":6:60), %arg3: memref<?x?xf32, strided<[?, 1], offset: ?>> loc("<stdin>":6:112)):
    %2 = "arith.constant"() <{value = 2000 : index}> : () -> index loc("<stdin>":7:10)
    %3 = "arith.constant"() <{value = 3000 : index}> : () -> index loc("<stdin>":8:10)
    %4 = "arith.constant"() <{value = 4000 : index}> : () -> index loc("<stdin>":9:10)
    %5 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":10:10)
    %6 = "arith.constant"() <{value = 1 : index}> : () -> index loc("<stdin>":11:10)
    %7 = "memref.dim"(%arg1, %5) : (memref<?x?xf32, strided<[?, 1], offset: ?>>, index) -> index loc("<stdin>":12:10)
    %8 = "memref.dim"(%arg1, %6) : (memref<?x?xf32, strided<[?, 1], offset: ?>>, index) -> index loc("<stdin>":13:10)
    %9 = "memref.dim"(%arg2, %6) : (memref<?x?xf32, strided<[?, 1], offset: ?>>, index) -> index loc("<stdin>":14:10)
    "scf.for"(%5, %7, %2) ({
    ^bb0(%arg4: index loc("<stdin>":16:10)):
      "scf.for"(%5, %9, %3) ({
      ^bb0(%arg5: index loc("<stdin>":18:12)):
        "scf.for"(%5, %8, %4) ({
        ^bb0(%arg6: index loc("<stdin>":20:14)):
          %10 = "memref.subview"(%arg1, %arg4, %arg6, %2, %4, %6, %6) <{operandSegmentSizes = array<i32: 1, 2, 2, 2>, static_offsets = array<i64: -9223372036854775808, -9223372036854775808>, static_sizes = array<i64: -9223372036854775808, -9223372036854775808>, static_strides = array<i64: -9223372036854775808, -9223372036854775808>}> : (memref<?x?xf32, strided<[?, 1], offset: ?>>, index, index, index, index, index, index) -> memref<?x?xf32, strided<[?, ?], offset: ?>> loc("<stdin>":21:17)
          %11 = "memref.subview"(%arg2, %arg6, %arg5, %4, %3, %6, %6) <{operandSegmentSizes = array<i32: 1, 2, 2, 2>, static_offsets = array<i64: -9223372036854775808, -9223372036854775808>, static_sizes = array<i64: -9223372036854775808, -9223372036854775808>, static_strides = array<i64: -9223372036854775808, -9223372036854775808>}> : (memref<?x?xf32, strided<[?, 1], offset: ?>>, index, index, index, index, index, index) -> memref<?x?xf32, strided<[?, ?], offset: ?>> loc("<stdin>":22:17)
          %12 = "memref.subview"(%arg3, %arg4, %arg5, %2, %3, %6, %6) <{operandSegmentSizes = array<i32: 1, 2, 2, 2>, static_offsets = array<i64: -9223372036854775808, -9223372036854775808>, static_sizes = array<i64: -9223372036854775808, -9223372036854775808>, static_strides = array<i64: -9223372036854775808, -9223372036854775808>}> : (memref<?x?xf32, strided<[?, 1], offset: ?>>, index, index, index, index, index, index) -> memref<?x?xf32, strided<[?, ?], offset: ?>> loc("<stdin>":23:17)
          "linalg.matmul"(%10, %11, %12) <{indexing_maps = [affine_map<(d0, d1, d2) -> (d0, d2)>, affine_map<(d0, d1, d2) -> (d2, d1)>, affine_map<(d0, d1, d2) -> (d0, d1)>], operandSegmentSizes = array<i32: 2, 1>}> ({
          ^bb0(%arg7: f32 loc("<stdin>":25:16), %arg8: f32 loc("<stdin>":25:28), %arg9: f32 loc("<stdin>":25:40)):
            %13 = "arith.mulf"(%arg7, %arg8) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32 loc("<stdin>":26:19)
            %14 = "arith.addf"(%arg9, %13) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32 loc("<stdin>":27:19)
            "linalg.yield"(%14) : (f32) -> () loc("<stdin>":28:13)
          }) : (memref<?x?xf32, strided<[?, ?], offset: ?>>, memref<?x?xf32, strided<[?, ?], offset: ?>>, memref<?x?xf32, strided<[?, ?], offset: ?>>) -> () loc("<stdin>":24:11)
          "scf.yield"() : () -> () loc("<stdin>":30:11)
        }) : (index, index, index) -> () loc("<stdin>":19:9)
        "scf.yield"() : () -> () loc("<stdin>":32:9)
      }) : (index, index, index) -> () loc("<stdin>":17:7)
      "scf.yield"() : () -> () loc("<stdin>":34:7)
    }) : (index, index, index) -> () loc("<stdin>":15:5)
    "func.return"() : () -> () loc("<stdin>":36:5)
  }) : () -> () loc("<stdin>":5:3)
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op loc("<stdin>":40:10)):
      %0 = "transform.structured.match"(%arg0) <{ops = ["linalg.matmul"]}> : (!transform.any_op) -> !transform.any_op loc("<stdin>":41:12)
      %1 = "transform.structured.promote"(%0) <{operands_to_promote = [0, 1, 2], use_full_tile_buffers = [], use_full_tiles_by_default}> : (!transform.any_op) -> !transform.any_op loc("<stdin>":42:12)
      "transform.yield"() : () -> () loc("<stdin>":43:7)
    }) : () -> () loc("<stdin>":39:5)
  }) {transform.with_named_sequence} : () -> () loc("<stdin>":38:3)
}) : () -> () loc("<stdin>":4:1)
