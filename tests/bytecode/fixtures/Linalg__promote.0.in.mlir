"builtin.module"() ({
  "func.func"() <{function_type = (memref<?xi8>, index, index, index) -> (), sym_name = "matmul_f32"}> ({
  ^bb0(%arg1: memref<?xi8> loc("<stdin>":6:8), %arg2: index loc("<stdin>":6:29), %arg3: index loc("<stdin>":6:43), %arg4: index loc("<stdin>":6:57)):
    %2 = "arith.constant"() <{value = 4 : index}> : () -> index loc("<stdin>":7:10)
    %3 = "arith.constant"() <{value = 3 : index}> : () -> index loc("<stdin>":8:10)
    %4 = "arith.constant"() <{value = 2 : index}> : () -> index loc("<stdin>":9:10)
    %5 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":10:10)
    %6 = "arith.constant"() <{value = 1 : index}> : () -> index loc("<stdin>":11:10)
    %7 = "memref.view"(%arg1, %5, %arg2, %arg4) : (memref<?xi8>, index, index, index) -> memref<?x?xf32> loc("<stdin>":12:10)
    %8 = "memref.view"(%arg1, %5, %arg4, %arg3) : (memref<?xi8>, index, index, index) -> memref<?x?xf32> loc("<stdin>":13:10)
    %9 = "memref.view"(%arg1, %5, %arg2, %arg3) : (memref<?xi8>, index, index, index) -> memref<?x?xf32> loc("<stdin>":14:10)
    %10 = "memref.dim"(%7, %5) : (memref<?x?xf32>, index) -> index loc("<stdin>":15:11)
    %11 = "memref.dim"(%7, %6) : (memref<?x?xf32>, index) -> index loc("<stdin>":16:11)
    %12 = "memref.dim"(%8, %6) : (memref<?x?xf32>, index) -> index loc("<stdin>":17:11)
    "scf.for"(%5, %10, %4) ({
    ^bb0(%arg5: index loc("<stdin>":19:10)):
      "scf.for"(%5, %12, %3) ({
      ^bb0(%arg6: index loc("<stdin>":21:12)):
        "scf.for"(%5, %11, %2) ({
        ^bb0(%arg7: index loc("<stdin>":23:14)):
          %13 = "memref.subview"(%7, %arg5, %arg7, %4, %2) <{operandSegmentSizes = array<i32: 1, 2, 2, 0>, static_offsets = array<i64: -9223372036854775808, -9223372036854775808>, static_sizes = array<i64: -9223372036854775808, -9223372036854775808>, static_strides = array<i64: 1, 1>}> : (memref<?x?xf32>, index, index, index, index) -> memref<?x?xf32, strided<[?, 1], offset: ?>> loc("<stdin>":24:17)
          %14 = "memref.subview"(%8, %arg7, %arg6, %2, %3) <{operandSegmentSizes = array<i32: 1, 2, 2, 0>, static_offsets = array<i64: -9223372036854775808, -9223372036854775808>, static_sizes = array<i64: -9223372036854775808, -9223372036854775808>, static_strides = array<i64: 1, 1>}> : (memref<?x?xf32>, index, index, index, index) -> memref<?x?xf32, strided<[?, 1], offset: ?>> loc("<stdin>":25:17)
          %15 = "memref.subview"(%9, %arg5, %arg6, %4, %3) <{operandSegmentSizes = array<i32: 1, 2, 2, 0>, static_offsets = array<i64: -9223372036854775808, -9223372036854775808>, static_sizes = array<i64: -9223372036854775808, -9223372036854775808>, static_strides = array<i64: 1, 1>}> : (memref<?x?xf32>, index, index, index, index) -> memref<?x?xf32, strided<[?, 1], offset: ?>> loc("<stdin>":26:17)
          "linalg.matmul"(%13, %14, %15) <{indexing_maps = [affine_map<(d0, d1, d2) -> (d0, d2)>, affine_map<(d0, d1, d2) -> (d2, d1)>, affine_map<(d0, d1, d2) -> (d0, d1)>], operandSegmentSizes = array<i32: 2, 1>}> ({
          ^bb0(%arg8: f32 loc("<stdin>":28:16), %arg9: f32 loc("<stdin>":28:28), %arg10: f32 loc("<stdin>":28:40)):
            %16 = "arith.mulf"(%arg8, %arg9) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32 loc("<stdin>":29:19)
            %17 = "arith.addf"(%arg10, %16) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32 loc("<stdin>":30:19)
            "linalg.yield"(%17) : (f32) -> () loc("<stdin>":31:13)
          }) : (memref<?x?xf32, strided<[?, 1], offset: ?>>, memref<?x?xf32, strided<[?, 1], offset: ?>>, memref<?x?xf32, strided<[?, 1], offset: ?>>) -> () loc("<stdin>":27:11)
          "scf.yield"() : () -> () loc("<stdin>":33:11)
        }) : (index, index, index) -> () loc("<stdin>":22:9)
        "scf.yield"() : () -> () loc("<stdin>":35:9)
      }) : (index, index, index) -> () loc("<stdin>":20:7)
      "scf.yield"() : () -> () loc("<stdin>":37:7)
    }) : (index, index, index) -> () loc("<stdin>":18:5)
    "func.return"() : () -> () loc("<stdin>":39:5)
  }) : () -> () loc("<stdin>":5:3)
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op loc("<stdin>":43:10)):
      %0 = "transform.structured.match"(%arg0) <{ops = ["linalg.matmul"]}> : (!transform.any_op) -> !transform.any_op loc("<stdin>":44:12)
      %1 = "transform.structured.promote"(%0) <{operands_to_promote = [], use_alloca, use_full_tile_buffers = []}> : (!transform.any_op) -> !transform.any_op loc("<stdin>":45:12)
      "transform.yield"() : () -> () loc("<stdin>":46:7)
    }) : () -> () loc("<stdin>":42:5)
  }) {transform.with_named_sequence} : () -> () loc("<stdin>":41:3)
}) : () -> () loc("<stdin>":4:1)
