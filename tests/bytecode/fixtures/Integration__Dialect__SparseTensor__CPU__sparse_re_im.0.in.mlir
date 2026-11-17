"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?xcomplex<f32>, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>>) -> tensor<?xf32, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>>, sym_name = "cre"}> ({
  ^bb0(%arg3: tensor<?xcomplex<f32>, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>> loc("<stdin>":5:8)):
    %9 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":6:10)
    %10 = "tensor.dim"(%arg3, %9) : (tensor<?xcomplex<f32>, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>>, index) -> index loc("<stdin>":7:11)
    %11 = "tensor.empty"(%10) : (index) -> tensor<?xf32, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>> loc("<stdin>":8:11)
    %12 = "linalg.generic"(%arg3, %11) <{doc = "x(i) = OP a(i)", indexing_maps = [affine_map<(d0) -> (d0)>, affine_map<(d0) -> (d0)>], iterator_types = [#linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg4: complex<f32> loc("<stdin>":10:10), %arg5: f32 loc("<stdin>":10:31)):
      %13 = "complex.re"(%arg4) <{fastmath = #arith.fastmath<none>}> : (complex<f32>) -> f32 loc("<stdin>":11:13)
      "linalg.yield"(%13) : (f32) -> () loc("<stdin>":12:7)
    }) : (tensor<?xcomplex<f32>, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>>, tensor<?xf32, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>>) -> tensor<?xf32, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>> loc("<stdin>":9:11)
    "func.return"(%12) : (tensor<?xf32, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>>) -> () loc("<stdin>":14:5)
  }) : () -> () loc("<stdin>":4:3)
  "func.func"() <{function_type = (tensor<?xcomplex<f32>, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>>) -> tensor<?xf32, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>>, sym_name = "cim"}> ({
  ^bb0(%arg0: tensor<?xcomplex<f32>, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>> loc("<stdin>":17:8)):
    %4 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":18:10)
    %5 = "tensor.dim"(%arg0, %4) : (tensor<?xcomplex<f32>, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>>, index) -> index loc("<stdin>":19:10)
    %6 = "tensor.empty"(%5) : (index) -> tensor<?xf32, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>> loc("<stdin>":20:10)
    %7 = "linalg.generic"(%arg0, %6) <{doc = "x(i) = OP a(i)", indexing_maps = [affine_map<(d0) -> (d0)>, affine_map<(d0) -> (d0)>], iterator_types = [#linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg1: complex<f32> loc("<stdin>":22:10), %arg2: f32 loc("<stdin>":22:31)):
      %8 = "complex.im"(%arg1) <{fastmath = #arith.fastmath<none>}> : (complex<f32>) -> f32 loc("<stdin>":23:12)
      "linalg.yield"(%8) : (f32) -> () loc("<stdin>":24:7)
    }) : (tensor<?xcomplex<f32>, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>>, tensor<?xf32, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>>) -> tensor<?xf32, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>> loc("<stdin>":21:10)
    "func.return"(%7) : (tensor<?xf32, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>>) -> () loc("<stdin>":26:5)
  }) : () -> () loc("<stdin>":16:3)
  "func.func"() <{function_type = () -> (), sym_name = "main"}> ({
    %0 = "arith.constant"() <{value = sparse<[[0], [20], [31]], [(5.130000e+00,2.000000e+00), (3.000000e+00,4.000000e+00), (5.000000e+00,6.000000e+00)]> : tensor<32xcomplex<f32>>}> : () -> tensor<32xcomplex<f32>> loc("<stdin>":29:10)
    %1 = "sparse_tensor.convert"(%0) : (tensor<32xcomplex<f32>>) -> tensor<?xcomplex<f32>, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>> loc("<stdin>":30:10)
    %2 = "func.call"(%1) <{callee = @cre}> : (tensor<?xcomplex<f32>, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>>) -> tensor<?xf32, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>> loc("<stdin>":31:10)
    %3 = "func.call"(%1) <{callee = @cim}> : (tensor<?xcomplex<f32>, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>>) -> tensor<?xf32, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>> loc("<stdin>":32:10)
    "sparse_tensor.print"(%2) : (tensor<?xf32, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>>) -> () loc("<stdin>":33:5)
    "sparse_tensor.print"(%3) : (tensor<?xf32, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>>) -> () loc("<stdin>":34:5)
    "bufferization.dealloc_tensor"(%1) : (tensor<?xcomplex<f32>, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>>) -> () loc("<stdin>":35:5)
    "bufferization.dealloc_tensor"(%2) : (tensor<?xf32, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>>) -> () loc("<stdin>":36:5)
    "bufferization.dealloc_tensor"(%3) : (tensor<?xf32, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>>) -> () loc("<stdin>":37:5)
    "func.return"() : () -> () loc("<stdin>":38:5)
  }) : () -> () loc("<stdin>":28:3)
}) : () -> () loc("<stdin>":3:1)
