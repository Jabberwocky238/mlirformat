"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?xf64, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>>) -> tensor<?xf64, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>>, sym_name = "sparse_absf"}> ({
  ^bb0(%arg3: tensor<?xf64, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>> loc("<stdin>":5:8)):
    %18 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":6:11)
    %19 = "tensor.dim"(%arg3, %18) : (tensor<?xf64, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>>, index) -> index loc("<stdin>":7:11)
    %20 = "tensor.empty"(%19) : (index) -> tensor<?xf64, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>> loc("<stdin>":8:11)
    %21 = "linalg.generic"(%arg3, %20) <{doc = "x(i) = OP a(i)", indexing_maps = [affine_map<(d0) -> (d0)>, affine_map<(d0) -> (d0)>], iterator_types = [#linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg4: f64 loc("<stdin>":10:10), %arg5: f64 loc("<stdin>":10:22)):
      %22 = "math.absf"(%arg4) <{fastmath = #arith.fastmath<none>}> : (f64) -> f64 loc("<stdin>":11:13)
      "linalg.yield"(%22) : (f64) -> () loc("<stdin>":12:7)
    }) : (tensor<?xf64, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>>, tensor<?xf64, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>>) -> tensor<?xf64, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>> loc("<stdin>":9:11)
    "func.return"(%21) : (tensor<?xf64, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>>) -> () loc("<stdin>":14:5)
  }) : () -> () loc("<stdin>":4:3)
  "func.func"() <{function_type = (tensor<?xi32, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>>) -> tensor<?xi32, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>>, sym_name = "sparse_absi"}> ({
  ^bb0(%arg0: tensor<?xi32, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>> loc("<stdin>":17:8)):
    %13 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":18:11)
    %14 = "tensor.dim"(%arg0, %13) : (tensor<?xi32, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>>, index) -> index loc("<stdin>":19:11)
    %15 = "tensor.empty"(%14) : (index) -> tensor<?xi32, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>> loc("<stdin>":20:11)
    %16 = "linalg.generic"(%arg0, %15) <{doc = "x(i) = OP a(i)", indexing_maps = [affine_map<(d0) -> (d0)>, affine_map<(d0) -> (d0)>], iterator_types = [#linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg1: i32 loc("<stdin>":22:10), %arg2: i32 loc("<stdin>":22:22)):
      %17 = "math.absi"(%arg1) : (i32) -> i32 loc("<stdin>":23:13)
      "linalg.yield"(%17) : (i32) -> () loc("<stdin>":24:7)
    }) : (tensor<?xi32, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>>, tensor<?xi32, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>>) -> tensor<?xi32, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>> loc("<stdin>":21:11)
    "func.return"(%16) : (tensor<?xi32, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>>) -> () loc("<stdin>":26:5)
  }) : () -> () loc("<stdin>":16:3)
  "func.func"() <{function_type = () -> (), sym_name = "main"}> ({
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":29:10)
    %1 = "arith.constant"() <{value = 99.989999999999994 : f64}> : () -> f64 loc("<stdin>":30:10)
    %2 = "arith.constant"() <{value = 9999 : i32}> : () -> i32 loc("<stdin>":31:10)
    %3 = "arith.constant"() <{value = 0x7FF0000001000000 : f64}> : () -> f64 loc("<stdin>":32:10)
    %4 = "arith.constant"() <{value = 0xFFF0000001000000 : f64}> : () -> f64 loc("<stdin>":33:10)
    %5 = "arith.constant"() <{value = 0x7FF0000000000000 : f64}> : () -> f64 loc("<stdin>":34:10)
    %6 = "arith.constant"() <{value = 0xFFF0000000000000 : f64}> : () -> f64 loc("<stdin>":35:10)
    %7 = "arith.constant"() <{value = sparse<[[0], [3], [5], [11], [13], [17], [18], [20], [21], [28], [29], [31]], [-1.500000e+00, 1.500000e+00, -1.020000e+01, 1.130000e+01, 1.000000e+00, -1.000000e+00, 0x7FF0000001000000, 0xFFF0000001000000, 0x7FF0000000000000, 0xFFF0000000000000, -0.000000e+00, 0.000000e+00]> : tensor<32xf64>}> : () -> tensor<32xf64> loc("<stdin>":36:10)
    %8 = "arith.constant"() <{value = sparse<[[0], [3], [5], [11], [13], [17], [18], [21], [31]], [-2147483648, -2147483647, -1000, -1, 0, 1, 1000, 2147483646, 2147483647]> : tensor<32xi32>}> : () -> tensor<32xi32> loc("<stdin>":37:10)
    %9 = "sparse_tensor.convert"(%7) : (tensor<32xf64>) -> tensor<?xf64, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>> loc("<stdin>":38:10)
    %10 = "sparse_tensor.convert"(%8) : (tensor<32xi32>) -> tensor<?xi32, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>> loc("<stdin>":39:11)
    %11 = "func.call"(%9) <{callee = @sparse_absf}> : (tensor<?xf64, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>>) -> tensor<?xf64, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>> loc("<stdin>":40:11)
    %12 = "func.call"(%10) <{callee = @sparse_absi}> : (tensor<?xi32, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>>) -> tensor<?xi32, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>> loc("<stdin>":41:11)
    "sparse_tensor.print"(%11) : (tensor<?xf64, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>>) -> () loc("<stdin>":42:5)
    "sparse_tensor.print"(%12) : (tensor<?xi32, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>>) -> () loc("<stdin>":43:5)
    "bufferization.dealloc_tensor"(%9) : (tensor<?xf64, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>>) -> () loc("<stdin>":44:5)
    "bufferization.dealloc_tensor"(%10) : (tensor<?xi32, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>>) -> () loc("<stdin>":45:5)
    "bufferization.dealloc_tensor"(%11) : (tensor<?xf64, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>>) -> () loc("<stdin>":46:5)
    "bufferization.dealloc_tensor"(%12) : (tensor<?xi32, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>>) -> () loc("<stdin>":47:5)
    "func.return"() : () -> () loc("<stdin>":48:5)
  }) : () -> () loc("<stdin>":28:3)
}) : () -> () loc("<stdin>":3:1)
