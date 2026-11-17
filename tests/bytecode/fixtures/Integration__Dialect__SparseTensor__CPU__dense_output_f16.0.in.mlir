"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?xf16, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>>, tensor<?xf16, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>>) -> tensor<?xf16, #sparse_tensor.encoding<{ map = (d0) -> (d0 : dense) }>>, sym_name = "vector_min"}> ({
  ^bb0(%arg0: tensor<?xf16, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>> loc("<stdin>":6:8), %arg1: tensor<?xf16, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>> loc("<stdin>":6:39)):
    %6 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":7:10)
    %7 = "tensor.dim"(%arg0, %6) : (tensor<?xf16, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>>, index) -> index loc("<stdin>":8:10)
    %8 = "tensor.empty"(%7) : (index) -> tensor<?xf16, #sparse_tensor.encoding<{ map = (d0) -> (d0 : dense) }>> loc("<stdin>":9:10)
    %9 = "linalg.generic"(%arg0, %arg1, %8) <{indexing_maps = [affine_map<(d0) -> (d0)>, affine_map<(d0) -> (d0)>, affine_map<(d0) -> (d0)>], iterator_types = [#linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg2: f16 loc("<stdin>":11:10), %arg3: f16 loc("<stdin>":11:22), %arg4: f16 loc("<stdin>":11:34)):
      %10 = "sparse_tensor.binary"(%arg2, %arg3) <{left_identity, right_identity}> ({
      ^bb0(%arg5: f16 loc("<stdin>":13:12), %arg6: f16 loc("<stdin>":13:24)):
        %11 = "arith.cmpf"(%arg5, %arg6) <{fastmath = #arith.fastmath<none>, predicate = 4 : i64}> : (f16, f16) -> i1 loc("<stdin>":14:15)
        %12 = "arith.select"(%11, %arg5, %arg6) : (i1, f16, f16) -> f16 loc("<stdin>":15:15)
        "sparse_tensor.yield"(%12) : (f16) -> () loc("<stdin>":16:9)
      }, {
      }, {
      }) : (f16, f16) -> f16 loc("<stdin>":12:13)
      "linalg.yield"(%10) : (f16) -> () loc("<stdin>":20:7)
    }) : (tensor<?xf16, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>>, tensor<?xf16, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>>, tensor<?xf16, #sparse_tensor.encoding<{ map = (d0) -> (d0 : dense) }>>) -> tensor<?xf16, #sparse_tensor.encoding<{ map = (d0) -> (d0 : dense) }>> loc("<stdin>":10:10)
    "func.return"(%9) : (tensor<?xf16, #sparse_tensor.encoding<{ map = (d0) -> (d0 : dense) }>>) -> () loc("<stdin>":22:5)
  }) : () -> () loc("<stdin>":5:3)
  "func.func"() <{function_type = () -> (), sym_name = "main"}> ({
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":25:10)
    %1 = "arith.constant"() <{value = sparse<[[0], [3], [11], [17], [20], [21], [28], [29], [31]], [1.000000e+00, 2.000000e+00, 3.000000e+00, 4.000000e+00, 5.000000e+00, 6.000000e+00, 7.000000e+00, 8.000000e+00, 9.000000e+00]> : tensor<32xf16>}> : () -> tensor<32xf16> loc("<stdin>":26:10)
    %2 = "arith.constant"() <{value = sparse<[[1], [3], [4], [10], [16], [18], [21], [28], [29], [31]], [1.100000e+01, 1.200000e+01, 1.300000e+01, 1.400000e+01, 1.500000e+01, 1.600000e+01, 1.700000e+01, 1.800000e+01, 1.900000e+01, 2.000000e+01]> : tensor<32xf16>}> : () -> tensor<32xf16> loc("<stdin>":27:10)
    %3 = "sparse_tensor.convert"(%1) : (tensor<32xf16>) -> tensor<?xf16, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>> loc("<stdin>":28:10)
    %4 = "sparse_tensor.convert"(%2) : (tensor<32xf16>) -> tensor<?xf16, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>> loc("<stdin>":29:10)
    %5 = "func.call"(%3, %4) <{callee = @vector_min}> : (tensor<?xf16, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>>, tensor<?xf16, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>>) -> tensor<?xf16, #sparse_tensor.encoding<{ map = (d0) -> (d0 : dense) }>> loc("<stdin>":30:10)
    "sparse_tensor.print"(%5) : (tensor<?xf16, #sparse_tensor.encoding<{ map = (d0) -> (d0 : dense) }>>) -> () loc("<stdin>":31:5)
    "bufferization.dealloc_tensor"(%3) : (tensor<?xf16, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>>) -> () loc("<stdin>":32:5)
    "bufferization.dealloc_tensor"(%4) : (tensor<?xf16, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>>) -> () loc("<stdin>":33:5)
    "bufferization.dealloc_tensor"(%5) : (tensor<?xf16, #sparse_tensor.encoding<{ map = (d0) -> (d0 : dense) }>>) -> () loc("<stdin>":34:5)
    "func.return"() : () -> () loc("<stdin>":35:5)
  }) : () -> () loc("<stdin>":24:3)
}) : () -> () loc("<stdin>":4:1)
