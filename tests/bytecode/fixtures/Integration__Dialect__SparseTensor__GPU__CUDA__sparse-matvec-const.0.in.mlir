"builtin.module"() ({
  "func.func"() <{function_type = (tensor<1024x64xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>>, tensor<64xf64>, tensor<1024xf64>) -> tensor<1024xf64>, sym_name = "matvec"}> ({
  ^bb0(%arg3: tensor<1024x64xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>> loc("<stdin>":8:8), %arg4: tensor<64xf64> loc("<stdin>":8:45), %arg5: tensor<1024xf64> loc("<stdin>":8:68)):
    %13 = "linalg.matvec"(%arg3, %arg4, %arg5) <{operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg6: f64 loc("<stdin>":10:10), %arg7: f64 loc("<stdin>":10:22), %arg8: f64 loc("<stdin>":10:34)):
      %14 = "arith.mulf"(%arg6, %arg7) <{fastmath = #arith.fastmath<none>}> : (f64, f64) -> f64 loc("<stdin>":11:13)
      %15 = "arith.addf"(%arg8, %14) <{fastmath = #arith.fastmath<none>}> : (f64, f64) -> f64 loc("<stdin>":12:13)
      "linalg.yield"(%15) : (f64) -> () loc("<stdin>":13:7)
    }) {linalg.memoized_indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d1)>, affine_map<(d0, d1) -> (d0)>]} : (tensor<1024x64xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>>, tensor<64xf64>, tensor<1024xf64>) -> tensor<1024xf64> loc("<stdin>":9:11)
    "func.return"(%13) : (tensor<1024xf64>) -> () loc("<stdin>":15:5)
  }) : () -> () loc("<stdin>":7:3)
  "memref.global"() <{alignment = 64 : i64, constant, initial_value = dense<1.000000e+00> : tensor<64xf64>, sym_name = "__constant_64xf64", sym_visibility = "private", type = memref<64xf64>}> : () -> () loc("<stdin>":17:3)
  "func.func"() <{function_type = () -> (), sym_name = "main"}> ({
    %0 = "arith.constant"() <{value = 0.000000e+00 : f64}> : () -> f64 loc("<stdin>":19:10)
    %1 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":20:10)
    %2 = "arith.constant"() <{value = 1 : index}> : () -> index loc("<stdin>":21:10)
    %3 = "tensor.generate"() ({
    ^bb0(%arg1: index loc("<stdin>":23:10), %arg2: index loc("<stdin>":23:24)):
      %10 = "arith.addi"(%arg1, %arg2) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index loc("<stdin>":24:13)
      %11 = "arith.index_cast"(%10) : (index) -> i64 loc("<stdin>":25:13)
      %12 = "arith.uitofp"(%11) : (i64) -> f64 loc("<stdin>":26:13)
      "tensor.yield"(%12) : (f64) -> () loc("<stdin>":27:7)
    }) : () -> tensor<1024x64xf64> loc("<stdin>":22:10)
    %4 = "sparse_tensor.convert"(%3) : (tensor<1024x64xf64>) -> tensor<1024x64xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>> loc("<stdin>":29:10)
    %5 = "tensor.generate"() ({
    ^bb0(%arg0: index loc("<stdin>":31:10)):
      "tensor.yield"(%0) : (f64) -> () loc("<stdin>":32:7)
    }) : () -> tensor<1024xf64> loc("<stdin>":30:10)
    %6 = "memref.get_global"() <{name = @__constant_64xf64}> : () -> memref<64xf64> loc("<stdin>":34:10)
    %7 = "bufferization.to_tensor"(%6) <{restrict}> : (memref<64xf64>) -> tensor<64xf64> loc("<stdin>":35:10)
    %8 = "func.call"(%4, %7, %5) <{callee = @matvec}> : (tensor<1024x64xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>>, tensor<64xf64>, tensor<1024xf64>) -> tensor<1024xf64> loc("<stdin>":36:10)
    %9 = "vector.transfer_read"(%8, %1, %0) <{in_bounds = [false], operandSegmentSizes = array<i32: 1, 1, 1, 0>, permutation_map = affine_map<(d0) -> (d0)>}> : (tensor<1024xf64>, index, f64) -> vector<64xf64> loc("<stdin>":37:10)
    "vector.print"(%9) <{punctuation = #vector.punctuation<newline>}> : (vector<64xf64>) -> () loc("<stdin>":38:5)
    "bufferization.dealloc_tensor"(%4) : (tensor<1024x64xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>>) -> () loc("<stdin>":39:5)
    "func.return"() : () -> () loc("<stdin>":40:5)
  }) : () -> () loc("<stdin>":18:3)
}) : () -> () loc("<stdin>":6:1)
