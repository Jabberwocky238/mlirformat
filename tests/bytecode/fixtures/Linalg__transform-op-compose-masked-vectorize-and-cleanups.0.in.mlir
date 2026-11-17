"builtin.module"() ({
  "func.func"() <{function_type = (memref<?x?xf32>, memref<?x?xf32>, memref<?x?xf32>) -> (), sym_name = "masked_matmul"}> ({
  ^bb0(%arg1: memref<?x?xf32> loc("<stdin>":6:8), %arg2: memref<?x?xf32> loc("<stdin>":6:32), %arg3: memref<?x?xf32> loc("<stdin>":6:56)):
    "linalg.matmul"(%arg1, %arg2, %arg3) <{indexing_maps = [affine_map<(d0, d1, d2) -> (d0, d2)>, affine_map<(d0, d1, d2) -> (d2, d1)>, affine_map<(d0, d1, d2) -> (d0, d1)>], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg4: f32 loc("<stdin>":8:10), %arg5: f32 loc("<stdin>":8:22), %arg6: f32 loc("<stdin>":8:34)):
      %4 = "arith.mulf"(%arg4, %arg5) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32 loc("<stdin>":9:12)
      %5 = "arith.addf"(%arg6, %4) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32 loc("<stdin>":10:12)
      "linalg.yield"(%5) : (f32) -> () loc("<stdin>":11:7)
    }) : (memref<?x?xf32>, memref<?x?xf32>, memref<?x?xf32>) -> () loc("<stdin>":7:5)
    "func.return"() : () -> () loc("<stdin>":13:5)
  }) : () -> () loc("<stdin>":5:3)
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op loc("<stdin>":17:10)):
      %0 = "transform.structured.match"(%arg0) <{ops = ["linalg.matmul"]}> : (!transform.any_op) -> !transform.any_op loc("<stdin>":18:12)
      %1:4 = "transform.structured.tile_using_for"(%0) <{scalable_sizes = array<i1: false, false, false>, static_sizes = array<i64: 64, 128, 256>}> : (!transform.any_op) -> (!transform.any_op, !transform.any_op, !transform.any_op, !transform.any_op) loc("<stdin>":19:14)
      %2:4 = "transform.structured.tile_using_for"(%1#0) <{scalable_sizes = array<i1: false, false, false>, static_sizes = array<i64: 8, 8, 8>}> : (!transform.any_op) -> (!transform.any_op, !transform.any_op, !transform.any_op, !transform.any_op) loc("<stdin>":20:14)
      "transform.structured.vectorize"(%2#0) <{scalable_sizes = array<i1: false, false, false>, static_vector_sizes = array<i64: 8, 8, 8>}> : (!transform.any_op) -> () loc("<stdin>":21:7)
      %3 = "transform.structured.match"(%arg0) <{ops = ["func.func"]}> : (!transform.any_op) -> !transform.any_op loc("<stdin>":22:12)
      "transform.apply_patterns"(%3) <{max_iterations = -1 : i64, max_num_rewrites = -1 : i64}> ({
        "transform.apply_patterns.vector.lower_masked_transfers"() : () -> () loc("<stdin>":24:9)
        "transform.apply_patterns.vector.transfer_permutation_patterns"() : () -> () loc("<stdin>":25:9)
        "transform.apply_patterns.vector.reduction_to_contract"() : () -> () loc("<stdin>":26:9)
      }) : (!transform.any_op) -> () loc("<stdin>":23:7)
      "transform.yield"() : () -> () loc("<stdin>":28:7)
    }) : () -> () loc("<stdin>":16:5)
  }) {transform.with_named_sequence} : () -> () loc("<stdin>":15:3)
}) : () -> () loc("<stdin>":4:1)
