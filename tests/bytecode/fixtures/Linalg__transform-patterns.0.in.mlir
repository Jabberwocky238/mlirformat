"builtin.module"() ({
  "func.func"() <{function_type = (memref<?xf32, strided<[1], offset: ?>>, memref<?xf32, strided<[1], offset: ?>>, memref<f32>) -> (), sym_name = "dot"}> ({
  ^bb0(%arg1: memref<?xf32, strided<[1], offset: ?>> loc("<stdin>":5:8), %arg2: memref<?xf32, strided<[1], offset: ?>> loc("<stdin>":5:55), %arg3: memref<f32> loc("<stdin>":5:102)):
    "linalg.dot"(%arg1, %arg2, %arg3) <{operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg4: f32 loc("<stdin>":7:10), %arg5: f32 loc("<stdin>":7:22), %arg6: f32 loc("<stdin>":7:34)):
      %2 = "arith.mulf"(%arg4, %arg5) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32 loc("<stdin>":8:12)
      %3 = "arith.addf"(%arg6, %2) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32 loc("<stdin>":9:12)
      "linalg.yield"(%3) : (f32) -> () loc("<stdin>":10:7)
    }) {linalg.memoized_indexing_maps = [affine_map<(d0) -> (d0)>, affine_map<(d0) -> (d0)>, affine_map<(d0) -> ()>]} : (memref<?xf32, strided<[1], offset: ?>>, memref<?xf32, strided<[1], offset: ?>>, memref<f32>) -> () loc("<stdin>":6:5)
    "func.return"() : () -> () loc("<stdin>":12:5)
  }) : () -> () loc("<stdin>":4:3)
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op loc("<stdin>":16:10)):
      %0 = "transform.structured.match"(%arg0) <{ops = ["linalg.dot"]}> : (!transform.any_op) -> !transform.any_op loc("<stdin>":17:12)
      %1:2 = "transform.structured.tile_using_for"(%0) <{scalable_sizes = array<i1: false>, static_sizes = array<i64: 8000>}> : (!transform.any_op) -> (!transform.any_op, !transform.any_op) loc("<stdin>":18:14)
      "transform.yield"() : () -> () loc("<stdin>":19:7)
    }) : () -> () loc("<stdin>":15:5)
  }) {transform.with_named_sequence} : () -> () loc("<stdin>":14:3)
}) : () -> () loc("<stdin>":3:1)
