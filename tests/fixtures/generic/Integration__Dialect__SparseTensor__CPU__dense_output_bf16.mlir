#map = affine_map<(d0) -> (d0)>
#sparse = #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>
#sparse1 = #sparse_tensor.encoding<{ map = (d0) -> (d0 : dense) }>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?xbf16, #sparse>, tensor<?xbf16, #sparse>) -> tensor<?xbf16, #sparse1>, sym_name = "vector_min"}> ({
  ^bb0(%arg0: tensor<?xbf16, #sparse>, %arg1: tensor<?xbf16, #sparse>):
    %6 = "arith.constant"() <{value = 0 : index}> : () -> index
    %7 = "tensor.dim"(%arg0, %6) : (tensor<?xbf16, #sparse>, index) -> index
    %8 = "tensor.empty"(%7) : (index) -> tensor<?xbf16, #sparse1>
    %9 = "linalg.generic"(%arg0, %arg1, %8) <{indexing_maps = [#map, #map, #map], iterator_types = [#linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg2: bf16, %arg3: bf16, %arg4: bf16):
      %10 = "sparse_tensor.binary"(%arg2, %arg3) <{left_identity, right_identity}> ({
      ^bb0(%arg5: bf16, %arg6: bf16):
        %11 = "arith.cmpf"(%arg5, %arg6) <{fastmath = #arith.fastmath<none>, predicate = 4 : i64}> : (bf16, bf16) -> i1
        %12 = "arith.select"(%11, %arg5, %arg6) : (i1, bf16, bf16) -> bf16
        "sparse_tensor.yield"(%12) : (bf16) -> ()
      }, {
      }, {
      }) : (bf16, bf16) -> bf16
      "linalg.yield"(%10) : (bf16) -> ()
    }) : (tensor<?xbf16, #sparse>, tensor<?xbf16, #sparse>, tensor<?xbf16, #sparse1>) -> tensor<?xbf16, #sparse1>
    "func.return"(%9) : (tensor<?xbf16, #sparse1>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "main"}> ({
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = sparse<[[0], [3], [11], [17], [20], [21], [28], [29], [31]], [1.000000e+00, 2.000000e+00, 3.000000e+00, 4.000000e+00, 5.000000e+00, 6.000000e+00, 7.000000e+00, 8.000000e+00, 9.000000e+00]> : tensor<32xbf16>}> : () -> tensor<32xbf16>
    %2 = "arith.constant"() <{value = sparse<[[1], [3], [4], [10], [16], [18], [21], [28], [29], [31]], [1.100000e+01, 1.200000e+01, 1.300000e+01, 1.400000e+01, 1.500000e+01, 1.600000e+01, 1.700000e+01, 1.800000e+01, 1.900000e+01, 2.000000e+01]> : tensor<32xbf16>}> : () -> tensor<32xbf16>
    %3 = "sparse_tensor.convert"(%1) : (tensor<32xbf16>) -> tensor<?xbf16, #sparse>
    %4 = "sparse_tensor.convert"(%2) : (tensor<32xbf16>) -> tensor<?xbf16, #sparse>
    %5 = "func.call"(%3, %4) <{callee = @vector_min}> : (tensor<?xbf16, #sparse>, tensor<?xbf16, #sparse>) -> tensor<?xbf16, #sparse1>
    "sparse_tensor.print"(%5) : (tensor<?xbf16, #sparse1>) -> ()
    "bufferization.dealloc_tensor"(%3) : (tensor<?xbf16, #sparse>) -> ()
    "bufferization.dealloc_tensor"(%4) : (tensor<?xbf16, #sparse>) -> ()
    "bufferization.dealloc_tensor"(%5) : (tensor<?xbf16, #sparse1>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

