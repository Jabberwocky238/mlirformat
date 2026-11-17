"builtin.module"() ({
  "func.func"() <{function_type = (index, index, index, index, index, f32) -> tensor<?x?x?x?x?xf32>, sym_name = "alloc_5d_filled_f32"}> ({
  ^bb0(%arg16: index loc("<stdin>":9:8), %arg17: index loc("<stdin>":9:23), %arg18: index loc("<stdin>":9:38), %arg19: index loc("<stdin>":9:53), %arg20: index loc("<stdin>":9:68), %arg21: f32 loc("<stdin>":9:83)):
    %33 = "tensor.empty"(%arg16, %arg17, %arg18, %arg19, %arg20) : (index, index, index, index, index) -> tensor<?x?x?x?x?xf32> loc("<stdin>":10:11)
    %34 = "linalg.fill"(%arg21, %33) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg22: f32 loc("<stdin>":12:10), %arg23: f32 loc("<stdin>":12:23)):
      "linalg.yield"(%arg22) : (f32) -> () loc("<stdin>":13:7)
    }) : (f32, tensor<?x?x?x?x?xf32>) -> tensor<?x?x?x?x?xf32> loc("<stdin>":11:11)
    "func.return"(%34) : (tensor<?x?x?x?x?xf32>) -> () loc("<stdin>":15:5)
  }) : () -> () loc("<stdin>":8:3)
  "func.func"() <{function_type = (tensor<?x?x?x?x?xf32>, tensor<?x?x?x?x?xf32>, tensor<?x?x?x?x?xf32>) -> tensor<?x?x?x?x?xf32>, sym_name = "conv_3d_ndhwc_dhwcf"}> ({
  ^bb0(%arg10: tensor<?x?x?x?x?xf32> loc("<stdin>":18:8), %arg11: tensor<?x?x?x?x?xf32> loc("<stdin>":18:39), %arg12: tensor<?x?x?x?x?xf32> loc("<stdin>":18:70)):
    %30 = "linalg.conv_3d_ndhwc_dhwcf"(%arg10, %arg11, %arg12) <{dilations = dense<1> : tensor<3xi64>, operandSegmentSizes = array<i32: 2, 1>, strides = dense<1> : tensor<3xi64>}> ({
    ^bb0(%arg13: f32 loc("<stdin>":20:10), %arg14: f32 loc("<stdin>":20:23), %arg15: f32 loc("<stdin>":20:36)):
      %31 = "arith.mulf"(%arg13, %arg14) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32 loc("<stdin>":21:13)
      %32 = "arith.addf"(%arg15, %31) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32 loc("<stdin>":22:13)
      "linalg.yield"(%32) : (f32) -> () loc("<stdin>":23:7)
    }) {linalg.memoized_indexing_maps = [affine_map<(d0, d1, d2, d3, d4, d5, d6, d7, d8) -> (d0, d1 + d5, d2 + d6, d3 + d7, d8)>, affine_map<(d0, d1, d2, d3, d4, d5, d6, d7, d8) -> (d5, d6, d7, d8, d4)>, affine_map<(d0, d1, d2, d3, d4, d5, d6, d7, d8) -> (d0, d1, d2, d3, d4)>]} : (tensor<?x?x?x?x?xf32>, tensor<?x?x?x?x?xf32>, tensor<?x?x?x?x?xf32>) -> tensor<?x?x?x?x?xf32> loc("<stdin>":19:11)
    "func.return"(%30) : (tensor<?x?x?x?x?xf32>) -> () loc("<stdin>":25:5)
  }) : () -> () loc("<stdin>":17:3)
  "func.func"() <{function_type = (tensor<?x?x?x?x?xf32, #sparse_tensor.encoding<{ map = (d0, d1, d2, d3, d4) -> (d0 : compressed, d1 : compressed, d2 : compressed, d3 : compressed, d4 : compressed) }>>, tensor<?x?x?x?x?xf32>) -> tensor<?x?x?x?x?xf32, #sparse_tensor.encoding<{ map = (d0, d1, d2, d3, d4) -> (d0 : compressed, d1 : compressed, d2 : compressed, d3 : compressed, d4 : compressed) }>>, sym_name = "conv_3d_ndhwc_dhwcf_CCCCC"}> ({
  ^bb0(%arg5: tensor<?x?x?x?x?xf32, #sparse_tensor.encoding<{ map = (d0, d1, d2, d3, d4) -> (d0 : compressed, d1 : compressed, d2 : compressed, d3 : compressed, d4 : compressed) }>> loc("<stdin>":28:8), %arg6: tensor<?x?x?x?x?xf32> loc("<stdin>":28:47)):
    %24 = "arith.constant"() <{value = 1 : index}> : () -> index loc("<stdin>":29:11)
    %25 = "arith.constant"() <{value = 6 : index}> : () -> index loc("<stdin>":30:11)
    %26 = "tensor.empty"(%24, %25, %25, %25, %24) : (index, index, index, index, index) -> tensor<?x?x?x?x?xf32, #sparse_tensor.encoding<{ map = (d0, d1, d2, d3, d4) -> (d0 : compressed, d1 : compressed, d2 : compressed, d3 : compressed, d4 : compressed) }>> loc("<stdin>":31:11)
    %27 = "linalg.conv_3d_ndhwc_dhwcf"(%arg5, %arg6, %26) <{dilations = dense<1> : tensor<3xi64>, operandSegmentSizes = array<i32: 2, 1>, strides = dense<1> : tensor<3xi64>}> ({
    ^bb0(%arg7: f32 loc("<stdin>":33:10), %arg8: f32 loc("<stdin>":33:22), %arg9: f32 loc("<stdin>":33:34)):
      %28 = "arith.mulf"(%arg7, %arg8) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32 loc("<stdin>":34:13)
      %29 = "arith.addf"(%arg9, %28) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32 loc("<stdin>":35:13)
      "linalg.yield"(%29) : (f32) -> () loc("<stdin>":36:7)
    }) {linalg.memoized_indexing_maps = [affine_map<(d0, d1, d2, d3, d4, d5, d6, d7, d8) -> (d0, d1 + d5, d2 + d6, d3 + d7, d8)>, affine_map<(d0, d1, d2, d3, d4, d5, d6, d7, d8) -> (d5, d6, d7, d8, d4)>, affine_map<(d0, d1, d2, d3, d4, d5, d6, d7, d8) -> (d0, d1, d2, d3, d4)>]} : (tensor<?x?x?x?x?xf32, #sparse_tensor.encoding<{ map = (d0, d1, d2, d3, d4) -> (d0 : compressed, d1 : compressed, d2 : compressed, d3 : compressed, d4 : compressed) }>>, tensor<?x?x?x?x?xf32>, tensor<?x?x?x?x?xf32, #sparse_tensor.encoding<{ map = (d0, d1, d2, d3, d4) -> (d0 : compressed, d1 : compressed, d2 : compressed, d3 : compressed, d4 : compressed) }>>) -> tensor<?x?x?x?x?xf32, #sparse_tensor.encoding<{ map = (d0, d1, d2, d3, d4) -> (d0 : compressed, d1 : compressed, d2 : compressed, d3 : compressed, d4 : compressed) }>> loc("<stdin>":32:11)
    "func.return"(%27) : (tensor<?x?x?x?x?xf32, #sparse_tensor.encoding<{ map = (d0, d1, d2, d3, d4) -> (d0 : compressed, d1 : compressed, d2 : compressed, d3 : compressed, d4 : compressed) }>>) -> () loc("<stdin>":38:5)
  }) : () -> () loc("<stdin>":27:3)
  "func.func"() <{function_type = (tensor<?x?x?x?x?xf32, #sparse_tensor.encoding<{ map = (d0, d1, d2, d3, d4) -> (d0 : compressed, d1 : dense, d2 : compressed, d3 : dense, d4 : compressed) }>>, tensor<?x?x?x?x?xf32>) -> tensor<?x?x?x?x?xf32, #sparse_tensor.encoding<{ map = (d0, d1, d2, d3, d4) -> (d0 : compressed, d1 : dense, d2 : compressed, d3 : dense, d4 : compressed) }>>, sym_name = "conv_3d_ndhwc_dhwcf_CDCDC"}> ({
  ^bb0(%arg0: tensor<?x?x?x?x?xf32, #sparse_tensor.encoding<{ map = (d0, d1, d2, d3, d4) -> (d0 : compressed, d1 : dense, d2 : compressed, d3 : dense, d4 : compressed) }>> loc("<stdin>":41:8), %arg1: tensor<?x?x?x?x?xf32> loc("<stdin>":41:48)):
    %18 = "arith.constant"() <{value = 1 : index}> : () -> index loc("<stdin>":42:11)
    %19 = "arith.constant"() <{value = 6 : index}> : () -> index loc("<stdin>":43:11)
    %20 = "tensor.empty"(%18, %19, %19, %19, %18) : (index, index, index, index, index) -> tensor<?x?x?x?x?xf32, #sparse_tensor.encoding<{ map = (d0, d1, d2, d3, d4) -> (d0 : compressed, d1 : dense, d2 : compressed, d3 : dense, d4 : compressed) }>> loc("<stdin>":44:11)
    %21 = "linalg.conv_3d_ndhwc_dhwcf"(%arg0, %arg1, %20) <{dilations = dense<1> : tensor<3xi64>, operandSegmentSizes = array<i32: 2, 1>, strides = dense<1> : tensor<3xi64>}> ({
    ^bb0(%arg2: f32 loc("<stdin>":46:10), %arg3: f32 loc("<stdin>":46:22), %arg4: f32 loc("<stdin>":46:34)):
      %22 = "arith.mulf"(%arg2, %arg3) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32 loc("<stdin>":47:13)
      %23 = "arith.addf"(%arg4, %22) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32 loc("<stdin>":48:13)
      "linalg.yield"(%23) : (f32) -> () loc("<stdin>":49:7)
    }) {linalg.memoized_indexing_maps = [affine_map<(d0, d1, d2, d3, d4, d5, d6, d7, d8) -> (d0, d1 + d5, d2 + d6, d3 + d7, d8)>, affine_map<(d0, d1, d2, d3, d4, d5, d6, d7, d8) -> (d5, d6, d7, d8, d4)>, affine_map<(d0, d1, d2, d3, d4, d5, d6, d7, d8) -> (d0, d1, d2, d3, d4)>]} : (tensor<?x?x?x?x?xf32, #sparse_tensor.encoding<{ map = (d0, d1, d2, d3, d4) -> (d0 : compressed, d1 : dense, d2 : compressed, d3 : dense, d4 : compressed) }>>, tensor<?x?x?x?x?xf32>, tensor<?x?x?x?x?xf32, #sparse_tensor.encoding<{ map = (d0, d1, d2, d3, d4) -> (d0 : compressed, d1 : dense, d2 : compressed, d3 : dense, d4 : compressed) }>>) -> tensor<?x?x?x?x?xf32, #sparse_tensor.encoding<{ map = (d0, d1, d2, d3, d4) -> (d0 : compressed, d1 : dense, d2 : compressed, d3 : dense, d4 : compressed) }>> loc("<stdin>":45:11)
    "func.return"(%21) : (tensor<?x?x?x?x?xf32, #sparse_tensor.encoding<{ map = (d0, d1, d2, d3, d4) -> (d0 : compressed, d1 : dense, d2 : compressed, d3 : dense, d4 : compressed) }>>) -> () loc("<stdin>":51:5)
  }) : () -> () loc("<stdin>":40:3)
  "func.func"() <{function_type = () -> (), sym_name = "main"}> ({
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":54:10)
    %1 = "arith.constant"() <{value = 1 : index}> : () -> index loc("<stdin>":55:10)
    %2 = "arith.constant"() <{value = 3 : index}> : () -> index loc("<stdin>":56:10)
    %3 = "arith.constant"() <{value = 6 : index}> : () -> index loc("<stdin>":57:10)
    %4 = "arith.constant"() <{value = 8 : index}> : () -> index loc("<stdin>":58:10)
    %5 = "arith.constant"() <{value = 1.000000e+01 : f32}> : () -> f32 loc("<stdin>":59:10)
    %6 = "arith.constant"() <{value = 2.000000e+00 : f32}> : () -> f32 loc("<stdin>":60:10)
    %7 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32 loc("<stdin>":61:10)
    %8 = "func.call"(%1, %4, %4, %4, %1, %6) <{callee = @alloc_5d_filled_f32}> : (index, index, index, index, index, f32) -> tensor<?x?x?x?x?xf32> loc("<stdin>":62:10)
    %9 = "tensor.insert"(%5, %8, %0, %0, %0, %2, %0) : (f32, tensor<?x?x?x?x?xf32>, index, index, index, index, index) -> tensor<?x?x?x?x?xf32> loc("<stdin>":63:10)
    %10 = "func.call"(%2, %2, %2, %1, %1, %6) <{callee = @alloc_5d_filled_f32}> : (index, index, index, index, index, f32) -> tensor<?x?x?x?x?xf32> loc("<stdin>":64:11)
    %11 = "func.call"(%1, %3, %3, %3, %1, %7) <{callee = @alloc_5d_filled_f32}> : (index, index, index, index, index, f32) -> tensor<?x?x?x?x?xf32> loc("<stdin>":65:11)
    %12 = "sparse_tensor.convert"(%9) : (tensor<?x?x?x?x?xf32>) -> tensor<?x?x?x?x?xf32, #sparse_tensor.encoding<{ map = (d0, d1, d2, d3, d4) -> (d0 : compressed, d1 : compressed, d2 : compressed, d3 : compressed, d4 : compressed) }>> loc("<stdin>":66:11)
    %13 = "sparse_tensor.convert"(%9) : (tensor<?x?x?x?x?xf32>) -> tensor<?x?x?x?x?xf32, #sparse_tensor.encoding<{ map = (d0, d1, d2, d3, d4) -> (d0 : compressed, d1 : dense, d2 : compressed, d3 : dense, d4 : compressed) }>> loc("<stdin>":67:11)
    %14 = "func.call"(%9, %10, %11) <{callee = @conv_3d_ndhwc_dhwcf}> : (tensor<?x?x?x?x?xf32>, tensor<?x?x?x?x?xf32>, tensor<?x?x?x?x?xf32>) -> tensor<?x?x?x?x?xf32> loc("<stdin>":68:11)
    %15 = "vector.transfer_read"(%14, %0, %0, %0, %0, %0, %7) <{in_bounds = [false, false, false, false, false], operandSegmentSizes = array<i32: 1, 5, 1, 0>, permutation_map = affine_map<(d0, d1, d2, d3, d4) -> (d0, d1, d2, d3, d4)>}> : (tensor<?x?x?x?x?xf32>, index, index, index, index, index, f32) -> vector<1x6x6x6x1xf32> loc("<stdin>":69:11)
    "vector.print"(%15) <{punctuation = #vector.punctuation<newline>}> : (vector<1x6x6x6x1xf32>) -> () loc("<stdin>":70:5)
    %16 = "func.call"(%12, %10) <{callee = @conv_3d_ndhwc_dhwcf_CCCCC}> : (tensor<?x?x?x?x?xf32, #sparse_tensor.encoding<{ map = (d0, d1, d2, d3, d4) -> (d0 : compressed, d1 : compressed, d2 : compressed, d3 : compressed, d4 : compressed) }>>, tensor<?x?x?x?x?xf32>) -> tensor<?x?x?x?x?xf32, #sparse_tensor.encoding<{ map = (d0, d1, d2, d3, d4) -> (d0 : compressed, d1 : compressed, d2 : compressed, d3 : compressed, d4 : compressed) }>> loc("<stdin>":71:11)
    "sparse_tensor.print"(%16) : (tensor<?x?x?x?x?xf32, #sparse_tensor.encoding<{ map = (d0, d1, d2, d3, d4) -> (d0 : compressed, d1 : compressed, d2 : compressed, d3 : compressed, d4 : compressed) }>>) -> () loc("<stdin>":72:5)
    %17 = "func.call"(%13, %10) <{callee = @conv_3d_ndhwc_dhwcf_CDCDC}> : (tensor<?x?x?x?x?xf32, #sparse_tensor.encoding<{ map = (d0, d1, d2, d3, d4) -> (d0 : compressed, d1 : dense, d2 : compressed, d3 : dense, d4 : compressed) }>>, tensor<?x?x?x?x?xf32>) -> tensor<?x?x?x?x?xf32, #sparse_tensor.encoding<{ map = (d0, d1, d2, d3, d4) -> (d0 : compressed, d1 : dense, d2 : compressed, d3 : dense, d4 : compressed) }>> loc("<stdin>":73:11)
    "sparse_tensor.print"(%17) : (tensor<?x?x?x?x?xf32, #sparse_tensor.encoding<{ map = (d0, d1, d2, d3, d4) -> (d0 : compressed, d1 : dense, d2 : compressed, d3 : dense, d4 : compressed) }>>) -> () loc("<stdin>":74:5)
    "bufferization.dealloc_tensor"(%9) : (tensor<?x?x?x?x?xf32>) -> () loc("<stdin>":75:5)
    "bufferization.dealloc_tensor"(%10) : (tensor<?x?x?x?x?xf32>) -> () loc("<stdin>":76:5)
    "bufferization.dealloc_tensor"(%11) : (tensor<?x?x?x?x?xf32>) -> () loc("<stdin>":77:5)
    "bufferization.dealloc_tensor"(%13) : (tensor<?x?x?x?x?xf32, #sparse_tensor.encoding<{ map = (d0, d1, d2, d3, d4) -> (d0 : compressed, d1 : dense, d2 : compressed, d3 : dense, d4 : compressed) }>>) -> () loc("<stdin>":78:5)
    "bufferization.dealloc_tensor"(%12) : (tensor<?x?x?x?x?xf32, #sparse_tensor.encoding<{ map = (d0, d1, d2, d3, d4) -> (d0 : compressed, d1 : compressed, d2 : compressed, d3 : compressed, d4 : compressed) }>>) -> () loc("<stdin>":79:5)
    "bufferization.dealloc_tensor"(%16) : (tensor<?x?x?x?x?xf32, #sparse_tensor.encoding<{ map = (d0, d1, d2, d3, d4) -> (d0 : compressed, d1 : compressed, d2 : compressed, d3 : compressed, d4 : compressed) }>>) -> () loc("<stdin>":80:5)
    "bufferization.dealloc_tensor"(%17) : (tensor<?x?x?x?x?xf32, #sparse_tensor.encoding<{ map = (d0, d1, d2, d3, d4) -> (d0 : compressed, d1 : dense, d2 : compressed, d3 : dense, d4 : compressed) }>>) -> () loc("<stdin>":81:5)
    "func.return"() : () -> () loc("<stdin>":82:5)
  }) : () -> () loc("<stdin>":53:3)
}) : () -> () loc("<stdin>":7:1)
