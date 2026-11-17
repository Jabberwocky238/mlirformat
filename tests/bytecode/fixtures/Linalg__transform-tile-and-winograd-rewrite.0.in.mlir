"builtin.module"() ({
  "func.func"() <{function_type = (tensor<2x10x10x5xf32>, tensor<2x3x3x5xf32>, tensor<2x8x8x2xf32>) -> tensor<2x8x8x2xf32>, sym_name = "conv2d"}> ({
  ^bb0(%arg1: tensor<2x10x10x5xf32> loc("<stdin>":6:8), %arg2: tensor<2x3x3x5xf32> loc("<stdin>":6:38), %arg3: tensor<2x8x8x2xf32> loc("<stdin>":6:66)):
    %10 = "tensor.empty"() : () -> tensor<6x6x5x2xf32> loc("<stdin>":7:11)
    %11 = "linalg.winograd_filter_transform"(%arg2, %10) <{fmr = 1 : i32}> : (tensor<2x3x3x5xf32>, tensor<6x6x5x2xf32>) -> tensor<6x6x5x2xf32> loc("<stdin>":8:11)
    %12 = "tensor.empty"() : () -> tensor<6x6x2x2x2x5xf32> loc("<stdin>":9:11)
    %13 = "linalg.winograd_input_transform"(%arg1, %12) <{fmr = 1 : i32}> : (tensor<2x10x10x5xf32>, tensor<6x6x2x2x2x5xf32>) -> tensor<6x6x2x2x2x5xf32> loc("<stdin>":10:11)
    %14 = "tensor.collapse_shape"(%11) <{reassociation = [[0, 1], [2], [3]]}> : (tensor<6x6x5x2xf32>) -> tensor<36x5x2xf32> loc("<stdin>":11:11)
    %15 = "tensor.collapse_shape"(%13) <{reassociation = [[0, 1], [2, 3, 4], [5]]}> : (tensor<6x6x2x2x2x5xf32>) -> tensor<36x8x5xf32> loc("<stdin>":12:11)
    %16 = "tensor.empty"() : () -> tensor<36x8x2xf32> loc("<stdin>":13:11)
    %17 = "linalg.batch_matmul"(%15, %14, %16) <{indexing_maps = [affine_map<(d0, d1, d2, d3) -> (d0, d1, d3)>, affine_map<(d0, d1, d2, d3) -> (d0, d3, d2)>, affine_map<(d0, d1, d2, d3) -> (d0, d1, d2)>], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg4: f32 loc("<stdin>":15:10), %arg5: f32 loc("<stdin>":15:22), %arg6: f32 loc("<stdin>":15:34)):
      %20 = "arith.mulf"(%arg4, %arg5) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32 loc("<stdin>":16:13)
      %21 = "arith.addf"(%arg6, %20) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32 loc("<stdin>":17:13)
      "linalg.yield"(%21) : (f32) -> () loc("<stdin>":18:7)
    }) : (tensor<36x8x5xf32>, tensor<36x5x2xf32>, tensor<36x8x2xf32>) -> tensor<36x8x2xf32> loc("<stdin>":14:11)
    %18 = "tensor.expand_shape"(%17) <{reassociation = [[0, 1], [2, 3, 4], [5]], static_output_shape = array<i64: 6, 6, 2, 2, 2, 2>}> : (tensor<36x8x2xf32>) -> tensor<6x6x2x2x2x2xf32> loc("<stdin>":20:11)
    %19 = "linalg.winograd_output_transform"(%18, %arg3) <{fmr = 1 : i32}> : (tensor<6x6x2x2x2x2xf32>, tensor<2x8x8x2xf32>) -> tensor<2x8x8x2xf32> loc("<stdin>":21:11)
    "func.return"(%19) : (tensor<2x8x8x2xf32>) -> () loc("<stdin>":22:5)
  }) : () -> () loc("<stdin>":5:3)
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op loc("<stdin>":26:10)):
      %0 = "transform.structured.match"(%arg0) <{ops = ["linalg.winograd_filter_transform"]}> : (!transform.any_op) -> !transform.any_op loc("<stdin>":27:12)
      %1 = "transform.structured.match"(%arg0) <{ops = ["linalg.winograd_input_transform"]}> : (!transform.any_op) -> !transform.any_op loc("<stdin>":28:12)
      %2:3 = "transform.structured.tile_using_for"(%1) <{scalable_sizes = array<i1: false, false, false, false, false, false>, static_sizes = array<i64: 0, 0, 1, 1, 0, 0>}> : (!transform.any_op) -> (!transform.any_op, !transform.any_op, !transform.any_op) loc("<stdin>":29:14)
      %3 = "transform.structured.match"(%arg0) <{ops = ["linalg.winograd_output_transform"]}> : (!transform.any_op) -> !transform.any_op loc("<stdin>":30:12)
      %4:3 = "transform.structured.tile_using_for"(%3) <{scalable_sizes = array<i1: false, false, false, false, false, false>, static_sizes = array<i64: 0, 0, 1, 1, 0, 0>}> : (!transform.any_op) -> (!transform.any_op, !transform.any_op, !transform.any_op) loc("<stdin>":31:14)
      %5 = "transform.structured.decompose_winograd_op"(%0) : (!transform.any_op) -> !transform.any_op loc("<stdin>":32:12)
      %6 = "transform.structured.match"(%2#0) <{ops = ["linalg.winograd_input_transform"]}> : (!transform.any_op) -> !transform.any_op loc("<stdin>":33:12)
      %7 = "transform.structured.decompose_winograd_op"(%6) : (!transform.any_op) -> !transform.any_op loc("<stdin>":34:12)
      %8 = "transform.structured.match"(%4#0) <{ops = ["linalg.winograd_output_transform"]}> : (!transform.any_op) -> !transform.any_op loc("<stdin>":35:12)
      %9 = "transform.structured.decompose_winograd_op"(%8) : (!transform.any_op) -> !transform.any_op loc("<stdin>":36:12)
      "transform.yield"() : () -> () loc("<stdin>":37:7)
    }) : () -> () loc("<stdin>":25:5)
  }) {transform.with_named_sequence} : () -> () loc("<stdin>":24:3)
}) : () -> () loc("<stdin>":4:1)
