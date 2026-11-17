"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?xcomplex<f32>, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>>, tensor<?xcomplex<f32>, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>>) -> tensor<?xcomplex<f32>, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>>, sym_name = "cadd"}> ({
  ^bb0(%arg5: tensor<?xcomplex<f32>, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>> loc("<stdin>":5:8), %arg6: tensor<?xcomplex<f32>, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>> loc("<stdin>":5:48)):
    %11 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":6:11)
    %12 = "tensor.dim"(%arg5, %11) : (tensor<?xcomplex<f32>, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>>, index) -> index loc("<stdin>":7:11)
    %13 = "tensor.empty"(%12) : (index) -> tensor<?xcomplex<f32>, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>> loc("<stdin>":8:11)
    %14 = "linalg.generic"(%arg5, %arg6, %13) <{doc = "x(i) = a(i) OP b(i)", indexing_maps = [affine_map<(d0) -> (d0)>, affine_map<(d0) -> (d0)>, affine_map<(d0) -> (d0)>], iterator_types = [#linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg7: complex<f32> loc("<stdin>":10:10), %arg8: complex<f32> loc("<stdin>":10:31), %arg9: complex<f32> loc("<stdin>":10:52)):
      %15 = "complex.add"(%arg7, %arg8) <{fastmath = #arith.fastmath<none>}> : (complex<f32>, complex<f32>) -> complex<f32> loc("<stdin>":11:13)
      "linalg.yield"(%15) : (complex<f32>) -> () loc("<stdin>":12:7)
    }) : (tensor<?xcomplex<f32>, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>>, tensor<?xcomplex<f32>, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>>, tensor<?xcomplex<f32>, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>>) -> tensor<?xcomplex<f32>, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>> loc("<stdin>":9:11)
    "func.return"(%14) : (tensor<?xcomplex<f32>, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>>) -> () loc("<stdin>":14:5)
  }) : () -> () loc("<stdin>":4:3)
  "func.func"() <{function_type = (tensor<?xcomplex<f32>, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>>, tensor<?xcomplex<f32>, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>>) -> tensor<?xcomplex<f32>, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>>, sym_name = "cmul"}> ({
  ^bb0(%arg0: tensor<?xcomplex<f32>, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>> loc("<stdin>":17:8), %arg1: tensor<?xcomplex<f32>, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>> loc("<stdin>":17:48)):
    %6 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":18:10)
    %7 = "tensor.dim"(%arg0, %6) : (tensor<?xcomplex<f32>, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>>, index) -> index loc("<stdin>":19:10)
    %8 = "tensor.empty"(%7) : (index) -> tensor<?xcomplex<f32>, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>> loc("<stdin>":20:10)
    %9 = "linalg.generic"(%arg0, %arg1, %8) <{doc = "x(i) = a(i) OP b(i)", indexing_maps = [affine_map<(d0) -> (d0)>, affine_map<(d0) -> (d0)>, affine_map<(d0) -> (d0)>], iterator_types = [#linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg2: complex<f32> loc("<stdin>":22:10), %arg3: complex<f32> loc("<stdin>":22:31), %arg4: complex<f32> loc("<stdin>":22:52)):
      %10 = "complex.mul"(%arg2, %arg3) <{fastmath = #arith.fastmath<none>}> : (complex<f32>, complex<f32>) -> complex<f32> loc("<stdin>":23:13)
      "linalg.yield"(%10) : (complex<f32>) -> () loc("<stdin>":24:7)
    }) : (tensor<?xcomplex<f32>, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>>, tensor<?xcomplex<f32>, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>>, tensor<?xcomplex<f32>, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>>) -> tensor<?xcomplex<f32>, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>> loc("<stdin>":21:10)
    "func.return"(%9) : (tensor<?xcomplex<f32>, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>>) -> () loc("<stdin>":26:5)
  }) : () -> () loc("<stdin>":16:3)
  "func.func"() <{function_type = () -> (), sym_name = "main"}> ({
    %0 = "arith.constant"() <{value = sparse<[[0], [28], [31]], [(5.111300e+02,2.000000e+00), (3.000000e+00,4.000000e+00), (5.000000e+00,6.000000e+00)]> : tensor<32xcomplex<f32>>}> : () -> tensor<32xcomplex<f32>> loc("<stdin>":29:10)
    %1 = "arith.constant"() <{value = sparse<[[1], [28], [31]], [(1.000000e+00,0.000000e+00), (2.000000e+00,0.000000e+00), (3.000000e+00,0.000000e+00)]> : tensor<32xcomplex<f32>>}> : () -> tensor<32xcomplex<f32>> loc("<stdin>":30:10)
    %2 = "sparse_tensor.convert"(%0) : (tensor<32xcomplex<f32>>) -> tensor<?xcomplex<f32>, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>> loc("<stdin>":31:10)
    %3 = "sparse_tensor.convert"(%1) : (tensor<32xcomplex<f32>>) -> tensor<?xcomplex<f32>, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>> loc("<stdin>":32:10)
    %4 = "func.call"(%2, %3) <{callee = @cadd}> : (tensor<?xcomplex<f32>, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>>, tensor<?xcomplex<f32>, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>>) -> tensor<?xcomplex<f32>, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>> loc("<stdin>":33:10)
    %5 = "func.call"(%2, %3) <{callee = @cmul}> : (tensor<?xcomplex<f32>, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>>, tensor<?xcomplex<f32>, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>>) -> tensor<?xcomplex<f32>, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>> loc("<stdin>":34:10)
    "sparse_tensor.print"(%4) : (tensor<?xcomplex<f32>, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>>) -> () loc("<stdin>":35:5)
    "sparse_tensor.print"(%5) : (tensor<?xcomplex<f32>, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>>) -> () loc("<stdin>":36:5)
    "bufferization.dealloc_tensor"(%2) : (tensor<?xcomplex<f32>, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>>) -> () loc("<stdin>":37:5)
    "bufferization.dealloc_tensor"(%3) : (tensor<?xcomplex<f32>, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>>) -> () loc("<stdin>":38:5)
    "bufferization.dealloc_tensor"(%4) : (tensor<?xcomplex<f32>, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>>) -> () loc("<stdin>":39:5)
    "bufferization.dealloc_tensor"(%5) : (tensor<?xcomplex<f32>, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>>) -> () loc("<stdin>":40:5)
    "func.return"() : () -> () loc("<stdin>":41:5)
  }) : () -> () loc("<stdin>":28:3)
}) : () -> () loc("<stdin>":3:1)
