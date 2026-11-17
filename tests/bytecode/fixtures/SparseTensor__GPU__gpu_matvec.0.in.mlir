"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x?xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>>, tensor<?xf64>, tensor<?xf64>) -> tensor<?xf64>, sym_name = "matvec"}> ({
  ^bb0(%arg0: tensor<?x?xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>> loc("<stdin>":7:8), %arg1: tensor<?xf64> loc("<stdin>":7:41), %arg2: tensor<?xf64> loc("<stdin>":7:63)):
    %0 = "linalg.matvec"(%arg0, %arg1, %arg2) <{operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg3: f64 loc("<stdin>":9:10), %arg4: f64 loc("<stdin>":9:22), %arg5: f64 loc("<stdin>":9:34)):
      %1 = "arith.mulf"(%arg3, %arg4) <{fastmath = #arith.fastmath<none>}> : (f64, f64) -> f64 loc("<stdin>":10:12)
      %2 = "arith.addf"(%arg5, %1) <{fastmath = #arith.fastmath<none>}> : (f64, f64) -> f64 loc("<stdin>":11:12)
      "linalg.yield"(%2) : (f64) -> () loc("<stdin>":12:7)
    }) {linalg.memoized_indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d1)>, affine_map<(d0, d1) -> (d0)>]} : (tensor<?x?xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>>, tensor<?xf64>, tensor<?xf64>) -> tensor<?xf64> loc("<stdin>":8:10)
    "func.return"(%0) : (tensor<?xf64>) -> () loc("<stdin>":14:5)
  }) : () -> () loc("<stdin>":6:3)
}) : () -> () loc("<stdin>":5:1)
