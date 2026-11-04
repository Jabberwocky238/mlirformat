#map = affine_map<(d0) -> (d0)>
#sparse = #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?xf64, #sparse>) -> tensor<?xf64, #sparse>, sym_name = "sparse_absf"}> ({
  ^bb0(%arg3: tensor<?xf64, #sparse>):
    %18 = "arith.constant"() <{value = 0 : index}> : () -> index
    %19 = "tensor.dim"(%arg3, %18) : (tensor<?xf64, #sparse>, index) -> index
    %20 = "tensor.empty"(%19) : (index) -> tensor<?xf64, #sparse>
    %21 = "linalg.generic"(%arg3, %20) <{doc = "x(i) = OP a(i)", indexing_maps = [#map, #map], iterator_types = [#linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg4: f64, %arg5: f64):
      %22 = "math.absf"(%arg4) <{fastmath = #arith.fastmath<none>}> : (f64) -> f64
      "linalg.yield"(%22) : (f64) -> ()
    }) : (tensor<?xf64, #sparse>, tensor<?xf64, #sparse>) -> tensor<?xf64, #sparse>
    "func.return"(%21) : (tensor<?xf64, #sparse>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<?xi32, #sparse>) -> tensor<?xi32, #sparse>, sym_name = "sparse_absi"}> ({
  ^bb0(%arg0: tensor<?xi32, #sparse>):
    %13 = "arith.constant"() <{value = 0 : index}> : () -> index
    %14 = "tensor.dim"(%arg0, %13) : (tensor<?xi32, #sparse>, index) -> index
    %15 = "tensor.empty"(%14) : (index) -> tensor<?xi32, #sparse>
    %16 = "linalg.generic"(%arg0, %15) <{doc = "x(i) = OP a(i)", indexing_maps = [#map, #map], iterator_types = [#linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg1: i32, %arg2: i32):
      %17 = "math.absi"(%arg1) : (i32) -> i32
      "linalg.yield"(%17) : (i32) -> ()
    }) : (tensor<?xi32, #sparse>, tensor<?xi32, #sparse>) -> tensor<?xi32, #sparse>
    "func.return"(%16) : (tensor<?xi32, #sparse>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "main"}> ({
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = 99.989999999999994 : f64}> : () -> f64
    %2 = "arith.constant"() <{value = 9999 : i32}> : () -> i32
    %3 = "arith.constant"() <{value = 0x7FF0000001000000 : f64}> : () -> f64
    %4 = "arith.constant"() <{value = 0xFFF0000001000000 : f64}> : () -> f64
    %5 = "arith.constant"() <{value = 0x7FF0000000000000 : f64}> : () -> f64
    %6 = "arith.constant"() <{value = 0xFFF0000000000000 : f64}> : () -> f64
    %7 = "arith.constant"() <{value = sparse<[[0], [3], [5], [11], [13], [17], [18], [20], [21], [28], [29], [31]], [-1.500000e+00, 1.500000e+00, -1.020000e+01, 1.130000e+01, 1.000000e+00, -1.000000e+00, 0x7FF0000001000000, 0xFFF0000001000000, 0x7FF0000000000000, 0xFFF0000000000000, -0.000000e+00, 0.000000e+00]> : tensor<32xf64>}> : () -> tensor<32xf64>
    %8 = "arith.constant"() <{value = sparse<[[0], [3], [5], [11], [13], [17], [18], [21], [31]], [-2147483648, -2147483647, -1000, -1, 0, 1, 1000, 2147483646, 2147483647]> : tensor<32xi32>}> : () -> tensor<32xi32>
    %9 = "sparse_tensor.convert"(%7) : (tensor<32xf64>) -> tensor<?xf64, #sparse>
    %10 = "sparse_tensor.convert"(%8) : (tensor<32xi32>) -> tensor<?xi32, #sparse>
    %11 = "func.call"(%9) <{callee = @sparse_absf}> : (tensor<?xf64, #sparse>) -> tensor<?xf64, #sparse>
    %12 = "func.call"(%10) <{callee = @sparse_absi}> : (tensor<?xi32, #sparse>) -> tensor<?xi32, #sparse>
    "sparse_tensor.print"(%11) : (tensor<?xf64, #sparse>) -> ()
    "sparse_tensor.print"(%12) : (tensor<?xi32, #sparse>) -> ()
    "bufferization.dealloc_tensor"(%9) : (tensor<?xf64, #sparse>) -> ()
    "bufferization.dealloc_tensor"(%10) : (tensor<?xi32, #sparse>) -> ()
    "bufferization.dealloc_tensor"(%11) : (tensor<?xf64, #sparse>) -> ()
    "bufferization.dealloc_tensor"(%12) : (tensor<?xi32, #sparse>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

