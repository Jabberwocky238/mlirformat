"builtin.module"() ({
  "func.func"() <{function_type = (tensor<32xi32, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>>, tensor<i32>) -> tensor<i32>, sym_name = "sum_reduction_i32"}> ({
  ^bb0(%arg14: tensor<32xi32, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>> loc("<stdin>":6:8), %arg15: tensor<i32> loc("<stdin>":6:41)):
    %18 = "linalg.generic"(%arg14, %arg15) <{doc = "x += OPER_i a(i)", indexing_maps = [affine_map<(d0) -> (d0)>, affine_map<(d0) -> ()>], iterator_types = [#linalg.iterator_type<reduction>], operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg16: i32 loc("<stdin>":8:10), %arg17: i32 loc("<stdin>":8:23)):
      %19 = "arith.addi"(%arg17, %arg16) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32 loc("<stdin>":9:13)
      "linalg.yield"(%19) : (i32) -> () loc("<stdin>":10:7)
    }) : (tensor<32xi32, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>>, tensor<i32>) -> tensor<i32> loc("<stdin>":7:11)
    "func.return"(%18) : (tensor<i32>) -> () loc("<stdin>":12:5)
  }) : () -> () loc("<stdin>":5:3)
  "func.func"() <{function_type = (tensor<32xf32, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>>, tensor<f32>) -> tensor<f32>, sym_name = "sum_reduction_f32"}> ({
  ^bb0(%arg10: tensor<32xf32, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>> loc("<stdin>":15:8), %arg11: tensor<f32> loc("<stdin>":15:41)):
    %16 = "linalg.generic"(%arg10, %arg11) <{doc = "x += OPER_i a(i)", indexing_maps = [affine_map<(d0) -> (d0)>, affine_map<(d0) -> ()>], iterator_types = [#linalg.iterator_type<reduction>], operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg12: f32 loc("<stdin>":17:10), %arg13: f32 loc("<stdin>":17:23)):
      %17 = "arith.addf"(%arg13, %arg12) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32 loc("<stdin>":18:13)
      "linalg.yield"(%17) : (f32) -> () loc("<stdin>":19:7)
    }) : (tensor<32xf32, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>>, tensor<f32>) -> tensor<f32> loc("<stdin>":16:11)
    "func.return"(%16) : (tensor<f32>) -> () loc("<stdin>":21:5)
  }) : () -> () loc("<stdin>":14:3)
  "func.func"() <{function_type = (tensor<32xi32, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>>, tensor<i32>) -> tensor<i32>, sym_name = "or_reduction_i32"}> ({
  ^bb0(%arg6: tensor<32xi32, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>> loc("<stdin>":24:8), %arg7: tensor<i32> loc("<stdin>":24:40)):
    %14 = "linalg.generic"(%arg6, %arg7) <{doc = "x += OPER_i a(i)", indexing_maps = [affine_map<(d0) -> (d0)>, affine_map<(d0) -> ()>], iterator_types = [#linalg.iterator_type<reduction>], operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg8: i32 loc("<stdin>":26:10), %arg9: i32 loc("<stdin>":26:22)):
      %15 = "arith.ori"(%arg9, %arg8) : (i32, i32) -> i32 loc("<stdin>":27:13)
      "linalg.yield"(%15) : (i32) -> () loc("<stdin>":28:7)
    }) : (tensor<32xi32, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>>, tensor<i32>) -> tensor<i32> loc("<stdin>":25:11)
    "func.return"(%14) : (tensor<i32>) -> () loc("<stdin>":30:5)
  }) : () -> () loc("<stdin>":23:3)
  "func.func"() <{function_type = (tensor<32xi32, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>>, tensor<i32>) -> tensor<i32>, sym_name = "xor_reduction_i32"}> ({
  ^bb0(%arg2: tensor<32xi32, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>> loc("<stdin>":33:8), %arg3: tensor<i32> loc("<stdin>":33:40)):
    %12 = "linalg.generic"(%arg2, %arg3) <{doc = "x += OPER_i a(i)", indexing_maps = [affine_map<(d0) -> (d0)>, affine_map<(d0) -> ()>], iterator_types = [#linalg.iterator_type<reduction>], operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg4: i32 loc("<stdin>":35:10), %arg5: i32 loc("<stdin>":35:22)):
      %13 = "arith.xori"(%arg5, %arg4) : (i32, i32) -> i32 loc("<stdin>":36:13)
      "linalg.yield"(%13) : (i32) -> () loc("<stdin>":37:7)
    }) : (tensor<32xi32, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>>, tensor<i32>) -> tensor<i32> loc("<stdin>":34:11)
    "func.return"(%12) : (tensor<i32>) -> () loc("<stdin>":39:5)
  }) : () -> () loc("<stdin>":32:3)
  "func.func"() <{function_type = (tensor<i32>) -> (), sym_name = "dump_i32"}> ({
  ^bb0(%arg1: tensor<i32> loc("<stdin>":42:8)):
    %11 = "tensor.extract"(%arg1) : (tensor<i32>) -> i32 loc("<stdin>":43:11)
    "vector.print"(%11) <{punctuation = #vector.punctuation<newline>}> : (i32) -> () loc("<stdin>":44:5)
    "func.return"() : () -> () loc("<stdin>":45:5)
  }) : () -> () loc("<stdin>":41:3)
  "func.func"() <{function_type = (tensor<f32>) -> (), sym_name = "dump_f32"}> ({
  ^bb0(%arg0: tensor<f32> loc("<stdin>":48:8)):
    %10 = "tensor.extract"(%arg0) : (tensor<f32>) -> f32 loc("<stdin>":49:11)
    "vector.print"(%10) <{punctuation = #vector.punctuation<newline>}> : (f32) -> () loc("<stdin>":50:5)
    "func.return"() : () -> () loc("<stdin>":51:5)
  }) : () -> () loc("<stdin>":47:3)
  "func.func"() <{function_type = () -> (), sym_name = "main"}> ({
    %0 = "arith.constant"() <{value = dense<7> : tensor<i32>}> : () -> tensor<i32> loc("<stdin>":54:10)
    %1 = "arith.constant"() <{value = dense<2.000000e+00> : tensor<f32>}> : () -> tensor<f32> loc("<stdin>":55:10)
    %2 = "arith.constant"() <{value = dense<[0, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 9, 0]> : tensor<32xi32>}> : () -> tensor<32xi32> loc("<stdin>":56:10)
    %3 = "arith.constant"() <{value = dense<[0.000000e+00, 1.000000e+00, 0.000000e+00, 0.000000e+00, 4.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, 3.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, 2.500000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, 2.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, 4.000000e+00, 0.000000e+00, 9.000000e+00]> : tensor<32xf32>}> : () -> tensor<32xf32> loc("<stdin>":57:10)
    %4 = "sparse_tensor.convert"(%2) : (tensor<32xi32>) -> tensor<32xi32, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>> loc("<stdin>":58:10)
    %5 = "sparse_tensor.convert"(%3) : (tensor<32xf32>) -> tensor<32xf32, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>> loc("<stdin>":59:10)
    %6 = "func.call"(%4, %0) <{callee = @sum_reduction_i32}> : (tensor<32xi32, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>>, tensor<i32>) -> tensor<i32> loc("<stdin>":60:10)
    %7 = "func.call"(%5, %1) <{callee = @sum_reduction_f32}> : (tensor<32xf32, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>>, tensor<f32>) -> tensor<f32> loc("<stdin>":61:10)
    %8 = "func.call"(%4, %0) <{callee = @or_reduction_i32}> : (tensor<32xi32, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>>, tensor<i32>) -> tensor<i32> loc("<stdin>":62:10)
    %9 = "func.call"(%4, %0) <{callee = @xor_reduction_i32}> : (tensor<32xi32, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>>, tensor<i32>) -> tensor<i32> loc("<stdin>":63:10)
    "func.call"(%6) <{callee = @dump_i32}> : (tensor<i32>) -> () loc("<stdin>":64:5)
    "func.call"(%7) <{callee = @dump_f32}> : (tensor<f32>) -> () loc("<stdin>":65:5)
    "func.call"(%8) <{callee = @dump_i32}> : (tensor<i32>) -> () loc("<stdin>":66:5)
    "func.call"(%9) <{callee = @dump_i32}> : (tensor<i32>) -> () loc("<stdin>":67:5)
    "bufferization.dealloc_tensor"(%4) : (tensor<32xi32, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>>) -> () loc("<stdin>":68:5)
    "bufferization.dealloc_tensor"(%5) : (tensor<32xf32, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>>) -> () loc("<stdin>":69:5)
    "bufferization.dealloc_tensor"(%6) : (tensor<i32>) -> () loc("<stdin>":70:5)
    "bufferization.dealloc_tensor"(%7) : (tensor<f32>) -> () loc("<stdin>":71:5)
    "bufferization.dealloc_tensor"(%8) : (tensor<i32>) -> () loc("<stdin>":72:5)
    "bufferization.dealloc_tensor"(%9) : (tensor<i32>) -> () loc("<stdin>":73:5)
    "func.return"() : () -> () loc("<stdin>":74:5)
  }) : () -> () loc("<stdin>":53:3)
}) : () -> () loc("<stdin>":4:1)
