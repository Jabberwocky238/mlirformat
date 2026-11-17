"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x?xf32>, tensor<?x?xf32>) -> tensor<?x?xf32>, sym_name = "gemm_fill_fusion"}> ({
  ^bb0(%arg1: tensor<?x?xf32> loc("<stdin>":6:8), %arg2: tensor<?x?xf32> loc("<stdin>":6:32)):
    %2 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":7:10)
    %3 = "arith.constant"() <{value = 1 : index}> : () -> index loc("<stdin>":8:10)
    %4 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32 loc("<stdin>":9:10)
    %5 = "tensor.dim"(%arg1, %2) : (tensor<?x?xf32>, index) -> index loc("<stdin>":10:10)
    %6 = "tensor.dim"(%arg2, %3) : (tensor<?x?xf32>, index) -> index loc("<stdin>":11:10)
    %7 = "tensor.empty"(%5, %6) : (index, index) -> tensor<?x?xf32> loc("<stdin>":12:10)
    %8 = "linalg.fill"(%4, %7) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg6: f32 loc("<stdin>":14:10), %arg7: f32 loc("<stdin>":14:22)):
      "linalg.yield"(%arg6) : (f32) -> () loc("<stdin>":15:7)
    }) : (f32, tensor<?x?xf32>) -> tensor<?x?xf32> loc("<stdin>":13:10)
    %9 = "linalg.matmul"(%arg1, %arg2, %8) <{indexing_maps = [affine_map<(d0, d1, d2) -> (d0, d2)>, affine_map<(d0, d1, d2) -> (d2, d1)>, affine_map<(d0, d1, d2) -> (d0, d1)>], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg3: f32 loc("<stdin>":18:10), %arg4: f32 loc("<stdin>":18:22), %arg5: f32 loc("<stdin>":18:34)):
      %10 = "arith.mulf"(%arg3, %arg4) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32 loc("<stdin>":19:13)
      %11 = "arith.addf"(%arg5, %10) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32 loc("<stdin>":20:13)
      "linalg.yield"(%11) : (f32) -> () loc("<stdin>":21:7)
    }) : (tensor<?x?xf32>, tensor<?x?xf32>, tensor<?x?xf32>) -> tensor<?x?xf32> loc("<stdin>":17:10)
    "func.return"(%9) : (tensor<?x?xf32>) -> () loc("<stdin>":23:5)
  }) : () -> () loc("<stdin>":5:3)
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op loc("<stdin>":27:10)):
      %0 = "transform.structured.match"(%arg0) <{ops = ["linalg.matmul"]}> : (!transform.any_op) -> !transform.any_op loc("<stdin>":28:12)
      %1:3 = "transform.structured.fuse"(%0) <{operandSegmentSizes = array<i32: 1, 0, 0, 0>, static_tile_sizes = array<i64: 10, 20>}> : (!transform.any_op) -> (!transform.any_op, !transform.any_op, !transform.any_op) loc("<stdin>":29:14)
      "transform.yield"() : () -> () loc("<stdin>":30:7)
    }) : () -> () loc("<stdin>":26:5)
  }) {transform.with_named_sequence} : () -> () loc("<stdin>":25:3)
}) : () -> () loc("<stdin>":4:1)
