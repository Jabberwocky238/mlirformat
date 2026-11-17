"builtin.module"() ({
  "func.func"() <{function_type = (tensor<512x512xf32>, tensor<512x512xf32>, tensor<512x512xf32>, tensor<512x512xf32>) -> tensor<512x512xf32>, sym_name = "fc_relu"}> ({
  ^bb0(%arg3: tensor<512x512xf32> loc("<stdin>":7:8), %arg4: tensor<512x512xf32> loc("<stdin>":7:36), %arg5: tensor<512x512xf32> loc("<stdin>":7:64), %arg6: tensor<512x512xf32> loc("<stdin>":7:92)):
    %9 = "linalg.matmul"(%arg3, %arg4, %arg6) <{indexing_maps = [affine_map<(d0, d1, d2) -> (d0, d2)>, affine_map<(d0, d1, d2) -> (d2, d1)>, affine_map<(d0, d1, d2) -> (d0, d1)>], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg13: f32 loc("<stdin>":9:10), %arg14: f32 loc("<stdin>":9:23), %arg15: f32 loc("<stdin>":9:36)):
      %15 = "arith.mulf"(%arg13, %arg14) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32 loc("<stdin>":10:13)
      %16 = "arith.addf"(%arg15, %15) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32 loc("<stdin>":11:13)
      "linalg.yield"(%16) : (f32) -> () loc("<stdin>":12:7)
    }) : (tensor<512x512xf32>, tensor<512x512xf32>, tensor<512x512xf32>) -> tensor<512x512xf32> loc("<stdin>":8:10)
    %10 = "linalg.elementwise"(%9, %arg5, %arg6) <{indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0, d1)>], kind = #linalg.elementwise_kind<add>, operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg10: f32 loc("<stdin>":15:10), %arg11: f32 loc("<stdin>":15:23), %arg12: f32 loc("<stdin>":15:36)):
      %14 = "arith.addf"(%arg10, %arg11) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32 loc("<stdin>":16:13)
      "linalg.yield"(%14) : (f32) -> () loc("<stdin>":17:7)
    }) : (tensor<512x512xf32>, tensor<512x512xf32>, tensor<512x512xf32>) -> tensor<512x512xf32> loc("<stdin>":14:11)
    %11 = "arith.constant"() <{value = dense<0.000000e+00> : tensor<512x512xf32>}> : () -> tensor<512x512xf32> loc("<stdin>":19:11)
    %12 = "linalg.elementwise"(%10, %11, %arg6) <{indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0, d1)>], kind = #linalg.elementwise_kind<max_signed>, operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg7: f32 loc("<stdin>":21:10), %arg8: f32 loc("<stdin>":21:22), %arg9: f32 loc("<stdin>":21:34)):
      %13 = "arith.maximumf"(%arg7, %arg8) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32 loc("<stdin>":22:13)
      "linalg.yield"(%13) : (f32) -> () loc("<stdin>":23:7)
    }) : (tensor<512x512xf32>, tensor<512x512xf32>, tensor<512x512xf32>) -> tensor<512x512xf32> loc("<stdin>":20:11)
    "func.return"(%12) : (tensor<512x512xf32>) -> () loc("<stdin>":25:5)
  }) : () -> () loc("<stdin>":6:3)
  "func.func"() <{function_type = (tensor<4x512xf32>, tensor<512x4xf32>, tensor<4x4xf32>, tensor<4x4xf32>, tensor<4x4xf32>) -> tensor<4x4xf32>, sym_name = "microkernel", sym_visibility = "private"}> ({
  }) : () -> () loc("<stdin>":27:3)
  "builtin.module"() ({
    "transform.named_sequence"() <{function_type = (!transform.any_op, !transform.op<"linalg.matmul">, !transform.op<"linalg.elementwise">) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op loc("<stdin>":31:10), %arg1: !transform.op<"linalg.matmul"> loc("<stdin>":31:36), %arg2: !transform.op<"linalg.elementwise"> loc("<stdin>":31:75)):
      %0:2 = "transform.split_handle"(%arg2) <{fail_on_payload_too_small = true, pass_through_empty_handle = true}> : (!transform.op<"linalg.elementwise">) -> (!transform.any_op, !transform.any_op) loc("<stdin>":32:14)
      %1:2 = "transform.structured.tile_using_forall"(%0#1) <{operandSegmentSizes = array<i32: 1, 0, 0, 0, 0>, static_tile_sizes = array<i64: 8, 32>}> : (!transform.any_op) -> (!transform.any_op, !transform.any_op) loc("<stdin>":33:14)
      %2:2 = "transform.structured.fuse_into_containing_op"(%0#0, %1#1) : (!transform.any_op, !transform.any_op) -> (!transform.any_op, !transform.any_op) loc("<stdin>":34:14)
      %3:2 = "transform.structured.fuse_into_containing_op"(%arg1, %2#1) : (!transform.op<"linalg.matmul">, !transform.any_op) -> (!transform.any_op, !transform.any_op) loc("<stdin>":35:14)
      %4:2 = "transform.structured.tile_using_forall"(%2#0) <{operandSegmentSizes = array<i32: 1, 0, 0, 0, 0>, static_tile_sizes = array<i64: 4, 4>}> : (!transform.any_op) -> (!transform.any_op, !transform.any_op) loc("<stdin>":36:14)
      %5:2 = "transform.structured.fuse_into_containing_op"(%3#0, %4#1) : (!transform.any_op, !transform.any_op) -> (!transform.any_op, !transform.any_op) loc("<stdin>":37:14)
      %6:2 = "transform.structured.tile_using_forall"(%4#0) <{operandSegmentSizes = array<i32: 1, 0, 0, 0, 0>, static_tile_sizes = array<i64: 1>}> : (!transform.any_op) -> (!transform.any_op, !transform.any_op) loc("<stdin>":38:14)
      %7:2 = "transform.structured.fuse_into_containing_op"(%5#0, %6#1) : (!transform.any_op, !transform.any_op) -> (!transform.any_op, !transform.any_op) loc("<stdin>":39:14)
      %8:2 = "transform.loop.outline"(%7#1) <{func_name = "outlined"}> : (!transform.any_op) -> (!transform.any_op, !transform.op<"func.call">) loc("<stdin>":40:14)
      "transform.yield"() : () -> () loc("<stdin>":41:7)
    }) : () -> () loc("<stdin>":30:5)
  }) {transform.with_named_sequence} : () -> () loc("<stdin>":29:3)
}) : () -> () loc("<stdin>":5:1)
