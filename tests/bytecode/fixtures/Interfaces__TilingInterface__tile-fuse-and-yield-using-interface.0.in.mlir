"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x?xf32>, tensor<?x?xf32>, tensor<?x?xf32>, tensor<?x?xf32>, tensor<?x?xf32>) -> (tensor<?x?xf32>, tensor<?x?xf32>), sym_name = "gemm_gemm_fusion_yield_both"}> ({
  ^bb0(%arg1: tensor<?x?xf32> loc("<stdin>":6:8), %arg2: tensor<?x?xf32> loc("<stdin>":6:32), %arg3: tensor<?x?xf32> loc("<stdin>":6:56), %arg4: tensor<?x?xf32> loc("<stdin>":6:80), %arg5: tensor<?x?xf32> loc("<stdin>":6:104)):
    %3 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":7:10)
    %4 = "arith.constant"() <{value = 1 : index}> : () -> index loc("<stdin>":8:10)
    %5 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32 loc("<stdin>":9:10)
    %6 = "tensor.dim"(%arg1, %3) : (tensor<?x?xf32>, index) -> index loc("<stdin>":10:10)
    %7 = "tensor.dim"(%arg2, %4) : (tensor<?x?xf32>, index) -> index loc("<stdin>":11:10)
    %8 = "linalg.fill"(%5, %arg4) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg14: f32 loc("<stdin>":13:10), %arg15: f32 loc("<stdin>":13:23)):
      "linalg.yield"(%arg14) : (f32) -> () loc("<stdin>":14:7)
    }) : (f32, tensor<?x?xf32>) -> tensor<?x?xf32> loc("<stdin>":12:10)
    %9 = "linalg.matmul"(%arg1, %arg2, %8) <{indexing_maps = [affine_map<(d0, d1, d2) -> (d0, d2)>, affine_map<(d0, d1, d2) -> (d2, d1)>, affine_map<(d0, d1, d2) -> (d0, d1)>], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg11: f32 loc("<stdin>":17:10), %arg12: f32 loc("<stdin>":17:23), %arg13: f32 loc("<stdin>":17:36)):
      %15 = "arith.mulf"(%arg11, %arg12) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32 loc("<stdin>":18:13)
      %16 = "arith.addf"(%arg13, %15) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32 loc("<stdin>":19:13)
      "linalg.yield"(%16) : (f32) -> () loc("<stdin>":20:7)
    }) : (tensor<?x?xf32>, tensor<?x?xf32>, tensor<?x?xf32>) -> tensor<?x?xf32> loc("<stdin>":16:10)
    %10 = "tensor.dim"(%arg3, %4) : (tensor<?x?xf32>, index) -> index loc("<stdin>":22:11)
    %11 = "linalg.fill"(%5, %arg5) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg9: f32 loc("<stdin>":24:10), %arg10: f32 loc("<stdin>":24:22)):
      "linalg.yield"(%arg9) : (f32) -> () loc("<stdin>":25:7)
    }) : (f32, tensor<?x?xf32>) -> tensor<?x?xf32> loc("<stdin>":23:11)
    %12 = "linalg.matmul"(%9, %arg3, %11) <{indexing_maps = [affine_map<(d0, d1, d2) -> (d0, d2)>, affine_map<(d0, d1, d2) -> (d2, d1)>, affine_map<(d0, d1, d2) -> (d0, d1)>], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg6: f32 loc("<stdin>":28:10), %arg7: f32 loc("<stdin>":28:22), %arg8: f32 loc("<stdin>":28:34)):
      %13 = "arith.mulf"(%arg6, %arg7) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32 loc("<stdin>":29:13)
      %14 = "arith.addf"(%arg8, %13) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32 loc("<stdin>":30:13)
      "linalg.yield"(%14) : (f32) -> () loc("<stdin>":31:7)
    }) : (tensor<?x?xf32>, tensor<?x?xf32>, tensor<?x?xf32>) -> tensor<?x?xf32> loc("<stdin>":27:11)
    "func.return"(%9, %12) : (tensor<?x?xf32>, tensor<?x?xf32>) -> () loc("<stdin>":33:5)
  }) : () -> () loc("<stdin>":5:3)
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op loc("<stdin>":37:10)):
      %0 = "transform.structured.match"(%arg0) <{ops = ["linalg.matmul"]}> : (!transform.any_op) -> !transform.any_op loc("<stdin>":38:12)
      %1:2 = "transform.split_handle"(%0) <{fail_on_payload_too_small = true, pass_through_empty_handle = true}> : (!transform.any_op) -> (!transform.any_op, !transform.any_op) loc("<stdin>":39:14)
      %2:2 = "transform.test.fuse_and_yield"(%1#1) <{tile_interchange = [], tile_sizes = [10], use_forall = false}> : (!transform.any_op) -> (!transform.any_op, !transform.any_op) loc("<stdin>":40:14)
      "transform.yield"() : () -> () loc("<stdin>":41:7)
    }) : () -> () loc("<stdin>":36:5)
  }) {transform.with_named_sequence} : () -> () loc("<stdin>":35:3)
}) : () -> () loc("<stdin>":4:1)
