"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?xf64, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>>) -> tensor<?xf64, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>>, sym_name = "sparse_sign"}> ({
  ^bb0(%arg0: tensor<?xf64, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>> loc("<stdin>":5:8)):
    %9 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":6:10)
    %10 = "tensor.dim"(%arg0, %9) : (tensor<?xf64, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>>, index) -> index loc("<stdin>":7:11)
    %11 = "tensor.empty"(%10) : (index) -> tensor<?xf64, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>> loc("<stdin>":8:11)
    %12 = "linalg.generic"(%arg0, %11) <{doc = "x(i) = OP a(i)", indexing_maps = [affine_map<(d0) -> (d0)>, affine_map<(d0) -> (d0)>], iterator_types = [#linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg1: f64 loc("<stdin>":10:10), %arg2: f64 loc("<stdin>":10:22)):
      %13 = "sparse_tensor.unary"(%arg1) ({
      ^bb0(%arg3: f64 loc("<stdin>":12:12)):
        %14 = "arith.constant"() <{value = 0.000000e+00 : f64}> : () -> f64 loc("<stdin>":13:15)
        %15 = "arith.cmpf"(%arg3, %14) <{fastmath = #arith.fastmath<none>, predicate = 6 : i64}> : (f64, f64) -> i1 loc("<stdin>":14:15)
        %16 = "arith.uitofp"(%15) : (i1) -> f64 loc("<stdin>":15:15)
        %17 = "math.copysign"(%16, %arg3) <{fastmath = #arith.fastmath<none>}> : (f64, f64) -> f64 loc("<stdin>":16:15)
        %18 = "arith.cmpf"(%arg3, %arg3) <{fastmath = #arith.fastmath<none>, predicate = 14 : i64}> : (f64, f64) -> i1 loc("<stdin>":17:15)
        %19 = "arith.select"(%18, %arg3, %17) : (i1, f64, f64) -> f64 loc("<stdin>":18:15)
        "sparse_tensor.yield"(%19) : (f64) -> () loc("<stdin>":19:9)
      }, {
      }) : (f64) -> f64 loc("<stdin>":11:13)
      "linalg.yield"(%13) : (f64) -> () loc("<stdin>":22:7)
    }) : (tensor<?xf64, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>>, tensor<?xf64, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>>) -> tensor<?xf64, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>> loc("<stdin>":9:11)
    "func.return"(%12) : (tensor<?xf64, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>>) -> () loc("<stdin>":24:5)
  }) : () -> () loc("<stdin>":4:3)
  "func.func"() <{function_type = () -> (), sym_name = "main"}> ({
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":27:10)
    %1 = "arith.constant"() <{value = 0.000000e+00 : f64}> : () -> f64 loc("<stdin>":28:10)
    %2 = "arith.constant"() <{value = 0x7FF0000001000000 : f64}> : () -> f64 loc("<stdin>":29:10)
    %3 = "arith.constant"() <{value = 0xFFF0000001000000 : f64}> : () -> f64 loc("<stdin>":30:10)
    %4 = "arith.constant"() <{value = 0x7FF0000000000000 : f64}> : () -> f64 loc("<stdin>":31:10)
    %5 = "arith.constant"() <{value = 0xFFF0000000000000 : f64}> : () -> f64 loc("<stdin>":32:10)
    %6 = "arith.constant"() <{value = sparse<[[0], [3], [5], [11], [13], [17], [18], [20], [21], [28], [29], [31]], [-1.500000e+00, 1.500000e+00, -1.020000e+01, 1.130000e+01, 1.000000e+00, -1.000000e+00, 0x7FF0000001000000, 0xFFF0000001000000, 0x7FF0000000000000, 0xFFF0000000000000, -0.000000e+00, 0.000000e+00]> : tensor<32xf64>}> : () -> tensor<32xf64> loc("<stdin>":33:10)
    %7 = "sparse_tensor.convert"(%6) : (tensor<32xf64>) -> tensor<?xf64, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>> loc("<stdin>":34:10)
    %8 = "func.call"(%7) <{callee = @sparse_sign}> : (tensor<?xf64, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>>) -> tensor<?xf64, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>> loc("<stdin>":35:10)
    "sparse_tensor.print"(%8) : (tensor<?xf64, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>>) -> () loc("<stdin>":36:5)
    "bufferization.dealloc_tensor"(%7) : (tensor<?xf64, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>>) -> () loc("<stdin>":37:5)
    "bufferization.dealloc_tensor"(%8) : (tensor<?xf64, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>>) -> () loc("<stdin>":38:5)
    "func.return"() : () -> () loc("<stdin>":39:5)
  }) : () -> () loc("<stdin>":26:3)
}) : () -> () loc("<stdin>":3:1)
