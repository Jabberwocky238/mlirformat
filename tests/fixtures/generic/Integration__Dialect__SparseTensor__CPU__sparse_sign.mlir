#map = affine_map<(d0) -> (d0)>
#sparse = #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?xf64, #sparse>) -> tensor<?xf64, #sparse>, sym_name = "sparse_sign"}> ({
  ^bb0(%arg0: tensor<?xf64, #sparse>):
    %9 = "arith.constant"() <{value = 0 : index}> : () -> index
    %10 = "tensor.dim"(%arg0, %9) : (tensor<?xf64, #sparse>, index) -> index
    %11 = "tensor.empty"(%10) : (index) -> tensor<?xf64, #sparse>
    %12 = "linalg.generic"(%arg0, %11) <{doc = "x(i) = OP a(i)", indexing_maps = [#map, #map], iterator_types = [#linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg1: f64, %arg2: f64):
      %13 = "sparse_tensor.unary"(%arg1) ({
      ^bb0(%arg3: f64):
        %14 = "arith.constant"() <{value = 0.000000e+00 : f64}> : () -> f64
        %15 = "arith.cmpf"(%arg3, %14) <{fastmath = #arith.fastmath<none>, predicate = 6 : i64}> : (f64, f64) -> i1
        %16 = "arith.uitofp"(%15) : (i1) -> f64
        %17 = "math.copysign"(%16, %arg3) <{fastmath = #arith.fastmath<none>}> : (f64, f64) -> f64
        %18 = "arith.cmpf"(%arg3, %arg3) <{fastmath = #arith.fastmath<none>, predicate = 14 : i64}> : (f64, f64) -> i1
        %19 = "arith.select"(%18, %arg3, %17) : (i1, f64, f64) -> f64
        "sparse_tensor.yield"(%19) : (f64) -> ()
      }, {
      }) : (f64) -> f64
      "linalg.yield"(%13) : (f64) -> ()
    }) : (tensor<?xf64, #sparse>, tensor<?xf64, #sparse>) -> tensor<?xf64, #sparse>
    "func.return"(%12) : (tensor<?xf64, #sparse>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "main"}> ({
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = 0.000000e+00 : f64}> : () -> f64
    %2 = "arith.constant"() <{value = 0x7FF0000001000000 : f64}> : () -> f64
    %3 = "arith.constant"() <{value = 0xFFF0000001000000 : f64}> : () -> f64
    %4 = "arith.constant"() <{value = 0x7FF0000000000000 : f64}> : () -> f64
    %5 = "arith.constant"() <{value = 0xFFF0000000000000 : f64}> : () -> f64
    %6 = "arith.constant"() <{value = sparse<[[0], [3], [5], [11], [13], [17], [18], [20], [21], [28], [29], [31]], [-1.500000e+00, 1.500000e+00, -1.020000e+01, 1.130000e+01, 1.000000e+00, -1.000000e+00, 0x7FF0000001000000, 0xFFF0000001000000, 0x7FF0000000000000, 0xFFF0000000000000, -0.000000e+00, 0.000000e+00]> : tensor<32xf64>}> : () -> tensor<32xf64>
    %7 = "sparse_tensor.convert"(%6) : (tensor<32xf64>) -> tensor<?xf64, #sparse>
    %8 = "func.call"(%7) <{callee = @sparse_sign}> : (tensor<?xf64, #sparse>) -> tensor<?xf64, #sparse>
    "sparse_tensor.print"(%8) : (tensor<?xf64, #sparse>) -> ()
    "bufferization.dealloc_tensor"(%7) : (tensor<?xf64, #sparse>) -> ()
    "bufferization.dealloc_tensor"(%8) : (tensor<?xf64, #sparse>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

