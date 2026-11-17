"builtin.module"() ({
  "func.func"() <{function_type = (index, index, index, f32) -> tensor<?x?x?xf32>, sym_name = "alloc_3d_filled_f32"}> ({
  ^bb0(%arg16: index loc("<stdin>":9:8), %arg17: index loc("<stdin>":9:23), %arg18: index loc("<stdin>":9:38), %arg19: f32 loc("<stdin>":9:53)):
    %35 = "tensor.empty"(%arg16, %arg17, %arg18) : (index, index, index) -> tensor<?x?x?xf32> loc("<stdin>":10:11)
    %36 = "linalg.fill"(%arg19, %35) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg20: f32 loc("<stdin>":12:10), %arg21: f32 loc("<stdin>":12:23)):
      "linalg.yield"(%arg20) : (f32) -> () loc("<stdin>":13:7)
    }) : (f32, tensor<?x?x?xf32>) -> tensor<?x?x?xf32> loc("<stdin>":11:11)
    "func.return"(%36) : (tensor<?x?x?xf32>) -> () loc("<stdin>":15:5)
  }) : () -> () loc("<stdin>":8:3)
  "func.func"() <{function_type = (tensor<?x?x?xf32>, tensor<?x?x?xf32>, tensor<?x?x?xf32>) -> tensor<?x?x?xf32>, sym_name = "conv_1d_nwc_wcf"}> ({
  ^bb0(%arg10: tensor<?x?x?xf32> loc("<stdin>":18:8), %arg11: tensor<?x?x?xf32> loc("<stdin>":18:35), %arg12: tensor<?x?x?xf32> loc("<stdin>":18:62)):
    %32 = "linalg.conv_1d_nwc_wcf"(%arg10, %arg11, %arg12) <{dilations = dense<1> : tensor<1xi64>, operandSegmentSizes = array<i32: 2, 1>, strides = dense<1> : tensor<1xi64>}> ({
    ^bb0(%arg13: f32 loc("<stdin>":20:10), %arg14: f32 loc("<stdin>":20:23), %arg15: f32 loc("<stdin>":20:36)):
      %33 = "arith.mulf"(%arg13, %arg14) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32 loc("<stdin>":21:13)
      %34 = "arith.addf"(%arg15, %33) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32 loc("<stdin>":22:13)
      "linalg.yield"(%34) : (f32) -> () loc("<stdin>":23:7)
    }) {linalg.memoized_indexing_maps = [affine_map<(d0, d1, d2, d3, d4) -> (d0, d1 + d3, d4)>, affine_map<(d0, d1, d2, d3, d4) -> (d3, d4, d2)>, affine_map<(d0, d1, d2, d3, d4) -> (d0, d1, d2)>]} : (tensor<?x?x?xf32>, tensor<?x?x?xf32>, tensor<?x?x?xf32>) -> tensor<?x?x?xf32> loc("<stdin>":19:11)
    "func.return"(%32) : (tensor<?x?x?xf32>) -> () loc("<stdin>":25:5)
  }) : () -> () loc("<stdin>":17:3)
  "func.func"() <{function_type = (tensor<?x?x?xf32, #sparse_tensor.encoding<{ map = (d0, d1, d2) -> (d0 : compressed, d1 : compressed, d2 : compressed) }>>, tensor<?x?x?xf32>) -> tensor<?x?x?xf32, #sparse_tensor.encoding<{ map = (d0, d1, d2) -> (d0 : compressed, d1 : compressed, d2 : compressed) }>>, sym_name = "conv_1d_nwc_wcf_CCC"}> ({
  ^bb0(%arg5: tensor<?x?x?xf32, #sparse_tensor.encoding<{ map = (d0, d1, d2) -> (d0 : compressed, d1 : compressed, d2 : compressed) }>> loc("<stdin>":28:8), %arg6: tensor<?x?x?xf32> loc("<stdin>":28:43)):
    %25 = "arith.constant"() <{value = 1 : index}> : () -> index loc("<stdin>":29:11)
    %26 = "arith.constant"() <{value = 3 : index}> : () -> index loc("<stdin>":30:11)
    %27 = "arith.constant"() <{value = 6 : index}> : () -> index loc("<stdin>":31:11)
    %28 = "tensor.empty"(%26, %27, %25) : (index, index, index) -> tensor<?x?x?xf32, #sparse_tensor.encoding<{ map = (d0, d1, d2) -> (d0 : compressed, d1 : compressed, d2 : compressed) }>> loc("<stdin>":32:11)
    %29 = "linalg.conv_1d_nwc_wcf"(%arg5, %arg6, %28) <{dilations = dense<1> : tensor<1xi64>, operandSegmentSizes = array<i32: 2, 1>, strides = dense<1> : tensor<1xi64>}> ({
    ^bb0(%arg7: f32 loc("<stdin>":34:10), %arg8: f32 loc("<stdin>":34:22), %arg9: f32 loc("<stdin>":34:34)):
      %30 = "arith.mulf"(%arg7, %arg8) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32 loc("<stdin>":35:13)
      %31 = "arith.addf"(%arg9, %30) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32 loc("<stdin>":36:13)
      "linalg.yield"(%31) : (f32) -> () loc("<stdin>":37:7)
    }) {linalg.memoized_indexing_maps = [affine_map<(d0, d1, d2, d3, d4) -> (d0, d1 + d3, d4)>, affine_map<(d0, d1, d2, d3, d4) -> (d3, d4, d2)>, affine_map<(d0, d1, d2, d3, d4) -> (d0, d1, d2)>]} : (tensor<?x?x?xf32, #sparse_tensor.encoding<{ map = (d0, d1, d2) -> (d0 : compressed, d1 : compressed, d2 : compressed) }>>, tensor<?x?x?xf32>, tensor<?x?x?xf32, #sparse_tensor.encoding<{ map = (d0, d1, d2) -> (d0 : compressed, d1 : compressed, d2 : compressed) }>>) -> tensor<?x?x?xf32, #sparse_tensor.encoding<{ map = (d0, d1, d2) -> (d0 : compressed, d1 : compressed, d2 : compressed) }>> loc("<stdin>":33:11)
    "func.return"(%29) : (tensor<?x?x?xf32, #sparse_tensor.encoding<{ map = (d0, d1, d2) -> (d0 : compressed, d1 : compressed, d2 : compressed) }>>) -> () loc("<stdin>":39:5)
  }) : () -> () loc("<stdin>":27:3)
  "func.func"() <{function_type = (tensor<?x?x?xf32, #sparse_tensor.encoding<{ map = (d0, d1, d2) -> (d0 : compressed, d1 : dense, d2 : compressed) }>>, tensor<?x?x?xf32>) -> tensor<?x?x?xf32, #sparse_tensor.encoding<{ map = (d0, d1, d2) -> (d0 : compressed, d1 : dense, d2 : compressed) }>>, sym_name = "conv_1d_nwc_wcf_CDC"}> ({
  ^bb0(%arg0: tensor<?x?x?xf32, #sparse_tensor.encoding<{ map = (d0, d1, d2) -> (d0 : compressed, d1 : dense, d2 : compressed) }>> loc("<stdin>":42:8), %arg1: tensor<?x?x?xf32> loc("<stdin>":42:44)):
    %18 = "arith.constant"() <{value = 1 : index}> : () -> index loc("<stdin>":43:11)
    %19 = "arith.constant"() <{value = 3 : index}> : () -> index loc("<stdin>":44:11)
    %20 = "arith.constant"() <{value = 6 : index}> : () -> index loc("<stdin>":45:11)
    %21 = "tensor.empty"(%19, %20, %18) : (index, index, index) -> tensor<?x?x?xf32, #sparse_tensor.encoding<{ map = (d0, d1, d2) -> (d0 : compressed, d1 : dense, d2 : compressed) }>> loc("<stdin>":46:11)
    %22 = "linalg.conv_1d_nwc_wcf"(%arg0, %arg1, %21) <{dilations = dense<1> : tensor<1xi64>, operandSegmentSizes = array<i32: 2, 1>, strides = dense<1> : tensor<1xi64>}> ({
    ^bb0(%arg2: f32 loc("<stdin>":48:10), %arg3: f32 loc("<stdin>":48:22), %arg4: f32 loc("<stdin>":48:34)):
      %23 = "arith.mulf"(%arg2, %arg3) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32 loc("<stdin>":49:13)
      %24 = "arith.addf"(%arg4, %23) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32 loc("<stdin>":50:13)
      "linalg.yield"(%24) : (f32) -> () loc("<stdin>":51:7)
    }) {linalg.memoized_indexing_maps = [affine_map<(d0, d1, d2, d3, d4) -> (d0, d1 + d3, d4)>, affine_map<(d0, d1, d2, d3, d4) -> (d3, d4, d2)>, affine_map<(d0, d1, d2, d3, d4) -> (d0, d1, d2)>]} : (tensor<?x?x?xf32, #sparse_tensor.encoding<{ map = (d0, d1, d2) -> (d0 : compressed, d1 : dense, d2 : compressed) }>>, tensor<?x?x?xf32>, tensor<?x?x?xf32, #sparse_tensor.encoding<{ map = (d0, d1, d2) -> (d0 : compressed, d1 : dense, d2 : compressed) }>>) -> tensor<?x?x?xf32, #sparse_tensor.encoding<{ map = (d0, d1, d2) -> (d0 : compressed, d1 : dense, d2 : compressed) }>> loc("<stdin>":47:11)
    "func.return"(%22) : (tensor<?x?x?xf32, #sparse_tensor.encoding<{ map = (d0, d1, d2) -> (d0 : compressed, d1 : dense, d2 : compressed) }>>) -> () loc("<stdin>":53:5)
  }) : () -> () loc("<stdin>":41:3)
  "func.func"() <{function_type = () -> (), sym_name = "main"}> ({
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":56:10)
    %1 = "arith.constant"() <{value = 1 : index}> : () -> index loc("<stdin>":57:10)
    %2 = "arith.constant"() <{value = 3 : index}> : () -> index loc("<stdin>":58:10)
    %3 = "arith.constant"() <{value = 6 : index}> : () -> index loc("<stdin>":59:10)
    %4 = "arith.constant"() <{value = 8 : index}> : () -> index loc("<stdin>":60:10)
    %5 = "arith.constant"() <{value = 1.000000e+01 : f32}> : () -> f32 loc("<stdin>":61:10)
    %6 = "arith.constant"() <{value = 2.000000e+00 : f32}> : () -> f32 loc("<stdin>":62:10)
    %7 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32 loc("<stdin>":63:10)
    %8 = "func.call"(%2, %4, %1, %6) <{callee = @alloc_3d_filled_f32}> : (index, index, index, f32) -> tensor<?x?x?xf32> loc("<stdin>":64:10)
    %9 = "tensor.insert"(%5, %8, %0, %2, %0) : (f32, tensor<?x?x?xf32>, index, index, index) -> tensor<?x?x?xf32> loc("<stdin>":65:10)
    %10 = "func.call"(%2, %1, %1, %6) <{callee = @alloc_3d_filled_f32}> : (index, index, index, f32) -> tensor<?x?x?xf32> loc("<stdin>":66:11)
    %11 = "func.call"(%2, %3, %1, %7) <{callee = @alloc_3d_filled_f32}> : (index, index, index, f32) -> tensor<?x?x?xf32> loc("<stdin>":67:11)
    %12 = "sparse_tensor.convert"(%9) : (tensor<?x?x?xf32>) -> tensor<?x?x?xf32, #sparse_tensor.encoding<{ map = (d0, d1, d2) -> (d0 : compressed, d1 : compressed, d2 : compressed) }>> loc("<stdin>":68:11)
    %13 = "sparse_tensor.convert"(%9) : (tensor<?x?x?xf32>) -> tensor<?x?x?xf32, #sparse_tensor.encoding<{ map = (d0, d1, d2) -> (d0 : compressed, d1 : dense, d2 : compressed) }>> loc("<stdin>":69:11)
    %14 = "func.call"(%9, %10, %11) <{callee = @conv_1d_nwc_wcf}> : (tensor<?x?x?xf32>, tensor<?x?x?xf32>, tensor<?x?x?xf32>) -> tensor<?x?x?xf32> loc("<stdin>":70:11)
    %15 = "func.call"(%12, %10) <{callee = @conv_1d_nwc_wcf_CCC}> : (tensor<?x?x?xf32, #sparse_tensor.encoding<{ map = (d0, d1, d2) -> (d0 : compressed, d1 : compressed, d2 : compressed) }>>, tensor<?x?x?xf32>) -> tensor<?x?x?xf32, #sparse_tensor.encoding<{ map = (d0, d1, d2) -> (d0 : compressed, d1 : compressed, d2 : compressed) }>> loc("<stdin>":71:11)
    %16 = "func.call"(%13, %10) <{callee = @conv_1d_nwc_wcf_CDC}> : (tensor<?x?x?xf32, #sparse_tensor.encoding<{ map = (d0, d1, d2) -> (d0 : compressed, d1 : dense, d2 : compressed) }>>, tensor<?x?x?xf32>) -> tensor<?x?x?xf32, #sparse_tensor.encoding<{ map = (d0, d1, d2) -> (d0 : compressed, d1 : dense, d2 : compressed) }>> loc("<stdin>":72:11)
    %17 = "vector.transfer_read"(%14, %0, %0, %0, %7) <{in_bounds = [false, false, false], operandSegmentSizes = array<i32: 1, 3, 1, 0>, permutation_map = affine_map<(d0, d1, d2) -> (d0, d1, d2)>}> : (tensor<?x?x?xf32>, index, index, index, f32) -> vector<3x6x1xf32> loc("<stdin>":73:11)
    "vector.print"(%17) <{punctuation = #vector.punctuation<newline>}> : (vector<3x6x1xf32>) -> () loc("<stdin>":74:5)
    "sparse_tensor.print"(%15) : (tensor<?x?x?xf32, #sparse_tensor.encoding<{ map = (d0, d1, d2) -> (d0 : compressed, d1 : compressed, d2 : compressed) }>>) -> () loc("<stdin>":75:5)
    "sparse_tensor.print"(%16) : (tensor<?x?x?xf32, #sparse_tensor.encoding<{ map = (d0, d1, d2) -> (d0 : compressed, d1 : dense, d2 : compressed) }>>) -> () loc("<stdin>":76:5)
    "bufferization.dealloc_tensor"(%9) : (tensor<?x?x?xf32>) -> () loc("<stdin>":77:5)
    "bufferization.dealloc_tensor"(%10) : (tensor<?x?x?xf32>) -> () loc("<stdin>":78:5)
    "bufferization.dealloc_tensor"(%11) : (tensor<?x?x?xf32>) -> () loc("<stdin>":79:5)
    "bufferization.dealloc_tensor"(%13) : (tensor<?x?x?xf32, #sparse_tensor.encoding<{ map = (d0, d1, d2) -> (d0 : compressed, d1 : dense, d2 : compressed) }>>) -> () loc("<stdin>":80:5)
    "bufferization.dealloc_tensor"(%12) : (tensor<?x?x?xf32, #sparse_tensor.encoding<{ map = (d0, d1, d2) -> (d0 : compressed, d1 : compressed, d2 : compressed) }>>) -> () loc("<stdin>":81:5)
    "bufferization.dealloc_tensor"(%15) : (tensor<?x?x?xf32, #sparse_tensor.encoding<{ map = (d0, d1, d2) -> (d0 : compressed, d1 : compressed, d2 : compressed) }>>) -> () loc("<stdin>":82:5)
    "bufferization.dealloc_tensor"(%16) : (tensor<?x?x?xf32, #sparse_tensor.encoding<{ map = (d0, d1, d2) -> (d0 : compressed, d1 : dense, d2 : compressed) }>>) -> () loc("<stdin>":83:5)
    "func.return"() : () -> () loc("<stdin>":84:5)
  }) : () -> () loc("<stdin>":55:3)
}) : () -> () loc("<stdin>":7:1)
