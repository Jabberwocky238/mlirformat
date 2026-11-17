"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x?xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>>, tensor<?xf64>, tensor<?xf64>) -> tensor<?xf64>, sym_name = "matvec"}> ({
  ^bb0(%arg4: tensor<?x?xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>> loc("<stdin>":8:8), %arg5: tensor<?xf64> loc("<stdin>":8:41), %arg6: tensor<?xf64> loc("<stdin>":8:63)):
    %17 = "linalg.matvec"(%arg4, %arg5, %arg6) <{operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg7: f64 loc("<stdin>":10:10), %arg8: f64 loc("<stdin>":10:22), %arg9: f64 loc("<stdin>":10:34)):
      %18 = "arith.mulf"(%arg7, %arg8) <{fastmath = #arith.fastmath<none>}> : (f64, f64) -> f64 loc("<stdin>":11:13)
      %19 = "arith.addf"(%arg9, %18) <{fastmath = #arith.fastmath<none>}> : (f64, f64) -> f64 loc("<stdin>":12:13)
      "linalg.yield"(%19) : (f64) -> () loc("<stdin>":13:7)
    }) {linalg.memoized_indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d1)>, affine_map<(d0, d1) -> (d0)>]} : (tensor<?x?xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>>, tensor<?xf64>, tensor<?xf64>) -> tensor<?xf64> loc("<stdin>":9:11)
    "func.return"(%17) : (tensor<?xf64>) -> () loc("<stdin>":15:5)
  }) : () -> () loc("<stdin>":7:3)
  "func.func"() <{function_type = () -> (), sym_name = "main"}> ({
    %0 = "arith.constant"() <{value = 0.000000e+00 : f64}> : () -> f64 loc("<stdin>":18:10)
    %1 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":19:10)
    %2 = "arith.constant"() <{value = 1 : index}> : () -> index loc("<stdin>":20:10)
    %3 = "tensor.generate"() ({
    ^bb0(%arg2: index loc("<stdin>":22:10), %arg3: index loc("<stdin>":22:24)):
      %14 = "arith.addi"(%arg2, %arg3) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index loc("<stdin>":23:13)
      %15 = "arith.index_cast"(%14) : (index) -> i64 loc("<stdin>":24:13)
      %16 = "arith.uitofp"(%15) : (i64) -> f64 loc("<stdin>":25:13)
      "tensor.yield"(%16) : (f64) -> () loc("<stdin>":26:7)
    }) : () -> tensor<1024x64xf64> loc("<stdin>":21:10)
    %4 = "sparse_tensor.convert"(%3) : (tensor<1024x64xf64>) -> tensor<?x?xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>> loc("<stdin>":28:10)
    %5 = "tensor.dim"(%4, %2) : (tensor<?x?xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>>, index) -> index loc("<stdin>":29:10)
    %6 = "tensor.generate"(%5) ({
    ^bb0(%arg1: index loc("<stdin>":31:10)):
      %11 = "arith.addi"(%arg1, %2) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index loc("<stdin>":32:13)
      %12 = "arith.index_cast"(%11) : (index) -> i64 loc("<stdin>":33:13)
      %13 = "arith.uitofp"(%12) : (i64) -> f64 loc("<stdin>":34:13)
      "tensor.yield"(%13) : (f64) -> () loc("<stdin>":35:7)
    }) : (index) -> tensor<?xf64> loc("<stdin>":30:10)
    %7 = "tensor.dim"(%4, %1) : (tensor<?x?xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>>, index) -> index loc("<stdin>":37:10)
    %8 = "tensor.generate"(%7) ({
    ^bb0(%arg0: index loc("<stdin>":39:10)):
      "tensor.yield"(%0) : (f64) -> () loc("<stdin>":40:7)
    }) : (index) -> tensor<?xf64> loc("<stdin>":38:10)
    %9 = "func.call"(%4, %6, %8) <{callee = @matvec}> : (tensor<?x?xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>>, tensor<?xf64>, tensor<?xf64>) -> tensor<?xf64> loc("<stdin>":42:10)
    %10 = "vector.transfer_read"(%9, %1, %0) <{in_bounds = [false], operandSegmentSizes = array<i32: 1, 1, 1, 0>, permutation_map = affine_map<(d0) -> (d0)>}> : (tensor<?xf64>, index, f64) -> vector<64xf64> loc("<stdin>":43:11)
    "vector.print"(%10) <{punctuation = #vector.punctuation<newline>}> : (vector<64xf64>) -> () loc("<stdin>":44:5)
    "bufferization.dealloc_tensor"(%4) : (tensor<?x?xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>>) -> () loc("<stdin>":45:5)
    "func.return"() : () -> () loc("<stdin>":46:5)
  }) : () -> () loc("<stdin>":17:3)
}) : () -> () loc("<stdin>":6:1)
