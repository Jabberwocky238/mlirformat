"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x?xf16>, tensor<?x?xf16>, tensor<?x?xf16>) -> tensor<?x?xf16>, sym_name = "matmul"}> ({
  ^bb0(%arg0: tensor<?x?xf16> loc("<stdin>":7:8), %arg1: tensor<?x?xf16> loc("<stdin>":7:32), %arg2: tensor<?x?xf16> loc("<stdin>":7:56)):
    %0 = "sparse_tensor.convert"(%arg0) : (tensor<?x?xf16>) -> tensor<?x?xf16, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 floordiv 4 : dense, d1 mod 4 : structured[2, 4]) }>> loc("<stdin>":8:10)
    %1 = "linalg.matmul"(%0, %arg1, %arg2) <{indexing_maps = [affine_map<(d0, d1, d2) -> (d0, d2)>, affine_map<(d0, d1, d2) -> (d2, d1)>, affine_map<(d0, d1, d2) -> (d0, d1)>], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg3: f16 loc("<stdin>":10:10), %arg4: f16 loc("<stdin>":10:22), %arg5: f16 loc("<stdin>":10:34)):
      %2 = "arith.mulf"(%arg3, %arg4) <{fastmath = #arith.fastmath<none>}> : (f16, f16) -> f16 loc("<stdin>":11:12)
      %3 = "arith.addf"(%arg5, %2) <{fastmath = #arith.fastmath<none>}> : (f16, f16) -> f16 loc("<stdin>":12:12)
      "linalg.yield"(%3) : (f16) -> () loc("<stdin>":13:7)
    }) : (tensor<?x?xf16, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 floordiv 4 : dense, d1 mod 4 : structured[2, 4]) }>>, tensor<?x?xf16>, tensor<?x?xf16>) -> tensor<?x?xf16> loc("<stdin>":9:10)
    "func.return"(%1) : (tensor<?x?xf16>) -> () loc("<stdin>":15:5)
  }) : () -> () loc("<stdin>":6:3)
}) : () -> () loc("<stdin>":5:1)
