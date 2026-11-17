"builtin.module"() ({
  "func.func"() <{function_type = (tensor<64x64xf32, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>>, tensor<64x64xf32>) -> tensor<64x64xf32>, sym_name = "main"}> ({
  ^bb0(%arg0: tensor<64x64xf32, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>> loc("<stdin>":7:8), %arg1: tensor<64x64xf32> loc("<stdin>":7:43)):
    %0 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32 loc("<stdin>":8:10)
    %1 = "tensor.empty"() : () -> tensor<64x64xf32> loc("<stdin>":9:10)
    %2 = "linalg.fill"(%0, %1) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg5: f32 loc("<stdin>":11:10), %arg6: f32 loc("<stdin>":11:22)):
      "linalg.yield"(%arg5) : (f32) -> () loc("<stdin>":12:7)
    }) : (f32, tensor<64x64xf32>) -> tensor<64x64xf32> loc("<stdin>":10:10)
    %3 = "linalg.matmul"(%arg0, %arg1, %2) <{indexing_maps = [affine_map<(d0, d1, d2) -> (d0, d2)>, affine_map<(d0, d1, d2) -> (d2, d1)>, affine_map<(d0, d1, d2) -> (d0, d1)>], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg2: f32 loc("<stdin>":15:10), %arg3: f32 loc("<stdin>":15:22), %arg4: f32 loc("<stdin>":15:34)):
      %4 = "arith.mulf"(%arg2, %arg3) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32 loc("<stdin>":16:12)
      %5 = "arith.addf"(%arg4, %4) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32 loc("<stdin>":17:12)
      "linalg.yield"(%5) : (f32) -> () loc("<stdin>":18:7)
    }) : (tensor<64x64xf32, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>>, tensor<64x64xf32>, tensor<64x64xf32>) -> tensor<64x64xf32> loc("<stdin>":14:10)
    "func.return"(%3) : (tensor<64x64xf32>) -> () loc("<stdin>":20:5)
  }) {llvm.emit_c_interface} : () -> () loc("<stdin>":6:3)
}) : () -> () loc("<stdin>":5:1)
